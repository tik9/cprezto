
cols(){
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

gp2(){ 
    git add . 
    git commit -m "$1" 
    git push origin master
}


ic() { 
    ip -4 a | grep -Eo 'inet 192\.168\.1\.[0-9]{2}/'
}

mp() {
    # tbd add radio stations function
    if [[ -f "$1" ]]; then
        mpv "$1"
    else
        json=~/cprezto/radiostations.json
        echo Stations in $json:
        jq -r 'to_entries[] | "\(.key) - \(.value)"' $json

        mpv $(jq -r ".${1:-char}" $json)
    fi
  }

q(){ wget -O /dev/null http://speedtest.belwue.net/1G ; }

q2(){wget -O /dev/null --progress=dot:mega http://cachefly.cachefly.net/100mb.test; }


sc(){
    # scp $1 tk@192.168.1.64:c:/users/tk/
    # scp $1 thome@192.168.1.67:/Users/thome/
    scp -o strictHostKeyChecking=no -P8022 "$@" 192.168.1.78:/data/data/com.termux/files/home

}

uzip(){
    cd $HOME/downloads
    find ./ -name \*.zip -exec unzip {} \; &&

    rm iCloud\ Photos/*.MOV
    rm -f *.zip
}

w(){ curl wttr.in/${1:-hepberg}}


web() {
  local url=$1
  shift

  if [[ $# -eq 0 ]]; then
    ${(z)BROWSER:-open} "${url%search?q=}"
    return
  fi

  # Join arguments with + for the URL
  local query="${(j:+:)@}"
  ${(z)BROWSER:-open} "${url}${query}"
}

alias goo="web 'https://www.google.com/search?q='"

zscp() {
    # Usage: zscp [IP_SUFFIX] [PATH] [PORT] [USER]
    
    local ip_suffix="${1:-78}"
    local target_path="${2:-/data/data/com.termux/files/home}"
    local port="${3:-8022}"
    local username="${4:-$(whoami)}" # Defaults to current user if $4 is empty

    scp -v -o StrictHostKeyChecking=no -r -P "$port" own/ "${username}@192.168.1.${ip_suffix}:${target_path}/.zprezto/modules/"
}