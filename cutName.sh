#!/bin/zsh

Books=~/Downloads/Manga

# cut OuthorName
Books/\(成年コミック* | cut -d [ -f2 | cut -d ] -f1 > NameList.txt

# mkdir
names=Books/NameList.txt
while read line
do
    echo $line
    mkdir Books/$line
done < $names




