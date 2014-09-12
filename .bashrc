# The color designators: 
# 
# a black 
# b red 
# c green 
# d brown 
# e blue 
# f magenta 
# g cyan 
# h light grey 
# A bold black, usually shows up as dark grey 
# B bold red 
# C bold green 
# D bold brown, usually shows up as yellow 
# E bold blue 
# F bold magenta 
# G bold cyan 
# H bold light grey; looks like bright white 
# x default foreground or background 
# 
# The order of the attributes are as follows: 
# 
# 1. directory 
# 2. symbolic link 
# 3. socket 
# 4. pipe 
# 5. executable 
# 6. block special 
# 7. character special 
# 8. executable with setuid bit set 
# 9. executable with setgid bit set 
# 10. directory writable to others, with sticky bit 
# 11. directory writable to others, without sticky bit 

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\[\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

_username_='\u@'
_hostname_='\h'
_path_='\w '

PS1=$Color_Off$_username_$BGreen$_hostname_$Blue$_path_$Color_Off'$ '

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias l='ls -lh'
alias up='cd ..'

#from http://thelucid.com/2013/01/21/quickly-pushing-your-public-ssh-key-to-a-server/
function pushkey {
    ssh $1 "echo '`cat ~/.ssh/id_rsa.pub`' >> ~/.ssh/authorized_keys"
}

# 1 - hostname
# 2 - username
function newssh {
    pushkey $1;
    scp ~/.vimrc ~/.bashrc $2'@'$1':/home/'$2'/'; 
    ssh $1;
}
