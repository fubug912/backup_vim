#!/bin/bash
#Filename: backup.sh

cp ~/.vimrc ./vimrc
cp ~/.vimrc.bundles ./vimrc.bundles
echo "备份完成,请用git add 添加vimrc,vimrc.bundles这两个文件."
