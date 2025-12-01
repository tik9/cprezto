
eth=en0
wintf=en1


# bluetooth
alias bt='blueutil -p toggle'

# net
alias et="ipconfig getifaddr $eth"
alias ne=networkQuality
alias off-w="networksetup -setairportpower WI-FI off"
alias on-w="networksetup -setairportpower WI-FI on"
alias wi="ipconfig getifaddr $wintf"
alias wl='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan'

# osa, 1=10%
alias o_getv='osascript -e "get volume settings"'
alias o_increase='osascript -e "set volume output volume (output volume of (get volume settings) + 10)"'
alias o_max='osascript -e "set volume 5.0"'
alias o_min='osascript -e "set volume 0.3"'
alias o_reduce='osascript -e "set volume output volume (output volume of (get volume settings) - 10)"'


# pbcopy
alias an='echo Hallo, ich würde es für 50 € nehmen, bitte nur melden falls der Preis in Frage kommt.|pbcopy'
alias adr='echo Timo Körner, Bergstr. 15, 85120 Hepberg | pbcopy'
alias em='ec user153015@gmail.com | pbcopy'
alias em2='ec t@tik1.net | pbcopy'
alias es='ec studienkreis.timo.koerner@googlemail.com | pbcopy'
alias fn='ec 08456 9524 297|pbcopy'
alias ib='ec de39 5001 0517 5447 5823 49 | pbcopy'
alias ma='ec Bitte meinen Kollegen Martin wegen Stroh/Heu für einen Termin anrufen Tel. 0157 38912 559 | pbcopy'
alias nr='ec 0157 3959 8220 | pbcopy'
alias nh='ec Hallo, ich biete Online Nachhilfe per google meet. Der Preis ist 18 € für 45 Minuten. Das Material bitte als Pdf oder Bild schicken mit einem Terminvorschlag für die erste Stunde per mail an studienkreis.timo.koerner@gmail.com | pbcopy'

# ${ZDOTDIR:-$HOME} will not work as destination dir because $HOME in Mac is /Users, not /home
alias pr='echo git clone --recursive https://github.com/sorin-ionescu/prezto.git .zprezto"|pbcopy'
alias cpr='echo git clone https://github.com/tik9/cprezto.git|pbcopy'


#cpu, system
alias cpu='sysctl -n machdep.cpu.brand_string'
alias os=sw_vers
alias s='open -b com.apple.systempreferences'

ln2() {
  local cmd='setopt EXTENDED_GLOB; for i in $HOME/.zprezto/runcoms/^README.md; do ln -s "$i" "$HOME/.${i:t}"; done'
  echo "$cmd" | pbcopy
  echo "$cmd"
}

wifi_get() { /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' }


unzip_() {
    downl=$HOME/downloads
    icloud="iCloud Photos"
    cd $downl
    rm -rf $icloud
    unzip $icloud.zip
    open $icloud/IMG*
}