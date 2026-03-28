v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -80 160 10 160 {lab=#net1}
N -160 100 -160 130 {lab=#net1}
N -80 100 -80 160 {lab=#net1}
N -120 160 -80 160 {lab=#net1}
N -160 100 -80 100 {lab=#net1}
N -160 -10 -160 100 {lab=#net1}
N -160 160 -160 220 {lab=VSS}
N 50 160 50 220 {lab=VSS}
N 50 -90 50 -70 {lab=VX}
N -60 -90 50 -90 {lab=VX}
N -160 -90 -160 -70 {lab=VX}
N -60 -110 -60 -90 {lab=VX}
N -160 -90 -60 -90 {lab=VX}
N -280 -40 -200 -40 {lab=Vin1}
N -60 220 -60 260 {lab=VSS}
N -60 -190 -60 -140 {lab=VDD}
N -60 -40 50 -40 {lab=VDD}
N -120 -190 -60 -190 {lab=VDD}
N -120 -190 -120 -80 {lab=VDD}
N -120 -80 -60 -80 {lab=VDD}
N -60 -80 -60 -40 {lab=VDD}
N -160 -40 -60 -40 {lab=VDD}
N -60 220 50 220 {lab=VSS}
N 50 -10 50 130 {lab=Vout1}
N 90 -40 135 -40 {lab=Vin2}
N -60 -230 -60 -190 {lab=VDD}
N -160 -110 -160 -90 {lab=VX}
N -160 220 -60 220 {lab=VSS}
C {sg13g2_pr/sg13_hv_pmos.sym} -180 -40 0 0 {name=M1
l=5u
w=10u
ng=2
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -140 160 0 1 {name=M2
l=10u
w=1u
ng=2
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 30 160 0 0 {name=M3
l=10u
w=1u
ng=2
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 70 -40 0 1 {name=M4
l=5u
w=10u
ng=2
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -80 -140 0 0 {name=M5
l=2u
w=10u
ng=1
m=5
model=sg13_hv_pmos
spiceprefix=X
}
C {iopin.sym} -60 -230 0 0 {name=p1 lab=VDD}
C {ipin.sym} -100 -140 0 0 {name=p3 lab=VB}
C {ipin.sym} -280 -40 2 1 {name=p4 lab=Vin1}
C {ipin.sym} 135 -40 0 1 {name=p5 lab=Vin2}
C {iopin.sym} -60 260 0 0 {name=p6 lab=VSS}
C {opin.sym} 50 60 0 0 {name=p7 lab=Vout1}
C {lab_pin.sym} -160 -110 0 0 {name=p2 sig_type=std_logic lab=VX}
