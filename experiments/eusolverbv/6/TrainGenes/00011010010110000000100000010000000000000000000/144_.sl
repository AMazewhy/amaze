
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
   (func35 Start Start Start)
   (func37 Start Start)
   (func38 Start Start)
   (func46 Start)
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
(constraint (= (f #xcab78395590116a5) #x0000cab783955901))
(constraint (= (f #x393111390d0fb043) #x0000393111390d0f))
(constraint (= (f #x7bf5b39a881a458e) #x00007bf5b39a881a))
(constraint (= (f #x1a62e96b79c51c0d) #x00001a62e96b79c5))
(constraint (= (f #x90c5bdd0a18273ab) #x000090c5bdd0a182))
(constraint (= (f #x42e40052d3f7809c) #xbd1bffad2c087f63))
(constraint (= (f #xedf17067e5d63857) #x120e8f981a29c7a8))
(constraint (= (f #x174708f2c51970f7) #xe8b8f70d3ae68f08))
(constraint (= (f #x872a83566c6d9236) #x78d57ca993926dc9))
(constraint (= (f #x9463b44d394f97f1) #x6b9c4bb2c6b0680e))
(constraint (= (f #x0000000000000001) #xfffffffffffffffe))
(constraint (= (f #x00000010ab277b62) #x000000000010ab27))
(constraint (= (f #x000000114fea5c8f) #x0000000000114fea))
(constraint (= (f #x000000185f09cac6) #x0000000000185f09))
(constraint (= (f #x8000001ebf0e9d8a) #x00008000001ebf0e))
(constraint (= (f #x8000001771084a09) #x0000800000177108))
(constraint (= (f #xaaaaaaaaaaaaaab3) #x555555555555554c))
(constraint (= (f #xaaaaaaaaaaaaaabe) #x5555555555555541))
(constraint (= (f #xaaaaaaaaaaaaaaba) #x5555555555555545))
(constraint (= (f #xaaaaaaaaaaaaaab2) #x555555555555554d))
(constraint (= (f #xaaaaaaaaaaaaaab5) #x555555555555554a))
(constraint (= (f #x800000166cee369a) #xfffffffffffffffe))
(constraint (= (f #x0000001a7d94e578) #xfffffffffffffffe))
(constraint (= (f #x0000001d227ed43b) #xfffffffffffffffe))
(constraint (= (f #x8000001577163f50) #xfffffffffffffffe))
(constraint (= (f #x800000159d50b0d3) #xfffffffffffffffe))
(constraint (= (f #x62601fff43824f8f) #x000062601fff4382))
(constraint (= (f #x632a8445205ded34) #x9cd57bbadfa212cb))
(constraint (= (f #x0b9a883e5fb4fdd2) #xf46577c1a04b022d))
(constraint (= (f #x9837f2c36f809897) #x67c80d3c907f6768))
(constraint (= (f #x9f43961222bcf623) #x00009f43961222bc))
(constraint (= (f #xbcd460bafebf952d) #x0000bcd460bafebf))
(constraint (= (f #xddc65726ed62fe3e) #x2239a8d9129d01c1))
(constraint (= (f #x911a146d119db229) #x0000911a146d119d))
(constraint (= (f #x67e1e77388c7128c) #x000067e1e77388c7))
(constraint (= (f #xa9af7848b27c5e35) #x565087b74d83a1ca))
(constraint (= (f #x8000001decea6491) #xfffffffffffffffe))
(constraint (= (f #x000000178655fb44) #x0000000000178655))
(constraint (= (f #x80000011b3b5ec7c) #xfffffffffffffffe))
(constraint (= (f #x000000190ae528b5) #xfffffffffffffffe))
(constraint (= (f #x800000152fcc7d49) #x0000800000152fcc))
(constraint (= (f #xef4fb54b20c9e674) #x10b04ab4df36198b))
(constraint (= (f #x485c2bf18df74231) #xb7a3d40e7208bdce))
(constraint (= (f #x0000000000000001) #xfffffffffffffffe))
(check-synth)
