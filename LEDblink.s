	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"LEDblink.c"
	.text
	.align	2
	.global	on
	.syntax unified
	.arm
	.fpu vfp
	.type	on, %function
/*
* creation of on method
*/ 
on:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	mov	r1, #1			@ sets to HIGH for LED to turn on
	mov	r0, #0
	bl	digitalWrite		@ calls digitalWrite to turn LED on
	ldr	r3, [fp, #-8]
	mov	r2, #1000
	mul	r3, r2, r3
	mov	r0, r3
	bl	delay			@ delay system call
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	on, .-on
	.align	2
	.global	off
	.syntax unified
	.arm
	.fpu vfp
	.type	off, %function
off:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	mov	r1, #0			@ sets to LOW to turn LED off
	mov	r0, #0
	bl	digitalWrite		@ uses digitalWrite to turn LED off
	ldr	r3, [fp, #-8]
	mov	r2, #1000
	mul	r3, r2, r3
	mov	r0, r3
	bl	delay			@ delay system call
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	off, .-off
	.align	2
	.global	blinkLED
	.syntax unified
	.arm
	.fpu vfp
	.type	blinkLED, %function
/*
* blinkLED method creation
*/
blinkLED:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	mov	r3, r0
	strb	r3, [fp, #-21]
	mov	r3, #1
	str	r3, [fp, #-8]
	mov	r3, #3
	str	r3, [fp, #-12]
	mov	r3, #4
	str	r3, [fp, #-16]
	bl	wiringPiSetup		@ sets up wiringPi
	mov	r1, #1
	mov	r0, #0
	bl	pinMode			@ sets up pinMode
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	sub	r3, r3, #32
	cmp	r3, #90			@ I believe this is the switch start
	ldrls	pc, [pc, r3, asl #2]
	b	.L4
/*
* switch conditionals - and I believe is part of comparing process
*/
.L6:
	.word	.L5
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L7
	.word	.L8
	.word	.L9
	.word	.L10
	.word	.L11
	.word	.L12
	.word	.L13
	.word	.L14
	.word	.L15
	.word	.L16
	.word	.L17
	.word	.L18
	.word	.L19
	.word	.L20
	.word	.L21
	.word	.L22
	.word	.L23
	.word	.L24
	.word	.L25
	.word	.L26
	.word	.L27
	.word	.L28
	.word	.L29
	.word	.L30
	.word	.L31
	.word	.L32
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L4
	.word	.L7
	.word	.L8
	.word	.L9
	.word	.L10
	.word	.L11
	.word	.L12
	.word	.L13
	.word	.L14
	.word	.L15
	.word	.L16
	.word	.L17
	.word	.L18
	.word	.L19
	.word	.L20
	.word	.L21
	.word	.L22
	.word	.L23
	.word	.L24
	.word	.L25
	.word	.L26
	.word	.L27
	.word	.L28
	.word	.L29
	.word	.L30
	.word	.L31
	.word	.L32
/*
* The following are code to implement when when a condition in the switch statement
* is met. IE: the morse code to use for turning LED on or off
*/
.L7:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L8:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L9:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L10:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L11:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	b	.L4
.L12:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L13:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L14:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L15:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L16:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L17:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L18:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L19:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L20:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L21:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L22:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L23:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L24:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L25:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L26:
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L27:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L28:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L29:
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L30:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L31:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	b	.L4
.L32:
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-12]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	ldr	r0, [fp, #-8]
	bl	off
	ldr	r0, [fp, #-8]
	bl	on
	b	.L4
.L5:	
	ldr	r0, [fp, #-16]
	bl	off
	nop
.L4:					@ break command - end switch
	ldr	r0, [fp, #-12]
	bl	off
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	blinkLED, .-blinkLED
	.section	.rodata
	.align	2
.LC0:					@ declaration for outputting prompt
	.ascii	"Enter input to blink out in morse code(255 characte"
	.ascii	"rs): \000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 264
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #264
	ldr	r0, .L37
	bl	printf
	ldr	r3, .L37+4
	ldr	r2, [r3]
	sub	r3, fp, #268
	mov	r1, #256
	mov	r0, r3
	bl	fgets
	sub	r3, fp, #268
	mov	r0, r3
	bl	strlen
	mov	r3, r0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L34
/*
* This is where the program is getting the character to send to blinkLED method
* and then calls that method with given character as argument
*/
.L35:
	sub	r2, fp, #268
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3		@ set character to register 0 to use for blinkLED
	bl	blinkLED
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L34:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	blt	.L35
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L38:
	.align	2
.L37:
	.word	.LC0		@ call LC0 which asks user for input
	.word	stdin
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
