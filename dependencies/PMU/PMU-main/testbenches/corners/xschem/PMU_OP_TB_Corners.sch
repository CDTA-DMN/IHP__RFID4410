v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -410 -260 -410 -220 {lab=Vout}
N -950 -570 -950 -530 {lab=VSS}
N -1010 -530 -1010 -520 {lab=#net1}
N -1080 -530 -1010 -530 {lab=#net1}
N -1010 -460 -1010 -440 {lab=VSS}
N -870 -570 -870 -530 {lab=VDD}
N -610 -350 -610 -330 {lab=V_Bais}
N -860 -220 -840 -220 {lab=VFB}
N -610 -200 -610 -120 {lab=VFB}
N -860 -120 -610 -120 {lab=VFB}
N -910 -220 -860 -220 {lab=VFB}
N -640 -150 -530 -150 {lab=VSS}
N -1170 -450 -1170 -420 {lab=V_Bais}
N -310 -290 -310 -260 {lab=Vout}
N -860 -220 -860 -120 {lab=VFB}
N -320 -260 -310 -260 {lab=Vout}
N -510 -260 -410 -260 {lab=Vout}
N -320 -260 -320 -220 {lab=Vout}
N -410 -260 -320 -260 {lab=Vout}
N -940 -320 -840 -320 {lab=V_Ref}
C {gnd.sym} -870 -470 0 0 {name=l2 lab=GND
}
C {vsource.sym} -870 -500 0 0 {name=VDD value=\{VDD\}
}
C {code_shown.sym} -820 -570 0 0 {name=MODELS only_toplevel=false value="

** IHP MODELS

.lib cornerMOShv.lib mos_ff ** Four combination: ff-fs-sf-ss
.lib cornerRES.lib res_bcs ** Tow combination: bcs-wcs
.lib cornerCAP.lib cap_bcs ** Tow combination: bcs-wcs
"
}
C {lab_pin.sym} -870 -570 0 0 {name=p1 sig_type=std_logic lab=VDD
}
C {gnd.sym} -410 -160 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -310 -290 0 1 {name=p11 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -1010 -440 2 1 {name=p18 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -1170 -420 0 0 {name=p20 sig_type=std_logic lab=V_Bais
}
C {lab_pin.sym} -1170 -580 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -610 -350 2 0 {name=p6 sig_type=std_logic lab=V_Bais}
C {lab_pin.sym} -700 -380 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {ammeter.sym} -1010 -490 0 1 {name=Vmeas2 savecurrent=true spice_ignore=0}
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
C {lab_pin.sym} -1060 -380 0 0 {name=p3 sig_type=std_logic lab=VDD
}
C {lab_pin.sym} -1060 -200 2 1 {name=p9 sig_type=std_logic lab=VSS
}
C {ammeter.sym} -670 -150 3 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} -1060 -230 0 1 {name=Vmeas1 savecurrent=true }
C {/foss/designs/bgr/BGR_I_ZTAT.sym} -1000 -310 0 0 {name=x2
}
C {lab_pin.sym} -1170 -320 0 0 {name=p7 sig_type=std_logic lab=V_Bais
}
C {1u_Ref.sym} -1100 -430 0 0 {name=x3
}
C {gnd.sym} -320 -160 0 0 {name=l1 lab=GND}
C {res.sym} -320 -190 0 0 {name=R7
value=\{Rload\}
footprint=1206
device=resistor
m=1
}
C {lab_pin.sym} -1140 -450 0 1 {name=p4 sig_type=std_logic lab=VR
}
C {code.sym} -490 -400 0 0 {name=SPICE_OP_Corners only_toplevel=false value="
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

let V_LDO(V)=unitvec(mc_runs)
let V_BGR(mV)=unitvec(mc_runs)
let V_Beta(mV)=unitvec(mc_runs)
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


		op
		set run=$&run
		set dt=$curplot
		setplot $scratch

		let V_LDO(V)[$run]=\{$dt\}.Vout
		let V_BGR(mV)[$run]=\{$dt\}.V_Ref
		let V_Beta(mV)[$run]=\{$dt\}.VR
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

wrdata PMU_OP_TB_Corners.csv \{$scratch\}.V_LDO(V) \{$scratch\}.V_BGR(mV) \{$scratch\}.V_Beta(mV) \{$scratch\}.PS \{$scratch\}.Tem \{$scratch\}.Capa \{$scratch\}.Res
write PMU_OP_TB_Corners.raw
echo
print \{$scratch\}.V_LDO(V) \{$scratch\}.V_BGR(mV) \{$scratch\}.V_Beta(mV) \{$scratch\}.PS \{$scratch\}.Tem \{$scratch\}.Capa \{$scratch\}.Res
unset appendwrite
.endc
"
}
