function sl {
    source='_'$1
    origin=$HOME'/.'$1
    
    cp -f $source $origin;
}

# creating the symlinks
sl vimrc
sl gitconfig
sl profile

# creating the bashrc for the linux installation (newssh)
cp -f '_profile' $HOME'/.bashrc'

echo "installation successful! Run update-source (or \$source ~/.bashrc) to test"
