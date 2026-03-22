v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -250 -160 -170 -160 {lab=#net1}
N -310 -110 -310 -50 {lab=#net1}
N -230 20 -130 20 {lab=#net2}
N -310 -20 -130 -20 {lab=GND}
N -230 20 -230 60 {lab=#net2}
N -310 20 -230 20 {lab=#net2}
N -310 -210 -310 -160 {lab=vdd}
N -310 -210 -130 -210 {lab=vdd}
N -130 -210 -130 -160 {lab=vdd}
N -130 -210 110 -210 {lab=vdd}
N 110 -210 110 -130 {lab=vdd}
N -310 -110 -250 -110 {lab=#net1}
N -310 -130 -310 -110 {lab=#net1}
N -250 -160 -250 -110 {lab=#net1}
N -270 -160 -250 -160 {lab=#net1}
N 110 0 110 170 {lab=gnd}
N -230 170 110 170 {lab=gnd}
N 10 0 70 0 {lab=#net3}
N -300 90 -270 90 {lab=#net3}
N 10 0 10 40 {lab=#net3}
N -300 40 10 40 {lab=#net3}
N -300 40 -300 90 {lab=#net3}
N -430 90 -300 90 {lab=#net3}
N -490 30 -430 30 {lab=#net3}
N -430 30 -430 90 {lab=#net3}
N -310 10 -310 20 {lab=#net2}
N -130 10 -130 20 {lab=#net2}
N -490 170 -230 170 {lab=gnd}
N -230 90 -230 170 {lab=gnd}
N -490 90 -490 170 {lab=gnd}
N -450 90 -430 90 {lab=#net3}
N 510 -160 530 -160 {lab=#net4}
N 510 40 510 140 {lab=#net4}
N 510 140 530 140 {lab=#net4}
N 510 40 530 40 {lab=#net4}
N 510 -70 530 -70 {lab=#net4}
N 510 -160 510 -70 {lab=#net4}
N 570 -200 570 -160 {lab=vdd}
N 570 -40 570 -10 {lab=Reset}
N 720 -10 720 50 {lab=Reset}
N 720 -80 720 -10 {lab=Reset}
N 810 -120 810 290 {lab=gnd}
N 570 180 570 290 {lab=gnd}
N 570 -10 570 40 {lab=Reset}
N 750 -120 810 -120 {lab=gnd}
N 750 90 820 90 {lab=vdd}
N 570 -200 720 -200 {lab=vdd}
N 720 -200 720 -120 {lab=vdd}
N 570 180 720 180 {lab=gnd}
N 570 140 570 180 {lab=gnd}
N 570 90 570 110 {lab=#net5}
N 570 -210 570 -200 {lab=vdd}
N 570 -120 690 -120 {lab=#net6}
N 570 -130 570 -120 {lab=#net6}
N 570 -120 570 -70 {lab=#net6}
N 570 90 690 90 {lab=#net5}
N 570 70 570 90 {lab=#net5}
N 110 -50 110 -30 {lab=#net7}
N 360 -50 360 50 {lab=#net4}
N 320 -50 360 -50 {lab=#net4}
N 110 -100 110 -50 {lab=#net7}
N 720 90 720 180 {lab=gnd}
N 980 -10 1080 -10 {lab=Reset}
N -230 170 -230 290 {lab=gnd}
N 360 110 360 290 {lab=gnd}
N -230 290 360 290 {lab=gnd}
N 360 290 570 290 {lab=gnd}
N 570 290 810 290 {lab=gnd}
N 980 -10 980 20 {lab=Reset}
N 980 80 980 290 {lab=gnd}
N 810 290 980 290 {lab=gnd}
N -130 -100 -130 -50 {lab=#net8}
N 110 -50 260 -50 {lab=#net7}
N 360 -50 510 -50 {lab=#net4}
N 510 -70 510 -50 {lab=#net4}
N 720 -10 980 -10 {lab=Reset}
N 570 -10 720 -10 {lab=Reset}
N 10 -130 70 -130 {lab=#net8}
N 10 -130 10 -100 {lab=#net8}
N -130 -100 10 -100 {lab=#net8}
N -130 -130 -130 -100 {lab=#net8}
N 360 290 360 350 {lab=gnd}
N 570 -240 570 -210 {lab=vdd}
N 110 -210 570 -210 {lab=vdd}
N -490 30 -490 60 {lab=#net3}
N -490 -210 -490 -200 {lab=vdd}
N -490 -210 -310 -210 {lab=vdd}
N -490 -140 -490 30 {lab=#net3}
N 510 -50 510 40 {lab=#net4}
C {sg13g2_pr/sg13_lv_pmos.sym} 90 -130 0 0 {name=M15
l=0.13u
w=5.2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 90 0 0 0 {name=M16
l=0.13u
w=0.52u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -150 -160 0 0 {name=M17
l=0.13u
w=5.2u
ng=2
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -110 -20 0 1 {name=M18
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -290 -160 0 1 {name=M19
l=0.13u
w=5.2u
ng=2
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -330 -20 0 0 {name=M20
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -250 90 0 0 {name=M21
l=1.95u
w=5.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {gnd.sym} -220 -20 0 0 {name=l3 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} -470 90 0 1 {name=M22
l=0.15u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 550 -160 0 0 {name=M23
l=0.13u
w=2.6u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 550 -70 0 0 {name=M24
l=0.13u
w=2.6u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 550 40 0 0 {name=M25
l=0.13u
w=1.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 550 140 0 0 {name=M26
l=0.13u
w=1.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 720 -100 1 1 {name=M27
l=0.13u
w=2.950u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 720 70 3 1 {name=M28
l=0.13u
w=2.950u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 820 90 0 1 {name=p12 sig_type=std_logic lab=vdd}
C {sg13g2_pr/rppd.sym} -490 -170 0 0 {name=R44
w=0.5e-6
l=330.60e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/cap_cmim.sym} 980 50 0 0 {name=C2
model=cap_cmim
w=26.98e-6
l=26.98e-6
m=1
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 360 80 0 0 {name=C1
model=cap_cmim
w=41.519e-6
l=41.519e-6
m=1
spiceprefix=X}
C {sg13g2_pr/rppd.sym} 290 -50 1 0 {name=R45
w=2e-6
l=7.45e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {iopin.sym} 570 -240 0 0 {name=p1 lab=vdd}
C {iopin.sym} 360 350 0 0 {name=p3 lab=gnd}
C {ipin.sym} -350 -20 0 0 {name=p4 lab=Vin}
C {ipin.sym} -90 -20 0 1 {name=p5 lab=Vref}
C {iopin.sym} 1080 -10 0 0 {name=p6 lab=Reset}
