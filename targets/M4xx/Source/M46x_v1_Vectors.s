/*****************************************************************************
 * Copyright (c) 2023 Rowley Associates Limited.                             *
 *                                                                           *
 * This file may be distributed under the terms of the License Agreement     *
 * provided with this software.                                              *
 *                                                                           *
 * THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND, INCLUDING THE   *
 * WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. *
 *                                                                           *
 *****************************************************************************/

/*****************************************************************************
 *                         Preprocessor Definitions                          *
 *                         ------------------------                          *
 * STARTUP_FROM_RESET                                                        *
 *                                                                           *
 *   If defined, the program will startup from power-on/reset. If not        *
 *   defined the program will just loop endlessly from power-on/reset.       *
 *                                                                           *
 * VECTORS_IN_RAM                                                            *
 *                                                                           *
 *   If defined, an area of RAM will large enough to store the vector table  *
 *   will be reserved.                                                       *
 *                                                                           *
 *****************************************************************************/

  .syntax unified
  .code 16

  .section .init, "ax"
  .balign 4

/*****************************************************************************
 * Default Exception Handlers                                                *
 *****************************************************************************/

#ifndef STARTUP_FROM_RESET

  .thumb_func
  .weak Reset_Wait
Reset_Wait:
  b .

#endif

  .thumb_func
  .weak NMI_Handler
NMI_Handler:
  b .

  .thumb_func
  .weak HardFault_Handler
HardFault_Handler:
  b .

  .thumb_func
  .weak MemManage_Handler
MemManage_Handler:
  b .

  .thumb_func
  .weak BusFault_Handler
BusFault_Handler:
  b .

  .thumb_func
  .weak UsageFault_Handler
UsageFault_Handler:
  b .

  .thumb_func
  .weak SVC_Handler
SVC_Handler:
  b .

  .thumb_func
  .weak DebugMon_Handler
DebugMon_Handler:
  b .

  .thumb_func
  .weak PendSV_Handler
PendSV_Handler:
  b .

  .thumb_func
  .weak SysTick_Handler
SysTick_Handler:
  b .

  .thumb_func
Dummy_Handler:
  b .

#if defined(__OPTIMIZATION_SMALL)

  .weak BOD_IRQHandler
  .thumb_set BOD_IRQHandler,Dummy_Handler

  .weak IRC_IRQHandler
  .thumb_set IRC_IRQHandler,Dummy_Handler

  .weak PWRWU_IRQHandler
  .thumb_set PWRWU_IRQHandler,Dummy_Handler

  .weak RAMPE_IRQHandler
  .thumb_set RAMPE_IRQHandler,Dummy_Handler

  .weak CKFAIL_IRQHandler
  .thumb_set CKFAIL_IRQHandler,Dummy_Handler

  .weak RTC_IRQHandler
  .thumb_set RTC_IRQHandler,Dummy_Handler

  .weak TAMPER_IRQHandler
  .thumb_set TAMPER_IRQHandler,Dummy_Handler

  .weak WDT_IRQHandler
  .thumb_set WDT_IRQHandler,Dummy_Handler

  .weak WWDT_IRQHandler
  .thumb_set WWDT_IRQHandler,Dummy_Handler

  .weak EINT0_IRQHandler
  .thumb_set EINT0_IRQHandler,Dummy_Handler

  .weak EINT1_IRQHandler
  .thumb_set EINT1_IRQHandler,Dummy_Handler

  .weak EINT2_IRQHandler
  .thumb_set EINT2_IRQHandler,Dummy_Handler

  .weak EINT3_IRQHandler
  .thumb_set EINT3_IRQHandler,Dummy_Handler

  .weak EINT4_IRQHandler
  .thumb_set EINT4_IRQHandler,Dummy_Handler

  .weak EINT5_IRQHandler
  .thumb_set EINT5_IRQHandler,Dummy_Handler

  .weak GPA_IRQHandler
  .thumb_set GPA_IRQHandler,Dummy_Handler

  .weak GPB_IRQHandler
  .thumb_set GPB_IRQHandler,Dummy_Handler

  .weak GPC_IRQHandler
  .thumb_set GPC_IRQHandler,Dummy_Handler

  .weak GPD_IRQHandler
  .thumb_set GPD_IRQHandler,Dummy_Handler

  .weak GPE_IRQHandler
  .thumb_set GPE_IRQHandler,Dummy_Handler

  .weak GPF_IRQHandler
  .thumb_set GPF_IRQHandler,Dummy_Handler

  .weak QSPI0_IRQHandler
  .thumb_set QSPI0_IRQHandler,Dummy_Handler

  .weak SPI0_IRQHandler
  .thumb_set SPI0_IRQHandler,Dummy_Handler

  .weak BRAKE0_IRQHandler
  .thumb_set BRAKE0_IRQHandler,Dummy_Handler

  .weak EPWM0P0_IRQHandler
  .thumb_set EPWM0P0_IRQHandler,Dummy_Handler

  .weak EPWM0P1_IRQHandler
  .thumb_set EPWM0P1_IRQHandler,Dummy_Handler

  .weak EPWM0P2_IRQHandler
  .thumb_set EPWM0P2_IRQHandler,Dummy_Handler

  .weak BRAKE1_IRQHandler
  .thumb_set BRAKE1_IRQHandler,Dummy_Handler

  .weak EPWM1P0_IRQHandler
  .thumb_set EPWM1P0_IRQHandler,Dummy_Handler

  .weak EPWM1P1_IRQHandler
  .thumb_set EPWM1P1_IRQHandler,Dummy_Handler

  .weak EPWM1P2_IRQHandler
  .thumb_set EPWM1P2_IRQHandler,Dummy_Handler

  .weak TMR0_IRQHandler
  .thumb_set TMR0_IRQHandler,Dummy_Handler

  .weak TMR1_IRQHandler
  .thumb_set TMR1_IRQHandler,Dummy_Handler

  .weak TMR2_IRQHandler
  .thumb_set TMR2_IRQHandler,Dummy_Handler

  .weak TMR3_IRQHandler
  .thumb_set TMR3_IRQHandler,Dummy_Handler

  .weak UART0_IRQHandler
  .thumb_set UART0_IRQHandler,Dummy_Handler

  .weak UART1_IRQHandler
  .thumb_set UART1_IRQHandler,Dummy_Handler

  .weak I2C0_IRQHandler
  .thumb_set I2C0_IRQHandler,Dummy_Handler

  .weak I2C1_IRQHandler
  .thumb_set I2C1_IRQHandler,Dummy_Handler

  .weak PDMA_IRQHandler
  .thumb_set PDMA_IRQHandler,Dummy_Handler

  .weak DAC_IRQHandler
  .thumb_set DAC_IRQHandler,Dummy_Handler

  .weak EADC00_IRQHandler
  .thumb_set EADC00_IRQHandler,Dummy_Handler

  .weak EADC01_IRQHandler
  .thumb_set EADC01_IRQHandler,Dummy_Handler

  .weak ACMP01_IRQHandler
  .thumb_set ACMP01_IRQHandler,Dummy_Handler

  .weak EADC02_IRQHandler
  .thumb_set EADC02_IRQHandler,Dummy_Handler

  .weak EADC03_IRQHandler
  .thumb_set EADC03_IRQHandler,Dummy_Handler

  .weak UART2_IRQHandler
  .thumb_set UART2_IRQHandler,Dummy_Handler

  .weak UART3_IRQHandler
  .thumb_set UART3_IRQHandler,Dummy_Handler

  .weak QSPI1_IRQHandler
  .thumb_set QSPI1_IRQHandler,Dummy_Handler

  .weak SPI1_IRQHandler
  .thumb_set SPI1_IRQHandler,Dummy_Handler

  .weak SPI2_IRQHandler
  .thumb_set SPI2_IRQHandler,Dummy_Handler

  .weak USBD_IRQHandler
  .thumb_set USBD_IRQHandler,Dummy_Handler

  .weak OHCI_IRQHandler
  .thumb_set OHCI_IRQHandler,Dummy_Handler

  .weak USBOTG_IRQHandler
  .thumb_set USBOTG_IRQHandler,Dummy_Handler

  .weak CAN0_IRQHandler
  .thumb_set CAN0_IRQHandler,Dummy_Handler

  .weak CAN1_IRQHandler
  .thumb_set CAN1_IRQHandler,Dummy_Handler

  .weak SC0_IRQHandler
  .thumb_set SC0_IRQHandler,Dummy_Handler

  .weak SC1_IRQHandler
  .thumb_set SC1_IRQHandler,Dummy_Handler

  .weak SC2_IRQHandler
  .thumb_set SC2_IRQHandler,Dummy_Handler

  .weak SPI3_IRQHandler
  .thumb_set SPI3_IRQHandler,Dummy_Handler

  .weak SDH0_IRQHandler
  .thumb_set SDH0_IRQHandler,Dummy_Handler

  .weak USBD20_IRQHandler
  .thumb_set USBD20_IRQHandler,Dummy_Handler

  .weak EMAC_TX_IRQHandler
  .thumb_set EMAC_TX_IRQHandler,Dummy_Handler

  .weak EMAC_RX_IRQHandler
  .thumb_set EMAC_RX_IRQHandler,Dummy_Handler

  .weak I2S0_IRQHandler
  .thumb_set I2S0_IRQHandler,Dummy_Handler

  .weak OPA0_IRQHandler
  .thumb_set OPA0_IRQHandler,Dummy_Handler

  .weak CRYPTO_IRQHandler
  .thumb_set CRYPTO_IRQHandler,Dummy_Handler

  .weak GPG_IRQHandler
  .thumb_set GPG_IRQHandler,Dummy_Handler

  .weak EINT6_IRQHandler
  .thumb_set EINT6_IRQHandler,Dummy_Handler

  .weak UART4_IRQHandler
  .thumb_set UART4_IRQHandler,Dummy_Handler

  .weak UART5_IRQHandler
  .thumb_set UART5_IRQHandler,Dummy_Handler

  .weak USCI0_IRQHandler
  .thumb_set USCI0_IRQHandler,Dummy_Handler

  .weak USCI1_IRQHandler
  .thumb_set USCI1_IRQHandler,Dummy_Handler

  .weak BPWM0_IRQHandler
  .thumb_set BPWM0_IRQHandler,Dummy_Handler

  .weak BPWM1_IRQHandler
  .thumb_set BPWM1_IRQHandler,Dummy_Handler

  .weak SPIM_IRQHandler
  .thumb_set SPIM_IRQHandler,Dummy_Handler

  .weak CCAP_IRQHandler
  .thumb_set CCAP_IRQHandler,Dummy_Handler

  .weak I2C2_IRQHandler
  .thumb_set I2C2_IRQHandler,Dummy_Handler

  .weak QEI0_IRQHandler
  .thumb_set QEI0_IRQHandler,Dummy_Handler

  .weak QEI1_IRQHandler
  .thumb_set QEI1_IRQHandler,Dummy_Handler

  .weak ECAP0_IRQHandler
  .thumb_set ECAP0_IRQHandler,Dummy_Handler

  .weak ECAP1_IRQHandler
  .thumb_set ECAP1_IRQHandler,Dummy_Handler

  .weak GPH_IRQHandler
  .thumb_set GPH_IRQHandler,Dummy_Handler

  .weak EINT7_IRQHandler
  .thumb_set EINT7_IRQHandler,Dummy_Handler

  .weak SDH1_IRQHandler
  .thumb_set SDH1_IRQHandler,Dummy_Handler

  .weak EHCI_IRQHandler
  .thumb_set EHCI_IRQHandler,Dummy_Handler

  .weak USBOTG20_IRQHandler
  .thumb_set USBOTG20_IRQHandler,Dummy_Handler

  .weak TRNG_IRQHandler
  .thumb_set TRNG_IRQHandler,Dummy_Handler

  .weak UART6_IRQHandler
  .thumb_set UART6_IRQHandler,Dummy_Handler

  .weak UART7_IRQHandler
  .thumb_set UART7_IRQHandler,Dummy_Handler

  .weak EADC10_IRQHandler
  .thumb_set EADC10_IRQHandler,Dummy_Handler

  .weak EADC11_IRQHandler
  .thumb_set EADC11_IRQHandler,Dummy_Handler

  .weak EADC12_IRQHandler
  .thumb_set EADC12_IRQHandler,Dummy_Handler

  .weak EADC13_IRQHandler
  .thumb_set EADC13_IRQHandler,Dummy_Handler

  .weak CAN2_IRQHandler
  .thumb_set CAN2_IRQHandler,Dummy_Handler

#else

  .thumb_func
  .weak BOD_IRQHandler
BOD_IRQHandler:
  b .

  .thumb_func
  .weak IRC_IRQHandler
IRC_IRQHandler:
  b .

  .thumb_func
  .weak PWRWU_IRQHandler
PWRWU_IRQHandler:
  b .

  .thumb_func
  .weak RAMPE_IRQHandler
RAMPE_IRQHandler:
  b .

  .thumb_func
  .weak CKFAIL_IRQHandler
CKFAIL_IRQHandler:
  b .

  .thumb_func
  .weak RTC_IRQHandler
RTC_IRQHandler:
  b .

  .thumb_func
  .weak TAMPER_IRQHandler
TAMPER_IRQHandler:
  b .

  .thumb_func
  .weak WDT_IRQHandler
WDT_IRQHandler:
  b .

  .thumb_func
  .weak WWDT_IRQHandler
WWDT_IRQHandler:
  b .

  .thumb_func
  .weak EINT0_IRQHandler
EINT0_IRQHandler:
  b .

  .thumb_func
  .weak EINT1_IRQHandler
EINT1_IRQHandler:
  b .

  .thumb_func
  .weak EINT2_IRQHandler
EINT2_IRQHandler:
  b .

  .thumb_func
  .weak EINT3_IRQHandler
EINT3_IRQHandler:
  b .

  .thumb_func
  .weak EINT4_IRQHandler
EINT4_IRQHandler:
  b .

  .thumb_func
  .weak EINT5_IRQHandler
EINT5_IRQHandler:
  b .

  .thumb_func
  .weak GPA_IRQHandler
GPA_IRQHandler:
  b .

  .thumb_func
  .weak GPB_IRQHandler
GPB_IRQHandler:
  b .

  .thumb_func
  .weak GPC_IRQHandler
GPC_IRQHandler:
  b .

  .thumb_func
  .weak GPD_IRQHandler
GPD_IRQHandler:
  b .

  .thumb_func
  .weak GPE_IRQHandler
GPE_IRQHandler:
  b .

  .thumb_func
  .weak GPF_IRQHandler
GPF_IRQHandler:
  b .

  .thumb_func
  .weak QSPI0_IRQHandler
QSPI0_IRQHandler:
  b .

  .thumb_func
  .weak SPI0_IRQHandler
SPI0_IRQHandler:
  b .

  .thumb_func
  .weak BRAKE0_IRQHandler
BRAKE0_IRQHandler:
  b .

  .thumb_func
  .weak EPWM0P0_IRQHandler
EPWM0P0_IRQHandler:
  b .

  .thumb_func
  .weak EPWM0P1_IRQHandler
EPWM0P1_IRQHandler:
  b .

  .thumb_func
  .weak EPWM0P2_IRQHandler
EPWM0P2_IRQHandler:
  b .

  .thumb_func
  .weak BRAKE1_IRQHandler
BRAKE1_IRQHandler:
  b .

  .thumb_func
  .weak EPWM1P0_IRQHandler
EPWM1P0_IRQHandler:
  b .

  .thumb_func
  .weak EPWM1P1_IRQHandler
EPWM1P1_IRQHandler:
  b .

  .thumb_func
  .weak EPWM1P2_IRQHandler
EPWM1P2_IRQHandler:
  b .

  .thumb_func
  .weak TMR0_IRQHandler
TMR0_IRQHandler:
  b .

  .thumb_func
  .weak TMR1_IRQHandler
TMR1_IRQHandler:
  b .

  .thumb_func
  .weak TMR2_IRQHandler
TMR2_IRQHandler:
  b .

  .thumb_func
  .weak TMR3_IRQHandler
TMR3_IRQHandler:
  b .

  .thumb_func
  .weak UART0_IRQHandler
UART0_IRQHandler:
  b .

  .thumb_func
  .weak UART1_IRQHandler
UART1_IRQHandler:
  b .

  .thumb_func
  .weak I2C0_IRQHandler
I2C0_IRQHandler:
  b .

  .thumb_func
  .weak I2C1_IRQHandler
I2C1_IRQHandler:
  b .

  .thumb_func
  .weak PDMA0_IRQHandler
PDMA0_IRQHandler:
  b .

  .thumb_func
  .weak PDMA1_IRQHandler
PDMA1_IRQHandler:
  b .

  .thumb_func
  .weak DAC_IRQHandler
DAC_IRQHandler:
  b .

  .thumb_func
  .weak EADC00_IRQHandler
EADC00_IRQHandler:
  b .

  .thumb_func
  .weak EADC01_IRQHandler
EADC01_IRQHandler:
  b .

  .thumb_func
  .weak ACMP01_IRQHandler
ACMP01_IRQHandler:
  b .

  .thumb_func
  .weak EADC02_IRQHandler
EADC02_IRQHandler:
  b .

  .thumb_func
  .weak EADC03_IRQHandler
EADC03_IRQHandler:
  b .

  .thumb_func
  .weak UART2_IRQHandler
UART2_IRQHandler:
  b .

  .thumb_func
  .weak UART3_IRQHandler
UART3_IRQHandler:
  b .

  .thumb_func
  .weak QSPI1_IRQHandler
QSPI1_IRQHandler:
  b .

  .thumb_func
  .weak SPI1_IRQHandler
SPI1_IRQHandler:
  b .

  .thumb_func
  .weak SPI2_IRQHandler
SPI2_IRQHandler:
  b .

  .thumb_func
  .weak USBD_IRQHandler
USBD_IRQHandler:
  b .

  .thumb_func
  .weak OHCI_IRQHandler
OHCI_IRQHandler:
  b .

  .thumb_func
  .weak USBOTG_IRQHandler
USBOTG_IRQHandler:
  b .

  .thumb_func
  .weak CAN0_IRQHandler
CAN0_IRQHandler:
  b .

  .thumb_func
  .weak CAN1_IRQHandler
CAN1_IRQHandler:
  b .

  .thumb_func
  .weak SC0_IRQHandler
SC0_IRQHandler:
  b .

  .thumb_func
  .weak SC1_IRQHandler
SC1_IRQHandler:
  b .

  .thumb_func
  .weak SC2_IRQHandler
SC2_IRQHandler:
  b .

  .thumb_func
  .weak SPI3_IRQHandler
SPI3_IRQHandler:
  b .

  .thumb_func
  .weak SDH0_IRQHandler
SDH0_IRQHandler:
  b .

  .thumb_func
  .weak USBD20_IRQHandler
USBD20_IRQHandler:
  b .

  .thumb_func
  .weak EMAC_TX_IRQHandler
EMAC_TX_IRQHandler:
  b .

  .thumb_func
  .weak EMAC_RX_IRQHandler
EMAC_RX_IRQHandler:
  b .

  .thumb_func
  .weak I2S0_IRQHandler
I2S0_IRQHandler:
  b .

  .thumb_func
  .weak OPA0_IRQHandler
OPA0_IRQHandler:
  b .

  .thumb_func
  .weak CRYPTO_IRQHandler
CRYPTO_IRQHandler:
  b .

  .thumb_func
  .weak GPG_IRQHandler
GPG_IRQHandler:
  b .

  .thumb_func
  .weak EINT6_IRQHandler
EINT6_IRQHandler:
  b .

  .thumb_func
  .weak UART4_IRQHandler
UART4_IRQHandler:
  b .

  .thumb_func
  .weak UART5_IRQHandler
UART5_IRQHandler:
  b .

  .thumb_func
  .weak USCI0_IRQHandler
USCI0_IRQHandler:
  b .

  .thumb_func
  .weak USCI1_IRQHandler
USCI1_IRQHandler:
  b .

  .thumb_func
  .weak BPWM0_IRQHandler
BPWM0_IRQHandler:
  b .

  .thumb_func
  .weak BPWM1_IRQHandler
BPWM1_IRQHandler:
  b .

  .thumb_func
  .weak SPIM_IRQHandler
SPIM_IRQHandler:
  b .

  .thumb_func
  .weak CCAP_IRQHandler
CCAP_IRQHandler:
  b .

  .thumb_func
  .weak I2C2_IRQHandler
I2C2_IRQHandler:
  b .

  .thumb_func
  .weak QEI0_IRQHandler
QEI0_IRQHandler:
  b .

  .thumb_func
  .weak QEI1_IRQHandler
QEI1_IRQHandler:
  b .

  .thumb_func
  .weak ECAP0_IRQHandler
ECAP0_IRQHandler:
  b .

  .thumb_func
  .weak ECAP1_IRQHandler
ECAP1_IRQHandler:
  b .

  .thumb_func
  .weak GPH_IRQHandler
GPH_IRQHandler:
  b .

  .thumb_func
  .weak EINT7_IRQHandler
EINT7_IRQHandler:
  b .

  .thumb_func
  .weak SDH1_IRQHandler
SDH1_IRQHandler:
  b .

  .thumb_func
  .weak EHCI_IRQHandler
EHCI_IRQHandler:
  b .

  .thumb_func
  .weak USBOTG20_IRQHandler
USBOTG20_IRQHandler:
  b .

  .thumb_func
  .weak TRNG_IRQHandler
TRNG_IRQHandler:
  b .

  .thumb_func
  .weak UART6_IRQHandler
UART6_IRQHandler:
  b .

  .thumb_func
  .weak UART7_IRQHandler
UART7_IRQHandler:
  b .

  .thumb_func
  .weak EADC10_IRQHandler
EADC10_IRQHandler:
  b .

  .thumb_func
  .weak EADC11_IRQHandler
EADC11_IRQHandler:
  b .

  .thumb_func
  .weak EADC12_IRQHandler
EADC12_IRQHandler:
  b .

  .thumb_func
  .weak EADC13_IRQHandler
EADC13_IRQHandler:
  b .

  .thumb_func
  .weak CAN2_IRQHandler
CAN2_IRQHandler:
  b .

  .thumb_func
  .weak ACMP23_IRQHandler
ACMP23_IRQHandler:
  b .

  .thumb_func
  .weak BMC_IRQHandler
BMC_IRQHandler:
  b .

  .thumb_func
  .weak SPI5_IRQHandler
SPI5_IRQHandler:
  b .

  .thumb_func
  .weak GPJ_IRQHandler
GPJ_IRQHandler:
  b .

  .thumb_func
  .weak SPI4_IRQHandler
SPI4_IRQHandler:
  b .

  .thumb_func
  .weak EMAC0_IRQHandler
EMAC0_IRQHandler:
  b .

  .thumb_func
  .weak Default_Handler
Default_Handler:
  b .

  .thumb_func
  .weak I2S1_IRQHandler
I2S1_IRQHandler:
  b .

  .thumb_func
  .weak SPI6_IRQHandler
SPI6_IRQHandler:
  b .

  .thumb_func
  .weak CRPT_IRQHandler
CRPT_IRQHandler:
  b .

  .thumb_func
  .weak SPI7_IRQHandler
SPI7_IRQHandler:
  b .

  .thumb_func
  .weak I2C3_IRQHandler
I2C3_IRQHandler:
  b .

  .thumb_func
  .weak EQEI0_IRQHandler
EQEI0_IRQHandler:
  b .

  .thumb_func
  .weak EQEI1_IRQHandler
EQEI1_IRQHandler:
  b .

  .thumb_func
  .weak PSIO_IRQHandler
PSIO_IRQHandler:
  b .

  .thumb_func
  .weak ECAP2_IRQHandler
ECAP2_IRQHandler:
  b .

  .thumb_func
  .weak ECAP3_IRQHandler
ECAP3_IRQHandler:
  b .

  .thumb_func
  .weak KPI_IRQHandler
KPI_IRQHandler:
  b .

  .thumb_func
  .weak HBI_IRQHandler
HBI_IRQHandler:
  b .

  .thumb_func
  .weak UART8_IRQHandler
UART9_IRQHandler:
  b .

  .thumb_func
  .weak SPI8_IRQHandler
SPI8_IRQHandler:
  b .

  .thumb_func
  .weak KS_IRQHandler
KS_IRQHandler:
  b .

  .thumb_func
  .weak GPI_IRQHandler
GPI_IRQHandler:
  b .

  .thumb_func
  .weak SPI9_IRQHandler
SPI9_IRQHandler:
  b .

  .thumb_func
  .weak CANFD00_IRQHandler
CANFD00_IRQHandler:
  b .

  .thumb_func
  .weak CANFD01_IRQHandler
CANFD01_IRQHandler:
  b .

  .thumb_func
  .weak CANFD10_IRQHandler
CANFD10_IRQHandler:
  b .

  .thumb_func
  .weak CANFD11_IRQHandler
CANFD11_IRQHandler:
  b .

  .thumb_func
  .weak EQEI2_IRQHandler
EQEI2_IRQHandler:
  b .

  .thumb_func
  .weak EQEI3_IRQHandler
EQEI3_IRQHandler:
  b .

  .thumb_func
  .weak I2C4_IRQHandler
I2C4_IRQHandler:
  b .

  .thumb_func
  .weak SPI10_IRQHandler
SPI10_IRQHandler:
  b .

  .thumb_func
  .weak CANFD20_IRQHandler
CANFD20_IRQHandler:
  b .

  .thumb_func
  .weak CANFD21_IRQHandler
CANFD21_IRQHandler:
  b .

  .thumb_func
  .weak CANFD30_IRQHandler
CANFD30_IRQHandler:
  b .

  .thumb_func
  .weak CANFD31_IRQHandler
CANFD31_IRQHandler:
  b .

  .thumb_func
  .weak EADC20_IRQHandler
EADC20_IRQHandler:
  b .

  .thumb_func
  .weak EADC21_IRQHandler
EADC21_IRQHandler:
  b .

  .thumb_func
  .weak EADC22_IRQHandler
EADC22_IRQHandler:
  b .

  .thumb_func
  .weak EADC23_IRQHandler
EADC23_IRQHandler:
  b .

  .thumb_func
  .weak ISP_IRQHandler
ISP_IRQHandler:
  b .
#endif

/*****************************************************************************
 * Vector Table                                                              *
 *****************************************************************************/

  .section .vectors, "ax"
  .balign 512
  .global _vectors
  .extern __stack_end__
#ifdef STARTUP_FROM_RESET
  .extern Reset_Handler
#endif

_vectors:
  .word __stack_end__
#ifdef STARTUP_FROM_RESET
  .word Reset_Handler
#else
  .word Reset_Wait
#endif
  .word NMI_Handler
  .word HardFault_Handler
  .word MemManage_Handler
  .word BusFault_Handler
  .word UsageFault_Handler
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word SVC_Handler
  .word DebugMon_Handler
  .word 0 /* Reserved */
  .word PendSV_Handler
  .word SysTick_Handler
  .word     BOD_IRQHandler            // ; 0: Brown Out detection
  .word     IRC_IRQHandler            // ; 1: Internal RC
  .word     PWRWU_IRQHandler          // ; 2: Power down wake up
  .word     RAMPE_IRQHandler          // ; 3: RAM parity error
  .word     CKFAIL_IRQHandler         // ; 4: Clock detection fail
  .word     ISP_IRQHandler            // ; 5: ISP
  .word     RTC_IRQHandler            // ; 6: Real Time Clock
  .word     TAMPER_IRQHandler         // ; 7: Tamper detection
  .word     WDT_IRQHandler            // ; 8: Watchdog timer
  .word     WWDT_IRQHandler           // ; 9: Window watchdog timer
  .word     EINT0_IRQHandler          // ; 10: External Input 0
  .word     EINT1_IRQHandler          // ; 11: External Input 1
  .word     EINT2_IRQHandler          // ; 12: External Input 2
  .word     EINT3_IRQHandler          // ; 13: External Input 3
  .word     EINT4_IRQHandler          // ; 14: External Input 4
  .word     EINT5_IRQHandler          // ; 15: External Input 5
  .word     GPA_IRQHandler            // ; 16: GPIO Port A
  .word     GPB_IRQHandler            // ; 17: GPIO Port B
  .word     GPC_IRQHandler            // ; 18: GPIO Port C
  .word     GPD_IRQHandler            // ; 19: GPIO Port D
  .word     GPE_IRQHandler            // ; 20: GPIO Port E
  .word     GPF_IRQHandler            // ; 21: GPIO Port F
  .word     QSPI0_IRQHandler          // ; 22: QSPI0
  .word     SPI0_IRQHandler           // ; 23: SPI0
  .word     BRAKE0_IRQHandler         // ; 24: EPWM0 brake
  .word     EPWM0P0_IRQHandler        // ; 25: EPWM0 pair 0
  .word     EPWM0P1_IRQHandler        // ; 26: EPWM0 pair 1
  .word     EPWM0P2_IRQHandler        // ; 27: EPWM0 pair 2
  .word     BRAKE1_IRQHandler         // ; 28: EPWM1 brake
  .word     EPWM1P0_IRQHandler        // ; 29: EPWM1 pair 0
  .word     EPWM1P1_IRQHandler        // ; 30: EPWM1 pair 1
  .word     EPWM1P2_IRQHandler        // ; 31: EPWM1 pair 2
  .word     TMR0_IRQHandler           // ; 32: Timer 0
  .word     TMR1_IRQHandler           // ; 33: Timer 1
  .word     TMR2_IRQHandler           // ; 34: Timer 2
  .word     TMR3_IRQHandler           // ; 35: Timer 3
  .word     UART0_IRQHandler          // ; 36: UART0
  .word     UART1_IRQHandler          // ; 37: UART1
  .word     I2C0_IRQHandler           // ; 38: I2C0
  .word     I2C1_IRQHandler           // ; 39: I2C1
  .word     PDMA0_IRQHandler          // ; 40: Peripheral DMA 0
  .word     DAC_IRQHandler            // ; 41: DAC
  .word     EADC00_IRQHandler         // ; 42: EADC0 interrupt source 0
  .word     EADC01_IRQHandler         // ; 43: EADC0 interrupt source 1
  .word     ACMP01_IRQHandler         // ; 44: ACMP0 and ACMP1
  .word     ACMP23_IRQHandler         // ; 45: ACMP2 and ACMP3
  .word     EADC02_IRQHandler         // ; 46: EADC0 interrupt source 2
  .word     EADC03_IRQHandler         // ; 47: EADC0 interrupt source 3
  .word     UART2_IRQHandler          // ; 48: UART2
  .word     UART3_IRQHandler          // ; 49: UART3
  .word     QSPI1_IRQHandler          // ; 50: QSPI1
  .word     SPI1_IRQHandler           // ; 51: SPI1
  .word     SPI2_IRQHandler           // ; 52: SPI2
  .word     USBD_IRQHandler           // ; 53: USB device
  .word     OHCI_IRQHandler           // ; 54: OHCI
  .word     USBOTG_IRQHandler         // ; 55: USB OTG
  .word     BMC_IRQHandler            // ; 56: BMC
  .word     SPI5_IRQHandler           // ; 57: SPI5
  .word     SC0_IRQHandler            // ; 58: SC0
  .word     SC1_IRQHandler            // ; 59: SC1
  .word     SC2_IRQHandler            // ; 60: SC2
  .word     GPJ_IRQHandler            // ; 61: GPIO Port J
  .word     SPI3_IRQHandler           // ; 62: SPI3
  .word     SPI4_IRQHandler           // ; 63: SPI4
  .word     SDH0_IRQHandler           // ; 64: SDH0
  .word     USBD20_IRQHandler         // ; 65: USBD20
  .word     EMAC0_IRQHandler          // ; 66: EMAC0
  .word     Default_Handler           // ; 67:
  .word     I2S0_IRQHandler           // ; 68: I2S0
  .word     I2S1_IRQHandler           // ; 69: I2S1
  .word     SPI6_IRQHandler           // ; 70: SPI6
  .word     CRPT_IRQHandler           // ; 71: CRYPTO
  .word     GPG_IRQHandler            // ; 72: GPIO Port G
  .word     EINT6_IRQHandler          // ; 73: External Input 6
  .word     UART4_IRQHandler          // ; 74: UART4
  .word     UART5_IRQHandler          // ; 75: UART5
  .word     USCI0_IRQHandler          // ; 76: USCI0
  .word     SPI7_IRQHandler           // ; 77: SPI7
  .word     BPWM0_IRQHandler          // ; 78: BPWM0
  .word     BPWM1_IRQHandler          // ; 79: BPWM1
  .word     SPIM_IRQHandler           // ; 80: SPIM
  .word     CCAP_IRQHandler           // ; 81: CCAP
  .word     I2C2_IRQHandler           // ; 82: I2C2
  .word     I2C3_IRQHandler           // ; 83: I2C3
  .word     EQEI0_IRQHandler          // ; 84: EQEI0
  .word     EQEI1_IRQHandler          // ; 85: EQEI1
  .word     ECAP0_IRQHandler          // ; 86: ECAP0
  .word     ECAP1_IRQHandler          // ; 87: ECAP1
  .word     GPH_IRQHandler            // ; 88: GPIO Port H
  .word     EINT7_IRQHandler          // ; 89: External Input 7
  .word     SDH1_IRQHandler           // ; 90: SDH1
  .word     PSIO_IRQHandler           // ; 91: PSIO
  .word     EHCI_IRQHandler           // ; 92: EHCI
  .word     USBOTG20_IRQHandler       // ; 93: HSOTG
  .word     ECAP2_IRQHandler          // ; 94: ECAP2
  .word     ECAP3_IRQHandler          // ; 95: ECAP3
  .word     KPI_IRQHandler            // ; 96: KPI
  .word     HBI_IRQHandler            // ; 97: HBI
  .word     PDMA1_IRQHandler          // ; 98: Peripheral DMA 1
  .word     UART8_IRQHandler          // ; 99: UART8
  .word     UART9_IRQHandler          // ; 100: UART9
  .word     TRNG_IRQHandler           // ; 101: TRNG
  .word     UART6_IRQHandler          // ; 102: UART6
  .word     UART7_IRQHandler          // ; 103: UART7
  .word     EADC10_IRQHandler         // ; 104: EADC1 interrupt source 0
  .word     EADC11_IRQHandler         // ; 105: EADC1 interrupt source 1
  .word     EADC12_IRQHandler         // ; 106: EADC1 interrupt source 2
  .word     EADC13_IRQHandler         // ; 107: EADC1 interrupt source 3
  .word     SPI8_IRQHandler           // ; 108: SPI8
  .word     KS_IRQHandler             // ; 109: Key Store
  .word     GPI_IRQHandler            // ; 110: GPIO Port I
  .word     SPI9_IRQHandler           // ; 111: SPI9
  .word     CANFD00_IRQHandler        // ; 112: CANFD0 interrupt source 0
  .word     CANFD01_IRQHandler        // ; 113: CANFD0 interrupt source 1
  .word     CANFD10_IRQHandler        // ; 114: CANFD1 interrupt source 0
  .word     CANFD11_IRQHandler        // ; 115: CANFD1 interrupt source 1
  .word     EQEI2_IRQHandler          // ; 116: EQEI2
  .word     EQEI3_IRQHandler          // ; 117: EQEI3
  .word     I2C4_IRQHandler           // ; 118: I2C4
  .word     SPI10_IRQHandler          // ; 119: SPI10
  .word     CANFD20_IRQHandler        // ; 120: CANFD2 interrupt source 0
  .word     CANFD21_IRQHandler        // ; 121: CANFD2 interrupt source 1
  .word     CANFD30_IRQHandler        // ; 122: CANFD3 interrupt source 0
  .word     CANFD31_IRQHandler        // ; 123: CANFD3 interrupt source 1
  .word     EADC20_IRQHandler         // ; 124: EADC2 interrupt source 0
  .word     EADC21_IRQHandler         // ; 125: EADC2 interrupt source 1
  .word     EADC22_IRQHandler         // ; 126: EADC2 interrupt source 2
  .word     EADC23_IRQHandler         // ; 127: EADC2 interrupt source 3
_vectors_end:

#ifdef VECTORS_IN_RAM
  .section .vectors_ram, "ax"
  .balign 512
  .global _vectors_ram

_vectors_ram:
  .space _vectors_end - _vectors, 0
#endif
