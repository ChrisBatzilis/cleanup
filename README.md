# Cleanup

Tool for keeping the local git repository workspace clean of dead branches

# Usage 
cleanup [options]

| Option | Description | Default |
| ------ | ------ | ----- |
| `p`  | The path to be used as workspace. Look for git repositories in all contained folders with depth 1| current path |
| `b`  | The branch to be used as base for the cleanup | master |
| `c`	 | Checkout the the base branch and pull before attempting the clean up | false |
