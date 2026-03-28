v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -970 -730 -970 -700 {lab=v1}
N -890 -730 -890 -670 {lab=v1}
N -890 -670 -750 -670 {lab=v1}
N -930 -670 -890 -670 {lab=v1}
N -670 -870 -630 -870 {lab=vin_P}
N -630 -870 -630 -790 {lab=vin_P}
N -950 -1070 -870 -1070 {lab=#net1}
N -1110 -1040 -1110 -1000 {lab=#net1}
N -1110 -1000 -1040 -1000 {lab=#net1}
N -1040 -1070 -1040 -1000 {lab=#net1}
N -1070 -1070 -1040 -1070 {lab=#net1}
N -1110 -1140 -1110 -1070 {lab=VDD}
N -970 -920 -970 -900 {lab=#net2}
N -710 -920 -710 -900 {lab=#net2}
N -710 -710 -710 -700 {lab=v2}
N -760 -870 -710 -870 {lab=VDD}
N -760 -1140 -760 -870 {lab=VDD}
N -970 -870 -920 -870 {lab=VDD}
N -760 -1140 -430 -1140 {lab=VDD}
N -710 -600 -430 -600 {lab=#net3}
N -710 -600 -710 -570 {lab=#net3}
N -710 -510 -710 -480 {lab=VSS}
N -430 -790 -430 -740 {lab=#net4}
N -710 -840 -710 -820 {lab=#net5}
N -710 -760 -710 -710 {lab=v2}
N -970 -840 -970 -810 {lab=#net6}
N -970 -750 -970 -730 {lab=v1}
N -970 -730 -890 -730 {lab=v1}
N -830 -920 -710 -920 {lab=#net2}
N -830 -1040 -830 -1000 {lab=#net7}
N -830 -940 -830 -920 {lab=#net2}
N -970 -920 -830 -920 {lab=#net2}
N -950 -1010 -470 -1010 {lab=#net1}
N -950 -1070 -950 -1010 {lab=#net1}
N -50 -1000 -30 -1000 {lab=vout1}
N -50 -790 -30 -790 {lab=vout1}
N -50 -900 -50 -790 {lab=vout1}
N -970 -670 -970 -600 {lab=#net3}
N -1270 -720 -1270 -680 {lab=v_bm}
N -1110 -600 -970 -600 {lab=#net3}
N -830 -1140 -760 -1140 {lab=VDD}
N -1040 -1070 -950 -1070 {lab=#net1}
N -1200 -650 -1150 -650 {lab=v_bm}
N -1270 -720 -1200 -720 {lab=v_bm}
N -1270 -750 -1270 -720 {lab=v_bm}
N -1200 -720 -1200 -650 {lab=v_bm}
N -1230 -650 -1200 -650 {lab=v_bm}
N -1110 -1000 -1110 -940 {lab=#net1}
N -1270 -650 -1270 -600 {lab=#net3}
N -430 -900 -430 -850 {lab=vout}
N -270 -900 -270 -830 {lab=vout}
N -970 -600 -710 -600 {lab=#net3}
N -1110 -880 -1110 -680 {lab=#net8}
N -1110 -650 -1110 -600 {lab=#net3}
N -1270 -600 -1110 -600 {lab=#net3}
N -710 -670 -710 -600 {lab=#net3}
N -430 -710 -430 -600 {lab=#net3}
N 10 -790 10 -600 {lab=#net3}
N -920 -1140 -920 -870 {lab=VDD}
N -830 -1140 -830 -1070 {lab=VDD}
N -920 -1140 -830 -1140 {lab=VDD}
N -1110 -1140 -920 -1140 {lab=VDD}
N -230 -900 -230 -860 {lab=vout1}
N -430 -980 -430 -900 {lab=vout}
N -270 -990 -270 -900 {lab=vout}
N -1510 -790 -630 -790 {lab=vin_P}
N -710 -710 -470 -710 {lab=v2}
N -430 -900 -270 -900 {lab=vout}
N -230 -790 -230 -600 {lab=#net3}
N -230 -830 -180 -830 {lab=#net3}
N -180 -830 -180 -790 {lab=#net3}
N -230 -790 -180 -790 {lab=#net3}
N -230 -800 -230 -790 {lab=#net3}
N -430 -1140 -430 -1010 {lab=VDD}
N 10 -880 10 -820 {lab=vclk}
N 10 -880 90 -880 {lab=vclk}
N 10 -970 10 -880 {lab=vclk}
N -50 -1000 -50 -900 {lab=vout1}
N -230 -900 -50 -900 {lab=vout1}
N -230 -960 -230 -900 {lab=vout1}
N -430 -600 -230 -600 {lab=#net3}
N -230 -600 10 -600 {lab=#net3}
N -1510 -870 -1010 -870 {lab=vin_N}
N -230 -1140 -230 -990 {lab=vdd_1v2}
N -110 -1140 10 -1140 {lab=vdd_1v2}
N 10 -1140 10 -1000 {lab=vdd_1v2}
N -110 -1200 -110 -1140 {lab=vdd_1v2}
N -230 -1140 -110 -1140 {lab=vdd_1v2}
N -830 -1200 -830 -1140 {lab=VDD}
C {sg13g2_pr/sg13_hv_nmos.sym} -250 -830 0 0 {name=M7
l=0.45u
w=1.05u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -250 -990 0 0 {name=M6
l=0.4u
w=1.43u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -330 -900 1 0 {name=p7 sig_type=std_logic lab=vout
}
C {lab_pin.sym} -160 -900 1 0 {name=p1 sig_type=std_logic lab=vout1
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1090 -1070 0 1 {name=M4
l=1.5u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -850 -1070 0 0 {name=M1
l=1.5u
w=2u
ng=1
m=6
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -450 -1010 0 0 {name=M2
l=1.5u
w=2u
ng=1
m=6
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -690 -870 0 1 {name=M3
l=1u
w=4.5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -990 -870 0 0 {name=M5
l=1u
w=4.5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -730 -670 0 0 {name=M10
l=0.8u
w=1.2u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -950 -670 0 1 {name=M11
l=0.8u
w=1.2u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -450 -710 0 0 {name=M12
l=0.8u
w=1.2u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {ammeter.sym} -710 -540 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {lab_pin.sym} -890 -730 0 1 {name=p2 sig_type=std_logic lab=v1}
C {lab_pin.sym} -710 -730 0 0 {name=p5 sig_type=std_logic lab=v2}
C {ammeter.sym} -710 -790 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {ammeter.sym} -970 -780 0 0 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {ammeter.sym} -430 -820 0 0 {name=Vmeas3 savecurrent=true spice_ignore=0}
C {ammeter.sym} -830 -970 0 0 {name=Vmeas4 savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_lv_pmos.sym} -10 -1000 0 0 {name=M27
l=0.13u
w=1.12u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -10 -790 0 0 {name=M29
l=0.13u
w=0.74u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1130 -650 0 0 {name=M31
l=10u
w=3u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1250 -650 0 1 {name=M32
l=10u
w=3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {ammeter.sym} -1110 -910 0 0 {name=Vmeas8 savecurrent=true spice_ignore=0}
C {ipin.sym} -1510 -870 0 0 {name=p3 lab=vin_N}
C {ipin.sym} -1510 -790 0 0 {name=p4 lab=vin_P}
C {ipin.sym} -1270 -750 0 0 {name=p6 lab=v_bm}
C {iopin.sym} -830 -1200 0 0 {name=p8 lab=VDD
}
C {iopin.sym} -110 -1200 0 0 {name=p9 lab=vdd_1v2}
C {iopin.sym} -710 -480 0 0 {name=p10 lab=VSS}
C {opin.sym} 90 -880 0 0 {name=p11 lab=vclk}
