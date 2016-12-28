#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles      # dotfiles directory
olddir=~/dotfiles_old   # old dotfiles backup directory
files="bashrc vimrc dircolors"    # list of files/folders to symlink in homedir
customdirs="bash.d vim fonts" #list of custom olders with additional files

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to .$file in home directory."
    ln -s $dir/$file ~/.$file
done
# move any existing customfolders in homedir to dotfiles_old directory, then create symlinks 
for customdir  in $customdirs; do
    echo "Moving any existing custom folders from ~ to $olddir"
    mv ~/.$customdir ~/dotfiles_old/ 
    echo "Creating symlink to .$dir in home directory."
    ln -s $dir/$customdir ~/.$customdir
done

#update font cache
fc-cache -f -v

