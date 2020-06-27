#!/bin/bash

#====================
# install.sh
# - rsyncing FROM current dir TO $HOME
#=====================

# ==========
# 0. precheck & Excluding files
# ==========
if ! type rsync > /dev/null; then
    echo "rsync not found! terminating..."
fi

EXCLUDE=('.git' 'img' 'rollback.sh' 'update.sh' 'install.sh' 'README.md')

# ===========
# 1. confirmation prompt
# ==========
EVERYTHING=false
read -p "Install Everything? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then EVERYTHING=true; fi
echo ========================================
# ===========
# 2. backup folder
# ==========
echo Creating backup folder in $HOME ..
BACKUP=$HOME/backup-config
mkdir -p $BACKUP
rsync -a 'rollback.sh'  $BACKUP/
echo Backup @ $HOME/backup-config
echo ========================================

# ===========
# 3. Install file
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
            read -p "# copying $FILE from This directory to $HOME [y/n]" -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                rsync -aR $FILE $BACKUP; 
                #rsync -aR $FILE $HOME; 
            fi
        else
            echo \# copying $FILE from This directory to $HOME
            rsync -aR $FILE $BACKUP
            #rsync -aR $FILE $HOME
        fi
    fi
done
echo ========================================
echo Finished installing
echo ========================================
