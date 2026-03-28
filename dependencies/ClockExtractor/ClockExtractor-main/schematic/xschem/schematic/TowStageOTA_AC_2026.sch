v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -1000 -1320 -1000 -1300 {lab=vip}
N -1000 -1240 -1000 -1220 {lab=GND}
N -1100 -780 -1100 -680 {lab=GND}
N -1170 -700 -1170 -680 {lab=GND}
N -1170 -920 -1170 -760 {lab=#net1}
N -1170 -920 -1100 -920 {lab=#net1}
N -910 -1080 -810 -1080 {lab=vout}
N -910 -1080 -910 -1050 {lab=vout}
N -910 -990 -910 -910 {lab=GND}
N -1080 -1310 -1080 -1290 {lab=VDD}
N -1080 -1230 -1080 -1210 {lab=GND}
N -1770 -950 -1630 -950 {lab=#net2}
N -1810 -950 -1770 -950 {lab=#net2}
N -1850 -1250 -1710 -1250 {lab=#net3}
N -1710 -1250 -1590 -1250 {lab=#net3}
N -1550 -1150 -1510 -1150 {lab=vip}
N -1830 -1350 -1750 -1350 {lab=#net4}
N -2030 -1280 -2030 -970 {lab=#net4}
N -2030 -1420 -2030 -1350 {lab=VDD}
N -1750 -1420 -1710 -1420 {lab=VDD}
N -1710 -1420 -1710 -1350 {lab=VDD}
N -1830 -1350 -1830 -1290 {lab=#net4}
N -1850 -1250 -1850 -1180 {lab=#net3}
N -1590 -1250 -1590 -1180 {lab=#net3}
N -1590 -990 -1590 -980 {lab=#net5}
N -1650 -880 -1590 -880 {lab=#net6}
N -1710 -1320 -1710 -1250 {lab=#net3}
N -1830 -1290 -1350 -1290 {lab=#net4}
N -1640 -1150 -1590 -1150 {lab=VDD}
N -1640 -1420 -1640 -1150 {lab=VDD}
N -1850 -1150 -1800 -1150 {lab=VDD}
N -1800 -1420 -1800 -1150 {lab=VDD}
N -1640 -1420 -1310 -1420 {lab=VDD}
N -1310 -1420 -1310 -1290 {lab=VDD}
N -1590 -1120 -1590 -990 {lab=#net5}
N -1590 -880 -1310 -880 {lab=#net6}
N -1750 -1450 -1750 -1420 {lab=VDD}
N -1710 -1420 -1640 -1420 {lab=VDD}
N -1930 -1150 -1890 -1150 {lab=#net1}
N -1650 -880 -1650 -850 {lab=#net6}
N -1650 -790 -1650 -760 {lab=GND}
N -1310 -1080 -1310 -1020 {lab=vout}
N -1930 -1230 -1930 -1150 {lab=#net1}
N -1170 -1230 -1170 -920 {lab=#net1}
N -1930 -1230 -1170 -1230 {lab=#net1}
N -1100 -1080 -910 -1080 {lab=vout}
N -1310 -1260 -1310 -1080 {lab=vout}
N -1100 -920 -1100 -840 {lab=#net1}
N -1100 -960 -1100 -920 {lab=#net1}
N -1100 -1080 -1100 -1020 {lab=vout}
N -1310 -1080 -1100 -1080 {lab=vout}
N -2030 -940 -2030 -880 {lab=#net6}
N -1850 -950 -1850 -880 {lab=#net6}
N -1590 -950 -1590 -880 {lab=#net6}
N -1310 -990 -1310 -880 {lab=#net6}
N -2100 -940 -2070 -940 {lab=#net7}
N -2170 -880 -2030 -880 {lab=#net6}
N -2100 -990 -2100 -940 {lab=#net7}
N -2130 -940 -2100 -940 {lab=#net7}
N -2170 -990 -2100 -990 {lab=#net7}
N -2170 -1070 -2170 -990 {lab=#net7}
N -2170 -990 -2170 -970 {lab=#net7}
N -2170 -1150 -2170 -1130 {lab=VDD}
N -2170 -940 -2170 -880 {lab=#net6}
N -1590 -990 -1350 -990 {lab=#net5}
N -1850 -880 -1650 -880 {lab=#net6}
N -1850 -1040 -1850 -980 {lab=#net2}
N -1850 -1120 -1850 -1040 {lab=#net2}
N -2030 -1280 -1960 -1280 {lab=#net4}
N -2030 -1320 -2030 -1280 {lab=#net4}
N -1960 -1350 -1960 -1280 {lab=#net4}
N -1990 -1350 -1960 -1350 {lab=#net4}
N -1830 -1290 -1830 -1280 {lab=#net4}
N -1800 -1420 -1750 -1420 {lab=VDD}
N -1770 -1040 -1770 -950 {lab=#net2}
N -1850 -1040 -1770 -1040 {lab=#net2}
N -2030 -1420 -1800 -1420 {lab=VDD}
N -1960 -1280 -1830 -1280 {lab=#net4}
N -2030 -880 -1850 -880 {lab=#net6}
C {vsource.sym} -1000 -1270 0 0 {name=vip value="dc 0.9 ac 0" savecurrent=false}
C {gnd.sym} -1000 -1220 0 0 {name=l1 lab=GND}
C {code_shown.sym} -1125 -1450 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
"}
C {lab_pin.sym} -810 -1080 2 0 {name=p3 sig_type=std_logic lab=vout}
C {capa.sym} -1100 -810 0 0 {name=C2
m=1
value=10GF
footprint=1206
device="ceramic capacitor"}
C {res.sym} -1100 -990 0 0 {name=R1
value=10G
footprint=1206
device=resistor
m=1}
C {gnd.sym} -1100 -680 0 0 {name=l14 lab=GND}
C {vsource.sym} -1170 -730 0 0 {name=vin- value="0.9 ac 1" savecurrent=false}
C {gnd.sym} -1170 -680 0 0 {name=l15 lab=GND}
C {capa.sym} -910 -1020 0 0 {name=C1
m=1
value=0.1p
footprint=1206
device="ceramic capacitor"
}
C {gnd.sym} -910 -910 0 0 {name=l2 lab=GND
}
C {vsource.sym} -1080 -1260 0 0 {name=VDD value=3.3 savecurrent=false}
C {gnd.sym} -1080 -1210 0 0 {name=l3 lab=GND}
C {vdd.sym} -1080 -1310 0 0 {name=l5 lab=VDD}
C {sg13g2_pr/sg13_hv_pmos.sym} -2010 -1350 0 1 {name=M4
l=1.5u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1730 -1350 0 0 {name=M1
l=1.5u
w=2u
ng=1
m=6
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1330 -1290 0 0 {name=M2
l=1.5u
w=2u
ng=1
m=6
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1570 -1150 0 1 {name=M3
l=1u
w=4.5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1870 -1150 0 0 {name=M5
l=1u
w=4.5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1610 -950 0 0 {name=M10
l=0.8u
w=1.2u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1830 -950 0 1 {name=M11
l=0.8u
w=1.2u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1330 -990 0 0 {name=M12
l=0.8u
w=1.2u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {isource.sym} -2170 -1100 0 0 {name=I0 value=1u}
C {gnd.sym} -1650 -760 0 0 {name=l6 lab=GND}
C {vdd.sym} -1750 -1450 0 0 {name=l10 lab=VDD}
C {lab_pin.sym} -1510 -1150 0 1 {name=p5 sig_type=std_logic lab=vip}
C {ammeter.sym} -1650 -820 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {lab_pin.sym} -1000 -1320 0 0 {name=p1 sig_type=std_logic lab=vip}
C {sg13g2_pr/sg13_hv_nmos.sym} -2050 -940 0 0 {name=M6
l=10u
w=3u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -2150 -940 0 1 {name=M7
l=10u
w=3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {vdd.sym} -2170 -1150 0 0 {name=l4 lab=VDD}
C {code_shown.sym} -740 -1410 0 0 {name=TowStageOTA_AC_2026 only_toplevel=true 
value=
"
.param temp=27
.control
save all 
op
ac dec 100 1 2G
let gain_db = db(v(vout))
let phase = ph(v(vout))*180/pi
meas ac dc_gain find vdb(vout) at=1
 meas ac gain_at_13_56MHz find vdb(vout) at=13.56meg
  let 3dB_gain = dc_gain - 3
  meas ac bandwidth when vdb(vout)=3dB_gain fall=1
 print dc_gain 
 print 3dB_gain
 print bandwidth

 meas ac unity_freq when gain_db=0
 meas ac phase_at_unity find phase at=unity_freq
 let phase_margin = 180 - phase_at_unity

 print unity_freq 
 print phase_margin 
 
 print gain_at_13_56MHz


 plot db(v(vout))
 plot cph(v(vout))*180/pi

write TowStageOTA_AC_2026.raw
.endc
"
}
