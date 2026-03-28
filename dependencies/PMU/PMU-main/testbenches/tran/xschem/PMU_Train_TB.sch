v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -80 -640 720 -240 {flags=graph
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=10u
divx=5
subdivx=1
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
color=4
node=vout
y2=1.35
y1=1.06
sim_type=tran}
B 2 -80 -240 720 160 {flags=graph,unlocked
y1=35u
y2=40u
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=0
divx=5
subdivx=4
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
mode=Line
rainbow=1
digital=0
autoload=1
legend=1
sim_type=tran
x2=10u
color=7
node=i(vss)}
T {Ctrl-Click to execute launcher} -500 -570 0 0 0.3 0.3 {layer=11}
N -380 -260 -380 -220 {lab=Vout}
N -350 -90 -350 -50 {lab=VSS}
N -740 -530 -740 -520 {lab=#net1}
N -810 -530 -740 -530 {lab=#net1}
N -740 -460 -740 -440 {lab=VSS}
N -610 -580 -610 -540 {lab=VDD}
N -490 -350 -490 -330 {lab=V_Bais}
N -740 -220 -720 -220 {lab=VFB}
N -490 -200 -490 -120 {lab=VFB}
N -740 -120 -490 -120 {lab=VFB}
N -790 -220 -740 -220 {lab=VFB}
N -900 -450 -900 -420 {lab=V_Bais}
N -270 -290 -270 -260 {lab=Vout}
N -740 -220 -740 -120 {lab=VFB}
N -520 -150 -470 -150 {lab=VSS}
N -320 -260 -270 -260 {lab=Vout}
N -740 -320 -720 -320 {lab=V_Ref}
N -390 -260 -380 -260 {lab=Vout}
N -320 -260 -320 -220 {lab=Vout}
N -380 -260 -320 -260 {lab=Vout}
C {gnd.sym} -610 -480 0 0 {name=l2 lab=GND
}
C {vsource.sym} -610 -510 0 0 {name=VDD value=\{VDD\}
}
C {lab_pin.sym} -610 -580 0 0 {name=p1 sig_type=std_logic lab=VDD
}
C {gnd.sym} -380 -160 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -270 -290 0 1 {name=p11 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -740 -440 2 1 {name=p18 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -900 -420 0 0 {name=p20 sig_type=std_logic lab=V_Bais
}
C {lab_pin.sym} -900 -580 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -490 -350 2 0 {name=p6 sig_type=std_logic lab=V_Bais}
C {lab_pin.sym} -580 -380 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {ammeter.sym} -740 -490 0 1 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {gnd.sym} -350 10 0 0 {name=l3 lab=GND}
C {vsource.sym} -350 -20 0 0 {name=VSS value=0}
C {lab_pin.sym} -350 -90 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {capa.sym} -380 -190 0 0 {name=C1
m=1
value=\{CL\}
footprint=1206
device="ceramic capacitor"}
C {code_shown.sym} -730 -40 0 0 {name=MODELS1 only_toplevel=false value="

** IHP MODELS

.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
"
}
C {lab_pin.sym} -790 -220 2 1 {name=p5 sig_type=std_logic lab=VFB}
C {code.sym} -950 -40 0 0 {name=SPICE_Train
only_toplevel=false 
value="
.options rshunt = 1e12
.options gmin=1e-12
.include LDO_DC_TB.save
.save all
.param temp = 27
.param CL = 100p
.param VDD = 2.5
.control

	tran 1n 10u
	write LDO_Train_TB.raw
.endc
"
}
C {LDO_NMOS_1V2.sym} -480 -260 0 0 {name=x1}
C {lab_pin.sym} -470 -150 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -730 -320 3 1 {name=p13 sig_type=std_logic lab=V_Ref
}
C {lab_pin.sym} -860 -380 0 0 {name=p3 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -860 -200 2 1 {name=p9 sig_type=std_logic lab=VSS
}
C {ammeter.sym} -550 -150 3 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} -860 -230 0 1 {name=Vmeas1 savecurrent=true }
C {/foss/designs/bgr/BGR_I_ZTAT.sym} -800 -310 0 0 {name=x2
}
C {lab_pin.sym} -970 -320 3 0 {name=p7 sig_type=std_logic lab=V_Bais
}
C {1u_Ref.sym} -830 -430 0 0 {name=x3
}
C {lab_pin.sym} -140 -630 0 1 {name=p4 sig_type=std_logic lab=Vout}
C {isource.sym} -320 -190 0 0 {name=I0 value="pulse(5u 500u 100n 100n 100n 5u 10u)"}
C {launcher.sym} -450 -520 0 0 {name=h3
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
C {devices/launcher.sym} -450 -470 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/LDO_Train_TB.raw tran"
}
C {gnd.sym} -320 -160 0 0 {name=l1 lab=GND}
