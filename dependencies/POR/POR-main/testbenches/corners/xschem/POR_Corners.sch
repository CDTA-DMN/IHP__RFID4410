v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 580 60 580 80 {lab=VDD}
N 580 180 580 200 {lab=GND}
N 400 110 430 110 {lab=VREF}
N 400 150 430 150 {lab=VIN}
N 200 80 200 100 {lab=VREF}
N -30 70 -30 100 {lab=VIN}
N 90 200 90 230 {lab=VDD}
N 730 130 770 130 {lab=rst}
C {lab_pin.sym} 770 130 0 1 {name=p1 sig_type=std_logic lab=rst}
C {lab_pin.sym} 580 60 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 580 200 0 1 {name=p3 sig_type=std_logic lab=GND}
C {lab_pin.sym} 400 110 0 0 {name=p4 sig_type=std_logic lab=VREF}
C {lab_pin.sym} 400 150 0 0 {name=p5 sig_type=std_logic lab=VIN}
C {vsource.sym} 200 130 0 0 {name=Vref value=0.9
savecurrent=false}
C {gnd.sym} 200 160 0 0 {name=l4 lab=GND}
C {vsource.sym} -30 130 0 0 {name=Vdd value="pulse(0 1.2 0 5u 10u 40u)"
savecurrent=false}
C {gnd.sym} -30 160 0 0 {name=l9 lab=GND}
C {lab_pin.sym} 200 80 0 1 {name=p6 sig_type=std_logic lab=VREF}
C {lab_pin.sym} -30 70 0 0 {name=p7 sig_type=std_logic lab=VIN}
C {vsource.sym} 90 260 0 0 {name=Vdd1 value="pulse(0 1.2 0 5u 10u 40u)"
savecurrent=false}
C {gnd.sym} 90 290 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 90 200 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {code.sym} 50 -230 0 0 {name=ngspice
only_toplevel=false 
value="
.control
.save all

tran 2n 80u
plot rst vdd


.endc
"
}
C {code.sym} -120 -230 0 0 {name=corner_tt
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
C {/foss/designs/projet/HABIS/ip/Por/xschem/POR_symbol.sym} 580 130 0 0 {name=x1}
C {code.sym} -280 -230 0 0 {name=corner_ff
only_toplevel=true
value="
** IHP models
.lib cornerMOSlv.lib mos_ff

.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.include sg13g2_stdcell.spice
"
      spice_ignore=true}
C {code.sym} -440 -230 0 0 {name=corner_ss
only_toplevel=true
value="
** IHP models
.lib cornerMOSlv.lib mos_ss

.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.include sg13g2_stdcell.spice
"
      spice_ignore=true}
C {code.sym} -600 -230 0 0 {name=corner_sf
only_toplevel=true
value="
** IHP models
.lib cornerMOSlv.lib mos_sf

.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.include sg13g2_stdcell.spice
"
      spice_ignore=true}
C {code.sym} -760 -230 0 0 {name=corner_fs
only_toplevel=true
value="
** IHP models
.lib cornerMOSlv.lib mos_fs

.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.include sg13g2_stdcell.spice
"
      spice_ignore=true}
