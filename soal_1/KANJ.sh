BEGIN {
    FS=","
    mode = ARGV[2]
    ARGC-- 
}

NR > 1 {

    # jumlah penumpang
    if (mode == "a") {
        count++
    }

    # jumlah gerbong
    else if (mode == "b") {
        gerbong[$4] = 1
    }

    # penumpang tertua
    else if (mode == "c") {
        if ($2 > max) {
            max = $2
            nama = $1
        }
    }

    # rata-rata usia
    else if (mode == "d") {
        total += $2
        jumlah++
    }

    # business class
    else if (mode == "e") {
        if ($3 == "Business") {
            business++
        }
    }
}

END {
    if (mode == "a") {
        print "Jumlah seluruh penumpang KANJ adalah " count " orang"
    }
    else if (mode == "b") {
        print "Jumlah gerbong penumpang KANJ adalah " length(gerbong)
    }
    else if (mode == "c") {
        print nama " adalah penumpang kereta tertua dengan usia " max " tahun"
    }
    else if (mode == "d") {
        if (jumlah > 0)
            print "Rata-Rata usia penumpang adalah " int(total/jumlah) " tahun"
    }
    else if (mode == "e") {
        print "Jumlah penumpang business class ada " business " orang"
    }
    else {
        print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
    }
}
