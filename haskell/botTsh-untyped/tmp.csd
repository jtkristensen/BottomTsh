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




instr 29

endin

instr 28
 event_i "i", 27, 5.333333333333333, 1.0e-2
endin

instr 27
ir1 = 26
ir2 = 0.0
 turnoff2 ir1, ir2, ir2
ir5 = 25
 turnoff2 ir5, ir2, ir2
ir8 = 24
 turnoff2 ir8, ir2, ir2
ir11 = 23
 turnoff2 ir11, ir2, ir2
ir14 = 22
 turnoff2 ir14, ir2, ir2
ir17 = 21
 turnoff2 ir17, ir2, ir2
ir20 = 20
 turnoff2 ir20, ir2, ir2
ir23 = 19
 turnoff2 ir23, ir2, ir2
ir26 = 18
 turnoff2 ir26, ir2, ir2
 exitnow 
endin

instr 26
arl0 init 0.0
arl1 init 0.0
ar0, ar1 subinstr 25
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

instr 25
ir1 FreePort 
krl0 init 10.0
ir5 FreePort 
 event_i "i", 19, 0.0, 0.19999999999999998, ir5, ir1
 event_i "i", 18, 0.0, 0.19999999999999998, 1.0, ir5
krl0 = 2.0
kr0 = krl0
S15 sprintf "alive_%d", ir5
 chnset kr0, S15
ir18 FreePort 
 event_i "i", 20, 0.19999999999999998, 0.13333333333333333, ir18, ir1
 event_i "i", 18, 0.19999999999999998, 0.13333333333333333, 1.0, ir18
krl0 = 2.0
kr0 = krl0
S28 sprintf "alive_%d", ir18
 chnset kr0, S28
ir31 FreePort 
 event_i "i", 19, 0.3333333333333333, 0.19999999999999998, ir31, ir1
 event_i "i", 18, 0.3333333333333333, 0.19999999999999998, 1.0, ir31
krl0 = 2.0
kr0 = krl0
S41 sprintf "alive_%d", ir31
 chnset kr0, S41
ir44 FreePort 
 event_i "i", 20, 0.5333333333333333, 0.13333333333333333, ir44, ir1
 event_i "i", 18, 0.5333333333333333, 0.13333333333333333, 1.0, ir44
krl0 = 2.0
kr0 = krl0
S54 sprintf "alive_%d", ir44
 chnset kr0, S54
ir57 FreePort 
 event_i "i", 19, 0.6666666666666666, 0.19999999999999998, ir57, ir1
 event_i "i", 18, 0.6666666666666666, 0.19999999999999998, 1.0, ir57
krl0 = 2.0
kr0 = krl0
S67 sprintf "alive_%d", ir57
 chnset kr0, S67
ir70 FreePort 
 event_i "i", 20, 0.8666666666666666, 0.13333333333333333, ir70, ir1
 event_i "i", 18, 0.8666666666666666, 0.13333333333333333, 1.0, ir70
krl0 = 2.0
kr0 = krl0
S80 sprintf "alive_%d", ir70
 chnset kr0, S80
ir83 FreePort 
 event_i "i", 19, 1.0, 0.19999999999999998, ir83, ir1
 event_i "i", 18, 1.0, 0.19999999999999998, 1.0, ir83
krl0 = 2.0
kr0 = krl0
S93 sprintf "alive_%d", ir83
 chnset kr0, S93
ir96 FreePort 
 event_i "i", 20, 1.2, 0.13333333333333333, ir96, ir1
 event_i "i", 18, 1.2, 0.13333333333333333, 1.0, ir96
krl0 = 2.0
kr0 = krl0
S106 sprintf "alive_%d", ir96
 chnset kr0, S106
ir109 FreePort 
 event_i "i", 19, 1.3333333333333333, 0.19999999999999998, ir109, ir1
 event_i "i", 18, 1.3333333333333333, 0.19999999999999998, 1.0, ir109
krl0 = 2.0
kr0 = krl0
S119 sprintf "alive_%d", ir109
 chnset kr0, S119
ir122 FreePort 
 event_i "i", 20, 1.5333333333333332, 0.13333333333333333, ir122, ir1
 event_i "i", 18, 1.5333333333333332, 0.13333333333333333, 1.0, ir122
krl0 = 2.0
kr0 = krl0
S132 sprintf "alive_%d", ir122
 chnset kr0, S132
ir135 FreePort 
 event_i "i", 19, 1.6666666666666665, 0.19999999999999998, ir135, ir1
 event_i "i", 18, 1.6666666666666665, 0.19999999999999998, 1.0, ir135
krl0 = 2.0
kr0 = krl0
S145 sprintf "alive_%d", ir135
 chnset kr0, S145
ir148 FreePort 
 event_i "i", 20, 1.8666666666666665, 0.13333333333333333, ir148, ir1
 event_i "i", 18, 1.8666666666666665, 0.13333333333333333, 1.0, ir148
krl0 = 2.0
kr0 = krl0
S158 sprintf "alive_%d", ir148
 chnset kr0, S158
ir161 FreePort 
 event_i "i", 19, 1.9999999999999998, 0.19999999999999998, ir161, ir1
 event_i "i", 18, 1.9999999999999998, 0.19999999999999998, 1.0, ir161
krl0 = 2.0
kr0 = krl0
S171 sprintf "alive_%d", ir161
 chnset kr0, S171
ir174 FreePort 
 event_i "i", 20, 2.1999999999999997, 0.13333333333333333, ir174, ir1
 event_i "i", 18, 2.1999999999999997, 0.13333333333333333, 1.0, ir174
krl0 = 2.0
kr0 = krl0
S184 sprintf "alive_%d", ir174
 chnset kr0, S184
ir187 FreePort 
 event_i "i", 19, 2.333333333333333, 0.19999999999999998, ir187, ir1
 event_i "i", 18, 2.333333333333333, 0.19999999999999998, 1.0, ir187
krl0 = 2.0
kr0 = krl0
S197 sprintf "alive_%d", ir187
 chnset kr0, S197
ir200 FreePort 
 event_i "i", 20, 2.533333333333333, 0.13333333333333333, ir200, ir1
 event_i "i", 18, 2.533333333333333, 0.13333333333333333, 1.0, ir200
krl0 = 2.0
kr0 = krl0
S210 sprintf "alive_%d", ir200
 chnset kr0, S210
ir213 FreePort 
 event_i "i", 22, 2.5, 0.16666666666666666, ir213, ir1
 event_i "i", 21, 2.5, 0.16666666666666666, 1.0, ir213
krl0 = 2.0
kr0 = krl0
S223 sprintf "alive_%d", ir213
 chnset kr0, S223
ir226 FreePort 
 event_i "i", 19, 0.6666666666666666, 0.6666666666666666, ir226, ir1
 event_i "i", 23, 0.6666666666666666, 0.6666666666666666, 1.0, ir226
krl0 = 2.0
kr0 = krl0
S236 sprintf "alive_%d", ir226
 chnset kr0, S236
ir239 FreePort 
 event_i "i", 19, 2.0, 0.6666666666666666, ir239, ir1
 event_i "i", 23, 2.0, 0.6666666666666666, 1.0, ir239
krl0 = 2.0
kr0 = krl0
S249 sprintf "alive_%d", ir239
 chnset kr0, S249
ir252 FreePort 
 event_i "i", 19, 0.0, 0.3333333333333333, ir252, ir1
 event_i "i", 24, 0.0, 0.3333333333333333, 1.0, ir252
krl0 = 2.0
kr0 = krl0
S262 sprintf "alive_%d", ir252
 chnset kr0, S262
ir265 FreePort 
 event_i "i", 20, 1.0, 0.3333333333333333, ir265, ir1
 event_i "i", 24, 1.0, 0.3333333333333333, 1.0, ir265
krl0 = 2.0
kr0 = krl0
S275 sprintf "alive_%d", ir265
 chnset kr0, S275
ir278 FreePort 
 event_i "i", 19, 1.6666666666666665, 0.3333333333333333, ir278, ir1
 event_i "i", 24, 1.6666666666666665, 0.3333333333333333, 1.0, ir278
krl0 = 2.0
kr0 = krl0
S288 sprintf "alive_%d", ir278
 chnset kr0, S288
ir291 FreePort 
 event_i "i", 20, 2.333333333333333, 0.3333333333333333, ir291, ir1
 event_i "i", 24, 2.333333333333333, 0.3333333333333333, 1.0, ir291
krl0 = 2.0
kr0 = krl0
S301 sprintf "alive_%d", ir291
 chnset kr0, S301
ir304 FreePort 
 event_i "i", 19, 2.6666666666666665, 0.19999999999999998, ir304, ir1
 event_i "i", 18, 2.6666666666666665, 0.19999999999999998, 1.0, ir304
krl0 = 2.0
kr0 = krl0
S314 sprintf "alive_%d", ir304
 chnset kr0, S314
ir317 FreePort 
 event_i "i", 20, 2.8666666666666667, 0.13333333333333333, ir317, ir1
 event_i "i", 18, 2.8666666666666667, 0.13333333333333333, 1.0, ir317
krl0 = 2.0
kr0 = krl0
S327 sprintf "alive_%d", ir317
 chnset kr0, S327
ir330 FreePort 
 event_i "i", 19, 3.0, 0.19999999999999998, ir330, ir1
 event_i "i", 18, 3.0, 0.19999999999999998, 1.0, ir330
krl0 = 2.0
kr0 = krl0
S340 sprintf "alive_%d", ir330
 chnset kr0, S340
ir343 FreePort 
 event_i "i", 20, 3.2, 0.13333333333333333, ir343, ir1
 event_i "i", 18, 3.2, 0.13333333333333333, 1.0, ir343
krl0 = 2.0
kr0 = krl0
S353 sprintf "alive_%d", ir343
 chnset kr0, S353
ir356 FreePort 
 event_i "i", 19, 3.3333333333333335, 0.19999999999999998, ir356, ir1
 event_i "i", 18, 3.3333333333333335, 0.19999999999999998, 1.0, ir356
krl0 = 2.0
kr0 = krl0
S366 sprintf "alive_%d", ir356
 chnset kr0, S366
ir369 FreePort 
 event_i "i", 20, 3.5333333333333337, 0.13333333333333333, ir369, ir1
 event_i "i", 18, 3.5333333333333337, 0.13333333333333333, 1.0, ir369
krl0 = 2.0
kr0 = krl0
S379 sprintf "alive_%d", ir369
 chnset kr0, S379
ir382 FreePort 
 event_i "i", 19, 3.666666666666667, 0.19999999999999998, ir382, ir1
 event_i "i", 18, 3.666666666666667, 0.19999999999999998, 1.0, ir382
krl0 = 2.0
kr0 = krl0
S392 sprintf "alive_%d", ir382
 chnset kr0, S392
ir395 FreePort 
 event_i "i", 20, 3.866666666666667, 0.13333333333333333, ir395, ir1
 event_i "i", 18, 3.866666666666667, 0.13333333333333333, 1.0, ir395
krl0 = 2.0
kr0 = krl0
S405 sprintf "alive_%d", ir395
 chnset kr0, S405
ir408 FreePort 
 event_i "i", 19, 4.0, 0.19999999999999998, ir408, ir1
 event_i "i", 18, 4.0, 0.19999999999999998, 1.0, ir408
krl0 = 2.0
kr0 = krl0
S418 sprintf "alive_%d", ir408
 chnset kr0, S418
ir421 FreePort 
 event_i "i", 20, 4.2, 0.13333333333333333, ir421, ir1
 event_i "i", 18, 4.2, 0.13333333333333333, 1.0, ir421
krl0 = 2.0
kr0 = krl0
S431 sprintf "alive_%d", ir421
 chnset kr0, S431
ir434 FreePort 
 event_i "i", 19, 4.333333333333333, 0.19999999999999998, ir434, ir1
 event_i "i", 18, 4.333333333333333, 0.19999999999999998, 1.0, ir434
krl0 = 2.0
kr0 = krl0
S444 sprintf "alive_%d", ir434
 chnset kr0, S444
ir447 FreePort 
 event_i "i", 20, 4.533333333333333, 0.13333333333333333, ir447, ir1
 event_i "i", 18, 4.533333333333333, 0.13333333333333333, 1.0, ir447
krl0 = 2.0
kr0 = krl0
S457 sprintf "alive_%d", ir447
 chnset kr0, S457
ir460 FreePort 
 event_i "i", 19, 4.666666666666666, 0.19999999999999998, ir460, ir1
 event_i "i", 18, 4.666666666666666, 0.19999999999999998, 1.0, ir460
krl0 = 2.0
kr0 = krl0
S470 sprintf "alive_%d", ir460
 chnset kr0, S470
ir473 FreePort 
 event_i "i", 20, 4.866666666666666, 0.13333333333333333, ir473, ir1
 event_i "i", 18, 4.866666666666666, 0.13333333333333333, 1.0, ir473
krl0 = 2.0
kr0 = krl0
S483 sprintf "alive_%d", ir473
 chnset kr0, S483
ir486 FreePort 
 event_i "i", 19, 4.999999999999999, 0.19999999999999998, ir486, ir1
 event_i "i", 18, 4.999999999999999, 0.19999999999999998, 1.0, ir486
krl0 = 2.0
kr0 = krl0
S496 sprintf "alive_%d", ir486
 chnset kr0, S496
ir499 FreePort 
 event_i "i", 20, 5.199999999999999, 0.13333333333333333, ir499, ir1
 event_i "i", 18, 5.199999999999999, 0.13333333333333333, 1.0, ir499
krl0 = 2.0
kr0 = krl0
S509 sprintf "alive_%d", ir499
 chnset kr0, S509
ir512 FreePort 
 event_i "i", 22, 5.166666666666666, 0.16666666666666666, ir512, ir1
 event_i "i", 21, 5.166666666666666, 0.16666666666666666, 1.0, ir512
krl0 = 2.0
kr0 = krl0
S522 sprintf "alive_%d", ir512
 chnset kr0, S522
ir525 FreePort 
 event_i "i", 19, 3.333333333333333, 0.6666666666666666, ir525, ir1
 event_i "i", 23, 3.333333333333333, 0.6666666666666666, 1.0, ir525
krl0 = 2.0
kr0 = krl0
S535 sprintf "alive_%d", ir525
 chnset kr0, S535
ir538 FreePort 
 event_i "i", 19, 4.666666666666666, 0.6666666666666666, ir538, ir1
 event_i "i", 23, 4.666666666666666, 0.6666666666666666, 1.0, ir538
krl0 = 2.0
kr0 = krl0
S548 sprintf "alive_%d", ir538
 chnset kr0, S548
ir551 FreePort 
 event_i "i", 19, 2.6666666666666665, 0.3333333333333333, ir551, ir1
 event_i "i", 24, 2.6666666666666665, 0.3333333333333333, 1.0, ir551
krl0 = 2.0
kr0 = krl0
S561 sprintf "alive_%d", ir551
 chnset kr0, S561
ir564 FreePort 
 event_i "i", 20, 3.6666666666666665, 0.3333333333333333, ir564, ir1
 event_i "i", 24, 3.6666666666666665, 0.3333333333333333, 1.0, ir564
krl0 = 2.0
kr0 = krl0
S574 sprintf "alive_%d", ir564
 chnset kr0, S574
ir577 FreePort 
 event_i "i", 19, 4.333333333333333, 0.3333333333333333, ir577, ir1
 event_i "i", 24, 4.333333333333333, 0.3333333333333333, 1.0, ir577
krl0 = 2.0
kr0 = krl0
S587 sprintf "alive_%d", ir577
 chnset kr0, S587
ir590 FreePort 
 event_i "i", 20, 5.0, 0.3333333333333333, ir590, ir1
 event_i "i", 24, 5.0, 0.3333333333333333, 1.0, ir590
krl0 = 2.0
kr0 = krl0
S600 sprintf "alive_%d", ir590
 chnset kr0, S600
krl0 = 92.0
kr0 = krl0
S607 sprintf "alive_%d", ir1
 chnset kr0, S607
S610 sprintf "p1_%d", ir1
ar0 chnget S610
S613 sprintf "p2_%d", ir1
ar1 chnget S613
 chnclear S610
 chnclear S613
arl1 init 0.0
arl2 init 0.0
arl1 = ar0
arl2 = ar1
ar0 = arl1
ar1 = arl2
 outs ar0, ar1
endin

instr 24
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

instr 23
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

instr 22
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

instr 21
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

instr 20
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

i 29 0.0 -1.0 
i 28 0.0 -1.0 
i 26 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>