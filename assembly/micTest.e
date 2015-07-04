micTest_loop	sr	micTest_min_half	micTest_min	micTest_sixteen
	sr 	micTest_max_half	micTest_max	micTest_sixteen
	cp	0x80000003	micTest_min_half
	cp	0x80000004	micTest_max_half
	call	microphone	microphone_ra
micTest_testMax	blt	micTest_assignMax	micTest_max	microphone_sample	
micTest_testMin	blt	micTest_assignMin	microphone_sample	micTest_min
	be	micTest_loop	micTest_one	micTest_one
micTest_assignMax	cp	micTest_max	microphone_sample
	be	micTest_testMin	micTest_one	micTest_one
micTest_assignMin	cp	micTest_min	microphone_sample
	be	micTest_loop	micTest_one	micTest_one



micTest_min_half .data	0
micTest_max_half .data  0
micTest_sixteen	.data	16
micTest_max	.data	-9999999
micTest_min	.data	9999999
micTest_nine	.data	800
micTest_two	.data	600

//REMOVED #include microphone.e

