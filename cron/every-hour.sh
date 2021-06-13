#!/bin/bash

# rsync -avz --exclude='.DS_Store' --filter="dir-merge,- .gitignore" ~/Projects/* ~/Dropbox/.Projects



# New backup? (unison option?)
# rsync -avz --delete --exclude='.DS_Store' --exclude='.git/' --exclude='node_modules/' --exclude='silverstripe-cache/' --filter="dir-merge,- .gitignore" ~/Projects/* ~/Dropbox/.Projects