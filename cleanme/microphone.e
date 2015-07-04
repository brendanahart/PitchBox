microphone
microphone_wait1	bne	microphone_wait1	0x80000051	zero
microphone_setCommand	cp	0x80000050	one
microphone_wait2	bne	microphone_wait2	0x80000051	one
			cp	sample	0x80000052
			cp	0x80000050	zero
			ret	microphone_ra




zero	.data	0
one	.data	1
sample	.data	900
return	.data	0
microphone_ra	.data	0
