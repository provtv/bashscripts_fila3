git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
<<<<<<< HEAD
<<<<<<< HEAD
#git add -A && aicommits  || echo '---------------------------empty'
git add -A && oco  || echo '---------------------------empty'
=======
git add -A && aicommits  || echo '---------------------------empty'
>>>>>>> 1283aaa (first)
=======
git add -A && aicommits  || echo '---------------------------empty'
>>>>>>> dd31420 (first)
git push origin dev -u --progress 'origin' || git push --set-upstream origin dev
echo "-------- END PUSH[$(pwd)] ----------";
git checkout dev --
git branch --set-upstream-to=origin/dev dev
git branch -u origin/dev
git merge dev
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
#git merge master 
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
#git merge master 
=======
git merge master 
>>>>>>> cbb3d89d (Add and update git code for dev branch)
=======
>>>>>>> d05b8561 (Add git_up_dev.sh script for handling dev branch)
=======
#git merge master 
>>>>>>> decf36077db1822c8ffc41d15fd34ecfcdb048d3
>>>>>>> 1283aaa (first)
=======
#git merge master 
>>>>>>> fcc9fa2 (rebase 1/2)
=======
=======
>>>>>>> 632fcf11 (Add git_up_dev.sh script for handling dev branch)
<<<<<<< HEAD
git merge master 
=======
>>>>>>> d05b8561 (Add git_up_dev.sh script for handling dev branch)
<<<<<<< HEAD
>>>>>>> a93b63c7 (Add git_up_dev.sh script for handling dev branch)
=======
=======
>>>>>>> d05b8561 (Add git_up_dev.sh script for handling dev branch)
>>>>>>> 632fcf11 (Add git_up_dev.sh script for handling dev branch)
>>>>>>> dd31420 (first)
=======
>>>>>>> 176336a24e1a8742876789b7719df64eb92bf7dd
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout dev --
git pull origin dev --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
echo "-------- END PULL[$(pwd)] ----------";
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
echo "-------- END PULL[$(pwd)] ----------";
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> cbb3d89d (Add and update git code for dev branch)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> d05b8561 (Add git_up_dev.sh script for handling dev branch)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> decf36077db1822c8ffc41d15fd34ecfcdb048d3
>>>>>>> 1283aaa (first)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> fcc9fa2 (rebase 1/2)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> dd31420 (first)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> master
