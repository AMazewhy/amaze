
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
   (func26 Start Start)
   (func27 Start Start)
   (func28 Start Start)
   (func30 Start)
   (func31 Start Start Start Start)
   (func34 Start Start)
   (func37 Start Start)
   (func43 Start Start Start)
   (func44 Start Start)
   (func47 Start Start)
   (func48 Start)
   (func51 Start Start Start)
   (func52 Start Start)
   (func53 Start Start)
   (func56 Start)
   (func59 Start Start)
   (func60 Start)
   (bvnot Start)
   (shl1 Start)
   (shr1 Start)
   (shr4 Start)
   (bvor Start Start)
   (bvxor Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x9cfa70799f791b9b) #xbdfef0fbbffb3fbf))
(constraint (= (f #x398381eae6f9ddb1) #x7b8783ffeffbfff1))
(constraint (= (f #x7f9ef1fe68cc4863) #xffbff3fef9dcd8e7))
(constraint (= (f #x73f2f2847b250c9f) #xf7f7f78cff6f1dbf))
(constraint (= (f #xdd0028de303a33f5) #xff0079fe707e77fd))
(constraint (= (f #xffffffffffeb066b) #xffffffffffff0eff))
(constraint (= (f #xffffffffffe6515b) #xffffffffffeef3ff))
(constraint (= (f #xffffffffffe3b0c7) #xffffffffffe7f1cf))
(constraint (= (f #xffffffffffe11fc1) #xffffffffffe33fc1))
(constraint (= (f #xffffffffffe42ce5) #xffffffffffec7ded))
(constraint (= (f #xffffffffffffffff) #x0000000000000000))
(constraint (= (f #x07fdfea09a720c90) #x0000003feff504d3))
(constraint (= (f #x1ddef3bf64e85954) #x000000eef79dfb27))
(constraint (= (f #xd2a7c635bd99aa32) #x000006953e31adec))
(constraint (= (f #xec5571a74eeae68e) #x00000762ab8d3a77))
(constraint (= (f #x73d4bd3a4d4bdcda) #x0000039ea5e9d26a))
(constraint (= (f #x0000000000000001) #x0000000000000003))
(constraint (= (f #xffffffffffe5b5f4) #x0000000000000000))
(constraint (= (f #xffffffffffe227ea) #x0000000000000000))
(constraint (= (f #xffffffffffe1c386) #x0000000000000000))
(constraint (= (f #xffffffffffe12678) #x0000000000000000))
(constraint (= (f #xffffffffffea62ec) #x0000000000000000))
(constraint (= (f #x878972a54e4a1793) #x8f9bf7efdede3fb7))
(constraint (= (f #xc83dfc3b8cbc9ad4) #x00000641efe1dc65))
(constraint (= (f #x9362ee4a0aafb56d) #xb7e7fede1ffffffd))
(constraint (= (f #x57cf70c3b50ada00) #x000002be7b861da8))
(constraint (= (f #x73f7f3b0ac0252c2) #x0000039fbf9d8560))
(constraint (= (f #x689d1c9e950bb25a) #x00000344e8e4f4a8))
(constraint (= (f #xd62bf68c1e8cb96b) #xfe7fff9c3f9dfbff))
(constraint (= (f #xc1b4af8220dd0f2d) #xc3fdff8661ff1f7d))
(constraint (= (f #x45924c6808d191fe) #x0000022c92634046))
(constraint (= (f #x8eac808207003eb9) #x9ffd81860f007ff9))
(constraint (= (f #xffffffffffedf092) #x0000000000000000))
(constraint (= (f #xffffffffffffffff) #x0000000000000000))
(constraint (= (f #x0000000000000001) #x0000000000000003))
(constraint (= (f #xffffffffffe93201) #xfffffffffffb7601))
(constraint (= (f #x7fffffffffffffff) #xffffffffffffffff))
(check-synth)
