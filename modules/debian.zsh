
alias pm='sudo pm-suspend'

# apt
alias aar='apt autoremove -y'
alias ad="apt update"
alias ai="apt list --installed | grep"
alias al='apt list --upgradable'
alias as='apt show'
alias au="apt upgrade -y"
alias in='apt install -y'

function de {  apt show "$@" | grep -E 'Description|^' }

function cb { echo "$@"|xclip -selection clipboard }
function cc { echo `$@`|xclip -selection clipboard }


# List packages by size
function apt-list-packages() {
    dpkg-query -W --showformat='${Installed-Size} ${Package} ${Status}\n' | \
    grep -v deinstall | \
    sort -n | \
    awk '{print $1" "$2}'
}