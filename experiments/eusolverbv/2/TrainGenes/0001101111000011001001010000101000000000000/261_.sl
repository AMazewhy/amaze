
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
   (func26 Start Start)
   (func27 Start Start)
   (func29 Start)
   (func30 Start Start Start Start)
   (func31 Start Start Start)
   (func32 Start Start Start)
   (func37 Start Start)
   (func38 Start Start)
   (func41 Start Start Start)
   (func44 Start Start Start)
   (func46 Start Start Start)
   (func52 Start Start Start)
   (func54 Start Start Start)
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
(constraint (= (f #x66b6f31b5084f0ea) #x0000000000000000))
(constraint (= (f #x48c8e78809a6207f) #x0000000000000001))
(constraint (= (f #xf7ef1b21e9275d2b) #x0000000000000001))
(constraint (= (f #x593dd92cff7d0135) #x0000000000000001))
(constraint (= (f #x5ecc720e73fa2938) #x0000000000000000))
(constraint (= (f #xc247c323083ed10a) #x00000c247c323083))
(constraint (= (f #x81c074c8266edb95) #x0000081c074c8266))
(constraint (= (f #xb52bdc11131bb08b) #x00000b52bdc11131))
(constraint (= (f #xf100c750ddb3c596) #x00000f100c750ddb))
(constraint (= (f #x9c84c19bc5b8720c) #x000009c84c19bc5b))
(constraint (= (f #xfffffffffffe20e6) #x00000fffffffffff))
(constraint (= (f #xfffffffffffe6879) #x00000fffffffffff))
(constraint (= (f #xfffffffffffe916a) #x00000fffffffffff))
(constraint (= (f #xfffffffffffece25) #x00000fffffffffff))
(constraint (= (f #xfffffffffffe56ea) #x00000fffffffffff))
(constraint (= (f #x0000000000000002) #x00000fffffffffff))
(constraint (= (f #x0000000000000003) #x00000fffffffffff))
(constraint (= (f #x0000000000000000) #x0000000000000000))
(constraint (= (f #xfffffffffffe0183) #x00000fffffffffff))
(constraint (= (f #xfffffffffffecc00) #x00000fffffffffff))
(constraint (= (f #xfffffffffffe1452) #x00000fffffffffff))
(constraint (= (f #xfffffffffffedf83) #x00000fffffffffff))
(constraint (= (f #xfffffffffffe1a46) #x00000fffffffffff))
(constraint (= (f #x296e29c563670c08) #x00000296e29c5636))
(constraint (= (f #x9096a7e3127e9b38) #x0000000000000000))
(constraint (= (f #x7670839c2ae8eb77) #x0000000000000001))
(constraint (= (f #x1ab9e2248573e1ee) #x0000000000000000))
(constraint (= (f #x5e1e722cecd24e91) #x000005e1e722cecd))
(constraint (= (f #x0e362e1e4ae97ded) #x0000000000000001))
(constraint (= (f #xa7e4c4437b4e5e0b) #x00000a7e4c4437b4))
(constraint (= (f #x80ea76a7e097ea87) #x0000080ea76a7e09))
(constraint (= (f #xd06e03c3ba82e5ae) #x0000000000000000))
(constraint (= (f #x868e5ac7d6019609) #x00000868e5ac7d60))
(constraint (= (f #x0000000000000002) #x00000fffffffffff))
(constraint (= (f #xfffffffffffefef1) #x00000fffffffffff))
(constraint (= (f #xfffffffffffe951c) #x00000fffffffffff))
(constraint (= (f #xf3f1717061704161) #x0000000000000001))
(check-synth)
