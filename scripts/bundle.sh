#!/usr/bin/env bash
set -euxo pipefail

rm -rf bundled
mkdir -p bundled/lib

# Don't use Jekyll to build the github pages
touch bundled/.nojekyll


# Bundle @shower/core
rsync -a node_modules/@shower/core/dist/ bundled/lib/shower
rsync -a node_modules/@shower/core/{LICENSE.md,README.md} bundled/lib/shower


# Bundle highlight.js
rsync -a node_modules/@highlightjs/cdn-assets/ bundled/lib/highlightjs
# remove unneccessary files
rm -rf bundled/lib/highlightjs/{es/,highlight.js,package.json}
# keep only one style
rm -rf bundled/lib/highlightjs/styles/base16
find bundled/lib/highlightjs/styles \
    -type f \
    ! -name 'github.min.css' \
    -exec rm -- {} +


# Bundle KaTeX
rsync -a node_modules/katex/dist/ bundled/lib/katex
# remove unneccessary files
rm -rf \
    bundled/lib/katex/fonts/*.ttf \
    bundled/lib/katex/katex.{mjs,js,css} \
# keep only minimized js and CSS files
find bundled/lib/katex/contrib \
    -type f \
    ! -name '*.min.js' ! -name '*.min.css' \
    -exec rm -- {} +


# Copy theme related files
rsync -a \
    styles fonts fonts pictures \
    .gitattributes .gitignore \
    .editorconfig .stylelintrc \
    LICENSE.md LICENSE.shower_material.md README.md \
    bundled/
# fix the library file paths in the bundle
sed -f scripts/fix_npm_pkg_paths.sed index.html > bundled/index.html
