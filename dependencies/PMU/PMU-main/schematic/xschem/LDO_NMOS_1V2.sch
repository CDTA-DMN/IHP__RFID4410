v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -410 -240 -410 -230 {lab=Vout}
N -685 -175 -660 -175 {lab=#net1}
N -755 -115 -755 70 {lab=VSS}
N -512.5 -275 -450 -275 {lab=VG2}
N -410 -5 -410 10 {lab=#net2}
N -410 -80 -410 -65 {lab=#net3}
N -805 -395 -805 -375 {lab=I_Bais}
N -410 -245 -410 -240 {lab=Vout}
N -410 -430 -410 -305 {lab=VDD}
N -755 -430 -755 -375 {lab=VDD}
N -410 -275 -350 -275 {lab=GND}
N -530 -175 -512.5 -175 {lab=VG2}
N -600 -175 -590 -175 {lab=#net4}
N -755 -430 -410 -430 {lab=VDD}
N -410 -240 -230 -240 {lab=Vout}
N -585 -275 -512.5 -275 {lab=VG2}
N -755 70 -650 70 {lab=VSS}
N -685 -205 -685 -175 {lab=#net1}
N -512.5 -175 -512.5 -40 {lab=VG2}
N -512.5 -275 -512.5 -175 {lab=VG2}
N -545 70 -410 70 {lab=#net5}
N -512.5 20 -512.5 45 {lab=#net5}
N -410 -170 -410 -140 {lab=V_FB}
N -545 45 -512.5 45 {lab=#net5}
N -545 45 -545 70 {lab=#net5}
N -590 70 -545 70 {lab=#net5}
C {ammeter.sym} -755 -145 0 1 {name=Vmeas savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_hv_nmos.sym} -430 -275 0 0 {name=M6
l=0.45u
w=10u
ng=10
m=50
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} -350 -275 0 0 {name=l8 lab=GND}
C {sg13g2_pr/rhigh.sym} -410 -200 0 0 {name=R3
w=0.5e-6
l=18e-6
model=rhigh
spiceprefix=X
b=0
m=2
}
C {ammeter.sym} -620 70 1 1 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {sg13g2_pr/rhigh.sym} -410 -110 0 0 {name=R2
w=0.5e-6
l=18e-6
model=rhigh
spiceprefix=X
b=0
m=2}
C {sg13g2_pr/annotate_fet_params.sym} -320 -405 0 0 {name=annot1 ref=M6
}
C {lab_pin.sym} -525 -275 1 0 {name=p21 sig_type=std_logic lab=VG2}
C {sg13g2_pr/rhigh.sym} -410 -35 0 0 {name=R4
w=0.5e-6
l=18e-6
model=rhigh
spiceprefix=X
b=0
m=2}
C {sg13g2_pr/rhigh.sym} -410 40 0 0 {name=R5
w=0.5e-6
l=18e-6
model=rhigh
spiceprefix=X
b=0
m=2}
C {OpAmp_2etags.sym} -625 -275 0 0 {name=x1}
C {sg13g2_pr/cap_cmim.sym} -630 -175 1 0 {name=C3
model=cap_cmim
w=33.24e-6
l=50.0e-6
m=3
spiceprefix=X}
C {iopin.sym} -230 -240 0 0 {name=p1 lab=Vout}
C {iopin.sym} -410 -430 0 0 {name=p2 lab=VDD}
C {iopin.sym} -805 -395 3 0 {name=p4 lab=I_Bais}
C {iopin.sym} -945 -315 2 0 {name=p5 lab=V_P}
C {iopin.sym} -945 -235 2 0 {name=p3 lab=V_N}
C {iopin.sym} -410 -140 2 0 {name=p6 lab=V_FB}
C {iopin.sym} -755 70 2 0 {name=p7 lab=VSS}
C {sg13g2_pr/cap_cmim.sym} -512.5 -10 0 0 {name=C4
model=cap_cmim
w=33.24e-6
l=50e-6
m=2
spiceprefix=X
}
C {sg13g2_pr/rhigh.sym} -560 -175 1 0 {name=R1
w=0.5e-6
l=15e-6
model=rhigh
body=sub!
spiceprefix=X
b=0
m=1
}
