/*
 * LEDblink.c
 * by Mark Hawes
 * 
 * Takes in a user input to blink out in morse code.
 * 
 * Uses the wiringPi library in order to output to GPIO
 */ 

#include <stdio.h>
#include <string.h>
#include <wiringPi.h>

// change this to change GPIO pin to use
#define PIN		0


/*
 * turn pin on
 */
 void on(int onFor)
 {
	 digitalWrite(PIN, HIGH);
	 delay(onFor * 1000); // on for x seconds
 } 
 
 /*
  * turn pin off for duration
  */ 
 void off(int offFor)
 {
	 digitalWrite(PIN, LOW);
	 delay(offFor * 1000); // off for x seconds
 }


/*
 * blinkLED takes in a character in order to blink and LED in morse code.
 * 
 * *** This method does not care about letter case ***
 */ 
void blinkLED(char toOut)
{
	// time declarations
	int ONE = 1;
	int THREE = 3;
	int FOUR = 4;
	
	//setup pins for output
	wiringPiSetup();
	pinMode(PIN,OUTPUT);
	
	switch(toOut)
	{
		case 'a': case 'A':
		on(ONE);
		off(ONE);
		on(THREE);
		break;
		case 'b': case 'B':
		on(THREE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(ONE);
		break;
		case 'c': case 'C':
		on(THREE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(ONE);
		break;
		case 'd': case 'D':
		on(THREE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(ONE);
		break;
		case 'e': case 'E':
		on(ONE);
		off(ONE);
		break;
		case 'f': case 'F':
		on(ONE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(ONE);
		break;
		case 'g': case 'G':
		on(THREE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(ONE);
		break;
		case 'h': case 'H':
		on(ONE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(ONE);
		break;
		case 'i': case 'I':
		on(ONE);
		off(ONE);
		on(ONE);
		break;
		case 'j': case 'J':
		on(ONE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(THREE);
		break;
		case 'k': case 'K':
		on(THREE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(THREE);
		break;
		case 'l': case 'L':
		on(ONE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(ONE);
		break;
		case 'm': case 'M':
		on(THREE);
		off(ONE);
		on(THREE);
		break;
		case 'n': case 'N':
		on(THREE);
		off(ONE);
		on(ONE);
		break;
		case 'o': case 'O':
		on(THREE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(THREE);
		break;
		case 'p': case 'P':
		on(ONE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(ONE);
		break;
		case 'q': case 'Q':
		on(THREE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(THREE);
		break;
		case 'r': case 'R':
		on(ONE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(ONE);
		break;
		case 's': case 'S':
		on(ONE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(ONE);
		break;
		case 't': case 'T':
		on(THREE);
		break;
		case 'u': case 'U':
		on(ONE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(THREE);
		break;
		case 'v': case 'V':
		on(ONE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(THREE);
		break;
		case 'w': case 'W':
		on(ONE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(THREE);
		break;
		case 'x': case 'X':
		on(THREE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(THREE);
		break;
		case 'y': case 'Y':
		on(THREE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(THREE);
		break;
		case 'z': case 'Z':
		on(THREE);
		off(ONE);
		on(THREE);
		off(ONE);
		on(ONE);
		off(ONE);
		on(ONE);
		break;
		case ' ':
		// space says only hold for four as three are already added
		// at end of method
		off(FOUR);
		break;
	} // end switch
	
	// off for 3 seconds - the downtime between letters
	off(THREE);
} // end blinkLED


int main()
{
	// char array for user name
	char name[256];
	
	// get user name
	printf("Enter input to blink out in morse code(255 characters): ");
	fgets(name, 256, stdin);
	
	// create needed variables for for loop
	int len = strlen(name);\
	int i;
	
	// loop through character array in order to blink out users input
	for(i = 0; i < len; i++)
	{
		// test print
		//printf("%c", name[i]);
		
		// sends letter to be blinked in morse code
		blinkLED(name[i]);
	} // end for
	
	
	return 0;
} // end main

