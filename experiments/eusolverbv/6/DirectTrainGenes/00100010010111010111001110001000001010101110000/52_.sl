
(set-logic BV)

(define-fun shr1 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000001))
(define-fun shr4 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000004))
(define-fun shr16 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000010))
(define-fun shl1 ((x (BitVec 64))) (BitVec 64) (bvshl x #x0000000000000001))
(define-fun if0 ((x (BitVec 64)) (y (BitVec 64)) (z (BitVec 64))) (BitVec 64) (ite (= x #x0000000000000001) y z))
(define-fun func26  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (bvand (bvlshr (bvlshr C  D ) B ) A ))
(define-fun func27  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  C ) A ))
(define-fun func28  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000001 ) A ))
(define-fun func29  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000010 ) A ))
(define-fun func30  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000004 ) A ))
(define-fun func31  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr A  B ) #x0000000000000001 ))
(define-fun func32  ((A (BitVec 64)) ) (BitVec 64) (bvand A  #x0000000000000001 ))
(define-fun func33  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr C  D ) B ) A ))
(define-fun func34  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr C  #x0000000000000010 ) B ) A ))
(define-fun func35  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  C ) A ))
(define-fun func36  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000010 ) A ))
(define-fun func37  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000004 ) A ))
(define-fun func38  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000001 ) A ))
(define-fun func39  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000001 ))
(define-fun func40  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000004 ))
(define-fun func41  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr A  B ))
(define-fun func42  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  C ) A ))
(define-fun func43  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  #x0000000000000001 ) A ))
(define-fun func44  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvadd B  C ) A ))
(define-fun func45  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot B ) A ))
(define-fun func46  ((A (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot #x0000000000000000 ) A ))
(define-fun func47  ((A (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot A ) #x0000000000000010 ))
(define-fun func48  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvor (bvlshr B  C ) A ))
(define-fun func49  ((A (BitVec 64)) ) (BitVec 64) (bvor A  #x0000000000000001 ))
(define-fun func50  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  C ) A ))
(define-fun func51  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  #x0000000000000001 ) A ))
(define-fun func52  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr A  B ) #x0000000000000001 ))
(define-fun func54  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvshl (bvshl B  C ) A ))
(define-fun func55  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvshl B  #x0000000000000001 ) A ))
(define-fun func56  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvshl A  B ) #x0000000000000001 ))
(define-fun func57  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvnot B ) A ))
(define-fun func58  ((A (BitVec 64)) ) (BitVec 64) (bvshl (bvnot A ) #x0000000000000001 ))
(define-fun func59  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvlshr B  C ) A ))
(define-fun func60  ((A (BitVec 64)) ) (BitVec 64) (bvadd A  #x0000000000000001 ))
(define-fun func61  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  C ) A ))
(define-fun func62  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  #x0000000000000001 ) A ))
(define-fun func63  ((A (BitVec 64)) ) (BitVec 64) (bvnot (bvshl A  #x0000000000000001 )))
(synth-fun f ( (x (BitVec 64))) (BitVec 64)
(
(Start (BitVec 64) (
   #x0000000000000000
   #x0000000000000001
   x
   (func28 Start Start)
   (func32 Start)
   (func35 Start Start Start)
   (func37 Start Start)
   (func38 Start Start)
   (func39 Start Start)
   (func41 Start Start)
   (func43 Start Start)
   (func44 Start Start Start)
   (func45 Start Start)
   (func48 Start Start Start)
   (func49 Start)
   (func50 Start Start Start)
   (func55 Start Start)
   (func61 Start Start Start)
   (func63 Start)
   (bvnot Start)
   (shr1 Start)
   (bvor Start Start)
   (bvxor Start Start)
   (bvadd Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x9acb3bca80fdaf6e) #x00009acb3bca80fd))
(constraint (= (f #x38e37ed5c4c9ae06) #x000038e37ed5c4c9))
(constraint (= (f #xd27350952ba8cac8) #x0000d27350952ba8))
(constraint (= (f #xa8b2184f1fcb5e02) #x0000a8b2184f1fcb))
(constraint (= (f #x3b47c334fe9d06a8) #x00003b47c334fe9d))
(constraint (= (f #x0000000000010c1a) #x0000000000000001))
(constraint (= (f #x000000000001232c) #x0000000000000001))
(constraint (= (f #x000000000001c014) #x0000000000000001))
(constraint (= (f #x000000000001021a) #x0000000000000001))
(constraint (= (f #x0000000000016474) #x0000000000000001))
(constraint (= (f #x0000000000000000) #x0000000000000000))
(constraint (= (f #xafe4dc7d9f433e6b) #x501b238260bcc194))
(constraint (= (f #xc012b152668a4653) #x3fed4ead9975b9ac))
(constraint (= (f #xd7f034e4a452267b) #x280fcb1b5badd984))
(constraint (= (f #x002ee53fe3320d9d) #xffd11ac01ccdf262))
(constraint (= (f #xed434b308047a959) #x12bcb4cf7fb856a6))
(constraint (= (f #xffffffffffffffff) #x0000000000000000))
(constraint (= (f #x0000000000018867) #xfffffffffffe7798))
(constraint (= (f #x0000000000014ec5) #xfffffffffffeb138))
(constraint (= (f #x000000000001531d) #xfffffffffffeace0))
(constraint (= (f #x000000000001ceab) #xfffffffffffe3154))
(constraint (= (f #x0000000000016867) #xfffffffffffe9798))
(constraint (= (f #x015e678dc91db3a9) #xfea1987236e24c56))
(constraint (= (f #xf1bd6c417fa8a4e6) #x0000f1bd6c417fa8))
(constraint (= (f #xa4e41bd254b1ae7f) #x5b1be42dab4e5180))
(constraint (= (f #x25af3296f7925ac4) #x000025af3296f792))
(constraint (= (f #xe0e3d45086acb4e2) #x0000e0e3d45086ac))
(constraint (= (f #x1e78d8b2034ff300) #x00001e78d8b2034f))
(constraint (= (f #x186861d55227f952) #x0000186861d55227))
(constraint (= (f #x0bf9fabab94211aa) #x00000bf9fabab942))
(constraint (= (f #x93a89b5ec03013d9) #x6c5764a13fcfec26))
(constraint (= (f #x3afe07a7fa652528) #x00003afe07a7fa65))
(constraint (= (f #x000000000001a595) #xfffffffffffe5a68))
(constraint (= (f #x0000000000011d13) #xfffffffffffee2ec))
(constraint (= (f #x00000000000154a4) #x0000000000000001))
(constraint (= (f #xffffffffffffffff) #x0000000000000000))
(check-synth)
