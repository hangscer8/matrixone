// Code generated by command: go run avx512.go -out avx512.s -stubs avx512_stubs.go. DO NOT EDIT.

#include "textflag.h"

// func strLengthAvx512Asm(x []uint32, r []int64)
// Requires: AVX, AVX512F
TEXT ·strLengthAvx512Asm(SB), NOSPLIT, $0-48
	MOVQ x_base+0(FP), AX
	MOVQ r_base+24(FP), CX
	MOVQ x_len+8(FP), DX

blockloop:
	CMPQ      DX, $0x00000060
	JL        tailloop
	VMOVDQU   (AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, (CX)
	VMOVDQU   16(AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, 32(CX)
	VMOVDQU   32(AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, 64(CX)
	VMOVDQU   48(AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, 96(CX)
	VMOVDQU   64(AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, 128(CX)
	VMOVDQU   80(AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, 160(CX)
	VMOVDQU   96(AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, 192(CX)
	VMOVDQU   112(AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, 224(CX)
	VMOVDQU   128(AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, 256(CX)
	VMOVDQU   144(AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, 288(CX)
	VMOVDQU   160(AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, 320(CX)
	VMOVDQU   176(AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, 352(CX)
	ADDQ      $0x00000180, AX
	ADDQ      $0x00000300, CX
	SUBQ      $0x00000060, DX
	JMP       blockloop

tailloop:
	CMPQ      DX, $0x00000008
	JL        done
	VMOVDQU   (AX), Y0
	VPMOVZXDQ Y0, Z0
	VMOVDQU64 Z0, (CX)
	ADDQ      $0x00000020, AX
	ADDQ      $0x00000040, CX
	SUBQ      $0x00000008, DX
	JMP       tailloop

done:
	RET