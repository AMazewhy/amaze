
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
   (func25 Start Start)
   (func27 Start Start Start Start)
   (func28 Start Start)
   (func29 Start Start)
   (func32 Start Start)
   (func34 Start Start Start)
   (func35 Start Start)
   (func37 Start Start)
   (func38 Start Start Start)
   (func42 Start Start Start)
   (func44 Start Start Start)
   (func45 Start Start)
   (func51 Start)
   (func55 Start)
   (func56 Start Start Start)
   (shl1 Start)
   (shr4 Start)
   (bvor Start Start)
   (bvxor Start Start)
   (bvadd Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #xd62180ae64fd2654) #x0000000000000000))
(constraint (= (f #x2d35a0592b916208) #x0000000000000000))
(constraint (= (f #x590c1b476ac114b4) #x0000000000000000))
(constraint (= (f #xd053084940f99758) #x0000000000000000))
(constraint (= (f #x8d10a6557961d750) #x0000000000000000))
(constraint (= (f #x25ceb5d256071341) #x0000000000000000))
(constraint (= (f #x72bde272e713b821) #x0000000000000000))
(constraint (= (f #xf6c16177b2330fdb) #x0000000000000000))
(constraint (= (f #x20fe7339afb1891f) #x0000000000000000))
(constraint (= (f #x1d6825c11b07da3b) #x0000000000000000))
(constraint (= (f #x9b4683b1fa7805a2) #x0000000000000000))
(constraint (= (f #xc99e9749106ccb76) #x0000000000000000))
(constraint (= (f #xf8da615c67ca17ca) #x0000000000000000))
(constraint (= (f #x069536d77eaca23c) #x0000000000000000))
(constraint (= (f #x6b850f9d64aeabc0) #x0000000000000000))
(constraint (= (f #x91c0303e1a085045) #x0000000000000000))
(constraint (= (f #x259a8c6046081b79) #x0000000000000000))
(constraint (= (f #xdf4ec62142322019) #x0000000000000000))
(constraint (= (f #x644ddf1321c4b281) #x0000000000000000))
(constraint (= (f #x1db8de54469cab53) #x0000000000000000))
(constraint (= (f #xc80e0050db814622) #x0000000000000000))
(constraint (= (f #x818ee25c17d12c2c) #x0000000000000000))
(constraint (= (f #x27e39d3040c71c7c) #x0000000000000000))
(constraint (= (f #x4ef907d52c142921) #x0000000000000000))
(constraint (= (f #xfaf8df378a6ce593) #x0000000000000000))
(constraint (= (f #xcfa915f6549478c4) #x0000000000000000))
(constraint (= (f #x664681b6aa09815e) #x0000000000000000))
(constraint (= (f #x0b45bd9fb86314f6) #x0000000000000000))
(constraint (= (f #x02148dab5c584d1f) #x0000000000000000))
(constraint (= (f #x8e6ffb86582eb48a) #x0000000000000000))
(constraint (= (f #x5c9e14d30ae97fb5) #x0000000000000000))
(check-synth)
