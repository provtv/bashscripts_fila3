git submodule foreach $( readlink -f -- "$0";)
git checkout --orphan newBranch
git add --renormalize -A
git add -A  # Add all files and commit them
git commit -am "first"
git branch -D master  # Deletes the master branch
git branch -m master  # Rename the current branch to master
git gc --aggressive --prune=all     # remove the old files
<<<<<<< HEAD
git push -uf origin master  # Force push master branch to github
=======
git push -u origin master  # Force push master branch to github
git pull origin master
>>>>>>> dev
git gc --aggressive --prune=all     # remove the old files