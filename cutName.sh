#!/bin/zsh

Download=~/Downloads
Books=~/Downloads/Manga
Pics=~/Downloads/Picture

# isolate zip files
mkdir $Books/zip
mv $Download/*.zip $Books/zip
mv $Books/*.zip $Books/zip

# cut OuthorName
echo "Make NameList.txt"
ZipFiles=~/Downloads/Manga/zip
ls $ZipFiles/\(成年コミック* | cut -d [ -f2 | cut -d ] -f1 > $ZipFiles/NameList.txt
ls $ZipFiles/\[*]* | cut -d [ -f2 | cut -d ] -f1 | cut -d "(" -f1 > $ZipFiles/NameList.txt
ls $ZipFiles/\(同人CG集* | cut -d [ -f2 | cut -d  ] -f1 > $ZipFiles/CGNameList.txt

# mkdir
echo "Make directories"
names=$ZipFiles/NameList.txt
while read line
do
    echo $line
    dir=$Books/$line
    mkdir $dir
    mv $ZipFiles/*$line* $dir/

    # rename ZipFiles
    ls $dir/ > $dir/FileList.txt
    ls $dir/*.zip | awk -F'] ' '{print $2;}' | awk -F'(' '{print $1;}' > $dir/RenameList.txt
    for filename in $dir/*
    do
        reName = `echo $filename | cut -d "] " -f2 | cut -d " (" -f1`
        mv $filename $dir/$reName
    done

done < $names

names=$ZipFiles/CGNameList.txt
while read line
do
    echo $line
    dir=$Pics/$line
    mkdir $dir
    mv $ZipFiles/*$line* $dir/
done < $names


# Finish
rm $ZipFiles/NameList.txt
rm $ZipFiles/CGNameList.txt
echo "Finish!!"


