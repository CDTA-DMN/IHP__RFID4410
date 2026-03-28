v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -1270 -980 -470 -580 {flags=graph
y1=0
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=-0.495
x2=2.805
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color="4 7"
node="v_ref
vout"}
B 2 -470 -980 330 -580 {flags=graph
y1=0
y2=50u
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=-0.495
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color=6
node=i(vss)
x2=2.805}
T {Ctrl-Click to execute launcher} 40 -570 0 0 0.3 0.3 {layer=11}
N -180 -510 -180 -500 {lab=#net1}
N -250 -510 -180 -510 {lab=#net1}
N -180 -440 -180 -420 {lab=VSS}
N -660 -530 -660 -510 {lab=V_Bais}
N -910 -400 -890 -400 {lab=VFB}
N -660 -380 -660 -300 {lab=VFB}
N -910 -300 -660 -300 {lab=VFB}
N -960 -400 -910 -400 {lab=VFB}
N -340 -430 -340 -400 {lab=V_Bais}
N -910 -400 -910 -300 {lab=VFB}
N -950 -500 -890 -500 {lab=V_Ref}
N -580 -300 -560 -300 {lab=#net2}
N -560 -360 -560 -300 {lab=#net2}
N -1070 -380 -1070 -350 {lab=VSS}
N -560 -440 -560 -420 {lab=Vout}
N -480 -440 -480 -420 {lab=Vout}
N -560 -440 -480 -440 {lab=Vout}
N -560 -300 -480 -300 {lab=#net2}
N -480 -360 -480 -300 {lab=#net2}
N -480 -490 -480 -440 {lab=Vout}
C {gnd.sym} -220 -320 0 0 {name=l2 lab=GND
}
C {vsource.sym} -220 -350 0 0 {name=VDD value=\{VDD\}
}
C {lab_pin.sym} -220 -380 0 0 {name=p1 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -480 -490 0 1 {name=p11 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -180 -420 2 1 {name=p18 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -340 -400 0 0 {name=p20 sig_type=std_logic lab=V_Bais}
C {lab_pin.sym} -290 -560 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -660 -530 2 0 {name=p6 sig_type=std_logic lab=V_Bais}
C {lab_pin.sym} -700 -560 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {ammeter.sym} -180 -470 0 1 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {gnd.sym} -290 -320 0 0 {name=l3 lab=GND}
C {vsource.sym} -290 -350 0 0 {name=VSS value=0}
C {lab_pin.sym} -290 -380 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {capa.sym} -480 -390 0 0 {name=C1
m=1
value=\{CL\}
footprint=1206
device="ceramic capacitor"}
C {code_shown.sym} -50 -390 0 0 {name=MODELS1 only_toplevel=false value="
** IHP MODELS
	.lib cornerMOShv.lib mos_tt
	.lib cornerRES.lib res_typ
	.lib cornerCAP.lib cap_typ
"
}
C {lab_pin.sym} -960 -400 2 1 {name=p5 sig_type=std_logic lab=VFB}
C {res.sym} -560 -390 0 0 {name=R7
value=\{Rload\}
footprint=1206
device=resistor
m=1
}
C {gnd.sym} -640 -300 1 1 {name=l10 lab=GND}
C {code.sym} -150 -550 0 0 {name=SPICE_DC
only_toplevel=false 
value="
.include LDO_DC_TB.save
.save all
.options rshunt = 1e12
.options gmin=1e-12
.options reltol = 0.01 abstol = 1p
.param temp = 27
.param CL = 100p
.param Rload = 2.4e3
.param VDD = 3
.control

save all
dc VDD 0 3.3 0.01
write LDO_DC_TB.raw
.endc
"
}
C {LDO_NMOS_1V2.sym} -650 -440 0 0 {name=x1}
C {lab_pin.sym} -690 -330 3 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -920 -500 3 1 {name=p13 sig_type=std_logic lab=V_Ref
}
C {lab_pin.sym} -1020 -560 0 0 {name=p3 sig_type=std_logic lab=VDD
}
C {ammeter.sym} -720 -330 3 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} -1070 -410 0 1 {name=Vmeas1 savecurrent=true }
C {/foss/designs/bgr/BGR_I_ZTAT.sym} -1010 -490 0 0 {name=x2
}
C {lab_pin.sym} -1180 -500 0 0 {name=p7 sig_type=std_logic lab=V_Bais
}
C {1u_Ref.sym} -270 -410 0 0 {name=x3
}
C {ammeter.sym} -610 -300 1 1 {name=Vmeas3 savecurrent=true spice_ignore=0}
C {lab_pin.sym} -1070 -350 2 0 {name=p4 sig_type=std_logic lab=VSS}
C {devices/launcher.sym} 80 -470 0 0 {name=h5
descr="Load Curve" 
tclcommand="xschem raw_read $netlist_dir/LDO_DC_TB.raw dc"
}
C {launcher.sym} 80 -520 0 0 {name=h3
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
