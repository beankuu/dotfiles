#!/bin/bash

#====================
# install.sh
# - cp FROM current dir TO $HOME
# - using "cp --parents" only available in GNU cp (not in OS X)
#=====================

# ==========
# 0. precheck & Excluding files
# ==========

scriptpath=$(dirname $0)
excludes=('.git' 'dotfiles_img.png' 'rollback.sh' 'update-dotfiles.sh' 'install.sh' 'README.md')

# ===========
# 1. confirmation prompt
# ==========
install_everything=false
read -p "Install Everything? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then install_everything=true; fi
echo ====================

# ===========
# 2. backup folder
# ==========
echo Creating backup folder in $HOME ..
backup_folder=backup_config
mkdir -p $HOME/$backup_folder
cp $scriptpath/'rollback.sh'  $HOME/$backup_folder/
echo Backup @ $HOME/backup-config
echo ====================

# ===========
# 3. Install file
# ==========
found=false

for file in $(find $scriptpath/ -type f); do
    found=false
    for exclude in ${excludes[@]}; do
        if [[ $file == *$exclude* ]]; then found=true; break; fi
    done
    if [ "$found" != true ]; then
        if [ "$install_everything" != true ]; then 
            read -p "- copy from $file to $HOME [y/n]" -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then echo "skipping..."; continue; fi
        else
            echo "- copy from $file to $HOME"
        fi
        # dotfiles to backup_folder
        #cp --parents $file $backup_folder/

        # $HOME to backup_folder
        homefile=$HOME/$(echo $file | sed 's@^'"$scriptpath"'/@@g')
        cp --parents $homefile $HOME/$backup_folder/

        # dotfiles to $HOME
        cp $file $homefile

    fi
done
echo ====================
echo Finished installing
echo ====================

echo "- RESULT -"
echo "$HOME -> $HOME/$backup_folder"
echo "$(dirname $(readlink -f $0)) -> $HOME"
echo 
echo "* backuped files are at $HOME/$backup_folder"
echo "----------"
