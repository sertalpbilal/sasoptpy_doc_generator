# sasoptpy doc generator

This repository contains scripts to generate a
multi-version doc for sasoptpy.

It traverses all commits in gh-pages branch
and append new directories for missing versions.
Then, it appends a dropdown menu. A JS file named
`version.js` is required to enable page switches.

## Usage

Generate latest version of documents in a separate
`sasoptpy` clone, under `doc/` folder using sphinx.

You need to run

``` shell
./makedocs.sh
```
to generate all HTML and PDF files. Copy these files
under `/gh-pages/sasoptpy` in this repository.

Then use

``` shell
./doc_generator.sh
```
script in this repository.

Finally, commit all changes under `/gh-pages/sasoptpy`
and push everything to `gh-pages` branch. This will
send all static pages to github.io documentation pages,
including all old versions, and a dropdown menu!

## Alternatives

Sphinx has a cool versioning tool, called *sphinxcontrib-versioning* here:

https://github.com/sphinx-contrib/sphinxcontrib-versioning

We generated these scripts here, because it requires more of an
effort to make sphinxcontrib-versioning work with new versions of Sphinx.
