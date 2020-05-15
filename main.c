#include <stdio.h>
#include <stdlib.h>
#include <EFM8LB1.h>

#define SYSCLK 72000000L
#define BAUDRATE 115200L

#define BUZZER1 P2_1
#define BUZZER2 P3_7
#define BUZZER3 P0_1
#define BUZZER4 P1_0
#define BUZZER5 P2_0

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

#define C6 955
#define D6 864
#define E6 758
#define F6 715
#define G6 638
#define A6 568
#define B6 506
#define C7 478

char _c51_external_startup (void) {
	// Disable Watchdog with key sequence
	SFRPAGE = 0x00;
	WDTCN = 0xDE; //First key
	WDTCN = 0xAD; //Second key

	VDM0CN=0x80;       // enable VDD monitor
	RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD

	#if (SYSCLK == 48000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x10; // SYSCLK < 50 MHz.
		SFRPAGE = 0x00;
	#elif (SYSCLK == 72000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x20; // SYSCLK < 75 MHz.
		SFRPAGE = 0x00;
	#endif

	#if (SYSCLK == 12250000L)
		CLKSEL = 0x10;
		CLKSEL = 0x10;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 24500000L)
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 48000000L)
		// Before setting clock to 48 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x07;
		CLKSEL = 0x07;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 72000000L)
		// Before setting clock to 72 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x03;
		CLKSEL = 0x03;
		while ((CLKSEL & 0x80) == 0);
	#else
		#error SYSCLK must be either 12250000L, 24500000L, 48000000L, or 72000000L
	#endif

	P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)
	XBR1     = 0X00;
	XBR2     = 0x40; // Enable crossbar and weak pull-ups

	// Configure Uart 0
	#if (((SYSCLK/BAUDRATE)/(2L*12L))>0xFFL)
		#error Timer 0 reload value is incorrect because (SYSCLK/BAUDRATE)/(2L*12L) > 0xFF
	#endif
	SCON0 = 0x10;
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready

	// Initialize timer 2 for periodic interrupts
	TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	TMR2RL=(0x10000L-7200L); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2 (TMR2CN is bit addressable)

	EA=1; // Enable interrupts

	return 0;
}

void Timer3us(unsigned char us) {
	unsigned char i;               // usec counter

	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON0:
	CKCON0|=0b_0100_0000;

	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow

	TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++) {       // Count <us> overflows
		while (!(TMR3CN0 & 0x80));  // Wait for overflow
		TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
}

void waitus (int period) {
	int i = 0;
	int j = 0;
	if (period <= 255) {
		Timer3us(period);
	}
	else {
		j = period / 255;
		for (i = 0; i<j; i++) {
			Timer3us(255);
		}
		Timer3us(period % 255);
	}
}

void waitms (unsigned int ms) {
	unsigned int j;
	unsigned char k;
	for(j=0; j<ms; j++)
		for (k=0; k<4; k++) Timer3us(250);
}

void initsound () {
  P2MDOUT |=0b00000010;
  P2MDIN &=0b11111101;
  BUZZER1=1;

	P3MDOUT |=0b10000000;
	P3MDIN &=0b01111111;
	BUZZER2=1;

  P0MDOUT |=0b00000010;
  P0MDIN &=0b11111101;
  BUZZER3=1;

  P1MDOUT |=0b00000001;
  P1MDIN &=0b11111110;
  BUZZER4=1;

  P2MDOUT |=0b00000001;
  P2MDIN &=0b11111110;
  BUZZER5=1;
}

void buzz1 (int period) {
	BUZZER1 = 1;
	waitus(period);
	BUZZER1 = 0;
	waitus(period);
}

void buzz2 (int period) {
	BUZZER2 = 1;
	waitus(period);
	BUZZER2 = 0;
	waitus(period);
}

void buzz3 (int period) {
	BUZZER3 = 1;
	waitus(period);
	BUZZER3 = 0;
	waitus(period);
}

void buzz4 (int period) {
	BUZZER4 = 1;
	waitus(period);
	BUZZER4 = 0;
	waitus(period);
}

void buzz5 (int period) {
	BUZZER5 = 1;
	waitus(period);
	BUZZER5 = 0;
	waitus(period);
}

void main () {

  initsound();
  int note = E6;

  while (1) {


  }

}
