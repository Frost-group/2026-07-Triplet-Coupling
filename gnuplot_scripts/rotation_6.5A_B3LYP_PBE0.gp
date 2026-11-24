# Two-panel rotation-dependent coupling plot without grid lines
# Input files:
#   rotation_scan_data.txt
#   rotation_scan_data-2.txt
#
# Panel 1 columns:
#   rotation = 1, V_2p = 4, weighted V_1p = 14, V_tot = 15
# Panel 2 columns:
#   rotation = 1, V_2p = 3, weighted V_1p = 14, V_tot = 15

set terminal pngcairo size 1800,1050 enhanced font 'Sans,16'
set output 'rotation_2panel.png'

set encoding utf8
set datafile separator whitespace
set datafile missing '?'

set multiplot layout 1,2 margins 0.07,0.98,0.14,0.92 spacing 0.08,0

set xrange [-3:93]
set yrange [-1.0:2.0]
set xtics 0,10,90
set ytics -1.0,0.5,1.5
set format y '%.2f'
set border lw 1.8
set tics scale 0.9
set tics font ',16'
unset grid
unset key

# Colours: V_tot = red, weighted V_1p = blue, V_2p = green.
# Curves are cubic-spline interpolations through all supplied points.

# Panel 1: rotation_scan_data.txt
set title 'B3LYP' font ',20'
set xlabel 'Rotation (degrees)' font ',20'
set ylabel 'Coupling (10^{-5} eV)' font ',20'
plot \
    'b3lyp_rotation_scan_data.txt' using 1:($15*1e5) smooth csplines \
        with lines linecolor rgb '#e41a1c' linewidth 2.4 notitle, \
    'b3lyp_rotation_scan_data.txt' using 1:($14*1e5) smooth csplines \
        with lines linecolor rgb '#0000ff' linewidth 2.4 notitle, \
    'b3lyp_rotation_scan_data.txt' using 1:($4*1e5) smooth csplines \
        with lines linecolor rgb '#4daf4a' linewidth 2.4 notitle, \
    'b3lyp_rotation_scan_data.txt' using 1:($15*1e5) with points \
        linecolor rgb '#e41a1c' pointtype 5 pointsize 3.0 notitle, \
    'b3lyp_rotation_scan_data.txt' using 1:($14*1e5) with points \
        linecolor rgb '#0000ff' pointtype 9 pointsize 3.0 notitle, \
    'b3lyp_rotation_scan_data.txt' using 1:($4*1e5) with points \
        linecolor rgb '#4daf4a' pointtype 7 pointsize 3.0 notitle

# Panel 2: rotation_scan_data-2.txt
set title 'PBE0' font ',20'
set xlabel 'Rotation (degrees)' font ',20'
set ylabel 'Coupling (10^{-5} eV)' font ',20'
plot \
    'pbe_rotation_scan_data.txt' using 1:($15*1e5) smooth csplines \
        with lines linecolor rgb '#e41a1c' linewidth 2.4 notitle, \
    'pbe_rotation_scan_data.txt' using 1:($14*1e5) smooth csplines \
        with lines linecolor rgb '#0000ff' linewidth 2.4 notitle, \
    'pbe_rotation_scan_data.txt' using 1:($3*1e5) smooth csplines \
        with lines linecolor rgb '#4daf4a' linewidth 2.4 notitle, \
    'pbe_rotation_scan_data.txt' using 1:($15*1e5) with points \
        linecolor rgb '#e41a1c' pointtype 5 pointsize 3.0 notitle, \
    'pbe_rotation_scan_data.txt' using 1:($14*1e5) with points \
        linecolor rgb '#0000ff' pointtype 9 pointsize 3.0 notitle, \
    'pbe_rotation_scan_data.txt' using 1:($3*1e5) with points \
        linecolor rgb '#4daf4a' pointtype 7 pointsize 3.0 notitle

unset multiplot
unset output

