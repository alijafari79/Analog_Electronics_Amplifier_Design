*********//devices//*********
.option vntol=1p
.option nomod
.option post
.option accurate = 0.01

***//Resistant//***
RB	100	3	230K
RC	100	6	1K
RS	2	1	50
R2	100	5	13k
R1	5	0	17k

***//Capacitor//***
CBS	3	2	1u
CB	5	0	1u

***//Voltage//***
vcc	100	0	3
vee	100	0	3
Vin 1	0	ac	sin(0	1m	1k	0	0	0)

***//Transistor//***
Q1	4	3	0	mynpn
Q2	6	5	4	mynpn

***//models//***
.Model  mynpn	NPN	IS=1f	BF=100	vaf=100	cje=1p	cjc=2p	cjs=2p	tf=200p

***//analysis//***
.op

***.option post
.tran	1ps	10ms	START=0

.ac	dec	1000	1	10000G

.probe   Gainn=par('db(vm(6))')
.probe   Phase=par('vp(6)')

.meas   ac   gain   max   par('db(vm(6))')
.meas   ac   fu    when   v(6)=1
.meas   ac   PhaseM   find   par('vp(6)')   when   v(6)=1

.pz v(6) Vin

.end
