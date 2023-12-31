
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
(define-fun func34  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr B  C ) #x0000000000000004 ) A ))
(define-fun func35  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  C ) A ))
(define-fun func36  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000010 ) A ))
(define-fun func37  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000004 ) A ))
(define-fun func38  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000001 ) A ))
(define-fun func39  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000001 ))
(define-fun func40  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000004 ))
(define-fun func41  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr A  B ))
(define-fun func42  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  C ) A ))
(define-fun func43  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  #x0000000000000001 ) A ))
(define-fun func44  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl A  B ) #x0000000000000004 ))
(define-fun func45  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvadd B  C ) A ))
(define-fun func46  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot B ) A ))
(define-fun func47  ((A (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot A ) #x0000000000000010 ))
(define-fun func48  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvor (bvlshr B  C ) A ))
(define-fun func49  ((A (BitVec 64)) ) (BitVec 64) (bvor A  #x0000000000000001 ))
(define-fun func50  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  C ) A ))
(define-fun func51  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  #x0000000000000001 ) A ))
(define-fun func52  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr A  B ) #x0000000000000001 ))
(define-fun func54  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvlshr B  C ) A ))
(define-fun func55  ((A (BitVec 64)) ) (BitVec 64) (bvadd A  #x0000000000000001 ))
(define-fun func56  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  C ) A ))
(define-fun func57  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvadd (bvshl B  #x0000000000000001 ) A ))
(define-fun func58  ((A (BitVec 64)) ) (BitVec 64) (bvnot (bvshl A  #x0000000000000001 )))
(synth-fun f ( (x (BitVec 64))) (BitVec 64)
(
(Start (BitVec 64) (
   #x0000000000000000
   #x0000000000000001
   x
   (func25 Start Start Start)
   (func27 Start Start)
   (func28 Start Start)
   (func29 Start Start)
   (func30 Start)
   (func32 Start Start Start)
   (func34 Start Start Start)
   (func36 Start Start)
   (func37 Start Start)
   (func40 Start Start)
   (func42 Start Start Start)
   (func43 Start Start)
   (func46 Start Start)
   (func48 Start Start Start)
   (func49 Start)
   (func52 Start Start)
   (func54 Start Start Start)
   (func56 Start Start Start)
   (func57 Start Start)
   (shr1 Start)
   (shr16 Start)
   (bvadd Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x6c7911e5802cd6d8) #xfffffffffffffffe))
(constraint (= (f #x2f879f9b68084684) #xfffffffffffffffe))
(constraint (= (f #x5766b1fff9a0db54) #xfffffffffffffffe))
(constraint (= (f #x1d7e14453b2ebb36) #xfffffffffffffffe))
(constraint (= (f #xf0805f328dd80cd8) #xfffffffffffffffe))
(constraint (= (f #x9151ea42789c709e) #xfffffffffffffffe))
(constraint (= (f #xfba8d18b72ae7c94) #xfffffffffffffffe))
(constraint (= (f #xbbe7b0ae05c08928) #xfffffffffffffffe))
(constraint (= (f #xf621beea6dca907e) #xfffffffffffffffe))
(constraint (= (f #xa59bbee934d865d6) #xfffffffffffffffe))
(constraint (= (f #x679222516bb245dd) #xffffffffffffffff))
(constraint (= (f #xf1214b8eaec6b8d3) #xffffffffffffffff))
(constraint (= (f #xccb12998597a2f05) #xffffffffffffffff))
(constraint (= (f #xdcfd8f6c829c1cb5) #xffffffffffffffff))
(constraint (= (f #xe3cc1ce46504c733) #xffffffffffffffff))
(constraint (= (f #x305abfddfe095562) #x060b57fbbfc12aad))
(constraint (= (f #xe9bda3bbc58f8c47) #x0d37b47778b1f189))
(constraint (= (f #xa5b64682889b75b1) #x04b6c8d051136eb7))
(constraint (= (f #x487341bf66296678) #x090e6837ecc52cd0))
(constraint (= (f #x88c68249880d907a) #x0118d0493101b210))
(constraint (= (f #xf0f0f0f0f0f0f0f2) #xfffffffffffffffe))
(constraint (= (f #xe18a05585f549ab3) #xffffffffffffffff))
(constraint (= (f #x57528f9c430aa9e1) #xffffffffffffffff))
(constraint (= (f #xe004737f19787ce1) #xffffffffffffffff))
(constraint (= (f #x64e7dd0805c099ab) #xffffffffffffffff))
(constraint (= (f #x592f307387046cd5) #xffffffffffffffff))
(constraint (= (f #x91bc765e09312f1e) #x02378ecbc12625e4))
(constraint (= (f #xad0c327ff14f1eb5) #x05a1864ffe29e3d7))
(constraint (= (f #x62c226905bd318e1) #x0c5844d20b7a631d))
(constraint (= (f #x91a1135bdeabd163) #x0234226b7bd57a2d))
(constraint (= (f #x9fa0630a7467c1bb) #x03f40c614e8cf838))
(constraint (= (f #xd4316d4c19df64fc) #x0a862da9833beca0))
(constraint (= (f #x57d2296b6a07646e) #x0afa452d6d40ec8e))
(constraint (= (f #x1b2a3703f36561f5) #x036546e07e6cac3f))
(constraint (= (f #xb76a9e2e762d7aff) #x06ed53c5cec5af60))
(constraint (= (f #xc4af5bba416968b1) #x0895eb77482d2d17))
(constraint (= (f #x0000000000000001) #xffffffffffffffff))
(constraint (= (f #xe90300cc040371d5) #x0000000000000001))
(constraint (= (f #x7063861c7903866d) #x0000000000000001))
(constraint (= (f #x41d2bc20430fa8c1) #x0000000000000001))
(constraint (= (f #x48221518200359f9) #x0000000000000001))
(constraint (= (f #x20ab5604286b5595) #x0000000000000001))
(constraint (= (f #x67da07059d2f12f6) #x0cfb40e0b3a5e25f))
(constraint (= (f #xb6d21cf1d1f7fdca) #x06da439e3a3effba))
(constraint (= (f #x705bfe394715e653) #x0e0b7fc728e2bccb))
(constraint (= (f #x93348f06f707b158) #x026691e0dee0f62c))
(constraint (= (f #x5d1ae053c3abb56e) #x0ba35c0a787576ae))
(constraint (= (f #xd60a0024a64319b5) #x0000000000000001))
(constraint (= (f #xc19230400d2bd0d5) #x0000000000000001))
(constraint (= (f #x302703882853d425) #x0000000000000001))
(constraint (= (f #x4588a020094b5285) #x0000000000000001))
(constraint (= (f #x10068e1840c7b331) #x0000000000000001))
(constraint (= (f #x4e29208213518ca1) #x0000000000000001))
(constraint (= (f #xabb94006a641593b) #x0000000000000001))
(constraint (= (f #xc584122229599481) #x0000000000000001))
(constraint (= (f #x9ea62150140183d5) #x0000000000000001))
(constraint (= (f #x8442489c22618911) #x0000000000000001))
(constraint (= (f #x41a01444e1010c5d) #x0000000000000001))
(constraint (= (f #x625808820765b899) #x0000000000000001))
(constraint (= (f #x5214ac0a1365ac11) #x0000000000000001))
(constraint (= (f #x2bf6d40001214c4b) #x0000000000000001))
(constraint (= (f #x705c0ca2a3055409) #x0000000000000001))
(constraint (= (f #x41f34d53ea7a080f) #xffffffffffffffff))
(constraint (= (f #xe83fe6f443ae1de9) #xffffffffffffffff))
(constraint (= (f #x24cfe44f1b502efd) #xffffffffffffffff))
(constraint (= (f #xd3c1c9beca800d39) #xffffffffffffffff))
(constraint (= (f #x8d68ec40158395c6) #x01ad1d8802b072b9))
(constraint (= (f #x380e8d3de0576b16) #x0701d1a7bc0aed63))
(constraint (= (f #x55fa16725a2ccd63) #xffffffffffffffff))
(constraint (= (f #x78ff15385e102c08) #xfffffffffffffffe))
(constraint (= (f #x89785737f6a53507) #x012f0ae6fed4a6a1))
(constraint (= (f #x5bc062a595c7e58c) #x0b780c54b2b8fcb2))
(constraint (= (f #x90652b125081243f) #x0000000000000001))
(constraint (= (f #x6b1216d18be69b5e) #xfffffffffffffffe))
(constraint (= (f #x01e0bff00208a817) #xffffffffffffffff))
(constraint (= (f #x11ccab04aa0b18f7) #x023995609541631f))
(constraint (= (f #x30fc73400c8debd4) #x061f8e680191bd7b))
(constraint (= (f #x9d50a8e816ee7450) #xfffffffffffffffe))
(constraint (= (f #x759a000426bb5845) #x0000000000000001))
(constraint (= (f #xc32f4c40c5368925) #xffffffffffffffff))
(constraint (= (f #xd7de05d8ee194865) #x0afbc0bb1dc3290d))
(constraint (= (f #xb2f2633e346d7021) #x065e4c67c68dae05))
(constraint (= (f #x4663e97370b56d24) #x08cc7d2e6e16ada5))
(constraint (= (f #x10b88c00510f0271) #x0000000000000001))
(constraint (= (f #x580423b2500983c5) #x0000000000000001))
(constraint (= (f #x3b9a1c91839f9b4d) #x077343923073f36a))
(constraint (= (f #x07a92604251e2c17) #xffffffffffffffff))
(constraint (= (f #x0000000000000001) #xffffffffffffffff))
(constraint (= (f #xf0f0f0f0f0f0f0f2) #xfffffffffffffffe))
(constraint (= (f #xd9964e65797c7fa2) #xfffffffffffffffe))
(constraint (= (f #x17e41ce0f8467b01) #xffffffffffffffff))
(constraint (= (f #xe66399dac2427228) #xfffffffffffffffe))
(constraint (= (f #x7b8c097e33c2027c) #xfffffffffffffffe))
(constraint (= (f #x99e0b2875a38bab6) #xfffffffffffffffe))
(constraint (= (f #x7f29177bd01417ce) #xfffffffffffffffe))
(constraint (= (f #xcfe100b7f2623e82) #xfffffffffffffffe))
(constraint (= (f #xbd1391053b8a0581) #xffffffffffffffff))
(constraint (= (f #x6da63cd20cbecfcd) #xffffffffffffffff))
(constraint (= (f #xda325c5bda4f59af) #x0b464b8b7b49eb36))
(constraint (= (f #xf06d0b2fcc07749a) #x0e0da165f980ee94))
(check-synth)
