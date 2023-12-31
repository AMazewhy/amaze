
(set-logic BV)

(define-fun shr1 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000001))
(define-fun shr4 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000004))
(define-fun shr16 ((x (BitVec 64))) (BitVec 64) (bvlshr x #x0000000000000010))
(define-fun shl1 ((x (BitVec 64))) (BitVec 64) (bvshl x #x0000000000000001))
(define-fun if0 ((x (BitVec 64)) (y (BitVec 64)) (z (BitVec 64))) (BitVec 64) (ite (= x #x0000000000000001) y z))
(define-fun func24  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) (D (BitVec 64)) ) (BitVec 64) (bvand (bvlshr (bvlshr C  D ) B ) A ))
(define-fun func25  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvand (bvlshr (bvlshr B  C ) A ) #x0000000000000004 ))
(define-fun func26  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvand (bvlshr (bvlshr B  C ) #x0000000000000004 ) A ))
(define-fun func27  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  C ) A ))
(define-fun func28  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000010 ) A ))
(define-fun func29  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvand (bvlshr B  #x0000000000000001 ) A ))
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
(define-fun func44  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot B ) A ))
(define-fun func45  ((A (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot A ) #x0000000000000010 ))
(define-fun func46  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvadd B  C ) A ))
(define-fun func47  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  C ) A ))
(define-fun func48  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  #x0000000000000001 ) A ))
(define-fun func49  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr A  B ) #x0000000000000001 ))
(define-fun func51  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvnot B ) A ))
(define-fun func52  ((A (BitVec 64)) ) (BitVec 64) (bvshl (bvnot A ) #x0000000000000001 ))
(define-fun func53  ((A (BitVec 64)) ) (BitVec 64) (bvnot (bvshl A  #x0000000000000001 )))
(define-fun func55  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvlshr B  C ) A ))
(define-fun func56  ((A (BitVec 64)) ) (BitVec 64) (bvadd A  #x0000000000000001 ))
(define-fun func57  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  C ) A ))
(define-fun func58  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  #x0000000000000001 ) A ))
(define-fun func59  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvor (bvlshr B  C ) A ))
(define-fun func60  ((A (BitVec 64)) ) (BitVec 64) (bvor A  #x0000000000000001 ))
(synth-fun f ( (x (BitVec 64))) (BitVec 64)
(
(Start (BitVec 64) (
   #x0000000000000000
   #x0000000000000001
   x
   (func24 Start Start Start Start)
   (func25 Start Start Start)
   (func30 Start Start)
   (func33 Start Start Start Start)
   (func35 Start Start Start)
   (func36 Start Start)
   (func37 Start Start)
   (func38 Start Start)
   (func39 Start Start)
   (func40 Start Start)
   (func41 Start Start)
   (func42 Start Start Start)
   (func46 Start Start Start)
   (func47 Start Start Start)
   (func48 Start Start)
   (func49 Start Start)
   (func56 Start)
   (func57 Start Start Start)
   (func58 Start Start)
   (func59 Start Start Start)
   (func60 Start)
   (shr1 Start)
   (shr16 Start)
   (bvxor Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x6d1e607710691396) #xda3cc0ee20d2272e))
(constraint (= (f #x675aecbae08b4a14) #xceb5d975c116942a))
(constraint (= (f #xbe0160eb542aa373) #xbe0160eb542aa373))
(constraint (= (f #x253ac2ea42e1a49e) #x4a7585d485c3493e))
(constraint (= (f #x4238c39857ad3006) #x84718730af5a600e))
(constraint (= (f #x6cb09733ce90d037) #x6cb09733ce90d037))
(constraint (= (f #xac3c44aa716920ee) #x58788954e2d241de))
(constraint (= (f #x98ec5d22bd30b4d2) #x31d8ba457a6169a6))
(constraint (= (f #xbc4955e77a7eb8b6) #x7892abcef4fd716e))
(constraint (= (f #x993eee07446e8a7e) #x327ddc0e88dd14fe))
(check-synth)
