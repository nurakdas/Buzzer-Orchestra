#include "stm32f05xxx.h"
#include "serial.h"
#include <stdio.h>
#include <stdlib.h>

#define F_CPU 48000000L

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

void delay(int dly)
{
	while( dly--);
}

char HexDigit[]="0123456789ABCDEF";
void PrintNumber(int N, int Base, int digits)
{
	int j;
	#define NBITS 32
	char buff[NBITS+1];
	buff[NBITS]=0;

	j=NBITS-1;
	while ( (N>0) | (digits>0) )
	{
		buff[j--]=HexDigit[N%Base];
		N/=Base;
		if(digits!=0) digits--;
	}
	eputs(&buff[j+1]);
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

void wait_1ms(void)
{
	// For SysTick info check the STM32F0xxx Cortex-M0 programming manual page 85.
	STK_RVR = (F_CPU/1000L) - 1;  // set reload register, counter rolls over from zero, hence -1
	STK_CVR = 0; // load the SysTick counter
	STK_CSR = 0x05; // Bit 0: ENABLE, BIT 1: TICKINT, BIT 2:CLKSOURCE
	while((STK_CSR & BIT16)==0); // Bit 16 is the COUNTFLAG.  True when counter rolls over from zero.
	STK_CSR = 0x00; // Disable Systick counter
}

void waitms(int len)
{
	while(len--) wait_1ms();
}

void music (int period) {
	GPIOA_ODR |= 0x1; // PA0=1
	waitustimer(period/2);
	GPIOA_ODR &= ~(0x1); // PA0=0
	waitustimer(period/2);
}

void beethoven (int timerlimit) {
	int i;
	for (i = 0; i < timerlimit; i++)
		music(G4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(G4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(G4);
	waitms(1);
	for (i = 0; i < 4*timerlimit; i++)
		music(Dd4);
	waitms(1);
	for (i = 0; i < timerlimit; i++) {}
	for (i = 0; i < timerlimit; i++)
		music(F4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(F4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(F4);
	waitms(1);
	for (i = 0; i < 4*timerlimit; i++)
		music(D4);
	waitms(1);
	for (i = 0; i < timerlimit; i++) {}
	for (i = 0; i < timerlimit; i++)
		music(G4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(G4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(G4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(Dd4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(Gd4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(Gd4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(Gd4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(G4);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(Dd5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(Dd5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(Dd5);
	waitms(1);
	for (i = 0; i < 4*timerlimit; i++)
		music(C5);
	waitms(1);
	for (i = 0; i < timerlimit; i++) {}
	for (i = 0; i < timerlimit; i++)
		music(G4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(G4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(G4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(D4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(Gd4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(Gd4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(Gd4);
	waitms(1);
	for (i = 0; i < timerlimit; i++)
		music(G4);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(F5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(F5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(F5);
	waitms(1);
	for (i = 0; i < 6*timerlimit; i++)
		music(D5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++) {}
	for (i = 0; i < 2*timerlimit; i++)
		music(G5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(G5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(F5);
	waitms(1);
	for (i = 0; i < 8*timerlimit; i++)
		music(Dd5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++) {}
	for (i = 0; i < 2*timerlimit; i++)
		music(G5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(G5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(F5);
	waitms(1);
	for (i = 0; i < 8*timerlimit; i++)
		music(Dd5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++) {}
	for (i = 0; i < 2*timerlimit; i++)
		music(G5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(G5);
	waitms(1);
	for (i = 0; i < 2*timerlimit; i++)
		music(F5);
	waitms(1);
	for (i = 0; i < 8*timerlimit; i++)
		music(Dd5);
	waitms(1);
	for (i = 0; i < 8*timerlimit; i++) {}
	for (i = 0; i < 8*timerlimit; i++)
		music(C5);
	waitms(1);
	for (i = 0; i < 8*timerlimit; i++) {}
	for (i = 0; i < 16*timerlimit; i++)
		music(G5);
	waitms(1);
	for (i = 0; i < 16*timerlimit; i++) {}
}

void buzzer1 (int period) {
	GPIOA_ODR |= 0x1; // PA0=1
	waitustimer(period/2);
	GPIOA_ODR &= ~(0x1); // PA0=0
	waitustimer(period/2);
}

void buzzer2 (int period) {
	GPIOB_ODR |= 0x4; // PB2=1
	waitustimer(period/2);
	GPIOB_ODR &= ~(0x4); // PB2=0
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

void main(void)
{
	printf("\e[1;1H\e[2J"); // Clears the screen with each reboot/reset/restart
	char buff[3], notebuff[3], freqbuff[32];
	int mode;
	int customt = 0;
	int timerlimit = 33;
	notebuff[0] = '0';

	// Peripheral clock initialisation
	RCC_AHBENR |= 0x20000; // peripheral clock enable for port A
	RCC_AHBENR |= 0x40000; // periphreal clock enable for port B

	/*
	// Information here: http://hertaville.com/stm32f0-gpio-tutorial-part-1.html
	GPIOA_MODER &= ~(BIT16 | BIT17); // Make pin PA8 input
	// Activate pull up for pin PA8:
	GPIOA_PUPDR |= BIT16;
	GPIOA_PUPDR &= ~(BIT17);
	*/

	// Sound initialisation
	GPIOA_MODER |= 0x1; // Make pin PA0 (6) output
	GPIOB_MODER |= 0x10; // Make pin PB2 (16) output
	GPIOB_MODER |= 0x4000; // Make pin PB7 (30) output
	GPIOA_MODER |= 0x40000000; // Make pin PA15 (25) output
	GPIOA_MODER |= 0x10000; // Make pin PA8 (18) output
	waitms(500); // Wait for putty to start

	printf("\r\n");
	printf("Please select your music piece:\r\n");
	printf("1) Beethoven - Symphony no. 5\r\n");
	printf("Enter 1: ");

	fflush(stdout);
	egets(buff, sizeof(buff)-1);
	printf("%s\r\n", buff);
	fflush(stdout);
	mode=atoi(buff);

	while(1)
	{
		//beethoven(timerlimit);
		//buzzer1(G4);
		buzzer4(G4);
	}
}
