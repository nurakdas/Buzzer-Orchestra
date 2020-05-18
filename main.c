#include "stm32f05xxx.h"
#include "serial.h"
#include <stdio.h>
#include <stdlib.h>

#define F_CPU 48000000L

// The periods (T = 1/f) of all musical notes on the piano
// Feel free to copy and use them in your projects
#define A0  36364
#define Ad0 34223
#define B0  32396
#define C1  30578
#define Cd1 28862
#define D1  27242
#define Dd1 25713
#define E1  24270
#define F1  22907
#define Fd1 21622
#define G1  20409
#define Gd1 19263
#define A1  18182
#define Ad1 17161
#define B1  16198
#define C2  15289
#define Cd2 14431
#define D2  13621
#define Dd2 12856
#define E2  12135
#define F2  11454
#define Fd2 10811
#define G2  10204
#define Gd2 9632
#define A2  9091
#define Ad2 8581
#define B2  8099
#define C3  7645
#define Cd3 7216
#define D3  6811
#define Dd3 6428
#define E3  6067
#define F3  5727
#define Fd3 5406
#define G3  5102
#define Gd3 4816
#define A3  4545
#define Ad3 4290
#define B3  4050
#define C4  3822
#define Cd4 3608
#define D4  3405
#define Dd4 3214
#define E4  3034
#define F4  2864
#define Fd4 2703
#define G4  2551
#define Gd4 2408
#define A4  2273
#define Ad4 2145
#define B4  2025
#define C5  1911
#define Cd5 1804
#define D5  1703
#define Dd5 1607
#define E5  1517
#define F5  1432
#define Fd5 1351
#define G5  1276
#define Gd5 1204
#define A5  1136
#define Ad5 1073
#define B5  1012
#define C6  956
#define Cd6 902
#define D6  851
#define Dd6 804
#define E6  758
#define F6  716
#define Fd6 676
#define G6  638
#define Gd6 602
#define A6  568
#define Ad6 536
#define B6  506
#define C7  478
#define Cd7 451
#define D7  426
#define Dd7 401
#define E7  379
#define F7  358
#define Fd7 338
#define G7  319
#define Gd7 301
#define A7  284
#define Ad7 268
#define B7  253
#define C8  239

void delay(int dly)
{
	while( dly--);
}

void wait_1us(void) {
	// For SysTick info check the STM32F0xxx Cortex-M0 programming manual page 85.
	STK_RVR = (F_CPU/1000000L) - 1;  // set reload register, counter rolls over from zero, hence -1
	STK_CVR = 0; // load the SysTick counter
	STK_CSR = 0x05; // Bit 0: ENABLE, BIT 1: TICKINT, BIT 2:CLKSOURCE
	while((STK_CSR & BIT16)==0); // Bit 16 is the COUNTFLAG.  True when counter rolls over from zero.
	STK_CSR = 0x00; // Disable Systick counter
}

void waitus(int len) {
	while(len--) wait_1us();
}

// This is needed because waitus is capped at 255 (STM32F051 is a 16 bit architecture)
void waitustimer (int period) {
	int i = 0;
	int j = 0;
	if (period <= 255) {
		waitus(period);
	}
	else {
		j = period / 255;
		for (i = 0; i<j; i++)
			waitus(255);
		waitus(period % 255);
	}
}

void wait_1ms(void) {
	// For SysTick info check the STM32F0xxx Cortex-M0 programming manual page 85.
	STK_RVR = (F_CPU/1000L) - 1;  // set reload register, counter rolls over from zero, hence -1
	STK_CVR = 0; // load the SysTick counter
	STK_CSR = 0x05; // Bit 0: ENABLE, BIT 1: TICKINT, BIT 2:CLKSOURCE
	while((STK_CSR & BIT16)==0); // Bit 16 is the COUNTFLAG.  True when counter rolls over from zero.
	STK_CSR = 0x00; // Disable Systick counter
}

void waitms(int len) {
	while(len--) wait_1ms();
}

void buzzer1 (int period) {
	GPIOA_ODR |= 0x1; // PA0=1
	waitustimer(period/2);
	GPIOA_ODR &= ~(0x1); // PA0=0
	waitustimer(period/2);
}

void buzzer2 (int period) {
	GPIOB_ODR |= 0x2; // PB1=1
	waitustimer(period/2);
	GPIOB_ODR &= ~(0x2); // PB1=0
	waitustimer(period/2);
}

void buzzer3 (int period) {
	GPIOB_ODR |= 0x80; // PB7=1
	waitustimer(period/2);
	GPIOB_ODR &= ~(0x80); // PB7=0
	waitustimer(period/2);
}

void buzzer4 (int period) {
	GPIOA_ODR |= 0x8000; // PA15=1
	waitustimer(period/2);
	GPIOA_ODR &= ~(0x8000); // PA15=0
	waitustimer(period/2);
}

void buzzer5 (int period) {
	GPIOA_ODR |= 0x100; // PA8=1
	waitustimer(period/2);
	GPIOA_ODR &= ~(0x100); // PA8=0
	waitustimer(period/2);
}

void buzzermania (int period) {
	GPIOA_ODR |= 0x1; // PA0=1
	GPIOB_ODR |= 0x2; // PB1=1
	GPIOB_ODR |= 0x80; // PB7=1
	GPIOA_ODR |= 0x100; // PA8=1
	GPIOA_ODR |= 0x8000; // PA15=1
	waitustimer(period/2);
	GPIOA_ODR &= ~(0x1); // PA0=0
	GPIOB_ODR &= ~(0x2); // PB1=0
	GPIOB_ODR &= ~(0x80); // PB7=0
	GPIOA_ODR &= ~(0x8000); // PA15=0
	GPIOA_ODR &= ~(0x100); // PA8=0
	waitustimer(period/2);
}

void main(void)
{
	printf("\e[1;1H\e[2J"); // Clears the screen with each reboot/reset/restart
	char buff[3]; // buff[0]=user input, buff[1]=\, buff[2]=0
	int mode; // User input, equal to buff[0]
	int i;

	// Peripheral clock initialisation
	RCC_AHBENR |= 0x20000; // Peripheral clock enable for port A
	RCC_AHBENR |= 0x40000; // Periphreal clock enable for port B

	// Sound initialisation
	GPIOA_MODER |= 0x1; // Make pin PA0 (6) output
	GPIOB_MODER |= 0x4; // Make pin PB1 (15) output
	GPIOB_MODER |= 0x4000; // Make pin PB7 (30) output
	GPIOA_MODER |= 0x40000000; // Make pin PA15 (25) output
	GPIOA_MODER |= 0x10000; // Make pin PA8 (18) output
	
	waitms(500); // Wait for putty to start
	
	printf("\r\n"); // Used so that the text doesn't slip down with each reset
	printf("Please select your music piece:\r\n");
	printf("1) Beethoven - Symphony no. 5\r\n");
	printf("Enter 1: ");

	// scanf() substitute for STM32:
	// Puts the user input into the "buff" array, 
	// then puts the array content into the "mode" integer
	fflush(stdout);
	egets(buff, sizeof(buff)-1);
	printf("%s\r\n", buff);
	fflush(stdout);
	mode=atoi(buff);

	while(1)
	{
		if (mode == 1) {
		
			for (i = 0; i < 33; i++) {buzzer1(C5); buzzer2(C3);}
			for (i = 0; i < 33; i++) {buzzer1(Dd5); buzzer2(G3);}
			for (i = 0; i < 33; i++) {buzzer1(D5); buzzer2(F3);}
			for (i = 0; i < 33; i++) {buzzer1(Dd5); buzzer2(G3);}
			
			for (i = 0; i < 33; i++) {buzzer1(C4); buzzer2(Dd3);}
			for (i = 0; i < 33; i++) {buzzer1(Dd5); buzzer2(G3);}
			for (i = 0; i < 33; i++) {buzzer1(D5); buzzer2(F3);}
			for (i = 0; i < 33; i++) {buzzer1(Dd5); buzzer2(G3);}
			
		}
	}
}
