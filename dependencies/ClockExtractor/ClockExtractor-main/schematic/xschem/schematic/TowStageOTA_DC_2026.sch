v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 220 -1340 220 -1320 {lab=VDD}
N 220 -1260 220 -1240 {lab=GND}
N 60 -610 60 -580 {lab=v1}
N 140 -610 140 -550 {lab=v1}
N 140 -550 280 -550 {lab=v1}
N 100 -550 140 -550 {lab=v1}
N 60 -500 60 -480 {lab=#net1}
N 320 -500 320 -480 {lab=#net1}
N 320 -550 370 -550 {lab=#net1}
N 370 -550 370 -500 {lab=#net1}
N 320 -500 370 -500 {lab=#net1}
N 320 -520 320 -500 {lab=#net1}
N 0 -550 60 -550 {lab=#net1}
N 0 -550 0 -500 {lab=#net1}
N 0 -500 60 -500 {lab=#net1}
N 60 -520 60 -500 {lab=#net1}
N 360 -750 400 -750 {lab=vip}
N 400 -750 400 -670 {lab=vip}
N 80 -950 160 -950 {lab=#net2}
N -150 -880 -80 -880 {lab=#net2}
N -80 -950 -80 -880 {lab=#net2}
N -110 -950 -80 -950 {lab=#net2}
N -150 -1020 -150 -950 {lab=VDD}
N 110 -1020 200 -1020 {lab=VDD}
N 200 -1020 200 -950 {lab=VDD}
N 600 -950 600 -920 {lab=VDD}
N -80 -950 80 -950 {lab=#net2}
N 60 -800 60 -780 {lab=#net3}
N 320 -800 320 -780 {lab=#net3}
N 320 -590 320 -580 {lab=v2}
N 600 -540 600 -350 {lab=#net1}
N 600 -590 650 -590 {lab=#net1}
N 650 -590 650 -540 {lab=#net1}
N 600 -540 650 -540 {lab=#net1}
N 600 -560 600 -540 {lab=#net1}
N 190 -480 320 -480 {lab=#net1}
N 270 -750 320 -750 {lab=VDD}
N 270 -1020 270 -750 {lab=VDD}
N 60 -750 110 -750 {lab=VDD}
N 110 -1020 110 -750 {lab=VDD}
N -150 -1020 110 -1020 {lab=VDD}
N 270 -1020 600 -1020 {lab=VDD}
N 210 -1020 270 -1020 {lab=VDD}
N 600 -890 660 -890 {lab=VDD}
N 660 -950 660 -890 {lab=VDD}
N 600 -950 660 -950 {lab=VDD}
N 600 -1020 600 -950 {lab=VDD}
N 210 -1050 210 -1020 {lab=VDD}
N 200 -1020 210 -1020 {lab=VDD}
N -540 -950 -540 -930 {lab=vin}
N -540 -870 -540 -850 {lab=GND}
N -640 -980 -640 -960 {lab=vip}
N -640 -900 -640 -880 {lab=GND}
N 600 -860 600 -740 {lab=vout1}
N 320 -590 560 -590 {lab=v2}
N 600 -740 600 -730 {lab=vout1}
N 600 -670 600 -620 {lab=#net4}
N 320 -720 320 -700 {lab=#net5}
N 320 -640 320 -590 {lab=v2}
N 60 -720 60 -690 {lab=#net6}
N 60 -630 60 -610 {lab=v1}
N 60 -610 140 -610 {lab=v1}
N 200 -800 320 -800 {lab=#net3}
N 200 -920 200 -880 {lab=#net7}
N 200 -820 200 -800 {lab=#net3}
N 60 -800 200 -800 {lab=#net3}
N 600 -740 940 -740 {lab=vout1}
N 80 -890 560 -890 {lab=#net2}
N 80 -950 80 -890 {lab=#net2}
N -320 -750 20 -750 {lab=vin}
N -360 -670 400 -670 {lab=vip}
N -150 -410 -150 -350 {lab=#net1}
N -220 -410 -190 -410 {lab=#net8}
N -290 -350 -150 -350 {lab=#net1}
N -220 -460 -220 -410 {lab=#net8}
N -250 -410 -220 -410 {lab=#net8}
N -290 -460 -220 -460 {lab=#net8}
N -290 -540 -290 -460 {lab=#net8}
N -290 -460 -290 -440 {lab=#net8}
N -290 -620 -290 -600 {lab=VDD}
N -290 -410 -290 -350 {lab=#net1}
N -150 -880 -150 -440 {lab=#net2}
N -150 -920 -150 -880 {lab=#net2}
N 190 -290 190 -270 {lab=GND}
N 190 -350 600 -350 {lab=#net1}
N 190 -480 190 -350 {lab=#net1}
N 60 -480 190 -480 {lab=#net1}
N -150 -350 190 -350 {lab=#net1}
C {vsource.sym} 220 -1290 0 0 {name=VDD value=3.3 savecurrent=false}
C {gnd.sym} 220 -1240 0 0 {name=l1 lab=GND}
C {vdd.sym} 220 -1340 0 0 {name=l4 lab=VDD}
C {sg13g2_pr/sg13_hv_pmos.sym} -130 -950 0 1 {name=M4
l=3.8u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 180 -950 0 0 {name=M1
l=0.8u
w=5u
ng=1
m=5
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 580 -890 0 0 {name=M2
l=0.4u
w=5u
ng=1
m=6
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 340 -750 0 1 {name=M3
l=0.8u
w=10u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 40 -750 0 0 {name=M5
l=0.8u
w=10u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 300 -550 0 0 {name=M10
l=5u
w=8u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 80 -550 0 1 {name=M11
l=5u
w=8u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 580 -590 0 0 {name=M12
l=0.45u
w=2u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} 190 -270 0 0 {name=l3 lab=GND}
C {vdd.sym} 210 -1050 0 0 {name=l6 lab=VDD}
C {vsource.sym} -540 -900 0 0 {name=vin value="1.5" savecurrent=false}
C {gnd.sym} -540 -850 0 0 {name=l12 lab=GND}
C {lab_pin.sym} -540 -950 0 0 {name=p9 sig_type=std_logic lab=vin}
C {lab_pin.sym} -640 -980 0 0 {name=p14 sig_type=std_logic lab=vip }
C {vsource.sym} -640 -930 0 0 {name=vip value="0" savecurrent=false}
C {gnd.sym} -640 -880 0 0 {name=l13 lab=GND}
C {ammeter.sym} 190 -320 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {lab_pin.sym} 140 -610 0 1 {name=p2 sig_type=std_logic lab=v1}
C {lab_pin.sym} 320 -610 0 0 {name=p5 sig_type=std_logic lab=v2}
C {ammeter.sym} 320 -670 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {ammeter.sym} 60 -660 0 0 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {ammeter.sym} 600 -700 0 0 {name=Vmeas3 savecurrent=true spice_ignore=0}
C {ammeter.sym} 200 -850 0 0 {name=Vmeas4 savecurrent=true spice_ignore=0}
C {code_shown.sym} -235 -1350 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {code_shown.sym} 290 -1340 0 0 {name=SPICE1 only_toplevel=false 
value="
.control
 save all
op
//dc vin 0 1.2 0.001
//plot vin vout
dc vip 0 3.3 0.001
plot vip vout1
write towstageOTA_DC_2026.raw 
.endc
"
}
C {lab_pin.sym} 940 -740 1 0 {name=p4 sig_type=std_logic lab=vout1}
C {lab_pin.sym} -360 -670 0 0 {name=p1 sig_type=std_logic lab=vip }
C {lab_pin.sym} -320 -750 0 0 {name=p3 sig_type=std_logic lab=vin}
C {isource.sym} -290 -570 0 0 {name=I1 value=1u}
C {sg13g2_pr/sg13_hv_nmos.sym} -170 -410 0 0 {name=M9
l=10u
w=4u
ng=1
m=3
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -270 -410 0 1 {name=M6
l=10u
w=4u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {vdd.sym} -290 -620 0 0 {name=l10 lab=VDD}
