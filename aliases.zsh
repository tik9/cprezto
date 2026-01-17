
# alias
alias a='alias | grep -i'
alias al='alias | less'
alias d='declare -f'
alias t=type

# cd
alias dc="cd $HOME/documents"
alias dk="cd $HOME/desktop"
alias dw="cd $HOME/downloads"
alias mi='cd "$HOME/Library/Application Support/minecraft"'
alias u="cd $HOME/.oh-my-zsh/custom"
alias y="cd $HOME/cpython"
alias z="cd $HOME/cprezto"
alias z2="cd $HOME/.zprezto"

# git
alias ga='git add .'
alias gi='git diff'
alias go='git log --stat'
alias grv='git remote --verbose'
alias gu='git status'

alias m=man
alias mc='man curl'
alias mt='man test'
alias mz='man zsh'

mccp() {
    cp "$HOME/Downloads/$1" "$HOME/Library/Application Support/minecraft/instances/neoforge-1.21$2/mods/" 
}

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
alias e='echo'
alias h='history'
alias hi='history | grep'
alias i=ifconfig
alias le="less -m"
alias l="ls -t"
alias md=mkdir
alias mv='nocorrect mv'
alias o=open
alias pw=pwd
alias p2='ps2pdf -dPDFSETTINGS=/ebook'
alias s='exec zsh'
alias su=sudo
alias to=touch
alias yt='yt-dlp -x --audio-format mp3'
alias x=exit
alias zcp='cp ~/.zshrc ~/cprezto'
