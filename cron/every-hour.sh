#!/bin/bash

rsync -avz --exclude='.DS_Store' --filter="dir-merge,- .gitignore" ~/Work/* ~/Dropbox/Work
# unison -auto -batch -ignore='.DS_Store' --filter="dir-merge,- .gitignore" ~/Work/* ~/Dropbox/Work