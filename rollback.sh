#!/bin/bash

#====================
# rollback.sh
# - for rsyncing FROM $HOME/backup-config TO $HOME
#=====================

# ==========
# 0. Excluding files
# ==========
if ! type rsync > /dev/null; then
    echo "rsync not found! terminating..."
fi

EXCLUDE=('.git' 'img' 'rollback.sh' 'update.sh' 'install.sh' 'README.md')

# ===========
# 1. confirmation prompt
# ==========
EVERYTHING=false
read -p "rollback Everything? [y/n] " -n 1 -r
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
            read -p "# rollback $FILE [y/n]" -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then rsync -aR $FILE .; fi
        else
            echo \# rollback $FILE
            rsync -aR $FILE .
        fi
    fi
done
echo ========================================
echo Finished rollback
echo ========================================
