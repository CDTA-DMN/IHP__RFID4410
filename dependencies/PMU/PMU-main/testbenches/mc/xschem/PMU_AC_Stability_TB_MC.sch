v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Ctrl-Click to execute launcher} -470 -410 0 0 0.3 0.3 {layer=11}
N -295 -260 -295 -215 {lab=Vout}
N -295 -155 -295 -100 {lab=GND}
N -700 -565 -700 -525 {lab=VSS}
N -830 -530 -830 -520 {lab=#net1}
N -895 -530 -830 -530 {lab=#net1}
N -830 -460 -830 -440 {lab=VSS}
N -385 -145 -385 -100 {lab=GND}
N -385 -260 -385 -205 {lab=Vout}
N -590 -565 -590 -525 {lab=VDD}
N -605 -350 -605 -330 {lab=VP}
N -855 -220 -835 -220 {lab=VFB}
N -505 -260 -385 -260 {lab=Vout}
N -385 -260 -295 -260 {lab=Vout}
N -605 -200 -605 -120 {lab=VFB}
N -855 -120 -605 -120 {lab=VFB}
N -880 -220 -855 -220 {lab=VFB}
N -635 -150 -525 -150 {lab=VSS}
N -985 -450 -985 -415.2082395332827 {lab=VP}
N -1125 -200 -1125 -175 {lab=VSS}
N -200 -155 -200 -110 {lab=GND}
N -295 -260 -200 -260 {lab=Vout}
N -200 -260 -200 -215 {lab=Vout}
N -200 -285 -200 -260 {lab=Vout}
N -855 -220 -855 -120 {lab=VFB}
N -880 -320 -835 -320 {lab=V_Ref}
N -880 -320 -880 -305 {lab=V_Ref}
N -1005 -320 -880 -320 {lab=V_Ref}
N -880 -245 -880 -220 {lab=VFB}
N -905 -220 -880 -220 {lab=VFB}
N -880 -340 -880 -320 {lab=V_Ref}
C {gnd.sym} -590 -465 0 0 {name=l2 lab=GND
}
C {vsource.sym} -590 -495 0 0 {name=VDD value=\{VDD\}
}
C {code_shown.sym} -1195 -780 0 0 {name=MODELS only_toplevel=false value="

** IHP MODELS

.lib cornerMOShv.lib mos_tt_stat
.lib cornerRES.lib res_typ_stat
.lib cornerCAP.lib cap_typ_stat

"
}
C {lab_pin.sym} -590 -565 0 0 {name=p1 sig_type=std_logic lab=VDD
}
C {gnd.sym} -295 -100 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -200 -285 0 1 {name=p11 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -830 -440 2 1 {name=p18 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -985 -415.2082395332827 0 0 {name=p20 sig_type=std_logic lab=VP}
C {lab_pin.sym} -985 -580 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -605 -350 2 0 {name=p6 sig_type=std_logic lab=VP}
C {lab_pin.sym} -695 -380 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {ammeter.sym} -830 -490 0 1 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {gnd.sym} -700 -465 0 0 {name=l3 lab=GND}
C {vsource.sym} -700 -495 0 0 {name=VSS value=0}
C {lab_pin.sym} -700 -565 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {capa.sym} -295 -185 0 0 {name=C1
m=1
value=\{CL\}
footprint=1206
device="ceramic capacitor"}
C {code_shown.sym} -855 -780 0 0 {name=MODELS2 only_toplevel=false value="

** IHP MODELS

.lib cornerMOShv.lib mos_tt_mismatch
.lib cornerRES.lib res_typ_mismatch
.lib cornerCAP.lib cap_typ_mismatch

"
spice_ignore=true}
C {lab_pin.sym} -905 -220 2 1 {name=p5 sig_type=std_logic lab=VFB}
C {res.sym} -385 -175 0 0 {name=R7
value=\{Rload\}
footprint=1206
device=resistor
m=1
}
C {gnd.sym} -385 -100 0 0 {name=l10 lab=GND}
C {1u_Ref.sym} -915 -430 0 0 {name=x3}
C {LDO_NMOS_1V2.sym} -595 -260 0 0 {name=x1}
C {lab_pin.sym} -525 -150 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -960 -320 1 0 {name=p13 sig_type=std_logic lab=V_Ref
}
C {lab_pin.sym} -1125 -380 0 0 {name=p3 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -1125 -175 2 1 {name=p9 sig_type=std_logic lab=VSS}
C {ammeter.sym} -665 -150 3 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} -1125 -230 0 1 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {/foss/designs/bgr/BGR_I_ZTAT.sym} -1065 -310 0 0 {name=x2}
C {lab_pin.sym} -1235 -320 0 0 {name=p7 sig_type=std_logic lab=VP
}
C {isource.sym} -200 -185 0 0 {name=I0 value=100u
spice_ignore=true}
C {gnd.sym} -200 -110 0 0 {name=l1 lab=GND}
C {code.sym} -407.5 -752.5 0 0 {name=SPICE_AC
only_toplevel=false 
value="
.include LDO_DC_TB.save
.save all
.options rshunt = 1e12
.options gmin=1e-12
.options reltol = 0.01 abstol = 1p
.param temp = 27
.param CL = 100p
.param Rload = 12k
.param VDD = 3
.control

save all

	ac dec 100 1 100g
	let G_P = db(Vout)
	let PH_P = 180*cph(Vout)/Pi
	meas ac UBW when G_P = 0
	meas ac Phase FIND PH_P at=UBW
	meas ac Gain(db) FIND G_P at=1
let UBW(khz) = UBW/1000
echo results_save_begin
print UBW(khz)
print Phase
print Gain(db)
echo results_save_end
.endc
"
}
C {vsource.sym} -880 -370 2 1 {name=VSS1 value="0 ac 1"
lab="0 ac 1"}
C {vsource.sym} -880 -275 2 0 {name=VSS2 value="0 ac 1"
lab="0 ac 1"}
C {gnd.sym} -880 -400 2 0 {name=l6 lab=GND}
C {code.sym} -267.5 -742.5 0 0 {name=NGSPICE_MC_AC only_toplevel=false 
value="
.include LDO_DC_TB.save
.save all
.options rshunt = 1e12
.options gmin=1e-12
.options reltol = 0.01 abstol = 1p
.param temp = 27
.param CL = 240p
.param Rload = 6k
.param VDD = 3
.control

let mc_runs = 5
let run = 0
set curplot=new
set scratch=$curplot
setplot $scratch
let DCG=unitvec(mc_runs)
let GBW=unitvec(mc_runs)
let Phase=unitvec(mc_runs)

***************** LOOP *********************

dowhile run < mc_runs
reset
	ac dec 100 1 100g
	let G_P = db(Vout)
	let PH_P = 180*cph(Vout)/Pi
	meas ac BW when G_P = 0
	meas ac PH FIND PH_P at=BW
	meas ac Gain FIND G_P at=1
	set run=$&run
	set dt=$curplot
	setplot $scratch
	let DCG[$run]=\{$dt\}.gain
	let GBW[$run]=\{$dt\}.BW
	let Phase[$run]=\{$dt\}.PH
	setplot $dt
	reset
	let run=run+1

end
***************** LOOP *********************


wrdata LDO_NMOS_V9.csv \{$scratch\}.DCG \{$scratch\}.GBW \{$scratch\}.Phase
write LDO_NMOS_V9.raw
echo
print \{$scratch\}.DCG \{$scratch\}.GBW \{$scratch\}.Phase


.endc
"
spice_ignore=true}
C {code_shown.sym} -450 -590 0 0 {name=MC_SETTINGS
only_toplevel=false
value="
**nr_workers=1
**nr_mc_sims=1000

**results_plot_begin
**UBW(khz)
**Phase
**Gain(db)
**results_plot_end
"
}
C {launcher.sym} -420 -365 0 0 {name=h2
descr=SimulatePARALLEL
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults
puts $sim(spice,1,cmd) 

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,1,cmd) \{ngspice  \\"$N\\" -a\}

# change the simulator to be used (Xyce)
set sim(spice,default) 0

# Create FET and BIP .save file
mkdir -p $netlist_dir
write_data [save_params] $netlist_dir/[file rootname [file tail [xschem get current_name]]].save

# run netlist and simulation
xschem netlist
python3 $\{PDK_ROOT\}/$\{PDK\}/libs.tech/xschem/sg13g2_tests/ngspice_parallel_mc.py [file tail [xschem get current_name]]
"}
