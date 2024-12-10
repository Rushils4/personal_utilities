#/bin/bash

echo
echo This will clone the entirety of the repository, including branches and the full commit history.
echo

git fetch --all

for branch in $(git branch -r | grep -v '\->'); do
	git checkout --track ${branch#origin/}
done
