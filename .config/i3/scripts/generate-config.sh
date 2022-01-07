#!/bin/bash

## 0. config files
if [[ -z ${I3_HOME} ]]; then I3_HOME=~/.config/i3; fi
if [ ! -d $I3_HOME ]; then notify-send "i3 error | $I3_HOME not found"; fi

target=$I3_HOME/config
configs_path=$I3_HOME/modules
if [ ! -d $configs_path ]; then notify-send "i3 error | target configs path not found"; fi

runscript=$I3_HOME/scripts/patch-config.sh

## 1. Fetch config list
configs=$(ls -p $configs_path | grep -v /)

## 2. Generate config files
$runscript

## 3. empty the target file
touch $target
echo '## Generated file' > $target

## 4. Fill in config file
for n in $configs; do
    cat $configs_path/$n >> $target
done;

