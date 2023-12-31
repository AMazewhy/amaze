
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
   (func28 Start Start)
   (func29 Start Start)
   (func32 Start Start Start)
   (func34 Start Start)
   (func35 Start Start Start)
   (func36 Start Start Start)
   (func37 Start Start)
   (func38 Start Start)
   (func39 Start Start)
   (func41 Start Start)
   (func42 Start Start)
   (func43 Start Start Start)
   (func44 Start Start)
   (func45 Start Start)
   (func46 Start Start Start)
   (func47 Start Start)
   (func48 Start)
   (func49 Start Start Start)
   (func50 Start)
   (func52 Start Start)
   (func53 Start Start)
   (func55 Start Start Start)
   (func56 Start)
   (func57 Start Start Start)
   (func58 Start Start)
   (func59 Start Start)
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
(constraint (= (f #x7f79e1e128db66ce) #xfef3c3c251b6cd9c))
(constraint (= (f #xf31ae49c80bdc1bf) #xe635c939017b837e))
(constraint (= (f #x8ce2ef837bb9e1f3) #x19c5df06f773c3e6))
(constraint (= (f #x4bb245fabc554f6e) #x97648bf578aa9edc))
(constraint (= (f #x3532e820a85f4266) #x6a65d04150be84cc))
(constraint (= (f #xc18b46809a2f84a0) #xc18b46809a2f84a0))
(constraint (= (f #xcd1465c791eb3784) #xcd1465c791eb3784))
(constraint (= (f #x0f0af618744d269e) #x0f0af618744d269e))
(constraint (= (f #x8b254010292f93f2) #x8b254010292f93f2))
(constraint (= (f #xc369d6f633a51a07) #xc369d6f633a51a07))
(constraint (= (f #x8fdef03c2112fb11) #xaf9cd0b46338f132))
(constraint (= (f #x016fa7fc9170e9ab) #x044ef7f5b452bd00))
(constraint (= (f #xe9ad7cce54be335e) #xbd08766afe3a9a1a))
(constraint (= (f #xa40205bb9158ed58) #xec061132b40ac808))
(constraint (= (f #x4fd97c6a027c7cf9) #xef8c753e077576ea))
(constraint (= (f #x32ef9865a6c4a1b7) #x98cec930f44de524))
(constraint (= (f #x535da4167b0232a1) #xfa18ec43710697e2))
(constraint (= (f #x518ce83082061a23) #xf4a6b89186124e68))
(constraint (= (f #x910af0ff95a24fa6) #xb320d2fec0e6eef2))
(constraint (= (f #xc010f25ba48aa112) #x4032d712ed9fe336))
(constraint (= (f #x07fff81000f00081) #x0ffff02001e00102))
(constraint (= (f #x0000000ffff00041) #x0000001fffe00082))
(constraint (= (f #x000000ffff100031) #x000001fffe200062))
(constraint (= (f #x0001fffe00101ff1) #x0003fffc00203fe2))
(constraint (= (f #x000007fff8100031) #x00000ffff0200062))
(constraint (= (f #xffff0001000efff3) #xfffe0002001dffe6))
(constraint (= (f #xffff00020002000f) #xfffe00040004001e))
(constraint (= (f #xffff0002000207ff) #xfffe000400040ffe))
(constraint (= (f #x00ffff04000401fd) #x01fffe08000803fa))
(constraint (= (f #x00001fffe00807f9) #x00003fffc0100ff2))
(check-synth)
