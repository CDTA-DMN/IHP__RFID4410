v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -1340 -1310 -1340 -1290 {lab=VDD}
N -1340 -1230 -1340 -1210 {lab=GND}
N -640 -1100 -640 -1080 {lab=VDD1}
N -640 -1020 -640 -1000 {lab=GND}
N -730 -720 -730 -700 {lab=GND}
N -730 -1050 -730 -970 {lab=VDD1}
N -1650 -750 -1650 -720 {lab=v1}
N -1570 -750 -1570 -690 {lab=v1}
N -1570 -690 -1430 -690 {lab=v1}
N -1610 -690 -1570 -690 {lab=v1}
N -1350 -890 -1310 -890 {lab=vip}
N -1310 -890 -1310 -810 {lab=vip}
N -1630 -1090 -1550 -1090 {lab=#net1}
N -1790 -1060 -1790 -1020 {lab=#net1}
N -1790 -1020 -1720 -1020 {lab=#net1}
N -1720 -1090 -1720 -1020 {lab=#net1}
N -1750 -1090 -1720 -1090 {lab=#net1}
N -1790 -1160 -1790 -1090 {lab=VDD}
N -1510 -1160 -1510 -1090 {lab=VDD}
N -1650 -940 -1650 -920 {lab=#net2}
N -1390 -940 -1390 -920 {lab=#net2}
N -1390 -730 -1390 -720 {lab=v2}
N -1440 -890 -1390 -890 {lab=VDD}
N -1440 -1160 -1440 -890 {lab=VDD}
N -1650 -890 -1600 -890 {lab=VDD}
N -1600 -1160 -1600 -890 {lab=VDD}
N -1440 -1160 -1110 -1160 {lab=VDD}
N -1390 -620 -1110 -620 {lab=#net3}
N -1510 -1190 -1510 -1160 {lab=VDD}
N -1510 -1160 -1440 -1160 {lab=VDD}
N -1390 -620 -1390 -590 {lab=#net3}
N -1390 -530 -1390 -500 {lab=GND}
N -1390 -730 -1150 -730 {lab=v2}
N -1110 -810 -1110 -760 {lab=#net4}
N -1390 -860 -1390 -840 {lab=#net5}
N -1390 -780 -1390 -730 {lab=v2}
N -1650 -860 -1650 -830 {lab=#net6}
N -1650 -770 -1650 -750 {lab=v1}
N -1650 -750 -1570 -750 {lab=v1}
N -1510 -940 -1390 -940 {lab=#net2}
N -1510 -1060 -1510 -1020 {lab=#net7}
N -1510 -960 -1510 -940 {lab=#net2}
N -1650 -940 -1510 -940 {lab=#net2}
N -1630 -1030 -1150 -1030 {lab=#net1}
N -1630 -1090 -1630 -1030 {lab=#net1}
N -2030 -890 -1690 -890 {lab=vin}
N -330 -1010 -310 -1010 {lab=vout1}
N -330 -800 -310 -800 {lab=vout1}
N -330 -890 -330 -800 {lab=vout1}
N -330 -1010 -330 -890 {lab=vout1}
N -2070 -810 -1310 -810 {lab=vip}
N -270 -670 -270 -650 {lab=GND}
N -270 -1060 -270 -1010 {lab=VDD2}
N -730 -890 -730 -840 {lab=vout1}
N -730 -940 -730 -890 {lab=vout1}
N -380 -1140 -380 -1120 {lab=VDD2}
N -380 -1060 -380 -1040 {lab=GND}
N -1650 -690 -1650 -620 {lab=#net3}
N -1950 -740 -1950 -700 {lab=#net8}
N -1790 -620 -1650 -620 {lab=#net3}
N -1600 -1160 -1510 -1160 {lab=VDD}
N -1790 -1160 -1600 -1160 {lab=VDD}
N -1720 -1090 -1630 -1090 {lab=#net1}
N -1880 -670 -1830 -670 {lab=#net8}
N -1950 -740 -1880 -740 {lab=#net8}
N -1950 -770 -1950 -740 {lab=#net8}
N -1880 -740 -1880 -670 {lab=#net8}
N -1910 -670 -1880 -670 {lab=#net8}
N -1790 -1020 -1790 -960 {lab=#net1}
N -1950 -670 -1950 -620 {lab=#net3}
N -1950 -860 -1950 -830 {lab=VDD}
N -770 -880 -770 -810 {lab=vout}
N -1110 -880 -1110 -870 {lab=vout}
N -1110 -880 -770 -880 {lab=vout}
N -1110 -1000 -1110 -880 {lab=vout}
N -770 -970 -770 -880 {lab=vout}
N -1650 -620 -1390 -620 {lab=#net3}
N -1790 -900 -1790 -700 {lab=#net9}
N -1790 -670 -1790 -620 {lab=#net3}
N -1950 -620 -1790 -620 {lab=#net3}
N -270 -980 -270 -830 {lab=vclk}
N -1390 -690 -1390 -620 {lab=#net3}
N -1110 -730 -1110 -620 {lab=#net3}
N -730 -810 -730 -780 {lab=#net10}
N -730 -890 -330 -890 {lab=vout1}
N -1110 -1160 -1110 -1030 {lab=VDD}
N -270 -800 -270 -730 {lab=#net11}
C {code_shown.sym} -1925 -1330 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
.lib cornerMOSlv.lib mos_tt
"}
C {code.sym} -1610 -1370 0 0 {name=NGSPICE_OP1 only_toplevel=true 
value="
.param temp=27
//.include clock_extraactor_op_2026.save
//.save all 
//.save @n.xm1.nsg13_hv_pmos
.control
save all
op 

save @n.xm1.nsg13_hv_pmos[gm]
save @n.xm1.nsg13_hv_pmos[vds]
save @n.xm1.nsg13_hv_pmos[vth]
save @n.xm1.nsg13_hv_pmos[vgs]
save @n.xm1.nsg13_hv_pmos[ids]
save @n.xm1.nsg13_hv_pmos[gds]
save @n.xm1.nsg13_hv_pmos[cgg]
save @n.xm1.nsg13_hv_pmos[cgd]
save @n.xm1.nsg13_hv_pmos[vsat]

print @n.xm1.nsg13_hv_pmos[ids]
print @n.xm1.nsg13_hv_pmos[gds]
print @n.xm1.nsg13_hv_pmos[gm]
print @n.xm1.nsg13_hv_pmos[vds]
print @n.xm1.nsg13_hv_pmos[vth]
print @n.xm1.nsg13_hv_pmos[vsat]
print @n.xm1.nsg13_hv_pmos[vgs]
print @n.xm1.nsg13_hv_pmos[cgg]
print @n.xm1.nsg13_hv_pmos[cgd]

save @n.xm4.nsg13_hv_pmos[gm]
save @n.xm4.nsg13_hv_pmos[vds]
save @n.xm4.nsg13_hv_pmos[vgs]
save @n.xm4.nsg13_hv_pmos[vth]
save @n.xm4.nsg13_hv_pmos[ids]
save @n.xm4.nsg13_hv_pmos[gds]
save @n.xm4.nsg13_hv_pmos[cgg]
save @n.xm4.nsg13_hv_pmos[vsat]
save @n.xm4.nsg13_hv_pmos[cgd]

print @n.xm4.nsg13_hv_pmos[ids]
print @n.xm4.nsg13_hv_pmos[gds]
print @n.xm4.nsg13_hv_pmos[gm]
print @n.xm4.nsg13_hv_pmos[vds]
print @n.xm4.nsg13_hv_pmos[vth]
print @n.xm4.nsg13_hv_pmos[vsat]
print @n.xm4.nsg13_hv_pmos[vgs]
print @n.xm4.nsg13_hv_pmos[cgg]
print @n.xm4.nsg13_hv_pmos[cgd]

save @n.xm2.nsg13_hv_pmos[gm]
save @n.xm2.nsg13_hv_pmos[vdss]
save @n.xm2.nsg13_hv_pmos[vgs]
save @n.xm2.nsg13_hv_pmos[vth]
save @n.xm2.nsg13_hv_pmos[ids]
save @n.xm2.nsg13_hv_pmos[gds]
save @n.xm2.nsg13_hv_pmos[cgg]
save @n.xm2.nsg13_hv_pmos[vsat]
save @n.xm2.nsg13_hv_pmos[cgd]

print @n.xm2.nsg13_hv_pmos[ids]
print @n.xm2.nsg13_hv_pmos[gds]
print @n.xm2.nsg13_hv_pmos[gm]
print @n.xm2.nsg13_hv_pmos[vds]
print @n.xm2.nsg13_hv_pmos[vth]
print @n.xm2.nsg13_hv_pmos[vsat]
print @n.xm2.nsg13_hv_pmos[vgs]
print @n.xm2.nsg13_hv_pmos[cgg]
print @n.xm2.nsg13_hv_pmos[cgd]


save @n.xm5.nsg13_hv_pmos[gm]
save @n.xm5.nsg13_hv_pmos[vds]
save @n.xm5.nsg13_hv_pmos[vth]
save @n.xm5.nsg13_hv_pmos[vgs]
save @n.xm5.nsg13_hv_pmos[ids]
save @n.xm5.nsg13_hv_pmos[gds]
save @n.xm5.nsg13_hv_pmos[cgg]
save @n.xm5.nsg13_hv_pmos[cgd]
save @n.xm5.nsg13_hv_pmos[vsat]

print @n.xm5.nsg13_hv_pmos[ids]
print @n.xm5.nsg13_hv_pmos[gds]
print @n.xm5.nsg13_hv_pmos[gm]
print @n.xm5.nsg13_hv_pmos[vds]
print @n.xm5.nsg13_hv_pmos[vth]
print @n.xm5.nsg13_hv_pmos[vsat]
print @n.xm5.nsg13_hv_pmos[vgs]
print @n.xm5.nsg13_hv_pmos[cgg]
print @n.xm5.nsg13_hv_pmos[cgd]

save @n.xm11.nsg13_hv_nmos[gm]
save @n.xm11.nsg13_hv_nmos[vds]
save @n.xm11.nsg13_hv_nmos[vgs]
save @n.xm11.nsg13_hv_nmos[vth]
save @n.xm11.nsg13_hv_nmos[ids]
save @n.xm11.nsg13_hv_nmos[gds]
save @n.xm11.nsg13_hv_nmos[cgg]
save @n.xm11.nsg13_hv_nmos[vsat]
save @n.xm11.nsg13_hv_nmos[cgd]

print @n.xm11.nsg13_hv_nmos[ids]
print @n.xm11.nsg13_hv_nmos[gds]
print @n.xm11.nsg13_hv_nmos[gm]
print @n.xm11.nsg13_hv_nmos[vds]
print @n.xm11.nsg13_hv_nmos[vth]
print @n.xm11.nsg13_hv_nmos[vsat]
print @n.xm11.nsg13_hv_nmos[vgs]
print @n.xm11.nsg13_hv_nmos[cgg]
print @n.xm11.nsg13_hv_nmos[cgd]

save @n.xm12.nsg13_hv_nmos[gm]
save @n.xm12.nsg13_hv_nmos[vds]
save @n.xm12.nsg13_hv_nmos[vgs]
save @n.xm12.nsg13_hv_nmos[vth]
save @n.xm12.nsg13_hv_nmos[ids]
save @n.xm12.nsg13_hv_nmos[gds]
save @n.xm12.nsg13_hv_nmos[cgg]
save @n.xm12.nsg13_hv_nmos[vsat]
save @n.xm12.nsg13_hv_nmos[cgd]

print @n.xm12.nsg13_hv_nmos[ids]
print @n.xm12.nsg13_hv_nmos[gds]
print @n.xm12.nsg13_hv_nmos[gm]
print @n.xm12.nsg13_hv_nmos[vds]
print @n.xm12.nsg13_hv_nmos[vth]
print @n.xm12.nsg13_hv_nmos[vsat]
print @n.xm12.nsg13_hv_nmos[vgs]
print @n.xm12.nsg13_hv_nmos[cgg]
print @n.xm12.nsg13_hv_nmos[cgd]

save @n.xm6.nsg13_hv_pmos[gm]
save @n.xm6.nsg13_hv_pmos[vds]
save @n.xm6.nsg13_hv_pmos[vgs]
save @n.xm6.nsg13_hv_pmos[vth]
save @n.xm6.nsg13_hv_pmos[ids]
save @n.xm6.nsg13_hv_pmos[gds]
save @n.xm6.nsg13_hv_pmos[cgg]
save @n.xm6.nsg13_hv_pmos[vsat]
save @n.xm6.nsg13_hv_pmos[cgd]

print @n.xm6.nsg13_hv_pmos[ids]
print @n.xm6.nsg13_hv_pmos[gds]
print @n.xm6.nsg13_hv_pmos[gm]
print @n.xm6.nsg13_hv_pmos[vds]
print @n.xm6.nsg13_hv_pmos[vth]
print @n.xm6.nsg13_hv_pmos[vsat]
print @n.xm6.nsg13_hv_pmos[vgs]
print @n.xm6.nsg13_hv_pmos[cgg]
print @n.xm6.nsg13_hv_pmos[cgd]


save @n.xm7.nsg13_hv_nmos[gm]
save @n.xm7.nsg13_hv_nmos[vds]
save @n.xm7.nsg13_hv_nmos[vgs]
save @n.xm7.nsg13_hv_nmos[vth]
save @n.xm7.nsg13_hv_nmos[ids]
save @n.xm7.nsg13_hv_nmos[gds]
save @n.xm7.nsg13_hv_nmos[cgg]
save @n.xm7.nsg13_hv_nmos[vsat]
save @n.xm7.nsg13_hv_nmos[cgd]

print @n.xm7.nsg13_hv_nmos[ids]
print @n.xm7.nsg13_hv_nmos[gds]
print @n.xm7.nsg13_hv_nmos[gm]
print @n.xm7.nsg13_hv_nmos[vds]
print @n.xm7.nsg13_hv_nmos[vth]
print @n.xm7.nsg13_hv_nmos[vsat]
print @n.xm7.nsg13_hv_nmos[vgs]
print @n.xm7.nsg13_hv_nmos[cgg]
print @n.xm7.nsg13_hv_nmos[cgd]

save @n.xm29.nsg13_lv_nmos[gm]
save @n.xm29.nsg13_lv_nmos[vds]
save @n.xm29.nsg13_lv_nmos[vgs]
save @n.xm29.nsg13_lv_nmos[vth]
save @n.xm29.nsg13_lv_nmos[ids]
save @n.xm29.nsg13_lv_nmos[gds]
save @n.xm29.nsg13_lv_nmos[cgg]
save @n.xm29.nsg13_lv_nmos[cgd]
save @n.xm29.nsg13_lv_nmos[vsat]

print @n.xm29.nsg13_lv_nmos[ids]
print @n.xm29.nsg13_lv_nmos[gds]
print @n.xm29.nsg13_lv_nmos[gm]
print @n.xm29.nsg13_lv_nmos[vds]
print @n.xm29.nsg13_lv_nmos[vth]
print @n.xm29.nsg13_lv_nmos[vsat]
print @n.xm29.nsg13_lv_nmos[vgs]
print @n.xm29.nsg13_lv_nmos[cgg]
print @n.xm29.nsg13_lv_nmos[cgd]

save @n.xm27.nsg13_lv_pmos[gm]
save @n.xm27.nsg13_lv_pmos[vds]
save @n.xm27.nsg13_lv_pmos[vgs]
save @n.xm27.nsg13_lv_pmos[vth]
save @n.xm27.nsg13_lv_pmos[ids]
save @n.xm27.nsg13_lv_pmos[gds]
save @n.xm27.nsg13_lv_pmos[cgg]
save @n.xm27.nsg13_lv_pmos[cgd]
save @n.xm27.nsg13_lv_pmos[vsat]

print @n.xm27.nsg13_lv_pmos[ids]
print @n.xm27.nsg13_lv_pmos[gds]
print @n.xm27.nsg13_lv_pmos[gm]
print @n.xm27.nsg13_lv_pmos[vds]
print @n.xm27.nsg13_lv_pmos[vth]
print @n.xm27.nsg13_lv_pmos[vsat]
print @n.xm27.nsg13_lv_pmos[vgs]
print @n.xm27.nsg13_lv_pmos[cgg]
print @n.xm27.nsg13_lv_pmos[cgd]

write clock_extraactor_op_2026.raw 
.endc
"}
C {vsource.sym} -1340 -1260 0 0 {name=VDD value=2.5 savecurrent=false}
C {gnd.sym} -1340 -1210 0 0 {name=l1 lab=GND}
C {vdd.sym} -1340 -1310 0 0 {name=l4 lab=VDD}
C {vsource.sym} -640 -1050 0 0 {name=VDD1 value=1.2 savecurrent=false}
C {gnd.sym} -640 -1000 0 0 {name=l7 lab=GND}
C {vdd.sym} -640 -1100 0 0 {name=l8 lab=VDD1}
C {sg13g2_pr/sg13_hv_nmos.sym} -750 -810 0 0 {name=M7
l=0.45u
w=1.05u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -750 -970 0 0 {name=M6
l=0.4u
w=1.43u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {ammeter.sym} -730 -750 0 0 {name=Vmeas6 savecurrent=true }
C {lab_pin.sym} -840 -880 1 0 {name=p7 sig_type=std_logic lab=vout}
C {vdd.sym} -730 -1050 0 0 {name=l10 lab=VDD1}
C {lab_pin.sym} -450 -890 1 0 {name=p1 sig_type=std_logic lab=vout1}
C {sg13g2_pr/sg13_hv_pmos.sym} -1770 -1090 0 1 {name=M4
l=1.5u
w=4u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1530 -1090 0 0 {name=M1
l=1.5u
w=5u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1130 -1030 0 0 {name=M2
l=1.5u
w=5u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1370 -890 0 1 {name=M3
l=1u
w=4.5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1670 -890 0 0 {name=M5
l=1u
w=4.5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1410 -690 0 0 {name=M10
l=0.75u
w=2.15u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1630 -690 0 1 {name=M11
l=0.75u
w=2.15u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1130 -730 0 0 {name=M12
l=0.75u
w=2.15u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} -1390 -500 0 0 {name=l3 lab=GND}
C {vdd.sym} -1510 -1190 0 0 {name=l6 lab=VDD}
C {ammeter.sym} -1390 -560 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {lab_pin.sym} -1570 -750 0 1 {name=p2 sig_type=std_logic lab=v1}
C {lab_pin.sym} -1390 -750 0 0 {name=p5 sig_type=std_logic lab=v2}
C {ammeter.sym} -1390 -810 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {ammeter.sym} -1650 -800 0 0 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {ammeter.sym} -1110 -840 0 0 {name=Vmeas3 savecurrent=true spice_ignore=0}
C {ammeter.sym} -1510 -990 0 0 {name=Vmeas4 savecurrent=true spice_ignore=0}
C {lab_pin.sym} -270 -910 0 1 {name=p16 sig_type=std_logic lab=vclk}
C {ammeter.sym} -270 -700 0 0 {name=Vmeas5 savecurrent=true spice_ignore=0}
C {vdd.sym} -270 -1060 0 0 {name=l16 lab=VDD2}
C {gnd.sym} -730 -700 0 0 {name=l20 lab=GND
}
C {sg13g2_pr/sg13_lv_pmos.sym} -290 -1010 0 0 {name=M27
l=0.13u
w=1.12u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -290 -800 0 0 {name=M29
l=0.13u
w=0.74u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {vsource.sym} -380 -1090 0 0 {name=VDD2 value=1.2 savecurrent=false}
C {gnd.sym} -380 -1040 0 0 {name=l2 lab=GND}
C {vdd.sym} -380 -1140 0 0 {name=l15 lab=VDD2}
C {gnd.sym} -270 -650 0 0 {name=l19 lab=GND}
C {sg13g2_pr/sg13_hv_nmos.sym} -1810 -670 0 0 {name=M31
l=10u
w=3u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1930 -670 0 1 {name=M32
l=10u
w=3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {vdd.sym} -1950 -860 0 0 {name=l5 lab=VDD
}
C {ammeter.sym} -1790 -930 0 0 {name=Vmeas8 savecurrent=true spice_ignore=0}
C {isource.sym} -1950 -800 0 0 {name=I0 value=1u}
C {vsource.sym} -2210 -920 0 0 {name=vin value=1.25 savecurrent=false}
C {lab_pin.sym} -2030 -890 0 0 {name=p3 sig_type=std_logic lab=vin}
C {lab_pin.sym} -2070 -810 0 0 {name=p4 sig_type=std_logic lab=vip}
C {lab_pin.sym} -2210 -950 0 0 {name=p6 sig_type=std_logic lab=vin}
C {gnd.sym} -2210 -890 0 0 {name=l9 lab=GND}
C {vsource.sym} -2190 -790 0 0 {name=vip value=1.25 savecurrent=false}
C {lab_pin.sym} -2190 -820 0 0 {name=p8 sig_type=std_logic lab=vip}
C {gnd.sym} -2190 -760 0 0 {name=l11 lab=GND}
