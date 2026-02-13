
eth=en0
wintf=en1

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
alias em='echo user153015@gmail.com | pbcopy'
alias em2='echo t@tik1.net | pbcopy'
alias es='echo studienkreis.timo.koerner@googlemail.com | pbcopy'
alias fn='echo 08456 9524 297|pbcopy'
alias ib='echo de39 5001 0517 5447 5823 49 | pbcopy'
alias nr='echo 0157 3959 8220 | pbcopy'
alias sk2='echo 30-810020286|pbcopy'
alias sk='echo Timo Körner | pbcopy'

alias zgc='echo "git clone --recursive https://github.com/sorin-ionescu/prezto.git .zprezto && git clone https://github.com/tik9/cprezto.git ~/cprezto"|pbcopy'

alias zgp='echo "git pull && cp ~/cprezto/.zshrc ~"|pbcopy'

#cpu, system
alias cpu='sysctl -n machdep.cpu.brand_string'
alias os=sw_vers
alias sy='open -b com.apple.systempreferences'

alias bt=blueutil
alias op='open "$(ls -t|grep -v /|head -1)"'


res(){ 
    json_data=$(system_profiler -json SPDisplaysDataType 2>/dev/null)

    echo "$json_data" | jq .
    # Use jq to find main display with 'spdisplays_main' and grab pixels
    echo "$json_data" | jq -r '.SPDisplaysDataType[0].spdisplays_ndrvs[] | selechot(has("spdisplays_main")) | ._spdisplays_pixels'
}

sp_lev2(){
   system_profiler -detailLevel -2
}

unzip_() {
    downl=$HOME/downloads
    icloud="iCloud Photos"
    cd $downl
    rm -rf $icloud
    unzip $icloud.zip
    open $icloud/IMG*
}

wifi_get() { /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' }
