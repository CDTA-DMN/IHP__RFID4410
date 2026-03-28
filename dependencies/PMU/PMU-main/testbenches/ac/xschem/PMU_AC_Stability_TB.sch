v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Ctrl-Click to execute launcher} -520 -460 0 0 0.3 0.3 {layer=11}
N -960 -630 -960 -590 {lab=VSS}
N -1060 -580 -1060 -570 {lab=#net1}
N -1130 -580 -1060 -580 {lab=#net1}
N -1060 -510 -1060 -490 {lab=VSS}
N -850 -630 -850 -590 {lab=VDD}
N -610 -350 -610 -330 {lab=V_Bais}
N -860 -220 -840 -220 {lab=VFB}
N -390 -260 -300 -260 {lab=Vout}
N -610 -200 -610 -120 {lab=VFB}
N -860 -120 -610 -120 {lab=VFB}
N -880 -220 -860 -220 {lab=VFB}
N -640 -150 -530 -150 {lab=VSS}
N -1220 -500 -1220 -410 {lab=V_Bais}
N -1130 -200 -1130 -180 {lab=VSS}
N -860 -220 -860 -120 {lab=VFB}
N -880 -320 -840 -320 {lab=V_Ref}
N -880 -320 -880 -310 {lab=V_Ref}
N -1010 -320 -880 -320 {lab=V_Ref}
N -880 -250 -880 -220 {lab=VFB}
N -910 -220 -880 -220 {lab=VFB}
N -880 -340 -880 -320 {lab=V_Ref}
N -1240 -410 -1220 -410 {lab=V_Bais}
N -1240 -410 -1240 -320 {lab=V_Bais}
N -390 -260 -390 -220 {lab=Vout}
N -510 -260 -390 -260 {lab=Vout}
N -390 -160 -390 -140 {lab=GND}
N -300 -160 -300 -140 {lab=GND}
N -300 -260 -300 -220 {lab=Vout}
N -300 -300 -300 -260 {lab=Vout}
C {gnd.sym} -850 -530 0 0 {name=l2 lab=GND
}
C {vsource.sym} -850 -560 0 0 {name=VDD value=\{VDD\}
}
C {lab_pin.sym} -850 -630 0 0 {name=p1 sig_type=std_logic lab=VDD
}
C {gnd.sym} -300 -140 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -300 -300 0 1 {name=p11 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -1060 -490 2 1 {name=p18 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -1220 -630 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -700 -380 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {ammeter.sym} -1060 -540 0 1 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {gnd.sym} -960 -530 0 0 {name=l3 lab=GND}
C {vsource.sym} -960 -560 0 0 {name=VSS value=0}
C {lab_pin.sym} -960 -630 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {capa.sym} -300 -190 0 0 {name=C1
m=1
value=\{CL\}
footprint=1206
device="ceramic capacitor"}
C {code_shown.sym} -610 -610 0 0 {name=MODELS1 only_toplevel=false value="
** IHP MODELS
	.lib cornerMOShv.lib mos_tt
	.lib cornerRES.lib res_typ
	.lib cornerCAP.lib cap_typ
"
}
C {lab_pin.sym} -910 -220 2 1 {name=p5 sig_type=std_logic lab=VFB}
C {res.sym} -390 -190 0 0 {name=R7
value=\{Rload\}
footprint=1206
device=resistor
m=1
}
C {gnd.sym} -390 -140 0 0 {name=l10 lab=GND}
C {1u_Ref.sym} -1150 -480 0 0 {name=x3}
C {LDO_NMOS_1V2.sym} -600 -260 0 0 {name=x1}
C {lab_pin.sym} -530 -150 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -960 -320 1 0 {name=p13 sig_type=std_logic lab=V_Ref
}
C {lab_pin.sym} -1130 -380 0 0 {name=p3 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -1130 -180 2 1 {name=p9 sig_type=std_logic lab=VSS}
C {ammeter.sym} -670 -150 3 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} -1130 -230 0 1 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {/foss/designs/bgr/BGR_I_ZTAT.sym} -1070 -310 0 0 {name=x2}
C {lab_pin.sym} -1220 -470 0 1 {name=p7 sig_type=std_logic lab=V_Bais
}
C {code.sym} -770 -610 0 0 {name=SPICE_AC
only_toplevel=false 
value="
.include LDO_AC_Stability_TB.save
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

	ac dec 100 1 1g
	let G_P = db(Vout)
	let PH_P = 180*cph(Vout)/Pi
	plot G_P PH_P
	meas ac UBW when G_P = 0
	meas ac Phase FIND PH_P at=UBW
	meas ac Gain FIND G_P at=1


write LDO_AC_Stability_TB.raw
.endc
"
}
C {vsource.sym} -880 -370 2 1 {name=VSS1 value="0 ac 1"
lab="0 ac 1"}
C {vsource.sym} -880 -280 2 0 {name=VSS2 value="0 ac 1"
lab="0 ac 1"}
C {gnd.sym} -880 -400 2 0 {name=l6 lab=GND}
C {launcher.sym} -470 -410 0 0 {name=h3
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
C {lab_pin.sym} -610 -350 0 1 {name=p4 sig_type=std_logic lab=V_Bais
}
