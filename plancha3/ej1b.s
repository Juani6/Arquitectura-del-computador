.global main

main:
	movb $0xFE, %al # al = 1111 1110	
	movb $-1, %bl		# bl = 1111 1111
	addb %bl, %al		# al = 1111	1101 cf = 1
	incb %bl  			# bl = 0000 0000 cf = 1
	#movb %bl, %al
	ret