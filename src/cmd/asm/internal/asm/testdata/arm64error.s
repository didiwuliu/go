// Copyright 2018 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

TEXT errors(SB),$0
	AND	$1, RSP                                          // ERROR "illegal combination"
	ANDS	$1, R0, RSP                                      // ERROR "illegal combination"
	ADDSW	R7->32, R14, R13                                 // ERROR "shift amount out of range 0 to 31"
	ADD	R1.UXTB<<5, R2, R3                               // ERROR "shift amount out of range 0 to 4"
	ADDS	R1.UXTX<<7, R2, R3                               // ERROR "shift amount out of range 0 to 4"
	BICW	R7@>33, R5, R16                                  // ERROR "shift amount out of range 0 to 31"
	MOVD.P	300(R2), R3                                      // ERROR "offset out of range [-255,254]"
	MOVD.P	R3, 344(R2)                                      // ERROR "offset out of range [-255,254]"
	MOVD	(R3)(R7.SXTX<<2), R8                             // ERROR "invalid index shift amount"
	MOVWU	(R5)(R4.UXTW<<3), R10                            // ERROR "invalid index shift amount"
	MOVWU	(R5)(R4<<1), R10                                 // ERROR "invalid index shift amount"
	VLD1	(R8)(R13), [V2.B16]                              // ERROR "illegal combination"
	VLD1	8(R9), [V2.B16]                                  // ERROR "illegal combination"
	VST1	[V1.B16], (R8)(R13)                              // ERROR "illegal combination"
	VST1	[V1.B16], 9(R2)                                  // ERROR "illegal combination"
	VLD1	8(R8)(R13), [V2.B16]                             // ERROR "illegal combination"
	VMOV	V8.D[2], V12.D[1]                                // ERROR "register element index out of range 0 to 1"
	VMOV	V8.S[4], V12.S[1]                                // ERROR "register element index out of range 0 to 3"
	VMOV	V8.H[8], V12.H[1]                                // ERROR "register element index out of range 0 to 7"
	VMOV	V8.B[16], V12.B[1]                               // ERROR "register element index out of range 0 to 15"
	VMOV	V8.D[0], V12.S[1]                                // ERROR "operand mismatch"
	VMOV	V8.D[0], V12.H[1]                                // ERROR "operand mismatch"
	VMOV	V8.D[0], V12.B[1]                                // ERROR "operand mismatch"
	VMOV	V8.S[0], V12.H[1]                                // ERROR "operand mismatch"
	VMOV	V8.S[0], V12.B[1]                                // ERROR "operand mismatch"
	VMOV	V8.H[0], V12.B[1]                                // ERROR "operand mismatch"
	VMOV	V8.B[16], R3                                     // ERROR "register element index out of range 0 to 15"
	VMOV	V8.H[9], R3                                      // ERROR "register element index out of range 0 to 7"
	VMOV	V8.S[4], R3                                      // ERROR "register element index out of range 0 to 3"
	VMOV	V8.D[2], R3                                      // ERROR "register element index out of range 0 to 1"
	VDUP	V8.B[16], R3.B16                                 // ERROR "register element index out of range 0 to 15"
	VDUP	V8.B[17], R3.B8                                  // ERROR "register element index out of range 0 to 15"
	VDUP	V8.H[9], R3.H4                                   // ERROR "register element index out of range 0 to 7"
	VDUP	V8.H[9], R3.H8                                   // ERROR "register element index out of range 0 to 7"
	VDUP	V8.S[4], R3.S2                                   // ERROR "register element index out of range 0 to 3"
	VDUP	V8.S[4], R3.S4                                   // ERROR "register element index out of range 0 to 3"
	VDUP	V8.D[2], R3.D2                                   // ERROR "register element index out of range 0 to 1"
	VFMLA	V1.D2, V12.D2, V3.S2                             // ERROR "operand mismatch"
	VFMLA	V1.S2, V12.S2, V3.D2                             // ERROR "operand mismatch"
	VFMLA	V1.S4, V12.S2, V3.D2                             // ERROR "operand mismatch"
	VFMLA	V1.H4, V12.H4, V3.D2                             // ERROR "operand mismatch"
	VFMLS	V1.S2, V12.S2, V3.S4                             // ERROR "operand mismatch"
	VFMLS	V1.S2, V12.D2, V3.S4                             // ERROR "operand mismatch"
	VFMLS	V1.S2, V12.S4, V3.D2                             // ERROR "operand mismatch"
	VFMLA	V1.B8, V12.B8, V3.B8                             // ERROR "invalid arrangement"
	VFMLA	V1.B16, V12.B16, V3.B16                          // ERROR "invalid arrangement"
	VFMLA	V1.H4, V12.H4, V3.H4                             // ERROR "invalid arrangement"
	VFMLA	V1.H8, V12.H8, V3.H8                             // ERROR "invalid arrangement"
	VFMLA	V1.H4, V12.H4, V3.H4                             // ERROR "invalid arrangement"
	VFMLS	V1.B8, V12.B8, V3.B8                             // ERROR "invalid arrangement"
	VFMLS	V1.B16, V12.B16, V3.B16                          // ERROR "invalid arrangement"
	VFMLS	V1.H4, V12.H4, V3.H4                             // ERROR "invalid arrangement"
	VFMLS	V1.H8, V12.H8, V3.H8                             // ERROR "invalid arrangement"
	VFMLS	V1.H4, V12.H4, V3.H4                             // ERROR "invalid arrangement"
	VST1.P	[V4.S4,V5.S4], 48(R1)                            // ERROR "invalid post-increment offset"
	VST1.P	[V4.S4], 8(R1)                                   // ERROR "invalid post-increment offset"
	VLD1.P	32(R1), [V8.S4, V9.S4, V10.S4]                   // ERROR "invalid post-increment offset"
	VLD1.P	48(R1), [V7.S4, V8.S4, V9.S4, V10.S4]            // ERROR "invalid post-increment offset"
	VPMULL	V1.D1, V2.H4, V3.Q1                              // ERROR "invalid arrangement"
	VPMULL	V1.H4, V2.H4, V3.Q1                              // ERROR "invalid arrangement"
	VPMULL	V1.D2, V2.D2, V3.Q1                              // ERROR "invalid arrangement"
	VPMULL	V1.B16, V2.B16, V3.H8                            // ERROR "invalid arrangement"
	VPMULL2	V1.D2, V2.H4, V3.Q1                              // ERROR "invalid arrangement"
	VPMULL2	V1.H4, V2.H4, V3.Q1                              // ERROR "invalid arrangement"
	VPMULL2	V1.D1, V2.D1, V3.Q1                              // ERROR "invalid arrangement"
	VPMULL2	V1.B8, V2.B8, V3.H8                              // ERROR "invalid arrangement"
	VEXT	$8, V1.B16, V2.B8, V2.B16                        // ERROR "invalid arrangement"
	VEXT	$8, V1.H8, V2.H8, V2.H8                          // ERROR "invalid arrangement"
	VRBIT	V1.B16, V2.B8                                    // ERROR "invalid arrangement"
	VRBIT	V1.H4, V2.H4                                     // ERROR "invalid arrangement"
	VUSHR	$56, V1.D2, V2.H4                                // ERROR "invalid arrangement"
	VUSHR	$127, V1.D2, V2.D2                               // ERROR "shift out of range"
	VLD1.P	(R8)(R9.SXTX<<2), [V2.B16]                       // ERROR "invalid extended register"
	VLD1.P	(R8)(R9<<2), [V2.B16]                            // ERROR "invalid extended register"
	VST1.P	[V1.B16], (R8)(R9.UXTW)                          // ERROR "invalid extended register"
	VST1.P	[V1.B16], (R8)(R9<<1)                            // ERROR "invalid extended register"
	RET
