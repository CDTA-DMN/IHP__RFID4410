v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Ctrl-Click to execute launcher} -530 -540 0 0 0.3 0.3 {layer=11}
N -295 -260 -295 -215 {lab=Vout}
N -295 -155 -295 -100 {lab=GND}
N -840 -555 -840 -515 {lab=VSS}
N -1030 -520 -1030 -510 {lab=#net1}
N -1095 -520 -1030 -520 {lab=#net1}
N -1030 -450 -1030 -430 {lab=VSS}
N -385 -145 -385 -100 {lab=GND}
N -385 -260 -385 -205 {lab=Vout}
N -730 -555 -730 -515 {lab=VDD}
N -605 -350 -605 -330 {lab=VP}
N -855 -220 -835 -220 {lab=VFB}
N -505 -260 -385 -260 {lab=Vout}
N -385 -260 -295 -260 {lab=Vout}
N -605 -200 -605 -120 {lab=VFB}
N -855 -120 -605 -120 {lab=VFB}
N -880 -220 -855 -220 {lab=VFB}
N -635 -150 -525 -150 {lab=VSS}
N -1185 -440 -1185 -405.2082395332827 {lab=VP}
N -1125 -200 -1125 -175 {lab=VSS}
N -295 -260 -200 -260 {lab=Vout}
N -200 -285 -200 -260 {lab=Vout}
N -855 -220 -855 -120 {lab=VFB}
N -880 -320 -835 -320 {lab=V_Ref}
N -880 -320 -880 -305 {lab=V_Ref}
N -1005 -320 -880 -320 {lab=V_Ref}
N -880 -245 -880 -220 {lab=VFB}
N -905 -220 -880 -220 {lab=VFB}
N -880 -340 -880 -320 {lab=V_Ref}
C {gnd.sym} -730 -455 0 0 {name=l2 lab=GND
}
C {vsource.sym} -730 -485 0 0 {name=VDD value=\{VDD\}
}
C {lab_pin.sym} -730 -555 0 0 {name=p1 sig_type=std_logic lab=VDD
}
C {gnd.sym} -295 -100 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -200 -285 0 1 {name=p11 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -1030 -430 2 1 {name=p18 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -1185 -405.2082395332827 0 0 {name=p20 sig_type=std_logic lab=VP}
C {lab_pin.sym} -1185 -570 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -605 -350 2 0 {name=p6 sig_type=std_logic lab=VP}
C {lab_pin.sym} -695 -380 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {ammeter.sym} -1030 -480 0 1 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {gnd.sym} -840 -455 0 0 {name=l3 lab=GND}
C {vsource.sym} -840 -485 0 0 {name=VSS value=0}
C {lab_pin.sym} -840 -555 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {capa.sym} -295 -185 0 0 {name=C1
m=1
value=\{CL\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -905 -220 2 1 {name=p5 sig_type=std_logic lab=VFB}
C {res.sym} -385 -175 0 0 {name=R7
value=\{Rload\}
footprint=1206
device=resistor
m=1
}
C {gnd.sym} -385 -100 0 0 {name=l10 lab=GND}
C {1u_Ref.sym} -1115 -420 0 0 {name=x3}
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
C {vsource.sym} -880 -370 2 1 {name=VSS1 value="0 ac 1"
lab="0 ac 1"}
C {vsource.sym} -880 -275 2 0 {name=VSS2 value="0 ac 1"
lab="0 ac 1"}
C {gnd.sym} -880 -400 2 0 {name=l6 lab=GND}
C {launcher.sym} -480 -500 0 0 {name=h3
descr=SimulateNGSPICE
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
simulate
"}
C {code.sym} -500 -430 0 0 {name=SPICE_AC_Stability_Corners only_toplevel=false value="
.save all
.options rshunt = 1e12
.options gmin=1e-12
.options reltol=0.01 abstol=1p
.param temp = 0
.param VDD = 2.2
.param CL=100p
.param Rload=2.4k

.option filetype=ascii
.control
set appendwrite
  let run_n = 0
  let run_t = 0
  let run_v = 0
  let run_c = 0
  let run_r = 0

  let TM = 0
  let VL = 2.2
  let CLL = 50p
  let RL = 2.4k
let mc_runs = 16
let run = 0
set curplot=new
set scratch=$curplot
setplot $scratch

let BW=unitvec(mc_runs)
let Gain=unitvec(mc_runs)
let Phase=unitvec(mc_runs)

let PS=unitvec(mc_runs)
let Tem=unitvec(mc_runs) 
let Capa=unitvec(mc_runs) 
let Res=unitvec(mc_runs) 
dowhile run < mc_runs
reset
	dowhile run_r < 2 
	alterparam RLoad=\{$&RL\}
	reset
	dowhile run_c < 2 
	alterparam CL=\{$&CLL\}
	reset
	dowhile run_v < 2 
	alterparam VDD=\{$&VL\}
	reset
	dowhile run_t < 2 
	alterparam temp=\{$&TM\}
	reset


		ac dec 100 1 1g
		let G_P = db(Vout)
		let PH_P = 180*cph(Vout)/Pi
		meas ac UBW when G_P = 0
		meas ac PM FIND PH_P at=UBW
		meas ac G FIND G_P at=1

		set run=$&run
		set dt=$curplot
		setplot $scratch

		let BW[$run]=\{$dt\}.UBW
		let Gain[$run]=\{$dt\}.G
		let Phase[$run]=\{$dt\}.PM
		let PS[$run]=\{$dt\}.VL
		let Tem[$run]=\{$dt\}.TM
		let Capa[$run]=\{$dt\}.CLL
		let Res[$run]=\{$dt\}.RL
		setplot $dt	
		let run = run + 1

	let run_t = run_t + 1
	let TM = 85
	end
	let TM = 0
	let run_t = 0

	let run_v = run_v + 1
	let VL = 3.3
	end
	let run_v = 0
	let VL = 2.2

	let run_c = run_c + 1
	let CLL = 150p
	end
	let run_c = 0
	let CLL = 50p

	let run_r = run_r + 1
	let RL = 240k
	end
	let run_r = 0
	let  RL = 2.4k
end

wrdata PMU_AC_Stability_TB_Corners.csv \{$scratch\}.BW \{$scratch\}.Gain \{$scratch\}.Phase \{$scratch\}.PS \{$scratch\}.Tem \{$scratch\}.Capa \{$scratch\}.Res
write PMU_AC_Stability_TB_Corners.raw
echo
print \{$scratch\}.BW \{$scratch\}.Gain \{$scratch\}.Phase \{$scratch\}.PS \{$scratch\}.Tem \{$scratch\}.Capa \{$scratch\}.Res
unset appendwrite
.endc
"
}
C {code_shown.sym} -1270 -100 0 0 {name=MODELS only_toplevel=false value="

** IHP MODELS

.lib cornerMOShv.lib mos_ss ** Four combination: ff-fs-sf-ss
.lib cornerRES.lib res_wcs ** Tow combination: bcs-wcs
.lib cornerCAP.lib cap_wcs ** Tow combination: bcs-wcs
"
}
