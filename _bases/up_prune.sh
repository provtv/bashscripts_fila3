folders=($(ls -d base_*/ | shuf))
for d in "${folders[@]}"; do
 cd $d
 echo "-------------------------------------------------------------------"
 echo "------------------------- $d --------------------------------------"
 echo "-------------------------------------------------------------------"
 sed -i -e 's/\r$//' ./bashscripts/git_prune.sh
 ./bashscripts/git_prune.sh
 echo "---------------------------------------------------------------------------------------------"
 cd ..
done