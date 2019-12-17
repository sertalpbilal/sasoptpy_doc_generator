#!/bin/bash
set -e

cd package/doc
echo "*** Generating docs @ develop ***"
. makedocs.sh

cd ..
cd ..
echo "*** Copying latest version ***"
git -C gh-pages/sasoptpy rm -rf .
git -C gh-pages/sasoptpy clean -dfx
rsync -vazC package/doc/_build/html/ gh-pages/sasoptpy/

echo "*** Adding old versions ***"
. doc_generator.sh

