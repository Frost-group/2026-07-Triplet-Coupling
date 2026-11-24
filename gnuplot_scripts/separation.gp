# 2x2 separation plots with exponential fits
# Required input files in the same directory:
#   naphthalene_separation.txt
#   anthracene_separation.txt
#   pentacene_separation.txt
#   ethene_separation.txt
#
# IMPORTANT:
# For rows where ESID is unavailable, put ? in the ESID field.
# Do not leave the field blank, because whitespace-delimited files
# otherwise shift all following columns left.

set terminal pngcairo size 1800,950 enhanced font 'Sans,13'
set output 'separation_2x2.png'

set datafile separator whitespace
set datafile missing '?'
set logscale y
set format y '10^{%L}'
set xrange [2.8:7.2]
set yrange [1e-8:1]
set xtics 0.5
set ytics nomirror
set border lw 1
set grid noxtics
set key at screen 0.875,0.50 left center vertical width 1.0 box

set multiplot layout 2,2 rowsfirst margins 0.06,0.86,0.10,0.96 spacing 0.10,0.12

# Marker convention:
# ESID               = crosses, pt 2
# V_1p weighted      = filled triangles, pt 9
# V_2p               = filled squares, pt 5
# Counterpoise V_tot = filled circles, pt 7

# ---------- Panel 1: naphthalene ----------
f1e(x)=Ae1*exp(-Be1*x)
f1c(x)=Ac1*exp(-Bc1*x)
Ae1=1.0; Be1=3.0; Ac1=1.0; Bc1=3.0
fit [4:6] f1e(x) 'naphthalene_separation.txt' using 1:2 via Ae1,Be1
fit [4:6] f1c(x) 'naphthalene_separation.txt' using 1:12 via Ac1,Bc1
set label 1 'naphthalene' at graph 0.98,0.96 right font ',16'
set xlabel 'r / Å'
set ylabel 'J_{ET} / eV'
plot 'naphthalene_separation.txt' using 1:2 with linespoints pt 2 ps 0.9 lw 1.2 lc rgb '#ff0000' title 'ESID', \
     'naphthalene_separation.txt' using 1:11 with linespoints pt 9 ps 0.9 lw 1.2 lc rgb '#8bc48b' title 'V_{1p} weighted', \
     'naphthalene_separation.txt' using 1:4 with linespoints pt 5 ps 0.9 lw 1.2 lc rgb '#f6d08a' title 'V_{2p}', \
     'naphthalene_separation.txt' using 1:12 with linespoints pt 7 ps 0.9 lw 1.2 lc rgb '#0000ff' title 'Counterpoise', \
     f1c(x) with lines dt 2 lw 1.5 lc rgb '#0000ff' title 'exp fit Counterpoise', \
     f1e(x) with lines dt 2 lw 1.5 lc rgb '#ff0000' title sprintf('exp fit ESID {/Symbol b}=%.2f',Be1)
unset label 1

# ---------- Panel 2: anthracene ----------
f2e(x)=Ae2*exp(-Be2*x)
f2c(x)=Ac2*exp(-Bc2*x)
Ae2=1.0; Be2=3.0; Ac2=1.0; Bc2=3.0
fit [4:6] f2e(x) 'anthracene_separation.txt' using 1:2 via Ae2,Be2
fit [4:6] f2c(x) 'anthracene_separation.txt' using 1:12 via Ac2,Bc2
set label 1 'anthracene' at graph 0.98,0.96 right font ',16'
set xlabel 'r / Å'
set ylabel ''
plot 'anthracene_separation.txt' using 1:2 with linespoints pt 2 ps 0.9 lw 1.2 lc rgb '#ff0000' notitle, \
     'anthracene_separation.txt' using 1:11 with linespoints pt 9 ps 0.9 lw 1.2 lc rgb '#8bc48b' notitle, \
     'anthracene_separation.txt' using 1:4 with linespoints pt 5 ps 0.9 lw 1.2 lc rgb '#f6d08a' notitle, \
     'anthracene_separation.txt' using 1:12 with linespoints pt 7 ps 0.9 lw 1.2 lc rgb '#0000ff' notitle, \
     f2c(x) with lines dt 2 lw 1.5 lc rgb '#0000ff' notitle, \
     f2e(x) with lines dt 2 lw 1.5 lc rgb '#ff0000' notitle
unset label 1

# ---------- Panel 3: pentacene ----------
f3e(x)=Ae3*exp(-Be3*x)
f3c(x)=Ac3*exp(-Bc3*x)
Ae3=1.0; Be3=3.0; Ac3=1.0; Bc3=3.0
fit [4:6] f3e(x) 'pentacene_separation.txt' using 1:2 via Ae3,Be3
fit [4:6] f3c(x) 'pentacene_separation.txt' using 1:12 via Ac3,Bc3
set label 1 'pentacene' at graph 0.98,0.96 right font ',16'
set xlabel 'r / Å'
set ylabel 'J_{ET} / eV'
plot 'pentacene_separation.txt' using 1:2 with linespoints pt 2 ps 0.9 lw 1.2 lc rgb '#ff0000' notitle, \
     'pentacene_separation.txt' using 1:11 with linespoints pt 9 ps 0.9 lw 1.2 lc rgb '#8bc48b' notitle, \
     'pentacene_separation.txt' using 1:4 with linespoints pt 5 ps 0.9 lw 1.2 lc rgb '#f6d08a' notitle, \
     'pentacene_separation.txt' using 1:12 with linespoints pt 7 ps 0.9 lw 1.2 lc rgb '#0000ff' notitle, \
     f3c(x) with lines dt 2 lw 1.5 lc rgb '#0000ff' notitle, \
     f3e(x) with lines dt 2 lw 1.5 lc rgb '#ff0000' notitle
unset label 1

# ---------- Panel 4: ethene ----------
f4e(x)=Ae4*exp(-Be4*x)
f4c(x)=Ac4*exp(-Bc4*x)
Ae4=1.0; Be4=3.0; Ac4=1.0; Bc4=3.0
fit [3:5.5] f4e(x) 'ethene_separation.txt' using 1:4 via Ae4,Be4
fit [3:5.5] f4c(x) 'ethene_separation.txt' using 1:12 via Ac4,Bc4
set xrange [2.8:6.1]
set label 1 'ethene' at graph 0.98,0.96 right font ',16'
set xlabel 'r / Å'
set ylabel ''
plot 'ethene_separation.txt' using 1:4 with linespoints pt 2 ps 0.9 lw 1.2 lc rgb '#ff0000' notitle, \
     'ethene_separation.txt' using 1:11 with linespoints pt 9 ps 0.9 lw 1.2 lc rgb '#8bc48b' notitle, \
     'ethene_separation.txt' using 1:3 with linespoints pt 5 ps 0.9 lw 1.2 lc rgb '#f6d08a' notitle, \
     'ethene_separation.txt' using 1:12 with linespoints pt 7 ps 0.9 lw 1.2 lc rgb '#0000ff' notitle, \
     f4c(x) with lines dt 2 lw 1.5 lc rgb '#0000ff' notitle, \
     f4e(x) with lines dt 2 lw 1.5 lc rgb '#ff0000' notitle
unset label 1

unset multiplot
set output
