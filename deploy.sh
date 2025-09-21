#!/bin/sh

link() {
  ln -sfv "$PWD/$1" "$2"
}

# Link home
files=$(ls -A1 | grep -Ev 'README.rst|deploy.sh|\.gitignore|\.git$|\.config|Makefile|archpkgs.txt')
target=~
for f in $files; do
  unlink $target/$f 2>/dev/null || true
  link $f $target
done
