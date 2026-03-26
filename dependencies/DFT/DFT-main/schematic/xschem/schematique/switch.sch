v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 30 -40 120 -40 {lab=vout}
N 30 70 120 70 {lab=vout}
N 120 20 120 70 {lab=vout}
N 120 20 220 20 {lab=vout}
N 120 -40 120 20 {lab=vout}
N -0 -140 -0 -80 {lab=en_3}
N -110 -40 -110 70 {lab=vin}
N -110 -40 -30 -40 {lab=vin}
N 0 -40 -0 -30 {lab=vss}
N -0 110 -0 140 {lab=en_n}
N -380 -160 -380 -140 {lab=en_n}
N -380 -270 -380 -220 {lab=vdd}
N -380 -110 -380 -50 {lab=vss}
N -460 -220 -420 -220 {lab=en}
N -460 -220 -460 -110 {lab=en}
N -460 -110 -420 -110 {lab=en}
N -240 -180 -240 -130 {lab=en_3}
N -240 -270 -240 -210 {lab=vdd}
N -240 -100 -240 -40 {lab=vss}
N -320 -210 -280 -210 {lab=en_n}
N -320 -160 -320 -100 {lab=en_n}
N -320 -100 -280 -100 {lab=en_n}
N -380 -270 -240 -270 {lab=vdd}
N -380 -280 -380 -270 {lab=vdd}
N -380 -160 -320 -160 {lab=en_n}
N -380 -190 -380 -160 {lab=en_n}
N -320 -210 -320 -160 {lab=en_n}
N -110 70 -30 70 {lab=vin}
N -30 50 -0 50 {lab=vdd}
N -0 50 0 70 {lab=vdd}
C {simulator_commands_shown.sym} 420 -270 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=true
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.include ./sg13g2_stdcell.spice
"
      }
C {code_shown.sym} 270 -150 0 0 {name=s1 only_toplevel=true
value="
.control
.save all
tran 0.1u 10u
plot vout vin

.end
"}
C {iopin.sym} -110 20 0 1 {name=p2 lab=vin}
C {iopin.sym} 220 20 0 0 {name=p7 lab=vout}
C {ipin.sym} -460 -170 0 0 {name=p1 lab=en}
C {iopin.sym} 0 -30 0 1 {name=p5 lab=vss}
C {lab_pin.sym} 0 130 0 0 {name=p3 sig_type=std_logic lab=en_n}
C {iopin.sym} -380 -280 0 1 {name=p9 lab=vdd}
C {sg13g2_pr/sg13_hv_pmos.sym} -400 -220 0 0 {name=M5
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -400 -110 0 0 {name=M6
l=0.45u
w=2u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} -380 -50 0 0 {name=p10 sig_type=std_logic lab=vss}
C {sg13g2_pr/sg13_hv_pmos.sym} -260 -210 0 0 {name=M7
l=0.4u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -260 -100 0 0 {name=M8
l=0.45u
w=0.3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} -240 -40 0 0 {name=p13 sig_type=std_logic lab=vss}
C {lab_pin.sym} -380 -160 0 0 {name=p4 sig_type=std_logic lab=en_n}
C {lab_pin.sym} -240 -160 0 1 {name=p6 sig_type=std_logic lab=en_3}
C {lab_pin.sym} 0 -130 0 1 {name=p8 sig_type=std_logic lab=en_3}
C {sg13g2_pr/sg13_hv_nmos.sym} 0 -60 1 0 {name=M1
l=0.45u
w=4u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 0 90 3 0 {name=M2
l=0.45u
w=10u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -30 50 0 0 {name=p11 sig_type=std_logic lab=vdd}
