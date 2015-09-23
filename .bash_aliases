alias ping='ping -c 4'
alias bc='bc -ql'
alias tmux='tmux -2'
alias we='ansiweather'
alias go='gnome-open'
alias cal3='cal -A2'
alias ls='ls -a --color'
alias lg='ls -lh | grep'
alias ll='ls -lh'
alias wgetFF='wget --referer="http://www.google.com" --user-agent="Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/3.6.3.0" --header="Accept:text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5" --header="Accept-Language: en-us,en;q=0.5" --header="Accept-Encoding: gzip,deflate" --header="Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7" --header="Keep-Alive: 300"'

#quick find
alias h="history|grep"
alias f="find .|grep"
alias p="ps aux | grep"
alias o="gnome-open"

alias _ps='ps -e --sort=-rss | head -n 15'

#Change command prompt
PS1="\[\e[1;32m\]\u@\h:\w\[\e[m\]\n\[\e[1;34m\]\A \$>\[\e[0m\] "

qc () { echo $1 | bc; }
# npm exec function
npmx () { $(npm bin)/$@; }

# Add ** globstar
shopt -s globstar
shopt -s dotglob

#auto-chooses the first completion an cycles through them w/ tab
bind '"\t":menu-complete'

#exports
export DEFAULT_CHEAT_DIR=$HOME/.packages/source/cheat/cheatsheets/
export EDITOR=vim
export PYTHONSTARTUP=~/.pystartup

#viteralenv wrapper
export WORKON_HOME=$HOME/Documents/Code/Python/.venv
export PROJECT_HOME=$HOME/Documents/Code/Python
source /usr/local/bin/virtualenvwrapper.sh

#custom commands
alias ck='~/.packages/source/Checkvist/inbox.py'

#bash_colors contains long string to formate ls output colors
if [ -f ~/.ls_colors ]; then
    . ~/.ls_colors
fi
