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




instr 26

endin

instr 25
 event_i "i", 24, 2.0, 1.0e-2
endin

instr 24
ir1 = 23
ir2 = 0.0
 turnoff2 ir1, ir2, ir2
ir5 = 22
 turnoff2 ir5, ir2, ir2
ir8 = 21
 turnoff2 ir8, ir2, ir2
ir11 = 20
 turnoff2 ir11, ir2, ir2
ir14 = 19
 turnoff2 ir14, ir2, ir2
ir17 = 18
 turnoff2 ir17, ir2, ir2
 exitnow 
endin

instr 23
arl0 init 0.0
arl1 init 0.0
ar0, ar1 subinstr 22
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

instr 22
ir1 FreePort 
krl0 init 10.0
ir5 FreePort 
 event_i "i", 19, 0.0, 0.25, ir5, ir1
 event_i "i", 18, 0.0, 0.25, 1.0, ir5
krl0 = 2.0
kr0 = krl0
S15 sprintf "alive_%d", ir5
 chnset kr0, S15
ir18 FreePort 
 event_i "i", 20, 0.25, 0.25, ir18, ir1
 event_i "i", 18, 0.25, 0.25, 1.0, ir18
krl0 = 2.0
kr0 = krl0
S28 sprintf "alive_%d", ir18
 chnset kr0, S28
ir31 FreePort 
 event_i "i", 19, 0.5, 0.25, ir31, ir1
 event_i "i", 18, 0.5, 0.25, 1.0, ir31
krl0 = 2.0
kr0 = krl0
S41 sprintf "alive_%d", ir31
 chnset kr0, S41
ir44 FreePort 
 event_i "i", 20, 0.75, 0.25, ir44, ir1
 event_i "i", 18, 0.75, 0.25, 1.0, ir44
krl0 = 2.0
kr0 = krl0
S54 sprintf "alive_%d", ir44
 chnset kr0, S54
ir57 FreePort 
 event_i "i", 19, 1.0, 0.25, ir57, ir1
 event_i "i", 18, 1.0, 0.25, 1.0, ir57
krl0 = 2.0
kr0 = krl0
S67 sprintf "alive_%d", ir57
 chnset kr0, S67
ir70 FreePort 
 event_i "i", 20, 1.25, 0.25, ir70, ir1
 event_i "i", 18, 1.25, 0.25, 1.0, ir70
krl0 = 2.0
kr0 = krl0
S80 sprintf "alive_%d", ir70
 chnset kr0, S80
ir83 FreePort 
 event_i "i", 19, 1.5, 0.25, ir83, ir1
 event_i "i", 18, 1.5, 0.25, 1.0, ir83
krl0 = 2.0
kr0 = krl0
S93 sprintf "alive_%d", ir83
 chnset kr0, S93
ir96 FreePort 
 event_i "i", 20, 1.75, 0.25, ir96, ir1
 event_i "i", 18, 1.75, 0.25, 1.0, ir96
krl0 = 2.0
kr0 = krl0
S106 sprintf "alive_%d", ir96
 chnset kr0, S106
ir109 FreePort 
 event_i "i", 19, 0.5, 0.5, ir109, ir1
 event_i "i", 21, 0.5, 0.5, 1.0, ir109
krl0 = 2.0
kr0 = krl0
S119 sprintf "alive_%d", ir109
 chnset kr0, S119
ir122 FreePort 
 event_i "i", 19, 1.5, 0.5, ir122, ir1
 event_i "i", 21, 1.5, 0.5, 1.0, ir122
krl0 = 2.0
kr0 = krl0
S132 sprintf "alive_%d", ir122
 chnset kr0, S132
krl0 = 20.0
kr0 = krl0
S139 sprintf "alive_%d", ir1
 chnset kr0, S139
S142 sprintf "p1_%d", ir1
ar0 chnget S142
S145 sprintf "p2_%d", ir1
ar1 chnget S145
 chnclear S142
 chnclear S145
arl1 init 0.0
arl2 init 0.0
arl1 = ar0
arl2 = ar1
ar0 = arl1
ar1 = arl2
 outs ar0, ar1
endin

instr 21
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

instr 20
S1 sprintf "p1_%d", p4
ar0 chnget S1
S4 sprintf "p2_%d", p4
ar1 chnget S4
 chnclear S1
 chnclear S4
arl0 init 0.0
ar2 = (8.0 * ar0)
arl0 = ar2
ar0 = arl0
S18 sprintf "p1_%d", p5
 chnmix ar0, S18
arl1 init 0.0
ar0 = (8.0 * ar1)
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
ar2 = (15.0 * ar0)
arl0 = ar2
ar0 = arl0
S18 sprintf "p1_%d", p5
 chnmix ar0, S18
arl1 init 0.0
ar0 = (15.0 * ar1)
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

i 26 0.0 -1.0 
i 25 0.0 -1.0 
i 23 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>