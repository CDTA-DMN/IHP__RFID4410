v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -950 -60 -150 340 {flags=graph
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
dataset=-1
unitx=1
logx=1
logy=0
hilight_wave=-1
y2=90
y1=0
sim_type=ac
color=4
node=v_ldo
digital=0
rainbow=0
subdivx=8
mode=Line
x1=0
autoload=1
x2=10
divx=10}
T {Ctrl-Click to execute launcher} 80 -200 0 0 0.3 0.3 {layer=11}
N -300 -260 -300 -220 {lab=Vout}
N -300 -160 -300 -100 {lab=GND}
N 280 0 280 40 {lab=VSS}
N 130 -10 130 0 {lab=#net1}
N 60 -10 130 -10 {lab=#net1}
N 130 60 130 80 {lab=VSS}
N 280 150 280 190 {lab=VDD}
N -610 -350 -610 -330 {lab=V_Bais}
N -860 -220 -840 -220 {lab=VFB}
N -380 -260 -300 -260 {lab=Vout}
N -610 -200 -610 -120 {lab=VFB}
N -860 -120 -610 -120 {lab=VFB}
N -910 -220 -860 -220 {lab=VFB}
N -640 -150 -530 -150 {lab=VSS}
N -30 70 -30 130 {lab=V_Bais}
N -300 -260 -200 -260 {lab=Vout}
N -200 -290 -200 -260 {lab=Vout}
N -860 -220 -860 -120 {lab=VFB}
N -900 -320 -840 -320 {lab=V_BG}
N -400 -90 -380 -90 {lab=#net2}
N -380 -150 -380 -90 {lab=#net2}
N -380 -260 -380 -210 {lab=Vout}
N -510 -260 -380 -260 {lab=Vout}
N -520 -90 -460 -90 {lab=GND}
N -60 130 -60 200 {lab=V_Bais}
N -60 130 -30 130 {lab=V_Bais}
C {gnd.sym} 280 250 0 0 {name=l2 lab=GND
}
C {vsource.sym} 280 220 0 0 {name=VDD value="\{VDD\} ac 1"
}
C {code_shown.sym} -100 -350 0 0 {name=MODELS only_toplevel=false value="

** IHP MODELS

.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ

"
}
C {lab_pin.sym} 280 150 0 0 {name=p1 sig_type=std_logic lab=VDD
}
C {gnd.sym} -300 -100 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -200 -290 0 1 {name=p11 sig_type=std_logic lab=Vout}
C {lab_pin.sym} 130 80 2 1 {name=p18 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -30 100 0 0 {name=p20 sig_type=std_logic lab=V_Bais}
C {lab_pin.sym} -30 -60 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -700 -380 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {ammeter.sym} 130 30 0 1 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {gnd.sym} 280 100 0 0 {name=l3 lab=GND}
C {vsource.sym} 280 70 0 0 {name=VSS value=0}
C {lab_pin.sym} 280 0 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {capa.sym} -300 -190 0 0 {name=C1
m=1
value=\{CL\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -910 -220 2 1 {name=p5 sig_type=std_logic lab=VFB}
C {res.sym} -380 -180 0 0 {name=R7
value=\{RLoad\}
footprint=1206
device=resistor
m=1
}
C {gnd.sym} -520 -90 0 0 {name=l10 lab=GND}
C {LDO_NMOS_1V2.sym} -600 -260 0 0 {name=x1}
C {lab_pin.sym} -530 -150 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -900 -320 2 1 {name=p13 sig_type=std_logic lab=V_BG
}
C {lab_pin.sym} 50 140 0 0 {name=p3 sig_type=std_logic lab=VDD
}
C {ammeter.sym} -670 -150 3 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} 50 290 0 1 {name=Vmeas1 savecurrent=true }
C {/foss/designs/bgr/BGR_I_ZTAT.sym} 110 210 0 0 {name=x2
}
C {1u_Ref.sym} 40 90 0 0 {name=x3
}
C {lab_pin.sym} 170 200 2 0 {name=p4 sig_type=std_logic lab=V_BG
}
C {code.sym} 200 -340 0 0 {name=SPICE_AC_PSRR
only_toplevel=false 
value="
.options rshunt = 1e12
.options gmin=1e-12
.include LDO_AC_PSRR_TB.save
.save all
.param temp = 27
.param CL = 100p
.param VDD = 2.2
.param Rload = 12e3
.control

save all

ac dec 100 1 10G
	let V_LDO =  vdb(Vout)
	meas ac PSRR_LDO FIND V_LDO at=13.56e6

Write PMU_AC_PSRR_TB.raw
.endc
"
}
C {ammeter.sym} -430 -90 1 1 {name=Vmeas3 savecurrent=true spice_ignore=0}
C {lab_pin.sym} -610 -350 0 1 {name=p6 sig_type=std_logic lab=V_Bais}
C {gnd.sym} 50 320 1 1 {name=l1 lab=GND}
C {launcher.sym} 130 -150 0 0 {name=h3
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
C {devices/launcher.sym} 130 -100 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/PMU_AC_PSRR_TB.raw ac"
}
