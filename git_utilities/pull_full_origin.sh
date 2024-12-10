#/bin/bash

echo 
echo This will pull the remote origin to local. This is not a merge or a rebase.
echo

if [ $# != 1 ]; then
	echo Incorrect number of arguments passed. Usage: ./pull_dev_to_branches.sh '<password>'
	exit -1
fi

if [ $1 != 'admin' ]; then
	echo You do not have permission to run this file. You are not an administrator.
	exit -1
fi

git fetch --all

for branch in $(git branch -r | grep -v '\->'); do
	git checkout ${branch##origin/}
	git pull origin ${branch##origin/}
done
