echo "N: $1"
for(( i=1; i<=$1; i++ ))
do
<<<<<<< HEAD
#git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
git add -A && aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
done 
=======
#git add -A && git commit -am "rebase $i" && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
git add -A && aicommits && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
done 
>>>>>>> 176336a24e1a8742876789b7719df64eb92bf7dd
