v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -300 -150 -195 -150 {lab=VX2}
N -155 -150 -155 -85 {lab=VSS}
N -340 -150 -340 -85 {lab=VSS}
N -300 -185 -300 -150 {lab=VX2}
N -340 -185 -300 -185 {lab=VX2}
N -340 -185 -340 -180 {lab=VX2}
N -340 -275 -340 -185 {lab=VX2}
N -340 -360 -340 -335 {lab=#net1}
N -245 -360 -155 -360 {lab=#net1}
N -155 -360 -155 -335 {lab=#net1}
N -245 -305 -155 -305 {lab=VDD}
N -340 -360 -245 -360 {lab=#net1}
N -245 -345 -245 -305 {lab=VDD}
N -340 -305 -245 -305 {lab=VDD}
N -245 -390 -245 -360 {lab=#net1}
N -245 -480 -245 -415 {lab=VDD}
N -305 -415 -285 -415 {lab=I_Bais}
N -340 -85 -155 -85 {lab=VSS}
N -155 -225 -155 -180 {lab=VG}
N 10 -150 10 -85 {lab=VSS}
N -155 -225 -90 -225 {lab=VG}
N -155 -275 -155 -225 {lab=VG}
N -90 -225 -90 -150 {lab=VG}
N 10 -480 10 -415 {lab=VDD}
N 10 -385 10 -180 {lab=VOUT}
N -245 -345 -165 -345 {lab=VDD}
N -165 -480 -165 -345 {lab=VDD}
N -245 -480 -165 -480 {lab=VDD}
N -30 -465 -30 -415 {lab=I_Bais}
N -305 -465 -30 -465 {lab=I_Bais}
N -305 -465 -305 -415 {lab=I_Bais}
N -310 -415 -305 -415 {lab=I_Bais}
N -165 -480 10 -480 {lab=VDD}
N -155 -85 10 -85 {lab=VSS}
N -90 -150 -30 -150 {lab=VG}
C {sg13g2_pr/sg13_hv_nmos.sym} -320 -150 0 1 {name=M3
l=2u
w=10u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -360 -305 0 0 {name=M1
l=2u
w=5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -135 -305 0 1 {name=M2
l=2u
w=5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -175 -150 0 0 {name=M4
l=2u
w=10u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -265 -415 0 0 {name=M5
l=2u
w=10u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -10 -415 0 0 {name=M7
l=2u
w=10u
ng=1
m=8
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -10 -150 0 0 {name=M6
l=2u
w=10u
ng=1
m=8
model=sg13_hv_nmos
spiceprefix=X
}
C {iopin.sym} -245 -480 0 1 {name=p4 lab=VDD}
C {iopin.sym} -310 -415 0 1 {name=p5 lab=I_Bais}
C {iopin.sym} -380 -305 0 1 {name=p7 lab=VP}
C {iopin.sym} -115 -305 0 0 {name=p9 lab=VN}
C {iopin.sym} -155 -225 2 0 {name=p10 lab=VG}
C {iopin.sym} 10 -280 0 0 {name=p11 lab=VOUT}
C {iopin.sym} -340 -85 2 0 {name=p22 lab=VSS}
C {sg13g2_pr/annotate_fet_params.sym} 125 -455 0 0 {name=annot1 ref=M7}
C {sg13g2_pr/annotate_fet_params.sym} 255 -330 0 0 {name=annot2 ref=M5}
C {sg13g2_pr/annotate_fet_params.sym} 260 -180 0 0 {name=annot3 ref=M6}
C {lab_pin.sym} -340 -230 0 0 {name=p1 sig_type=std_logic lab=VX2}
