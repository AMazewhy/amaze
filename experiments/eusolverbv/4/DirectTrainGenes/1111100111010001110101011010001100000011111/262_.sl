
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
   (func23 Start Start Start)
   (func24 Start Start)
   (func25 Start Start)
   (func26 Start Start)
   (func29 Start Start)
   (func30 Start Start Start)
   (func31 Start Start)
   (func33 Start Start Start Start)
   (func37 Start Start)
   (func38 Start Start Start)
   (func39 Start Start)
   (func41 Start)
   (func44 Start Start Start)
   (func46 Start Start)
   (func47 Start Start)
   (func50 Start)
   (func54 Start Start)
   (func55 Start)
   (bvnot Start)
   (shl1 Start)
   (shr1 Start)
   (shr4 Start)
   (shr16 Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x942da0a0ba088aec) #x942da0a0ba088aee))
(constraint (= (f #x160f89341cadda58) #x160f89341cadda5a))
(constraint (= (f #x9bbfd5c55f4dac0c) #x9bbfd5c55f4dac0e))
(constraint (= (f #x74ea35bda70f7a5a) #x74ea35bda70f7a5c))
(constraint (= (f #xacc1a07475c88744) #xacc1a07475c88746))
(constraint (= (f #x47949b26453d5739) #x000047949b26453e))
(constraint (= (f #x7836d1d3c9b249c7) #x00007836d1d3c9b3))
(constraint (= (f #x69305770687af1d5) #x000069305770687b))
(constraint (= (f #x7f2877c0b1e1a983) #x00007f2877c0b1e2))
(constraint (= (f #x2b6a5bddd36477cd) #x00002b6a5bddd365))
(constraint (= (f #x0954829214108555) #x0000095482921411))
(constraint (= (f #xa1414a0022809451) #x0000a1414a002281))
(constraint (= (f #x8aa2a10512aa1485) #x00008aa2a10512ab))
(constraint (= (f #x4a5015290928a945) #x00004a5015290929))
(constraint (= (f #xa54454a9452a0885) #x0000a54454a9452b))
(constraint (= (f #x0000000000000001) #x0000000000000001))
(constraint (= (f #xfc362c76eb3a98e1) #x0000fc362c76eb3b))
(constraint (= (f #x61ec37e76b7131e3) #x000061ec37e76b72))
(constraint (= (f #xea2296d41b271478) #xea2296d41b27147a))
(constraint (= (f #x0a624a8eeae93351) #x00000a624a8eeaea))
(constraint (= (f #x15f8cf16aacf1f1b) #x000015f8cf16aad0))
(constraint (= (f #xab354461196abf13) #x0000ab354461196b))
(constraint (= (f #x3960c3057e45aa62) #x3960c3057e45aa64))
(constraint (= (f #x27971ff315662f9f) #x000027971ff31567))
(constraint (= (f #xe793cfad2ed6b622) #xe793cfad2ed6b624))
(constraint (= (f #xb42fbd97b621bd56) #xb42fbd97b621bd58))
(constraint (= (f #xa892244802515081) #x0000a89224480252))
(constraint (= (f #x0000000000000001) #x0000000000000001))
(constraint (= (f #x018d720ff45f4006) #x018d720ff45f4008))
(constraint (= (f #x28bb05923e767218) #x28bb05923e76721a))
(constraint (= (f #x20d22f0d91ddc28c) #x20d22f0d91ddc28e))
(check-synth)
