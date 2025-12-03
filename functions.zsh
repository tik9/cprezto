
bachata=https://stream.zeno.fm/8c7v9dtvqp8uv
classic=https://klassik.stream.laut.fm/klassik
ndr=https://www.ndr.de/resources/metadaten/audio/aac/ndrblue.m3u
salsa=http://146.71.118.220:35025/autodj

mps() {mpv $1}

cols(){
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

gcz(){
    cp ~/.zpreztorc ~/cprezto/.zpreztorc
    cp ~/.zshrc ~/cprezto/.zshrc
    git add . && git commit -m "$1" && git push
}

ifco() { echo $(ip a) | sed -E 's/inet ([0-9]{3}\.[0-9]{3}\.[0-9]{3}\.[0-9]+).*/\1/' | grep inet }

mkcd() { mkdir -p "$1" && cd "$1" }

q(){ wget -O /dev/null http://speedtest.belwue.net/1G ; }

q2(){wget -O /dev/null --progress=dot:mega http://cachefly.cachefly.net/100mb.test; }

resolution(){ system_profiler -json SPDisplaysDataType 2>/dev/null | python3 -c "import sys,json;d=next(i for i in json.load(sys.stdin)['SPDisplaysDataType'][0]['spdisplays_ndrvs'] if 'spdisplays_main' in i);print(d['_spdisplays_pixels'])";}

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

w(){
    loc="${1:-hepberg}"
    curl wttr.in/$loc
}

# pdfs $@
pdfs(){
    folder=$HOME/fol

    new_file=$(ls $HOME/*.pdf | head -1)
    full_length=$((${#new_file}-4))
    # full_length=$((23-4))
    files=$(ls $HOME/*.pdf | sort -n -k1.$full_length)
    
    basename_with_ext=$(basename $new_file)
    # basename_length=${#basename}
    new_file_base=${basename_with_ext::-4}
    echo $files $new_file_base $full_length
    
    united=$folder/united.pdf
    united2=$folder/united2.pdf    
    
    pdfunite $files $united

    # ls -lh $united

    # rm $HOME/*.pdf
    
    ps2pdf -dPDFSETTINGS=/ebook $united $united2
    # ls -lh $united2
    
    mv $united2 $united && mv $united $folder/$new_file_base.pdf
    # open $folder/$new_file_base.pdf

    # ls -lh $folder/$new_file_base.pdf

}


mvfile(){
    file=$(ls -t $HOME/downloads/* | head -1)
    if echo $file | grep -q Honorar ; then
        mv $file $HOME/documents/steuer/studienkreis
        return
    fi
    echo no file found

}
# mvfile