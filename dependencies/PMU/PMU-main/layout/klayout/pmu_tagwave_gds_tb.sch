v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -170 -140 -170 -120 {lab=VSS}
N -170 -60 -170 -30 {lab=GND}
N -10 -60 -10 -30 {lab=VSS}
N -10 -140 -10 -120 {lab=IOVDD}
N -50 60 -50 80 {lab=VDD}
N -50 140 -50 160 {lab=VSS}
N -100 330 -100 360 {lab=VSS}
N -100 240 -100 270 {lab=Vbg}
N 310 80 340 80 {}
N 310 100 340 100 {}
N 310 120 340 120 {}
N 310 140 340 140 {}
N 310 160 340 160 {}
N 310 180 340 180 {}
C {code_shown.sym} 560 -70 0 0 {name=s1 only_toplevel=false value="

//.option rshunt=1e9
.control
 save all
 tran 50n 10u
 plot VDD IOVDD

.endc


"}
C {simulator_commands_shown.sym} -740 -280 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
"
      }
C {vsource.sym} -10 -90 0 0 {name=VIO value="sin(3 0.2 13.5MEG)" savecurrent=false}
C {vsource.sym} -170 -90 0 0 {name=V3 value=0 savecurrent=false}
C {lab_pin.sym} -170 -140 0 0 {name=p10 lab=VSS}
C {gnd.sym} -170 -30 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -10 -30 0 0 {name=p12 lab=VSS}
C {lab_pin.sym} -10 -140 0 1 {name=p13 lab=IOVDD}
C {capa-2.sym} -50 110 0 0 {name=C1
m=1
value=100p
footprint=1206
device=polarized_capacitor}
C {lab_pin.sym} -50 60 0 0 {name=p7 lab=VDD}
C {lab_pin.sym} -50 160 0 0 {name=p16 lab=VSS}
C {simulator_commands_shown.sym} -790 70 0 0 {
name=Libs_Ngspice1
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/gds/Brahim/LDO/pmu_tagwave.spice

"
      }
C {lab_pin.sym} -100 360 0 0 {name=p11 lab=VSS}
C {lab_pin.sym} -100 240 0 0 {name=p17 lab=Vbg}
C {sg13g2_pr/cap_cmim.sym} -100 300 0 0 {name=C3
model=cap_cmim
w=40e-6
l=40e-6
m=1
spiceprefix=X}
C {/foss/designs/auto_gen_sym/pmu_tagwave.sym} 360 70 0 0 {name=X1}
C {lab_pin.sym} 310 80 0 0 {name=p1 lab=VR}
C {lab_pin.sym} 310 100 0 0 {name=p2 lab=VFB}
C {lab_pin.sym} 310 120 0 0 {name=p3 lab=Vbg}
C {lab_pin.sym} 310 140 0 0 {name=p4 lab=VDD}
C {lab_pin.sym} 310 160 0 0 {name=p5 lab=VSS}
C {lab_pin.sym} 310 180 0 0 {name=p6 lab=IOVDD}
