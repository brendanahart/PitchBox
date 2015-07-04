loop	sr	min_half	min	sixteen
	sr 	max_half	max	sixteen
	cp	0x80000003	min_half
	cp	0x80000004	max_half
joebob	call	microphone	microphone_ra
testMax	blt	assignMax	max	sample	
testMin	blt	assignMin	sample	min
	be	loop	one	one
assignMax	cp	max	sample
	be	testMin	one	one
assignMin	cp	min	sample
	be	loop	one	one



min_half .data	0
max_half .data  0
sixteen	.data	16
max	.data	-9999999
min	.data	9999999
nine	.data	800
two	.data	600

#include microphone.e

