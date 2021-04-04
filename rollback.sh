#!/bin/bash

#====================
# rollback.sh
# - cp FROM current dir TO $HOME
# - using "cp --parents" only available in GNU cp (not in OS X)
#=====================

# ==========
# 0. precheck & Excluding files
# ==========

scriptpath=$(dirname $0)
excludes=('.git' 'dotfiles_img.png' 'rollback.sh' 'update-dotfiles.sh' 'rollback.sh' 'README.md')

# ===========
# 1. confirmation prompt
# ==========
rollback_everything=false
read -p "Rollback Everything? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then rollback_everything=true; fi
echo ====================

# ===========
# 2. backup folder
# ==========
echo Searching backup folder in $HOME ..
backup_folder=backup_config
backup_folder_tmp=backup_config_temp

backup_dir=$HOME/$backup_folder
if [ ! -d "$backup_dir"]; then echo "Backup folder not found! exit!"; exit 1; fi

mkdir -p $HOME/$backup_folder_tmp
echo ====================

# ===========
# 3. Rollback file
# ==========
found=false

for file in $(find $scriptpath/ -type f); do
    found=false
    for exclude in ${excludes[@]}; do
        if [[ $file == *$exclude* ]]; then found=true; break; fi
    done
    if [ "$found" != true ]; then
        if [ "$rollback_everything" != true ]; then 
            read -p "- copy from $file to $HOME [y/n]" -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then echo "skipping..."; continue; fi
        else
            echo "- copy from $file to $HOME"
        fi
        # $HOME to backup_folder_tmp
        homefile=/$(echo $file | sed 's@^'"$scriptpath"'/@@g')
        cp --parents $homefile $HOME/$backup_folder_tmp/

        # backup_folder to $HOME
        cp $file $homefile

    fi
done

#SWAP
cp $0 $HOME/$backup_folder_tmp
rm -r $backup_dir
mv $HOME/$backup_folder_tmp $HOME/$backup_folder

echo ====================
echo Finished rollbacking
echo ====================

echo "- RESULT -"
echo "$HOME <- swap -> $HOME/$backup_folder"
echo "----------"
