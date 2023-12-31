
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
   (func29 Start Start)
   (func30 Start Start)
   (func31 Start Start)
   (func32 Start)
   (func33 Start Start Start Start)
   (func34 Start Start Start)
   (func37 Start Start)
   (func38 Start Start)
   (func40 Start Start)
   (func41 Start Start)
   (func42 Start Start Start)
   (func47 Start)
   (func48 Start Start Start)
   (func49 Start)
   (func50 Start Start Start)
   (func52 Start Start)
   (func54 Start Start Start)
   (func58 Start)
   (bvnot Start)
   (shl1 Start)
   (bvor Start Start)
   (bvxor Start Start)
   (bvadd Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x094bb4a9837ece5a) #x094bb4a9837ece5c))
(constraint (= (f #xdde1c2c640bc79ca) #xdde1c2c640bc79cc))
(constraint (= (f #x49bfe211991c30dc) #x49bfe211991c30de))
(constraint (= (f #x1eedb3a9c018214a) #x1eedb3a9c018214c))
(constraint (= (f #x366238c61174d5fe) #x366238c61174d600))
(constraint (= (f #x0000000000000000) #x0000000000000002))
(constraint (= (f #xde034f0dad7d1dc0) #x0000de034f0dad7d))
(constraint (= (f #x3ccb2f57b8c989b4) #x00003ccb2f57b8c9))
(constraint (= (f #xa95f749597b3b632) #x0000a95f749597b3))
(constraint (= (f #x32a5d8596b19fe78) #x000032a5d8596b19))
(constraint (= (f #xbcad1ff85361be5a) #x0000bcad1ff85361))
(constraint (= (f #x4fd83c91c85f279f) #x0000000000000002))
(constraint (= (f #xe517f1b2828d545f) #x0000000000000002))
(constraint (= (f #x0ee8e26266913151) #x0000000000000002))
(constraint (= (f #xf0aab5ae56db3765) #x0000000000000002))
(constraint (= (f #x7956c147bed33067) #x0000000000000002))
(constraint (= (f #x243fe894b57ac4e7) #x0000243fe894b57a))
(constraint (= (f #x29cc40aeed0ad493) #x000029cc40aeed0a))
(constraint (= (f #xf6915beaa008c847) #x0000f6915beaa008))
(constraint (= (f #x3df1fe8082eae4c5) #x00003df1fe8082ea))
(constraint (= (f #x5bb41bb42674c37b) #x00005bb41bb42674))
(constraint (= (f #x4000000000000001) #x0000000000000000))
(constraint (= (f #xa000000000000001) #x0000000000000000))
(constraint (= (f #x0000000000000001) #x0000000000000000))
(constraint (= (f #x5000000000000001) #x0000000000000000))
(constraint (= (f #x6000000000000001) #x0000000000000000))
(constraint (= (f #x541a486debee6ee3) #x0000541a486debee))
(constraint (= (f #xe5be55a30ebc7880) #xe5be55a30ebc7882))
(constraint (= (f #x322473791e191dbc) #x0000322473791e19))
(constraint (= (f #xe735725aee3eebeb) #x0000e735725aee3e))
(constraint (= (f #x83bbebe9e88e3257) #x000083bbebe9e88e))
(constraint (= (f #x9dcebed0204c4146) #x9dcebed0204c4148))
(constraint (= (f #x1bb3c7716677ae6c) #x00001bb3c7716677))
(constraint (= (f #xa955e45a3c83cbca) #x0000a955e45a3c83))
(constraint (= (f #x27762c119e3ae5ad) #x000027762c119e3a))
(constraint (= (f #xc49e108cb38623b0) #xc49e108cb38623b2))
(constraint (= (f #x6000000000000001) #x0000000000000000))
(constraint (= (f #x3088f980e0130121) #x0000000000000002))
(constraint (= (f #x7733333111111101) #x0000000000000002))
(constraint (= (f #x354197db80cb047f) #x0000000000000002))
(constraint (= (f #x7777777777766667) #x0000777777777776))
(constraint (= (f #x7755555555544001) #x0000775555555554))
(check-synth)
