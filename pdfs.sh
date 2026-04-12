
folder=$HOME/fol

# count=18
new_file=$(ls $HOME/*.pdf | head -1)
# full_length=$((${#new_file}-$count))
full_length=${#new_file}
# full_length=$((23-4))

# files=$(ls $HOME/*.pdf | sort -n -k1.$full_length)
files=$(ls $HOME/*.pdf)

basename_with_ext=$(basename $new_file)
# basename_length=${#basename}

# new_file_base=${basename_with_ext::-$count}

new_file_base=${basename_with_ext}
echo $files $new_file_base $full_length

united=$folder/united.pdf
united2=$folder/united2.pdf    

# ls -lh $united

# rm $HOME/*.pdf

pdfunite $files $united
ps2pdf -dPDFSETTINGS=/ebook $united $united2
mv $united2 $united && mv $united $folder/$new_file_base

# ls -lh $united2
    
# open $folder/$new_file_base.pdf

# ls -lh $folder/$new_file_base.pdf

