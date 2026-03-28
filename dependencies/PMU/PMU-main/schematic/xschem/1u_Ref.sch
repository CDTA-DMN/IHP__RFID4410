v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 290 -480 290 -420 {lab=VDD}
N 130 -480 130 -420 {lab=VDD}
N 170 -420 250 -420 {lab=VP}
N 250 -390 290 -390 {lab=VP}
N 250 -420 250 -390 {lab=VP}
N -280 -480 -280 -420 {lab=VDD}
N -280 -240 -250 -240 {lab=V1}
N -240 -420 -240 -390 {lab=#net1}
N -280 -390 -240 -390 {lab=#net1}
N 130 130 130 310 {lab=VSS}
N 130 -30 130 70 {lab=#net2}
N 290 10 290 100 {lab=VR}
N 290 -30 350 -30 {lab=VSS}
N 130 -480 290 -480 {lab=VDD}
N -210 -240 -100 -240 {lab=VSS}
N -280 200 -100 200 {lab=VSS}
N -210 -360 -210 -270 {lab=#net3}
N 350 -30 350 310 {lab=VSS}
N -210 -360 -160 -360 {lab=#net3}
N -280 40 -280 200 {lab=VSS}
N -280 -110 -280 -20 {lab=#net4}
N -120 -110 -120 -90 {lab=VN}
N -210 -110 -120 -110 {lab=VN}
N -210 -210 -210 -110 {lab=VN}
N -240 -110 -210 -110 {lab=VN}
N -120 -90 130 -90 {lab=VN}
N -280 -390 -280 -370 {lab=#net1}
N -310 -340 -280 -340 {lab=VDD}
N -310 -480 -310 -340 {lab=VDD}
N -310 -480 -280 -480 {lab=VDD}
N -240 -340 -240 -310 {lab=V1}
N -280 -310 -240 -310 {lab=V1}
N -280 -240 -280 -140 {lab=V1}
N -280 -310 -280 -240 {lab=V1}
N 290 -170 290 -60 {lab=#net5}
N 220 -30 250 -30 {lab=VN}
N 220 -90 220 -30 {lab=VN}
N 130 -90 220 -90 {lab=VN}
N 170 -30 210 -30 {lab=VR}
N 210 -30 210 10 {lab=VR}
N 210 10 290 10 {lab=VR}
N 290 -0 290 10 {lab=VR}
N 290 -390 290 -230 {lab=VP}
N 130 -390 130 -90 {lab=VN}
N 130 -90 130 -60 {lab=VN}
N -280 -480 130 -480 {lab=VDD}
N 290 -480 315 -480 {lab=VDD}
N 250 -390 250 -360 {lab=VP}
N -100 -360 250 -360 {lab=VP}
N 290 310 350 310 {lab=VSS}
N 130 310 290 310 {lab=VSS}
N -100 -240 -100 200 {lab=VSS}
N -100 310 130 310 {lab=VSS}
N -100 200 -100 310 {lab=VSS}
N 290 160 290 310 {lab=VSS}
C {sg13g2_pr/sg13_hv_pmos.sym} 270 -420 0 0 {name=M1
l=2u
w=10u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 150 -420 0 1 {name=M2
l=2u
w=10u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -260 -420 0 1 {name=M6
l=10u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X}
C {sg13g2_pr/sg13_hv_nmos.sym} -260 -110 0 1 {name=M7
l=6u
w=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -230 -240 0 0 {name=M5
l=10u
w=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {ammeter.sym} 130 100 0 0 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_hv_nmos.sym} 150 -30 0 1 {name=M4
l=1u
w=10u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 270 -30 0 0 {name=M3
l=1u
w=10u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} 290 30 0 0 {name=p7 sig_type=std_logic lab=VR}
C {ammeter.sym} 290 -200 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {sg13g2_pr/annotate_fet_params.sym} 390 -440 0 0 {name=annot1 ref=M1}
C {sg13g2_pr/annotate_fet_params.sym} -40 -440 0 0 {name=annot2 ref=M2}
C {sg13g2_pr/annotate_fet_params.sym} 420 -40 0 0 {name=annot3 ref=M3}
C {sg13g2_pr/annotate_fet_params.sym} -50 -50 0 0 {name=annot4 ref=M4}
C {sg13g2_pr/annotate_fet_params.sym} -90 -260 0 0 {name=annot5 ref=M5}
C {sg13g2_pr/annotate_fet_params.sym} -470 -470 0 0 {name=annot6 ref=M6}
C {sg13g2_pr/annotate_fet_params.sym} -460 -140 0 0 {name=annot7 ref=M7}
C {ammeter.sym} -130 -360 1 0 {name=Vmeas3 savecurrent=true spice_ignore=0}
C {lab_pin.sym} -280 -200 0 0 {name=p8 sig_type=std_logic lab=V1}
C {ammeter.sym} -280 10 0 0 {name=Vmeas4 savecurrent=true spice_ignore=0}
C {iopin.sym} 315 -480 0 0 {name=p1 lab=VDD}
C {iopin.sym} -100 160 0 0 {name=p2 lab=VSS}
C {iopin.sym} 290 -285 0 0 {name=p3 lab=VP}
C {iopin.sym} 130 -170 0 0 {name=p6 lab=VN}
C {sg13g2_pr/sg13_hv_pmos.sym} -260 -340 0 1 {name=M8
l=10u
w=0.3u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X}
C {sg13g2_pr/rhigh.sym} 290 130 0 0 {name=R1
w=0.5e-6
l=185e-6
model=rhigh
body=sub!
spiceprefix=X
b=0
m=1
}
