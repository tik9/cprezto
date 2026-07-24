
# alias
alias a='alias | grep -i'
alias al='alias | less'
alias de='declare -f'
alias t=type

# cd
alias dc="cd $HOME/documents"
alias dk="cd $HOME/desktop"
alias d="cd $HOME/downloads"
alias ma="cd $HOME/max/noten"
alias mi='cd "$HOME/Library/Application Support/minecraft"'
alias p="cd $HOME/documents/privat"
alias u="cd $HOME/unterhalt"
alias y="cd $HOME/cpython"
alias z="cd $HOME/cprezto"
alias zz="cd $HOME/.zprezto"

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


# progr
alias bc='bc -l<<<'
alias c=code
alias ca=cat
alias n=nano


# rm
alias rf='rm -rf'
alias rm='nocorrect rm'
alias rm_today='find . -type f -cmin -1 -delete'
alias rp='rm *.pdf'

# ssh
alias sd=sshd
alias pd='ps -ef|grep ssh'


alias cp='nocorrect cp'
alias du='date +%H:%M'
alias dt='date +%d'
alias ec='echo'
alias h='history'
alias hi='history | grep'
alias i=ifconfig
alias le="less -m"
alias l="ls -t"
alias mcmod='cp "$(ls -t ~/Downloads/*.jar | head -1)" "$HOME/Library/Application Support/minecraft/instances/neoforge-1.21/mods/"'
alias mcmodcf='cp "$(ls -t ~/Downloads/*.jar | head -1)" "~/Library/Application Support/minecraft/mods/instances/1.21.1/mods'
alias md=mkdir
alias mv='nocorrect mv'
alias o=open
alias pl='pv live'
alias pw=pwd
alias p2='ps2pdf -dPDFSETTINGS=/ebook'
alias s='exec zsh'
alias su=sudo
alias to=touch
alias x=exit
alias zcp='cp ~/.zshrc ~/cprezto'
