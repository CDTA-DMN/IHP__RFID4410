v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Ctrl-Click to execute launcher} -490 -370 0 0 0.3 0.3 {layer=11}
N -300 -260 -300 -220 {lab=Vout}
N -940 -570 -940 -530 {lab=VSS}
N -1000 -520 -1000 -510 {lab=#net1}
N -1070 -520 -1000 -520 {lab=#net1}
N -1000 -450 -1000 -430 {lab=VSS}
N -860 -570 -860 -530 {lab=VDD}
N -610 -350 -610 -330 {lab=V_Bais}
N -860 -220 -840 -220 {lab=VFB}
N -610 -200 -610 -120 {lab=VFB}
N -860 -120 -610 -120 {lab=VFB}
N -910 -220 -860 -220 {lab=VFB}
N -1160 -440 -1160 -410 {lab=V_Bais}
N -300 -260 -200 -260 {lab=Vout}
N -200 -290 -200 -260 {lab=Vout}
N -860 -220 -860 -120 {lab=VFB}
N -900 -320 -840 -320 {lab=V_Ref}
N -400 -120 -380 -120 {lab=#net2}
N -380 -260 -300 -260 {lab=Vout}
N -520 -120 -460 -120 {lab=GND}
N -1060 -150 -1060 -120 {lab=VSS}
N -380 -260 -380 -220 {lab=Vout}
N -510 -260 -380 -260 {lab=Vout}
N -380 -160 -380 -120 {lab=#net2}
N -380 -120 -300 -120 {lab=#net2}
N -300 -160 -300 -120 {lab=#net2}
N -900 -320 -900 -270 {lab=V_Ref}
N -630 -130 -600 -130 {lab=VSS}
N -700 -130 -690 -130 {lab=#net3}
N -700 -150 -700 -130 {lab=#net3}
N -940 -270 -900 -270 {lab=V_Ref}
C {gnd.sym} -860 -470 0 0 {name=l2 lab=GND
}
C {vsource.sym} -860 -500 0 0 {name=VDD value=\{VDD\}
}
C {code_shown.sym} -810 -550 0 0 {name=MODELS only_toplevel=false value="
** IHP MODELS
	.lib cornerMOShv.lib mos_tt_stat
	.lib cornerRES.lib res_typ_stat
	.lib cornerCAP.lib cap_typ_stat
"
}
C {lab_pin.sym} -860 -570 0 0 {name=p1 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -200 -290 0 1 {name=p11 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -1000 -430 2 1 {name=p18 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -1160 -410 0 1 {name=p20 sig_type=std_logic lab=V_Bais}
C {lab_pin.sym} -1160 -570 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -610 -350 2 0 {name=p6 sig_type=std_logic lab=V_Bais}
C {lab_pin.sym} -700 -380 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {ammeter.sym} -1000 -480 0 1 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {gnd.sym} -940 -470 0 0 {name=l3 lab=GND}
C {vsource.sym} -940 -500 0 0 {name=VSS value=0}
C {lab_pin.sym} -940 -570 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {capa.sym} -300 -190 0 0 {name=C1
m=1
value=\{CL\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -910 -220 2 1 {name=p5 sig_type=std_logic lab=VFB}
C {res.sym} -380 -190 0 0 {name=R7
value=\{Rload\}
footprint=1206
device=resistor
m=1
}
C {gnd.sym} -520 -120 2 0 {name=l10 lab=GND}
C {LDO_NMOS_1V2.sym} -600 -260 0 0 {name=x1}
C {lab_pin.sym} -600 -130 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -900 -320 2 1 {name=p13 sig_type=std_logic lab=V_Ref
}
C {lab_pin.sym} -1060 -330 0 0 {name=p3 sig_type=std_logic lab=VDD
}
C {ammeter.sym} -660 -130 3 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} -1060 -180 0 1 {name=Vmeas1 savecurrent=true }
C {/foss/designs/bgr/BGR_I_ZTAT.sym} -1000 -260 0 0 {name=x2
}
C {lab_pin.sym} -1170 -270 3 0 {name=p7 sig_type=std_logic lab=V_Bais
}
C {1u_Ref.sym} -1090 -420 0 0 {name=x3
}
C {ammeter.sym} -430 -120 1 1 {name=Vmeas3 savecurrent=true spice_ignore=0}
C {lab_pin.sym} -1060 -120 2 0 {name=p9 sig_type=std_logic lab=VSS}
C {code.sym} -210 -540 0 0 {name=NGSPICE_MC_DC only_toplevel=true 
value="
.param mm_ok=1
.param mc_ok=1
.param temp=27
.options rshunt = 1e12
.options gmin=1e-12
.options reltol = 0.01 abstol = 1p
.option filetype=ascii
.save all
.param CL=100p
.param Rload=240k
.param VDD = 2.1
.control

dc VDD 2.1 3.3 0.05
meas dc V_Min MIN v(Vout) 
meas dc V_Max MAX v(Vout) 
let Line_R(mV:V)=(V_Max-V_Min)*1000/1.2

dc VDD 2.1 3.3 0.05
meas dc V_Min MIN v(Vout) 
meas dc V_Max MAX v(Vout) 
let Line_R(mV:V)=(V_Max-V_Min)*1000/1.2


echo results_save_begin
print Line_R(mV:V)
echo results_save_end

.endc
"
           
}
C {code_shown.sym} -420 -540 0 0 {name=MC_SETTINGS
only_toplevel=false
value="
**nr_workers=1
**nr_mc_sims=1000

**results_plot_begin
**Line_R(mV:V)
**results_plot_end
"
}
C {launcher.sym} -450 -325 0 0 {name=h2
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
