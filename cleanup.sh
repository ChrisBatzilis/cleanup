#!/bin/bash
function isGitRepository(){
  if [ -d .git ]
  then
   return 0
  else
   return 1
  fi
}

function deleteLocalMergedBranches() {
cd $1 &> /dev/null
if isGitRepository
 then 
	 if $3; then
	     git checkout $2
	     git pull
	 fi
	 echo "Looking for merged branches in $1"
	 git branch --merged $2 | egrep -v "(^\*|$2)" | xargs -r git branch -d
         printf "done\n\n"
fi
}

while getopts p:b:c: option
do
    case "${option}"
    in
    p) path=${OPTARG};;
    b) branch=${OPTARG};;
    c) checkout=${OPTARG};;
    esac
done


if [ -z "$path" ]
then
path=`pwd`
else
path=`readlink -f $path`
fi

if [ -z "$branch" ]
then
branch='master'
fi

if ! [ -z "$checkout" ]
then
  if ! $checkout; then
    checkout=false
  else
    checkout=true
  fi    
else
  checkout=false
fi

paths=`find $path -maxdepth 1 -mindepth 1 -type d` 


for p in $paths ;
do 
	deleteLocalMergedBranches $p $branch $checkout
done

