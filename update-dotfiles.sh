#!/bin/bash

#====================
# update.sh
# - rsyncing FROM $HOME TO current dir
#=====================

# ==========
# 0. precheck & Excluding files
# ==========
if ! type rsync > /dev/null; then
    echo "rsync not found! terminating..."
fi

EXCLUDE=('.git' 'dotfiles_img.png' 'rollback.sh' 'update-dotfiles.sh' 'install.sh' 'README.md')

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
            echo \> copying $FILE to This directory
            rsync -aR $FILE .
        fi
    fi
done
echo ========================================
echo Finished updating
echo ========================================
