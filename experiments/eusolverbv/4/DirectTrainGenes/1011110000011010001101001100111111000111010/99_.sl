
(set-logic BV)

(define-fun shr1 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000001))
(define-fun shr4 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000004))
(define-fun shr16 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000010))
(define-fun shl1 ((x (BitVec 64))) (BitVec 64) (bvshl x #x0000000000000001))
(define-fun if0 ((x (BitVec 64)) (y (BitVec 64)) (z (BitVec 64))) (BitVec 64) (ite (= x #x0000000000000001) y z))
(define-fun func22  ((A (BitVec 64)) ) (BitVec 64) (bvand A  #x0000000000000001 ))
(define-fun func23  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  C ) A ))
(define-fun func24  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000001 ) A ))
(define-fun func25  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000010 ) A ))
(define-fun func26  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000004 ) A ))
(define-fun func27  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (bvand (bvlshr (bvlshr C  D ) B ) A ))
(define-fun func28  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr A  B ) #x0000000000000001 ))
(define-fun func29  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr A  B ))
(define-fun func30  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  C ) A ))
(define-fun func31  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000010 ) A ))
(define-fun func32  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000004 ) A ))
(define-fun func33  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr C  D ) B ) A ))
(define-fun func34  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr C  #x0000000000000010 ) B ) A ))
(define-fun func35  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000001 ) A ))
(define-fun func36  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000001 ))
(define-fun func37  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000004 ))
(define-fun func38  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  C ) A ))
(define-fun func39  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  #x0000000000000001 ) A ))
(define-fun func40  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot B ) A ))
(define-fun func41  ((A (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot A ) #x0000000000000010 ))
(define-fun func42  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvadd B  C ) A ))
(define-fun func44  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  C ) A ))
(define-fun func45  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  #x0000000000000001 ) A ))
(define-fun func46  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr A  B ) #x0000000000000001 ))
(define-fun func47  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvnot B ) A ))
(define-fun func48  ((A (BitVec 64)) ) (BitVec 64) (bvshl (bvnot A ) #x0000000000000001 ))
(define-fun func50  ((A (BitVec 64)) ) (BitVec 64) (bvnot (bvshl A  #x0000000000000001 )))
(define-fun func51  ((A (BitVec 64)) ) (BitVec 64) (bvadd A  #x0000000000000001 ))
(define-fun func52  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvlshr B  C ) A ))
(define-fun func53  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  C ) A ))
(define-fun func54  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  #x0000000000000001 ) A ))
(define-fun func55  ((A (BitVec 64)) ) (BitVec 64) (bvor A  #x0000000000000001 ))
(define-fun func56  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvor (bvlshr B  C ) A ))
(synth-fun f ( (x (BitVec 64))) (BitVec 64)
(
(Start (BitVec 64) (
   #x0000000000000000
   #x0000000000000001
   x
   (func22 Start)
   (func24 Start Start)
   (func25 Start Start)
   (func26 Start Start)
   (func27 Start Start Start Start)
   (func33 Start Start Start Start)
   (func34 Start Start Start)
   (func36 Start Start)
   (func40 Start Start)
   (func41 Start)
   (func44 Start Start Start)
   (func47 Start Start)
   (func48 Start)
   (func52 Start Start Start)
   (func53 Start Start Start)
   (func54 Start Start)
   (func55 Start)
   (func56 Start Start Start)
   (shl1 Start)
   (shr1 Start)
   (shr4 Start)
   (bvxor Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x680fed9f2a72c5e0) #x00002fe024c1ab1a))
(constraint (= (f #xa7842e954bc496d6) #x0000b0f7a2d56876))
(constraint (= (f #x937c57a167b5c312) #x0000d90750bd3094))
(constraint (= (f #xc7796516393482c2) #x0000710d35d38d96))
(constraint (= (f #xe5d6ae22254eca20) #x00003452a3bbb562))
(constraint (= (f #x000000000056ec20) #x0000ffffffffffff))
(constraint (= (f #x0000000000780d24) #x0000ffffffffffff))
(constraint (= (f #x00000000004ac87c) #x0000ffffffffffff))
(constraint (= (f #x0000000000427f88) #x0000ffffffffffff))
(constraint (= (f #x0000000000776e40) #x0000ffffffffffff))
(constraint (= (f #x098fcb701cfb9255) #x0000131f96e039f8))
(constraint (= (f #x4ebd2ad41857fa6f) #x00009d7a55a830b0))
(constraint (= (f #xa81fa24286fc0baf) #x0001503f44850dfa))
(constraint (= (f #xd1b99fef32f7e09f) #x0001a3733fde65f0))
(constraint (= (f #x0f5cf7fb4b44a229) #x00001eb9eff6968a))
(constraint (= (f #x0000000000000000) #x0000ffffffffffff))
(constraint (= (f #xffffffffffffffff) #x0002000000000000))
(constraint (= (f #x00000000006a895b) #x00000000000000d6))
(constraint (= (f #x000000000071e36b) #x00000000000000e4))
(constraint (= (f #x000000000051b071) #x00000000000000a4))
(constraint (= (f #x0000000000764907) #x00000000000000ee))
(constraint (= (f #x00000000007e43d3) #x00000000000000fe))
(constraint (= (f #xca88294bb5e98064) #x00006aefad68942c))
(constraint (= (f #x9a35b508f185dc83) #x0001346b6a11e30c))
(constraint (= (f #xa369aaa8ff0dcb5b) #x000146d35551fe1c))
(constraint (= (f #xa5a603026a14233d) #x00014b4c0604d42a))
(constraint (= (f #x00baa8aec10012f4) #x0000fe8aaea27dff))
(constraint (= (f #x3dddfd53b3327934) #x000084440558999b))
(constraint (= (f #x0608734de4ee9aab) #x00000c10e69bc9de))
(constraint (= (f #x06c2dba0607ea2ba) #x0000f27a48bf3f02))
(constraint (= (f #x1e38cdb8e302d77c) #x0000c38e648e39fa))
(constraint (= (f #x849354bfc444569f) #x00010926a97f888a))
(constraint (= (f #x0000000000702a74) #x0000ffffffffffff))
(constraint (= (f #xffffffffffffffff) #x0002000000000000))
(constraint (= (f #x0000000000645fcd) #x00000000000000ca))
(check-synth)
