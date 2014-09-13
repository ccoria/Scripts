function sl {
    source='_'$1
    origin=$HOME'/.'$1
    
    cp -f $source $origin;
}

sl vimrc
sl gitconfig
sl profile
