.arch armv7-a
.fpu neon

.text
.global det
@ Recibe 4 flotantes a b c y d.
@ Queremos computar a * d - c * b
det: 
	push {lr}
	vmul.f32 s0, s0, s3 @ a * d
	vmul.f32 s1, s1, s2 @ s1 = s1 * s5
	vsub.f32 s0, s0, s1
	pop {lr}
	bx lr

.section .note.GNU-stack

