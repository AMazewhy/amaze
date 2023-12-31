
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
   (func28 Start Start)
   (func30 Start)
   (func32 Start Start Start)
   (func33 Start Start Start)
   (func41 Start Start)
   (func48 Start)
   (func50 Start)
   (func51 Start Start Start)
   (func55 Start Start Start)
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
(constraint (= (f #x471cdd0c27df9a73) #x471cdd0c27df9a74))
(constraint (= (f #x5111a35063c5d243) #x5111a35063c5d244))
(constraint (= (f #x4d7b7baab3e7a669) #x4d7b7baab3e7a66a))
(constraint (= (f #xda0f23f927d797a7) #xda0f23f927d797a8))
(constraint (= (f #x4bba9da0ad9da356) #x4bba9da0ad9da357))
(constraint (= (f #x975be1680c953428) #x2eb7c2d0192a6851))
(constraint (= (f #xde61047925bb7c82) #xbcc208f24b76f905))
(constraint (= (f #xd7227ab101b14fff) #xae44f56203629fff))
(constraint (= (f #x2cf521b142997d5d) #x59ea43628532fabb))
(constraint (= (f #xb2d7127386676340) #x65ae24e70ccec681))
(constraint (= (f #x69e816c22ea4e9cf) #x69e816c22ea4e9d0))
(constraint (= (f #xbef74ebc5ed2ac59) #xbef74ebc5ed2ac5a))
(constraint (= (f #xc212abce5198e615) #xc212abce5198e616))
(constraint (= (f #xacc350ed22a4e84c) #xacc350ed22a4e84d))
(constraint (= (f #xb59e8d4a81b6a680) #xb59e8d4a81b6a681))
(constraint (= (f #x0000000000000000) #x0000000000000001))
(constraint (= (f #x39b1cb1921e90000) #x7363963243d20001))
(constraint (= (f #xbde24aa07bac660e) #x7bc49540f758cc1d))
(constraint (= (f #xf3f50eaba9102cf8) #xe7ea1d57522059f1))
(constraint (= (f #xb2d67cf157685d60) #x65acf9e2aed0bac1))
(constraint (= (f #x7c81055de37a7e95) #xf9020abbc6f4fd2b))
(constraint (= (f #x0000000000000002) #x0000000000000005))
(constraint (= (f #x0000000000000003) #x0000000000000007))
(constraint (= (f #xc695d45471cb143a) #x8d2ba8a8e3962875))
(constraint (= (f #xa6ee171814a81d50) #x4ddc2e3029503aa1))
(constraint (= (f #x580384280013b2a0) #x580384280013b2a1))
(constraint (= (f #xa675efd91807f3c9) #xa675efd91807f3ca))
(constraint (= (f #xc8bb97a92d84316f) #x91772f525b0862df))
(constraint (= (f #xd82736babd79033e) #xb04e6d757af2067d))
(constraint (= (f #x5c76cc20555c88ad) #x5c76cc20555c88ae))
(constraint (= (f #x4434a96d714e3752) #x886952dae29c6ea5))
(constraint (= (f #x993a2793df930701) #x32744f27bf260e03))
(constraint (= (f #x6c3038e75387ac94) #x6c3038e75387ac95))
(constraint (= (f #x0000000000000002) #x0000000000000005))
(constraint (= (f #x0a4538a4a7849fb5) #x0a4538a4a7849fb6))
(constraint (= (f #xeff32957a964ed4b) #xeff32957a964ed4c))
(constraint (= (f #xe6ee9abf3e547bc9) #xcddd357e7ca8f793))
(constraint (= (f #xaa456803cf5a4831) #x548ad0079eb49063))
(constraint (= (f #x000af8e651ac9496) #x000af8e651ac9497))
(constraint (= (f #x5b8f33f33ea8501d) #xb71e67e67d50a03b))
(constraint (= (f #xd0f0acda8c9621d3) #xa1e159b5192c43a7))
(constraint (= (f #xaa157c871afa11ff) #x542af90e35f423ff))
(constraint (= (f #xeb587312808d00f9) #xd6b0e625011a01f3))
(constraint (= (f #x17501aa3f40ff3ac) #x17501aa3f40ff3ad))
(constraint (= (f #xb955a962df31b5de) #xb955a962df31b5df))
(constraint (= (f #x0000000000000000) #x0000000000000001))
(check-synth)
