speaker		cp		0x80000040		zero
chk_rep		bne		chk_rep			0x80000041	zero
			cpfa	0x80000042		noise		i
			cp 		0x80000040		one
wait		bne		wait 			0x80000041	one
			be 		stop			i			speaker_length
			add		i				i			one 
			be		speaker			0			0
stop		ret		speaker_ra 

zero			.data		0
i	   			.data		0
one				.data		1
speaker_length	.data		0
speaker_ra		.data		0


