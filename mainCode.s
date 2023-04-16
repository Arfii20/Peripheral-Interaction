; Version 1 - November - Arefin Ahammed

; Setting the starting memory location of reset to 0
        ORG  0

; Keeps displaying HELLO until the button A is pressed as an infinite loop
reset		
	LDA	dsply	; The next 6 parts display HELLO
	STA	&FFA
	
	LDA	dsplyH
	STA	&FF9
	
	LDA	dsplyE
	STA	&FF8
	
	LDA	dsplyL
	STA	&FF7
	
	LDA	dsplyL
	STA	&FF6
	
	LDA	dsplyO	; Till this
	STA	&FF5
	
	LDA	&FF2	; This checks if the button A is pressed or not
	SUB	btnA
	JNE	reset	; If the result is zero, then jumps to start to start the program

; The switches have different light patterns for different switches
; If any of the switches are pressed, it will go to the corresponding branch and display the light sequence

start	LDA	&FF1	; Checks if switches is pressed	
	JNE	swtchA		; If pressed, it branches to switch A
	
	JMP	sbttns		; If not pressed it skips all the switches and goes to check buttons

; Starting of switch A is from here
swtchA	

	; This is a self modifying code which branches to display HEY on the display
	lbl1	LDA lbl1	; prints HEY
	ADD offset
	ADD jmp_op
	STA	ret_adr
	JMP	shw_
	
	LDA	&FF1
	SUB	swA

	JNE	swtchB
	
	LDA	ledPPG		;load ped green light
	STA	&FFF
	
	LDA 	delay 	; This is a delay which keeps subtracting 1 each time the loop runs from FFFF to 0000 
l1 	SUB 	one 	; (The same delay has been implemented everytime. Thats why commented only once)
	JNE 	l1 
	
	LDA	ledPPR		;load ped red light
	STA	&FFF
	
	LDA 	delay 
l2 	SUB 	one 
	JNE 	l2 
	
	LDA	ledPPG		;load ped green light	
	STA	&FFF
	
	LDA 	delay 
l3	SUB 	one 
	JNE 	l3
	
	LDA	ledPPR		;load ped red light
	STA	&FFF
	
	LDA 	delay 
l4	SUB 	one 
	JNE 	l4 
	
	LDA	ledPPG		;load ped green light
	STA	&FFF
	
	LDA 	delay 
l5 	SUB 	one 
	JNE 	l5 
	
	LDA	ledPPR		;load ped red light
	STA	&FFF
		
	LDA 	delay 
l6	SUB 	one 
	JNE 	l6
	
	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start
		
		
; Starting of switch B is from here
swtchB	LDA	&FF1
	SUB	swB
	JNE	swtchC
	
	LDA	ledPRR		;load road red light
	STA	&FFF
	
	LDA 	delay 
l7 	SUB 	one 
	JNE 	l7
	
	LDA	ledPRA		;load road amber light
	STA	&FFF
	
	LDA 	delay 
l8 	SUB 	one 
	JNE 	l8 

	
	LDA	ledPRG		;load road green light	
	STA	&FFF
	
	LDA 	delay 
l9	SUB 	one 
	JNE 	l9
	
	LDA	ledPRG		;load road green light
	STA	&FFF
	
	LDA 	delay 
l10	SUB 	one 
	JNE 	l10
	
	LDA	ledPRA		;load road amber light
	STA	&FFF
	
	LDA 	delay 
l11	SUB 	one 
	JNE 	l11

	LDA	ledPRR		;load road red light
	STA	&FFF

	LDA 	delay 
l12	SUB 	one 
	JNE 	l12
	
	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start
	
	
; Starting of switch C is from here
swtchC	LDA	&FF1
	SUB	swC
	JNE	swtchD
	
	LDA	ledPRR		;load road red light
	STA	&FFF
	
	LDA 	delay 
l13 	SUB 	one 
	JNE 	l13
	
	LDA	ledPRA		;load road amber light
	STA	&FFF
	
	LDA 	delay 
l14	SUB 	one 
	JNE 	l14 

	
	LDA	ledPRG		;load road green light	
	STA	&FFF
	
	LDA 	delay 
l15	SUB 	one 
	JNE 	l15
	
	LDA	ledPPG		;load ped green light
	STA	&FFF
	
	LDA 	delay 
l16	SUB 	one 
	JNE 	l16
	
	LDA	ledPPR		;load ped red light
	STA	&FFF
	
	LDA 	delay 
l17	SUB 	one 
	JNE 	l17
	
	LDA	ledPPR		;load ped red light
	STA	&FFF
	
	LDA 	delay 
l18	SUB 	one 
	JNE 	l18
	
	LDA	ledPPG		;load ped green light
	STA	&FFF
	
	LDA 	delay 
l19	SUB 	one 
	JNE 	l19
	
	LDA	ledPRG		;load road green light
	STA	&FFF

	LDA 	delay 
l20	SUB 	one 
	JNE 	l20
	
	LDA	ledPRA		;load road amber light
	STA	&FFF
			
	LDA 	delay 
l21	SUB 	one 
	JNE 	l21
	
	LDA	ledPRR		;load road red light
	STA	&FFF
	
	LDA 	delay 
l22	SUB 	one 
	JNE 	l22
	
	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start
	
	
; Starting of switch D is from here				
swtchD	LDA	&FF1
	SUB	swD
	JNE	swtchE
	
	LDA	ledPPG		;load ped green light
	STA	&FFF
	
	LDA 	delay 
l29	SUB 	one 
	JNE 	l29
	
	LDA	ledPPR		;load ped red light
	STA	&FFF
	
	LDA 	delay 
l30	SUB 	one 
	JNE 	l30

	LDA	ledPRR		;load road red light
	STA	&FFF
	
	LDA 	delay 
l31 	SUB 	one 
	JNE 	l31
	
	LDA	ledPRA		;load road amber light
	STA	&FFF
	
	LDA 	delay 
l32	SUB 	one 
	JNE 	l32 

	
	LDA	ledPRG		;load road green light	
	STA	&FFF
	
	LDA 	delay 
l33	SUB 	one 
	JNE 	l33
	
	LDA	ledPRG		;load road green light
	STA	&FFF
			
	LDA 	delay 
l34	SUB 	one 
	JNE 	l34
	
	LDA	ledPRA		;load road amber light
	STA	&FFF
	
	LDA 	delay 
l35	SUB 	one 
	JNE 	l35
		
	LDA	ledPRR		;load road red light
	STA	&FFF
	
	LDA 	delay 
l36	SUB 	one 
	JNE 	l36
	
	LDA	ledPPR		;load ped red light
	STA	&FFF
	
	LDA 	delay 
l37	SUB 	one 
	JNE 	l37
	
	LDA	ledPPG		;load road green light
	STA	&FFF

	LDA 	delay 
l38	SUB 	one 
	JNE 	l38
	
	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start
	
	
; Starting of switch E is from here	
swtchE	LDA	&FF1
	SUB	swE
	JNE	swtchF
	
	LDA	ldRRGG		;load updownleftright red light
	STA	&FFF
	
	LDA 	delay 
l23 	SUB 	one 
	JNE 	l23
	
	LDA	ldAAAA		;load updownleftright amber light
	STA	&FFF
	
	LDA 	delay 
l24	SUB 	one 
	JNE 	l24 

	
	LDA	ldGGRR		;load updownleftright green light	
	STA	&FFF
	
	LDA 	delay 
l25	SUB 	one 
	JNE 	l25
	
	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start


; Starting of switch F is from here	
swtchF	LDA	&FF1
	SUB	swF
	JNE	swtchG
	
	LDA	&0480		;load updownleftright red light
	STA	&FFF
	
	LDA 	delay 
l26 	SUB 	one 
	JNE 	l26
	
	LDA	&0240		;load updownleftright amber light
	STA	&FFF
	
	LDA 	delay 
l27	SUB 	one 
	JNE 	l27 

	
	LDA	&0120		;load updownleftright green light	
	STA	&FFF
	
	LDA 	delay 
l28	SUB 	one 
	JNE 	l28
	
	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start
	
	

; Starting of switch G is from here		
swtchG	LDA	&FF1
	SUB	swG
	JNE	swtchH
	
	LDA	&0280		;load updown red leftright amber light
	STA	&FFF
	
	LDA 	delay 
l39 	SUB 	one 
	JNE 	l39
	
	LDA	&0140		;load updown amber leftright green light
	STA	&FFF
	
	LDA 	delay 
l40	SUB 	one 
	JNE 	l40 

	
	LDA	&0420		;load updown green leftright red light	
	STA	&FFF
	
	LDA 	delay 
l41	SUB 	one 
	JNE 	l41
	
	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start
	


; Starting of switch H is from here				
swtchH	LDA	&FF1
	SUB	swH
	JNE	sbttns
	
	LDA	ledUDR		;load updown red light
	STA	&FFF
	
	LDA 	delay 
l42 	SUB 	one 
	JNE 	l42
	
	LDA	ledLRR		;load leftright red light
	STA	&FFF
	
	LDA 	delay 
l43	SUB 	one 
	JNE 	l43 

	
	LDA	ledUDA		;load updown amber light	
	STA	&FFF
	
	LDA 	delay 
l44	SUB 	one 
	JNE 	l44
	
	LDA	ledLRA		;load leftright amber light
	STA	&FFF
	
	LDA 	delay 
l45 	SUB 	one 
	JNE 	l45
	
	LDA	ledUDG		;load updown green light
	STA	&FFF
	
	LDA 	delay 
l46	SUB 	one 
	JNE 	l46 

	LDA	ledLRG		;load leftright green light	
	STA	&FFF
	
	LDA 	delay 
l47	SUB 	one 
	JNE 	l47
	
	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start

	

; Start of commands for simple buttons
sbttns	LDA	&FF0
	JNE	sbttn0
	
	JMP	bttns


; Starting of simple button0 is from here
sbttn0	

	; This is a self modifying code which branches to display HEY on the display
	lbl2	LDA lbl2	; prints HEY
	ADD offset
	ADD jmp_op
	STA	ret_adr
	JMP	shw_

	LDA	&FF0
	SUB	sbtn0
	JNE	sbttn1
	
	LDA	ldARL		;all road lights
	STA	&FFF
	
	LDA 	delay 
l48 	SUB 	one 
	JNE 	l48

	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start


; Starting of simple button1 is from here
sbttn1	LDA	&FF0
	SUB	sbtn1
	JNE	sbttn2
	
	LDA	ldAPL		;all ped lights
	STA	&FFF
	
	LDA 	delay 
l49 	SUB 	one 
	JNE 	l49

	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start
	

; Starting of simple button2 is from here
sbttn2	LDA	&FF0
	SUB	sbtn2
	JNE	sbttn3
	
	LDA	ldAUDL		;all updown road lights
	STA	&FFF
	
	LDA 	delay 
l50 	SUB 	one 
	JNE 	l50

	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start
	

; Starting of simple button3 is from here
sbttn3	LDA	&FF0
	SUB	sbtn3
	JNE	bttns
	
	LDA	ldALRL		;all leftright road lights
	STA	&FFF
	
	LDA 	delay 
l51 	SUB 	one 
	JNE 	l51

	LDA	zero		;switches all the lights off by loading &0000
	STA	&FFF
	
	JMP	start




; Start of commands for buttons
bttns	LDA	&FF2
	JNE	bttn1
	
	JMP	start


; Starting of button1 is from here
bttn1	
lbl3	LDA lbl3	; prints HEY
	ADD offset
	ADD jmp_op
	STA	ret_adr
	JMP	shw_
	
	LDA	&FF2
	SUB	btn1
	JNE	bttn2

	LDA buzzC	;C		-This is the note that the button plays (Same thing. So commented only once)
	STA &FFD

	JMP	start

; Starting of button2 is from here
bttn2	LDA	&FF2
	SUB	btn2
	JNE	bttn3

	LDA buzzC1	;C#
	STA &FFD

	JMP	start

; Starting of button3 is from here
bttn3	LDA	&FF2
	SUB	btn3
	JNE	bttnF

	LDA buzzD	;D
	STA &FFD

	JMP	start

; Starting of buttonF is from here
bttnF	LDA	&FF2
	SUB	btnF
	JNE	bttn4

	LDA buzzD1	;D#
	STA &FFD

	JMP	start
	
; Starting of button4 is from here
bttn4	LDA	&FF2
	SUB	btn4
	JNE	bttn5

	LDA buzzE	;E
	STA &FFD

	JMP	start

; Starting of button5 is from here	
bttn5	LDA	&FF2
	SUB	btn5
	JNE	bttn6

	LDA buzzF	;F
	STA &FFD

	JMP	start
	
; Starting of button6 is from here
bttn6	LDA	&FF2
	SUB	btn6
	JNE	bttnE

	LDA buzzF1	;F#
	STA &FFD

	JMP	start

; Starting of buttonE is from here	
bttnE	LDA	&FF2
	SUB	btnE
	JNE	bttn7

	LDA buzzG	;G
	STA &FFD

	JMP	start

; Starting of button7 is from here	
bttn7	LDA	&FF2
	SUB	btn7
	JNE	bttn8

	LDA buzzG1	;G#
	STA &FFD

	JMP	start

; Starting of button8 is from here	
bttn8	LDA	&FF2
	SUB	btn8
	JNE	bttn9

	LDA buzzA	;A
	STA &FFD

	JMP	start

; Starting of button9 is from here	
bttn9	LDA	&FF2
	SUB	btn9
	JNE	bttnD

	LDA buzzA1	;A#
	STA &FFD

	JMP	start
	
; Starting of buttonD is from here
bttnD	LDA	&FF2
	SUB	btnD
	JNE	bttn0	

	LDA buzzB	;B
	STA &FFD

	JMP	start
	
; Starting of button0 is from here
bttn0	LDA	&FF2
	SUB	btn0
	JNE	bttnB

	JMP reset

	JMP	start
	
; Starting of buttonB is from here
bttnB	LDA	&FF2
	SUB	btnB
	JNE	bttnC

	JMP	stop

	JMP	start
	

; Using button C for Playing music
; Pressing C plays the 3 lines of Never gonna give you up
; The tones are taken from internet and hard coded to play

bttnC	LDA	&FF2
	SUB	btnC
	JNE start

	LDA	dsply	; prints RICK on the display
	STA	&FFA
	
	LDA	dsply
	STA	&FF9
	
	LDA	dsplyR
	STA	&FF8
	
	LDA	dsplyI
	STA	&FF7
	
	LDA	dsplyC
	STA	&FF6
	
	LDA	dsplyK	; till this
	STA	&FF5

;Never gonna give you up
l52	LDA	&FF3
	SUB one
	JGE	l52

	LDA buzA0	;A
	STA &FFD

l53	LDA	&FF3	; This checks if the buzzer is playing or not
	SUB one		; If the buzzer is playing, it keeps looping till the value in FF3 is empty
	JGE	l53		; (The same thing is done multiple times in the following section. Thats why commented only once)

	LDA buzB0	;B
	STA &FFD

	LDA	dsplyR	; prints ROLLED	on the display
	STA	&FFA
	
	LDA	dsplyO
	STA	&FF9
	
	LDA	dsplyL
	STA	&FF8
	
	LDA	dsplyL
	STA	&FF7
	
	LDA	dsplyE
	STA	&FF6
	
	LDA	dsplyD	; till this
	STA	&FF5

l54	LDA	&FF3
	SUB one
	JGE	l54

	LDA buzD	;^D
	STA &FFD

l55	LDA	&FF3
	SUB one
	JGE	l55

	LDA buzB0	;B
	STA &FFD

l56	LDA	&FF3
	SUB one
	JGE	l56

	LDA buzF1	;^F
	STA &FFD

l57	LDA	&FF3
	SUB one
	JGE	l57
		
	LDA buzF1	;^F
	STA &FFD

l58	LDA	&FF3
	SUB one
	JGE	l58

	LDA buzE	;^E
	STA &FFD	

	LDA	dsply	; prints HEHE on the display
	STA	&FFA
	
	LDA	dsply
	STA	&FF9
	
	LDA	dsplyH
	STA	&FF8
	
	LDA	dsplyE
	STA	&FF7
	
	LDA	dsplyH
	STA	&FF6
	
	LDA	dsplyE	; till this
	STA	&FF5

;Never gonna let you down
l59	LDA	&FF3
	SUB one
	JGE	l59

	LDA buzA0	;A
	STA &FFD

l60	LDA	&FF3
	SUB one
	JGE	l60

	LDA buzB0	;B
	STA &FFD

l61	LDA	&FF3
	SUB one
	JGE	l61

	LDA buzD	;^D
	STA &FFD

l62	LDA	&FF3
	SUB one
	JGE	l62

	LDA buzB0	;B
	STA &FFD

l63	LDA	&FF3
	SUB one
	JGE	l63

	LDA buzE	;^E
	STA &FFD

l64	LDA	&FF3
	SUB one
	JGE	l64
		
	LDA buzE 	;^E
	STA &FFD

l65	LDA	&FF3
	SUB one
	JGE	l65

	LDA buzD	;^D
	STA &FFD

l66	LDA	&FF3
	SUB one
	JGE	l66

	LDA buzC1	;^C
	STA &FFD

l67	LDA	&FF3
	SUB one
	JGE	l67

	LDA buzB0	;B
	STA &FFD

	LDA	dsply	; prints SORRY on the display
	STA	&FFA
	
	LDA	dsplyS
	STA	&FF9
	
	LDA	dsplyO
	STA	&FF8
	
	LDA	dsplyR
	STA	&FF7
	
	LDA	dsplyR
	STA	&FF6
	
	LDA	dsplyY	; till this
	STA	&FF5

;Never gonna run around and desert you
l68	LDA	&FF3
	SUB one
	JGE	l68

	LDA buzA0	;A
	STA &FFD

l69	LDA	&FF3
	SUB one
	JGE	l69

	LDA buzB0	;B
	STA &FFD

l70	LDA	&FF3
	SUB one
	JGE	l70

	LDA buzD	;^D
	STA &FFD

l71	LDA	&FF3
	SUB one
	JGE	l71
		
	LDA buzB0	;B
	STA &FFD

l72	LDA	&FF3
	SUB one
	JGE	l72

	LDA buzD	;^D
	STA &FFD

l73	LDA	&FF3
	SUB one
	JGE	l73

	LDA buzE	;^E
	STA &FFD

l74	LDA	&FF3
	SUB one
	JGE	l74

	LDA buzC1	;^C#
	STA &FFD

l75	LDA	&FF3
	SUB one
	JGE	l75

	LDA buzA	;A
	STA &FFD

l76	LDA	&FF3
	SUB one
	JGE	l76
		
	LDA buzA	;A
	STA &FFD

l77	LDA	&FF3
	SUB one
	JGE	l77

	LDA buzE	;^E
	STA &FFD

l78	LDA	&FF3
	SUB one
	JGE	l78

	LDA buzD	;^D
	STA &FFD	

; This is the end of the song

; This is a self modifying code which branches to display HEY on the display
lbl4	LDA lbl4
	ADD offset
	ADD jmp_op
	STA	ret_adr
	JMP	shw_

	JMP	start


shw_	LDA	dsply	; Displays HEY
	STA	&FFA
	
	LDA	dsply
	STA	&FF9
	
	LDA	dsply
	STA	&FF8
	
	LDA	dsplyH
	STA	&FF7
	
	LDA	dsplyE
	STA	&FF6
	
	LDA	dsplyY
	STA	&FF5

	JMP ret_adr

	
; This is run if button 0 is pressed
stop    STP              ; STOP - HALT program
done    JMP done         ; Just in case stop instruction fails


; Defining the LED Lights
; &FFF
led	DEFW	&FFF
ledPRG	DEFW	&0001
ledPRA	DEFW	&0002
ledPRR	DEFW	&0004
ledPPR	DEFW	&0008
ledPPG	DEFW	&0010
ledUDG	DEFW	&0020
ledUDA	DEFW	&0040
ledUDR	DEFW	&0080
ledLRG	DEFW	&0100
ledLRA	DEFW	&0200
ledLRR	DEFW	&0400
ldRRGG	DEFW	&0180
ldAAAA	DEFW	&0240
ldGGRR	DEFW	&0420
ldAPL	DEFW	&0018
ldARL	DEFW	&0007
ldAUDL	DEFW	&00E0
ldALRL	DEFW	&0700


; Buzzers with lowest duration
; &FF3
buzz	DEFW	&FF3
buzzC	DEFW	&8140
buzzC1	DEFW	&8141
buzzD	DEFW	&8142
buzzD1	DEFW	&8143
buzzE	DEFW	&8144
buzzF	DEFW	&8145
buzzF1	DEFW	&8146
buzzG	DEFW	&8147
buzzG1	DEFW	&8148
buzzA	DEFW	&8149
buzzA1	DEFW	&814A
buzzB	DEFW	&814B
buzzC2	DEFW	&8150
buzzC21	DEFW	&8151
buzzD2	DEFW	&8152
buzzD21	DEFW	&8153

; Buzzers for the music with 0.5 second duration
; &FF3
buzC	DEFW	&8450
buzC1	DEFW	&8451
buzD	DEFW	&8452
buzD1	DEFW	&8453
buzE	DEFW	&8454
buzF	DEFW	&8455
buzF1	DEFW	&8456
buzG	DEFW	&8457
buzG1	DEFW	&8458
buzA	DEFW	&8459
buzA1	DEFW	&845A
buzB	DEFW	&845B
buzA0	DEFW	&8449
buzA01	DEFW	&844A
buzB0	DEFW	&844B


; Switches A - H
; &FF1
swtch	DEFW	&FF1
swA		DEFW	&0001
swB		DEFW	&0002
swC		DEFW	&0004
swD		DEFW	&0008
swE		DEFW	&0010
swF		DEFW	&0020
swG		DEFW	&0040
swH		DEFW	&0080


; Buttons 0 - F
; &FF2
btn0	DEFW	&0001
btn1	DEFW	&0002
btn2	DEFW	&0004
btn3	DEFW	&0008
btn4	DEFW	&0010
btn5	DEFW	&0020
btn6	DEFW	&0040
btn7	DEFW	&0080
btn8	DEFW	&0100
btn9	DEFW	&0200
btnA	DEFW	&0400
btnB	DEFW	&0800
btnC	DEFW	&1000
btnD	DEFW	&2000
btnE	DEFW	&4000
btnF	DEFW	&8000


; Simple buttons (The crossing ones)
; &FF0
sbtn	DEFW	&FF0
sbtn0	DEFW	&0001
sbtn1	DEFW	&0002
sbtn2	DEFW	&0004
sbtn3	DEFW	&0008


; Display Letters on the display
dsply_	DEFW	&0000
dsplyH	DEFW	&0001
dsplyL	DEFW	&0002
dsplyR	DEFW	&0003
dsplyI	DEFW	&0004
dsplyS	DEFW	&0005
dsplyK	DEFW	&0006
dsplyY	DEFW	&0007
dsplyO	DEFW	&0008
dsply	DEFW	&0009
dsplyA	DEFW	&000A
dsplyB	DEFW	&000B
dsplyC	DEFW	&000C
dsplyD	DEFW	&000D
dsplyE	DEFW	&000E
dsplyF	DEFW	&000F


; For the self modifying code
offset 	DEFW	&0005
jmp_op	DEFW	&4000
ret_adr	DEFW	&0000


; For the delay
delay 	DEFW 	&FFFF
one 	DEFW 	&0001


; Defined 0
zero	DEFW	&0000
