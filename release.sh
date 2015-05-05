#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    cat <<EOF
Use: $0 <VERSION>"
- VERSION    version to release (0.1.6 for example)

To install the token, execute the install-marmalade-token.sh.
EOF
    exit 1;
fi
VERSION=$1

WDIR=$(dirname $0)

# launched from the current dev branch

git fetch -p --all

git checkout master

git merge upstream/master

git tag $VERSION

git push upstream --tag

make package

./upload-to-marmalade.sh $VERSION
