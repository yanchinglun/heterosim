/*	$NetBSD: bscreg.h,v 1.6 2005/12/11 12:18:58 christos Exp $	*/

/*  This file has been extended with useful bitfield definitions from
    the SH7750 manual.  */

#ifndef _SH3_BSCREG_H_
#define	_SH3_BSCREG_H_

/*-
 * Copyright (C) 1999 SAITOH Masanobu.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*  #include <sh3/devreg.h>  */

/*
 * Bus State Controller
 */

#define	SH3_BCR1		0xffffff60	/* 16bit */
#define	SH3_BCR2		0xffffff62	/* 16bit */
#define	SH3_WCR1		0xffffff64	/* 16bit */
#define	SH3_WCR2		0xffffff66	/* 16bit */
#define	SH3_MCR			0xffffff68	/* 16bit */
#define	SH3_DCR			0xffffff6a	/* 16bit */
#define	SH3_PCR			0xffffff6c	/* 16bit */
#define	SH3_RTCSR		0xffffff6e	/* 16bit */
#define	SH3_RTCNT		0xffffff70	/* 16bit */
#define	SH3_RTCOR		0xffffff72	/* 16bit */
#define	SH3_RFCR		0xffffff74	/* 16bit */
#define	SH3_BCR3		0xffffff7e	/* 16bit */

#define	SH4_BCR1		0xff800000	/* 32bit */
#define	SH4_BCR2		0xff800004	/* 16bit */
#define	SH4_WCR1		0xff800008	/* 32bit */
#define	SH4_WCR2		0xff80000c	/* 32bit */
#define	SH4_WCR3		0xff800010	/* 32bit */
#define	SH4_MCR			0xff800014	/* 32bit */
#define	SH4_PCR			0xff800018	/* 16bit */
#define	SH4_RTCSR		0xff80001c	/* 16bit */
#define	SH4_RTCNT		0xff800020	/* 16bit */
#define	SH4_RTCOR		0xff800024	/* 16bit */
#define	SH4_RFCR		0xff800028	/* 16bit */
#define	SH4_UNKNOWN_2C		0xff80002c	/*  ???  */
#define	SH4_UNKNOWN_30		0xff800030	/*  ???  */
#define	SH4_BCR3		0xff800050	/* 16bit: SH7751R */
#define	SH4_BCR4		0xfe0a00f0	/* 32bit: SH7751R */

#define	BCR1_LITTLE_ENDIAN	(1 << 31)
#define	BCR1_MASTER		(1 << 30)
#define	BCR1_BREQEN		(1 << 19)

#define	BCR2_PORTEN		(1 << 0)

#define	RTCSR_CMF		(1 << 7)
#define	RTCSR_CMIE		(1 << 6)
#define	RTCSR_CKS		0x0038
#define	RTCSR_OVF		(1 << 2)
#define	RTCSR_OVIE		(1 << 1)
#define	RTCSR_LMTS		(1 << 0)

#endif	/* !_SH3_BSCREG_H_ */
