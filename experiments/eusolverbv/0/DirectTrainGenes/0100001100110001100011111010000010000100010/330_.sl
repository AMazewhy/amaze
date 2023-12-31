
(set-logic BV)

(define-fun shr1 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000001))
(define-fun shr4 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000004))
(define-fun shr16 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000010))
(define-fun shl1 ((x (BitVec 64))) (BitVec 64) (bvshl x #x0000000000000001))
(define-fun if0 ((x (BitVec 64)) (y (BitVec 64)) (z (BitVec 64))) (BitVec 64) (ite (= x #x0000000000000001) y z))
(define-fun func23  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (bvand (bvlshr (bvlshr C  D ) B ) A ))
(define-fun func24  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  C ) A ))
(define-fun func25  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000001 ) A ))
(define-fun func26  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000010 ) A ))
(define-fun func27  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000004 ) A ))
(define-fun func28  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr A  B ) #x0000000000000001 ))
(define-fun func29  ((A (BitVec 64)) ) (BitVec 64) (bvand A  #x0000000000000001 ))
(define-fun func30  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr C  D ) B ) A ))
(define-fun func31  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr B  C ) A ) #x0000000000000004 ))
(define-fun func32  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr C  #x0000000000000010 ) B ) A ))
(define-fun func33  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr B  C ) #x0000000000000004 ) A ))
(define-fun func34  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  C ) A ))
(define-fun func35  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000010 ) A ))
(define-fun func36  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000004 ) A ))
(define-fun func37  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000001 ) A ))
(define-fun func38  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000001 ))
(define-fun func39  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000004 ))
(define-fun func40  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr A  B ))
(define-fun func41  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  C ) A ))
(define-fun func42  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  #x0000000000000001 ) A ))
(define-fun func43  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvadd B  C ) A ))
(define-fun func44  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot B ) A ))
(define-fun func45  ((A (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot A ) #x0000000000000010 ))
(define-fun func46  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvor (bvlshr B  C ) A ))
(define-fun func47  ((A (BitVec 64)) ) (BitVec 64) (bvor A  #x0000000000000001 ))
(define-fun func48  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  C ) A ))
(define-fun func49  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  #x0000000000000001 ) A ))
(define-fun func50  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr A  B ) #x0000000000000001 ))
(define-fun func52  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvlshr B  C ) A ))
(define-fun func53  ((A (BitVec 64)) ) (BitVec 64) (bvadd A  #x0000000000000001 ))
(define-fun func54  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  C ) A ))
(define-fun func55  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  #x0000000000000001 ) A ))
(define-fun func56  ((A (BitVec 64)) ) (BitVec 64) (bvnot (bvshl A  #x0000000000000001 )))
(synth-fun f ( (x (BitVec 64))) (BitVec 64)
(
(Start (BitVec 64) (
   #x0000000000000000
   #x0000000000000001
   x
   (func24 Start Start Start)
   (func29 Start)
   (func30 Start Start Start Start)
   (func33 Start Start Start)
   (func34 Start Start Start)
   (func38 Start Start)
   (func39 Start Start)
   (func43 Start Start Start)
   (func44 Start Start)
   (func45 Start)
   (func46 Start Start Start)
   (func47 Start)
   (func49 Start Start)
   (func56 Start)
   (bvnot Start)
   (shl1 Start)
   (shr1 Start)
   (shr4 Start)
   (bvand Start Start)
   (bvor Start Start)
   (bvxor Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x36975d40b5d639e1) #x036975d40b5d639e))
(constraint (= (f #x751ee36b9928cb65) #x0751ee36b9928cb6))
(constraint (= (f #xad35d315ed971b4d) #x0ad35d315ed971b4))
(constraint (= (f #xba542395962cef81) #x0ba542395962cef8))
(constraint (= (f #xc9a803fcb2b2dc83) #x0c9a803fcb2b2dc8))
(constraint (= (f #x9e8dd7d5385bff94) #x09e8dd7d5385bff9))
(constraint (= (f #xdea7b78dee16987c) #x0dea7b78dee16987))
(constraint (= (f #x5335cb461527333e) #x05335cb461527333))
(constraint (= (f #x5c15f976a5314ed4) #x05c15f976a5314ed))
(constraint (= (f #x144b58692ae26936) #x0144b58692ae2693))
(constraint (= (f #x00000000009c5801) #x000000000009c580))
(constraint (= (f #x0000000000bb86e1) #x00000000000bb86e))
(constraint (= (f #x000000000099642d) #x0000000000099642))
(constraint (= (f #x0000000000ae1b89) #x00000000000ae1b8))
(constraint (= (f #x0000000000f7a601) #x00000000000f7a60))
(constraint (= (f #x0000000000a851f6) #x00000000000a851f))
(constraint (= (f #x00000000009e919c) #x000000000009e919))
(constraint (= (f #x0000000000efb83e) #x00000000000efb83))
(constraint (= (f #x0000000000ea60f2) #x00000000000ea60f))
(constraint (= (f #x0000000000e06d52) #x00000000000e06d5))
(constraint (= (f #x131d66661253fabf) #x0131d66661253fab))
(constraint (= (f #xca2cd92952365195) #x0ca2cd9295236519))
(constraint (= (f #xffb1a9d59322be19) #x0ffb1a9d59322be1))
(constraint (= (f #xd4c0c9a68387d877) #x0d4c0c9a68387d87))
(constraint (= (f #x67f2b05cf526c49b) #x067f2b05cf526c49))
(constraint (= (f #xb9492868625fc484) #x0000b9492868625f))
(constraint (= (f #x829a922ce6d572ce) #x0000829a922ce6d5))
(constraint (= (f #xb4de977b93be0042) #x0000b4de977b93be))
(constraint (= (f #x157d85f8d1fa4d24) #x0000157d85f8d1fa))
(constraint (= (f #x341743be915c4684) #x0000341743be915c))
(constraint (= (f #x00000000007ba433) #x000000000007ba43))
(constraint (= (f #x0000000000d3c037) #x00000000000d3c03))
(constraint (= (f #x0000000000dc3add) #x00000000000dc3ad))
(constraint (= (f #x0000000000bff9f9) #x00000000000bff9f))
(constraint (= (f #x00000000007c3c77) #x000000000007c3c7))
(constraint (= (f #x0000000000c2ece6) #x0000000000000000))
(constraint (= (f #x0000000000b49b02) #x0000000000000000))
(constraint (= (f #x00000000007b95e2) #x0000000000000000))
(constraint (= (f #x0000000000b1ed6a) #x0000000000000000))
(constraint (= (f #x00000000007d122a) #x0000000000000000))
(check-synth)
