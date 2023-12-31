
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
   (func24 Start Start Start Start)
   (func25 Start Start Start)
   (func26 Start Start)
   (func27 Start Start)
   (func29 Start Start)
   (func30 Start)
   (func33 Start Start Start)
   (func36 Start Start Start)
   (func39 Start Start)
   (func42 Start Start)
   (func43 Start Start Start)
   (func44 Start Start)
   (func46 Start Start Start)
   (func48 Start)
   (func49 Start Start Start)
   (func51 Start Start Start)
   (func52 Start Start)
   (func53 Start Start)
   (func55 Start Start Start)
   (func59 Start Start)
   (shr1 Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x767a3fdfb544269e) #x00000ecf47fbf6a8))
(constraint (= (f #xde17e05e53b62baf) #x00000bc2fc0bca76))
(constraint (= (f #x266541ccd2ac5b32) #x000004cca8399a55))
(constraint (= (f #xa512b9ab29701110) #x000004a25735652e))
(constraint (= (f #xd0170a01ed9270a3) #x00000a02e1403db2))
(constraint (= (f #x0000000000000001) #x0000000000000000))
(constraint (= (f #xe5d22ebc7b32ccbf) #x00000cba45d78f66))
(constraint (= (f #x1076dc4976f6c17b) #x0000020edb892ede))
(constraint (= (f #xc5cc186cdfc096a0) #x000008b9830d9bf8))
(constraint (= (f #x8ab7fe8da16ae479) #x00000156ffd1b42d))
(constraint (= (f #x393a0bd54324d4b9) #x00000727417aa864))
(constraint (= (f #x17b5e5871f71110a) #x017b5e5871f71110))
(constraint (= (f #xd3fc9397bcff2f98) #x0d3fc9397bcff2f9))
(constraint (= (f #x9d9f2698cb5b236b) #x09d9f2698cb5b236))
(constraint (= (f #x401e2b5d7cc91dbd) #x0401e2b5d7cc91db))
(constraint (= (f #x329ef281729d0b79) #x0329ef281729d0b7))
(constraint (= (f #x000000000000000b) #x0000000000000000))
(constraint (= (f #x000000000000000c) #x0000000000000000))
(constraint (= (f #x000000000000000e) #x0000000000000000))
(constraint (= (f #x000000000000000f) #x0000000000000000))
(constraint (= (f #x0000000000000008) #x0000000000000000))
(constraint (= (f #xb2b0bae87aa38045) #x0b2b0bae87aa3804))
(constraint (= (f #xa76ff84ee687a976) #x0a76ff84ee687a97))
(constraint (= (f #x001d78f2a203f787) #x0001d78f2a203f78))
(constraint (= (f #xa24d19ce22cdf522) #x0a24d19ce22cdf52))
(constraint (= (f #x71a4517a12998244) #x071a4517a1299824))
(constraint (= (f #xffff80003fffe002) #x0ffff80003fffe00))
(constraint (= (f #xfffffffffffffff7) #x0fffffffffffffff))
(constraint (= (f #xfffffffffffffff4) #x0fffffffffffffff))
(constraint (= (f #xfffffffffffffff0) #x0fffffffffffffff))
(constraint (= (f #xfffffffffffffff2) #x0fffffffffffffff))
(constraint (= (f #xfffffffffffffff3) #x0fffffffffffffff))
(constraint (= (f #x81554773309f161f) #x081554773309f162))
(constraint (= (f #x4d08a662420e7828) #x000009a114cc4841))
(constraint (= (f #x87191dfd6b0c8f71) #x000000e323bfad61))
(constraint (= (f #x7a329a90e14b3b9d) #x07a329a90e14b3b9))
(constraint (= (f #x1507179420c1b356) #x01507179420c1b35))
(constraint (= (f #xb31a828449a0a30c) #x0000066350508934))
(constraint (= (f #xf5dcc4fab92d3e53) #x0f5dcc4fab92d3e5))
(constraint (= (f #x66b992721ebcdc27) #x00000cd7324e43d7))
(constraint (= (f #x8b15388a7337b2b7) #x08b15388a7337b2b))
(constraint (= (f #xa1cdd6e7a800325e) #x00000439badcf500))
(constraint (= (f #xfffffffffffffff6) #x0fffffffffffffff))
(constraint (= (f #x9acee276a27764ec) #x09acee276a27764e))
(constraint (= (f #xffff80003fffe002) #x0ffff80003fffe00))
(constraint (= (f #x2e5c8988e9469eca) #x000005cb91311d28))
(constraint (= (f #xd8555c7eb4913a6a) #x0d8555c7eb4913a6))
(constraint (= (f #x1fbef035c2bd384d) #x01fbef035c2bd384))
(constraint (= (f #x2274642e84169381) #x0000044e8c85d082))
(constraint (= (f #x037c302b19d703c1) #x0037c302b19d703c))
(constraint (= (f #xfddc051e612b3d80) #x0fddc051e612b3d8))
(constraint (= (f #xf64462b7f8a527ce) #x0f64462b7f8a527c))
(check-synth)
