
# alias
alias a='alias | grep -i'
alias d='declare -f'
alias t=type

# cd
alias dc="cd $HOME/documents"
alias dk="cd $HOME/desktop"
alias dw="cd $HOME/downloads"
alias r="cd $HOME/cprezto"
alias y="cd $HOME/cpython"
alias z="cd $HOME/.zprezto"

# progr
alias b='bc -l<<<'
alias ca=cat
alias c=code
alias n=nano


# rm
alias rf='rm -rf'
alias rm='nocorrect rm'
alias rm_today='find . -type f -cmin -1 -delete'
alias rp='rm *.pdf'
alias rz='rm *.zip'

# ssh
alias sd=sshd
alias pd='ps -ef|grep ssh'


alias du='date +%H:%M'
alias dt='date +%d'
alias e='exec zsh'
alias ec='echo'
alias h='history'
alias i=ifconfig
alias le="less -m"
alias l="ls -t"
alias m=man
alias md=mkdir
alias mp=mpv
alias o=open
alias p=pwd
alias p2='ps2pdf -dPDFSETTINGS=/ebook'
alias su=sudo
alias to=touch
alias upd-pre='~/.zprezto-custom/update.sh'
alias x=exit
