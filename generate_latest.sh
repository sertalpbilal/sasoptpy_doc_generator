#!/bin/bash
set -e

(
    cd package/doc
    echo "*** Generating docs @ develop ***"
    dos2unix makedocs.sh
    . makedocs.sh
)

(
    echo "*** Cleaning repository ***"
    cd gh-pages/sasoptpy
    rm -rf version/
    git reset --hard
    git checkout gh-pages
    git clean -dfx
    git rm -rf .
)

rsync -vazC package/doc/_build/html/ gh-pages/sasoptpy/

echo "*** Adding old versions ***"
dos2unix doc_generator.sh
bash doc_generator.sh | tee doc_gen.log

