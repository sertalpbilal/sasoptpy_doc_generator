#!/bin/bash
set -e

(
    cd package/doc
    echo "*** Generating docs @ develop ***"
    #. makedocs.sh
)

(
    echo "*** Cleaning repository ***"
    cd gh-pages/sasoptpy
    git reset --hard
    git checkout gh-pages
    git clean -dfx
    git rm -rf .
)

rsync -vazC package/doc/_build/html/ gh-pages/sasoptpy/

echo "*** Adding old versions ***"
bash doc_generator.sh > doc_gen.log

