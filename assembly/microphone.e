microphone
microphone_wait1	bne	microphone_wait1	0x80000051	mic_zero
microphone_setCommand	cp	0x80000050	mic_one
microphone_wait2	bne	microphone_wait2	0x80000051	mic_one
	cp	microphone_sample	0x80000052
	cp	0x80000050	mic_zero
	ret	microphone_ra




mic_zero	.data	0
mic_one	.data	1
microphone_sample	.data	0
mic_return	.data	0
microphone_ra	.data	0
