#!/bin/bash

mode=$2

if [ "$mode" == "a" ]; then
    banyakPenumpang=$(awk -F ',' 'NR>1 {count++} END {print count}' "$1")
    echo "Jumlah seluruh penumpang KANJ adalah $banyakPenumpang orang"

elif [ "$mode" == "b" ]; then
    banyakGerbong=$(awk -F ',' 'NR>1 {gerbong[$4]=1} END {print length(gerbong)}' "$1")
    echo "Jumlah gerbong penumpang KANJ adalah $banyakGerbong"

elif [ "$mode" == "c" ]; then
    namaPenumpangTertua=$(awk -F ',' 'NR>1 {if($2 > max){max=$2; nama=$1}} END {print nama}' "$1")
    umurPenumpangTertua=$(awk -F ',' 'NR>1 {if($2 > max){max=$2}} END {print max}' "$1")
    echo "$namaPenumpangTertua adalah penumpang kereta tertua dengan usia $umurPenumpangTertua tahun"

elif [ "$mode" == "d" ]; then
    rataUsia=$(awk -F ',' '
    NR>1 {
        total += $2
        count++
    }
    END {
        if (count > 0)
            print total/count
    }' "$1")
    echo "Rata-Rata usia penumpang adalah $rataUsia tahun"

elif [ "$mode" == "e" ]; then
    jumlahBusiness=$(awk -F ',' 'NR>1 && $3=="Business" {count++} END {print count}' "$1")
    echo "Jumlah penumpang business class ada $jumlahBusiness orang"

else
    echo "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
fi
