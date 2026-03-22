v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -470 -220 -390 -220 {lab=#net1}
N -530 -170 -530 -110 {lab=#net1}
N -450 -40 -350 -40 {lab=#net2}
N -530 -80 -350 -80 {lab=GND}
N -450 -40 -450 0 {lab=#net2}
N -530 -40 -450 -40 {lab=#net2}
N -530 -270 -530 -220 {lab=vdd}
N -530 -270 -350 -270 {lab=vdd}
N -350 -270 -350 -220 {lab=vdd}
N -350 -270 -110 -270 {lab=vdd}
N -110 -270 -110 -190 {lab=vdd}
N -530 -170 -470 -170 {lab=#net1}
N -530 -190 -530 -170 {lab=#net1}
N -470 -220 -470 -170 {lab=#net1}
N -490 -220 -470 -220 {lab=#net1}
N -110 -60 -110 110 {lab=gnd}
N -450 110 -110 110 {lab=gnd}
N -210 -60 -150 -60 {lab=#net3}
N -520 30 -490 30 {lab=#net3}
N -210 -60 -210 -20 {lab=#net3}
N -520 -20 -210 -20 {lab=#net3}
N -520 -20 -520 30 {lab=#net3}
N -650 30 -520 30 {lab=#net3}
N -710 -30 -650 -30 {lab=#net3}
N -650 -30 -650 30 {lab=#net3}
N -530 -50 -530 -40 {lab=#net2}
N -350 -50 -350 -40 {lab=#net2}
N -710 110 -450 110 {lab=gnd}
N -450 30 -450 110 {lab=gnd}
N -710 30 -710 110 {lab=gnd}
N -670 30 -650 30 {lab=#net3}
N 290 -220 310 -220 {lab=#net4}
N 290 -20 290 80 {lab=#net4}
N 290 80 310 80 {lab=#net4}
N 290 -20 310 -20 {lab=#net4}
N 290 -130 310 -130 {lab=#net4}
N 290 -220 290 -130 {lab=#net4}
N 350 -260 350 -220 {lab=vdd}
N 350 -100 350 -70 {lab=rst}
N 500 -70 500 -10 {lab=rst}
N 500 -140 500 -70 {lab=rst}
N 590 -180 590 230 {lab=gnd}
N 350 120 350 230 {lab=gnd}
N 350 -70 350 -20 {lab=rst}
N 530 -180 590 -180 {lab=gnd}
N 530 30 600 30 {lab=vdd}
N 350 -260 500 -260 {lab=vdd}
N 500 -260 500 -180 {lab=vdd}
N 350 120 500 120 {lab=gnd}
N 350 80 350 120 {lab=gnd}
N 350 30 350 50 {lab=#net5}
N 350 -270 350 -260 {lab=vdd}
N 350 -180 470 -180 {lab=#net6}
N 350 -190 350 -180 {lab=#net6}
N 350 -180 350 -130 {lab=#net6}
N 350 30 470 30 {lab=#net5}
N 350 10 350 30 {lab=#net5}
N -110 -110 -110 -90 {lab=#net7}
N 140 -110 140 -10 {lab=#net4}
N 100 -110 140 -110 {lab=#net4}
N -110 -160 -110 -110 {lab=#net7}
N 500 30 500 120 {lab=gnd}
N 760 -70 860 -70 {lab=rst}
N -450 110 -450 230 {lab=gnd}
N 140 50 140 230 {lab=gnd}
N -450 230 140 230 {lab=gnd}
N 140 230 350 230 {lab=gnd}
N 350 230 590 230 {lab=gnd}
N 760 -70 760 -40 {lab=rst}
N 760 20 760 230 {lab=gnd}
N 590 230 760 230 {lab=gnd}
N -350 -160 -350 -110 {lab=#net8}
N -110 -110 40 -110 {lab=#net7}
N 140 -110 290 -110 {lab=#net4}
N 290 -130 290 -110 {lab=#net4}
N 500 -70 760 -70 {lab=rst}
N 350 -70 500 -70 {lab=rst}
N -210 -190 -150 -190 {lab=#net8}
N -210 -190 -210 -160 {lab=#net8}
N -350 -160 -210 -160 {lab=#net8}
N -350 -190 -350 -160 {lab=#net8}
N 140 230 140 290 {lab=gnd}
N 350 -300 350 -270 {lab=vdd}
N -110 -270 350 -270 {lab=vdd}
N -710 -30 -710 0 {lab=#net3}
N -710 -270 -710 -260 {lab=vdd}
N -710 -270 -530 -270 {lab=vdd}
N -710 -200 -710 -30 {lab=#net3}
N 290 -110 290 -20 {lab=#net4}
N -1090 -270 -1090 -250 {lab=Vref}
N -1320 -280 -1320 -250 {lab=Vin}
N -1200 -150 -1200 -120 {lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} -130 -190 0 0 {name=M15
l=0.13u
w=5.2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -130 -60 0 0 {name=M16
l=0.13u
w=0.52u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -370 -220 0 0 {name=M17
l=0.13u
w=5.2u
ng=2
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -330 -80 0 1 {name=M18
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -510 -220 0 1 {name=M19
l=0.13u
w=5.2u
ng=2
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -550 -80 0 0 {name=M20
l=3.7u
w=3.64u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -470 30 0 0 {name=M21
l=1.95u
w=5.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {gnd.sym} -440 -80 0 0 {name=l3 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} -690 30 0 1 {name=M22
l=0.15u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 330 -220 0 0 {name=M23
l=0.13u
w=2.6u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 330 -130 0 0 {name=M24
l=0.13u
w=2.6u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 330 -20 0 0 {name=M25
l=0.13u
w=1.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 330 80 0 0 {name=M26
l=0.13u
w=1.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 500 -160 1 1 {name=M27
l=0.13u
w=2.950u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 500 10 3 1 {name=M28
l=0.13u
w=2.950u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 600 30 0 1 {name=p12 sig_type=std_logic lab=vdd}
C {sg13g2_pr/rppd.sym} -710 -230 0 0 {name=R44
w=0.5e-6
l=330.60e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/cap_cmim.sym} 760 -10 0 0 {name=C2
model=cap_cmim
w=26.98e-6
l=26.98e-6
m=1
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 140 20 0 0 {name=C1
model=cap_cmim
w=41.519e-6
l=41.519e-6
m=1
spiceprefix=X}
C {sg13g2_pr/rppd.sym} 70 -110 1 0 {name=R45
w=2e-6
l=7.45e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {iopin.sym} 350 -300 0 0 {name=p1 lab=vdd}
C {iopin.sym} 140 290 0 0 {name=p3 lab=gnd}
C {ipin.sym} -570 -80 0 0 {name=p4 lab=Vin}
C {ipin.sym} -310 -80 0 1 {name=p5 lab=Vref}
C {iopin.sym} 860 -70 0 0 {name=p6 lab=rst}
C {vsource.sym} -1090 -220 0 0 {name=Vref value=0.9
savecurrent=false}
C {gnd.sym} -1090 -190 0 0 {name=l4 lab=GND}
C {vsource.sym} -1320 -220 0 0 {name=Vdd value="pulse(0 1.2 0 5u 10u 40u)"
savecurrent=false}
C {gnd.sym} -1320 -190 0 0 {name=l9 lab=GND}
C {lab_pin.sym} -1090 -270 0 1 {name=p2 sig_type=std_logic lab=Vref}
C {lab_pin.sym} -1320 -280 0 0 {name=p7 sig_type=std_logic lab=Vin}
C {vsource.sym} -1200 -90 0 0 {name=Vdd1 value="pulse(0 1.2 0 5u 10u 40u)"
savecurrent=false}
C {gnd.sym} -1200 -60 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -1200 -150 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {code.sym} -1130 -660 0 0 {name=ngspice
only_toplevel=false 
value="
.control
.save all

tran 2n 80u
plot rst vdd


.endc
"
}
C {code_shown.sym} -950 -675 0 0 {
name=TT_MODELS2
only_toplevel=true
value="
** IHP models
.lib cornerMOSlv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.include sg13g2_stdcell.spice
"
      }
