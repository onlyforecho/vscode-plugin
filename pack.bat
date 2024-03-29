echo "STEP 1: BUILD COMMUNITY"
call git checkout master
call node packing/puttimestamp.js
call vsce package -o community.vsix

echo "STEP 2: BUILD ENTERPRISE"
call git stash
call git checkout enterprise
call git merge master
call git stash pop
call vsce package -o enterprise.vsix

echo "STEP 3: BACK TO MASTER BRANCH"
call git checkout master

echo "STEP 4: ADD BRAND AND VERSION"
call node packing/changename.js