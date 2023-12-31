
(set-logic BV)

(define-fun shr1 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000001))
(define-fun shr4 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000004))
(define-fun shr16 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000010))
(define-fun shl1 ((x (BitVec 64))) (BitVec 64) (bvshl x #x0000000000000001))
(define-fun if0 ((x (BitVec 64)) (y (BitVec 64)) (z (BitVec 64))) (BitVec 64) (ite (= x #x0000000000000001) y z))
(define-fun func24  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (bvand (bvlshr (bvlshr C  D ) B ) A ))
(define-fun func25  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  C ) A ))
(define-fun func26  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000001 ) A ))
(define-fun func27  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000010 ) A ))
(define-fun func28  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000004 ) A ))
(define-fun func29  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr A  B ) #x0000000000000001 ))
(define-fun func30  ((A (BitVec 64)) ) (BitVec 64) (bvand A  #x0000000000000001 ))
(define-fun func31  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr C  D ) B ) A ))
(define-fun func32  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr C  #x0000000000000010 ) B ) A ))
(define-fun func33  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr B  C ) A ) #x0000000000000004 ))
(define-fun func34  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr B  #x0000000000000010 ) A ) #x0000000000000004 ))
(define-fun func35  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr B  C ) #x0000000000000004 ) A ))
(define-fun func36  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  C ) A ))
(define-fun func37  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000010 ) A ))
(define-fun func38  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000004 ) A ))
(define-fun func39  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000001 ) A ))
(define-fun func40  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000001 ))
(define-fun func41  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000004 ))
(define-fun func42  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr A  B ))
(define-fun func43  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  C ) A ))
(define-fun func44  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  #x0000000000000001 ) A ))
(define-fun func45  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl A  B ) #x0000000000000004 ))
(define-fun func46  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvadd B  C ) A ))
(define-fun func47  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot B ) A ))
(define-fun func48  ((A (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot A ) #x0000000000000010 ))
(define-fun func49  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvor (bvlshr B  C ) A ))
(define-fun func50  ((A (BitVec 64)) ) (BitVec 64) (bvor A  #x0000000000000001 ))
(define-fun func51  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  C ) A ))
(define-fun func52  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  #x0000000000000001 ) A ))
(define-fun func53  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr A  B ) #x0000000000000001 ))
(define-fun func55  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvlshr B  C ) A ))
(define-fun func56  ((A (BitVec 64)) ) (BitVec 64) (bvadd A  #x0000000000000001 ))
(define-fun func57  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  C ) A ))
(define-fun func58  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  #x0000000000000001 ) A ))
(define-fun func59  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvnot (bvshl (bvlshr A  B ) #x0000000000000001 )))
(define-fun func60  ((A (BitVec 64)) ) (BitVec 64) (bvnot (bvshl A  #x0000000000000001 )))
(synth-fun f ( (x (BitVec 64))) (BitVec 64)
(
(Start (BitVec 64) (
   #x0000000000000000
   #x0000000000000001
   x
   (func27 Start Start)
   (func30 Start)
   (func38 Start Start)
   (func41 Start Start)
   (func44 Start Start)
   (func46 Start Start Start)
   (func47 Start Start)
   (func48 Start)
   (func55 Start Start Start)
   (func56 Start)
   (func58 Start Start)
   (bvnot Start)
   (shl1 Start)
   (shr1 Start)
   (shr4 Start)
   (shr16 Start)
   (bvand Start Start)
   (bvor Start Start)
   (bvxor Start Start)
   (bvadd Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #xfaf1f1cb040c5eb0) #x050e0e34fbf3a14f))
(constraint (= (f #x101b6656e864b2bc) #xefe499a9179b4d43))
(constraint (= (f #xd2b2b403fe0733fe) #x2d4d4bfc01f8cc01))
(constraint (= (f #x07d8406bb0fc7d32) #xf827bf944f0382cd))
(constraint (= (f #x9d2b1f197d3678bc) #x62d4e0e682c98743))
(constraint (= (f #x0000000000000000) #x0000000000000000))
(constraint (= (f #x000000000000002a) #xffffffffffffffab))
(constraint (= (f #x0000000000000024) #xffffffffffffffb7))
(constraint (= (f #x000000000000003c) #xffffffffffffff87))
(constraint (= (f #x000000000000003a) #xffffffffffffff8b))
(constraint (= (f #xa412071b6cc62515) #xa412071b6cc62517))
(constraint (= (f #x6b04ebd3231abd7b) #x6b04ebd3231abd7d))
(constraint (= (f #xef3c32b87951374f) #xef3c32b879513751))
(constraint (= (f #xcf215943b666b5eb) #xcf215943b666b5ed))
(constraint (= (f #x09b922804f091087) #x09b922804f091089))
(constraint (= (f #x0000000000000003) #x0000000000000000))
(constraint (= (f #x000000000000002b) #x000000000000002d))
(constraint (= (f #x000000000000002f) #x0000000000000031))
(constraint (= (f #x0000000000000035) #x0000000000000037))
(constraint (= (f #x0000000000000027) #x0000000000000029))
(constraint (= (f #xb6cc100489819014) #x4933effb767e6feb))
(constraint (= (f #xb6869ac50459010f) #xb6869ac504590111))
(constraint (= (f #x18a5b5f58dc637c8) #xe75a4a0a7239c837))
(constraint (= (f #xa071cc02997d17d6) #x5f8e33fd6682e829))
(constraint (= (f #x735829c8a3963a74) #x8ca7d6375c69c58b))
(constraint (= (f #x9a87acaa0a186f79) #x9a87acaa0a186f7b))
(constraint (= (f #x6080f814fa08816d) #x6080f814fa08816f))
(constraint (= (f #x094a1e13e2246274) #xf6b5e1ec1ddb9d8b))
(constraint (= (f #xa369807134047a8e) #x5c967f8ecbfb8571))
(constraint (= (f #xf7e710f79b050487) #xf7e710f79b050489))
(constraint (= (f #x0000000000000003) #x0000000000000000))
(constraint (= (f #x0000000000000000) #x0000000000000000))
(constraint (= (f #x0000000000000032) #xffffffffffffff9b))
(constraint (= (f #x000000000000003f) #x0000000000000041))
(constraint (= (f #x0000000000000001) #x0000000000000003))
(check-synth)
