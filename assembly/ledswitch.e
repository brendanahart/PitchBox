ledROnAll		cp 0x80000001 redOn
						ret ledROnAll_ra
ledROffAll	cp 0x80000001 0
						ret ledROffAll_ra
ledGOnAll		cp 0x80000002 greenOn
						ret ledGOnAll_ra
ledGOffAll	cp 0x80000002 0
						ret ledGOffAll_ra


ledROnAll_ra		.data 0
ledROffAll_ra		.data 0
ledGOnAll_ra		.data 0
ledGOffAll_ra		.data 0
