//OUT_PUT: num_random will hold a value between 1 and 7
random_generator
gen_rand_num	call	microphone		microphone_ra
gen_wait	sr	microphone_sample	microphone_sample	randGen_sixteen
		and	num_random		gen_seven		microphone_sample
		be	gen_rand_num		num_random		gen_zero
		cp	0x80000003		num_random
		ret	gen_rand_num_ra	
		

gen_seven	.data	7
gen_zero	.data	0
gen_one		.data	1
num_random	.data	0
gen_rand_num_ra	.data	0
randGen_sixteen	.data	16


#include microphone.e
