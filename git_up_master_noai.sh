git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
<<<<<<< HEAD
#git add -A && aicommits  || echo '---------------------------empty'
git add -A && git commit -am "up"  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
git push origin dev -u --progress 'origin' || echo ''
echo "-------- END PUSH[$(pwd)] ----------";
git checkout master --
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
#git merge dev 
=======
git add -A && git commit -am "up"  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
echo "-------- END PUSH[$(pwd)] ----------";
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
git checkout master --
>>>>>>> master
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout master --
git pull origin master --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
echo "-------- END PULL[$(pwd)] ----------";
<<<<<<< HEAD
=======

>>>>>>> master
