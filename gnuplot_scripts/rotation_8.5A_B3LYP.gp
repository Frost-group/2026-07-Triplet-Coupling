# Rotation-dependent coupling plot
# Input file: rotation.dat
# Column 3: signed V_2p
# Column 13: weighted V_1p
# Column 14: |V_1p + V_2p|

set terminal pngcairo size 1400,1040 enhanced font 'Sans,16'
set output 'rotation_gnuplot.png'

set encoding utf8
set datafile separator whitespace
set datafile missing '?'

set xlabel 'Rotation (degrees)' font ',20'
set ylabel 'Coupling (10^{-5} eV)' font ',20'
set xrange [-3:93]
set yrange [-0.005:0.15]
set xtics 0,10,90
set ytics -0.05,0.05,0.15
set format y '%.2f'

unset key
set border lw 1.8
set tics scale 0.9
set tics font ',16'
set grid noxtics noytics

# Scale all couplings by 10^5 so the y-axis is in 10^{-5} eV.
# High-contrast colours matching the slip plot style:
# red = total, blue = weighted V_1p, green = signed V_2p.

plot \
    'pyrene_8_5A_rotation.txt' using 1:($14*1e5) smooth csplines \
        linecolor rgb '#e41a1c' linewidth 2.4 notitle, \
    'pyrene_8_5A_rotation.txt' using 1:($13*1e5) smooth csplines \
        linecolor rgb '#0000ff' linewidth 2.4 notitle, \
    'pyrene_8_5A_rotation.txt' using 1:($3*1e5) smooth csplines \
        linecolor rgb '#4daf4a' linewidth 2.4 notitle, \
    'pyrene_8_5A_rotation.txt' using 1:($14*1e5) with points \
        linecolor rgb '#e41a1c' pointtype 5 pointsize 3.0 notitle, \
    'pyrene_8_5A_rotation.txtt' using 1:($13*1e5) with points \
        linecolor rgb '#0000ff' pointtype 9 pointsize 3.0 notitle, \
    'pyrene_8_5A_rotation.txt' using 1:($3*1e5) with points \
        linecolor rgb '#4daf4a' pointtype 7 pointsize 3.0 notitle

unset output

