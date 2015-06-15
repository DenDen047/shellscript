#!/bin/zsh

Download=~/Downloads
Books=~/Downloads/Manga

# isolate zip files
mkdir $Books/zip
mv $Download/*.zip $Books/zip
mv $Books/*.zip $Books/zip

# cut OuthorName
echo "Make NameList.txt"
ZipFiles=~/Downloads/Manga/zip
ls $ZipFiles/\(成年コミック* | cut -d [ -f2 | cut -d ] -f1 > $ZipFiles/NameList.txt

# mkdir
echo "Make directories"
names=$ZipFiles/NameList.txt
while read line
do
    echo $line
    dir=$Books/$line
    mkdir $dir
    mv $ZipFiles/*$line* $dir/
done < $names

# Finish
rm $ZipFiles/NameList.txt
echo "Finish!!"


