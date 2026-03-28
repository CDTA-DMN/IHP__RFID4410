v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Ctrl-Click to execute launcher} -560 -400 0 0 0.3 0.3 {layer=11}
N -410 -260 -410 -220 {lab=Vout}
N -950 -570 -950 -530 {lab=VSS}
N -1030 -510 -1030 -500 {lab=#net1}
N -1100 -510 -1030 -510 {lab=#net1}
N -1030 -440 -1030 -420 {lab=VSS}
N -840 -570 -840 -530 {lab=VDD}
N -610 -350 -610 -330 {lab=V_Bais}
N -860 -220 -840 -220 {lab=VFB}
N -610 -200 -610 -120 {lab=VFB}
N -860 -120 -610 -120 {lab=VFB}
N -910 -220 -860 -220 {lab=VFB}
N -640 -150 -530 -150 {lab=VSS}
N -1190 -430 -1190 -400 {lab=V_Bais}
N -310 -290 -310 -260 {lab=Vout}
N -860 -220 -860 -120 {lab=VFB}
N -990 -320 -840 -320 {lab=V_Ref}
N -320 -260 -310 -260 {lab=Vout}
N -510 -260 -410 -260 {lab=Vout}
N -320 -260 -320 -220 {lab=Vout}
N -410 -260 -320 -260 {lab=Vout}
N -1110 -200 -1110 -170 {lab=VSS}
C {gnd.sym} -840 -470 0 0 {name=l2 lab=GND
}
C {vsource.sym} -840 -500 0 0 {name=VDD value=\{VDD\}
}
C {code_shown.sym} -560 -540 0 0 {name=MODELS only_toplevel=false value="

** IHP MODELS

.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ

"
}
C {lab_pin.sym} -840 -570 0 0 {name=p1 sig_type=std_logic lab=VDD
}
C {gnd.sym} -410 -160 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -310 -290 0 1 {name=p11 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -1030 -420 2 1 {name=p18 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -1190 -400 0 0 {name=p20 sig_type=std_logic lab=V_Bais
}
C {lab_pin.sym} -1190 -560 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -610 -350 2 1 {name=p6 sig_type=std_logic lab=V_Bais}
C {lab_pin.sym} -700 -380 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {ammeter.sym} -1030 -470 0 1 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {gnd.sym} -950 -470 0 0 {name=l3 lab=GND}
C {vsource.sym} -950 -500 0 0 {name=VSS value=0}
C {lab_pin.sym} -950 -570 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {capa.sym} -410 -190 0 0 {name=C1
m=1
value=\{CL\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -910 -220 2 1 {name=p5 sig_type=std_logic lab=VFB}
C {LDO_NMOS_1V2.sym} -600 -260 0 0 {name=x1}
C {lab_pin.sym} -530 -150 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -900 -320 3 1 {name=p13 sig_type=std_logic lab=V_Ref
}
C {lab_pin.sym} -1110 -380 0 0 {name=p3 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -1110 -170 2 1 {name=p9 sig_type=std_logic lab=VSS
}
C {ammeter.sym} -670 -150 3 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} -1110 -230 0 1 {name=Vmeas1 savecurrent=true }
C {/foss/designs/bgr/BGR_I_ZTAT.sym} -1050 -310 0 0 {name=x2
}
C {lab_pin.sym} -1220 -320 0 0 {name=p7 sig_type=std_logic lab=V_Bais
}
C {1u_Ref.sym} -1120 -410 0 0 {name=x3
}
C {code.sym} -730 -540 0 0 {name=NGSPICE_MC_DC only_toplevel=true 
value="
.options rshunt = 1e12
.options gmin=1e-12
.include LDO_OP_TB.save
.param temp=27
.save all
.param CL=100p
.param Rload=6k
.param VDD = 3

.control
op
write PMU_OP_TB.raw 
.endc

"
           
}
C {gnd.sym} -320 -160 0 0 {name=l1 lab=GND}
C {res.sym} -320 -190 0 0 {name=R7
value=\{Rload\}
footprint=1206
device=resistor
m=1
}
C {devices/launcher.sym} -500 -320 0 0 {name=h1
descr="OP annotate" 
tclcommand="xschem annotate_op"
}
C {launcher.sym} -500 -350 0 0 {name=h3
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
