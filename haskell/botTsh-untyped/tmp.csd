<CsoundSynthesizer>

<CsOptions>

--nodisplays --output=dac --input=adc

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
gkrggBpmVar init 110.0
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop




instr 30

endin

instr 29
 event_i "i", 28, 92.44444444444443, 1.0e-2
endin

instr 28
ir1 = 27
ir2 = 0.0
 turnoff2 ir1, ir2, ir2
ir5 = 26
 turnoff2 ir5, ir2, ir2
ir8 = 25
 turnoff2 ir8, ir2, ir2
ir11 = 24
 turnoff2 ir11, ir2, ir2
ir14 = 23
 turnoff2 ir14, ir2, ir2
ir17 = 22
 turnoff2 ir17, ir2, ir2
ir20 = 21
 turnoff2 ir20, ir2, ir2
ir23 = 20
 turnoff2 ir23, ir2, ir2
ir26 = 19
 turnoff2 ir26, ir2, ir2
ir29 = 18
 turnoff2 ir29, ir2, ir2
 exitnow 
endin

instr 27
arl0 init 0.0
arl1 init 0.0
ar0, ar1 subinstr 26
ir7 = 1.0
ar2 upsamp k(ir7)
ir8 = 0.0
ir9 = 90.0
ir10 = 100.0
ar3 compress ar0, ar2, ir8, ir9, ir9, ir10, ir8, ir8, 0.0
ar0 = (ar3 * 0.8)
arl0 = ar0
ar0 compress ar1, ar2, ir8, ir9, ir9, ir10, ir8, ir8, 0.0
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 26
ir1 FreePort 
krl0 init 10.0
ir5 FreePort 
 event_i "i", 19, 0.0, 0.16666666666666666, ir5, ir1
 event_i "i", 18, 0.0, 0.16666666666666666, 1.0, ir5
krl0 = 2.0
kr0 = krl0
S15 sprintf "alive_%d", ir5
 chnset kr0, S15
ir18 FreePort 
 event_i "i", 20, 0.16666666666666666, 0.16666666666666666, ir18, ir1
 event_i "i", 18, 0.16666666666666666, 0.16666666666666666, 1.0, ir18
krl0 = 2.0
kr0 = krl0
S28 sprintf "alive_%d", ir18
 chnset kr0, S28
ir31 FreePort 
 event_i "i", 21, 0.3333333333333333, 0.16666666666666666, ir31, ir1
 event_i "i", 18, 0.3333333333333333, 0.16666666666666666, 1.0, ir31
krl0 = 2.0
kr0 = krl0
S41 sprintf "alive_%d", ir31
 chnset kr0, S41
ir44 FreePort 
 event_i "i", 21, 0.5, 0.16666666666666666, ir44, ir1
 event_i "i", 18, 0.5, 0.16666666666666666, 1.0, ir44
krl0 = 2.0
kr0 = krl0
S54 sprintf "alive_%d", ir44
 chnset kr0, S54
ir57 FreePort 
 event_i "i", 19, 0.6666666666666666, 0.16666666666666666, ir57, ir1
 event_i "i", 18, 0.6666666666666666, 0.16666666666666666, 1.0, ir57
krl0 = 2.0
kr0 = krl0
S67 sprintf "alive_%d", ir57
 chnset kr0, S67
ir70 FreePort 
 event_i "i", 20, 0.8333333333333333, 0.16666666666666666, ir70, ir1
 event_i "i", 18, 0.8333333333333333, 0.16666666666666666, 1.0, ir70
krl0 = 2.0
kr0 = krl0
S80 sprintf "alive_%d", ir70
 chnset kr0, S80
ir83 FreePort 
 event_i "i", 21, 0.9999999999999999, 0.16666666666666666, ir83, ir1
 event_i "i", 18, 0.9999999999999999, 0.16666666666666666, 1.0, ir83
krl0 = 2.0
kr0 = krl0
S93 sprintf "alive_%d", ir83
 chnset kr0, S93
ir96 FreePort 
 event_i "i", 21, 1.1666666666666665, 0.16666666666666666, ir96, ir1
 event_i "i", 18, 1.1666666666666665, 0.16666666666666666, 1.0, ir96
krl0 = 2.0
kr0 = krl0
S106 sprintf "alive_%d", ir96
 chnset kr0, S106
ir109 FreePort 
 event_i "i", 19, 1.3333333333333333, 0.16666666666666666, ir109, ir1
 event_i "i", 18, 1.3333333333333333, 0.16666666666666666, 1.0, ir109
krl0 = 2.0
kr0 = krl0
S119 sprintf "alive_%d", ir109
 chnset kr0, S119
ir122 FreePort 
 event_i "i", 20, 1.5, 0.16666666666666666, ir122, ir1
 event_i "i", 18, 1.5, 0.16666666666666666, 1.0, ir122
krl0 = 2.0
kr0 = krl0
S132 sprintf "alive_%d", ir122
 chnset kr0, S132
ir135 FreePort 
 event_i "i", 21, 1.6666666666666667, 0.16666666666666666, ir135, ir1
 event_i "i", 18, 1.6666666666666667, 0.16666666666666666, 1.0, ir135
krl0 = 2.0
kr0 = krl0
S145 sprintf "alive_%d", ir135
 chnset kr0, S145
ir148 FreePort 
 event_i "i", 21, 1.8333333333333335, 0.16666666666666666, ir148, ir1
 event_i "i", 18, 1.8333333333333335, 0.16666666666666666, 1.0, ir148
krl0 = 2.0
kr0 = krl0
S158 sprintf "alive_%d", ir148
 chnset kr0, S158
ir161 FreePort 
 event_i "i", 19, 2.0, 0.16666666666666666, ir161, ir1
 event_i "i", 18, 2.0, 0.16666666666666666, 1.0, ir161
krl0 = 2.0
kr0 = krl0
S171 sprintf "alive_%d", ir161
 chnset kr0, S171
ir174 FreePort 
 event_i "i", 20, 2.1666666666666665, 0.16666666666666666, ir174, ir1
 event_i "i", 18, 2.1666666666666665, 0.16666666666666666, 1.0, ir174
krl0 = 2.0
kr0 = krl0
S184 sprintf "alive_%d", ir174
 chnset kr0, S184
ir187 FreePort 
 event_i "i", 21, 2.333333333333333, 0.16666666666666666, ir187, ir1
 event_i "i", 18, 2.333333333333333, 0.16666666666666666, 1.0, ir187
krl0 = 2.0
kr0 = krl0
S197 sprintf "alive_%d", ir187
 chnset kr0, S197
ir200 FreePort 
 event_i "i", 21, 2.4999999999999996, 0.16666666666666666, ir200, ir1
 event_i "i", 18, 2.4999999999999996, 0.16666666666666666, 1.0, ir200
krl0 = 2.0
kr0 = krl0
S210 sprintf "alive_%d", ir200
 chnset kr0, S210
ir213 FreePort 
 event_i "i", 23, 2.5, 0.16666666666666666, ir213, ir1
 event_i "i", 22, 2.5, 0.16666666666666666, 1.0, ir213
krl0 = 2.0
kr0 = krl0
S223 sprintf "alive_%d", ir213
 chnset kr0, S223
ir226 FreePort 
 event_i "i", 19, 0.6666666666666666, 0.6666666666666666, ir226, ir1
 event_i "i", 24, 0.6666666666666666, 0.6666666666666666, 1.0, ir226
krl0 = 2.0
kr0 = krl0
S236 sprintf "alive_%d", ir226
 chnset kr0, S236
ir239 FreePort 
 event_i "i", 19, 2.0, 0.6666666666666666, ir239, ir1
 event_i "i", 24, 2.0, 0.6666666666666666, 1.0, ir239
krl0 = 2.0
kr0 = krl0
S249 sprintf "alive_%d", ir239
 chnset kr0, S249
ir252 FreePort 
 event_i "i", 19, 0.0, 0.3333333333333333, ir252, ir1
 event_i "i", 25, 0.0, 0.3333333333333333, 1.0, ir252
krl0 = 2.0
kr0 = krl0
S262 sprintf "alive_%d", ir252
 chnset kr0, S262
ir265 FreePort 
 event_i "i", 21, 1.0, 0.3333333333333333, ir265, ir1
 event_i "i", 25, 1.0, 0.3333333333333333, 1.0, ir265
krl0 = 2.0
kr0 = krl0
S275 sprintf "alive_%d", ir265
 chnset kr0, S275
ir278 FreePort 
 event_i "i", 19, 1.6666666666666665, 0.3333333333333333, ir278, ir1
 event_i "i", 25, 1.6666666666666665, 0.3333333333333333, 1.0, ir278
krl0 = 2.0
kr0 = krl0
S288 sprintf "alive_%d", ir278
 chnset kr0, S288
ir291 FreePort 
 event_i "i", 21, 2.333333333333333, 0.3333333333333333, ir291, ir1
 event_i "i", 25, 2.333333333333333, 0.3333333333333333, 1.0, ir291
krl0 = 2.0
kr0 = krl0
S301 sprintf "alive_%d", ir291
 chnset kr0, S301
ir304 FreePort 
 event_i "i", 19, 2.6666666666666665, 0.16666666666666666, ir304, ir1
 event_i "i", 18, 2.6666666666666665, 0.16666666666666666, 1.0, ir304
krl0 = 2.0
kr0 = krl0
S314 sprintf "alive_%d", ir304
 chnset kr0, S314
ir317 FreePort 
 event_i "i", 20, 2.833333333333333, 0.16666666666666666, ir317, ir1
 event_i "i", 18, 2.833333333333333, 0.16666666666666666, 1.0, ir317
krl0 = 2.0
kr0 = krl0
S327 sprintf "alive_%d", ir317
 chnset kr0, S327
ir330 FreePort 
 event_i "i", 21, 2.9999999999999996, 0.16666666666666666, ir330, ir1
 event_i "i", 18, 2.9999999999999996, 0.16666666666666666, 1.0, ir330
krl0 = 2.0
kr0 = krl0
S340 sprintf "alive_%d", ir330
 chnset kr0, S340
ir343 FreePort 
 event_i "i", 21, 3.166666666666666, 0.16666666666666666, ir343, ir1
 event_i "i", 18, 3.166666666666666, 0.16666666666666666, 1.0, ir343
krl0 = 2.0
kr0 = krl0
S353 sprintf "alive_%d", ir343
 chnset kr0, S353
ir356 FreePort 
 event_i "i", 19, 3.3333333333333326, 0.16666666666666666, ir356, ir1
 event_i "i", 18, 3.3333333333333326, 0.16666666666666666, 1.0, ir356
krl0 = 2.0
kr0 = krl0
S366 sprintf "alive_%d", ir356
 chnset kr0, S366
ir369 FreePort 
 event_i "i", 20, 3.499999999999999, 0.16666666666666666, ir369, ir1
 event_i "i", 18, 3.499999999999999, 0.16666666666666666, 1.0, ir369
krl0 = 2.0
kr0 = krl0
S379 sprintf "alive_%d", ir369
 chnset kr0, S379
ir382 FreePort 
 event_i "i", 21, 3.6666666666666656, 0.16666666666666666, ir382, ir1
 event_i "i", 18, 3.6666666666666656, 0.16666666666666666, 1.0, ir382
krl0 = 2.0
kr0 = krl0
S392 sprintf "alive_%d", ir382
 chnset kr0, S392
ir395 FreePort 
 event_i "i", 21, 3.833333333333332, 0.16666666666666666, ir395, ir1
 event_i "i", 18, 3.833333333333332, 0.16666666666666666, 1.0, ir395
krl0 = 2.0
kr0 = krl0
S405 sprintf "alive_%d", ir395
 chnset kr0, S405
ir408 FreePort 
 event_i "i", 19, 3.9999999999999987, 0.16666666666666666, ir408, ir1
 event_i "i", 18, 3.9999999999999987, 0.16666666666666666, 1.0, ir408
krl0 = 2.0
kr0 = krl0
S418 sprintf "alive_%d", ir408
 chnset kr0, S418
ir421 FreePort 
 event_i "i", 20, 4.166666666666665, 0.16666666666666666, ir421, ir1
 event_i "i", 18, 4.166666666666665, 0.16666666666666666, 1.0, ir421
krl0 = 2.0
kr0 = krl0
S431 sprintf "alive_%d", ir421
 chnset kr0, S431
ir434 FreePort 
 event_i "i", 21, 4.333333333333332, 0.16666666666666666, ir434, ir1
 event_i "i", 18, 4.333333333333332, 0.16666666666666666, 1.0, ir434
krl0 = 2.0
kr0 = krl0
S444 sprintf "alive_%d", ir434
 chnset kr0, S444
ir447 FreePort 
 event_i "i", 21, 4.499999999999999, 0.16666666666666666, ir447, ir1
 event_i "i", 18, 4.499999999999999, 0.16666666666666666, 1.0, ir447
krl0 = 2.0
kr0 = krl0
S457 sprintf "alive_%d", ir447
 chnset kr0, S457
ir460 FreePort 
 event_i "i", 19, 4.666666666666666, 0.16666666666666666, ir460, ir1
 event_i "i", 18, 4.666666666666666, 0.16666666666666666, 1.0, ir460
krl0 = 2.0
kr0 = krl0
S470 sprintf "alive_%d", ir460
 chnset kr0, S470
ir473 FreePort 
 event_i "i", 20, 4.833333333333333, 0.16666666666666666, ir473, ir1
 event_i "i", 18, 4.833333333333333, 0.16666666666666666, 1.0, ir473
krl0 = 2.0
kr0 = krl0
S483 sprintf "alive_%d", ir473
 chnset kr0, S483
ir486 FreePort 
 event_i "i", 21, 5.0, 0.16666666666666666, ir486, ir1
 event_i "i", 18, 5.0, 0.16666666666666666, 1.0, ir486
krl0 = 2.0
kr0 = krl0
S496 sprintf "alive_%d", ir486
 chnset kr0, S496
ir499 FreePort 
 event_i "i", 21, 5.166666666666667, 0.16666666666666666, ir499, ir1
 event_i "i", 18, 5.166666666666667, 0.16666666666666666, 1.0, ir499
krl0 = 2.0
kr0 = krl0
S509 sprintf "alive_%d", ir499
 chnset kr0, S509
ir512 FreePort 
 event_i "i", 23, 5.166666666666666, 0.16666666666666666, ir512, ir1
 event_i "i", 22, 5.166666666666666, 0.16666666666666666, 1.0, ir512
krl0 = 2.0
kr0 = krl0
S522 sprintf "alive_%d", ir512
 chnset kr0, S522
ir525 FreePort 
 event_i "i", 19, 3.333333333333333, 0.6666666666666666, ir525, ir1
 event_i "i", 24, 3.333333333333333, 0.6666666666666666, 1.0, ir525
krl0 = 2.0
kr0 = krl0
S535 sprintf "alive_%d", ir525
 chnset kr0, S535
ir538 FreePort 
 event_i "i", 19, 4.666666666666666, 0.6666666666666666, ir538, ir1
 event_i "i", 24, 4.666666666666666, 0.6666666666666666, 1.0, ir538
krl0 = 2.0
kr0 = krl0
S548 sprintf "alive_%d", ir538
 chnset kr0, S548
ir551 FreePort 
 event_i "i", 19, 2.6666666666666665, 0.3333333333333333, ir551, ir1
 event_i "i", 25, 2.6666666666666665, 0.3333333333333333, 1.0, ir551
krl0 = 2.0
kr0 = krl0
S561 sprintf "alive_%d", ir551
 chnset kr0, S561
ir564 FreePort 
 event_i "i", 21, 3.6666666666666665, 0.3333333333333333, ir564, ir1
 event_i "i", 25, 3.6666666666666665, 0.3333333333333333, 1.0, ir564
krl0 = 2.0
kr0 = krl0
S574 sprintf "alive_%d", ir564
 chnset kr0, S574
ir577 FreePort 
 event_i "i", 19, 4.333333333333333, 0.3333333333333333, ir577, ir1
 event_i "i", 25, 4.333333333333333, 0.3333333333333333, 1.0, ir577
krl0 = 2.0
kr0 = krl0
S587 sprintf "alive_%d", ir577
 chnset kr0, S587
ir590 FreePort 
 event_i "i", 21, 5.0, 0.3333333333333333, ir590, ir1
 event_i "i", 25, 5.0, 0.3333333333333333, 1.0, ir590
krl0 = 2.0
kr0 = krl0
S600 sprintf "alive_%d", ir590
 chnset kr0, S600
ir603 FreePort 
 event_i "i", 19, 5.333333333333333, 0.16666666666666666, ir603, ir1
 event_i "i", 18, 5.333333333333333, 0.16666666666666666, 1.0, ir603
krl0 = 2.0
kr0 = krl0
S613 sprintf "alive_%d", ir603
 chnset kr0, S613
ir616 FreePort 
 event_i "i", 20, 5.5, 0.16666666666666666, ir616, ir1
 event_i "i", 18, 5.5, 0.16666666666666666, 1.0, ir616
krl0 = 2.0
kr0 = krl0
S626 sprintf "alive_%d", ir616
 chnset kr0, S626
ir629 FreePort 
 event_i "i", 21, 5.635416666666666, 0.16666666666666666, ir629, ir1
 event_i "i", 18, 5.635416666666666, 0.16666666666666666, 1.0, ir629
krl0 = 2.0
kr0 = krl0
S639 sprintf "alive_%d", ir629
 chnset kr0, S639
ir642 FreePort 
 event_i "i", 21, 5.802083333333333, 0.16666666666666666, ir642, ir1
 event_i "i", 18, 5.802083333333333, 0.16666666666666666, 1.0, ir642
krl0 = 2.0
kr0 = krl0
S652 sprintf "alive_%d", ir642
 chnset kr0, S652
ir655 FreePort 
 event_i "i", 19, 6.0, 0.16666666666666666, ir655, ir1
 event_i "i", 18, 6.0, 0.16666666666666666, 1.0, ir655
krl0 = 2.0
kr0 = krl0
S665 sprintf "alive_%d", ir655
 chnset kr0, S665
ir668 FreePort 
 event_i "i", 20, 6.166666666666667, 0.16666666666666666, ir668, ir1
 event_i "i", 18, 6.166666666666667, 0.16666666666666666, 1.0, ir668
krl0 = 2.0
kr0 = krl0
S678 sprintf "alive_%d", ir668
 chnset kr0, S678
ir681 FreePort 
 event_i "i", 21, 6.302083333333333, 0.16666666666666666, ir681, ir1
 event_i "i", 18, 6.302083333333333, 0.16666666666666666, 1.0, ir681
krl0 = 2.0
kr0 = krl0
S691 sprintf "alive_%d", ir681
 chnset kr0, S691
ir694 FreePort 
 event_i "i", 21, 6.46875, 0.16666666666666666, ir694, ir1
 event_i "i", 18, 6.46875, 0.16666666666666666, 1.0, ir694
krl0 = 2.0
kr0 = krl0
S704 sprintf "alive_%d", ir694
 chnset kr0, S704
ir707 FreePort 
 event_i "i", 19, 6.666666666666667, 0.16666666666666666, ir707, ir1
 event_i "i", 18, 6.666666666666667, 0.16666666666666666, 1.0, ir707
krl0 = 2.0
kr0 = krl0
S717 sprintf "alive_%d", ir707
 chnset kr0, S717
ir720 FreePort 
 event_i "i", 20, 6.833333333333334, 0.16666666666666666, ir720, ir1
 event_i "i", 18, 6.833333333333334, 0.16666666666666666, 1.0, ir720
krl0 = 2.0
kr0 = krl0
S730 sprintf "alive_%d", ir720
 chnset kr0, S730
ir733 FreePort 
 event_i "i", 21, 6.96875, 0.16666666666666666, ir733, ir1
 event_i "i", 18, 6.96875, 0.16666666666666666, 1.0, ir733
krl0 = 2.0
kr0 = krl0
S743 sprintf "alive_%d", ir733
 chnset kr0, S743
ir746 FreePort 
 event_i "i", 21, 7.135416666666667, 0.16666666666666666, ir746, ir1
 event_i "i", 18, 7.135416666666667, 0.16666666666666666, 1.0, ir746
krl0 = 2.0
kr0 = krl0
S756 sprintf "alive_%d", ir746
 chnset kr0, S756
ir759 FreePort 
 event_i "i", 19, 7.333333333333334, 0.16666666666666666, ir759, ir1
 event_i "i", 18, 7.333333333333334, 0.16666666666666666, 1.0, ir759
krl0 = 2.0
kr0 = krl0
S769 sprintf "alive_%d", ir759
 chnset kr0, S769
ir772 FreePort 
 event_i "i", 20, 7.500000000000001, 0.16666666666666666, ir772, ir1
 event_i "i", 18, 7.500000000000001, 0.16666666666666666, 1.0, ir772
krl0 = 2.0
kr0 = krl0
S782 sprintf "alive_%d", ir772
 chnset kr0, S782
ir785 FreePort 
 event_i "i", 21, 7.635416666666667, 0.16666666666666666, ir785, ir1
 event_i "i", 18, 7.635416666666667, 0.16666666666666666, 1.0, ir785
krl0 = 2.0
kr0 = krl0
S795 sprintf "alive_%d", ir785
 chnset kr0, S795
ir798 FreePort 
 event_i "i", 21, 7.802083333333334, 0.16666666666666666, ir798, ir1
 event_i "i", 18, 7.802083333333334, 0.16666666666666666, 1.0, ir798
krl0 = 2.0
kr0 = krl0
S808 sprintf "alive_%d", ir798
 chnset kr0, S808
ir811 FreePort 
 event_i "i", 23, 7.833333333333332, 0.16666666666666666, ir811, ir1
 event_i "i", 22, 7.833333333333332, 0.16666666666666666, 1.0, ir811
krl0 = 2.0
kr0 = krl0
S821 sprintf "alive_%d", ir811
 chnset kr0, S821
ir824 FreePort 
 event_i "i", 19, 6.010416666666666, 0.6666666666666666, ir824, ir1
 event_i "i", 24, 6.010416666666666, 0.6666666666666666, 1.0, ir824
krl0 = 2.0
kr0 = krl0
S834 sprintf "alive_%d", ir824
 chnset kr0, S834
ir837 FreePort 
 event_i "i", 19, 7.343749999999999, 0.6666666666666666, ir837, ir1
 event_i "i", 24, 7.343749999999999, 0.6666666666666666, 1.0, ir837
krl0 = 2.0
kr0 = krl0
S847 sprintf "alive_%d", ir837
 chnset kr0, S847
ir850 FreePort 
 event_i "i", 19, 5.322916666666666, 0.3333333333333333, ir850, ir1
 event_i "i", 25, 5.322916666666666, 0.3333333333333333, 1.0, ir850
krl0 = 2.0
kr0 = krl0
S860 sprintf "alive_%d", ir850
 chnset kr0, S860
ir863 FreePort 
 event_i "i", 21, 6.322916666666666, 0.3333333333333333, ir863, ir1
 event_i "i", 25, 6.322916666666666, 0.3333333333333333, 1.0, ir863
krl0 = 2.0
kr0 = krl0
S873 sprintf "alive_%d", ir863
 chnset kr0, S873
ir876 FreePort 
 event_i "i", 19, 6.989583333333333, 0.3333333333333333, ir876, ir1
 event_i "i", 25, 6.989583333333333, 0.3333333333333333, 1.0, ir876
krl0 = 2.0
kr0 = krl0
S886 sprintf "alive_%d", ir876
 chnset kr0, S886
ir889 FreePort 
 event_i "i", 21, 7.65625, 0.3333333333333333, ir889, ir1
 event_i "i", 25, 7.65625, 0.3333333333333333, 1.0, ir889
krl0 = 2.0
kr0 = krl0
S899 sprintf "alive_%d", ir889
 chnset kr0, S899
ir902 FreePort 
 event_i "i", 19, 7.999999999999999, 0.16666666666666666, ir902, ir1
 event_i "i", 18, 7.999999999999999, 0.16666666666666666, 1.0, ir902
krl0 = 2.0
kr0 = krl0
S912 sprintf "alive_%d", ir902
 chnset kr0, S912
ir915 FreePort 
 event_i "i", 20, 8.166666666666666, 0.16666666666666666, ir915, ir1
 event_i "i", 18, 8.166666666666666, 0.16666666666666666, 1.0, ir915
krl0 = 2.0
kr0 = krl0
S925 sprintf "alive_%d", ir915
 chnset kr0, S925
ir928 FreePort 
 event_i "i", 21, 8.302083333333332, 0.16666666666666666, ir928, ir1
 event_i "i", 18, 8.302083333333332, 0.16666666666666666, 1.0, ir928
krl0 = 2.0
kr0 = krl0
S938 sprintf "alive_%d", ir928
 chnset kr0, S938
ir941 FreePort 
 event_i "i", 21, 8.468749999999998, 0.16666666666666666, ir941, ir1
 event_i "i", 18, 8.468749999999998, 0.16666666666666666, 1.0, ir941
krl0 = 2.0
kr0 = krl0
S951 sprintf "alive_%d", ir941
 chnset kr0, S951
ir954 FreePort 
 event_i "i", 19, 8.666666666666666, 0.16666666666666666, ir954, ir1
 event_i "i", 18, 8.666666666666666, 0.16666666666666666, 1.0, ir954
krl0 = 2.0
kr0 = krl0
S964 sprintf "alive_%d", ir954
 chnset kr0, S964
ir967 FreePort 
 event_i "i", 20, 8.833333333333332, 0.16666666666666666, ir967, ir1
 event_i "i", 18, 8.833333333333332, 0.16666666666666666, 1.0, ir967
krl0 = 2.0
kr0 = krl0
S977 sprintf "alive_%d", ir967
 chnset kr0, S977
ir980 FreePort 
 event_i "i", 21, 8.96875, 0.16666666666666666, ir980, ir1
 event_i "i", 18, 8.96875, 0.16666666666666666, 1.0, ir980
krl0 = 2.0
kr0 = krl0
S990 sprintf "alive_%d", ir980
 chnset kr0, S990
ir993 FreePort 
 event_i "i", 21, 9.135416666666666, 0.16666666666666666, ir993, ir1
 event_i "i", 18, 9.135416666666666, 0.16666666666666666, 1.0, ir993
krl0 = 2.0
kr0 = krl0
S1003 sprintf "alive_%d", ir993
 chnset kr0, S1003
ir1006 FreePort 
 event_i "i", 19, 9.333333333333332, 0.16666666666666666, ir1006, ir1
 event_i "i", 18, 9.333333333333332, 0.16666666666666666, 1.0, ir1006
krl0 = 2.0
kr0 = krl0
S1016 sprintf "alive_%d", ir1006
 chnset kr0, S1016
ir1019 FreePort 
 event_i "i", 20, 9.499999999999998, 0.16666666666666666, ir1019, ir1
 event_i "i", 18, 9.499999999999998, 0.16666666666666666, 1.0, ir1019
krl0 = 2.0
kr0 = krl0
S1029 sprintf "alive_%d", ir1019
 chnset kr0, S1029
ir1032 FreePort 
 event_i "i", 21, 9.635416666666666, 0.16666666666666666, ir1032, ir1
 event_i "i", 18, 9.635416666666666, 0.16666666666666666, 1.0, ir1032
krl0 = 2.0
kr0 = krl0
S1042 sprintf "alive_%d", ir1032
 chnset kr0, S1042
ir1045 FreePort 
 event_i "i", 21, 9.802083333333332, 0.16666666666666666, ir1045, ir1
 event_i "i", 18, 9.802083333333332, 0.16666666666666666, 1.0, ir1045
krl0 = 2.0
kr0 = krl0
S1055 sprintf "alive_%d", ir1045
 chnset kr0, S1055
ir1058 FreePort 
 event_i "i", 19, 9.999999999999998, 0.16666666666666666, ir1058, ir1
 event_i "i", 18, 9.999999999999998, 0.16666666666666666, 1.0, ir1058
krl0 = 2.0
kr0 = krl0
S1068 sprintf "alive_%d", ir1058
 chnset kr0, S1068
ir1071 FreePort 
 event_i "i", 20, 10.166666666666664, 0.16666666666666666, ir1071, ir1
 event_i "i", 18, 10.166666666666664, 0.16666666666666666, 1.0, ir1071
krl0 = 2.0
kr0 = krl0
S1081 sprintf "alive_%d", ir1071
 chnset kr0, S1081
ir1084 FreePort 
 event_i "i", 21, 10.302083333333332, 0.16666666666666666, ir1084, ir1
 event_i "i", 18, 10.302083333333332, 0.16666666666666666, 1.0, ir1084
krl0 = 2.0
kr0 = krl0
S1094 sprintf "alive_%d", ir1084
 chnset kr0, S1094
ir1097 FreePort 
 event_i "i", 21, 10.468749999999998, 0.16666666666666666, ir1097, ir1
 event_i "i", 18, 10.468749999999998, 0.16666666666666666, 1.0, ir1097
krl0 = 2.0
kr0 = krl0
S1107 sprintf "alive_%d", ir1097
 chnset kr0, S1107
ir1110 FreePort 
 event_i "i", 23, 10.499999999999998, 0.16666666666666666, ir1110, ir1
 event_i "i", 22, 10.499999999999998, 0.16666666666666666, 1.0, ir1110
krl0 = 2.0
kr0 = krl0
S1120 sprintf "alive_%d", ir1110
 chnset kr0, S1120
ir1123 FreePort 
 event_i "i", 19, 8.677083333333332, 0.6666666666666666, ir1123, ir1
 event_i "i", 24, 8.677083333333332, 0.6666666666666666, 1.0, ir1123
krl0 = 2.0
kr0 = krl0
S1133 sprintf "alive_%d", ir1123
 chnset kr0, S1133
ir1136 FreePort 
 event_i "i", 19, 10.010416666666666, 0.6666666666666666, ir1136, ir1
 event_i "i", 24, 10.010416666666666, 0.6666666666666666, 1.0, ir1136
krl0 = 2.0
kr0 = krl0
S1146 sprintf "alive_%d", ir1136
 chnset kr0, S1146
ir1149 FreePort 
 event_i "i", 19, 7.989583333333332, 0.3333333333333333, ir1149, ir1
 event_i "i", 25, 7.989583333333332, 0.3333333333333333, 1.0, ir1149
krl0 = 2.0
kr0 = krl0
S1159 sprintf "alive_%d", ir1149
 chnset kr0, S1159
ir1162 FreePort 
 event_i "i", 21, 8.989583333333332, 0.3333333333333333, ir1162, ir1
 event_i "i", 25, 8.989583333333332, 0.3333333333333333, 1.0, ir1162
krl0 = 2.0
kr0 = krl0
S1172 sprintf "alive_%d", ir1162
 chnset kr0, S1172
ir1175 FreePort 
 event_i "i", 19, 9.656249999999998, 0.3333333333333333, ir1175, ir1
 event_i "i", 25, 9.656249999999998, 0.3333333333333333, 1.0, ir1175
krl0 = 2.0
kr0 = krl0
S1185 sprintf "alive_%d", ir1175
 chnset kr0, S1185
ir1188 FreePort 
 event_i "i", 21, 10.322916666666664, 0.3333333333333333, ir1188, ir1
 event_i "i", 25, 10.322916666666664, 0.3333333333333333, 1.0, ir1188
krl0 = 2.0
kr0 = krl0
S1198 sprintf "alive_%d", ir1188
 chnset kr0, S1198
ir1201 FreePort 
 event_i "i", 19, 10.666666666666666, 0.19999999999999998, ir1201, ir1
 event_i "i", 18, 10.666666666666666, 0.19999999999999998, 1.0, ir1201
krl0 = 2.0
kr0 = krl0
S1211 sprintf "alive_%d", ir1201
 chnset kr0, S1211
ir1214 FreePort 
 event_i "i", 21, 10.866666666666665, 0.13333333333333333, ir1214, ir1
 event_i "i", 18, 10.866666666666665, 0.13333333333333333, 1.0, ir1214
krl0 = 2.0
kr0 = krl0
S1224 sprintf "alive_%d", ir1214
 chnset kr0, S1224
ir1227 FreePort 
 event_i "i", 19, 11.0, 0.19999999999999998, ir1227, ir1
 event_i "i", 18, 11.0, 0.19999999999999998, 1.0, ir1227
krl0 = 2.0
kr0 = krl0
S1237 sprintf "alive_%d", ir1227
 chnset kr0, S1237
ir1240 FreePort 
 event_i "i", 21, 11.2, 0.13333333333333333, ir1240, ir1
 event_i "i", 18, 11.2, 0.13333333333333333, 1.0, ir1240
krl0 = 2.0
kr0 = krl0
S1250 sprintf "alive_%d", ir1240
 chnset kr0, S1250
ir1253 FreePort 
 event_i "i", 19, 11.333333333333334, 0.19999999999999998, ir1253, ir1
 event_i "i", 18, 11.333333333333334, 0.19999999999999998, 1.0, ir1253
krl0 = 2.0
kr0 = krl0
S1263 sprintf "alive_%d", ir1253
 chnset kr0, S1263
ir1266 FreePort 
 event_i "i", 21, 11.533333333333333, 0.13333333333333333, ir1266, ir1
 event_i "i", 18, 11.533333333333333, 0.13333333333333333, 1.0, ir1266
krl0 = 2.0
kr0 = krl0
S1276 sprintf "alive_%d", ir1266
 chnset kr0, S1276
ir1279 FreePort 
 event_i "i", 19, 11.666666666666668, 0.19999999999999998, ir1279, ir1
 event_i "i", 18, 11.666666666666668, 0.19999999999999998, 1.0, ir1279
krl0 = 2.0
kr0 = krl0
S1289 sprintf "alive_%d", ir1279
 chnset kr0, S1289
ir1292 FreePort 
 event_i "i", 21, 11.866666666666667, 0.13333333333333333, ir1292, ir1
 event_i "i", 18, 11.866666666666667, 0.13333333333333333, 1.0, ir1292
krl0 = 2.0
kr0 = krl0
S1302 sprintf "alive_%d", ir1292
 chnset kr0, S1302
ir1305 FreePort 
 event_i "i", 19, 12.000000000000002, 0.19999999999999998, ir1305, ir1
 event_i "i", 18, 12.000000000000002, 0.19999999999999998, 1.0, ir1305
krl0 = 2.0
kr0 = krl0
S1315 sprintf "alive_%d", ir1305
 chnset kr0, S1315
ir1318 FreePort 
 event_i "i", 21, 12.200000000000001, 0.13333333333333333, ir1318, ir1
 event_i "i", 18, 12.200000000000001, 0.13333333333333333, 1.0, ir1318
krl0 = 2.0
kr0 = krl0
S1328 sprintf "alive_%d", ir1318
 chnset kr0, S1328
ir1331 FreePort 
 event_i "i", 19, 12.333333333333336, 0.19999999999999998, ir1331, ir1
 event_i "i", 18, 12.333333333333336, 0.19999999999999998, 1.0, ir1331
krl0 = 2.0
kr0 = krl0
S1341 sprintf "alive_%d", ir1331
 chnset kr0, S1341
ir1344 FreePort 
 event_i "i", 21, 12.533333333333335, 0.13333333333333333, ir1344, ir1
 event_i "i", 18, 12.533333333333335, 0.13333333333333333, 1.0, ir1344
krl0 = 2.0
kr0 = krl0
S1354 sprintf "alive_%d", ir1344
 chnset kr0, S1354
ir1357 FreePort 
 event_i "i", 19, 12.66666666666667, 0.19999999999999998, ir1357, ir1
 event_i "i", 18, 12.66666666666667, 0.19999999999999998, 1.0, ir1357
krl0 = 2.0
kr0 = krl0
S1367 sprintf "alive_%d", ir1357
 chnset kr0, S1367
ir1370 FreePort 
 event_i "i", 21, 12.866666666666669, 0.13333333333333333, ir1370, ir1
 event_i "i", 18, 12.866666666666669, 0.13333333333333333, 1.0, ir1370
krl0 = 2.0
kr0 = krl0
S1380 sprintf "alive_%d", ir1370
 chnset kr0, S1380
ir1383 FreePort 
 event_i "i", 19, 13.000000000000004, 0.19999999999999998, ir1383, ir1
 event_i "i", 18, 13.000000000000004, 0.19999999999999998, 1.0, ir1383
krl0 = 2.0
kr0 = krl0
S1393 sprintf "alive_%d", ir1383
 chnset kr0, S1393
ir1396 FreePort 
 event_i "i", 21, 13.200000000000003, 0.13333333333333333, ir1396, ir1
 event_i "i", 18, 13.200000000000003, 0.13333333333333333, 1.0, ir1396
krl0 = 2.0
kr0 = krl0
S1406 sprintf "alive_%d", ir1396
 chnset kr0, S1406
ir1409 FreePort 
 event_i "i", 23, 13.166666666666666, 0.16666666666666666, ir1409, ir1
 event_i "i", 22, 13.166666666666666, 0.16666666666666666, 1.0, ir1409
krl0 = 2.0
kr0 = krl0
S1419 sprintf "alive_%d", ir1409
 chnset kr0, S1419
ir1422 FreePort 
 event_i "i", 19, 11.333333333333332, 0.6666666666666666, ir1422, ir1
 event_i "i", 24, 11.333333333333332, 0.6666666666666666, 1.0, ir1422
krl0 = 2.0
kr0 = krl0
S1432 sprintf "alive_%d", ir1422
 chnset kr0, S1432
ir1435 FreePort 
 event_i "i", 19, 12.666666666666666, 0.6666666666666666, ir1435, ir1
 event_i "i", 24, 12.666666666666666, 0.6666666666666666, 1.0, ir1435
krl0 = 2.0
kr0 = krl0
S1445 sprintf "alive_%d", ir1435
 chnset kr0, S1445
ir1448 FreePort 
 event_i "i", 19, 10.666666666666666, 0.3333333333333333, ir1448, ir1
 event_i "i", 25, 10.666666666666666, 0.3333333333333333, 1.0, ir1448
krl0 = 2.0
kr0 = krl0
S1458 sprintf "alive_%d", ir1448
 chnset kr0, S1458
ir1461 FreePort 
 event_i "i", 21, 11.666666666666666, 0.3333333333333333, ir1461, ir1
 event_i "i", 25, 11.666666666666666, 0.3333333333333333, 1.0, ir1461
krl0 = 2.0
kr0 = krl0
S1471 sprintf "alive_%d", ir1461
 chnset kr0, S1471
ir1474 FreePort 
 event_i "i", 19, 12.333333333333332, 0.3333333333333333, ir1474, ir1
 event_i "i", 25, 12.333333333333332, 0.3333333333333333, 1.0, ir1474
krl0 = 2.0
kr0 = krl0
S1484 sprintf "alive_%d", ir1474
 chnset kr0, S1484
ir1487 FreePort 
 event_i "i", 21, 12.999999999999998, 0.3333333333333333, ir1487, ir1
 event_i "i", 25, 12.999999999999998, 0.3333333333333333, 1.0, ir1487
krl0 = 2.0
kr0 = krl0
S1497 sprintf "alive_%d", ir1487
 chnset kr0, S1497
ir1500 FreePort 
 event_i "i", 19, 13.333333333333332, 0.19999999999999998, ir1500, ir1
 event_i "i", 18, 13.333333333333332, 0.19999999999999998, 1.0, ir1500
krl0 = 2.0
kr0 = krl0
S1510 sprintf "alive_%d", ir1500
 chnset kr0, S1510
ir1513 FreePort 
 event_i "i", 21, 13.533333333333331, 0.13333333333333333, ir1513, ir1
 event_i "i", 18, 13.533333333333331, 0.13333333333333333, 1.0, ir1513
krl0 = 2.0
kr0 = krl0
S1523 sprintf "alive_%d", ir1513
 chnset kr0, S1523
ir1526 FreePort 
 event_i "i", 19, 13.666666666666666, 0.19999999999999998, ir1526, ir1
 event_i "i", 18, 13.666666666666666, 0.19999999999999998, 1.0, ir1526
krl0 = 2.0
kr0 = krl0
S1536 sprintf "alive_%d", ir1526
 chnset kr0, S1536
ir1539 FreePort 
 event_i "i", 21, 13.866666666666665, 0.13333333333333333, ir1539, ir1
 event_i "i", 18, 13.866666666666665, 0.13333333333333333, 1.0, ir1539
krl0 = 2.0
kr0 = krl0
S1549 sprintf "alive_%d", ir1539
 chnset kr0, S1549
ir1552 FreePort 
 event_i "i", 19, 14.0, 0.19999999999999998, ir1552, ir1
 event_i "i", 18, 14.0, 0.19999999999999998, 1.0, ir1552
krl0 = 2.0
kr0 = krl0
S1562 sprintf "alive_%d", ir1552
 chnset kr0, S1562
ir1565 FreePort 
 event_i "i", 21, 14.2, 0.13333333333333333, ir1565, ir1
 event_i "i", 18, 14.2, 0.13333333333333333, 1.0, ir1565
krl0 = 2.0
kr0 = krl0
S1575 sprintf "alive_%d", ir1565
 chnset kr0, S1575
ir1578 FreePort 
 event_i "i", 19, 14.333333333333334, 0.19999999999999998, ir1578, ir1
 event_i "i", 18, 14.333333333333334, 0.19999999999999998, 1.0, ir1578
krl0 = 2.0
kr0 = krl0
S1588 sprintf "alive_%d", ir1578
 chnset kr0, S1588
ir1591 FreePort 
 event_i "i", 21, 14.533333333333333, 0.13333333333333333, ir1591, ir1
 event_i "i", 18, 14.533333333333333, 0.13333333333333333, 1.0, ir1591
krl0 = 2.0
kr0 = krl0
S1601 sprintf "alive_%d", ir1591
 chnset kr0, S1601
ir1604 FreePort 
 event_i "i", 19, 14.666666666666668, 0.19999999999999998, ir1604, ir1
 event_i "i", 18, 14.666666666666668, 0.19999999999999998, 1.0, ir1604
krl0 = 2.0
kr0 = krl0
S1614 sprintf "alive_%d", ir1604
 chnset kr0, S1614
ir1617 FreePort 
 event_i "i", 21, 14.866666666666667, 0.13333333333333333, ir1617, ir1
 event_i "i", 18, 14.866666666666667, 0.13333333333333333, 1.0, ir1617
krl0 = 2.0
kr0 = krl0
S1627 sprintf "alive_%d", ir1617
 chnset kr0, S1627
ir1630 FreePort 
 event_i "i", 19, 15.000000000000002, 0.19999999999999998, ir1630, ir1
 event_i "i", 18, 15.000000000000002, 0.19999999999999998, 1.0, ir1630
krl0 = 2.0
kr0 = krl0
S1640 sprintf "alive_%d", ir1630
 chnset kr0, S1640
ir1643 FreePort 
 event_i "i", 21, 15.200000000000001, 0.13333333333333333, ir1643, ir1
 event_i "i", 18, 15.200000000000001, 0.13333333333333333, 1.0, ir1643
krl0 = 2.0
kr0 = krl0
S1653 sprintf "alive_%d", ir1643
 chnset kr0, S1653
ir1656 FreePort 
 event_i "i", 19, 15.333333333333336, 0.19999999999999998, ir1656, ir1
 event_i "i", 18, 15.333333333333336, 0.19999999999999998, 1.0, ir1656
krl0 = 2.0
kr0 = krl0
S1666 sprintf "alive_%d", ir1656
 chnset kr0, S1666
ir1669 FreePort 
 event_i "i", 21, 15.533333333333335, 0.13333333333333333, ir1669, ir1
 event_i "i", 18, 15.533333333333335, 0.13333333333333333, 1.0, ir1669
krl0 = 2.0
kr0 = krl0
S1679 sprintf "alive_%d", ir1669
 chnset kr0, S1679
ir1682 FreePort 
 event_i "i", 19, 15.66666666666667, 0.19999999999999998, ir1682, ir1
 event_i "i", 18, 15.66666666666667, 0.19999999999999998, 1.0, ir1682
krl0 = 2.0
kr0 = krl0
S1692 sprintf "alive_%d", ir1682
 chnset kr0, S1692
ir1695 FreePort 
 event_i "i", 21, 15.866666666666669, 0.13333333333333333, ir1695, ir1
 event_i "i", 18, 15.866666666666669, 0.13333333333333333, 1.0, ir1695
krl0 = 2.0
kr0 = krl0
S1705 sprintf "alive_%d", ir1695
 chnset kr0, S1705
ir1708 FreePort 
 event_i "i", 23, 15.833333333333332, 0.16666666666666666, ir1708, ir1
 event_i "i", 22, 15.833333333333332, 0.16666666666666666, 1.0, ir1708
krl0 = 2.0
kr0 = krl0
S1718 sprintf "alive_%d", ir1708
 chnset kr0, S1718
ir1721 FreePort 
 event_i "i", 19, 13.999999999999998, 0.6666666666666666, ir1721, ir1
 event_i "i", 24, 13.999999999999998, 0.6666666666666666, 1.0, ir1721
krl0 = 2.0
kr0 = krl0
S1731 sprintf "alive_%d", ir1721
 chnset kr0, S1731
ir1734 FreePort 
 event_i "i", 19, 15.333333333333332, 0.6666666666666666, ir1734, ir1
 event_i "i", 24, 15.333333333333332, 0.6666666666666666, 1.0, ir1734
krl0 = 2.0
kr0 = krl0
S1744 sprintf "alive_%d", ir1734
 chnset kr0, S1744
ir1747 FreePort 
 event_i "i", 19, 13.333333333333332, 0.3333333333333333, ir1747, ir1
 event_i "i", 25, 13.333333333333332, 0.3333333333333333, 1.0, ir1747
krl0 = 2.0
kr0 = krl0
S1757 sprintf "alive_%d", ir1747
 chnset kr0, S1757
ir1760 FreePort 
 event_i "i", 21, 14.333333333333332, 0.3333333333333333, ir1760, ir1
 event_i "i", 25, 14.333333333333332, 0.3333333333333333, 1.0, ir1760
krl0 = 2.0
kr0 = krl0
S1770 sprintf "alive_%d", ir1760
 chnset kr0, S1770
ir1773 FreePort 
 event_i "i", 19, 14.999999999999998, 0.3333333333333333, ir1773, ir1
 event_i "i", 25, 14.999999999999998, 0.3333333333333333, 1.0, ir1773
krl0 = 2.0
kr0 = krl0
S1783 sprintf "alive_%d", ir1773
 chnset kr0, S1783
ir1786 FreePort 
 event_i "i", 21, 15.666666666666664, 0.3333333333333333, ir1786, ir1
 event_i "i", 25, 15.666666666666664, 0.3333333333333333, 1.0, ir1786
krl0 = 2.0
kr0 = krl0
S1796 sprintf "alive_%d", ir1786
 chnset kr0, S1796
ir1799 FreePort 
 event_i "i", 19, 16.0, 0.26666666666666666, ir1799, ir1
 event_i "i", 18, 16.0, 0.26666666666666666, 1.0, ir1799
krl0 = 2.0
kr0 = krl0
S1809 sprintf "alive_%d", ir1799
 chnset kr0, S1809
ir1812 FreePort 
 event_i "i", 21, 16.266666666666666, 0.17777777777777776, ir1812, ir1
 event_i "i", 18, 16.266666666666666, 0.17777777777777776, 1.0, ir1812
krl0 = 2.0
kr0 = krl0
S1822 sprintf "alive_%d", ir1812
 chnset kr0, S1822
ir1825 FreePort 
 event_i "i", 19, 16.444444444444443, 0.26666666666666666, ir1825, ir1
 event_i "i", 18, 16.444444444444443, 0.26666666666666666, 1.0, ir1825
krl0 = 2.0
kr0 = krl0
S1835 sprintf "alive_%d", ir1825
 chnset kr0, S1835
ir1838 FreePort 
 event_i "i", 21, 16.71111111111111, 0.17777777777777776, ir1838, ir1
 event_i "i", 18, 16.71111111111111, 0.17777777777777776, 1.0, ir1838
krl0 = 2.0
kr0 = krl0
S1848 sprintf "alive_%d", ir1838
 chnset kr0, S1848
ir1851 FreePort 
 event_i "i", 19, 16.888888888888886, 0.26666666666666666, ir1851, ir1
 event_i "i", 18, 16.888888888888886, 0.26666666666666666, 1.0, ir1851
krl0 = 2.0
kr0 = krl0
S1861 sprintf "alive_%d", ir1851
 chnset kr0, S1861
ir1864 FreePort 
 event_i "i", 21, 17.15555555555555, 0.17777777777777776, ir1864, ir1
 event_i "i", 18, 17.15555555555555, 0.17777777777777776, 1.0, ir1864
krl0 = 2.0
kr0 = krl0
S1874 sprintf "alive_%d", ir1864
 chnset kr0, S1874
ir1877 FreePort 
 event_i "i", 19, 17.33333333333333, 0.26666666666666666, ir1877, ir1
 event_i "i", 18, 17.33333333333333, 0.26666666666666666, 1.0, ir1877
krl0 = 2.0
kr0 = krl0
S1887 sprintf "alive_%d", ir1877
 chnset kr0, S1887
ir1890 FreePort 
 event_i "i", 21, 17.599999999999994, 0.17777777777777776, ir1890, ir1
 event_i "i", 18, 17.599999999999994, 0.17777777777777776, 1.0, ir1890
krl0 = 2.0
kr0 = krl0
S1900 sprintf "alive_%d", ir1890
 chnset kr0, S1900
ir1903 FreePort 
 event_i "i", 19, 17.77777777777777, 0.26666666666666666, ir1903, ir1
 event_i "i", 18, 17.77777777777777, 0.26666666666666666, 1.0, ir1903
krl0 = 2.0
kr0 = krl0
S1913 sprintf "alive_%d", ir1903
 chnset kr0, S1913
ir1916 FreePort 
 event_i "i", 21, 18.044444444444437, 0.17777777777777776, ir1916, ir1
 event_i "i", 18, 18.044444444444437, 0.17777777777777776, 1.0, ir1916
krl0 = 2.0
kr0 = krl0
S1926 sprintf "alive_%d", ir1916
 chnset kr0, S1926
ir1929 FreePort 
 event_i "i", 19, 18.222222222222214, 0.26666666666666666, ir1929, ir1
 event_i "i", 18, 18.222222222222214, 0.26666666666666666, 1.0, ir1929
krl0 = 2.0
kr0 = krl0
S1939 sprintf "alive_%d", ir1929
 chnset kr0, S1939
ir1942 FreePort 
 event_i "i", 21, 18.48888888888888, 0.17777777777777776, ir1942, ir1
 event_i "i", 18, 18.48888888888888, 0.17777777777777776, 1.0, ir1942
krl0 = 2.0
kr0 = krl0
S1952 sprintf "alive_%d", ir1942
 chnset kr0, S1952
ir1955 FreePort 
 event_i "i", 19, 18.666666666666657, 0.26666666666666666, ir1955, ir1
 event_i "i", 18, 18.666666666666657, 0.26666666666666666, 1.0, ir1955
krl0 = 2.0
kr0 = krl0
S1965 sprintf "alive_%d", ir1955
 chnset kr0, S1965
ir1968 FreePort 
 event_i "i", 21, 18.933333333333323, 0.17777777777777776, ir1968, ir1
 event_i "i", 18, 18.933333333333323, 0.17777777777777776, 1.0, ir1968
krl0 = 2.0
kr0 = krl0
S1978 sprintf "alive_%d", ir1968
 chnset kr0, S1978
ir1981 FreePort 
 event_i "i", 19, 19.1111111111111, 0.26666666666666666, ir1981, ir1
 event_i "i", 18, 19.1111111111111, 0.26666666666666666, 1.0, ir1981
krl0 = 2.0
kr0 = krl0
S1991 sprintf "alive_%d", ir1981
 chnset kr0, S1991
ir1994 FreePort 
 event_i "i", 21, 19.377777777777766, 0.17777777777777776, ir1994, ir1
 event_i "i", 18, 19.377777777777766, 0.17777777777777776, 1.0, ir1994
krl0 = 2.0
kr0 = krl0
S2004 sprintf "alive_%d", ir1994
 chnset kr0, S2004
ir2007 FreePort 
 event_i "i", 23, 19.333333333333332, 0.2222222222222222, ir2007, ir1
 event_i "i", 22, 19.333333333333332, 0.2222222222222222, 1.0, ir2007
krl0 = 2.0
kr0 = krl0
S2017 sprintf "alive_%d", ir2007
 chnset kr0, S2017
ir2020 FreePort 
 event_i "i", 19, 16.88888888888889, 0.8888888888888888, ir2020, ir1
 event_i "i", 24, 16.88888888888889, 0.8888888888888888, 1.0, ir2020
krl0 = 2.0
kr0 = krl0
S2030 sprintf "alive_%d", ir2020
 chnset kr0, S2030
ir2033 FreePort 
 event_i "i", 19, 18.666666666666668, 0.8888888888888888, ir2033, ir1
 event_i "i", 24, 18.666666666666668, 0.8888888888888888, 1.0, ir2033
krl0 = 2.0
kr0 = krl0
S2043 sprintf "alive_%d", ir2033
 chnset kr0, S2043
ir2046 FreePort 
 event_i "i", 19, 16.0, 0.4444444444444444, ir2046, ir1
 event_i "i", 25, 16.0, 0.4444444444444444, 1.0, ir2046
krl0 = 2.0
kr0 = krl0
S2056 sprintf "alive_%d", ir2046
 chnset kr0, S2056
ir2059 FreePort 
 event_i "i", 19, 18.22222222222222, 0.4444444444444444, ir2059, ir1
 event_i "i", 25, 18.22222222222222, 0.4444444444444444, 1.0, ir2059
krl0 = 2.0
kr0 = krl0
S2069 sprintf "alive_%d", ir2059
 chnset kr0, S2069
ir2072 FreePort 
 event_i "i", 19, 19.555555555555557, 0.26666666666666666, ir2072, ir1
 event_i "i", 18, 19.555555555555557, 0.26666666666666666, 1.0, ir2072
krl0 = 2.0
kr0 = krl0
S2082 sprintf "alive_%d", ir2072
 chnset kr0, S2082
ir2085 FreePort 
 event_i "i", 21, 19.822222222222223, 0.17777777777777776, ir2085, ir1
 event_i "i", 18, 19.822222222222223, 0.17777777777777776, 1.0, ir2085
krl0 = 2.0
kr0 = krl0
S2095 sprintf "alive_%d", ir2085
 chnset kr0, S2095
ir2098 FreePort 
 event_i "i", 19, 20.0, 0.26666666666666666, ir2098, ir1
 event_i "i", 18, 20.0, 0.26666666666666666, 1.0, ir2098
krl0 = 2.0
kr0 = krl0
S2108 sprintf "alive_%d", ir2098
 chnset kr0, S2108
ir2111 FreePort 
 event_i "i", 21, 20.266666666666666, 0.17777777777777776, ir2111, ir1
 event_i "i", 18, 20.266666666666666, 0.17777777777777776, 1.0, ir2111
krl0 = 2.0
kr0 = krl0
S2121 sprintf "alive_%d", ir2111
 chnset kr0, S2121
ir2124 FreePort 
 event_i "i", 19, 20.444444444444443, 0.26666666666666666, ir2124, ir1
 event_i "i", 18, 20.444444444444443, 0.26666666666666666, 1.0, ir2124
krl0 = 2.0
kr0 = krl0
S2134 sprintf "alive_%d", ir2124
 chnset kr0, S2134
ir2137 FreePort 
 event_i "i", 21, 20.71111111111111, 0.17777777777777776, ir2137, ir1
 event_i "i", 18, 20.71111111111111, 0.17777777777777776, 1.0, ir2137
krl0 = 2.0
kr0 = krl0
S2147 sprintf "alive_%d", ir2137
 chnset kr0, S2147
ir2150 FreePort 
 event_i "i", 19, 20.888888888888886, 0.26666666666666666, ir2150, ir1
 event_i "i", 18, 20.888888888888886, 0.26666666666666666, 1.0, ir2150
krl0 = 2.0
kr0 = krl0
S2160 sprintf "alive_%d", ir2150
 chnset kr0, S2160
ir2163 FreePort 
 event_i "i", 21, 21.15555555555555, 0.17777777777777776, ir2163, ir1
 event_i "i", 18, 21.15555555555555, 0.17777777777777776, 1.0, ir2163
krl0 = 2.0
kr0 = krl0
S2173 sprintf "alive_%d", ir2163
 chnset kr0, S2173
ir2176 FreePort 
 event_i "i", 19, 21.33333333333333, 0.26666666666666666, ir2176, ir1
 event_i "i", 18, 21.33333333333333, 0.26666666666666666, 1.0, ir2176
krl0 = 2.0
kr0 = krl0
S2186 sprintf "alive_%d", ir2176
 chnset kr0, S2186
ir2189 FreePort 
 event_i "i", 21, 21.599999999999994, 0.17777777777777776, ir2189, ir1
 event_i "i", 18, 21.599999999999994, 0.17777777777777776, 1.0, ir2189
krl0 = 2.0
kr0 = krl0
S2199 sprintf "alive_%d", ir2189
 chnset kr0, S2199
ir2202 FreePort 
 event_i "i", 19, 21.77777777777777, 0.26666666666666666, ir2202, ir1
 event_i "i", 18, 21.77777777777777, 0.26666666666666666, 1.0, ir2202
krl0 = 2.0
kr0 = krl0
S2212 sprintf "alive_%d", ir2202
 chnset kr0, S2212
ir2215 FreePort 
 event_i "i", 21, 22.044444444444437, 0.17777777777777776, ir2215, ir1
 event_i "i", 18, 22.044444444444437, 0.17777777777777776, 1.0, ir2215
krl0 = 2.0
kr0 = krl0
S2225 sprintf "alive_%d", ir2215
 chnset kr0, S2225
ir2228 FreePort 
 event_i "i", 19, 22.222222222222214, 0.26666666666666666, ir2228, ir1
 event_i "i", 18, 22.222222222222214, 0.26666666666666666, 1.0, ir2228
krl0 = 2.0
kr0 = krl0
S2238 sprintf "alive_%d", ir2228
 chnset kr0, S2238
ir2241 FreePort 
 event_i "i", 21, 22.48888888888888, 0.17777777777777776, ir2241, ir1
 event_i "i", 18, 22.48888888888888, 0.17777777777777776, 1.0, ir2241
krl0 = 2.0
kr0 = krl0
S2251 sprintf "alive_%d", ir2241
 chnset kr0, S2251
ir2254 FreePort 
 event_i "i", 19, 22.666666666666657, 0.26666666666666666, ir2254, ir1
 event_i "i", 18, 22.666666666666657, 0.26666666666666666, 1.0, ir2254
krl0 = 2.0
kr0 = krl0
S2264 sprintf "alive_%d", ir2254
 chnset kr0, S2264
ir2267 FreePort 
 event_i "i", 21, 22.933333333333323, 0.17777777777777776, ir2267, ir1
 event_i "i", 18, 22.933333333333323, 0.17777777777777776, 1.0, ir2267
krl0 = 2.0
kr0 = krl0
S2277 sprintf "alive_%d", ir2267
 chnset kr0, S2277
ir2280 FreePort 
 event_i "i", 23, 22.88888888888889, 0.2222222222222222, ir2280, ir1
 event_i "i", 22, 22.88888888888889, 0.2222222222222222, 1.0, ir2280
krl0 = 2.0
kr0 = krl0
S2290 sprintf "alive_%d", ir2280
 chnset kr0, S2290
ir2293 FreePort 
 event_i "i", 19, 20.444444444444446, 0.8888888888888888, ir2293, ir1
 event_i "i", 24, 20.444444444444446, 0.8888888888888888, 1.0, ir2293
krl0 = 2.0
kr0 = krl0
S2303 sprintf "alive_%d", ir2293
 chnset kr0, S2303
ir2306 FreePort 
 event_i "i", 19, 22.222222222222225, 0.8888888888888888, ir2306, ir1
 event_i "i", 24, 22.222222222222225, 0.8888888888888888, 1.0, ir2306
krl0 = 2.0
kr0 = krl0
S2316 sprintf "alive_%d", ir2306
 chnset kr0, S2316
ir2319 FreePort 
 event_i "i", 19, 19.555555555555557, 0.4444444444444444, ir2319, ir1
 event_i "i", 25, 19.555555555555557, 0.4444444444444444, 1.0, ir2319
krl0 = 2.0
kr0 = krl0
S2329 sprintf "alive_%d", ir2319
 chnset kr0, S2329
ir2332 FreePort 
 event_i "i", 19, 21.77777777777778, 0.4444444444444444, ir2332, ir1
 event_i "i", 25, 21.77777777777778, 0.4444444444444444, 1.0, ir2332
krl0 = 2.0
kr0 = krl0
S2342 sprintf "alive_%d", ir2332
 chnset kr0, S2342
ir2345 FreePort 
 event_i "i", 19, 23.111111111111107, 0.16666666666666666, ir2345, ir1
 event_i "i", 18, 23.111111111111107, 0.16666666666666666, 1.0, ir2345
krl0 = 2.0
kr0 = krl0
S2355 sprintf "alive_%d", ir2345
 chnset kr0, S2355
ir2358 FreePort 
 event_i "i", 20, 23.277777777777775, 0.16666666666666666, ir2358, ir1
 event_i "i", 18, 23.277777777777775, 0.16666666666666666, 1.0, ir2358
krl0 = 2.0
kr0 = krl0
S2368 sprintf "alive_%d", ir2358
 chnset kr0, S2368
ir2371 FreePort 
 event_i "i", 21, 23.444444444444443, 0.16666666666666666, ir2371, ir1
 event_i "i", 18, 23.444444444444443, 0.16666666666666666, 1.0, ir2371
krl0 = 2.0
kr0 = krl0
S2381 sprintf "alive_%d", ir2371
 chnset kr0, S2381
ir2384 FreePort 
 event_i "i", 21, 23.61111111111111, 0.16666666666666666, ir2384, ir1
 event_i "i", 18, 23.61111111111111, 0.16666666666666666, 1.0, ir2384
krl0 = 2.0
kr0 = krl0
S2394 sprintf "alive_%d", ir2384
 chnset kr0, S2394
ir2397 FreePort 
 event_i "i", 19, 23.77777777777778, 0.16666666666666666, ir2397, ir1
 event_i "i", 18, 23.77777777777778, 0.16666666666666666, 1.0, ir2397
krl0 = 2.0
kr0 = krl0
S2407 sprintf "alive_%d", ir2397
 chnset kr0, S2407
ir2410 FreePort 
 event_i "i", 20, 23.944444444444446, 0.16666666666666666, ir2410, ir1
 event_i "i", 18, 23.944444444444446, 0.16666666666666666, 1.0, ir2410
krl0 = 2.0
kr0 = krl0
S2420 sprintf "alive_%d", ir2410
 chnset kr0, S2420
ir2423 FreePort 
 event_i "i", 21, 24.111111111111114, 0.16666666666666666, ir2423, ir1
 event_i "i", 18, 24.111111111111114, 0.16666666666666666, 1.0, ir2423
krl0 = 2.0
kr0 = krl0
S2433 sprintf "alive_%d", ir2423
 chnset kr0, S2433
ir2436 FreePort 
 event_i "i", 21, 24.277777777777782, 0.16666666666666666, ir2436, ir1
 event_i "i", 18, 24.277777777777782, 0.16666666666666666, 1.0, ir2436
krl0 = 2.0
kr0 = krl0
S2446 sprintf "alive_%d", ir2436
 chnset kr0, S2446
ir2449 FreePort 
 event_i "i", 19, 24.44444444444445, 0.16666666666666666, ir2449, ir1
 event_i "i", 18, 24.44444444444445, 0.16666666666666666, 1.0, ir2449
krl0 = 2.0
kr0 = krl0
S2459 sprintf "alive_%d", ir2449
 chnset kr0, S2459
ir2462 FreePort 
 event_i "i", 20, 24.611111111111118, 0.16666666666666666, ir2462, ir1
 event_i "i", 18, 24.611111111111118, 0.16666666666666666, 1.0, ir2462
krl0 = 2.0
kr0 = krl0
S2472 sprintf "alive_%d", ir2462
 chnset kr0, S2472
ir2475 FreePort 
 event_i "i", 21, 24.777777777777786, 0.16666666666666666, ir2475, ir1
 event_i "i", 18, 24.777777777777786, 0.16666666666666666, 1.0, ir2475
krl0 = 2.0
kr0 = krl0
S2485 sprintf "alive_%d", ir2475
 chnset kr0, S2485
ir2488 FreePort 
 event_i "i", 21, 24.944444444444454, 0.16666666666666666, ir2488, ir1
 event_i "i", 18, 24.944444444444454, 0.16666666666666666, 1.0, ir2488
krl0 = 2.0
kr0 = krl0
S2498 sprintf "alive_%d", ir2488
 chnset kr0, S2498
ir2501 FreePort 
 event_i "i", 19, 25.11111111111112, 0.16666666666666666, ir2501, ir1
 event_i "i", 18, 25.11111111111112, 0.16666666666666666, 1.0, ir2501
krl0 = 2.0
kr0 = krl0
S2511 sprintf "alive_%d", ir2501
 chnset kr0, S2511
ir2514 FreePort 
 event_i "i", 20, 25.27777777777779, 0.16666666666666666, ir2514, ir1
 event_i "i", 18, 25.27777777777779, 0.16666666666666666, 1.0, ir2514
krl0 = 2.0
kr0 = krl0
S2524 sprintf "alive_%d", ir2514
 chnset kr0, S2524
ir2527 FreePort 
 event_i "i", 21, 25.444444444444457, 0.16666666666666666, ir2527, ir1
 event_i "i", 18, 25.444444444444457, 0.16666666666666666, 1.0, ir2527
krl0 = 2.0
kr0 = krl0
S2537 sprintf "alive_%d", ir2527
 chnset kr0, S2537
ir2540 FreePort 
 event_i "i", 21, 25.611111111111125, 0.16666666666666666, ir2540, ir1
 event_i "i", 18, 25.611111111111125, 0.16666666666666666, 1.0, ir2540
krl0 = 2.0
kr0 = krl0
S2550 sprintf "alive_%d", ir2540
 chnset kr0, S2550
ir2553 FreePort 
 event_i "i", 23, 25.611111111111107, 0.16666666666666666, ir2553, ir1
 event_i "i", 22, 25.611111111111107, 0.16666666666666666, 1.0, ir2553
krl0 = 2.0
kr0 = krl0
S2563 sprintf "alive_%d", ir2553
 chnset kr0, S2563
ir2566 FreePort 
 event_i "i", 19, 23.777777777777775, 0.6666666666666666, ir2566, ir1
 event_i "i", 24, 23.777777777777775, 0.6666666666666666, 1.0, ir2566
krl0 = 2.0
kr0 = krl0
S2576 sprintf "alive_%d", ir2566
 chnset kr0, S2576
ir2579 FreePort 
 event_i "i", 19, 25.111111111111107, 0.6666666666666666, ir2579, ir1
 event_i "i", 24, 25.111111111111107, 0.6666666666666666, 1.0, ir2579
krl0 = 2.0
kr0 = krl0
S2589 sprintf "alive_%d", ir2579
 chnset kr0, S2589
ir2592 FreePort 
 event_i "i", 19, 23.111111111111107, 0.3333333333333333, ir2592, ir1
 event_i "i", 25, 23.111111111111107, 0.3333333333333333, 1.0, ir2592
krl0 = 2.0
kr0 = krl0
S2602 sprintf "alive_%d", ir2592
 chnset kr0, S2602
ir2605 FreePort 
 event_i "i", 21, 24.111111111111107, 0.3333333333333333, ir2605, ir1
 event_i "i", 25, 24.111111111111107, 0.3333333333333333, 1.0, ir2605
krl0 = 2.0
kr0 = krl0
S2615 sprintf "alive_%d", ir2605
 chnset kr0, S2615
ir2618 FreePort 
 event_i "i", 19, 24.777777777777775, 0.3333333333333333, ir2618, ir1
 event_i "i", 25, 24.777777777777775, 0.3333333333333333, 1.0, ir2618
krl0 = 2.0
kr0 = krl0
S2628 sprintf "alive_%d", ir2618
 chnset kr0, S2628
ir2631 FreePort 
 event_i "i", 21, 25.444444444444443, 0.3333333333333333, ir2631, ir1
 event_i "i", 25, 25.444444444444443, 0.3333333333333333, 1.0, ir2631
krl0 = 2.0
kr0 = krl0
S2641 sprintf "alive_%d", ir2631
 chnset kr0, S2641
ir2644 FreePort 
 event_i "i", 19, 25.777777777777775, 0.16666666666666666, ir2644, ir1
 event_i "i", 18, 25.777777777777775, 0.16666666666666666, 1.0, ir2644
krl0 = 2.0
kr0 = krl0
S2654 sprintf "alive_%d", ir2644
 chnset kr0, S2654
ir2657 FreePort 
 event_i "i", 20, 25.944444444444443, 0.16666666666666666, ir2657, ir1
 event_i "i", 18, 25.944444444444443, 0.16666666666666666, 1.0, ir2657
krl0 = 2.0
kr0 = krl0
S2667 sprintf "alive_%d", ir2657
 chnset kr0, S2667
ir2670 FreePort 
 event_i "i", 21, 26.11111111111111, 0.16666666666666666, ir2670, ir1
 event_i "i", 18, 26.11111111111111, 0.16666666666666666, 1.0, ir2670
krl0 = 2.0
kr0 = krl0
S2680 sprintf "alive_%d", ir2670
 chnset kr0, S2680
ir2683 FreePort 
 event_i "i", 21, 26.27777777777778, 0.16666666666666666, ir2683, ir1
 event_i "i", 18, 26.27777777777778, 0.16666666666666666, 1.0, ir2683
krl0 = 2.0
kr0 = krl0
S2693 sprintf "alive_%d", ir2683
 chnset kr0, S2693
ir2696 FreePort 
 event_i "i", 19, 26.444444444444446, 0.16666666666666666, ir2696, ir1
 event_i "i", 18, 26.444444444444446, 0.16666666666666666, 1.0, ir2696
krl0 = 2.0
kr0 = krl0
S2706 sprintf "alive_%d", ir2696
 chnset kr0, S2706
ir2709 FreePort 
 event_i "i", 20, 26.611111111111114, 0.16666666666666666, ir2709, ir1
 event_i "i", 18, 26.611111111111114, 0.16666666666666666, 1.0, ir2709
krl0 = 2.0
kr0 = krl0
S2719 sprintf "alive_%d", ir2709
 chnset kr0, S2719
ir2722 FreePort 
 event_i "i", 21, 26.777777777777782, 0.16666666666666666, ir2722, ir1
 event_i "i", 18, 26.777777777777782, 0.16666666666666666, 1.0, ir2722
krl0 = 2.0
kr0 = krl0
S2732 sprintf "alive_%d", ir2722
 chnset kr0, S2732
ir2735 FreePort 
 event_i "i", 21, 26.94444444444445, 0.16666666666666666, ir2735, ir1
 event_i "i", 18, 26.94444444444445, 0.16666666666666666, 1.0, ir2735
krl0 = 2.0
kr0 = krl0
S2745 sprintf "alive_%d", ir2735
 chnset kr0, S2745
ir2748 FreePort 
 event_i "i", 19, 27.111111111111118, 0.16666666666666666, ir2748, ir1
 event_i "i", 18, 27.111111111111118, 0.16666666666666666, 1.0, ir2748
krl0 = 2.0
kr0 = krl0
S2758 sprintf "alive_%d", ir2748
 chnset kr0, S2758
ir2761 FreePort 
 event_i "i", 20, 27.277777777777786, 0.16666666666666666, ir2761, ir1
 event_i "i", 18, 27.277777777777786, 0.16666666666666666, 1.0, ir2761
krl0 = 2.0
kr0 = krl0
S2771 sprintf "alive_%d", ir2761
 chnset kr0, S2771
ir2774 FreePort 
 event_i "i", 21, 27.444444444444454, 0.16666666666666666, ir2774, ir1
 event_i "i", 18, 27.444444444444454, 0.16666666666666666, 1.0, ir2774
krl0 = 2.0
kr0 = krl0
S2784 sprintf "alive_%d", ir2774
 chnset kr0, S2784
ir2787 FreePort 
 event_i "i", 21, 27.61111111111112, 0.16666666666666666, ir2787, ir1
 event_i "i", 18, 27.61111111111112, 0.16666666666666666, 1.0, ir2787
krl0 = 2.0
kr0 = krl0
S2797 sprintf "alive_%d", ir2787
 chnset kr0, S2797
ir2800 FreePort 
 event_i "i", 19, 27.77777777777779, 0.16666666666666666, ir2800, ir1
 event_i "i", 18, 27.77777777777779, 0.16666666666666666, 1.0, ir2800
krl0 = 2.0
kr0 = krl0
S2810 sprintf "alive_%d", ir2800
 chnset kr0, S2810
ir2813 FreePort 
 event_i "i", 20, 27.944444444444457, 0.16666666666666666, ir2813, ir1
 event_i "i", 18, 27.944444444444457, 0.16666666666666666, 1.0, ir2813
krl0 = 2.0
kr0 = krl0
S2823 sprintf "alive_%d", ir2813
 chnset kr0, S2823
ir2826 FreePort 
 event_i "i", 21, 28.111111111111125, 0.16666666666666666, ir2826, ir1
 event_i "i", 18, 28.111111111111125, 0.16666666666666666, 1.0, ir2826
krl0 = 2.0
kr0 = krl0
S2836 sprintf "alive_%d", ir2826
 chnset kr0, S2836
ir2839 FreePort 
 event_i "i", 21, 28.277777777777793, 0.16666666666666666, ir2839, ir1
 event_i "i", 18, 28.277777777777793, 0.16666666666666666, 1.0, ir2839
krl0 = 2.0
kr0 = krl0
S2849 sprintf "alive_%d", ir2839
 chnset kr0, S2849
ir2852 FreePort 
 event_i "i", 23, 28.277777777777775, 0.16666666666666666, ir2852, ir1
 event_i "i", 22, 28.277777777777775, 0.16666666666666666, 1.0, ir2852
krl0 = 2.0
kr0 = krl0
S2862 sprintf "alive_%d", ir2852
 chnset kr0, S2862
ir2865 FreePort 
 event_i "i", 19, 26.444444444444443, 0.6666666666666666, ir2865, ir1
 event_i "i", 24, 26.444444444444443, 0.6666666666666666, 1.0, ir2865
krl0 = 2.0
kr0 = krl0
S2875 sprintf "alive_%d", ir2865
 chnset kr0, S2875
ir2878 FreePort 
 event_i "i", 19, 27.777777777777775, 0.6666666666666666, ir2878, ir1
 event_i "i", 24, 27.777777777777775, 0.6666666666666666, 1.0, ir2878
krl0 = 2.0
kr0 = krl0
S2888 sprintf "alive_%d", ir2878
 chnset kr0, S2888
ir2891 FreePort 
 event_i "i", 19, 25.777777777777775, 0.3333333333333333, ir2891, ir1
 event_i "i", 25, 25.777777777777775, 0.3333333333333333, 1.0, ir2891
krl0 = 2.0
kr0 = krl0
S2901 sprintf "alive_%d", ir2891
 chnset kr0, S2901
ir2904 FreePort 
 event_i "i", 21, 26.777777777777775, 0.3333333333333333, ir2904, ir1
 event_i "i", 25, 26.777777777777775, 0.3333333333333333, 1.0, ir2904
krl0 = 2.0
kr0 = krl0
S2914 sprintf "alive_%d", ir2904
 chnset kr0, S2914
ir2917 FreePort 
 event_i "i", 19, 27.444444444444443, 0.3333333333333333, ir2917, ir1
 event_i "i", 25, 27.444444444444443, 0.3333333333333333, 1.0, ir2917
krl0 = 2.0
kr0 = krl0
S2927 sprintf "alive_%d", ir2917
 chnset kr0, S2927
ir2930 FreePort 
 event_i "i", 21, 28.11111111111111, 0.3333333333333333, ir2930, ir1
 event_i "i", 25, 28.11111111111111, 0.3333333333333333, 1.0, ir2930
krl0 = 2.0
kr0 = krl0
S2940 sprintf "alive_%d", ir2930
 chnset kr0, S2940
ir2943 FreePort 
 event_i "i", 19, 28.44444444444444, 0.16666666666666666, ir2943, ir1
 event_i "i", 18, 28.44444444444444, 0.16666666666666666, 1.0, ir2943
krl0 = 2.0
kr0 = krl0
S2953 sprintf "alive_%d", ir2943
 chnset kr0, S2953
ir2956 FreePort 
 event_i "i", 20, 28.611111111111107, 0.16666666666666666, ir2956, ir1
 event_i "i", 18, 28.611111111111107, 0.16666666666666666, 1.0, ir2956
krl0 = 2.0
kr0 = krl0
S2966 sprintf "alive_%d", ir2956
 chnset kr0, S2966
ir2969 FreePort 
 event_i "i", 21, 28.74652777777777, 0.16666666666666666, ir2969, ir1
 event_i "i", 18, 28.74652777777777, 0.16666666666666666, 1.0, ir2969
krl0 = 2.0
kr0 = krl0
S2979 sprintf "alive_%d", ir2969
 chnset kr0, S2979
ir2982 FreePort 
 event_i "i", 21, 28.91319444444444, 0.16666666666666666, ir2982, ir1
 event_i "i", 18, 28.91319444444444, 0.16666666666666666, 1.0, ir2982
krl0 = 2.0
kr0 = krl0
S2992 sprintf "alive_%d", ir2982
 chnset kr0, S2992
ir2995 FreePort 
 event_i "i", 19, 29.111111111111107, 0.16666666666666666, ir2995, ir1
 event_i "i", 18, 29.111111111111107, 0.16666666666666666, 1.0, ir2995
krl0 = 2.0
kr0 = krl0
S3005 sprintf "alive_%d", ir2995
 chnset kr0, S3005
ir3008 FreePort 
 event_i "i", 20, 29.277777777777775, 0.16666666666666666, ir3008, ir1
 event_i "i", 18, 29.277777777777775, 0.16666666666666666, 1.0, ir3008
krl0 = 2.0
kr0 = krl0
S3018 sprintf "alive_%d", ir3008
 chnset kr0, S3018
ir3021 FreePort 
 event_i "i", 21, 29.41319444444444, 0.16666666666666666, ir3021, ir1
 event_i "i", 18, 29.41319444444444, 0.16666666666666666, 1.0, ir3021
krl0 = 2.0
kr0 = krl0
S3031 sprintf "alive_%d", ir3021
 chnset kr0, S3031
ir3034 FreePort 
 event_i "i", 21, 29.579861111111107, 0.16666666666666666, ir3034, ir1
 event_i "i", 18, 29.579861111111107, 0.16666666666666666, 1.0, ir3034
krl0 = 2.0
kr0 = krl0
S3044 sprintf "alive_%d", ir3034
 chnset kr0, S3044
ir3047 FreePort 
 event_i "i", 19, 29.777777777777775, 0.16666666666666666, ir3047, ir1
 event_i "i", 18, 29.777777777777775, 0.16666666666666666, 1.0, ir3047
krl0 = 2.0
kr0 = krl0
S3057 sprintf "alive_%d", ir3047
 chnset kr0, S3057
ir3060 FreePort 
 event_i "i", 20, 29.944444444444443, 0.16666666666666666, ir3060, ir1
 event_i "i", 18, 29.944444444444443, 0.16666666666666666, 1.0, ir3060
krl0 = 2.0
kr0 = krl0
S3070 sprintf "alive_%d", ir3060
 chnset kr0, S3070
ir3073 FreePort 
 event_i "i", 21, 30.079861111111107, 0.16666666666666666, ir3073, ir1
 event_i "i", 18, 30.079861111111107, 0.16666666666666666, 1.0, ir3073
krl0 = 2.0
kr0 = krl0
S3083 sprintf "alive_%d", ir3073
 chnset kr0, S3083
ir3086 FreePort 
 event_i "i", 21, 30.246527777777775, 0.16666666666666666, ir3086, ir1
 event_i "i", 18, 30.246527777777775, 0.16666666666666666, 1.0, ir3086
krl0 = 2.0
kr0 = krl0
S3096 sprintf "alive_%d", ir3086
 chnset kr0, S3096
ir3099 FreePort 
 event_i "i", 19, 30.444444444444443, 0.16666666666666666, ir3099, ir1
 event_i "i", 18, 30.444444444444443, 0.16666666666666666, 1.0, ir3099
krl0 = 2.0
kr0 = krl0
S3109 sprintf "alive_%d", ir3099
 chnset kr0, S3109
ir3112 FreePort 
 event_i "i", 20, 30.61111111111111, 0.16666666666666666, ir3112, ir1
 event_i "i", 18, 30.61111111111111, 0.16666666666666666, 1.0, ir3112
krl0 = 2.0
kr0 = krl0
S3122 sprintf "alive_%d", ir3112
 chnset kr0, S3122
ir3125 FreePort 
 event_i "i", 21, 30.746527777777775, 0.16666666666666666, ir3125, ir1
 event_i "i", 18, 30.746527777777775, 0.16666666666666666, 1.0, ir3125
krl0 = 2.0
kr0 = krl0
S3135 sprintf "alive_%d", ir3125
 chnset kr0, S3135
ir3138 FreePort 
 event_i "i", 21, 30.913194444444443, 0.16666666666666666, ir3138, ir1
 event_i "i", 18, 30.913194444444443, 0.16666666666666666, 1.0, ir3138
krl0 = 2.0
kr0 = krl0
S3148 sprintf "alive_%d", ir3138
 chnset kr0, S3148
ir3151 FreePort 
 event_i "i", 23, 30.94444444444444, 0.16666666666666666, ir3151, ir1
 event_i "i", 22, 30.94444444444444, 0.16666666666666666, 1.0, ir3151
krl0 = 2.0
kr0 = krl0
S3161 sprintf "alive_%d", ir3151
 chnset kr0, S3161
ir3164 FreePort 
 event_i "i", 19, 29.12152777777777, 0.6666666666666666, ir3164, ir1
 event_i "i", 24, 29.12152777777777, 0.6666666666666666, 1.0, ir3164
krl0 = 2.0
kr0 = krl0
S3174 sprintf "alive_%d", ir3164
 chnset kr0, S3174
ir3177 FreePort 
 event_i "i", 19, 30.454861111111104, 0.6666666666666666, ir3177, ir1
 event_i "i", 24, 30.454861111111104, 0.6666666666666666, 1.0, ir3177
krl0 = 2.0
kr0 = krl0
S3187 sprintf "alive_%d", ir3177
 chnset kr0, S3187
ir3190 FreePort 
 event_i "i", 19, 28.43402777777777, 0.3333333333333333, ir3190, ir1
 event_i "i", 25, 28.43402777777777, 0.3333333333333333, 1.0, ir3190
krl0 = 2.0
kr0 = krl0
S3200 sprintf "alive_%d", ir3190
 chnset kr0, S3200
ir3203 FreePort 
 event_i "i", 21, 29.43402777777777, 0.3333333333333333, ir3203, ir1
 event_i "i", 25, 29.43402777777777, 0.3333333333333333, 1.0, ir3203
krl0 = 2.0
kr0 = krl0
S3213 sprintf "alive_%d", ir3203
 chnset kr0, S3213
ir3216 FreePort 
 event_i "i", 19, 30.10069444444444, 0.3333333333333333, ir3216, ir1
 event_i "i", 25, 30.10069444444444, 0.3333333333333333, 1.0, ir3216
krl0 = 2.0
kr0 = krl0
S3226 sprintf "alive_%d", ir3216
 chnset kr0, S3226
ir3229 FreePort 
 event_i "i", 21, 30.767361111111107, 0.3333333333333333, ir3229, ir1
 event_i "i", 25, 30.767361111111107, 0.3333333333333333, 1.0, ir3229
krl0 = 2.0
kr0 = krl0
S3239 sprintf "alive_%d", ir3229
 chnset kr0, S3239
ir3242 FreePort 
 event_i "i", 19, 31.111111111111107, 0.16666666666666666, ir3242, ir1
 event_i "i", 18, 31.111111111111107, 0.16666666666666666, 1.0, ir3242
krl0 = 2.0
kr0 = krl0
S3252 sprintf "alive_%d", ir3242
 chnset kr0, S3252
ir3255 FreePort 
 event_i "i", 20, 31.277777777777775, 0.16666666666666666, ir3255, ir1
 event_i "i", 18, 31.277777777777775, 0.16666666666666666, 1.0, ir3255
krl0 = 2.0
kr0 = krl0
S3265 sprintf "alive_%d", ir3255
 chnset kr0, S3265
ir3268 FreePort 
 event_i "i", 21, 31.41319444444444, 0.16666666666666666, ir3268, ir1
 event_i "i", 18, 31.41319444444444, 0.16666666666666666, 1.0, ir3268
krl0 = 2.0
kr0 = krl0
S3278 sprintf "alive_%d", ir3268
 chnset kr0, S3278
ir3281 FreePort 
 event_i "i", 21, 31.579861111111107, 0.16666666666666666, ir3281, ir1
 event_i "i", 18, 31.579861111111107, 0.16666666666666666, 1.0, ir3281
krl0 = 2.0
kr0 = krl0
S3291 sprintf "alive_%d", ir3281
 chnset kr0, S3291
ir3294 FreePort 
 event_i "i", 19, 31.777777777777775, 0.16666666666666666, ir3294, ir1
 event_i "i", 18, 31.777777777777775, 0.16666666666666666, 1.0, ir3294
krl0 = 2.0
kr0 = krl0
S3304 sprintf "alive_%d", ir3294
 chnset kr0, S3304
ir3307 FreePort 
 event_i "i", 20, 31.944444444444443, 0.16666666666666666, ir3307, ir1
 event_i "i", 18, 31.944444444444443, 0.16666666666666666, 1.0, ir3307
krl0 = 2.0
kr0 = krl0
S3317 sprintf "alive_%d", ir3307
 chnset kr0, S3317
ir3320 FreePort 
 event_i "i", 21, 32.07986111111111, 0.16666666666666666, ir3320, ir1
 event_i "i", 18, 32.07986111111111, 0.16666666666666666, 1.0, ir3320
krl0 = 2.0
kr0 = krl0
S3330 sprintf "alive_%d", ir3320
 chnset kr0, S3330
ir3333 FreePort 
 event_i "i", 21, 32.24652777777777, 0.16666666666666666, ir3333, ir1
 event_i "i", 18, 32.24652777777777, 0.16666666666666666, 1.0, ir3333
krl0 = 2.0
kr0 = krl0
S3343 sprintf "alive_%d", ir3333
 chnset kr0, S3343
ir3346 FreePort 
 event_i "i", 19, 32.44444444444444, 0.16666666666666666, ir3346, ir1
 event_i "i", 18, 32.44444444444444, 0.16666666666666666, 1.0, ir3346
krl0 = 2.0
kr0 = krl0
S3356 sprintf "alive_%d", ir3346
 chnset kr0, S3356
ir3359 FreePort 
 event_i "i", 20, 32.61111111111111, 0.16666666666666666, ir3359, ir1
 event_i "i", 18, 32.61111111111111, 0.16666666666666666, 1.0, ir3359
krl0 = 2.0
kr0 = krl0
S3369 sprintf "alive_%d", ir3359
 chnset kr0, S3369
ir3372 FreePort 
 event_i "i", 21, 32.74652777777778, 0.16666666666666666, ir3372, ir1
 event_i "i", 18, 32.74652777777778, 0.16666666666666666, 1.0, ir3372
krl0 = 2.0
kr0 = krl0
S3382 sprintf "alive_%d", ir3372
 chnset kr0, S3382
ir3385 FreePort 
 event_i "i", 21, 32.91319444444444, 0.16666666666666666, ir3385, ir1
 event_i "i", 18, 32.91319444444444, 0.16666666666666666, 1.0, ir3385
krl0 = 2.0
kr0 = krl0
S3395 sprintf "alive_%d", ir3385
 chnset kr0, S3395
ir3398 FreePort 
 event_i "i", 19, 33.11111111111111, 0.16666666666666666, ir3398, ir1
 event_i "i", 18, 33.11111111111111, 0.16666666666666666, 1.0, ir3398
krl0 = 2.0
kr0 = krl0
S3408 sprintf "alive_%d", ir3398
 chnset kr0, S3408
ir3411 FreePort 
 event_i "i", 20, 33.27777777777777, 0.16666666666666666, ir3411, ir1
 event_i "i", 18, 33.27777777777777, 0.16666666666666666, 1.0, ir3411
krl0 = 2.0
kr0 = krl0
S3421 sprintf "alive_%d", ir3411
 chnset kr0, S3421
ir3424 FreePort 
 event_i "i", 21, 33.41319444444444, 0.16666666666666666, ir3424, ir1
 event_i "i", 18, 33.41319444444444, 0.16666666666666666, 1.0, ir3424
krl0 = 2.0
kr0 = krl0
S3434 sprintf "alive_%d", ir3424
 chnset kr0, S3434
ir3437 FreePort 
 event_i "i", 21, 33.57986111111111, 0.16666666666666666, ir3437, ir1
 event_i "i", 18, 33.57986111111111, 0.16666666666666666, 1.0, ir3437
krl0 = 2.0
kr0 = krl0
S3447 sprintf "alive_%d", ir3437
 chnset kr0, S3447
ir3450 FreePort 
 event_i "i", 23, 33.61111111111111, 0.16666666666666666, ir3450, ir1
 event_i "i", 22, 33.61111111111111, 0.16666666666666666, 1.0, ir3450
krl0 = 2.0
kr0 = krl0
S3460 sprintf "alive_%d", ir3450
 chnset kr0, S3460
ir3463 FreePort 
 event_i "i", 19, 31.78819444444444, 0.6666666666666666, ir3463, ir1
 event_i "i", 24, 31.78819444444444, 0.6666666666666666, 1.0, ir3463
krl0 = 2.0
kr0 = krl0
S3473 sprintf "alive_%d", ir3463
 chnset kr0, S3473
ir3476 FreePort 
 event_i "i", 19, 33.12152777777777, 0.6666666666666666, ir3476, ir1
 event_i "i", 24, 33.12152777777777, 0.6666666666666666, 1.0, ir3476
krl0 = 2.0
kr0 = krl0
S3486 sprintf "alive_%d", ir3476
 chnset kr0, S3486
ir3489 FreePort 
 event_i "i", 19, 31.10069444444444, 0.3333333333333333, ir3489, ir1
 event_i "i", 25, 31.10069444444444, 0.3333333333333333, 1.0, ir3489
krl0 = 2.0
kr0 = krl0
S3499 sprintf "alive_%d", ir3489
 chnset kr0, S3499
ir3502 FreePort 
 event_i "i", 21, 32.10069444444444, 0.3333333333333333, ir3502, ir1
 event_i "i", 25, 32.10069444444444, 0.3333333333333333, 1.0, ir3502
krl0 = 2.0
kr0 = krl0
S3512 sprintf "alive_%d", ir3502
 chnset kr0, S3512
ir3515 FreePort 
 event_i "i", 19, 32.76736111111111, 0.3333333333333333, ir3515, ir1
 event_i "i", 25, 32.76736111111111, 0.3333333333333333, 1.0, ir3515
krl0 = 2.0
kr0 = krl0
S3525 sprintf "alive_%d", ir3515
 chnset kr0, S3525
ir3528 FreePort 
 event_i "i", 21, 33.43402777777777, 0.3333333333333333, ir3528, ir1
 event_i "i", 25, 33.43402777777777, 0.3333333333333333, 1.0, ir3528
krl0 = 2.0
kr0 = krl0
S3538 sprintf "alive_%d", ir3528
 chnset kr0, S3538
ir3541 FreePort 
 event_i "i", 19, 33.77777777777777, 0.19999999999999998, ir3541, ir1
 event_i "i", 18, 33.77777777777777, 0.19999999999999998, 1.0, ir3541
krl0 = 2.0
kr0 = krl0
S3551 sprintf "alive_%d", ir3541
 chnset kr0, S3551
ir3554 FreePort 
 event_i "i", 21, 33.977777777777774, 0.13333333333333333, ir3554, ir1
 event_i "i", 18, 33.977777777777774, 0.13333333333333333, 1.0, ir3554
krl0 = 2.0
kr0 = krl0
S3564 sprintf "alive_%d", ir3554
 chnset kr0, S3564
ir3567 FreePort 
 event_i "i", 19, 34.11111111111111, 0.19999999999999998, ir3567, ir1
 event_i "i", 18, 34.11111111111111, 0.19999999999999998, 1.0, ir3567
krl0 = 2.0
kr0 = krl0
S3577 sprintf "alive_%d", ir3567
 chnset kr0, S3577
ir3580 FreePort 
 event_i "i", 21, 34.31111111111111, 0.13333333333333333, ir3580, ir1
 event_i "i", 18, 34.31111111111111, 0.13333333333333333, 1.0, ir3580
krl0 = 2.0
kr0 = krl0
S3590 sprintf "alive_%d", ir3580
 chnset kr0, S3590
ir3593 FreePort 
 event_i "i", 19, 34.44444444444444, 0.19999999999999998, ir3593, ir1
 event_i "i", 18, 34.44444444444444, 0.19999999999999998, 1.0, ir3593
krl0 = 2.0
kr0 = krl0
S3603 sprintf "alive_%d", ir3593
 chnset kr0, S3603
ir3606 FreePort 
 event_i "i", 21, 34.644444444444446, 0.13333333333333333, ir3606, ir1
 event_i "i", 18, 34.644444444444446, 0.13333333333333333, 1.0, ir3606
krl0 = 2.0
kr0 = krl0
S3616 sprintf "alive_%d", ir3606
 chnset kr0, S3616
ir3619 FreePort 
 event_i "i", 19, 34.77777777777778, 0.19999999999999998, ir3619, ir1
 event_i "i", 18, 34.77777777777778, 0.19999999999999998, 1.0, ir3619
krl0 = 2.0
kr0 = krl0
S3629 sprintf "alive_%d", ir3619
 chnset kr0, S3629
ir3632 FreePort 
 event_i "i", 21, 34.97777777777778, 0.13333333333333333, ir3632, ir1
 event_i "i", 18, 34.97777777777778, 0.13333333333333333, 1.0, ir3632
krl0 = 2.0
kr0 = krl0
S3642 sprintf "alive_%d", ir3632
 chnset kr0, S3642
ir3645 FreePort 
 event_i "i", 19, 35.111111111111114, 0.19999999999999998, ir3645, ir1
 event_i "i", 18, 35.111111111111114, 0.19999999999999998, 1.0, ir3645
krl0 = 2.0
kr0 = krl0
S3655 sprintf "alive_%d", ir3645
 chnset kr0, S3655
ir3658 FreePort 
 event_i "i", 21, 35.31111111111112, 0.13333333333333333, ir3658, ir1
 event_i "i", 18, 35.31111111111112, 0.13333333333333333, 1.0, ir3658
krl0 = 2.0
kr0 = krl0
S3668 sprintf "alive_%d", ir3658
 chnset kr0, S3668
ir3671 FreePort 
 event_i "i", 19, 35.44444444444445, 0.19999999999999998, ir3671, ir1
 event_i "i", 18, 35.44444444444445, 0.19999999999999998, 1.0, ir3671
krl0 = 2.0
kr0 = krl0
S3681 sprintf "alive_%d", ir3671
 chnset kr0, S3681
ir3684 FreePort 
 event_i "i", 21, 35.64444444444445, 0.13333333333333333, ir3684, ir1
 event_i "i", 18, 35.64444444444445, 0.13333333333333333, 1.0, ir3684
krl0 = 2.0
kr0 = krl0
S3694 sprintf "alive_%d", ir3684
 chnset kr0, S3694
ir3697 FreePort 
 event_i "i", 19, 35.777777777777786, 0.19999999999999998, ir3697, ir1
 event_i "i", 18, 35.777777777777786, 0.19999999999999998, 1.0, ir3697
krl0 = 2.0
kr0 = krl0
S3707 sprintf "alive_%d", ir3697
 chnset kr0, S3707
ir3710 FreePort 
 event_i "i", 21, 35.97777777777779, 0.13333333333333333, ir3710, ir1
 event_i "i", 18, 35.97777777777779, 0.13333333333333333, 1.0, ir3710
krl0 = 2.0
kr0 = krl0
S3720 sprintf "alive_%d", ir3710
 chnset kr0, S3720
ir3723 FreePort 
 event_i "i", 19, 36.11111111111112, 0.19999999999999998, ir3723, ir1
 event_i "i", 18, 36.11111111111112, 0.19999999999999998, 1.0, ir3723
krl0 = 2.0
kr0 = krl0
S3733 sprintf "alive_%d", ir3723
 chnset kr0, S3733
ir3736 FreePort 
 event_i "i", 21, 36.311111111111124, 0.13333333333333333, ir3736, ir1
 event_i "i", 18, 36.311111111111124, 0.13333333333333333, 1.0, ir3736
krl0 = 2.0
kr0 = krl0
S3746 sprintf "alive_%d", ir3736
 chnset kr0, S3746
ir3749 FreePort 
 event_i "i", 23, 36.27777777777777, 0.16666666666666666, ir3749, ir1
 event_i "i", 22, 36.27777777777777, 0.16666666666666666, 1.0, ir3749
krl0 = 2.0
kr0 = krl0
S3759 sprintf "alive_%d", ir3749
 chnset kr0, S3759
ir3762 FreePort 
 event_i "i", 19, 34.444444444444436, 0.6666666666666666, ir3762, ir1
 event_i "i", 24, 34.444444444444436, 0.6666666666666666, 1.0, ir3762
krl0 = 2.0
kr0 = krl0
S3772 sprintf "alive_%d", ir3762
 chnset kr0, S3772
ir3775 FreePort 
 event_i "i", 19, 35.77777777777777, 0.6666666666666666, ir3775, ir1
 event_i "i", 24, 35.77777777777777, 0.6666666666666666, 1.0, ir3775
krl0 = 2.0
kr0 = krl0
S3785 sprintf "alive_%d", ir3775
 chnset kr0, S3785
ir3788 FreePort 
 event_i "i", 19, 33.77777777777777, 0.3333333333333333, ir3788, ir1
 event_i "i", 25, 33.77777777777777, 0.3333333333333333, 1.0, ir3788
krl0 = 2.0
kr0 = krl0
S3798 sprintf "alive_%d", ir3788
 chnset kr0, S3798
ir3801 FreePort 
 event_i "i", 21, 34.77777777777777, 0.3333333333333333, ir3801, ir1
 event_i "i", 25, 34.77777777777777, 0.3333333333333333, 1.0, ir3801
krl0 = 2.0
kr0 = krl0
S3811 sprintf "alive_%d", ir3801
 chnset kr0, S3811
ir3814 FreePort 
 event_i "i", 19, 35.444444444444436, 0.3333333333333333, ir3814, ir1
 event_i "i", 25, 35.444444444444436, 0.3333333333333333, 1.0, ir3814
krl0 = 2.0
kr0 = krl0
S3824 sprintf "alive_%d", ir3814
 chnset kr0, S3824
ir3827 FreePort 
 event_i "i", 21, 36.1111111111111, 0.3333333333333333, ir3827, ir1
 event_i "i", 25, 36.1111111111111, 0.3333333333333333, 1.0, ir3827
krl0 = 2.0
kr0 = krl0
S3837 sprintf "alive_%d", ir3827
 chnset kr0, S3837
ir3840 FreePort 
 event_i "i", 19, 36.444444444444436, 0.19999999999999998, ir3840, ir1
 event_i "i", 18, 36.444444444444436, 0.19999999999999998, 1.0, ir3840
krl0 = 2.0
kr0 = krl0
S3850 sprintf "alive_%d", ir3840
 chnset kr0, S3850
ir3853 FreePort 
 event_i "i", 21, 36.64444444444444, 0.13333333333333333, ir3853, ir1
 event_i "i", 18, 36.64444444444444, 0.13333333333333333, 1.0, ir3853
krl0 = 2.0
kr0 = krl0
S3863 sprintf "alive_%d", ir3853
 chnset kr0, S3863
ir3866 FreePort 
 event_i "i", 19, 36.77777777777777, 0.19999999999999998, ir3866, ir1
 event_i "i", 18, 36.77777777777777, 0.19999999999999998, 1.0, ir3866
krl0 = 2.0
kr0 = krl0
S3876 sprintf "alive_%d", ir3866
 chnset kr0, S3876
ir3879 FreePort 
 event_i "i", 21, 36.977777777777774, 0.13333333333333333, ir3879, ir1
 event_i "i", 18, 36.977777777777774, 0.13333333333333333, 1.0, ir3879
krl0 = 2.0
kr0 = krl0
S3889 sprintf "alive_%d", ir3879
 chnset kr0, S3889
ir3892 FreePort 
 event_i "i", 19, 37.11111111111111, 0.19999999999999998, ir3892, ir1
 event_i "i", 18, 37.11111111111111, 0.19999999999999998, 1.0, ir3892
krl0 = 2.0
kr0 = krl0
S3902 sprintf "alive_%d", ir3892
 chnset kr0, S3902
ir3905 FreePort 
 event_i "i", 21, 37.31111111111111, 0.13333333333333333, ir3905, ir1
 event_i "i", 18, 37.31111111111111, 0.13333333333333333, 1.0, ir3905
krl0 = 2.0
kr0 = krl0
S3915 sprintf "alive_%d", ir3905
 chnset kr0, S3915
ir3918 FreePort 
 event_i "i", 19, 37.44444444444444, 0.19999999999999998, ir3918, ir1
 event_i "i", 18, 37.44444444444444, 0.19999999999999998, 1.0, ir3918
krl0 = 2.0
kr0 = krl0
S3928 sprintf "alive_%d", ir3918
 chnset kr0, S3928
ir3931 FreePort 
 event_i "i", 21, 37.644444444444446, 0.13333333333333333, ir3931, ir1
 event_i "i", 18, 37.644444444444446, 0.13333333333333333, 1.0, ir3931
krl0 = 2.0
kr0 = krl0
S3941 sprintf "alive_%d", ir3931
 chnset kr0, S3941
ir3944 FreePort 
 event_i "i", 19, 37.77777777777778, 0.19999999999999998, ir3944, ir1
 event_i "i", 18, 37.77777777777778, 0.19999999999999998, 1.0, ir3944
krl0 = 2.0
kr0 = krl0
S3954 sprintf "alive_%d", ir3944
 chnset kr0, S3954
ir3957 FreePort 
 event_i "i", 21, 37.97777777777778, 0.13333333333333333, ir3957, ir1
 event_i "i", 18, 37.97777777777778, 0.13333333333333333, 1.0, ir3957
krl0 = 2.0
kr0 = krl0
S3967 sprintf "alive_%d", ir3957
 chnset kr0, S3967
ir3970 FreePort 
 event_i "i", 19, 38.111111111111114, 0.19999999999999998, ir3970, ir1
 event_i "i", 18, 38.111111111111114, 0.19999999999999998, 1.0, ir3970
krl0 = 2.0
kr0 = krl0
S3980 sprintf "alive_%d", ir3970
 chnset kr0, S3980
ir3983 FreePort 
 event_i "i", 21, 38.31111111111112, 0.13333333333333333, ir3983, ir1
 event_i "i", 18, 38.31111111111112, 0.13333333333333333, 1.0, ir3983
krl0 = 2.0
kr0 = krl0
S3993 sprintf "alive_%d", ir3983
 chnset kr0, S3993
ir3996 FreePort 
 event_i "i", 19, 38.44444444444445, 0.19999999999999998, ir3996, ir1
 event_i "i", 18, 38.44444444444445, 0.19999999999999998, 1.0, ir3996
krl0 = 2.0
kr0 = krl0
S4006 sprintf "alive_%d", ir3996
 chnset kr0, S4006
ir4009 FreePort 
 event_i "i", 21, 38.64444444444445, 0.13333333333333333, ir4009, ir1
 event_i "i", 18, 38.64444444444445, 0.13333333333333333, 1.0, ir4009
krl0 = 2.0
kr0 = krl0
S4019 sprintf "alive_%d", ir4009
 chnset kr0, S4019
ir4022 FreePort 
 event_i "i", 19, 38.777777777777786, 0.19999999999999998, ir4022, ir1
 event_i "i", 18, 38.777777777777786, 0.19999999999999998, 1.0, ir4022
krl0 = 2.0
kr0 = krl0
S4032 sprintf "alive_%d", ir4022
 chnset kr0, S4032
ir4035 FreePort 
 event_i "i", 21, 38.97777777777779, 0.13333333333333333, ir4035, ir1
 event_i "i", 18, 38.97777777777779, 0.13333333333333333, 1.0, ir4035
krl0 = 2.0
kr0 = krl0
S4045 sprintf "alive_%d", ir4035
 chnset kr0, S4045
ir4048 FreePort 
 event_i "i", 23, 38.944444444444436, 0.16666666666666666, ir4048, ir1
 event_i "i", 22, 38.944444444444436, 0.16666666666666666, 1.0, ir4048
krl0 = 2.0
kr0 = krl0
S4058 sprintf "alive_%d", ir4048
 chnset kr0, S4058
ir4061 FreePort 
 event_i "i", 19, 37.1111111111111, 0.6666666666666666, ir4061, ir1
 event_i "i", 24, 37.1111111111111, 0.6666666666666666, 1.0, ir4061
krl0 = 2.0
kr0 = krl0
S4071 sprintf "alive_%d", ir4061
 chnset kr0, S4071
ir4074 FreePort 
 event_i "i", 19, 38.444444444444436, 0.6666666666666666, ir4074, ir1
 event_i "i", 24, 38.444444444444436, 0.6666666666666666, 1.0, ir4074
krl0 = 2.0
kr0 = krl0
S4084 sprintf "alive_%d", ir4074
 chnset kr0, S4084
ir4087 FreePort 
 event_i "i", 19, 36.444444444444436, 0.3333333333333333, ir4087, ir1
 event_i "i", 25, 36.444444444444436, 0.3333333333333333, 1.0, ir4087
krl0 = 2.0
kr0 = krl0
S4097 sprintf "alive_%d", ir4087
 chnset kr0, S4097
ir4100 FreePort 
 event_i "i", 21, 37.444444444444436, 0.3333333333333333, ir4100, ir1
 event_i "i", 25, 37.444444444444436, 0.3333333333333333, 1.0, ir4100
krl0 = 2.0
kr0 = krl0
S4110 sprintf "alive_%d", ir4100
 chnset kr0, S4110
ir4113 FreePort 
 event_i "i", 19, 38.1111111111111, 0.3333333333333333, ir4113, ir1
 event_i "i", 25, 38.1111111111111, 0.3333333333333333, 1.0, ir4113
krl0 = 2.0
kr0 = krl0
S4123 sprintf "alive_%d", ir4113
 chnset kr0, S4123
ir4126 FreePort 
 event_i "i", 21, 38.777777777777764, 0.3333333333333333, ir4126, ir1
 event_i "i", 25, 38.777777777777764, 0.3333333333333333, 1.0, ir4126
krl0 = 2.0
kr0 = krl0
S4136 sprintf "alive_%d", ir4126
 chnset kr0, S4136
ir4139 FreePort 
 event_i "i", 19, 39.11111111111111, 0.26666666666666666, ir4139, ir1
 event_i "i", 18, 39.11111111111111, 0.26666666666666666, 1.0, ir4139
krl0 = 2.0
kr0 = krl0
S4149 sprintf "alive_%d", ir4139
 chnset kr0, S4149
ir4152 FreePort 
 event_i "i", 21, 39.37777777777777, 0.17777777777777776, ir4152, ir1
 event_i "i", 18, 39.37777777777777, 0.17777777777777776, 1.0, ir4152
krl0 = 2.0
kr0 = krl0
S4162 sprintf "alive_%d", ir4152
 chnset kr0, S4162
ir4165 FreePort 
 event_i "i", 19, 39.55555555555555, 0.26666666666666666, ir4165, ir1
 event_i "i", 18, 39.55555555555555, 0.26666666666666666, 1.0, ir4165
krl0 = 2.0
kr0 = krl0
S4175 sprintf "alive_%d", ir4165
 chnset kr0, S4175
ir4178 FreePort 
 event_i "i", 21, 39.822222222222216, 0.17777777777777776, ir4178, ir1
 event_i "i", 18, 39.822222222222216, 0.17777777777777776, 1.0, ir4178
krl0 = 2.0
kr0 = krl0
S4188 sprintf "alive_%d", ir4178
 chnset kr0, S4188
ir4191 FreePort 
 event_i "i", 19, 39.99999999999999, 0.26666666666666666, ir4191, ir1
 event_i "i", 18, 39.99999999999999, 0.26666666666666666, 1.0, ir4191
krl0 = 2.0
kr0 = krl0
S4201 sprintf "alive_%d", ir4191
 chnset kr0, S4201
ir4204 FreePort 
 event_i "i", 21, 40.26666666666666, 0.17777777777777776, ir4204, ir1
 event_i "i", 18, 40.26666666666666, 0.17777777777777776, 1.0, ir4204
krl0 = 2.0
kr0 = krl0
S4214 sprintf "alive_%d", ir4204
 chnset kr0, S4214
ir4217 FreePort 
 event_i "i", 19, 40.444444444444436, 0.26666666666666666, ir4217, ir1
 event_i "i", 18, 40.444444444444436, 0.26666666666666666, 1.0, ir4217
krl0 = 2.0
kr0 = krl0
S4227 sprintf "alive_%d", ir4217
 chnset kr0, S4227
ir4230 FreePort 
 event_i "i", 21, 40.7111111111111, 0.17777777777777776, ir4230, ir1
 event_i "i", 18, 40.7111111111111, 0.17777777777777776, 1.0, ir4230
krl0 = 2.0
kr0 = krl0
S4240 sprintf "alive_%d", ir4230
 chnset kr0, S4240
ir4243 FreePort 
 event_i "i", 19, 40.88888888888888, 0.26666666666666666, ir4243, ir1
 event_i "i", 18, 40.88888888888888, 0.26666666666666666, 1.0, ir4243
krl0 = 2.0
kr0 = krl0
S4253 sprintf "alive_%d", ir4243
 chnset kr0, S4253
ir4256 FreePort 
 event_i "i", 21, 41.155555555555544, 0.17777777777777776, ir4256, ir1
 event_i "i", 18, 41.155555555555544, 0.17777777777777776, 1.0, ir4256
krl0 = 2.0
kr0 = krl0
S4266 sprintf "alive_%d", ir4256
 chnset kr0, S4266
ir4269 FreePort 
 event_i "i", 19, 41.33333333333332, 0.26666666666666666, ir4269, ir1
 event_i "i", 18, 41.33333333333332, 0.26666666666666666, 1.0, ir4269
krl0 = 2.0
kr0 = krl0
S4279 sprintf "alive_%d", ir4269
 chnset kr0, S4279
ir4282 FreePort 
 event_i "i", 21, 41.59999999999999, 0.17777777777777776, ir4282, ir1
 event_i "i", 18, 41.59999999999999, 0.17777777777777776, 1.0, ir4282
krl0 = 2.0
kr0 = krl0
S4292 sprintf "alive_%d", ir4282
 chnset kr0, S4292
ir4295 FreePort 
 event_i "i", 19, 41.777777777777764, 0.26666666666666666, ir4295, ir1
 event_i "i", 18, 41.777777777777764, 0.26666666666666666, 1.0, ir4295
krl0 = 2.0
kr0 = krl0
S4305 sprintf "alive_%d", ir4295
 chnset kr0, S4305
ir4308 FreePort 
 event_i "i", 21, 42.04444444444443, 0.17777777777777776, ir4308, ir1
 event_i "i", 18, 42.04444444444443, 0.17777777777777776, 1.0, ir4308
krl0 = 2.0
kr0 = krl0
S4318 sprintf "alive_%d", ir4308
 chnset kr0, S4318
ir4321 FreePort 
 event_i "i", 19, 42.22222222222221, 0.26666666666666666, ir4321, ir1
 event_i "i", 18, 42.22222222222221, 0.26666666666666666, 1.0, ir4321
krl0 = 2.0
kr0 = krl0
S4331 sprintf "alive_%d", ir4321
 chnset kr0, S4331
ir4334 FreePort 
 event_i "i", 21, 42.48888888888887, 0.17777777777777776, ir4334, ir1
 event_i "i", 18, 42.48888888888887, 0.17777777777777776, 1.0, ir4334
krl0 = 2.0
kr0 = krl0
S4344 sprintf "alive_%d", ir4334
 chnset kr0, S4344
ir4347 FreePort 
 event_i "i", 23, 42.44444444444444, 0.2222222222222222, ir4347, ir1
 event_i "i", 22, 42.44444444444444, 0.2222222222222222, 1.0, ir4347
krl0 = 2.0
kr0 = krl0
S4357 sprintf "alive_%d", ir4347
 chnset kr0, S4357
ir4360 FreePort 
 event_i "i", 19, 39.99999999999999, 0.8888888888888888, ir4360, ir1
 event_i "i", 24, 39.99999999999999, 0.8888888888888888, 1.0, ir4360
krl0 = 2.0
kr0 = krl0
S4370 sprintf "alive_%d", ir4360
 chnset kr0, S4370
ir4373 FreePort 
 event_i "i", 19, 41.77777777777777, 0.8888888888888888, ir4373, ir1
 event_i "i", 24, 41.77777777777777, 0.8888888888888888, 1.0, ir4373
krl0 = 2.0
kr0 = krl0
S4383 sprintf "alive_%d", ir4373
 chnset kr0, S4383
ir4386 FreePort 
 event_i "i", 19, 39.11111111111111, 0.4444444444444444, ir4386, ir1
 event_i "i", 25, 39.11111111111111, 0.4444444444444444, 1.0, ir4386
krl0 = 2.0
kr0 = krl0
S4396 sprintf "alive_%d", ir4386
 chnset kr0, S4396
ir4399 FreePort 
 event_i "i", 19, 41.33333333333333, 0.4444444444444444, ir4399, ir1
 event_i "i", 25, 41.33333333333333, 0.4444444444444444, 1.0, ir4399
krl0 = 2.0
kr0 = krl0
S4409 sprintf "alive_%d", ir4399
 chnset kr0, S4409
ir4412 FreePort 
 event_i "i", 19, 42.666666666666664, 0.26666666666666666, ir4412, ir1
 event_i "i", 18, 42.666666666666664, 0.26666666666666666, 1.0, ir4412
krl0 = 2.0
kr0 = krl0
S4422 sprintf "alive_%d", ir4412
 chnset kr0, S4422
ir4425 FreePort 
 event_i "i", 21, 42.93333333333333, 0.17777777777777776, ir4425, ir1
 event_i "i", 18, 42.93333333333333, 0.17777777777777776, 1.0, ir4425
krl0 = 2.0
kr0 = krl0
S4435 sprintf "alive_%d", ir4425
 chnset kr0, S4435
ir4438 FreePort 
 event_i "i", 19, 43.11111111111111, 0.26666666666666666, ir4438, ir1
 event_i "i", 18, 43.11111111111111, 0.26666666666666666, 1.0, ir4438
krl0 = 2.0
kr0 = krl0
S4448 sprintf "alive_%d", ir4438
 chnset kr0, S4448
ir4451 FreePort 
 event_i "i", 21, 43.37777777777777, 0.17777777777777776, ir4451, ir1
 event_i "i", 18, 43.37777777777777, 0.17777777777777776, 1.0, ir4451
krl0 = 2.0
kr0 = krl0
S4461 sprintf "alive_%d", ir4451
 chnset kr0, S4461
ir4464 FreePort 
 event_i "i", 19, 43.55555555555555, 0.26666666666666666, ir4464, ir1
 event_i "i", 18, 43.55555555555555, 0.26666666666666666, 1.0, ir4464
krl0 = 2.0
kr0 = krl0
S4474 sprintf "alive_%d", ir4464
 chnset kr0, S4474
ir4477 FreePort 
 event_i "i", 21, 43.822222222222216, 0.17777777777777776, ir4477, ir1
 event_i "i", 18, 43.822222222222216, 0.17777777777777776, 1.0, ir4477
krl0 = 2.0
kr0 = krl0
S4487 sprintf "alive_%d", ir4477
 chnset kr0, S4487
ir4490 FreePort 
 event_i "i", 19, 43.99999999999999, 0.26666666666666666, ir4490, ir1
 event_i "i", 18, 43.99999999999999, 0.26666666666666666, 1.0, ir4490
krl0 = 2.0
kr0 = krl0
S4500 sprintf "alive_%d", ir4490
 chnset kr0, S4500
ir4503 FreePort 
 event_i "i", 21, 44.26666666666666, 0.17777777777777776, ir4503, ir1
 event_i "i", 18, 44.26666666666666, 0.17777777777777776, 1.0, ir4503
krl0 = 2.0
kr0 = krl0
S4513 sprintf "alive_%d", ir4503
 chnset kr0, S4513
ir4516 FreePort 
 event_i "i", 19, 44.444444444444436, 0.26666666666666666, ir4516, ir1
 event_i "i", 18, 44.444444444444436, 0.26666666666666666, 1.0, ir4516
krl0 = 2.0
kr0 = krl0
S4526 sprintf "alive_%d", ir4516
 chnset kr0, S4526
ir4529 FreePort 
 event_i "i", 21, 44.7111111111111, 0.17777777777777776, ir4529, ir1
 event_i "i", 18, 44.7111111111111, 0.17777777777777776, 1.0, ir4529
krl0 = 2.0
kr0 = krl0
S4539 sprintf "alive_%d", ir4529
 chnset kr0, S4539
ir4542 FreePort 
 event_i "i", 19, 44.88888888888888, 0.26666666666666666, ir4542, ir1
 event_i "i", 18, 44.88888888888888, 0.26666666666666666, 1.0, ir4542
krl0 = 2.0
kr0 = krl0
S4552 sprintf "alive_%d", ir4542
 chnset kr0, S4552
ir4555 FreePort 
 event_i "i", 21, 45.155555555555544, 0.17777777777777776, ir4555, ir1
 event_i "i", 18, 45.155555555555544, 0.17777777777777776, 1.0, ir4555
krl0 = 2.0
kr0 = krl0
S4565 sprintf "alive_%d", ir4555
 chnset kr0, S4565
ir4568 FreePort 
 event_i "i", 19, 45.33333333333332, 0.26666666666666666, ir4568, ir1
 event_i "i", 18, 45.33333333333332, 0.26666666666666666, 1.0, ir4568
krl0 = 2.0
kr0 = krl0
S4578 sprintf "alive_%d", ir4568
 chnset kr0, S4578
ir4581 FreePort 
 event_i "i", 21, 45.59999999999999, 0.17777777777777776, ir4581, ir1
 event_i "i", 18, 45.59999999999999, 0.17777777777777776, 1.0, ir4581
krl0 = 2.0
kr0 = krl0
S4591 sprintf "alive_%d", ir4581
 chnset kr0, S4591
ir4594 FreePort 
 event_i "i", 19, 45.777777777777764, 0.26666666666666666, ir4594, ir1
 event_i "i", 18, 45.777777777777764, 0.26666666666666666, 1.0, ir4594
krl0 = 2.0
kr0 = krl0
S4604 sprintf "alive_%d", ir4594
 chnset kr0, S4604
ir4607 FreePort 
 event_i "i", 21, 46.04444444444443, 0.17777777777777776, ir4607, ir1
 event_i "i", 18, 46.04444444444443, 0.17777777777777776, 1.0, ir4607
krl0 = 2.0
kr0 = krl0
S4617 sprintf "alive_%d", ir4607
 chnset kr0, S4617
ir4620 FreePort 
 event_i "i", 23, 46.0, 0.2222222222222222, ir4620, ir1
 event_i "i", 22, 46.0, 0.2222222222222222, 1.0, ir4620
krl0 = 2.0
kr0 = krl0
S4630 sprintf "alive_%d", ir4620
 chnset kr0, S4630
ir4633 FreePort 
 event_i "i", 19, 43.55555555555555, 0.8888888888888888, ir4633, ir1
 event_i "i", 24, 43.55555555555555, 0.8888888888888888, 1.0, ir4633
krl0 = 2.0
kr0 = krl0
S4643 sprintf "alive_%d", ir4633
 chnset kr0, S4643
ir4646 FreePort 
 event_i "i", 19, 45.33333333333333, 0.8888888888888888, ir4646, ir1
 event_i "i", 24, 45.33333333333333, 0.8888888888888888, 1.0, ir4646
krl0 = 2.0
kr0 = krl0
S4656 sprintf "alive_%d", ir4646
 chnset kr0, S4656
ir4659 FreePort 
 event_i "i", 19, 42.666666666666664, 0.4444444444444444, ir4659, ir1
 event_i "i", 25, 42.666666666666664, 0.4444444444444444, 1.0, ir4659
krl0 = 2.0
kr0 = krl0
S4669 sprintf "alive_%d", ir4659
 chnset kr0, S4669
ir4672 FreePort 
 event_i "i", 19, 44.888888888888886, 0.4444444444444444, ir4672, ir1
 event_i "i", 25, 44.888888888888886, 0.4444444444444444, 1.0, ir4672
krl0 = 2.0
kr0 = krl0
S4682 sprintf "alive_%d", ir4672
 chnset kr0, S4682
ir4685 FreePort 
 event_i "i", 19, 46.222222222222214, 0.16666666666666666, ir4685, ir1
 event_i "i", 18, 46.222222222222214, 0.16666666666666666, 1.0, ir4685
krl0 = 2.0
kr0 = krl0
S4695 sprintf "alive_%d", ir4685
 chnset kr0, S4695
ir4698 FreePort 
 event_i "i", 20, 46.38888888888888, 0.16666666666666666, ir4698, ir1
 event_i "i", 18, 46.38888888888888, 0.16666666666666666, 1.0, ir4698
krl0 = 2.0
kr0 = krl0
S4708 sprintf "alive_%d", ir4698
 chnset kr0, S4708
ir4711 FreePort 
 event_i "i", 21, 46.55555555555554, 0.16666666666666666, ir4711, ir1
 event_i "i", 18, 46.55555555555554, 0.16666666666666666, 1.0, ir4711
krl0 = 2.0
kr0 = krl0
S4721 sprintf "alive_%d", ir4711
 chnset kr0, S4721
ir4724 FreePort 
 event_i "i", 21, 46.72222222222221, 0.16666666666666666, ir4724, ir1
 event_i "i", 18, 46.72222222222221, 0.16666666666666666, 1.0, ir4724
krl0 = 2.0
kr0 = krl0
S4734 sprintf "alive_%d", ir4724
 chnset kr0, S4734
ir4737 FreePort 
 event_i "i", 19, 46.88888888888887, 0.16666666666666666, ir4737, ir1
 event_i "i", 18, 46.88888888888887, 0.16666666666666666, 1.0, ir4737
krl0 = 2.0
kr0 = krl0
S4747 sprintf "alive_%d", ir4737
 chnset kr0, S4747
ir4750 FreePort 
 event_i "i", 20, 47.055555555555536, 0.16666666666666666, ir4750, ir1
 event_i "i", 18, 47.055555555555536, 0.16666666666666666, 1.0, ir4750
krl0 = 2.0
kr0 = krl0
S4760 sprintf "alive_%d", ir4750
 chnset kr0, S4760
ir4763 FreePort 
 event_i "i", 21, 47.2222222222222, 0.16666666666666666, ir4763, ir1
 event_i "i", 18, 47.2222222222222, 0.16666666666666666, 1.0, ir4763
krl0 = 2.0
kr0 = krl0
S4773 sprintf "alive_%d", ir4763
 chnset kr0, S4773
ir4776 FreePort 
 event_i "i", 21, 47.388888888888864, 0.16666666666666666, ir4776, ir1
 event_i "i", 18, 47.388888888888864, 0.16666666666666666, 1.0, ir4776
krl0 = 2.0
kr0 = krl0
S4786 sprintf "alive_%d", ir4776
 chnset kr0, S4786
ir4789 FreePort 
 event_i "i", 19, 47.55555555555553, 0.16666666666666666, ir4789, ir1
 event_i "i", 18, 47.55555555555553, 0.16666666666666666, 1.0, ir4789
krl0 = 2.0
kr0 = krl0
S4799 sprintf "alive_%d", ir4789
 chnset kr0, S4799
ir4802 FreePort 
 event_i "i", 20, 47.72222222222219, 0.16666666666666666, ir4802, ir1
 event_i "i", 18, 47.72222222222219, 0.16666666666666666, 1.0, ir4802
krl0 = 2.0
kr0 = krl0
S4812 sprintf "alive_%d", ir4802
 chnset kr0, S4812
ir4815 FreePort 
 event_i "i", 21, 47.88888888888886, 0.16666666666666666, ir4815, ir1
 event_i "i", 18, 47.88888888888886, 0.16666666666666666, 1.0, ir4815
krl0 = 2.0
kr0 = krl0
S4825 sprintf "alive_%d", ir4815
 chnset kr0, S4825
ir4828 FreePort 
 event_i "i", 21, 48.05555555555552, 0.16666666666666666, ir4828, ir1
 event_i "i", 18, 48.05555555555552, 0.16666666666666666, 1.0, ir4828
krl0 = 2.0
kr0 = krl0
S4838 sprintf "alive_%d", ir4828
 chnset kr0, S4838
ir4841 FreePort 
 event_i "i", 19, 48.222222222222186, 0.16666666666666666, ir4841, ir1
 event_i "i", 18, 48.222222222222186, 0.16666666666666666, 1.0, ir4841
krl0 = 2.0
kr0 = krl0
S4851 sprintf "alive_%d", ir4841
 chnset kr0, S4851
ir4854 FreePort 
 event_i "i", 20, 48.38888888888885, 0.16666666666666666, ir4854, ir1
 event_i "i", 18, 48.38888888888885, 0.16666666666666666, 1.0, ir4854
krl0 = 2.0
kr0 = krl0
S4864 sprintf "alive_%d", ir4854
 chnset kr0, S4864
ir4867 FreePort 
 event_i "i", 21, 48.555555555555515, 0.16666666666666666, ir4867, ir1
 event_i "i", 18, 48.555555555555515, 0.16666666666666666, 1.0, ir4867
krl0 = 2.0
kr0 = krl0
S4877 sprintf "alive_%d", ir4867
 chnset kr0, S4877
ir4880 FreePort 
 event_i "i", 21, 48.72222222222218, 0.16666666666666666, ir4880, ir1
 event_i "i", 18, 48.72222222222218, 0.16666666666666666, 1.0, ir4880
krl0 = 2.0
kr0 = krl0
S4890 sprintf "alive_%d", ir4880
 chnset kr0, S4890
ir4893 FreePort 
 event_i "i", 23, 48.722222222222214, 0.16666666666666666, ir4893, ir1
 event_i "i", 22, 48.722222222222214, 0.16666666666666666, 1.0, ir4893
krl0 = 2.0
kr0 = krl0
S4903 sprintf "alive_%d", ir4893
 chnset kr0, S4903
ir4906 FreePort 
 event_i "i", 19, 46.88888888888888, 0.6666666666666666, ir4906, ir1
 event_i "i", 24, 46.88888888888888, 0.6666666666666666, 1.0, ir4906
krl0 = 2.0
kr0 = krl0
S4916 sprintf "alive_%d", ir4906
 chnset kr0, S4916
ir4919 FreePort 
 event_i "i", 19, 48.222222222222214, 0.6666666666666666, ir4919, ir1
 event_i "i", 24, 48.222222222222214, 0.6666666666666666, 1.0, ir4919
krl0 = 2.0
kr0 = krl0
S4929 sprintf "alive_%d", ir4919
 chnset kr0, S4929
ir4932 FreePort 
 event_i "i", 19, 46.222222222222214, 0.3333333333333333, ir4932, ir1
 event_i "i", 25, 46.222222222222214, 0.3333333333333333, 1.0, ir4932
krl0 = 2.0
kr0 = krl0
S4942 sprintf "alive_%d", ir4932
 chnset kr0, S4942
ir4945 FreePort 
 event_i "i", 21, 47.222222222222214, 0.3333333333333333, ir4945, ir1
 event_i "i", 25, 47.222222222222214, 0.3333333333333333, 1.0, ir4945
krl0 = 2.0
kr0 = krl0
S4955 sprintf "alive_%d", ir4945
 chnset kr0, S4955
ir4958 FreePort 
 event_i "i", 19, 47.88888888888888, 0.3333333333333333, ir4958, ir1
 event_i "i", 25, 47.88888888888888, 0.3333333333333333, 1.0, ir4958
krl0 = 2.0
kr0 = krl0
S4968 sprintf "alive_%d", ir4958
 chnset kr0, S4968
ir4971 FreePort 
 event_i "i", 21, 48.55555555555554, 0.3333333333333333, ir4971, ir1
 event_i "i", 25, 48.55555555555554, 0.3333333333333333, 1.0, ir4971
krl0 = 2.0
kr0 = krl0
S4981 sprintf "alive_%d", ir4971
 chnset kr0, S4981
ir4984 FreePort 
 event_i "i", 19, 48.88888888888888, 0.16666666666666666, ir4984, ir1
 event_i "i", 18, 48.88888888888888, 0.16666666666666666, 1.0, ir4984
krl0 = 2.0
kr0 = krl0
S4994 sprintf "alive_%d", ir4984
 chnset kr0, S4994
ir4997 FreePort 
 event_i "i", 20, 49.05555555555554, 0.16666666666666666, ir4997, ir1
 event_i "i", 18, 49.05555555555554, 0.16666666666666666, 1.0, ir4997
krl0 = 2.0
kr0 = krl0
S5007 sprintf "alive_%d", ir4997
 chnset kr0, S5007
ir5010 FreePort 
 event_i "i", 21, 49.22222222222221, 0.16666666666666666, ir5010, ir1
 event_i "i", 18, 49.22222222222221, 0.16666666666666666, 1.0, ir5010
krl0 = 2.0
kr0 = krl0
S5020 sprintf "alive_%d", ir5010
 chnset kr0, S5020
ir5023 FreePort 
 event_i "i", 21, 49.38888888888887, 0.16666666666666666, ir5023, ir1
 event_i "i", 18, 49.38888888888887, 0.16666666666666666, 1.0, ir5023
krl0 = 2.0
kr0 = krl0
S5033 sprintf "alive_%d", ir5023
 chnset kr0, S5033
ir5036 FreePort 
 event_i "i", 19, 49.555555555555536, 0.16666666666666666, ir5036, ir1
 event_i "i", 18, 49.555555555555536, 0.16666666666666666, 1.0, ir5036
krl0 = 2.0
kr0 = krl0
S5046 sprintf "alive_%d", ir5036
 chnset kr0, S5046
ir5049 FreePort 
 event_i "i", 20, 49.7222222222222, 0.16666666666666666, ir5049, ir1
 event_i "i", 18, 49.7222222222222, 0.16666666666666666, 1.0, ir5049
krl0 = 2.0
kr0 = krl0
S5059 sprintf "alive_%d", ir5049
 chnset kr0, S5059
ir5062 FreePort 
 event_i "i", 21, 49.888888888888864, 0.16666666666666666, ir5062, ir1
 event_i "i", 18, 49.888888888888864, 0.16666666666666666, 1.0, ir5062
krl0 = 2.0
kr0 = krl0
S5072 sprintf "alive_%d", ir5062
 chnset kr0, S5072
ir5075 FreePort 
 event_i "i", 21, 50.05555555555553, 0.16666666666666666, ir5075, ir1
 event_i "i", 18, 50.05555555555553, 0.16666666666666666, 1.0, ir5075
krl0 = 2.0
kr0 = krl0
S5085 sprintf "alive_%d", ir5075
 chnset kr0, S5085
ir5088 FreePort 
 event_i "i", 19, 50.22222222222219, 0.16666666666666666, ir5088, ir1
 event_i "i", 18, 50.22222222222219, 0.16666666666666666, 1.0, ir5088
krl0 = 2.0
kr0 = krl0
S5098 sprintf "alive_%d", ir5088
 chnset kr0, S5098
ir5101 FreePort 
 event_i "i", 20, 50.38888888888886, 0.16666666666666666, ir5101, ir1
 event_i "i", 18, 50.38888888888886, 0.16666666666666666, 1.0, ir5101
krl0 = 2.0
kr0 = krl0
S5111 sprintf "alive_%d", ir5101
 chnset kr0, S5111
ir5114 FreePort 
 event_i "i", 21, 50.55555555555552, 0.16666666666666666, ir5114, ir1
 event_i "i", 18, 50.55555555555552, 0.16666666666666666, 1.0, ir5114
krl0 = 2.0
kr0 = krl0
S5124 sprintf "alive_%d", ir5114
 chnset kr0, S5124
ir5127 FreePort 
 event_i "i", 21, 50.722222222222186, 0.16666666666666666, ir5127, ir1
 event_i "i", 18, 50.722222222222186, 0.16666666666666666, 1.0, ir5127
krl0 = 2.0
kr0 = krl0
S5137 sprintf "alive_%d", ir5127
 chnset kr0, S5137
ir5140 FreePort 
 event_i "i", 19, 50.88888888888885, 0.16666666666666666, ir5140, ir1
 event_i "i", 18, 50.88888888888885, 0.16666666666666666, 1.0, ir5140
krl0 = 2.0
kr0 = krl0
S5150 sprintf "alive_%d", ir5140
 chnset kr0, S5150
ir5153 FreePort 
 event_i "i", 20, 51.055555555555515, 0.16666666666666666, ir5153, ir1
 event_i "i", 18, 51.055555555555515, 0.16666666666666666, 1.0, ir5153
krl0 = 2.0
kr0 = krl0
S5163 sprintf "alive_%d", ir5153
 chnset kr0, S5163
ir5166 FreePort 
 event_i "i", 21, 51.22222222222218, 0.16666666666666666, ir5166, ir1
 event_i "i", 18, 51.22222222222218, 0.16666666666666666, 1.0, ir5166
krl0 = 2.0
kr0 = krl0
S5176 sprintf "alive_%d", ir5166
 chnset kr0, S5176
ir5179 FreePort 
 event_i "i", 21, 51.38888888888884, 0.16666666666666666, ir5179, ir1
 event_i "i", 18, 51.38888888888884, 0.16666666666666666, 1.0, ir5179
krl0 = 2.0
kr0 = krl0
S5189 sprintf "alive_%d", ir5179
 chnset kr0, S5189
ir5192 FreePort 
 event_i "i", 23, 51.38888888888888, 0.16666666666666666, ir5192, ir1
 event_i "i", 22, 51.38888888888888, 0.16666666666666666, 1.0, ir5192
krl0 = 2.0
kr0 = krl0
S5202 sprintf "alive_%d", ir5192
 chnset kr0, S5202
ir5205 FreePort 
 event_i "i", 19, 49.55555555555554, 0.6666666666666666, ir5205, ir1
 event_i "i", 24, 49.55555555555554, 0.6666666666666666, 1.0, ir5205
krl0 = 2.0
kr0 = krl0
S5215 sprintf "alive_%d", ir5205
 chnset kr0, S5215
ir5218 FreePort 
 event_i "i", 19, 50.88888888888888, 0.6666666666666666, ir5218, ir1
 event_i "i", 24, 50.88888888888888, 0.6666666666666666, 1.0, ir5218
krl0 = 2.0
kr0 = krl0
S5228 sprintf "alive_%d", ir5218
 chnset kr0, S5228
ir5231 FreePort 
 event_i "i", 19, 48.88888888888888, 0.3333333333333333, ir5231, ir1
 event_i "i", 25, 48.88888888888888, 0.3333333333333333, 1.0, ir5231
krl0 = 2.0
kr0 = krl0
S5241 sprintf "alive_%d", ir5231
 chnset kr0, S5241
ir5244 FreePort 
 event_i "i", 21, 49.88888888888888, 0.3333333333333333, ir5244, ir1
 event_i "i", 25, 49.88888888888888, 0.3333333333333333, 1.0, ir5244
krl0 = 2.0
kr0 = krl0
S5254 sprintf "alive_%d", ir5244
 chnset kr0, S5254
ir5257 FreePort 
 event_i "i", 19, 50.55555555555554, 0.3333333333333333, ir5257, ir1
 event_i "i", 25, 50.55555555555554, 0.3333333333333333, 1.0, ir5257
krl0 = 2.0
kr0 = krl0
S5267 sprintf "alive_%d", ir5257
 chnset kr0, S5267
ir5270 FreePort 
 event_i "i", 21, 51.22222222222221, 0.3333333333333333, ir5270, ir1
 event_i "i", 25, 51.22222222222221, 0.3333333333333333, 1.0, ir5270
krl0 = 2.0
kr0 = krl0
S5280 sprintf "alive_%d", ir5270
 chnset kr0, S5280
ir5283 FreePort 
 event_i "i", 19, 51.55555555555554, 0.16666666666666666, ir5283, ir1
 event_i "i", 18, 51.55555555555554, 0.16666666666666666, 1.0, ir5283
krl0 = 2.0
kr0 = krl0
S5293 sprintf "alive_%d", ir5283
 chnset kr0, S5293
ir5296 FreePort 
 event_i "i", 20, 51.72222222222221, 0.16666666666666666, ir5296, ir1
 event_i "i", 18, 51.72222222222221, 0.16666666666666666, 1.0, ir5296
krl0 = 2.0
kr0 = krl0
S5306 sprintf "alive_%d", ir5296
 chnset kr0, S5306
ir5309 FreePort 
 event_i "i", 21, 51.85763888888888, 0.16666666666666666, ir5309, ir1
 event_i "i", 18, 51.85763888888888, 0.16666666666666666, 1.0, ir5309
krl0 = 2.0
kr0 = krl0
S5319 sprintf "alive_%d", ir5309
 chnset kr0, S5319
ir5322 FreePort 
 event_i "i", 21, 52.02430555555554, 0.16666666666666666, ir5322, ir1
 event_i "i", 18, 52.02430555555554, 0.16666666666666666, 1.0, ir5322
krl0 = 2.0
kr0 = krl0
S5332 sprintf "alive_%d", ir5322
 chnset kr0, S5332
ir5335 FreePort 
 event_i "i", 19, 52.22222222222221, 0.16666666666666666, ir5335, ir1
 event_i "i", 18, 52.22222222222221, 0.16666666666666666, 1.0, ir5335
krl0 = 2.0
kr0 = krl0
S5345 sprintf "alive_%d", ir5335
 chnset kr0, S5345
ir5348 FreePort 
 event_i "i", 20, 52.38888888888887, 0.16666666666666666, ir5348, ir1
 event_i "i", 18, 52.38888888888887, 0.16666666666666666, 1.0, ir5348
krl0 = 2.0
kr0 = krl0
S5358 sprintf "alive_%d", ir5348
 chnset kr0, S5358
ir5361 FreePort 
 event_i "i", 21, 52.52430555555554, 0.16666666666666666, ir5361, ir1
 event_i "i", 18, 52.52430555555554, 0.16666666666666666, 1.0, ir5361
krl0 = 2.0
kr0 = krl0
S5371 sprintf "alive_%d", ir5361
 chnset kr0, S5371
ir5374 FreePort 
 event_i "i", 21, 52.69097222222221, 0.16666666666666666, ir5374, ir1
 event_i "i", 18, 52.69097222222221, 0.16666666666666666, 1.0, ir5374
krl0 = 2.0
kr0 = krl0
S5384 sprintf "alive_%d", ir5374
 chnset kr0, S5384
ir5387 FreePort 
 event_i "i", 19, 52.88888888888887, 0.16666666666666666, ir5387, ir1
 event_i "i", 18, 52.88888888888887, 0.16666666666666666, 1.0, ir5387
krl0 = 2.0
kr0 = krl0
S5397 sprintf "alive_%d", ir5387
 chnset kr0, S5397
ir5400 FreePort 
 event_i "i", 20, 53.055555555555536, 0.16666666666666666, ir5400, ir1
 event_i "i", 18, 53.055555555555536, 0.16666666666666666, 1.0, ir5400
krl0 = 2.0
kr0 = krl0
S5410 sprintf "alive_%d", ir5400
 chnset kr0, S5410
ir5413 FreePort 
 event_i "i", 21, 53.19097222222221, 0.16666666666666666, ir5413, ir1
 event_i "i", 18, 53.19097222222221, 0.16666666666666666, 1.0, ir5413
krl0 = 2.0
kr0 = krl0
S5423 sprintf "alive_%d", ir5413
 chnset kr0, S5423
ir5426 FreePort 
 event_i "i", 21, 53.35763888888887, 0.16666666666666666, ir5426, ir1
 event_i "i", 18, 53.35763888888887, 0.16666666666666666, 1.0, ir5426
krl0 = 2.0
kr0 = krl0
S5436 sprintf "alive_%d", ir5426
 chnset kr0, S5436
ir5439 FreePort 
 event_i "i", 19, 53.555555555555536, 0.16666666666666666, ir5439, ir1
 event_i "i", 18, 53.555555555555536, 0.16666666666666666, 1.0, ir5439
krl0 = 2.0
kr0 = krl0
S5449 sprintf "alive_%d", ir5439
 chnset kr0, S5449
ir5452 FreePort 
 event_i "i", 20, 53.7222222222222, 0.16666666666666666, ir5452, ir1
 event_i "i", 18, 53.7222222222222, 0.16666666666666666, 1.0, ir5452
krl0 = 2.0
kr0 = krl0
S5462 sprintf "alive_%d", ir5452
 chnset kr0, S5462
ir5465 FreePort 
 event_i "i", 21, 53.85763888888887, 0.16666666666666666, ir5465, ir1
 event_i "i", 18, 53.85763888888887, 0.16666666666666666, 1.0, ir5465
krl0 = 2.0
kr0 = krl0
S5475 sprintf "alive_%d", ir5465
 chnset kr0, S5475
ir5478 FreePort 
 event_i "i", 21, 54.024305555555536, 0.16666666666666666, ir5478, ir1
 event_i "i", 18, 54.024305555555536, 0.16666666666666666, 1.0, ir5478
krl0 = 2.0
kr0 = krl0
S5488 sprintf "alive_%d", ir5478
 chnset kr0, S5488
ir5491 FreePort 
 event_i "i", 23, 54.05555555555554, 0.16666666666666666, ir5491, ir1
 event_i "i", 22, 54.05555555555554, 0.16666666666666666, 1.0, ir5491
krl0 = 2.0
kr0 = krl0
S5501 sprintf "alive_%d", ir5491
 chnset kr0, S5501
ir5504 FreePort 
 event_i "i", 19, 52.23263888888888, 0.6666666666666666, ir5504, ir1
 event_i "i", 24, 52.23263888888888, 0.6666666666666666, 1.0, ir5504
krl0 = 2.0
kr0 = krl0
S5514 sprintf "alive_%d", ir5504
 chnset kr0, S5514
ir5517 FreePort 
 event_i "i", 19, 53.565972222222214, 0.6666666666666666, ir5517, ir1
 event_i "i", 24, 53.565972222222214, 0.6666666666666666, 1.0, ir5517
krl0 = 2.0
kr0 = krl0
S5527 sprintf "alive_%d", ir5517
 chnset kr0, S5527
ir5530 FreePort 
 event_i "i", 19, 51.54513888888888, 0.3333333333333333, ir5530, ir1
 event_i "i", 25, 51.54513888888888, 0.3333333333333333, 1.0, ir5530
krl0 = 2.0
kr0 = krl0
S5540 sprintf "alive_%d", ir5530
 chnset kr0, S5540
ir5543 FreePort 
 event_i "i", 21, 52.54513888888888, 0.3333333333333333, ir5543, ir1
 event_i "i", 25, 52.54513888888888, 0.3333333333333333, 1.0, ir5543
krl0 = 2.0
kr0 = krl0
S5553 sprintf "alive_%d", ir5543
 chnset kr0, S5553
ir5556 FreePort 
 event_i "i", 19, 53.21180555555554, 0.3333333333333333, ir5556, ir1
 event_i "i", 25, 53.21180555555554, 0.3333333333333333, 1.0, ir5556
krl0 = 2.0
kr0 = krl0
S5566 sprintf "alive_%d", ir5556
 chnset kr0, S5566
ir5569 FreePort 
 event_i "i", 21, 53.87847222222221, 0.3333333333333333, ir5569, ir1
 event_i "i", 25, 53.87847222222221, 0.3333333333333333, 1.0, ir5569
krl0 = 2.0
kr0 = krl0
S5579 sprintf "alive_%d", ir5569
 chnset kr0, S5579
ir5582 FreePort 
 event_i "i", 19, 54.22222222222221, 0.16666666666666666, ir5582, ir1
 event_i "i", 18, 54.22222222222221, 0.16666666666666666, 1.0, ir5582
krl0 = 2.0
kr0 = krl0
S5592 sprintf "alive_%d", ir5582
 chnset kr0, S5592
ir5595 FreePort 
 event_i "i", 20, 54.38888888888887, 0.16666666666666666, ir5595, ir1
 event_i "i", 18, 54.38888888888887, 0.16666666666666666, 1.0, ir5595
krl0 = 2.0
kr0 = krl0
S5605 sprintf "alive_%d", ir5595
 chnset kr0, S5605
ir5608 FreePort 
 event_i "i", 21, 54.52430555555554, 0.16666666666666666, ir5608, ir1
 event_i "i", 18, 54.52430555555554, 0.16666666666666666, 1.0, ir5608
krl0 = 2.0
kr0 = krl0
S5618 sprintf "alive_%d", ir5608
 chnset kr0, S5618
ir5621 FreePort 
 event_i "i", 21, 54.69097222222221, 0.16666666666666666, ir5621, ir1
 event_i "i", 18, 54.69097222222221, 0.16666666666666666, 1.0, ir5621
krl0 = 2.0
kr0 = krl0
S5631 sprintf "alive_%d", ir5621
 chnset kr0, S5631
ir5634 FreePort 
 event_i "i", 19, 54.88888888888887, 0.16666666666666666, ir5634, ir1
 event_i "i", 18, 54.88888888888887, 0.16666666666666666, 1.0, ir5634
krl0 = 2.0
kr0 = krl0
S5644 sprintf "alive_%d", ir5634
 chnset kr0, S5644
ir5647 FreePort 
 event_i "i", 20, 55.055555555555536, 0.16666666666666666, ir5647, ir1
 event_i "i", 18, 55.055555555555536, 0.16666666666666666, 1.0, ir5647
krl0 = 2.0
kr0 = krl0
S5657 sprintf "alive_%d", ir5647
 chnset kr0, S5657
ir5660 FreePort 
 event_i "i", 21, 55.19097222222221, 0.16666666666666666, ir5660, ir1
 event_i "i", 18, 55.19097222222221, 0.16666666666666666, 1.0, ir5660
krl0 = 2.0
kr0 = krl0
S5670 sprintf "alive_%d", ir5660
 chnset kr0, S5670
ir5673 FreePort 
 event_i "i", 21, 55.35763888888887, 0.16666666666666666, ir5673, ir1
 event_i "i", 18, 55.35763888888887, 0.16666666666666666, 1.0, ir5673
krl0 = 2.0
kr0 = krl0
S5683 sprintf "alive_%d", ir5673
 chnset kr0, S5683
ir5686 FreePort 
 event_i "i", 19, 55.555555555555536, 0.16666666666666666, ir5686, ir1
 event_i "i", 18, 55.555555555555536, 0.16666666666666666, 1.0, ir5686
krl0 = 2.0
kr0 = krl0
S5696 sprintf "alive_%d", ir5686
 chnset kr0, S5696
ir5699 FreePort 
 event_i "i", 20, 55.7222222222222, 0.16666666666666666, ir5699, ir1
 event_i "i", 18, 55.7222222222222, 0.16666666666666666, 1.0, ir5699
krl0 = 2.0
kr0 = krl0
S5709 sprintf "alive_%d", ir5699
 chnset kr0, S5709
ir5712 FreePort 
 event_i "i", 21, 55.85763888888887, 0.16666666666666666, ir5712, ir1
 event_i "i", 18, 55.85763888888887, 0.16666666666666666, 1.0, ir5712
krl0 = 2.0
kr0 = krl0
S5722 sprintf "alive_%d", ir5712
 chnset kr0, S5722
ir5725 FreePort 
 event_i "i", 21, 56.024305555555536, 0.16666666666666666, ir5725, ir1
 event_i "i", 18, 56.024305555555536, 0.16666666666666666, 1.0, ir5725
krl0 = 2.0
kr0 = krl0
S5735 sprintf "alive_%d", ir5725
 chnset kr0, S5735
ir5738 FreePort 
 event_i "i", 19, 56.2222222222222, 0.16666666666666666, ir5738, ir1
 event_i "i", 18, 56.2222222222222, 0.16666666666666666, 1.0, ir5738
krl0 = 2.0
kr0 = krl0
S5748 sprintf "alive_%d", ir5738
 chnset kr0, S5748
ir5751 FreePort 
 event_i "i", 20, 56.388888888888864, 0.16666666666666666, ir5751, ir1
 event_i "i", 18, 56.388888888888864, 0.16666666666666666, 1.0, ir5751
krl0 = 2.0
kr0 = krl0
S5761 sprintf "alive_%d", ir5751
 chnset kr0, S5761
ir5764 FreePort 
 event_i "i", 21, 56.524305555555536, 0.16666666666666666, ir5764, ir1
 event_i "i", 18, 56.524305555555536, 0.16666666666666666, 1.0, ir5764
krl0 = 2.0
kr0 = krl0
S5774 sprintf "alive_%d", ir5764
 chnset kr0, S5774
ir5777 FreePort 
 event_i "i", 21, 56.6909722222222, 0.16666666666666666, ir5777, ir1
 event_i "i", 18, 56.6909722222222, 0.16666666666666666, 1.0, ir5777
krl0 = 2.0
kr0 = krl0
S5787 sprintf "alive_%d", ir5777
 chnset kr0, S5787
ir5790 FreePort 
 event_i "i", 23, 56.72222222222221, 0.16666666666666666, ir5790, ir1
 event_i "i", 22, 56.72222222222221, 0.16666666666666666, 1.0, ir5790
krl0 = 2.0
kr0 = krl0
S5800 sprintf "alive_%d", ir5790
 chnset kr0, S5800
ir5803 FreePort 
 event_i "i", 19, 54.89930555555554, 0.6666666666666666, ir5803, ir1
 event_i "i", 24, 54.89930555555554, 0.6666666666666666, 1.0, ir5803
krl0 = 2.0
kr0 = krl0
S5813 sprintf "alive_%d", ir5803
 chnset kr0, S5813
ir5816 FreePort 
 event_i "i", 19, 56.23263888888888, 0.6666666666666666, ir5816, ir1
 event_i "i", 24, 56.23263888888888, 0.6666666666666666, 1.0, ir5816
krl0 = 2.0
kr0 = krl0
S5826 sprintf "alive_%d", ir5816
 chnset kr0, S5826
ir5829 FreePort 
 event_i "i", 19, 54.21180555555554, 0.3333333333333333, ir5829, ir1
 event_i "i", 25, 54.21180555555554, 0.3333333333333333, 1.0, ir5829
krl0 = 2.0
kr0 = krl0
S5839 sprintf "alive_%d", ir5829
 chnset kr0, S5839
ir5842 FreePort 
 event_i "i", 21, 55.21180555555554, 0.3333333333333333, ir5842, ir1
 event_i "i", 25, 55.21180555555554, 0.3333333333333333, 1.0, ir5842
krl0 = 2.0
kr0 = krl0
S5852 sprintf "alive_%d", ir5842
 chnset kr0, S5852
ir5855 FreePort 
 event_i "i", 19, 55.87847222222221, 0.3333333333333333, ir5855, ir1
 event_i "i", 25, 55.87847222222221, 0.3333333333333333, 1.0, ir5855
krl0 = 2.0
kr0 = krl0
S5865 sprintf "alive_%d", ir5855
 chnset kr0, S5865
ir5868 FreePort 
 event_i "i", 21, 56.54513888888887, 0.3333333333333333, ir5868, ir1
 event_i "i", 25, 56.54513888888887, 0.3333333333333333, 1.0, ir5868
krl0 = 2.0
kr0 = krl0
S5878 sprintf "alive_%d", ir5868
 chnset kr0, S5878
ir5881 FreePort 
 event_i "i", 19, 56.88888888888888, 0.19999999999999998, ir5881, ir1
 event_i "i", 18, 56.88888888888888, 0.19999999999999998, 1.0, ir5881
krl0 = 2.0
kr0 = krl0
S5891 sprintf "alive_%d", ir5881
 chnset kr0, S5891
ir5894 FreePort 
 event_i "i", 21, 57.08888888888888, 0.13333333333333333, ir5894, ir1
 event_i "i", 18, 57.08888888888888, 0.13333333333333333, 1.0, ir5894
krl0 = 2.0
kr0 = krl0
S5904 sprintf "alive_%d", ir5894
 chnset kr0, S5904
ir5907 FreePort 
 event_i "i", 19, 57.222222222222214, 0.19999999999999998, ir5907, ir1
 event_i "i", 18, 57.222222222222214, 0.19999999999999998, 1.0, ir5907
krl0 = 2.0
kr0 = krl0
S5917 sprintf "alive_%d", ir5907
 chnset kr0, S5917
ir5920 FreePort 
 event_i "i", 21, 57.42222222222222, 0.13333333333333333, ir5920, ir1
 event_i "i", 18, 57.42222222222222, 0.13333333333333333, 1.0, ir5920
krl0 = 2.0
kr0 = krl0
S5930 sprintf "alive_%d", ir5920
 chnset kr0, S5930
ir5933 FreePort 
 event_i "i", 19, 57.55555555555555, 0.19999999999999998, ir5933, ir1
 event_i "i", 18, 57.55555555555555, 0.19999999999999998, 1.0, ir5933
krl0 = 2.0
kr0 = krl0
S5943 sprintf "alive_%d", ir5933
 chnset kr0, S5943
ir5946 FreePort 
 event_i "i", 21, 57.75555555555555, 0.13333333333333333, ir5946, ir1
 event_i "i", 18, 57.75555555555555, 0.13333333333333333, 1.0, ir5946
krl0 = 2.0
kr0 = krl0
S5956 sprintf "alive_%d", ir5946
 chnset kr0, S5956
ir5959 FreePort 
 event_i "i", 19, 57.888888888888886, 0.19999999999999998, ir5959, ir1
 event_i "i", 18, 57.888888888888886, 0.19999999999999998, 1.0, ir5959
krl0 = 2.0
kr0 = krl0
S5969 sprintf "alive_%d", ir5959
 chnset kr0, S5969
ir5972 FreePort 
 event_i "i", 21, 58.08888888888889, 0.13333333333333333, ir5972, ir1
 event_i "i", 18, 58.08888888888889, 0.13333333333333333, 1.0, ir5972
krl0 = 2.0
kr0 = krl0
S5982 sprintf "alive_%d", ir5972
 chnset kr0, S5982
ir5985 FreePort 
 event_i "i", 19, 58.22222222222222, 0.19999999999999998, ir5985, ir1
 event_i "i", 18, 58.22222222222222, 0.19999999999999998, 1.0, ir5985
krl0 = 2.0
kr0 = krl0
S5995 sprintf "alive_%d", ir5985
 chnset kr0, S5995
ir5998 FreePort 
 event_i "i", 21, 58.422222222222224, 0.13333333333333333, ir5998, ir1
 event_i "i", 18, 58.422222222222224, 0.13333333333333333, 1.0, ir5998
krl0 = 2.0
kr0 = krl0
S6008 sprintf "alive_%d", ir5998
 chnset kr0, S6008
ir6011 FreePort 
 event_i "i", 19, 58.55555555555556, 0.19999999999999998, ir6011, ir1
 event_i "i", 18, 58.55555555555556, 0.19999999999999998, 1.0, ir6011
krl0 = 2.0
kr0 = krl0
S6021 sprintf "alive_%d", ir6011
 chnset kr0, S6021
ir6024 FreePort 
 event_i "i", 21, 58.75555555555556, 0.13333333333333333, ir6024, ir1
 event_i "i", 18, 58.75555555555556, 0.13333333333333333, 1.0, ir6024
krl0 = 2.0
kr0 = krl0
S6034 sprintf "alive_%d", ir6024
 chnset kr0, S6034
ir6037 FreePort 
 event_i "i", 19, 58.88888888888889, 0.19999999999999998, ir6037, ir1
 event_i "i", 18, 58.88888888888889, 0.19999999999999998, 1.0, ir6037
krl0 = 2.0
kr0 = krl0
S6047 sprintf "alive_%d", ir6037
 chnset kr0, S6047
ir6050 FreePort 
 event_i "i", 21, 59.088888888888896, 0.13333333333333333, ir6050, ir1
 event_i "i", 18, 59.088888888888896, 0.13333333333333333, 1.0, ir6050
krl0 = 2.0
kr0 = krl0
S6060 sprintf "alive_%d", ir6050
 chnset kr0, S6060
ir6063 FreePort 
 event_i "i", 19, 59.22222222222223, 0.19999999999999998, ir6063, ir1
 event_i "i", 18, 59.22222222222223, 0.19999999999999998, 1.0, ir6063
krl0 = 2.0
kr0 = krl0
S6073 sprintf "alive_%d", ir6063
 chnset kr0, S6073
ir6076 FreePort 
 event_i "i", 21, 59.42222222222223, 0.13333333333333333, ir6076, ir1
 event_i "i", 18, 59.42222222222223, 0.13333333333333333, 1.0, ir6076
krl0 = 2.0
kr0 = krl0
S6086 sprintf "alive_%d", ir6076
 chnset kr0, S6086
ir6089 FreePort 
 event_i "i", 23, 59.38888888888888, 0.16666666666666666, ir6089, ir1
 event_i "i", 22, 59.38888888888888, 0.16666666666666666, 1.0, ir6089
krl0 = 2.0
kr0 = krl0
S6099 sprintf "alive_%d", ir6089
 chnset kr0, S6099
ir6102 FreePort 
 event_i "i", 19, 57.55555555555554, 0.6666666666666666, ir6102, ir1
 event_i "i", 24, 57.55555555555554, 0.6666666666666666, 1.0, ir6102
krl0 = 2.0
kr0 = krl0
S6112 sprintf "alive_%d", ir6102
 chnset kr0, S6112
ir6115 FreePort 
 event_i "i", 19, 58.88888888888888, 0.6666666666666666, ir6115, ir1
 event_i "i", 24, 58.88888888888888, 0.6666666666666666, 1.0, ir6115
krl0 = 2.0
kr0 = krl0
S6125 sprintf "alive_%d", ir6115
 chnset kr0, S6125
ir6128 FreePort 
 event_i "i", 19, 56.88888888888888, 0.3333333333333333, ir6128, ir1
 event_i "i", 25, 56.88888888888888, 0.3333333333333333, 1.0, ir6128
krl0 = 2.0
kr0 = krl0
S6138 sprintf "alive_%d", ir6128
 chnset kr0, S6138
ir6141 FreePort 
 event_i "i", 21, 57.88888888888888, 0.3333333333333333, ir6141, ir1
 event_i "i", 25, 57.88888888888888, 0.3333333333333333, 1.0, ir6141
krl0 = 2.0
kr0 = krl0
S6151 sprintf "alive_%d", ir6141
 chnset kr0, S6151
ir6154 FreePort 
 event_i "i", 19, 58.55555555555554, 0.3333333333333333, ir6154, ir1
 event_i "i", 25, 58.55555555555554, 0.3333333333333333, 1.0, ir6154
krl0 = 2.0
kr0 = krl0
S6164 sprintf "alive_%d", ir6154
 chnset kr0, S6164
ir6167 FreePort 
 event_i "i", 21, 59.22222222222221, 0.3333333333333333, ir6167, ir1
 event_i "i", 25, 59.22222222222221, 0.3333333333333333, 1.0, ir6167
krl0 = 2.0
kr0 = krl0
S6177 sprintf "alive_%d", ir6167
 chnset kr0, S6177
ir6180 FreePort 
 event_i "i", 19, 59.55555555555554, 0.19999999999999998, ir6180, ir1
 event_i "i", 18, 59.55555555555554, 0.19999999999999998, 1.0, ir6180
krl0 = 2.0
kr0 = krl0
S6190 sprintf "alive_%d", ir6180
 chnset kr0, S6190
ir6193 FreePort 
 event_i "i", 21, 59.755555555555546, 0.13333333333333333, ir6193, ir1
 event_i "i", 18, 59.755555555555546, 0.13333333333333333, 1.0, ir6193
krl0 = 2.0
kr0 = krl0
S6203 sprintf "alive_%d", ir6193
 chnset kr0, S6203
ir6206 FreePort 
 event_i "i", 19, 59.88888888888888, 0.19999999999999998, ir6206, ir1
 event_i "i", 18, 59.88888888888888, 0.19999999999999998, 1.0, ir6206
krl0 = 2.0
kr0 = krl0
S6216 sprintf "alive_%d", ir6206
 chnset kr0, S6216
ir6219 FreePort 
 event_i "i", 21, 60.08888888888888, 0.13333333333333333, ir6219, ir1
 event_i "i", 18, 60.08888888888888, 0.13333333333333333, 1.0, ir6219
krl0 = 2.0
kr0 = krl0
S6229 sprintf "alive_%d", ir6219
 chnset kr0, S6229
ir6232 FreePort 
 event_i "i", 19, 60.222222222222214, 0.19999999999999998, ir6232, ir1
 event_i "i", 18, 60.222222222222214, 0.19999999999999998, 1.0, ir6232
krl0 = 2.0
kr0 = krl0
S6242 sprintf "alive_%d", ir6232
 chnset kr0, S6242
ir6245 FreePort 
 event_i "i", 21, 60.42222222222222, 0.13333333333333333, ir6245, ir1
 event_i "i", 18, 60.42222222222222, 0.13333333333333333, 1.0, ir6245
krl0 = 2.0
kr0 = krl0
S6255 sprintf "alive_%d", ir6245
 chnset kr0, S6255
ir6258 FreePort 
 event_i "i", 19, 60.55555555555555, 0.19999999999999998, ir6258, ir1
 event_i "i", 18, 60.55555555555555, 0.19999999999999998, 1.0, ir6258
krl0 = 2.0
kr0 = krl0
S6268 sprintf "alive_%d", ir6258
 chnset kr0, S6268
ir6271 FreePort 
 event_i "i", 21, 60.75555555555555, 0.13333333333333333, ir6271, ir1
 event_i "i", 18, 60.75555555555555, 0.13333333333333333, 1.0, ir6271
krl0 = 2.0
kr0 = krl0
S6281 sprintf "alive_%d", ir6271
 chnset kr0, S6281
ir6284 FreePort 
 event_i "i", 19, 60.888888888888886, 0.19999999999999998, ir6284, ir1
 event_i "i", 18, 60.888888888888886, 0.19999999999999998, 1.0, ir6284
krl0 = 2.0
kr0 = krl0
S6294 sprintf "alive_%d", ir6284
 chnset kr0, S6294
ir6297 FreePort 
 event_i "i", 21, 61.08888888888889, 0.13333333333333333, ir6297, ir1
 event_i "i", 18, 61.08888888888889, 0.13333333333333333, 1.0, ir6297
krl0 = 2.0
kr0 = krl0
S6307 sprintf "alive_%d", ir6297
 chnset kr0, S6307
ir6310 FreePort 
 event_i "i", 19, 61.22222222222222, 0.19999999999999998, ir6310, ir1
 event_i "i", 18, 61.22222222222222, 0.19999999999999998, 1.0, ir6310
krl0 = 2.0
kr0 = krl0
S6320 sprintf "alive_%d", ir6310
 chnset kr0, S6320
ir6323 FreePort 
 event_i "i", 21, 61.422222222222224, 0.13333333333333333, ir6323, ir1
 event_i "i", 18, 61.422222222222224, 0.13333333333333333, 1.0, ir6323
krl0 = 2.0
kr0 = krl0
S6333 sprintf "alive_%d", ir6323
 chnset kr0, S6333
ir6336 FreePort 
 event_i "i", 19, 61.55555555555556, 0.19999999999999998, ir6336, ir1
 event_i "i", 18, 61.55555555555556, 0.19999999999999998, 1.0, ir6336
krl0 = 2.0
kr0 = krl0
S6346 sprintf "alive_%d", ir6336
 chnset kr0, S6346
ir6349 FreePort 
 event_i "i", 21, 61.75555555555556, 0.13333333333333333, ir6349, ir1
 event_i "i", 18, 61.75555555555556, 0.13333333333333333, 1.0, ir6349
krl0 = 2.0
kr0 = krl0
S6359 sprintf "alive_%d", ir6349
 chnset kr0, S6359
ir6362 FreePort 
 event_i "i", 19, 61.88888888888889, 0.19999999999999998, ir6362, ir1
 event_i "i", 18, 61.88888888888889, 0.19999999999999998, 1.0, ir6362
krl0 = 2.0
kr0 = krl0
S6372 sprintf "alive_%d", ir6362
 chnset kr0, S6372
ir6375 FreePort 
 event_i "i", 21, 62.088888888888896, 0.13333333333333333, ir6375, ir1
 event_i "i", 18, 62.088888888888896, 0.13333333333333333, 1.0, ir6375
krl0 = 2.0
kr0 = krl0
S6385 sprintf "alive_%d", ir6375
 chnset kr0, S6385
ir6388 FreePort 
 event_i "i", 23, 62.05555555555554, 0.16666666666666666, ir6388, ir1
 event_i "i", 22, 62.05555555555554, 0.16666666666666666, 1.0, ir6388
krl0 = 2.0
kr0 = krl0
S6398 sprintf "alive_%d", ir6388
 chnset kr0, S6398
ir6401 FreePort 
 event_i "i", 19, 60.22222222222221, 0.6666666666666666, ir6401, ir1
 event_i "i", 24, 60.22222222222221, 0.6666666666666666, 1.0, ir6401
krl0 = 2.0
kr0 = krl0
S6411 sprintf "alive_%d", ir6401
 chnset kr0, S6411
ir6414 FreePort 
 event_i "i", 19, 61.55555555555554, 0.6666666666666666, ir6414, ir1
 event_i "i", 24, 61.55555555555554, 0.6666666666666666, 1.0, ir6414
krl0 = 2.0
kr0 = krl0
S6424 sprintf "alive_%d", ir6414
 chnset kr0, S6424
ir6427 FreePort 
 event_i "i", 19, 59.55555555555554, 0.3333333333333333, ir6427, ir1
 event_i "i", 25, 59.55555555555554, 0.3333333333333333, 1.0, ir6427
krl0 = 2.0
kr0 = krl0
S6437 sprintf "alive_%d", ir6427
 chnset kr0, S6437
ir6440 FreePort 
 event_i "i", 21, 60.55555555555554, 0.3333333333333333, ir6440, ir1
 event_i "i", 25, 60.55555555555554, 0.3333333333333333, 1.0, ir6440
krl0 = 2.0
kr0 = krl0
S6450 sprintf "alive_%d", ir6440
 chnset kr0, S6450
ir6453 FreePort 
 event_i "i", 19, 61.22222222222221, 0.3333333333333333, ir6453, ir1
 event_i "i", 25, 61.22222222222221, 0.3333333333333333, 1.0, ir6453
krl0 = 2.0
kr0 = krl0
S6463 sprintf "alive_%d", ir6453
 chnset kr0, S6463
ir6466 FreePort 
 event_i "i", 21, 61.88888888888887, 0.3333333333333333, ir6466, ir1
 event_i "i", 25, 61.88888888888887, 0.3333333333333333, 1.0, ir6466
krl0 = 2.0
kr0 = krl0
S6476 sprintf "alive_%d", ir6466
 chnset kr0, S6476
ir6479 FreePort 
 event_i "i", 19, 62.222222222222214, 0.26666666666666666, ir6479, ir1
 event_i "i", 18, 62.222222222222214, 0.26666666666666666, 1.0, ir6479
krl0 = 2.0
kr0 = krl0
S6489 sprintf "alive_%d", ir6479
 chnset kr0, S6489
ir6492 FreePort 
 event_i "i", 21, 62.48888888888888, 0.17777777777777776, ir6492, ir1
 event_i "i", 18, 62.48888888888888, 0.17777777777777776, 1.0, ir6492
krl0 = 2.0
kr0 = krl0
S6502 sprintf "alive_%d", ir6492
 chnset kr0, S6502
ir6505 FreePort 
 event_i "i", 19, 62.66666666666666, 0.26666666666666666, ir6505, ir1
 event_i "i", 18, 62.66666666666666, 0.26666666666666666, 1.0, ir6505
krl0 = 2.0
kr0 = krl0
S6515 sprintf "alive_%d", ir6505
 chnset kr0, S6515
ir6518 FreePort 
 event_i "i", 21, 62.93333333333332, 0.17777777777777776, ir6518, ir1
 event_i "i", 18, 62.93333333333332, 0.17777777777777776, 1.0, ir6518
krl0 = 2.0
kr0 = krl0
S6528 sprintf "alive_%d", ir6518
 chnset kr0, S6528
ir6531 FreePort 
 event_i "i", 19, 63.1111111111111, 0.26666666666666666, ir6531, ir1
 event_i "i", 18, 63.1111111111111, 0.26666666666666666, 1.0, ir6531
krl0 = 2.0
kr0 = krl0
S6541 sprintf "alive_%d", ir6531
 chnset kr0, S6541
ir6544 FreePort 
 event_i "i", 21, 63.377777777777766, 0.17777777777777776, ir6544, ir1
 event_i "i", 18, 63.377777777777766, 0.17777777777777776, 1.0, ir6544
krl0 = 2.0
kr0 = krl0
S6554 sprintf "alive_%d", ir6544
 chnset kr0, S6554
ir6557 FreePort 
 event_i "i", 19, 63.55555555555554, 0.26666666666666666, ir6557, ir1
 event_i "i", 18, 63.55555555555554, 0.26666666666666666, 1.0, ir6557
krl0 = 2.0
kr0 = krl0
S6567 sprintf "alive_%d", ir6557
 chnset kr0, S6567
ir6570 FreePort 
 event_i "i", 21, 63.82222222222221, 0.17777777777777776, ir6570, ir1
 event_i "i", 18, 63.82222222222221, 0.17777777777777776, 1.0, ir6570
krl0 = 2.0
kr0 = krl0
S6580 sprintf "alive_%d", ir6570
 chnset kr0, S6580
ir6583 FreePort 
 event_i "i", 19, 63.999999999999986, 0.26666666666666666, ir6583, ir1
 event_i "i", 18, 63.999999999999986, 0.26666666666666666, 1.0, ir6583
krl0 = 2.0
kr0 = krl0
S6593 sprintf "alive_%d", ir6583
 chnset kr0, S6593
ir6596 FreePort 
 event_i "i", 21, 64.26666666666665, 0.17777777777777776, ir6596, ir1
 event_i "i", 18, 64.26666666666665, 0.17777777777777776, 1.0, ir6596
krl0 = 2.0
kr0 = krl0
S6606 sprintf "alive_%d", ir6596
 chnset kr0, S6606
ir6609 FreePort 
 event_i "i", 19, 64.44444444444443, 0.26666666666666666, ir6609, ir1
 event_i "i", 18, 64.44444444444443, 0.26666666666666666, 1.0, ir6609
krl0 = 2.0
kr0 = krl0
S6619 sprintf "alive_%d", ir6609
 chnset kr0, S6619
ir6622 FreePort 
 event_i "i", 21, 64.7111111111111, 0.17777777777777776, ir6622, ir1
 event_i "i", 18, 64.7111111111111, 0.17777777777777776, 1.0, ir6622
krl0 = 2.0
kr0 = krl0
S6632 sprintf "alive_%d", ir6622
 chnset kr0, S6632
ir6635 FreePort 
 event_i "i", 19, 64.88888888888887, 0.26666666666666666, ir6635, ir1
 event_i "i", 18, 64.88888888888887, 0.26666666666666666, 1.0, ir6635
krl0 = 2.0
kr0 = krl0
S6645 sprintf "alive_%d", ir6635
 chnset kr0, S6645
ir6648 FreePort 
 event_i "i", 21, 65.15555555555554, 0.17777777777777776, ir6648, ir1
 event_i "i", 18, 65.15555555555554, 0.17777777777777776, 1.0, ir6648
krl0 = 2.0
kr0 = krl0
S6658 sprintf "alive_%d", ir6648
 chnset kr0, S6658
ir6661 FreePort 
 event_i "i", 19, 65.33333333333331, 0.26666666666666666, ir6661, ir1
 event_i "i", 18, 65.33333333333331, 0.26666666666666666, 1.0, ir6661
krl0 = 2.0
kr0 = krl0
S6671 sprintf "alive_%d", ir6661
 chnset kr0, S6671
ir6674 FreePort 
 event_i "i", 21, 65.59999999999998, 0.17777777777777776, ir6674, ir1
 event_i "i", 18, 65.59999999999998, 0.17777777777777776, 1.0, ir6674
krl0 = 2.0
kr0 = krl0
S6684 sprintf "alive_%d", ir6674
 chnset kr0, S6684
ir6687 FreePort 
 event_i "i", 23, 65.55555555555554, 0.2222222222222222, ir6687, ir1
 event_i "i", 22, 65.55555555555554, 0.2222222222222222, 1.0, ir6687
krl0 = 2.0
kr0 = krl0
S6697 sprintf "alive_%d", ir6687
 chnset kr0, S6697
ir6700 FreePort 
 event_i "i", 19, 63.1111111111111, 0.8888888888888888, ir6700, ir1
 event_i "i", 24, 63.1111111111111, 0.8888888888888888, 1.0, ir6700
krl0 = 2.0
kr0 = krl0
S6710 sprintf "alive_%d", ir6700
 chnset kr0, S6710
ir6713 FreePort 
 event_i "i", 19, 64.88888888888887, 0.8888888888888888, ir6713, ir1
 event_i "i", 24, 64.88888888888887, 0.8888888888888888, 1.0, ir6713
krl0 = 2.0
kr0 = krl0
S6723 sprintf "alive_%d", ir6713
 chnset kr0, S6723
ir6726 FreePort 
 event_i "i", 19, 62.222222222222214, 0.4444444444444444, ir6726, ir1
 event_i "i", 25, 62.222222222222214, 0.4444444444444444, 1.0, ir6726
krl0 = 2.0
kr0 = krl0
S6736 sprintf "alive_%d", ir6726
 chnset kr0, S6736
ir6739 FreePort 
 event_i "i", 19, 64.44444444444444, 0.4444444444444444, ir6739, ir1
 event_i "i", 25, 64.44444444444444, 0.4444444444444444, 1.0, ir6739
krl0 = 2.0
kr0 = krl0
S6749 sprintf "alive_%d", ir6739
 chnset kr0, S6749
ir6752 FreePort 
 event_i "i", 19, 65.77777777777777, 0.26666666666666666, ir6752, ir1
 event_i "i", 18, 65.77777777777777, 0.26666666666666666, 1.0, ir6752
krl0 = 2.0
kr0 = krl0
S6762 sprintf "alive_%d", ir6752
 chnset kr0, S6762
ir6765 FreePort 
 event_i "i", 21, 66.04444444444444, 0.17777777777777776, ir6765, ir1
 event_i "i", 18, 66.04444444444444, 0.17777777777777776, 1.0, ir6765
krl0 = 2.0
kr0 = krl0
S6775 sprintf "alive_%d", ir6765
 chnset kr0, S6775
ir6778 FreePort 
 event_i "i", 19, 66.22222222222221, 0.26666666666666666, ir6778, ir1
 event_i "i", 18, 66.22222222222221, 0.26666666666666666, 1.0, ir6778
krl0 = 2.0
kr0 = krl0
S6788 sprintf "alive_%d", ir6778
 chnset kr0, S6788
ir6791 FreePort 
 event_i "i", 21, 66.48888888888888, 0.17777777777777776, ir6791, ir1
 event_i "i", 18, 66.48888888888888, 0.17777777777777776, 1.0, ir6791
krl0 = 2.0
kr0 = krl0
S6801 sprintf "alive_%d", ir6791
 chnset kr0, S6801
ir6804 FreePort 
 event_i "i", 19, 66.66666666666666, 0.26666666666666666, ir6804, ir1
 event_i "i", 18, 66.66666666666666, 0.26666666666666666, 1.0, ir6804
krl0 = 2.0
kr0 = krl0
S6814 sprintf "alive_%d", ir6804
 chnset kr0, S6814
ir6817 FreePort 
 event_i "i", 21, 66.93333333333332, 0.17777777777777776, ir6817, ir1
 event_i "i", 18, 66.93333333333332, 0.17777777777777776, 1.0, ir6817
krl0 = 2.0
kr0 = krl0
S6827 sprintf "alive_%d", ir6817
 chnset kr0, S6827
ir6830 FreePort 
 event_i "i", 19, 67.1111111111111, 0.26666666666666666, ir6830, ir1
 event_i "i", 18, 67.1111111111111, 0.26666666666666666, 1.0, ir6830
krl0 = 2.0
kr0 = krl0
S6840 sprintf "alive_%d", ir6830
 chnset kr0, S6840
ir6843 FreePort 
 event_i "i", 21, 67.37777777777777, 0.17777777777777776, ir6843, ir1
 event_i "i", 18, 67.37777777777777, 0.17777777777777776, 1.0, ir6843
krl0 = 2.0
kr0 = krl0
S6853 sprintf "alive_%d", ir6843
 chnset kr0, S6853
ir6856 FreePort 
 event_i "i", 19, 67.55555555555554, 0.26666666666666666, ir6856, ir1
 event_i "i", 18, 67.55555555555554, 0.26666666666666666, 1.0, ir6856
krl0 = 2.0
kr0 = krl0
S6866 sprintf "alive_%d", ir6856
 chnset kr0, S6866
ir6869 FreePort 
 event_i "i", 21, 67.82222222222221, 0.17777777777777776, ir6869, ir1
 event_i "i", 18, 67.82222222222221, 0.17777777777777776, 1.0, ir6869
krl0 = 2.0
kr0 = krl0
S6879 sprintf "alive_%d", ir6869
 chnset kr0, S6879
ir6882 FreePort 
 event_i "i", 19, 67.99999999999999, 0.26666666666666666, ir6882, ir1
 event_i "i", 18, 67.99999999999999, 0.26666666666666666, 1.0, ir6882
krl0 = 2.0
kr0 = krl0
S6892 sprintf "alive_%d", ir6882
 chnset kr0, S6892
ir6895 FreePort 
 event_i "i", 21, 68.26666666666665, 0.17777777777777776, ir6895, ir1
 event_i "i", 18, 68.26666666666665, 0.17777777777777776, 1.0, ir6895
krl0 = 2.0
kr0 = krl0
S6905 sprintf "alive_%d", ir6895
 chnset kr0, S6905
ir6908 FreePort 
 event_i "i", 19, 68.44444444444443, 0.26666666666666666, ir6908, ir1
 event_i "i", 18, 68.44444444444443, 0.26666666666666666, 1.0, ir6908
krl0 = 2.0
kr0 = krl0
S6918 sprintf "alive_%d", ir6908
 chnset kr0, S6918
ir6921 FreePort 
 event_i "i", 21, 68.7111111111111, 0.17777777777777776, ir6921, ir1
 event_i "i", 18, 68.7111111111111, 0.17777777777777776, 1.0, ir6921
krl0 = 2.0
kr0 = krl0
S6931 sprintf "alive_%d", ir6921
 chnset kr0, S6931
ir6934 FreePort 
 event_i "i", 19, 68.88888888888887, 0.26666666666666666, ir6934, ir1
 event_i "i", 18, 68.88888888888887, 0.26666666666666666, 1.0, ir6934
krl0 = 2.0
kr0 = krl0
S6944 sprintf "alive_%d", ir6934
 chnset kr0, S6944
ir6947 FreePort 
 event_i "i", 21, 69.15555555555554, 0.17777777777777776, ir6947, ir1
 event_i "i", 18, 69.15555555555554, 0.17777777777777776, 1.0, ir6947
krl0 = 2.0
kr0 = krl0
S6957 sprintf "alive_%d", ir6947
 chnset kr0, S6957
ir6960 FreePort 
 event_i "i", 23, 69.1111111111111, 0.2222222222222222, ir6960, ir1
 event_i "i", 22, 69.1111111111111, 0.2222222222222222, 1.0, ir6960
krl0 = 2.0
kr0 = krl0
S6970 sprintf "alive_%d", ir6960
 chnset kr0, S6970
ir6973 FreePort 
 event_i "i", 19, 66.66666666666666, 0.8888888888888888, ir6973, ir1
 event_i "i", 24, 66.66666666666666, 0.8888888888888888, 1.0, ir6973
krl0 = 2.0
kr0 = krl0
S6983 sprintf "alive_%d", ir6973
 chnset kr0, S6983
ir6986 FreePort 
 event_i "i", 19, 68.44444444444443, 0.8888888888888888, ir6986, ir1
 event_i "i", 24, 68.44444444444443, 0.8888888888888888, 1.0, ir6986
krl0 = 2.0
kr0 = krl0
S6996 sprintf "alive_%d", ir6986
 chnset kr0, S6996
ir6999 FreePort 
 event_i "i", 19, 65.77777777777777, 0.4444444444444444, ir6999, ir1
 event_i "i", 25, 65.77777777777777, 0.4444444444444444, 1.0, ir6999
krl0 = 2.0
kr0 = krl0
S7009 sprintf "alive_%d", ir6999
 chnset kr0, S7009
ir7012 FreePort 
 event_i "i", 19, 68.0, 0.4444444444444444, ir7012, ir1
 event_i "i", 25, 68.0, 0.4444444444444444, 1.0, ir7012
krl0 = 2.0
kr0 = krl0
S7022 sprintf "alive_%d", ir7012
 chnset kr0, S7022
ir7025 FreePort 
 event_i "i", 19, 69.33333333333331, 0.16666666666666666, ir7025, ir1
 event_i "i", 18, 69.33333333333331, 0.16666666666666666, 1.0, ir7025
krl0 = 2.0
kr0 = krl0
S7035 sprintf "alive_%d", ir7025
 chnset kr0, S7035
ir7038 FreePort 
 event_i "i", 20, 69.49999999999999, 0.16666666666666666, ir7038, ir1
 event_i "i", 18, 69.49999999999999, 0.16666666666666666, 1.0, ir7038
krl0 = 2.0
kr0 = krl0
S7048 sprintf "alive_%d", ir7038
 chnset kr0, S7048
ir7051 FreePort 
 event_i "i", 21, 69.66666666666666, 0.16666666666666666, ir7051, ir1
 event_i "i", 18, 69.66666666666666, 0.16666666666666666, 1.0, ir7051
krl0 = 2.0
kr0 = krl0
S7061 sprintf "alive_%d", ir7051
 chnset kr0, S7061
ir7064 FreePort 
 event_i "i", 21, 69.83333333333333, 0.16666666666666666, ir7064, ir1
 event_i "i", 18, 69.83333333333333, 0.16666666666666666, 1.0, ir7064
krl0 = 2.0
kr0 = krl0
S7074 sprintf "alive_%d", ir7064
 chnset kr0, S7074
ir7077 FreePort 
 event_i "i", 19, 70.0, 0.16666666666666666, ir7077, ir1
 event_i "i", 18, 70.0, 0.16666666666666666, 1.0, ir7077
krl0 = 2.0
kr0 = krl0
S7087 sprintf "alive_%d", ir7077
 chnset kr0, S7087
ir7090 FreePort 
 event_i "i", 20, 70.16666666666667, 0.16666666666666666, ir7090, ir1
 event_i "i", 18, 70.16666666666667, 0.16666666666666666, 1.0, ir7090
krl0 = 2.0
kr0 = krl0
S7100 sprintf "alive_%d", ir7090
 chnset kr0, S7100
ir7103 FreePort 
 event_i "i", 21, 70.33333333333334, 0.16666666666666666, ir7103, ir1
 event_i "i", 18, 70.33333333333334, 0.16666666666666666, 1.0, ir7103
krl0 = 2.0
kr0 = krl0
S7113 sprintf "alive_%d", ir7103
 chnset kr0, S7113
ir7116 FreePort 
 event_i "i", 21, 70.50000000000001, 0.16666666666666666, ir7116, ir1
 event_i "i", 18, 70.50000000000001, 0.16666666666666666, 1.0, ir7116
krl0 = 2.0
kr0 = krl0
S7126 sprintf "alive_%d", ir7116
 chnset kr0, S7126
ir7129 FreePort 
 event_i "i", 19, 70.66666666666669, 0.16666666666666666, ir7129, ir1
 event_i "i", 18, 70.66666666666669, 0.16666666666666666, 1.0, ir7129
krl0 = 2.0
kr0 = krl0
S7139 sprintf "alive_%d", ir7129
 chnset kr0, S7139
ir7142 FreePort 
 event_i "i", 20, 70.83333333333336, 0.16666666666666666, ir7142, ir1
 event_i "i", 18, 70.83333333333336, 0.16666666666666666, 1.0, ir7142
krl0 = 2.0
kr0 = krl0
S7152 sprintf "alive_%d", ir7142
 chnset kr0, S7152
ir7155 FreePort 
 event_i "i", 21, 71.00000000000003, 0.16666666666666666, ir7155, ir1
 event_i "i", 18, 71.00000000000003, 0.16666666666666666, 1.0, ir7155
krl0 = 2.0
kr0 = krl0
S7165 sprintf "alive_%d", ir7155
 chnset kr0, S7165
ir7168 FreePort 
 event_i "i", 21, 71.1666666666667, 0.16666666666666666, ir7168, ir1
 event_i "i", 18, 71.1666666666667, 0.16666666666666666, 1.0, ir7168
krl0 = 2.0
kr0 = krl0
S7178 sprintf "alive_%d", ir7168
 chnset kr0, S7178
ir7181 FreePort 
 event_i "i", 19, 71.33333333333337, 0.16666666666666666, ir7181, ir1
 event_i "i", 18, 71.33333333333337, 0.16666666666666666, 1.0, ir7181
krl0 = 2.0
kr0 = krl0
S7191 sprintf "alive_%d", ir7181
 chnset kr0, S7191
ir7194 FreePort 
 event_i "i", 20, 71.50000000000004, 0.16666666666666666, ir7194, ir1
 event_i "i", 18, 71.50000000000004, 0.16666666666666666, 1.0, ir7194
krl0 = 2.0
kr0 = krl0
S7204 sprintf "alive_%d", ir7194
 chnset kr0, S7204
ir7207 FreePort 
 event_i "i", 21, 71.66666666666671, 0.16666666666666666, ir7207, ir1
 event_i "i", 18, 71.66666666666671, 0.16666666666666666, 1.0, ir7207
krl0 = 2.0
kr0 = krl0
S7217 sprintf "alive_%d", ir7207
 chnset kr0, S7217
ir7220 FreePort 
 event_i "i", 21, 71.83333333333339, 0.16666666666666666, ir7220, ir1
 event_i "i", 18, 71.83333333333339, 0.16666666666666666, 1.0, ir7220
krl0 = 2.0
kr0 = krl0
S7230 sprintf "alive_%d", ir7220
 chnset kr0, S7230
ir7233 FreePort 
 event_i "i", 23, 71.83333333333331, 0.16666666666666666, ir7233, ir1
 event_i "i", 22, 71.83333333333331, 0.16666666666666666, 1.0, ir7233
krl0 = 2.0
kr0 = krl0
S7243 sprintf "alive_%d", ir7233
 chnset kr0, S7243
ir7246 FreePort 
 event_i "i", 19, 69.99999999999999, 0.6666666666666666, ir7246, ir1
 event_i "i", 24, 69.99999999999999, 0.6666666666666666, 1.0, ir7246
krl0 = 2.0
kr0 = krl0
S7256 sprintf "alive_%d", ir7246
 chnset kr0, S7256
ir7259 FreePort 
 event_i "i", 19, 71.33333333333331, 0.6666666666666666, ir7259, ir1
 event_i "i", 24, 71.33333333333331, 0.6666666666666666, 1.0, ir7259
krl0 = 2.0
kr0 = krl0
S7269 sprintf "alive_%d", ir7259
 chnset kr0, S7269
ir7272 FreePort 
 event_i "i", 19, 69.33333333333331, 0.3333333333333333, ir7272, ir1
 event_i "i", 25, 69.33333333333331, 0.3333333333333333, 1.0, ir7272
krl0 = 2.0
kr0 = krl0
S7282 sprintf "alive_%d", ir7272
 chnset kr0, S7282
ir7285 FreePort 
 event_i "i", 21, 70.33333333333331, 0.3333333333333333, ir7285, ir1
 event_i "i", 25, 70.33333333333331, 0.3333333333333333, 1.0, ir7285
krl0 = 2.0
kr0 = krl0
S7295 sprintf "alive_%d", ir7285
 chnset kr0, S7295
ir7298 FreePort 
 event_i "i", 19, 70.99999999999999, 0.3333333333333333, ir7298, ir1
 event_i "i", 25, 70.99999999999999, 0.3333333333333333, 1.0, ir7298
krl0 = 2.0
kr0 = krl0
S7308 sprintf "alive_%d", ir7298
 chnset kr0, S7308
ir7311 FreePort 
 event_i "i", 21, 71.66666666666666, 0.3333333333333333, ir7311, ir1
 event_i "i", 25, 71.66666666666666, 0.3333333333333333, 1.0, ir7311
krl0 = 2.0
kr0 = krl0
S7321 sprintf "alive_%d", ir7311
 chnset kr0, S7321
ir7324 FreePort 
 event_i "i", 19, 71.99999999999999, 0.16666666666666666, ir7324, ir1
 event_i "i", 18, 71.99999999999999, 0.16666666666666666, 1.0, ir7324
krl0 = 2.0
kr0 = krl0
S7334 sprintf "alive_%d", ir7324
 chnset kr0, S7334
ir7337 FreePort 
 event_i "i", 20, 72.16666666666666, 0.16666666666666666, ir7337, ir1
 event_i "i", 18, 72.16666666666666, 0.16666666666666666, 1.0, ir7337
krl0 = 2.0
kr0 = krl0
S7347 sprintf "alive_%d", ir7337
 chnset kr0, S7347
ir7350 FreePort 
 event_i "i", 21, 72.33333333333333, 0.16666666666666666, ir7350, ir1
 event_i "i", 18, 72.33333333333333, 0.16666666666666666, 1.0, ir7350
krl0 = 2.0
kr0 = krl0
S7360 sprintf "alive_%d", ir7350
 chnset kr0, S7360
ir7363 FreePort 
 event_i "i", 21, 72.5, 0.16666666666666666, ir7363, ir1
 event_i "i", 18, 72.5, 0.16666666666666666, 1.0, ir7363
krl0 = 2.0
kr0 = krl0
S7373 sprintf "alive_%d", ir7363
 chnset kr0, S7373
ir7376 FreePort 
 event_i "i", 19, 72.66666666666667, 0.16666666666666666, ir7376, ir1
 event_i "i", 18, 72.66666666666667, 0.16666666666666666, 1.0, ir7376
krl0 = 2.0
kr0 = krl0
S7386 sprintf "alive_%d", ir7376
 chnset kr0, S7386
ir7389 FreePort 
 event_i "i", 20, 72.83333333333334, 0.16666666666666666, ir7389, ir1
 event_i "i", 18, 72.83333333333334, 0.16666666666666666, 1.0, ir7389
krl0 = 2.0
kr0 = krl0
S7399 sprintf "alive_%d", ir7389
 chnset kr0, S7399
ir7402 FreePort 
 event_i "i", 21, 73.00000000000001, 0.16666666666666666, ir7402, ir1
 event_i "i", 18, 73.00000000000001, 0.16666666666666666, 1.0, ir7402
krl0 = 2.0
kr0 = krl0
S7412 sprintf "alive_%d", ir7402
 chnset kr0, S7412
ir7415 FreePort 
 event_i "i", 21, 73.16666666666669, 0.16666666666666666, ir7415, ir1
 event_i "i", 18, 73.16666666666669, 0.16666666666666666, 1.0, ir7415
krl0 = 2.0
kr0 = krl0
S7425 sprintf "alive_%d", ir7415
 chnset kr0, S7425
ir7428 FreePort 
 event_i "i", 19, 73.33333333333336, 0.16666666666666666, ir7428, ir1
 event_i "i", 18, 73.33333333333336, 0.16666666666666666, 1.0, ir7428
krl0 = 2.0
kr0 = krl0
S7438 sprintf "alive_%d", ir7428
 chnset kr0, S7438
ir7441 FreePort 
 event_i "i", 20, 73.50000000000003, 0.16666666666666666, ir7441, ir1
 event_i "i", 18, 73.50000000000003, 0.16666666666666666, 1.0, ir7441
krl0 = 2.0
kr0 = krl0
S7451 sprintf "alive_%d", ir7441
 chnset kr0, S7451
ir7454 FreePort 
 event_i "i", 21, 73.6666666666667, 0.16666666666666666, ir7454, ir1
 event_i "i", 18, 73.6666666666667, 0.16666666666666666, 1.0, ir7454
krl0 = 2.0
kr0 = krl0
S7464 sprintf "alive_%d", ir7454
 chnset kr0, S7464
ir7467 FreePort 
 event_i "i", 21, 73.83333333333337, 0.16666666666666666, ir7467, ir1
 event_i "i", 18, 73.83333333333337, 0.16666666666666666, 1.0, ir7467
krl0 = 2.0
kr0 = krl0
S7477 sprintf "alive_%d", ir7467
 chnset kr0, S7477
ir7480 FreePort 
 event_i "i", 19, 74.00000000000004, 0.16666666666666666, ir7480, ir1
 event_i "i", 18, 74.00000000000004, 0.16666666666666666, 1.0, ir7480
krl0 = 2.0
kr0 = krl0
S7490 sprintf "alive_%d", ir7480
 chnset kr0, S7490
ir7493 FreePort 
 event_i "i", 20, 74.16666666666671, 0.16666666666666666, ir7493, ir1
 event_i "i", 18, 74.16666666666671, 0.16666666666666666, 1.0, ir7493
krl0 = 2.0
kr0 = krl0
S7503 sprintf "alive_%d", ir7493
 chnset kr0, S7503
ir7506 FreePort 
 event_i "i", 21, 74.33333333333339, 0.16666666666666666, ir7506, ir1
 event_i "i", 18, 74.33333333333339, 0.16666666666666666, 1.0, ir7506
krl0 = 2.0
kr0 = krl0
S7516 sprintf "alive_%d", ir7506
 chnset kr0, S7516
ir7519 FreePort 
 event_i "i", 21, 74.50000000000006, 0.16666666666666666, ir7519, ir1
 event_i "i", 18, 74.50000000000006, 0.16666666666666666, 1.0, ir7519
krl0 = 2.0
kr0 = krl0
S7529 sprintf "alive_%d", ir7519
 chnset kr0, S7529
ir7532 FreePort 
 event_i "i", 23, 74.49999999999999, 0.16666666666666666, ir7532, ir1
 event_i "i", 22, 74.49999999999999, 0.16666666666666666, 1.0, ir7532
krl0 = 2.0
kr0 = krl0
S7542 sprintf "alive_%d", ir7532
 chnset kr0, S7542
ir7545 FreePort 
 event_i "i", 19, 72.66666666666666, 0.6666666666666666, ir7545, ir1
 event_i "i", 24, 72.66666666666666, 0.6666666666666666, 1.0, ir7545
krl0 = 2.0
kr0 = krl0
S7555 sprintf "alive_%d", ir7545
 chnset kr0, S7555
ir7558 FreePort 
 event_i "i", 19, 73.99999999999999, 0.6666666666666666, ir7558, ir1
 event_i "i", 24, 73.99999999999999, 0.6666666666666666, 1.0, ir7558
krl0 = 2.0
kr0 = krl0
S7568 sprintf "alive_%d", ir7558
 chnset kr0, S7568
ir7571 FreePort 
 event_i "i", 19, 71.99999999999999, 0.3333333333333333, ir7571, ir1
 event_i "i", 25, 71.99999999999999, 0.3333333333333333, 1.0, ir7571
krl0 = 2.0
kr0 = krl0
S7581 sprintf "alive_%d", ir7571
 chnset kr0, S7581
ir7584 FreePort 
 event_i "i", 21, 72.99999999999999, 0.3333333333333333, ir7584, ir1
 event_i "i", 25, 72.99999999999999, 0.3333333333333333, 1.0, ir7584
krl0 = 2.0
kr0 = krl0
S7594 sprintf "alive_%d", ir7584
 chnset kr0, S7594
ir7597 FreePort 
 event_i "i", 19, 73.66666666666666, 0.3333333333333333, ir7597, ir1
 event_i "i", 25, 73.66666666666666, 0.3333333333333333, 1.0, ir7597
krl0 = 2.0
kr0 = krl0
S7607 sprintf "alive_%d", ir7597
 chnset kr0, S7607
ir7610 FreePort 
 event_i "i", 21, 74.33333333333333, 0.3333333333333333, ir7610, ir1
 event_i "i", 25, 74.33333333333333, 0.3333333333333333, 1.0, ir7610
krl0 = 2.0
kr0 = krl0
S7620 sprintf "alive_%d", ir7610
 chnset kr0, S7620
ir7623 FreePort 
 event_i "i", 19, 74.66666666666666, 0.16666666666666666, ir7623, ir1
 event_i "i", 18, 74.66666666666666, 0.16666666666666666, 1.0, ir7623
krl0 = 2.0
kr0 = krl0
S7633 sprintf "alive_%d", ir7623
 chnset kr0, S7633
ir7636 FreePort 
 event_i "i", 20, 74.83333333333333, 0.16666666666666666, ir7636, ir1
 event_i "i", 18, 74.83333333333333, 0.16666666666666666, 1.0, ir7636
krl0 = 2.0
kr0 = krl0
S7646 sprintf "alive_%d", ir7636
 chnset kr0, S7646
ir7649 FreePort 
 event_i "i", 21, 74.96874999999999, 0.16666666666666666, ir7649, ir1
 event_i "i", 18, 74.96874999999999, 0.16666666666666666, 1.0, ir7649
krl0 = 2.0
kr0 = krl0
S7659 sprintf "alive_%d", ir7649
 chnset kr0, S7659
ir7662 FreePort 
 event_i "i", 21, 75.13541666666666, 0.16666666666666666, ir7662, ir1
 event_i "i", 18, 75.13541666666666, 0.16666666666666666, 1.0, ir7662
krl0 = 2.0
kr0 = krl0
S7672 sprintf "alive_%d", ir7662
 chnset kr0, S7672
ir7675 FreePort 
 event_i "i", 19, 75.33333333333333, 0.16666666666666666, ir7675, ir1
 event_i "i", 18, 75.33333333333333, 0.16666666666666666, 1.0, ir7675
krl0 = 2.0
kr0 = krl0
S7685 sprintf "alive_%d", ir7675
 chnset kr0, S7685
ir7688 FreePort 
 event_i "i", 20, 75.5, 0.16666666666666666, ir7688, ir1
 event_i "i", 18, 75.5, 0.16666666666666666, 1.0, ir7688
krl0 = 2.0
kr0 = krl0
S7698 sprintf "alive_%d", ir7688
 chnset kr0, S7698
ir7701 FreePort 
 event_i "i", 21, 75.63541666666666, 0.16666666666666666, ir7701, ir1
 event_i "i", 18, 75.63541666666666, 0.16666666666666666, 1.0, ir7701
krl0 = 2.0
kr0 = krl0
S7711 sprintf "alive_%d", ir7701
 chnset kr0, S7711
ir7714 FreePort 
 event_i "i", 21, 75.80208333333333, 0.16666666666666666, ir7714, ir1
 event_i "i", 18, 75.80208333333333, 0.16666666666666666, 1.0, ir7714
krl0 = 2.0
kr0 = krl0
S7724 sprintf "alive_%d", ir7714
 chnset kr0, S7724
ir7727 FreePort 
 event_i "i", 19, 76.0, 0.16666666666666666, ir7727, ir1
 event_i "i", 18, 76.0, 0.16666666666666666, 1.0, ir7727
krl0 = 2.0
kr0 = krl0
S7737 sprintf "alive_%d", ir7727
 chnset kr0, S7737
ir7740 FreePort 
 event_i "i", 20, 76.16666666666667, 0.16666666666666666, ir7740, ir1
 event_i "i", 18, 76.16666666666667, 0.16666666666666666, 1.0, ir7740
krl0 = 2.0
kr0 = krl0
S7750 sprintf "alive_%d", ir7740
 chnset kr0, S7750
ir7753 FreePort 
 event_i "i", 21, 76.30208333333333, 0.16666666666666666, ir7753, ir1
 event_i "i", 18, 76.30208333333333, 0.16666666666666666, 1.0, ir7753
krl0 = 2.0
kr0 = krl0
S7763 sprintf "alive_%d", ir7753
 chnset kr0, S7763
ir7766 FreePort 
 event_i "i", 21, 76.46875, 0.16666666666666666, ir7766, ir1
 event_i "i", 18, 76.46875, 0.16666666666666666, 1.0, ir7766
krl0 = 2.0
kr0 = krl0
S7776 sprintf "alive_%d", ir7766
 chnset kr0, S7776
ir7779 FreePort 
 event_i "i", 19, 76.66666666666667, 0.16666666666666666, ir7779, ir1
 event_i "i", 18, 76.66666666666667, 0.16666666666666666, 1.0, ir7779
krl0 = 2.0
kr0 = krl0
S7789 sprintf "alive_%d", ir7779
 chnset kr0, S7789
ir7792 FreePort 
 event_i "i", 20, 76.83333333333334, 0.16666666666666666, ir7792, ir1
 event_i "i", 18, 76.83333333333334, 0.16666666666666666, 1.0, ir7792
krl0 = 2.0
kr0 = krl0
S7802 sprintf "alive_%d", ir7792
 chnset kr0, S7802
ir7805 FreePort 
 event_i "i", 21, 76.96875, 0.16666666666666666, ir7805, ir1
 event_i "i", 18, 76.96875, 0.16666666666666666, 1.0, ir7805
krl0 = 2.0
kr0 = krl0
S7815 sprintf "alive_%d", ir7805
 chnset kr0, S7815
ir7818 FreePort 
 event_i "i", 21, 77.13541666666667, 0.16666666666666666, ir7818, ir1
 event_i "i", 18, 77.13541666666667, 0.16666666666666666, 1.0, ir7818
krl0 = 2.0
kr0 = krl0
S7828 sprintf "alive_%d", ir7818
 chnset kr0, S7828
ir7831 FreePort 
 event_i "i", 23, 77.16666666666666, 0.16666666666666666, ir7831, ir1
 event_i "i", 22, 77.16666666666666, 0.16666666666666666, 1.0, ir7831
krl0 = 2.0
kr0 = krl0
S7841 sprintf "alive_%d", ir7831
 chnset kr0, S7841
ir7844 FreePort 
 event_i "i", 19, 75.34374999999999, 0.6666666666666666, ir7844, ir1
 event_i "i", 24, 75.34374999999999, 0.6666666666666666, 1.0, ir7844
krl0 = 2.0
kr0 = krl0
S7854 sprintf "alive_%d", ir7844
 chnset kr0, S7854
ir7857 FreePort 
 event_i "i", 19, 76.67708333333331, 0.6666666666666666, ir7857, ir1
 event_i "i", 24, 76.67708333333331, 0.6666666666666666, 1.0, ir7857
krl0 = 2.0
kr0 = krl0
S7867 sprintf "alive_%d", ir7857
 chnset kr0, S7867
ir7870 FreePort 
 event_i "i", 19, 74.65624999999999, 0.3333333333333333, ir7870, ir1
 event_i "i", 25, 74.65624999999999, 0.3333333333333333, 1.0, ir7870
krl0 = 2.0
kr0 = krl0
S7880 sprintf "alive_%d", ir7870
 chnset kr0, S7880
ir7883 FreePort 
 event_i "i", 21, 75.65624999999999, 0.3333333333333333, ir7883, ir1
 event_i "i", 25, 75.65624999999999, 0.3333333333333333, 1.0, ir7883
krl0 = 2.0
kr0 = krl0
S7893 sprintf "alive_%d", ir7883
 chnset kr0, S7893
ir7896 FreePort 
 event_i "i", 19, 76.32291666666666, 0.3333333333333333, ir7896, ir1
 event_i "i", 25, 76.32291666666666, 0.3333333333333333, 1.0, ir7896
krl0 = 2.0
kr0 = krl0
S7906 sprintf "alive_%d", ir7896
 chnset kr0, S7906
ir7909 FreePort 
 event_i "i", 21, 76.98958333333333, 0.3333333333333333, ir7909, ir1
 event_i "i", 25, 76.98958333333333, 0.3333333333333333, 1.0, ir7909
krl0 = 2.0
kr0 = krl0
S7919 sprintf "alive_%d", ir7909
 chnset kr0, S7919
ir7922 FreePort 
 event_i "i", 19, 77.33333333333333, 0.16666666666666666, ir7922, ir1
 event_i "i", 18, 77.33333333333333, 0.16666666666666666, 1.0, ir7922
krl0 = 2.0
kr0 = krl0
S7932 sprintf "alive_%d", ir7922
 chnset kr0, S7932
ir7935 FreePort 
 event_i "i", 20, 77.5, 0.16666666666666666, ir7935, ir1
 event_i "i", 18, 77.5, 0.16666666666666666, 1.0, ir7935
krl0 = 2.0
kr0 = krl0
S7945 sprintf "alive_%d", ir7935
 chnset kr0, S7945
ir7948 FreePort 
 event_i "i", 21, 77.63541666666666, 0.16666666666666666, ir7948, ir1
 event_i "i", 18, 77.63541666666666, 0.16666666666666666, 1.0, ir7948
krl0 = 2.0
kr0 = krl0
S7958 sprintf "alive_%d", ir7948
 chnset kr0, S7958
ir7961 FreePort 
 event_i "i", 21, 77.80208333333333, 0.16666666666666666, ir7961, ir1
 event_i "i", 18, 77.80208333333333, 0.16666666666666666, 1.0, ir7961
krl0 = 2.0
kr0 = krl0
S7971 sprintf "alive_%d", ir7961
 chnset kr0, S7971
ir7974 FreePort 
 event_i "i", 19, 78.0, 0.16666666666666666, ir7974, ir1
 event_i "i", 18, 78.0, 0.16666666666666666, 1.0, ir7974
krl0 = 2.0
kr0 = krl0
S7984 sprintf "alive_%d", ir7974
 chnset kr0, S7984
ir7987 FreePort 
 event_i "i", 20, 78.16666666666667, 0.16666666666666666, ir7987, ir1
 event_i "i", 18, 78.16666666666667, 0.16666666666666666, 1.0, ir7987
krl0 = 2.0
kr0 = krl0
S7997 sprintf "alive_%d", ir7987
 chnset kr0, S7997
ir8000 FreePort 
 event_i "i", 21, 78.30208333333333, 0.16666666666666666, ir8000, ir1
 event_i "i", 18, 78.30208333333333, 0.16666666666666666, 1.0, ir8000
krl0 = 2.0
kr0 = krl0
S8010 sprintf "alive_%d", ir8000
 chnset kr0, S8010
ir8013 FreePort 
 event_i "i", 21, 78.46875, 0.16666666666666666, ir8013, ir1
 event_i "i", 18, 78.46875, 0.16666666666666666, 1.0, ir8013
krl0 = 2.0
kr0 = krl0
S8023 sprintf "alive_%d", ir8013
 chnset kr0, S8023
ir8026 FreePort 
 event_i "i", 19, 78.66666666666667, 0.16666666666666666, ir8026, ir1
 event_i "i", 18, 78.66666666666667, 0.16666666666666666, 1.0, ir8026
krl0 = 2.0
kr0 = krl0
S8036 sprintf "alive_%d", ir8026
 chnset kr0, S8036
ir8039 FreePort 
 event_i "i", 20, 78.83333333333334, 0.16666666666666666, ir8039, ir1
 event_i "i", 18, 78.83333333333334, 0.16666666666666666, 1.0, ir8039
krl0 = 2.0
kr0 = krl0
S8049 sprintf "alive_%d", ir8039
 chnset kr0, S8049
ir8052 FreePort 
 event_i "i", 21, 78.96875, 0.16666666666666666, ir8052, ir1
 event_i "i", 18, 78.96875, 0.16666666666666666, 1.0, ir8052
krl0 = 2.0
kr0 = krl0
S8062 sprintf "alive_%d", ir8052
 chnset kr0, S8062
ir8065 FreePort 
 event_i "i", 21, 79.13541666666667, 0.16666666666666666, ir8065, ir1
 event_i "i", 18, 79.13541666666667, 0.16666666666666666, 1.0, ir8065
krl0 = 2.0
kr0 = krl0
S8075 sprintf "alive_%d", ir8065
 chnset kr0, S8075
ir8078 FreePort 
 event_i "i", 19, 79.33333333333334, 0.16666666666666666, ir8078, ir1
 event_i "i", 18, 79.33333333333334, 0.16666666666666666, 1.0, ir8078
krl0 = 2.0
kr0 = krl0
S8088 sprintf "alive_%d", ir8078
 chnset kr0, S8088
ir8091 FreePort 
 event_i "i", 20, 79.50000000000001, 0.16666666666666666, ir8091, ir1
 event_i "i", 18, 79.50000000000001, 0.16666666666666666, 1.0, ir8091
krl0 = 2.0
kr0 = krl0
S8101 sprintf "alive_%d", ir8091
 chnset kr0, S8101
ir8104 FreePort 
 event_i "i", 21, 79.63541666666667, 0.16666666666666666, ir8104, ir1
 event_i "i", 18, 79.63541666666667, 0.16666666666666666, 1.0, ir8104
krl0 = 2.0
kr0 = krl0
S8114 sprintf "alive_%d", ir8104
 chnset kr0, S8114
ir8117 FreePort 
 event_i "i", 21, 79.80208333333334, 0.16666666666666666, ir8117, ir1
 event_i "i", 18, 79.80208333333334, 0.16666666666666666, 1.0, ir8117
krl0 = 2.0
kr0 = krl0
S8127 sprintf "alive_%d", ir8117
 chnset kr0, S8127
ir8130 FreePort 
 event_i "i", 23, 79.83333333333333, 0.16666666666666666, ir8130, ir1
 event_i "i", 22, 79.83333333333333, 0.16666666666666666, 1.0, ir8130
krl0 = 2.0
kr0 = krl0
S8140 sprintf "alive_%d", ir8130
 chnset kr0, S8140
ir8143 FreePort 
 event_i "i", 19, 78.01041666666666, 0.6666666666666666, ir8143, ir1
 event_i "i", 24, 78.01041666666666, 0.6666666666666666, 1.0, ir8143
krl0 = 2.0
kr0 = krl0
S8153 sprintf "alive_%d", ir8143
 chnset kr0, S8153
ir8156 FreePort 
 event_i "i", 19, 79.34374999999999, 0.6666666666666666, ir8156, ir1
 event_i "i", 24, 79.34374999999999, 0.6666666666666666, 1.0, ir8156
krl0 = 2.0
kr0 = krl0
S8166 sprintf "alive_%d", ir8156
 chnset kr0, S8166
ir8169 FreePort 
 event_i "i", 19, 77.32291666666666, 0.3333333333333333, ir8169, ir1
 event_i "i", 25, 77.32291666666666, 0.3333333333333333, 1.0, ir8169
krl0 = 2.0
kr0 = krl0
S8179 sprintf "alive_%d", ir8169
 chnset kr0, S8179
ir8182 FreePort 
 event_i "i", 21, 78.32291666666666, 0.3333333333333333, ir8182, ir1
 event_i "i", 25, 78.32291666666666, 0.3333333333333333, 1.0, ir8182
krl0 = 2.0
kr0 = krl0
S8192 sprintf "alive_%d", ir8182
 chnset kr0, S8192
ir8195 FreePort 
 event_i "i", 19, 78.98958333333333, 0.3333333333333333, ir8195, ir1
 event_i "i", 25, 78.98958333333333, 0.3333333333333333, 1.0, ir8195
krl0 = 2.0
kr0 = krl0
S8205 sprintf "alive_%d", ir8195
 chnset kr0, S8205
ir8208 FreePort 
 event_i "i", 21, 79.65625, 0.3333333333333333, ir8208, ir1
 event_i "i", 25, 79.65625, 0.3333333333333333, 1.0, ir8208
krl0 = 2.0
kr0 = krl0
S8218 sprintf "alive_%d", ir8208
 chnset kr0, S8218
ir8221 FreePort 
 event_i "i", 19, 79.99999999999999, 0.19999999999999998, ir8221, ir1
 event_i "i", 18, 79.99999999999999, 0.19999999999999998, 1.0, ir8221
krl0 = 2.0
kr0 = krl0
S8231 sprintf "alive_%d", ir8221
 chnset kr0, S8231
ir8234 FreePort 
 event_i "i", 21, 80.19999999999999, 0.13333333333333333, ir8234, ir1
 event_i "i", 18, 80.19999999999999, 0.13333333333333333, 1.0, ir8234
krl0 = 2.0
kr0 = krl0
S8244 sprintf "alive_%d", ir8234
 chnset kr0, S8244
ir8247 FreePort 
 event_i "i", 19, 80.33333333333331, 0.19999999999999998, ir8247, ir1
 event_i "i", 18, 80.33333333333331, 0.19999999999999998, 1.0, ir8247
krl0 = 2.0
kr0 = krl0
S8257 sprintf "alive_%d", ir8247
 chnset kr0, S8257
ir8260 FreePort 
 event_i "i", 21, 80.53333333333332, 0.13333333333333333, ir8260, ir1
 event_i "i", 18, 80.53333333333332, 0.13333333333333333, 1.0, ir8260
krl0 = 2.0
kr0 = krl0
S8270 sprintf "alive_%d", ir8260
 chnset kr0, S8270
ir8273 FreePort 
 event_i "i", 19, 80.66666666666664, 0.19999999999999998, ir8273, ir1
 event_i "i", 18, 80.66666666666664, 0.19999999999999998, 1.0, ir8273
krl0 = 2.0
kr0 = krl0
S8283 sprintf "alive_%d", ir8273
 chnset kr0, S8283
ir8286 FreePort 
 event_i "i", 21, 80.86666666666665, 0.13333333333333333, ir8286, ir1
 event_i "i", 18, 80.86666666666665, 0.13333333333333333, 1.0, ir8286
krl0 = 2.0
kr0 = krl0
S8296 sprintf "alive_%d", ir8286
 chnset kr0, S8296
ir8299 FreePort 
 event_i "i", 19, 80.99999999999997, 0.19999999999999998, ir8299, ir1
 event_i "i", 18, 80.99999999999997, 0.19999999999999998, 1.0, ir8299
krl0 = 2.0
kr0 = krl0
S8309 sprintf "alive_%d", ir8299
 chnset kr0, S8309
ir8312 FreePort 
 event_i "i", 21, 81.19999999999997, 0.13333333333333333, ir8312, ir1
 event_i "i", 18, 81.19999999999997, 0.13333333333333333, 1.0, ir8312
krl0 = 2.0
kr0 = krl0
S8322 sprintf "alive_%d", ir8312
 chnset kr0, S8322
ir8325 FreePort 
 event_i "i", 19, 81.3333333333333, 0.19999999999999998, ir8325, ir1
 event_i "i", 18, 81.3333333333333, 0.19999999999999998, 1.0, ir8325
krl0 = 2.0
kr0 = krl0
S8335 sprintf "alive_%d", ir8325
 chnset kr0, S8335
ir8338 FreePort 
 event_i "i", 21, 81.5333333333333, 0.13333333333333333, ir8338, ir1
 event_i "i", 18, 81.5333333333333, 0.13333333333333333, 1.0, ir8338
krl0 = 2.0
kr0 = krl0
S8348 sprintf "alive_%d", ir8338
 chnset kr0, S8348
ir8351 FreePort 
 event_i "i", 19, 81.66666666666663, 0.19999999999999998, ir8351, ir1
 event_i "i", 18, 81.66666666666663, 0.19999999999999998, 1.0, ir8351
krl0 = 2.0
kr0 = krl0
S8361 sprintf "alive_%d", ir8351
 chnset kr0, S8361
ir8364 FreePort 
 event_i "i", 21, 81.86666666666663, 0.13333333333333333, ir8364, ir1
 event_i "i", 18, 81.86666666666663, 0.13333333333333333, 1.0, ir8364
krl0 = 2.0
kr0 = krl0
S8374 sprintf "alive_%d", ir8364
 chnset kr0, S8374
ir8377 FreePort 
 event_i "i", 19, 81.99999999999996, 0.19999999999999998, ir8377, ir1
 event_i "i", 18, 81.99999999999996, 0.19999999999999998, 1.0, ir8377
krl0 = 2.0
kr0 = krl0
S8387 sprintf "alive_%d", ir8377
 chnset kr0, S8387
ir8390 FreePort 
 event_i "i", 21, 82.19999999999996, 0.13333333333333333, ir8390, ir1
 event_i "i", 18, 82.19999999999996, 0.13333333333333333, 1.0, ir8390
krl0 = 2.0
kr0 = krl0
S8400 sprintf "alive_%d", ir8390
 chnset kr0, S8400
ir8403 FreePort 
 event_i "i", 19, 82.33333333333329, 0.19999999999999998, ir8403, ir1
 event_i "i", 18, 82.33333333333329, 0.19999999999999998, 1.0, ir8403
krl0 = 2.0
kr0 = krl0
S8413 sprintf "alive_%d", ir8403
 chnset kr0, S8413
ir8416 FreePort 
 event_i "i", 21, 82.53333333333329, 0.13333333333333333, ir8416, ir1
 event_i "i", 18, 82.53333333333329, 0.13333333333333333, 1.0, ir8416
krl0 = 2.0
kr0 = krl0
S8426 sprintf "alive_%d", ir8416
 chnset kr0, S8426
ir8429 FreePort 
 event_i "i", 23, 82.49999999999999, 0.16666666666666666, ir8429, ir1
 event_i "i", 22, 82.49999999999999, 0.16666666666666666, 1.0, ir8429
krl0 = 2.0
kr0 = krl0
S8439 sprintf "alive_%d", ir8429
 chnset kr0, S8439
ir8442 FreePort 
 event_i "i", 19, 80.66666666666666, 0.6666666666666666, ir8442, ir1
 event_i "i", 24, 80.66666666666666, 0.6666666666666666, 1.0, ir8442
krl0 = 2.0
kr0 = krl0
S8452 sprintf "alive_%d", ir8442
 chnset kr0, S8452
ir8455 FreePort 
 event_i "i", 19, 81.99999999999999, 0.6666666666666666, ir8455, ir1
 event_i "i", 24, 81.99999999999999, 0.6666666666666666, 1.0, ir8455
krl0 = 2.0
kr0 = krl0
S8465 sprintf "alive_%d", ir8455
 chnset kr0, S8465
ir8468 FreePort 
 event_i "i", 19, 79.99999999999999, 0.3333333333333333, ir8468, ir1
 event_i "i", 25, 79.99999999999999, 0.3333333333333333, 1.0, ir8468
krl0 = 2.0
kr0 = krl0
S8478 sprintf "alive_%d", ir8468
 chnset kr0, S8478
ir8481 FreePort 
 event_i "i", 21, 80.99999999999999, 0.3333333333333333, ir8481, ir1
 event_i "i", 25, 80.99999999999999, 0.3333333333333333, 1.0, ir8481
krl0 = 2.0
kr0 = krl0
S8491 sprintf "alive_%d", ir8481
 chnset kr0, S8491
ir8494 FreePort 
 event_i "i", 19, 81.66666666666666, 0.3333333333333333, ir8494, ir1
 event_i "i", 25, 81.66666666666666, 0.3333333333333333, 1.0, ir8494
krl0 = 2.0
kr0 = krl0
S8504 sprintf "alive_%d", ir8494
 chnset kr0, S8504
ir8507 FreePort 
 event_i "i", 21, 82.33333333333333, 0.3333333333333333, ir8507, ir1
 event_i "i", 25, 82.33333333333333, 0.3333333333333333, 1.0, ir8507
krl0 = 2.0
kr0 = krl0
S8517 sprintf "alive_%d", ir8507
 chnset kr0, S8517
ir8520 FreePort 
 event_i "i", 19, 82.66666666666666, 0.19999999999999998, ir8520, ir1
 event_i "i", 18, 82.66666666666666, 0.19999999999999998, 1.0, ir8520
krl0 = 2.0
kr0 = krl0
S8530 sprintf "alive_%d", ir8520
 chnset kr0, S8530
ir8533 FreePort 
 event_i "i", 21, 82.86666666666666, 0.13333333333333333, ir8533, ir1
 event_i "i", 18, 82.86666666666666, 0.13333333333333333, 1.0, ir8533
krl0 = 2.0
kr0 = krl0
S8543 sprintf "alive_%d", ir8533
 chnset kr0, S8543
ir8546 FreePort 
 event_i "i", 19, 82.99999999999999, 0.19999999999999998, ir8546, ir1
 event_i "i", 18, 82.99999999999999, 0.19999999999999998, 1.0, ir8546
krl0 = 2.0
kr0 = krl0
S8556 sprintf "alive_%d", ir8546
 chnset kr0, S8556
ir8559 FreePort 
 event_i "i", 21, 83.19999999999999, 0.13333333333333333, ir8559, ir1
 event_i "i", 18, 83.19999999999999, 0.13333333333333333, 1.0, ir8559
krl0 = 2.0
kr0 = krl0
S8569 sprintf "alive_%d", ir8559
 chnset kr0, S8569
ir8572 FreePort 
 event_i "i", 19, 83.33333333333331, 0.19999999999999998, ir8572, ir1
 event_i "i", 18, 83.33333333333331, 0.19999999999999998, 1.0, ir8572
krl0 = 2.0
kr0 = krl0
S8582 sprintf "alive_%d", ir8572
 chnset kr0, S8582
ir8585 FreePort 
 event_i "i", 21, 83.53333333333332, 0.13333333333333333, ir8585, ir1
 event_i "i", 18, 83.53333333333332, 0.13333333333333333, 1.0, ir8585
krl0 = 2.0
kr0 = krl0
S8595 sprintf "alive_%d", ir8585
 chnset kr0, S8595
ir8598 FreePort 
 event_i "i", 19, 83.66666666666664, 0.19999999999999998, ir8598, ir1
 event_i "i", 18, 83.66666666666664, 0.19999999999999998, 1.0, ir8598
krl0 = 2.0
kr0 = krl0
S8608 sprintf "alive_%d", ir8598
 chnset kr0, S8608
ir8611 FreePort 
 event_i "i", 21, 83.86666666666665, 0.13333333333333333, ir8611, ir1
 event_i "i", 18, 83.86666666666665, 0.13333333333333333, 1.0, ir8611
krl0 = 2.0
kr0 = krl0
S8621 sprintf "alive_%d", ir8611
 chnset kr0, S8621
ir8624 FreePort 
 event_i "i", 19, 83.99999999999997, 0.19999999999999998, ir8624, ir1
 event_i "i", 18, 83.99999999999997, 0.19999999999999998, 1.0, ir8624
krl0 = 2.0
kr0 = krl0
S8634 sprintf "alive_%d", ir8624
 chnset kr0, S8634
ir8637 FreePort 
 event_i "i", 21, 84.19999999999997, 0.13333333333333333, ir8637, ir1
 event_i "i", 18, 84.19999999999997, 0.13333333333333333, 1.0, ir8637
krl0 = 2.0
kr0 = krl0
S8647 sprintf "alive_%d", ir8637
 chnset kr0, S8647
ir8650 FreePort 
 event_i "i", 19, 84.3333333333333, 0.19999999999999998, ir8650, ir1
 event_i "i", 18, 84.3333333333333, 0.19999999999999998, 1.0, ir8650
krl0 = 2.0
kr0 = krl0
S8660 sprintf "alive_%d", ir8650
 chnset kr0, S8660
ir8663 FreePort 
 event_i "i", 21, 84.5333333333333, 0.13333333333333333, ir8663, ir1
 event_i "i", 18, 84.5333333333333, 0.13333333333333333, 1.0, ir8663
krl0 = 2.0
kr0 = krl0
S8673 sprintf "alive_%d", ir8663
 chnset kr0, S8673
ir8676 FreePort 
 event_i "i", 19, 84.66666666666663, 0.19999999999999998, ir8676, ir1
 event_i "i", 18, 84.66666666666663, 0.19999999999999998, 1.0, ir8676
krl0 = 2.0
kr0 = krl0
S8686 sprintf "alive_%d", ir8676
 chnset kr0, S8686
ir8689 FreePort 
 event_i "i", 21, 84.86666666666663, 0.13333333333333333, ir8689, ir1
 event_i "i", 18, 84.86666666666663, 0.13333333333333333, 1.0, ir8689
krl0 = 2.0
kr0 = krl0
S8699 sprintf "alive_%d", ir8689
 chnset kr0, S8699
ir8702 FreePort 
 event_i "i", 19, 84.99999999999996, 0.19999999999999998, ir8702, ir1
 event_i "i", 18, 84.99999999999996, 0.19999999999999998, 1.0, ir8702
krl0 = 2.0
kr0 = krl0
S8712 sprintf "alive_%d", ir8702
 chnset kr0, S8712
ir8715 FreePort 
 event_i "i", 21, 85.19999999999996, 0.13333333333333333, ir8715, ir1
 event_i "i", 18, 85.19999999999996, 0.13333333333333333, 1.0, ir8715
krl0 = 2.0
kr0 = krl0
S8725 sprintf "alive_%d", ir8715
 chnset kr0, S8725
ir8728 FreePort 
 event_i "i", 23, 85.16666666666666, 0.16666666666666666, ir8728, ir1
 event_i "i", 22, 85.16666666666666, 0.16666666666666666, 1.0, ir8728
krl0 = 2.0
kr0 = krl0
S8738 sprintf "alive_%d", ir8728
 chnset kr0, S8738
ir8741 FreePort 
 event_i "i", 19, 83.33333333333333, 0.6666666666666666, ir8741, ir1
 event_i "i", 24, 83.33333333333333, 0.6666666666666666, 1.0, ir8741
krl0 = 2.0
kr0 = krl0
S8751 sprintf "alive_%d", ir8741
 chnset kr0, S8751
ir8754 FreePort 
 event_i "i", 19, 84.66666666666666, 0.6666666666666666, ir8754, ir1
 event_i "i", 24, 84.66666666666666, 0.6666666666666666, 1.0, ir8754
krl0 = 2.0
kr0 = krl0
S8764 sprintf "alive_%d", ir8754
 chnset kr0, S8764
ir8767 FreePort 
 event_i "i", 19, 82.66666666666666, 0.3333333333333333, ir8767, ir1
 event_i "i", 25, 82.66666666666666, 0.3333333333333333, 1.0, ir8767
krl0 = 2.0
kr0 = krl0
S8777 sprintf "alive_%d", ir8767
 chnset kr0, S8777
ir8780 FreePort 
 event_i "i", 21, 83.66666666666666, 0.3333333333333333, ir8780, ir1
 event_i "i", 25, 83.66666666666666, 0.3333333333333333, 1.0, ir8780
krl0 = 2.0
kr0 = krl0
S8790 sprintf "alive_%d", ir8780
 chnset kr0, S8790
ir8793 FreePort 
 event_i "i", 19, 84.33333333333333, 0.3333333333333333, ir8793, ir1
 event_i "i", 25, 84.33333333333333, 0.3333333333333333, 1.0, ir8793
krl0 = 2.0
kr0 = krl0
S8803 sprintf "alive_%d", ir8793
 chnset kr0, S8803
ir8806 FreePort 
 event_i "i", 21, 85.0, 0.3333333333333333, ir8806, ir1
 event_i "i", 25, 85.0, 0.3333333333333333, 1.0, ir8806
krl0 = 2.0
kr0 = krl0
S8816 sprintf "alive_%d", ir8806
 chnset kr0, S8816
ir8819 FreePort 
 event_i "i", 19, 85.33333333333331, 0.26666666666666666, ir8819, ir1
 event_i "i", 18, 85.33333333333331, 0.26666666666666666, 1.0, ir8819
krl0 = 2.0
kr0 = krl0
S8829 sprintf "alive_%d", ir8819
 chnset kr0, S8829
ir8832 FreePort 
 event_i "i", 21, 85.59999999999998, 0.17777777777777776, ir8832, ir1
 event_i "i", 18, 85.59999999999998, 0.17777777777777776, 1.0, ir8832
krl0 = 2.0
kr0 = krl0
S8842 sprintf "alive_%d", ir8832
 chnset kr0, S8842
ir8845 FreePort 
 event_i "i", 19, 85.77777777777776, 0.26666666666666666, ir8845, ir1
 event_i "i", 18, 85.77777777777776, 0.26666666666666666, 1.0, ir8845
krl0 = 2.0
kr0 = krl0
S8855 sprintf "alive_%d", ir8845
 chnset kr0, S8855
ir8858 FreePort 
 event_i "i", 21, 86.04444444444442, 0.17777777777777776, ir8858, ir1
 event_i "i", 18, 86.04444444444442, 0.17777777777777776, 1.0, ir8858
krl0 = 2.0
kr0 = krl0
S8868 sprintf "alive_%d", ir8858
 chnset kr0, S8868
ir8871 FreePort 
 event_i "i", 19, 86.2222222222222, 0.26666666666666666, ir8871, ir1
 event_i "i", 18, 86.2222222222222, 0.26666666666666666, 1.0, ir8871
krl0 = 2.0
kr0 = krl0
S8881 sprintf "alive_%d", ir8871
 chnset kr0, S8881
ir8884 FreePort 
 event_i "i", 21, 86.48888888888887, 0.17777777777777776, ir8884, ir1
 event_i "i", 18, 86.48888888888887, 0.17777777777777776, 1.0, ir8884
krl0 = 2.0
kr0 = krl0
S8894 sprintf "alive_%d", ir8884
 chnset kr0, S8894
ir8897 FreePort 
 event_i "i", 19, 86.66666666666664, 0.26666666666666666, ir8897, ir1
 event_i "i", 18, 86.66666666666664, 0.26666666666666666, 1.0, ir8897
krl0 = 2.0
kr0 = krl0
S8907 sprintf "alive_%d", ir8897
 chnset kr0, S8907
ir8910 FreePort 
 event_i "i", 21, 86.93333333333331, 0.17777777777777776, ir8910, ir1
 event_i "i", 18, 86.93333333333331, 0.17777777777777776, 1.0, ir8910
krl0 = 2.0
kr0 = krl0
S8920 sprintf "alive_%d", ir8910
 chnset kr0, S8920
ir8923 FreePort 
 event_i "i", 19, 87.11111111111109, 0.26666666666666666, ir8923, ir1
 event_i "i", 18, 87.11111111111109, 0.26666666666666666, 1.0, ir8923
krl0 = 2.0
kr0 = krl0
S8933 sprintf "alive_%d", ir8923
 chnset kr0, S8933
ir8936 FreePort 
 event_i "i", 21, 87.37777777777775, 0.17777777777777776, ir8936, ir1
 event_i "i", 18, 87.37777777777775, 0.17777777777777776, 1.0, ir8936
krl0 = 2.0
kr0 = krl0
S8946 sprintf "alive_%d", ir8936
 chnset kr0, S8946
ir8949 FreePort 
 event_i "i", 19, 87.55555555555553, 0.26666666666666666, ir8949, ir1
 event_i "i", 18, 87.55555555555553, 0.26666666666666666, 1.0, ir8949
krl0 = 2.0
kr0 = krl0
S8959 sprintf "alive_%d", ir8949
 chnset kr0, S8959
ir8962 FreePort 
 event_i "i", 21, 87.8222222222222, 0.17777777777777776, ir8962, ir1
 event_i "i", 18, 87.8222222222222, 0.17777777777777776, 1.0, ir8962
krl0 = 2.0
kr0 = krl0
S8972 sprintf "alive_%d", ir8962
 chnset kr0, S8972
ir8975 FreePort 
 event_i "i", 19, 87.99999999999997, 0.26666666666666666, ir8975, ir1
 event_i "i", 18, 87.99999999999997, 0.26666666666666666, 1.0, ir8975
krl0 = 2.0
kr0 = krl0
S8985 sprintf "alive_%d", ir8975
 chnset kr0, S8985
ir8988 FreePort 
 event_i "i", 21, 88.26666666666664, 0.17777777777777776, ir8988, ir1
 event_i "i", 18, 88.26666666666664, 0.17777777777777776, 1.0, ir8988
krl0 = 2.0
kr0 = krl0
S8998 sprintf "alive_%d", ir8988
 chnset kr0, S8998
ir9001 FreePort 
 event_i "i", 19, 88.44444444444441, 0.26666666666666666, ir9001, ir1
 event_i "i", 18, 88.44444444444441, 0.26666666666666666, 1.0, ir9001
krl0 = 2.0
kr0 = krl0
S9011 sprintf "alive_%d", ir9001
 chnset kr0, S9011
ir9014 FreePort 
 event_i "i", 21, 88.71111111111108, 0.17777777777777776, ir9014, ir1
 event_i "i", 18, 88.71111111111108, 0.17777777777777776, 1.0, ir9014
krl0 = 2.0
kr0 = krl0
S9024 sprintf "alive_%d", ir9014
 chnset kr0, S9024
ir9027 FreePort 
 event_i "i", 23, 88.66666666666664, 0.2222222222222222, ir9027, ir1
 event_i "i", 22, 88.66666666666664, 0.2222222222222222, 1.0, ir9027
krl0 = 2.0
kr0 = krl0
S9037 sprintf "alive_%d", ir9027
 chnset kr0, S9037
ir9040 FreePort 
 event_i "i", 19, 86.2222222222222, 0.8888888888888888, ir9040, ir1
 event_i "i", 24, 86.2222222222222, 0.8888888888888888, 1.0, ir9040
krl0 = 2.0
kr0 = krl0
S9050 sprintf "alive_%d", ir9040
 chnset kr0, S9050
ir9053 FreePort 
 event_i "i", 19, 87.99999999999997, 0.8888888888888888, ir9053, ir1
 event_i "i", 24, 87.99999999999997, 0.8888888888888888, 1.0, ir9053
krl0 = 2.0
kr0 = krl0
S9063 sprintf "alive_%d", ir9053
 chnset kr0, S9063
ir9066 FreePort 
 event_i "i", 19, 85.33333333333331, 0.4444444444444444, ir9066, ir1
 event_i "i", 25, 85.33333333333331, 0.4444444444444444, 1.0, ir9066
krl0 = 2.0
kr0 = krl0
S9076 sprintf "alive_%d", ir9066
 chnset kr0, S9076
ir9079 FreePort 
 event_i "i", 19, 87.55555555555554, 0.4444444444444444, ir9079, ir1
 event_i "i", 25, 87.55555555555554, 0.4444444444444444, 1.0, ir9079
krl0 = 2.0
kr0 = krl0
S9089 sprintf "alive_%d", ir9079
 chnset kr0, S9089
ir9092 FreePort 
 event_i "i", 19, 88.88888888888887, 0.26666666666666666, ir9092, ir1
 event_i "i", 18, 88.88888888888887, 0.26666666666666666, 1.0, ir9092
krl0 = 2.0
kr0 = krl0
S9102 sprintf "alive_%d", ir9092
 chnset kr0, S9102
ir9105 FreePort 
 event_i "i", 21, 89.15555555555554, 0.17777777777777776, ir9105, ir1
 event_i "i", 18, 89.15555555555554, 0.17777777777777776, 1.0, ir9105
krl0 = 2.0
kr0 = krl0
S9115 sprintf "alive_%d", ir9105
 chnset kr0, S9115
ir9118 FreePort 
 event_i "i", 19, 89.33333333333331, 0.26666666666666666, ir9118, ir1
 event_i "i", 18, 89.33333333333331, 0.26666666666666666, 1.0, ir9118
krl0 = 2.0
kr0 = krl0
S9128 sprintf "alive_%d", ir9118
 chnset kr0, S9128
ir9131 FreePort 
 event_i "i", 21, 89.59999999999998, 0.17777777777777776, ir9131, ir1
 event_i "i", 18, 89.59999999999998, 0.17777777777777776, 1.0, ir9131
krl0 = 2.0
kr0 = krl0
S9141 sprintf "alive_%d", ir9131
 chnset kr0, S9141
ir9144 FreePort 
 event_i "i", 19, 89.77777777777776, 0.26666666666666666, ir9144, ir1
 event_i "i", 18, 89.77777777777776, 0.26666666666666666, 1.0, ir9144
krl0 = 2.0
kr0 = krl0
S9154 sprintf "alive_%d", ir9144
 chnset kr0, S9154
ir9157 FreePort 
 event_i "i", 21, 90.04444444444442, 0.17777777777777776, ir9157, ir1
 event_i "i", 18, 90.04444444444442, 0.17777777777777776, 1.0, ir9157
krl0 = 2.0
kr0 = krl0
S9167 sprintf "alive_%d", ir9157
 chnset kr0, S9167
ir9170 FreePort 
 event_i "i", 19, 90.2222222222222, 0.26666666666666666, ir9170, ir1
 event_i "i", 18, 90.2222222222222, 0.26666666666666666, 1.0, ir9170
krl0 = 2.0
kr0 = krl0
S9180 sprintf "alive_%d", ir9170
 chnset kr0, S9180
ir9183 FreePort 
 event_i "i", 21, 90.48888888888887, 0.17777777777777776, ir9183, ir1
 event_i "i", 18, 90.48888888888887, 0.17777777777777776, 1.0, ir9183
krl0 = 2.0
kr0 = krl0
S9193 sprintf "alive_%d", ir9183
 chnset kr0, S9193
ir9196 FreePort 
 event_i "i", 19, 90.66666666666664, 0.26666666666666666, ir9196, ir1
 event_i "i", 18, 90.66666666666664, 0.26666666666666666, 1.0, ir9196
krl0 = 2.0
kr0 = krl0
S9206 sprintf "alive_%d", ir9196
 chnset kr0, S9206
ir9209 FreePort 
 event_i "i", 21, 90.93333333333331, 0.17777777777777776, ir9209, ir1
 event_i "i", 18, 90.93333333333331, 0.17777777777777776, 1.0, ir9209
krl0 = 2.0
kr0 = krl0
S9219 sprintf "alive_%d", ir9209
 chnset kr0, S9219
ir9222 FreePort 
 event_i "i", 19, 91.11111111111109, 0.26666666666666666, ir9222, ir1
 event_i "i", 18, 91.11111111111109, 0.26666666666666666, 1.0, ir9222
krl0 = 2.0
kr0 = krl0
S9232 sprintf "alive_%d", ir9222
 chnset kr0, S9232
ir9235 FreePort 
 event_i "i", 21, 91.37777777777775, 0.17777777777777776, ir9235, ir1
 event_i "i", 18, 91.37777777777775, 0.17777777777777776, 1.0, ir9235
krl0 = 2.0
kr0 = krl0
S9245 sprintf "alive_%d", ir9235
 chnset kr0, S9245
ir9248 FreePort 
 event_i "i", 19, 91.55555555555553, 0.26666666666666666, ir9248, ir1
 event_i "i", 18, 91.55555555555553, 0.26666666666666666, 1.0, ir9248
krl0 = 2.0
kr0 = krl0
S9258 sprintf "alive_%d", ir9248
 chnset kr0, S9258
ir9261 FreePort 
 event_i "i", 21, 91.8222222222222, 0.17777777777777776, ir9261, ir1
 event_i "i", 18, 91.8222222222222, 0.17777777777777776, 1.0, ir9261
krl0 = 2.0
kr0 = krl0
S9271 sprintf "alive_%d", ir9261
 chnset kr0, S9271
ir9274 FreePort 
 event_i "i", 19, 91.99999999999997, 0.26666666666666666, ir9274, ir1
 event_i "i", 18, 91.99999999999997, 0.26666666666666666, 1.0, ir9274
krl0 = 2.0
kr0 = krl0
S9284 sprintf "alive_%d", ir9274
 chnset kr0, S9284
ir9287 FreePort 
 event_i "i", 21, 92.26666666666664, 0.17777777777777776, ir9287, ir1
 event_i "i", 18, 92.26666666666664, 0.17777777777777776, 1.0, ir9287
krl0 = 2.0
kr0 = krl0
S9297 sprintf "alive_%d", ir9287
 chnset kr0, S9297
ir9300 FreePort 
 event_i "i", 23, 92.2222222222222, 0.2222222222222222, ir9300, ir1
 event_i "i", 22, 92.2222222222222, 0.2222222222222222, 1.0, ir9300
krl0 = 2.0
kr0 = krl0
S9310 sprintf "alive_%d", ir9300
 chnset kr0, S9310
ir9313 FreePort 
 event_i "i", 19, 89.77777777777776, 0.8888888888888888, ir9313, ir1
 event_i "i", 24, 89.77777777777776, 0.8888888888888888, 1.0, ir9313
krl0 = 2.0
kr0 = krl0
S9323 sprintf "alive_%d", ir9313
 chnset kr0, S9323
ir9326 FreePort 
 event_i "i", 19, 91.55555555555553, 0.8888888888888888, ir9326, ir1
 event_i "i", 24, 91.55555555555553, 0.8888888888888888, 1.0, ir9326
krl0 = 2.0
kr0 = krl0
S9336 sprintf "alive_%d", ir9326
 chnset kr0, S9336
ir9339 FreePort 
 event_i "i", 19, 88.88888888888887, 0.4444444444444444, ir9339, ir1
 event_i "i", 25, 88.88888888888887, 0.4444444444444444, 1.0, ir9339
krl0 = 2.0
kr0 = krl0
S9349 sprintf "alive_%d", ir9339
 chnset kr0, S9349
ir9352 FreePort 
 event_i "i", 19, 91.1111111111111, 0.4444444444444444, ir9352, ir1
 event_i "i", 25, 91.1111111111111, 0.4444444444444444, 1.0, ir9352
krl0 = 2.0
kr0 = krl0
S9362 sprintf "alive_%d", ir9352
 chnset kr0, S9362
krl0 = 1440.0
kr0 = krl0
S9369 sprintf "alive_%d", ir1
 chnset kr0, S9369
S9372 sprintf "p1_%d", ir1
ar0 chnget S9372
S9375 sprintf "p2_%d", ir1
ar1 chnget S9375
 chnclear S9372
 chnclear S9375
arl1 init 0.0
arl2 init 0.0
arl1 = ar0
arl2 = ar1
ar0 = arl1
ar1 = arl2
 outs ar0, ar1
endin

instr 25
arl0 init 0.0
ar0, ar1 diskin2 "./samples/bd.wav"
arl0 = ar0
ar0 = arl0
S9 sprintf "p1_%d", p5
 chnmix ar0, S9
arl1 init 0.0
arl1 = ar1
ar0 = arl1
S19 sprintf "p2_%d", p5
 chnmix ar0, S19
S22 sprintf "alive_%d", p5
kr0 chnget S22
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S22
endin

instr 24
arl0 init 0.0
ar0, ar1 diskin2 "./samples/sd.wav"
arl0 = ar0
ar0 = arl0
S9 sprintf "p1_%d", p5
 chnmix ar0, S9
arl1 init 0.0
arl1 = ar1
ar0 = arl1
S19 sprintf "p2_%d", p5
 chnmix ar0, S19
S22 sprintf "alive_%d", p5
kr0 chnget S22
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S22
endin

instr 23
S1 sprintf "p1_%d", p4
ar0 chnget S1
S4 sprintf "p2_%d", p4
ar1 chnget S4
 chnclear S1
 chnclear S4
arl0 init 0.0
ar2 = (0.6666666666666666 * ar0)
arl0 = ar2
ar0 = arl0
S18 sprintf "p1_%d", p5
 chnmix ar0, S18
arl1 init 0.0
ar0 = (0.6666666666666666 * ar1)
arl1 = ar0
ar0 = arl1
S28 sprintf "p2_%d", p5
 chnmix ar0, S28
endin

instr 22
arl0 init 0.0
ar0, ar1 diskin2 "./samples/hho.wav"
arl0 = ar0
ar0 = arl0
S9 sprintf "p1_%d", p5
 chnmix ar0, S9
arl1 init 0.0
arl1 = ar1
ar0 = arl1
S19 sprintf "p2_%d", p5
 chnmix ar0, S19
S22 sprintf "alive_%d", p5
kr0 chnget S22
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S22
endin

instr 21
S1 sprintf "p1_%d", p4
ar0 chnget S1
S4 sprintf "p2_%d", p4
ar1 chnget S4
 chnclear S1
 chnclear S4
arl0 init 0.0
ar2 = (0.5333333333333333 * ar0)
arl0 = ar2
ar0 = arl0
S18 sprintf "p1_%d", p5
 chnmix ar0, S18
arl1 init 0.0
ar0 = (0.5333333333333333 * ar1)
arl1 = ar0
ar0 = arl1
S28 sprintf "p2_%d", p5
 chnmix ar0, S28
endin

instr 20
S1 sprintf "p1_%d", p4
ar0 chnget S1
S4 sprintf "p2_%d", p4
ar1 chnget S4
 chnclear S1
 chnclear S4
arl0 init 0.0
ar2 = (0.4666666666666667 * ar0)
arl0 = ar2
ar0 = arl0
S18 sprintf "p1_%d", p5
 chnmix ar0, S18
arl1 init 0.0
ar0 = (0.4666666666666667 * ar1)
arl1 = ar0
ar0 = arl1
S28 sprintf "p2_%d", p5
 chnmix ar0, S28
endin

instr 19
S1 sprintf "p1_%d", p4
ar0 chnget S1
S4 sprintf "p2_%d", p4
ar1 chnget S4
 chnclear S1
 chnclear S4
arl0 init 0.0
ar2 = (1.0 * ar0)
arl0 = ar2
ar0 = arl0
S18 sprintf "p1_%d", p5
 chnmix ar0, S18
arl1 init 0.0
ar0 = (1.0 * ar1)
arl1 = ar0
ar0 = arl1
S28 sprintf "p2_%d", p5
 chnmix ar0, S28
endin

instr 18
arl0 init 0.0
ar0, ar1 diskin2 "./samples/hhc.wav"
arl0 = ar0
ar0 = arl0
S9 sprintf "p1_%d", p5
 chnmix ar0, S9
arl1 init 0.0
arl1 = ar1
ar0 = arl1
S19 sprintf "p2_%d", p5
 chnmix ar0, S19
S22 sprintf "alive_%d", p5
kr0 chnget S22
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S22
endin

</CsInstruments>

<CsScore>



f0 604800.0

i 30 0.0 -1.0 
i 29 0.0 -1.0 
i 27 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>