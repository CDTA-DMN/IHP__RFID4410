v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1350 -300 1350 -290 {lab=v8}
N -70 110 -50 110 {lab=VDD3}
N -70 130 -50 130 {lab=VSS}
N -70 150 -50 150 {lab=V8}
N -70 170 -50 170 {lab=V7}
N -70 190 -50 190 {lab=V6}
N -70 210 -50 210 {lab=V5}
N -70 230 -50 230 {lab=V4}
N -70 250 -50 250 {lab=V3}
N -70 270 -50 270 {lab=V2}
N -70 290 -50 290 {lab=V1}
N -70 310 -50 310 {lab=S2}
N -70 330 -50 330 {lab=S1}
N -70 350 -50 350 {lab=S0}
N -70 370 -50 370 {lab=EN}
N -70 390 -50 390 {lab=VDD}
N -70 410 -50 410 {lab=Vout}
C {simulator_commands_shown.sym} -400 -180 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.include /work/layout/LDO/DFT/DFT.spice
"
     }
C {vsource.sym} 1350 -260 0 0 {name=vin value="SIN(1.5 1.5 0)" savecurrent=false}
C {vsource.sym} 230 -260 0 0 {name=vin1 value=1.8 savecurrent=false}
C {vsource.sym} 390 -260 0 0 {name=vin2 value=2.5 savecurrent=false}
C {vsource.sym} 560 -260 0 0 {name=vin3 value="pulse(0 3.3 1u 1u 1m 100m )" savecurrent=false}
C {vsource.sym} 720 -300 0 0 {name=vin4 value=1.2 savecurrent=false}
C {vsource.sym} 860 -260 0 0 {name=vin5 value=3 savecurrent=false}
C {vsource.sym} 1030 -260 0 0 {name=vin6 value=0.5 savecurrent=false}
C {vsource.sym} 1200 -260 0 0 {name=vin7 value=0.5 savecurrent=false}
C {lab_pin.sym} 230 -290 1 0 {name=p14 sig_type=std_logic lab=v1
}
C {lab_pin.sym} 390 -290 1 0 {name=p15 sig_type=std_logic lab=v2
}
C {lab_pin.sym} 560 -290 1 0 {name=p16 sig_type=std_logic lab=v3
}
C {lab_pin.sym} 720 -330 1 0 {name=p17 sig_type=std_logic lab=v4
}
C {lab_pin.sym} 860 -290 1 0 {name=p18 sig_type=std_logic lab=v5
}
C {lab_pin.sym} 1030 -290 1 0 {name=p19 sig_type=std_logic lab=v6
}
C {lab_pin.sym} 1350 -300 1 0 {name=p21 sig_type=std_logic lab=v8
}
C {gnd.sym} 1350 -230 0 0 {name=l1 lab=GND}
C {gnd.sym} 1200 -230 0 0 {name=l2 lab=GND}
C {gnd.sym} 1030 -230 0 0 {name=l3 lab=GND}
C {gnd.sym} 860 -230 0 0 {name=l4 lab=GND}
C {gnd.sym} 720 -270 0 0 {name=l5 lab=GND}
C {gnd.sym} 560 -230 0 0 {name=l6 lab=GND}
C {gnd.sym} 390 -230 0 0 {name=l7 lab=GND}
C {gnd.sym} 230 -230 0 0 {name=l8 lab=GND}
C {vsource.sym} -1190 310 0 0 {name=vin8 value=1.2 savecurrent=false}
C {vsource.sym} -1100 310 0 0 {name=vin9 value=0 savecurrent=false}
C {vsource.sym} -950 310 0 0 {name=vin10 value=0 savecurrent=false}
C {vsource.sym} -790 300 0 0 {name=vin11 value=1.2 savecurrent=false}
C {lab_pin.sym} -1190 280 1 0 {name=p22 sig_type=std_logic lab=EN}
C {lab_pin.sym} -1100 280 1 0 {name=p23 sig_type=std_logic lab=s0}
C {lab_pin.sym} -950 280 1 0 {name=p24 sig_type=std_logic lab=s1}
C {lab_pin.sym} -790 270 1 0 {name=p25 sig_type=std_logic lab=s2}
C {gnd.sym} -1190 340 0 0 {name=l9 lab=GND}
C {gnd.sym} -1100 340 0 0 {name=l10 lab=GND}
C {gnd.sym} -950 340 0 0 {name=l11 lab=GND}
C {gnd.sym} -790 330 0 0 {name=l12 lab=GND}
C {code_shown.sym} -910 -90 0 0 {name=m17 only_toplevel=false value="
.option rshunt=1e9
.control
save all
tran 0.1u 10u 
*dc vin5 0 3 0.1
plot vout v5 v3 v8
//op
//print o1 o2 o3 o4 o5 o6 o7 o8

.endc"
 




}
C {lab_pin.sym} 1200 -290 1 0 {name=p28 sig_type=std_logic lab=v7}
C {vsource.sym} 70 -260 0 0 {name=vdd value=1.2 savecurrent=false}
C {lab_pin.sym} 70 -290 1 0 {name=p29 sig_type=std_logic lab=Vdd
}
C {gnd.sym} 70 -230 0 0 {name=l14 lab=GND}
C {vsource.sym} -40 -260 0 0 {name=vss value=0 savecurrent=false}
C {lab_pin.sym} -40 -290 1 0 {name=p51 sig_type=std_logic lab=VSS
}
C {gnd.sym} -40 -230 0 0 {name=l22 lab=GND}
C {vsource.sym} -190 -260 0 0 {name=vdd3 value=3.4 savecurrent=false}
C {gnd.sym} -190 -230 0 0 {name=vdd2 lab=GND
value=3}
C {lab_pin.sym} -190 -290 1 0 {name=p52 sig_type=std_logic lab=vdd3
}
C {/work/xschem/auto_gen_sym/DFT.sym} -30 100 0 0 {name=X1}
C {lab_pin.sym} -70 110 0 0 {name=p1 lab=VDD3}
C {lab_pin.sym} -70 130 0 0 {name=p2 lab=VSS}
C {lab_pin.sym} -70 150 0 0 {name=p3 lab=V8}
C {lab_pin.sym} -70 170 0 0 {name=p4 lab=V7}
C {lab_pin.sym} -70 190 0 0 {name=p5 lab=V6}
C {lab_pin.sym} -70 210 0 0 {name=p6 lab=V5}
C {lab_pin.sym} -70 230 0 0 {name=p7 lab=V4}
C {lab_pin.sym} -70 250 0 0 {name=p8 lab=V3}
C {lab_pin.sym} -70 270 0 0 {name=p9 lab=V2}
C {lab_pin.sym} -70 290 0 0 {name=p10 lab=V1}
C {lab_pin.sym} -70 310 0 0 {name=p11 lab=S2}
C {lab_pin.sym} -70 330 0 0 {name=p12 lab=S1}
C {lab_pin.sym} -70 350 0 0 {name=p13 lab=S0}
C {lab_pin.sym} -70 370 0 0 {name=p20 lab=EN}
C {lab_pin.sym} -70 390 0 0 {name=p26 lab=VDD}
C {lab_pin.sym} -70 410 0 0 {name=p27 lab=Vout}
