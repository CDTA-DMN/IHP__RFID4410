v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -410 -260 -410 -220 {lab=Vout}
N -940 -560 -940 -520 {lab=VSS}
N -990 -520 -990 -510 {lab=#net1}
N -990 -450 -990 -430 {lab=VSS}
N -860 -560 -860 -520 {lab=VDD}
N -610 -350 -610 -330 {lab=V_Bais}
N -860 -220 -840 -220 {lab=VFB}
N -610 -200 -610 -120 {lab=VFB}
N -860 -120 -610 -120 {lab=VFB}
N -910 -220 -860 -220 {lab=VFB}
N -640 -150 -530 -150 {lab=VSS}
N -1120 -440 -1120 -320 {lab=V_Bais}
N -320 -260 -310 -260 {lab=Vout}
N -310 -290 -310 -260 {lab=Vout}
N -860 -220 -860 -120 {lab=VFB}
N -320 -260 -320 -210 {lab=Vout}
N -410 -260 -320 -260 {lab=Vout}
N -510 -260 -410 -260 {lab=Vout}
N -880 -320 -840 -320 {lab=V_Ref}
N -1030 -520 -990 -520 {lab=#net1}
N -1120 -320 -1110 -320 {lab=V_Bais}
C {gnd.sym} -860 -460 0 0 {name=l2 lab=GND
}
C {vsource.sym} -860 -490 0 0 {name=VDD value=\{VDD\}
}
C {code_shown.sym} -620 -560 0 0 {name=MODELS only_toplevel=false value="

** IHP MODELS

.lib cornerMOShv.lib mos_tt_stat
.lib cornerRES.lib res_typ_stat
.lib cornerCAP.lib cap_typ_stat

"
}
C {lab_pin.sym} -860 -560 0 0 {name=p1 sig_type=std_logic lab=VDD
}
C {gnd.sym} -410 -160 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -310 -290 0 1 {name=p11 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -990 -430 2 1 {name=p18 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -1120 -410 2 0 {name=p20 sig_type=std_logic lab=V_Bais
}
C {lab_pin.sym} -1120 -570 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -610 -350 2 0 {name=p6 sig_type=std_logic lab=V_Bais}
C {lab_pin.sym} -700 -380 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {ammeter.sym} -990 -480 0 1 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {gnd.sym} -940 -460 0 0 {name=l3 lab=GND}
C {vsource.sym} -940 -490 0 0 {name=VSS value=0}
C {lab_pin.sym} -940 -560 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {capa.sym} -410 -190 0 0 {name=C1
m=1
value=\{CL\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -910 -220 2 1 {name=p5 sig_type=std_logic lab=VFB}
C {LDO_NMOS_1V2.sym} -600 -260 0 0 {name=x1}
C {lab_pin.sym} -530 -150 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -860 -320 3 1 {name=p13 sig_type=std_logic lab=V_Ref
}
C {lab_pin.sym} -1000 -380 0 0 {name=p3 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -1000 -200 2 1 {name=p9 sig_type=std_logic lab=VSS
}
C {ammeter.sym} -670 -150 3 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} -1000 -230 0 1 {name=Vmeas1 savecurrent=true }
C {/foss/designs/bgr/BGR_I_ZTAT.sym} -940 -310 0 0 {name=x2
}
C {1u_Ref.sym} -1050 -420 0 0 {name=x3
}
C {isource.sym} -320 -180 0 0 {name=I0 value="pulse(5u 250u 100n 100n 100n 5u 10u)"}
C {code_shown.sym} -300 -560 0 0 {name=MC_SETTINGS
only_toplevel=false
value="
**nr_workers=1
**nr_mc_sims=1000

**results_plot_begin
**UnderShot(mV)
**OverShot(mV)
**IQ_Max(uA)
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
C {code.sym} -800 -570 0 0 {name=NGSPICE_MC_Tran only_toplevel=true 
value="
.options rshunt = 1e12
.options gmin=1e-12
.include LDO_Train_TB_MC.save
.param temp=27
.save all
.param CL=100p
.param VDD = 3


.control


tran 50n 10u
meas tran V_LDO FIND v(Vout) AT=5u
meas tran US MIN v(Vout)
meas tran OS MAX v(Vout)
meas tran IQ_Max MAX i(VSS)
let UnderShot(mV)=1000*(V_LDO-US)
let OverShot(mV)=1000*(OS-V_LDO)
let IQ_Max(uA)=IQ_Max*1000000

echo results_save_begin
print OverShot(mV)
print UnderShot(mV)
print IQ_Max(uA)
echo results_save_end

.endc
"
           
}
C {gnd.sym} -320 -150 0 0 {name=l1 lab=GND}
