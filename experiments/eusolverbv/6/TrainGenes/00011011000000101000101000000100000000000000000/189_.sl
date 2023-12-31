
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
   (func32 Start)
   (func33 Start Start Start Start)
   (func40 Start Start)
   (func42 Start Start Start)
   (func46 Start)
   (func48 Start Start Start)
   (func56 Start Start)
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
(constraint (= (f #xe7786a9cb5059108) #xe7786a9cb5059108))
(constraint (= (f #x34a8cea8c0f98218) #x34a8cea8c0f98218))
(constraint (= (f #x5ebd2516509a1869) #x5ebd2516509a186b))
(constraint (= (f #x63b3fb1d6c43edb8) #x63b3fb1d6c43edb8))
(constraint (= (f #xb0c9da9dff2585d8) #xb0c9da9dff2585d8))
(constraint (= (f #x283d8d68c66fba8c) #x283d8d68c66fba8e))
(constraint (= (f #xfd7faba3e09180cd) #xfd7faba3e09180cf))
(constraint (= (f #xcd5c187317ca845c) #xcd5c187317ca845e))
(constraint (= (f #xffd2c4fc503485b5) #xffd2c4fc503485b7))
(constraint (= (f #x8caa6b82d08d8dac) #x8caa6b82d08d8dae))
(constraint (= (f #xffffffffffffffd9) #xffffffffffffffdb))
(constraint (= (f #xffffffffffffffd1) #xffffffffffffffd3))
(constraint (= (f #xffffffffffffffc0) #xffffffffffffffc0))
(constraint (= (f #x0d28125dc49d924f) #x0d28125dc49d9251))
(constraint (= (f #x2490f6f71ec37402) #x2490f6f71ec37402))
(constraint (= (f #x3fdca2a621359ba7) #x3fdca2a621359ba9))
(constraint (= (f #x5498bbe82358abea) #x5498bbe82358abea))
(constraint (= (f #xe84219d1e1b2011f) #xe84219d1e1b20121))
(constraint (= (f #xffffffffffffffcc) #xffffffffffffffcc))
(constraint (= (f #xffffffffffffffdd) #xffffffffffffffdf))
(constraint (= (f #xffffffffffffffdc) #xffffffffffffffdc))
(constraint (= (f #x7f66bee18685269e) #x7f66bee18685269c))
(constraint (= (f #x5a800892d5d65f43) #x5a800892d5d65f41))
(constraint (= (f #xd6113bcdbf7a2173) #xd6113bcdbf7a2171))
(constraint (= (f #x0a9e39cd996cde06) #x0a9e39cd996cde04))
(constraint (= (f #x6c60db5fefdbd70b) #x6c60db5fefdbd709))
(constraint (= (f #xffffffffffffffc2) #xffffffffffffffc0))
(constraint (= (f #xffffffffffffffca) #xffffffffffffffc8))
(constraint (= (f #xffffffffffffffc7) #xffffffffffffffc5))
(constraint (= (f #x0000000000000003) #x0000000000000001))
(constraint (= (f #xffffffffffffffcb) #xffffffffffffffc9))
(constraint (= (f #xffffffffffffffdb) #xffffffffffffffd9))
(constraint (= (f #xffffffffffffffd6) #xffffffffffffffd4))
(constraint (= (f #xffffffffffffffc3) #xffffffffffffffc1))
(constraint (= (f #xade13f6bfe2f0162) #xade13f6bfe2f0162))
(constraint (= (f #xab200ef52355d456) #xab200ef52355d454))
(constraint (= (f #x68da3daceadb9c35) #x68da3daceadb9c37))
(constraint (= (f #xc280e4eb95997644) #xc280e4eb95997646))
(constraint (= (f #xc90cd4702e8a5a4e) #xc90cd4702e8a5a4c))
(constraint (= (f #x9ab8f0ec81cca828) #x9ab8f0ec81cca828))
(constraint (= (f #x24bad8ea21b29690) #x24bad8ea21b29690))
(constraint (= (f #x7bf97fab0d671c18) #x7bf97fab0d671c18))
(constraint (= (f #xd35b75cb376561fb) #xd35b75cb376561f9))
(constraint (= (f #x11dc7febf1425166) #x11dc7febf1425164))
(constraint (= (f #x1fb2db69636673cf) #x1fb2db69636673d1))
(constraint (= (f #xffffffffffffffce) #xffffffffffffffcc))
(constraint (= (f #xffffffffffffffd0) #xffffffffffffffd0))
(constraint (= (f #xffffffffffffffcc) #xffffffffffffffcc))
(constraint (= (f #xffffffffffffffda) #xffffffffffffffd8))
(constraint (= (f #xd8d29c30a8153567) #xd8d29c30a8153569))
(constraint (= (f #xfe76e1c4990cbd1f) #xfe76e1c4990cbd21))
(constraint (= (f #xfd9a6c45dc3db027) #xfd9a6c45dc3db029))
(constraint (= (f #x0000000000000003) #x0000000000000001))
(constraint (= (f #x87ecc81e8b3f1a97) #x87ecc81e8b3f1a99))
(constraint (= (f #x8ff52e5f5ee1f2c2) #x8ff52e5f5ee1f2c2))
(constraint (= (f #xfaf5a5e9e5fe79ea) #xfaf5a5e9e5fe79ea))
(constraint (= (f #x6f7abbd6db7ebaae) #x6f7abbd6db7ebaac))
(constraint (= (f #xae83110ea89ab064) #xae83110ea89ab066))
(constraint (= (f #x0000000000000002) #x0000000000000002))
(constraint (= (f #x6db6eb756abdbaea) #x6db6eb756abdbaea))
(constraint (= (f #x38555aada76bd91a) #x38555aada76bd91a))
(constraint (= (f #x13a3f984f8ed5499) #x13a3f984f8ed549b))
(constraint (= (f #xffffffffffffffde) #xffffffffffffffdc))
(constraint (= (f #xffffffffffffffcf) #xffffffffffffffcd))
(constraint (= (f #xfc3db6b5b5e7b7d4) #xfc3db6b5b5e7b7d6))
(constraint (= (f #xffffffffffffffc8) #xffffffffffffffc8))
(constraint (= (f #x78fe3c4a39e0284c) #x78fe3c4a39e0284e))
(constraint (= (f #xfffeeeeeeee66647) #xfffeeeeeeee66649))
(constraint (= (f #xffffffffffffffc5) #xffffffffffffffc7))
(constraint (= (f #xf5e7afdf5b6be784) #xf5e7afdf5b6be786))
(constraint (= (f #xd6b5febbdb55ddda) #xd6b5febbdb55ddda))
(check-synth)
