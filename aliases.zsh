
# alias
alias a='alias | grep -i'
alias al='alias | less'
alias d='declare -f'
alias t=type

# cd
alias dc="cd $HOME/documents"
alias dk="cd $HOME/desktop"
alias dw="cd $HOME/downloads"
alias y="cd $HOME/cpython"
alias z="cd $HOME/cprezto"

# git
alias ga='git add .'
alias gi='git diff'
alias go='git log --stat'
alias grv='git remote --verbose'
alias gu='git status'

# progr
alias bc='bc -l<<<'
alias c=code
alias ca=cat
alias n=nano


# rm
alias rf='rm -rf'
alias rm='nocorrect rm'
alias rm_today='find . -type f -cmin -1 -delete'

# ssh
alias sd=sshd
alias pd='ps -ef|grep ssh'


alias cp='nocorrect cp'
alias du='date +%H:%M'
alias dt='date +%d'
alias e='exec zsh'
alias ec='echo'
alias h='history'
alias hi='history | grep'
alias i=ifconfig
alias le="less -m"
alias l="ls -t"
alias m=man
alias md=mkdir
alias o=open
alias pw=pwd
alias p2='ps2pdf -dPDFSETTINGS=/ebook'
alias su=sudo
alias to=touch
alias yt='yt-dlp -x --audio-format mp3'
alias x=exit
