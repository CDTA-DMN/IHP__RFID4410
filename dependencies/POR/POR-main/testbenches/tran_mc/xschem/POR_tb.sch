v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -20 -120 -20 -100 {lab=VDD}
N -20 0 -20 20 {lab=GND}
N -200 -70 -170 -70 {lab=VREF}
N -200 -30 -170 -30 {lab=VIN}
N -400 -100 -400 -80 {lab=VREF}
N -630 -110 -630 -80 {lab=VIN}
N -510 20 -510 50 {lab=VDD}
N 130 -50 170 -50 {lab=rst}
C {lab_pin.sym} 170 -50 0 1 {name=p1 sig_type=std_logic lab=rst}
C {lab_pin.sym} -20 -120 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -20 20 0 1 {name=p3 sig_type=std_logic lab=GND}
C {lab_pin.sym} -200 -70 0 0 {name=p4 sig_type=std_logic lab=VREF}
C {lab_pin.sym} -200 -30 0 0 {name=p5 sig_type=std_logic lab=VIN}
C {vsource.sym} -400 -50 0 0 {name=Vref value=0.9
savecurrent=false}
C {gnd.sym} -400 -20 0 0 {name=l4 lab=GND}
C {vsource.sym} -630 -50 0 0 {name=Vdd value="pulse(0 1.2 0 5u 10u 40u)"
savecurrent=false}
C {gnd.sym} -630 -20 0 0 {name=l9 lab=GND}
C {lab_pin.sym} -400 -100 0 1 {name=p6 sig_type=std_logic lab=VREF}
C {lab_pin.sym} -630 -110 0 0 {name=p7 sig_type=std_logic lab=VIN}
C {vsource.sym} -510 80 0 0 {name=Vdd1 value="pulse(0 1.2 0 5u 10u 40u)"
savecurrent=false}
C {gnd.sym} -510 110 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -510 20 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {code.sym} -510 -390 0 0 {name=ngspice
only_toplevel=false 
value="
.control
.save all

tran 2n 80u
plot rst vdd


.endc
"
spice_ignore=true}
C {code.sym} -650 -390 0 0 {name=Mc
only_toplevel=false 
value="
.param mm_ok=1
.param mc_ok=1
.param temp=27
.control
let mc_runs = 100
let run = 0

set curplot=new
set scratch=$curplot
setplot $scratch
***************************LOOP***************************************
dowhile run < mc_runs
save all
tran 10n 200u

set run=$&run
set ac=$curplot
setplot $scratch
let out\{$run\}=\{$ac\}.Reset
let temp\{$run\}=\{$ac\}.time
setplot $ac
reset
let run=run+1


end


************************LOOP********************************************

set nolegend
plot \{$scratch\}.all vs \{$scratch\}.temp0

.endc
"
 
 
 
 
  
 
 

spice_ignore=true}
C {code_shown.sym} -330 -405 0 0 {
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
C {/foss/designs/projet/HABIS/ip/Por/xschem/POR_symbol.sym} -20 -50 0 0 {name=x1}
