alias ping='ping -c 4'
alias bc='bc -ql'
alias tmux='tmux -2'
alias we='ansiweather'
alias go='gnome-open'
alias cal3='cal -A2'
alias ls='ls -A --color'
alias lg='ls -Alh | grep'
alias ll='ls -Alh'
alias less='less -r'
alias xclip='xclip -selection c'
alias xm='xmodmap ~/.Xmodmap'
alias nm='sudo killall NetworkManager'
alias atom='atom --disable-gpu-compositing'
alias hsource='/usr/bin/highlight'

#quick find
alias h="history|grep"
alias f="find .|grep"
alias p="ps aux | grep"
alias o="gnome-open"

alias _ps='ps -e --sort=-rss | head -n 15'

#Change command prompt
PS1="\[\e[1;32m\]\u@\h:\w\[\e[m\]\n\[\e[1;34m\]\A \$>\[\e[0m\] "

###########################
# Custom Functions
###########################
qc () { echo $1 | bc; }
# npm exec function
npmx () { $(npm bin)/$@; }
# cd up by n
# From: http://superuser.com/questions/449687/using-cd-to-go-up-multiple-directory-levels/449705#449705
cd_up() { cd $(printf "%0.s../" $(seq 1 $1 )); }
alias 'cd..'='cd_up'

# Add ** globstar
shopt -s globstar
shopt -s dotglob

# Verifiy History
shopt -s histverify

#auto-chooses the first completion an cycles through them w/ tab
bind '"\t":menu-complete'

#exports
export EDITOR=vim
export PYTHONSTARTUP=~/.pystartup
export CDPATH=.:~/Documents/Code:~

#viteralenv wrapper
export WORKON_HOME=$HOME/Documents/Code/Python/.venv
export PROJECT_HOME=$HOME/Documents/Code/Python
#source /usr/local/bin/virtualenvwrapper.sh
source $(pew shell_config)

#custom commands
alias ck='~/.packages/source/Checkvist/inbox.py'

#bash_colors contains long string to formate ls output colors
if [ -f "$HOME/.ls_colors" ]; then
    . "$HOME/.ls_colors"
fi

# cd history stack
if [ -f "$HOME/.packages/bin/acd_func.sh" ]; then
    source "$HOME/.packages/bin/acd_func.sh"
fi
