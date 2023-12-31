
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
(define-fun func31  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr C  #x0000000000000010 ) B ) A ))
(define-fun func32  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  C ) A ))
(define-fun func33  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000010 ) A ))
(define-fun func34  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000004 ) A ))
(define-fun func35  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000001 ) A ))
(define-fun func36  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000001 ))
(define-fun func37  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000004 ))
(define-fun func38  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr A  B ))
(define-fun func39  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  C ) A ))
(define-fun func40  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  #x0000000000000001 ) A ))
(define-fun func41  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvadd B  C ) A ))
(define-fun func42  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot B ) A ))
(define-fun func43  ((A (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot A ) #x0000000000000010 ))
(define-fun func44  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvor (bvlshr B  C ) A ))
(define-fun func45  ((A (BitVec 64)) ) (BitVec 64) (bvor A  #x0000000000000001 ))
(define-fun func46  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  C ) A ))
(define-fun func47  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  #x0000000000000001 ) A ))
(define-fun func48  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr A  B ) #x0000000000000001 ))
(define-fun func50  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvnot B ) A ))
(define-fun func51  ((A (BitVec 64)) ) (BitVec 64) (bvshl (bvnot A ) #x0000000000000001 ))
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
   (func28 Start Start)
   (func31 Start Start Start)
   (func33 Start Start)
   (func34 Start Start)
   (func35 Start Start)
   (func36 Start Start)
   (func39 Start Start Start)
   (func40 Start Start)
   (func41 Start Start Start)
   (func44 Start Start Start)
   (func46 Start Start Start)
   (func47 Start Start)
   (func48 Start Start)
   (func50 Start Start)
   (func51 Start)
   (func52 Start Start Start)
   (func53 Start)
   (func54 Start Start Start)
   (func55 Start Start)
   (func56 Start)
   (bvnot Start)
   (shl1 Start)
   (shr1 Start)
   (shr4 Start)
   (bvxor Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x23d6e4d10aee6bf0) #x47adc9a215dcd7e2))
(constraint (= (f #x2605ef8cfc17d648) #x4c0bdf19f82fac92))
(constraint (= (f #x6e27e30c730d9a8e) #xdc4fc618e61b351e))
(constraint (= (f #xd5200fc82516e2b4) #xaa401f904a2dc56a))
(constraint (= (f #x6258d286b46580b6) #xc4b1a50d68cb016e))
(constraint (= (f #x7892446f98b9e5e1) #xf12488df3173cbc0))
(constraint (= (f #x54a8bc8fd38646dd) #xa951791fa70c8db8))
(constraint (= (f #x8c515d54bf3b90b1) #x18a2baa97e772160))
(constraint (= (f #x77ee8c9bc9f05b33) #xefdd193793e0b664))
(constraint (= (f #x80ae6440770fe7a3) #x015cc880ee1fcf44))
(constraint (= (f #xaaaaaaaaaaaaaaab) #x0000000000000000))
(constraint (= (f #x2a58ae54944916d1) #x54b15ca928922da0))
(constraint (= (f #x1175c4475db9fc8c) #x22eb888ebb73f91a))
(constraint (= (f #x1f767a23ebb8605a) #x3eecf447d770c0b6))
(constraint (= (f #x5a56a11e802638d1) #xb4ad423d004c71a0))
(constraint (= (f #xe00f747711b93444) #xc01ee8ee2372688a))
(constraint (= (f #x834b83db6509cb22) #x069707b6ca139646))
(constraint (= (f #xd9005751d3fc5443) #xb200aea3a7f8a884))
(constraint (= (f #x45ef274488c96737) #x8bde4e891192ce6c))
(constraint (= (f #xe3f732fa9add18a8) #xc7ee65f535ba3152))
(constraint (= (f #x051e96eda5baf936) #x0a3d2ddb4b75f26e))
(constraint (= (f #xaaaaaaaaaaaaaaab) #x0000000000000000))
(constraint (= (f #xa45015508a8a284b) #x48a02aa115145094))
(check-synth)
