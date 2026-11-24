# Naphthalene separation plot: CAM-B3LYP data
# Local exponential fits around r = 4.8 A for ESID, V_tot,
# and the semi-empirical coupling.

set terminal pngcairo size 1400,1000 enhanced font 'Sans,16'
set output 'separation_naphthalene_CAM.png'

set datafile separator whitespace
set datafile missing '?'
set fit quiet
set logscale y
set format y '10^{%L}'
set xrange [2.8:7.6]
set yrange [1e-8:1]
set xtics 0.5
set ytics nomirror
set border lw 1
set grid noxtics
unset key

# CAM-B3LYP columns:
# 1 = separation, 2 = ESID, 4 = V_2p,
# 11 = weighted V_1p, 12 = V_tot,
# 13 = semi-empirical coupling
x0 = 4.8

# Local exponential fits: y(x) = y(x0)*exp[-beta*(x-x0)]
log_esid(x) = a_esid + b_esid*(x-x0)
esid_fit(x) = exp(log_esid(x))
a_esid = log(0.003)
b_esid = -2.0
fit [4.4:5.2] log_esid(x) 'CAM-B3LYP_Separation_Scan.txt' using 1:(log($2)) via a_esid,b_esid

log_vtot(x) = a_vtot + b_vtot*(x-x0)
vtot_fit(x) = exp(log_vtot(x))
a_vtot = log(0.003)
b_vtot = -2.0
fit [4.4:5.2] log_vtot(x) 'CAM-B3LYP_Separation_Scan.txt' using 1:(log($12)) via a_vtot,b_vtot

log_semi(x) = a_semi + b_semi*(x-x0)
semi_fit(x) = exp(log_semi(x))
a_semi = log(0.005)
b_semi = -2.0
fit [4.4:5.2] log_semi(x) 'CAM-B3LYP_Separation_Scan.txt' using 1:(log($13)) via a_semi,b_semi

set label 1 'naphthalene' at graph 0.98,0.97 right font ',20'
set label 2 sprintf('ESID: {/Symbol b}=%.2f Å^{-1}', -b_esid) at graph 0.98,0.89 right font ',18'
set label 3 sprintf('V_{tot}: {/Symbol b}=%.2f Å^{-1}', -b_vtot) at graph 0.98,0.83 right font ',18'
set label 4 sprintf('Semi-emp.: {/Symbol b}=%.2f Å^{-1}', -b_semi) at graph 0.98,0.77 right font ',18'
set xlabel 'r / Å' font ',18'
set ylabel 'Coupling / eV' font ',18'

plot \
    'CAM-B3LYP_Separation_Scan.txt' using 1:11 with linespoints pt 9 ps 2.7 lw 1.2 lc rgb '#66a061' notitle, \
    'CAM-B3LYP_Separation_Scan.txt' using 1:4 with linespoints pt 11 ps 2.7 lw 1.2 lc rgb '#f6d28a' notitle, \
    'CAM-B3LYP_Separation_Scan.txt' using 1:12 with linespoints pt 7 ps 2.7 lw 1.2 lc rgb '#0000ff' notitle, \
    'CAM-B3LYP_Separation_Scan.txt' using 1:13 with linespoints pt 5 ps 2.7 lw 1.2 lc rgb '#000000' notitle, \
    esid_fit(x) with lines dt 2 lw 2.0 lc rgb '#ff0000' notitle, \
    vtot_fit(x) with lines dt 2 lw 2.0 lc rgb '#0000ff' notitle, \
    semi_fit(x) with lines dt 2 lw 2.0 lc rgb '#000000' notitle, \
    'CAM-B3LYP_Separation_Scan.txt' using 1:2 with linespoints pt 2 ps 2.7 lw 2.8 lc rgb '#ff0000' notitle

unset output

