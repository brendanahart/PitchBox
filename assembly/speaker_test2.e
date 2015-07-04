reset           cp      i               zero
next_sample     cpfa    speaker_sample  noise       i
call_speaker	call    speaker         speaker_ra
                add     i               i           one
                be      reset           i           size
                be      next_sample     0           0

#include speaker.e 

noise	.data	0
		.data	363717072
		.data 	684428797
		.data	924214714
		.data	1054722904
		.data   1060522280
		.data	940927133
		.data	710078208
		.data	395270728
		.data 	33727045
		.data 	-331804471
		.data	-658103937
		.data 	-906590206
		.data	-1047882644
		.data	-1065275049
		.data	-956710970
		.data	-735026858
		.data	-426434300
		.data 	-67420806
size	.data	19
i       .data   0
zero    .data   0
one     .data   1
