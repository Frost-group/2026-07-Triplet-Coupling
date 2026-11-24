# 2x2 separation plots with local exponential fits around r = 4.8 A
# Fits are applied only to ESID and V_tot.
# The local fitting interval is 4.4--5.2 A; fitted curves are shown across each panel.

set terminal pngcairo size 2640,1980 enhanced font 'Sans,18'
set output 'separation_2x2.png'

set datafile separator whitespace
set datafile missing '?'
set fit quiet
set logscale y
set format y '10^{%L}'
set xrange [2.8:7.2]
set yrange [1e-8:1]
set xtics 0.5
set ytics nomirror
set border lw 1
set grid noxtics
unset key

# Original colour styling:
# ESID = red crosses, weighted V_1p = green filled upright triangles,
# V_2p = pale-orange filled inverted triangles, V_tot = blue filled circles.
# Local exponential model: y(r) = exp(a + b*(r - 4.8))
x0 = 4.8

# Naphthalene: ESID column 2, V_tot column 12
log_ne(x) = a_ne + b_ne*(x-x0)
ne(x) = exp(log_ne(x))
a_ne = log(0.005); b_ne = -2.0
fit [4.4:5.2] log_ne(x) 'naphthalene_separation.txt' using 1:(log($2)) via a_ne,b_ne
log_nt(x) = a_nt + b_nt*(x-x0)
nt(x) = exp(log_nt(x))
a_nt = log(0.003); b_nt = -2.0
fit [4.4:5.2] log_nt(x) 'naphthalene_separation.txt' using 1:(log($12)) via a_nt,b_nt

# Anthracene: ESID column 2, V_tot column 12
log_ae(x) = a_ae + b_ae*(x-x0)
ae(x) = exp(log_ae(x))
a_ae = log(0.005); b_ae = -2.0
fit [4.4:5.2] log_ae(x) 'anthracene_separation.txt' using 1:(log($2)) via a_ae,b_ae
log_at(x) = a_at + b_at*(x-x0)
at(x) = exp(log_at(x))
a_at = log(0.003); b_at = -2.0
fit [4.4:5.2] log_at(x) 'anthracene_separation.txt' using 1:(log($12)) via a_at,b_at

# Pentacene: ESID column 2, V_tot column 12
log_pe(x) = a_pe + b_pe*(x-x0)
pe(x) = exp(log_pe(x))
a_pe = log(0.005); b_pe = -2.0
fit [4.4:5.2] log_pe(x) 'pentacene_separation.txt' using 1:(log($2)) via a_pe,b_pe
log_pt(x) = a_pt + b_pt*(x-x0)
pt(x) = exp(log_pt(x))
a_pt = log(0.003); b_pt = -2.0
fit [4.4:5.2] log_pt(x) 'pentacene_separation.txt' using 1:(log($12)) via a_pt,b_pt

# Ethene: ESID column 4, V_tot column 12
log_he(x) = a_he + b_he*(x-x0)
he(x) = exp(log_he(x))
a_he = log(0.005); b_he = -2.0
fit [4.4:5.2] log_he(x) 'ethene_separation.txt' using 1:(log($4)) via a_he,b_he
log_ht(x) = a_ht + b_ht*(x-x0)
ht(x) = exp(log_ht(x))
a_ht = log(0.003); b_ht = -2.0
fit [4.4:5.2] log_ht(x) 'ethene_separation.txt' using 1:(log($12)) via a_ht,b_ht

# Enlarged subplot area: reduced outer margins and inter-panel spacing.
set multiplot layout 2,2 rowsfirst margins 0.08,0.96,0.10,0.98 spacing 0.07,0.09

set label 1 'naphthalene' at graph 0.98,0.96 right font ',24'
set label 2 sprintf('ESID: {/Symbol b}=%.2f Å^{-1}', -b_ne) at graph 0.98,0.88 right font ',24'
set label 3 sprintf('V_{tot}: {/Symbol b}=%.2f Å^{-1}', -b_nt) at graph 0.98,0.81 right font ',24'
set xlabel 'r / Å' font ',27'; set ylabel 'Coupling / eV' font ',27'
plot 'naphthalene_separation.txt' using 1:2 with linespoints pt 2 ps  3.0 lw 1.5 lc rgb '#ff0000' notitle, \
     'naphthalene_separation.txt' using 1:11 with linespoints pt 9 ps 3.0 lw 1.5 lc rgb '#66a061' notitle, \
     'naphthalene_separation.txt' using 1:4 with linespoints pt 11 ps 3.0 lw 1.5 lc rgb '#f6d28a' notitle, \
     'naphthalene_separation.txt' using 1:12 with linespoints pt 7 ps 3.0 lw 1.5 lc rgb '#0000ff' notitle, \
     ne(x) with lines dt 2 lw 2.0 lc rgb '#ff0000' notitle, \
     nt(x) with lines dt 2 lw 2.0 lc rgb '#0000ff' notitle
unset label 1; unset label 2; unset label 3

set label 1 'anthracene' at graph 0.98,0.96 right font ',24'
set label 2 sprintf('ESID: {/Symbol b}=%.2f Å^{-1}', -b_ae) at graph 0.98,0.88 right font ',24'
set label 3 sprintf('V_{tot}: {/Symbol b}=%.2f Å^{-1}', -b_at) at graph 0.98,0.81 right font ',24'
set xlabel 'r / Å' font ',27'; set ylabel ''
plot 'anthracene_separation.txt' using 1:2 with linespoints pt 2 ps  3.0 lw 1.5 lc rgb '#ff0000' notitle, \
     'anthracene_separation.txt' using 1:11 with linespoints pt 9 ps 3.0 lw 1.5 lc rgb '#66a061' notitle, \
     'anthracene_separation.txt' using 1:4 with linespoints pt 11 ps 3.0 lw 1.5 lc rgb '#f6d28a' notitle, \
     'anthracene_separation.txt' using 1:12 with linespoints pt 7 ps 3.0 lw 1.5 lc rgb '#0000ff' notitle, \
     ae(x) with lines dt 2 lw 2.0 lc rgb '#ff0000' notitle, \
     at(x) with lines dt 2 lw 2.0 lc rgb '#0000ff' notitle
unset label 1; unset label 2; unset label 3

set label 1 'pentacene' at graph 0.98,0.96 right font ',24'
set label 2 sprintf('ESID: {/Symbol b}=%.2f Å^{-1}', -b_pe) at graph 0.98,0.88 right font ',24'
set label 3 sprintf('V_{tot}: {/Symbol b}=%.2f Å^{-1}', -b_pt) at graph 0.98,0.81 right font ',24'
set xlabel 'r / Å' font ',27'; set ylabel 'Coupling / eV' font ',27'
plot 'pentacene_separation.txt' using 1:2 with linespoints pt 2 ps 3.0 lw 1.5 lc rgb '#ff0000' notitle, \
     'pentacene_separation.txt' using 1:11 with linespoints pt 9 ps 3.0 lw 1.5 lc rgb '#66a061' notitle, \
     'pentacene_separation.txt' using 1:4 with linespoints pt 11 ps 3.0 lw 1.5 lc rgb '#f6d28a' notitle, \
     'pentacene_separation.txt' using 1:12 with linespoints pt 7 ps 3.0 lw 1.5 lc rgb '#0000ff' notitle, \
     pe(x) with lines dt 2 lw 2.0 lc rgb '#ff0000' notitle, \
     pt(x) with lines dt 2 lw 2.0 lc rgb '#0000ff' notitle
unset label 1; unset label 2; unset label 3

set xrange [2.8:6.1]
set label 1 'ethene' at graph 0.98,0.96 right font ',24'
set label 2 sprintf('ESID: {/Symbol b}=%.2f Å^{-1}', -b_he) at graph 0.98,0.88 right font ',24'
set label 3 sprintf('V_{tot}: {/Symbol b}=%.2f Å^{-1}', -b_ht) at graph 0.98,0.81 right font ',24'
set xlabel 'r / Å' font ',27'; set ylabel ''
plot 'ethene_separation.txt' using 1:4 with linespoints pt 2 ps 3.0 lw 1.5 lc rgb '#ff0000' notitle, \
     'ethene_separation.txt' using 1:11 with linespoints pt 9 ps 3.0 lw 1.5 lc rgb '#66a061' notitle, \
     'ethene_separation.txt' using 1:3 with linespoints pt 11 ps 3.0 lw 1.5 lc rgb '#f6d28a' notitle, \
     'ethene_separation.txt' using 1:12 with linespoints pt 7 ps 3.0 lw 1.5 lc rgb '#0000ff' notitle, \
     he(x) with lines dt 2 lw 2.0 lc rgb '#ff0000' notitle, \
     ht(x) with lines dt 2 lw 2.0 lc rgb '#0000ff' notitle
unset label 1; unset label 2; unset label 3

unset multiplot
set output

