
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
(define-fun func31  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr B  C ) A ) #x0000000000000004 ))
(define-fun func32  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr C  #x0000000000000010 ) B ) A ))
(define-fun func33  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr (bvlshr B  C ) #x0000000000000004 ) A ))
(define-fun func34  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  C ) A ))
(define-fun func35  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000010 ) A ))
(define-fun func36  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000004 ) A ))
(define-fun func37  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr B  #x0000000000000001 ) A ))
(define-fun func38  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000001 ))
(define-fun func39  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvlshr A  B ) #x0000000000000004 ))
(define-fun func40  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr A  B ))
(define-fun func41  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  C ) A ))
(define-fun func42  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl B  #x0000000000000001 ) A ))
(define-fun func43  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvadd B  C ) A ))
(define-fun func44  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot B ) A ))
(define-fun func45  ((A (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot A ) #x0000000000000010 ))
(define-fun func46  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvor (bvlshr B  C ) A ))
(define-fun func47  ((A (BitVec 64)) ) (BitVec 64) (bvor A  #x0000000000000001 ))
(define-fun func48  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  C ) A ))
(define-fun func49  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  #x0000000000000001 ) A ))
(define-fun func50  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr A  B ) #x0000000000000001 ))
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
   (func23 Start Start Start Start)
   (func27 Start Start)
   (func28 Start Start)
   (func29 Start)
   (func30 Start Start Start Start)
   (func34 Start Start Start)
   (func35 Start Start)
   (func37 Start Start)
   (func38 Start Start)
   (func39 Start Start)
   (func40 Start Start)
   (func43 Start Start Start)
   (func44 Start Start)
   (func45 Start)
   (func47 Start)
   (func49 Start Start)
   (func50 Start Start)
   (func52 Start Start Start)
   (func53 Start)
   (func54 Start Start Start)
   (func55 Start Start)
   (bvnot Start)
   (shl1 Start)
   (shr1 Start)
   (shr4 Start)
   (shr16 Start)
   (bvor Start Start)
   (bvxor Start Start)
   (bvadd Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #xdc0db1fe65d480d2) #x0b81b63fccba901a))
(constraint (= (f #xe0f434ba9eac7fb0) #x0c1e869753d58ff6))
(constraint (= (f #xf43741a592853010) #x0e86e834b250a602))
(constraint (= (f #x95135627f5825940) #x02a26ac4feb04b28))
(constraint (= (f #x59155ad2c35d2cc2) #x0b22ab5a586ba598))
(constraint (= (f #x92cf046ccf765861) #x0259e08d99eecb0c))
(constraint (= (f #x3b96819dde473553) #x0772d033bbc8e6aa))
(constraint (= (f #x81164b48f6e2bf91) #x0022c9691edc57f2))
(constraint (= (f #x511b861337d85403) #x0a2370c266fb0a80))
(constraint (= (f #xdfb1db0bddff1e21) #x0bf63b617bbfe3c4))
(constraint (= (f #xc7312af5229eda76) #x0000000000000000))
(constraint (= (f #x8d9a6b958141db54) #x0000000000000000))
(constraint (= (f #x0dbd8c5eb9b503f4) #x0000000000000000))
(constraint (= (f #xffcaadc3278eb616) #x0000000000000000))
(constraint (= (f #x17a796212c115a16) #x0000000000000000))
(constraint (= (f #xcaee047fcc55e23a) #x095dc08ff98abc47))
(constraint (= (f #x319353b27b28ac38) #x06326a764f651587))
(constraint (= (f #xe60046eb0c554e6a) #x0cc008dd618aa9cd))
(constraint (= (f #xfa0a6e3668c673e8) #x0f414dc6cd18ce7d))
(constraint (= (f #x3c0da109236c7d18) #x0781b421246d8fa3))
(constraint (= (f #xffff000000000002) #x0000000000000000))
(constraint (= (f #x3f6976ebdf756c55) #x0812d12284115275))
(constraint (= (f #x429d92b23e6c6de5) #x07ac4da9b8327243))
(constraint (= (f #xc204b26934bb89ff) #x07bf69b2d9688ec0))
(constraint (= (f #xe53b39ecd9aa31bf) #x035898c264cab9c8))
(constraint (= (f #xb71e26328dc36b85) #x091c3b39ae47928f))
(constraint (= (f #x03c3060b4850c213) #x007860c1690a1842))
(constraint (= (f #xf01a5094870d0291) #x0e034a1290e1a052))
(constraint (= (f #x6812161c0c02d0d3) #x0d0242c381805a1a))
(constraint (= (f #x40124104925a0c11) #x08024820924b4182))
(constraint (= (f #x2960a042584180b1) #x052c14084b083016))
(constraint (= (f #xbce0b342e395c8db) #x079c16685c72b91b))
(constraint (= (f #x97e4ac0082231ff9) #x02fc9580104463ff))
(constraint (= (f #xf3b0cb2a1d16873b) #x0e76196543a2d0e7))
(constraint (= (f #x142b585578b926d9) #x02856b0aaf1724db))
(constraint (= (f #xd0bc7dd31af848eb) #x0a178fba635f091d))
(constraint (= (f #x6a4153ac5c21c47c) #x0000000000000000))
(constraint (= (f #xeb4102ea42a31ddc) #x0000000000000000))
(constraint (= (f #xffb3fbf655e6169c) #x0000000000000000))
(constraint (= (f #x0f0cc63f3d08462c) #x0000000000000000))
(constraint (= (f #x230aa4ce941522ae) #x0000000000000000))
(constraint (= (f #x0f06820e1c203435) #x01e0d041c3840686))
(constraint (= (f #x2041a412d0c29695) #x040834825a1852d2))
(constraint (= (f #x34168680e1618095) #x0682d0d01c2c3012))
(constraint (= (f #x90c296043480521f) #x021852c086900a43))
(constraint (= (f #x78000680a503481f) #x0f0000d014a06903))
(constraint (= (f #xefa20a70ec9c40fd) #x020bbeb1e26c77e0))
(constraint (= (f #x39006efb9ab9c56d) #x08dff2208ca8c752))
(constraint (= (f #x770523128e07be4d) #x011f5b9dae3f0836))
(constraint (= (f #x92bbbb3484567fb7) #x0da888996f753009))
(constraint (= (f #x6d240d6525072b37) #x025b7e535b5f1a99))
(constraint (= (f #xe041e07807861859) #x03f7c3f0ff0f3cf4))
(constraint (= (f #x7824a5a0524b0839) #x00fb6b4bf5b69ef8))
(constraint (= (f #x28290f010d25025b) #x0afade1fde5b5fb4))
(constraint (= (f #xe1804a1296090c39) #x03cff6bdad3ede78))
(constraint (= (f #x212903c341061e1b) #x0bdadf8797df3c3c))
(constraint (= (f #xc124a1294878061d) #x07db6bdad6f0ff3c))
(constraint (= (f #xc08581c034202c17) #x07ef4fc7f97bfa7d))
(constraint (= (f #xd0a40a0801c02017) #x05eb7ebeffc7fbfd))
(constraint (= (f #xe0d20a02d2581a1d) #x03e5bebfa5b4fcbc))
(constraint (= (f #x4024a14294a05a1d) #x07fb6bd7ad6bf4bc))
(check-synth)
