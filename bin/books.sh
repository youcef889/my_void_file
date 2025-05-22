#!/bin/bash

quran_path="/home/youcef/Downloads/quran_with_bookmark_standard_version.pdf"
tafsir_quran="/home/youcef/Downloads/ar_Tafseer_of_Alsedi2.pdf"
word_quran="/home/youcef/Downloads/Kalemat_Quran.pdf"

choices="Quran\nTafsir\nWord"
chosen=$(echo -e "$choices" | dmenu -i -p "Choose:")

case "$chosen" in
    "Quran")
        zathura "$quran_path"
        ;;
    "Tafsir")
        zathura "$tafsir_quran"
        ;;
    "Word")
        zathura "$word_quran"
        ;;
    *)
        exit 0
        ;;
esac

