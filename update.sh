#!/bin/bash

#====================
# update.sh
# - for copying FROM home TO current dir
# - and then push to git
#=====================

# ==========
# 0. Excluding files
# ==========
EXCLUDE=('.git' 'rollback.sh' 'update.sh' 'install.sh' 'README.md')

# ===========
# 1. confirmation prompt
# ==========
EVERYTHING=false
read -p "Update Everything? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then EVERYTHING=true; fi
echo ========================================

# ===========
# 2. update file
# ==========
FOUND=false

for FILE in $(find . -type f); do
    FOUND=false
    for EXC in ${EXCLUDE[@]}; do
        if [[ $FILE == *$EXC* ]]; then FOUND=true; break; fi
    done
    if [ "$FOUND" != true ]; then
        FILE=$(echo $FILE | sed 's@^@'"$HOME"'/@g')
        if [ "$EVERYTHING" != true ]; then 
            read -p "# copying $FILE to This directory [y/n]" -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then rsync -aR $FILE .; fi
        else
            echo \# copying $FILE to This directory
            rsync -aR $FILE .
        fi
    fi
done
echo ========================================
echo Finished updating
echo ========================================
