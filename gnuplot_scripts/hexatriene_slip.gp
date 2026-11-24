# Slip-dependent coupling plot
# Input file: data.txt
# Column 11: Our Method / eV
# Column 12: Extracted Paper Values / eV

set terminal pngcairo size 1400,1040 enhanced font 'Sans,16'
set output 'slip_coupling.png'

set encoding utf8
set datafile separator whitespace
set datafile missing '?'

set xlabel 'slip / Å' font ',24'
set ylabel 'Coupling / eV' font ',24'
set xrange [-0.4:8.4]
set yrange [-0.025:0.13]
set xtics 0,2,8
set ytics 0.00,0.05,0.10
set format y '%.2f'

unset key
set border lw 1.8
set tics scale 0.9
set tics font ',20'
set grid noxtics noytics

# The first extracted-paper value is missing in data.txt and is omitted.
plot 'data.txt' using 1:12 with linespoints \
         linecolor rgb '#e41a1c' linewidth 2.4 \
         pointtype 5 pointsize 2.8125 notitle, \
     'data.txt' using 1:11 with linespoints \
         linecolor rgb '#0000ff' linewidth 2.4 \
         pointtype 7 pointsize 2.8125 notitle

unset output

