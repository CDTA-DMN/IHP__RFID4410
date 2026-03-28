v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -1050 -660 -1050 -640 {lab=vip}
N -1050 -580 -1050 -560 {lab=GND}
N 210 -660 210 -640 {lab=VDD}
N 210 -580 210 -560 {lab=GND}
N -560 -360 -560 -330 {lab=#net1}
N -560 -360 -480 -360 {lab=#net1}
N -560 -470 -560 -360 {lab=#net1}
N -480 -360 -480 -300 {lab=#net1}
N -480 -300 -340 -300 {lab=#net1}
N -520 -300 -480 -300 {lab=#net1}
N -560 -600 -420 -600 {lab=#net2}
N -420 -600 -300 -600 {lab=#net2}
N -260 -500 -220 -500 {lab=vip}
N -540 -700 -460 -700 {lab=#net3}
N -770 -670 -770 -630 {lab=#net3}
N -770 -630 -700 -630 {lab=#net3}
N -700 -700 -700 -630 {lab=#net3}
N -730 -700 -700 -700 {lab=#net3}
N -770 -770 -770 -700 {lab=VDD}
N -510 -770 -420 -770 {lab=VDD}
N -420 -770 -420 -700 {lab=VDD}
N -20 -700 -20 -670 {lab=VDD}
N -540 -700 -540 -640 {lab=#net3}
N -700 -700 -540 -700 {lab=#net3}
N -560 -600 -560 -530 {lab=#net2}
N -300 -600 -300 -530 {lab=#net2}
N -300 -340 -300 -330 {lab=#net4}
N -360 -230 -300 -230 {lab=#net5}
N -420 -670 -420 -600 {lab=#net2}
N -540 -640 -60 -640 {lab=#net3}
N -350 -500 -300 -500 {lab=VDD}
N -350 -770 -350 -500 {lab=VDD}
N -560 -500 -510 -500 {lab=VDD}
N -510 -770 -510 -500 {lab=VDD}
N -770 -770 -510 -770 {lab=VDD}
N -350 -770 -20 -770 {lab=VDD}
N -410 -770 -350 -770 {lab=VDD}
N -20 -640 40 -640 {lab=VDD}
N 40 -700 40 -640 {lab=VDD}
N -20 -700 40 -700 {lab=VDD}
N -20 -770 -20 -700 {lab=VDD}
N -300 -470 -300 -340 {lab=#net4}
N -300 -230 -20 -230 {lab=#net5}
N -410 -800 -410 -770 {lab=VDD}
N -420 -770 -410 -770 {lab=VDD}
N -640 -500 -600 -500 {lab=vin}
N -360 -230 -360 -200 {lab=#net5}
N -360 -140 -360 -110 {lab=GND}
N -20 -430 -20 -370 {lab=vout}
N -20 -610 -20 -430 {lab=vout}
N -20 -430 480 -430 {lab=vout}
N -660 -460 -220 -460 {lab=vip}
N -220 -500 -220 -460 {lab=vip}
N -560 -230 -360 -230 {lab=#net5}
N -770 -630 -770 -320 {lab=#net3}
N -770 -290 -770 -230 {lab=#net5}
N -770 -230 -560 -230 {lab=#net5}
N -560 -300 -560 -230 {lab=#net5}
N -300 -300 -300 -230 {lab=#net5}
N -20 -340 -20 -230 {lab=#net5}
N -840 -290 -810 -290 {lab=#net6}
N -910 -230 -770 -230 {lab=#net5}
N -840 -340 -840 -290 {lab=#net6}
N -870 -290 -840 -290 {lab=#net6}
N -910 -340 -840 -340 {lab=#net6}
N -910 -420 -910 -340 {lab=#net6}
N -910 -340 -910 -320 {lab=#net6}
N -910 -500 -910 -480 {lab=VDD}
N -910 -290 -910 -230 {lab=#net5}
N -300 -340 -60 -340 {lab=#net4}
N -1070 -540 -1070 -520 {lab=vin}
N -1070 -460 -1070 -440 {lab=GND}
C {vsource.sym} -1050 -610 0 0 {name=vip value="dc 1.65" savecurrent=false}
C {gnd.sym} -1050 -560 0 0 {name=l1 lab=GND}
C {code_shown.sym} 280 -930 0 0 {name=NGSPICE_PSRR only_toplevel=true 
value="
.param temp=27
.control
save all 

  op
  ac dec 200 1 100Meg

  let psrr_db = 20*log10(abs(v(vout)/v(VDD)))

  meas ac psrr_dc     FIND psrr_db AT=1
  meas ac psrr_100    FIND psrr_db AT=100
  meas ac psrr_1k     FIND psrr_db AT=1k
  meas ac psrr_10k    FIND psrr_db AT=10k
  meas ac psrr_100k   FIND psrr_db AT=100k
  meas ac psrr_13M56  FIND psrr_db AT=13.56Meg

  print psrr_dc psrr_100 psrr_1k psrr_10k psrr_100k psrr_13M56
  plot psrr_db
write TowStageOTA_PSRR_2026.raw 
.endc
"
}
C {code_shown.sym} -165 -1060 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
"}
C {lab_pin.sym} 480 -430 2 0 {name=p3 sig_type=std_logic lab=vout}
C {vsource.sym} 210 -610 0 0 {name=VDD value="dc 3.3 ac 1" savecurrent=false}
C {gnd.sym} 210 -560 0 0 {name=l3 lab=GND}
C {vdd.sym} 210 -660 0 0 {name=l5 lab=VDD}
C {sg13g2_pr/sg13_hv_pmos.sym} -750 -700 0 1 {name=M4
l=1.5u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -440 -700 0 0 {name=M1
l=1.5u
w=2u
ng=1
m=6
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -40 -640 0 0 {name=M2
l=1.5u
w=2u
ng=1
m=6
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -280 -500 0 1 {name=M3
l=1u
w=4.5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -580 -500 0 0 {name=M5
l=1u
w=4.5u
ng=1
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -320 -300 0 0 {name=M10
l=0.8u
w=1.2u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -540 -300 0 1 {name=M11
l=0.8u
w=1.2u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -40 -340 0 0 {name=M12
l=0.8u
w=1.2u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {isource.sym} -910 -450 0 0 {name=I0 value=1u}
C {gnd.sym} -360 -110 0 0 {name=l6 lab=GND}
C {vdd.sym} -410 -800 0 0 {name=l10 lab=VDD}
C {lab_pin.sym} -660 -460 0 0 {name=p5 sig_type=std_logic lab=vip}
C {ammeter.sym} -360 -170 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {lab_pin.sym} -1050 -660 0 0 {name=p1 sig_type=std_logic lab=vip}
C {sg13g2_pr/sg13_hv_nmos.sym} -790 -290 0 0 {name=M6
l=10u
w=3u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -890 -290 0 1 {name=M7
l=10u
w=3u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {vdd.sym} -910 -500 0 0 {name=l4 lab=VDD}
C {lab_pin.sym} -640 -500 0 0 {name=p2 sig_type=std_logic lab=vin}
C {vsource.sym} -1070 -490 0 0 {name=vin value="dc 1.65" savecurrent=false}
C {gnd.sym} -1070 -440 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -1070 -540 0 0 {name=p4 sig_type=std_logic lab=vin}
