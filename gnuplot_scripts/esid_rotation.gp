# Two-panel rotation plot: V_tot and ESID coupling
# Input files must be in the same directory as this script.

set terminal pngcairo size 1800,850 enhanced font 'Sans,16'
set output 'esid_rotation_2panel.png'

set datafile separator whitespace
set multiplot layout 1,2 rowsfirst

set xrange [-3:93]
set yrange [0:0.0015]
set xtics 0,10,90
set ytics 0,0.0005,0.0015
set format y '%.4f'
set xlabel 'Rotation (degrees)' font ',18'
set ylabel 'Coupling (eV)' font ',18'
set tics font ',15'
set border lw 1.5
unset grid
set key off

# rotation_scan_data.txt:
#   column 1  = rotation
#   column 2  = ESID
#   column 15 = |V_1p + V_2p| = V_tot
set title 'B3LYP' font ',20'
plot \
    'b3lyp_rotation_scan_data.txt' using 1:15 smooth csplines \
        with lines lc rgb '#e41a1c' lw 2.4 notitle, \
    'b3lyp_rotation_scan_data.txt' using 1:2 smooth csplines \
        with lines lc rgb '#0000ff' lw 2.4 notitle, \
    'b3lyp_rotation_scan_data.txt' using 1:15 \
        with points lc rgb '#e41a1c' pt 5 ps 3.0 notitle, \
    'b3lyp_rotation_scan_data.txt' using 1:2 \
        with points lc rgb '#0000ff' pt 2 ps 3.0 lw 2.8 notitle

# rotation_scan_data-2.txt:
#   column 1  = rotation
#   column 13 = ESID
#   column 15 = |V_1p + V_2p| = V_tot
set ylabel ''
set title 'PBE0' font ',20'
plot \
    'pbe_rotation_scan_data.txt' using 1:15 smooth csplines \
        with lines lc rgb '#e41a1c' lw 2.4 notitle, \
    'pbe_rotation_scan_data.txt' using 1:13 smooth csplines \
        with lines lc rgb '#0000ff' lw 2.4 notitle, \
    'pbe_rotation_scan_data.txt' using 1:15 \
        with points lc rgb '#e41a1c' pt 5 ps 3.0 notitle, \
    'pbe_rotation_scan_data.txt' using 1:13 \
        with points lc rgb '#0000ff' pt 2 ps 3.0 lw 2.8 notitle

unset multiplot
unset output

