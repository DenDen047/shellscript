#!/bin/zsh

Download=~/Downloads
Books=~/Downloads/Manga
Pics=~/Downloads/Picture

#-------------------
# isolate zip files
#-------------------
mkdir $Books/zip
mv $Download/*.zip $Books/zip
mv $Books/*.zip $Books/zip

#-------------------
# cut OuthorName
#-------------------
echo "Make NameList.txt"
ZipFiles=~/Downloads/Manga/zip
ls $ZipFiles/\(成年コミック* | cut -d [ -f2 | cut -d ] -f1 > $ZipFiles/NameList.txt
ls $ZipFiles/\[*]* | cut -d [ -f2 | cut -d ] -f1 | cut -d "(" -f1 > $ZipFiles/NameList.txt
ls $ZipFiles/\(同人CG集* | cut -d [ -f2 | cut -d  ] -f1 > $ZipFiles/CGNameList.txt

#-------------------
# mkdir
#-------------------
echo "Make directories"

# adult comic
names=$ZipFiles/NameList.txt
while read line
do
    # move zipFiles
    echo $line
    dir=$Books/$line
    mkdir $dir
    mv $ZipFiles/*$line* $dir/

    # rename ZipFiles
    ls $dir/ > $dir/FileList.txt
    ls $dir/*.zip | awk -F'] ' '{print $2;}' | awk -F'(' '{print $1;}' > $dir/RenameList.txt # extract commic title
    for filename in $dir/*.zip
    do
        # reName = `echo $filename | cut -d "] " -f2 | cut -d " (" -f1`     <- Can't use
        reName = `echo $filename | awk -F'] ' '{print $2;}' | awk -F'(' '{print $1;}'`
        echo "rename is $reName"
        mv $filename $dir/$reName
    done
    rm $dir/FileList.txt
    rm $dir/RenameList.txt
done < $names

# CGs
names=$ZipFiles/CGNameList.txt
while read line
do
    echo $line
    dir=$Pics/$line
    mkdir $dir
    mv $ZipFiles/*$line* $dir/
done < $names


#-------------------
# Finish
#-------------------
rm $ZipFiles/NameList.txt
rm $ZipFiles/CGNameList.txt
echo "Finish!!"


