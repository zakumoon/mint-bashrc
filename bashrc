# Colors ----------------------------------------------------------
export TERM=xterm-color

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

export CLICOLOR=1 

alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
#alias ls='ls --color=auto' # For linux, etc

# ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
#export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'  #LS_COLORS is not supported by the default ls command in OS-X

# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[1;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # Lists all the colors, uses vars in .bashrc_non-interactive



# Misc -------------------------------------------------------------
export HISTCONTROL=ignoredups
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous On" # show list automatically, without double tab

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi



# Prompts ----------------------------------------------------------
export PS1="\[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with only a path
# export PS1="\[${COLOR_GRAY}\]\u@\h \[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with user, host, and path 

# This runs before the prompt and sets the title of the xterm* window.  If you set the title in the prompt
# weird wrapping errors occur on some systems, so this method is superior
#export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\007"'  # user@host path

export PS2='> '    # Secondary prompt
export PS3='#? '   # Prompt 3
export PS4='+'     # Prompt 4

# function xtitle {  # change the title of your xterm* window
#   unset PROMPT_COMMAND
#   echo -ne "\033]0;$1\007" 
# }

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# I got the following from, and mod'd it: http://www.macosxhints.com/article.php?story=20020716005123797
#    The following aliases (save & show) are for saving frequently used directories
#    You can save a directory using an abbreviation of your choosing. Eg. save ms
#    You can subsequently move to one of the saved directories by using cd with
#    the abbreviation you chose. Eg. cd ms  (Note that no '$' is necessary.)
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
	touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
	command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

# Open web browser  ie wb   or   wb index.html
function wb() {
    if [ -z '$1' ]
    then
        open /Applications/Google\ Chrome.app/
    else
        open -a /Applications/Google\ Chrome.app/ $1
    fi
}

#copy template to new project  newtemplate ~/dev/newtemp
function newtemplate() {
    cp -R ~/dev/sinatra/karmacloud-mvp `pwd`;
    mv Template $1;
}


# Editors ----------------------------------------------------------
export EDITOR='mate -w'  # OS-X SPECIFIC - TextMate, w is to wait for TextMate window to close
alias mate='open -a TextMate.app'
#export EDITOR='gedit'  #Linux/gnome
#export EDITOR='vim'  #Command line

# Misc
alias     g='grep -i'  # Case insensitive grep
alias     f='find . -iname'
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias top='top -o cpu'
alias   m='more'
alias  df='df -h'

#commands
#  zip filename.zip file.txt       #zips file
#  zip -r filename.zip directory   #zips entire directory

# List 
alias ll='ls -lah'
alias lsd='ls -l | grep "^d"'
# history
# clear
# mkdir          # make directory
# touch
# echo   show message on screen
# la
# chmod 0775 .gitconfig

# -rw-r--r--@   1 g     staff    270 Jan 11 18:39 .gitconfig
# -rw-r--r--@   1 g     staff    197 Nov 25 23:04 .gitignore

# Navigation
alias  ..='cd ..'
alias ...='cd ../..'
alias   ~='cd ~'     # user directory
alias   q='exit'    # quit terminal window

# Apt
alias acs='apt-cache search'
alias agup='apt-get upgrade'
alias agud='apt-get update'

# Git
alias  gs="git status"
alias  gd="git diff | mate"
alias  gl="git pull"
alias  gp="git push"
alias  gb="git branch"
alias gba="git branch -a "
alias gcb="git checkout -b "
alias  gc="git commit -m "
alias gco="git checkout"
alias undopush="git push -f origin HEAD^:master"

# IP Addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip='ipconfig getifaddr en1'
