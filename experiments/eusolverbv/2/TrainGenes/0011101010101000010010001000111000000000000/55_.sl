
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
   (func25 Start Start)
   (func26 Start Start)
   (func27 Start Start)
   (func29 Start)
   (func31 Start Start Start)
   (func33 Start Start)
   (func35 Start Start)
   (func40 Start Start)
   (func43 Start)
   (func47 Start Start)
   (func52 Start Start Start)
   (func53 Start)
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
(constraint (= (f #xe1e162506618595c) #x0000e1e1e3f16658))
(constraint (= (f #x3ccbad98715b2962) #x00003ccbbddbfddb))
(constraint (= (f #xf1e2533f4a48d922) #x0000f1e2f3ff5b7f))
(constraint (= (f #xb7b214a2251d1460) #x0000b7b2b7b235bf))
(constraint (= (f #x7362c42eb1167be3) #x00007362f76ef53e))
(constraint (= (f #x6f35077c892abdb3) #xf9ceff8b77fd566c))
(constraint (= (f #x54f19f67e95b9370) #xfbbee69997ee6ecf))
(constraint (= (f #x7cfcd0d13888b0b2) #xfb333ffeef777ffd))
(constraint (= (f #x907d9846264c96f0) #xfffa67fbddbb7f9f))
(constraint (= (f #xe69f6ff60f7053ec) #xf9f69909ff8ffed3))
(constraint (= (f #x000000000000f701) #x0000000000000000))
(constraint (= (f #x0000000000002ae2) #x0000000000000000))
(constraint (= (f #x000000000000965c) #x0000000000000000))
(constraint (= (f #x000000000000fb62) #x0000000000000000))
(constraint (= (f #x000000000000a57d) #x0000000000000000))
(constraint (= (f #x4000000000006962) #x0000400000000000))
(constraint (= (f #x400000000000541f) #x0000400000000000))
(constraint (= (f #x40000000000040e2) #x0000400000000000))
(constraint (= (f #x8000000000006e01) #x0000800000000000))
(constraint (= (f #x8000000000007362) #x0000800000000000))
(constraint (= (f #x00000000001e635b) #x000000000000001e))
(constraint (= (f #x000000000013d65d) #x0000000000000013))
(constraint (= (f #x00000000001df6bb) #x000000000000001d))
(constraint (= (f #x0000000000141263) #x0000000000000014))
(constraint (= (f #x00000000001afb05) #x000000000000001a))
(constraint (= (f #x3da34566e3ff5e27) #x00003da37de7e7ff))
(constraint (= (f #x7c6f43911e799c18) #x00007c6f7fff5ff9))
(constraint (= (f #x84d4e909be8892f9) #x000084d4edddff89))
(constraint (= (f #x2df2bd33203d357a) #x00002df2bdf3bd3f))
(constraint (= (f #xe0220fd374217d27) #x0000e022eff37ff3))
(constraint (= (f #x000000000000fe6e) #x0000000000000000))
(constraint (= (f #x000000000000e5f2) #x0000000000000000))
(constraint (= (f #x000000000000a68e) #x0000000000000000))
(constraint (= (f #x0000000000008b8d) #x0000000000000000))
(constraint (= (f #x0000000000001a0b) #x0000000000000000))
(constraint (= (f #x4000000000004794) #xfffffffffffffbef))
(constraint (= (f #x8000000000007f30) #xfffffffffffff8cf))
(constraint (= (f #x800000000000430f) #xffffffffffffffff))
(constraint (= (f #x4000000000006515) #xfffffffffffffbee))
(constraint (= (f #xc000000000004cf4) #xfffffffffffffb3b))
(constraint (= (f #x0000000000148611) #xffffffffffffffff))
(constraint (= (f #x00000000001e784b) #xffffffffffffffff))
(constraint (= (f #x000000000014244c) #xffffffffffffffff))
(constraint (= (f #x0000000000103acd) #xffffffffffffffff))
(constraint (= (f #x000000000019f5ec) #xffffffffffffffff))
(constraint (= (f #x014907c5e2872368) #xffffffbbbdffdddf))
(constraint (= (f #x24d8106fe3c6b2a9) #xffb7fff91dfbddd7))
(constraint (= (f #xdd2b7a8518e20a56) #xf2fdcd7fef7dfffb))
(constraint (= (f #xa8983d843ad58129) #xf777fe7ffd7affff))
(constraint (= (f #x49540f59e64fd296) #xffebffae79bb2fff))
(constraint (= (f #x0000000000006460) #x0000000000000000))
(constraint (= (f #x0000000000007b1b) #x0000000000000000))
(constraint (= (f #x0000000000005a3b) #x0000000000000000))
(constraint (= (f #x00000000000072dd) #x0000000000000000))
(constraint (= (f #x000000000000591b) #x0000000000000000))
(constraint (= (f #x000000000000e87a) #xfffffffffffff7fd))
(constraint (= (f #x000000000000a046) #xfffffffffffffffb))
(constraint (= (f #x000000000000e9e6) #xfffffffffffff779))
(constraint (= (f #x0000000000008287) #xffffffffffffffff))
(constraint (= (f #x00000000000004d9) #xffffffffffffffb6))
(constraint (= (f #xc0000000000057c6) #x0000c00000000000))
(constraint (= (f #xc0000000000048f9) #x0000c00000000000))
(constraint (= (f #x8000000000006387) #x0000800000000000))
(constraint (= (f #x4000000000006339) #x0000400000000000))
(constraint (= (f #x4000000000004dc6) #x0000400000000000))
(constraint (= (f #x000000000014a35a) #x0000000000000014))
(constraint (= (f #x0000000000110046) #x0000000000000011))
(constraint (= (f #x00000000001b80e7) #x000000000000001b))
(constraint (= (f #x000000000013235a) #x0000000000000013))
(constraint (= (f #x000000000017f327) #x0000000000000017))
(constraint (= (f #x0000000000007e94) #x0000000000000000))
(constraint (= (f #x0000000000005b8b) #x0000000000000000))
(constraint (= (f #x0000000000004192) #x0000000000000000))
(constraint (= (f #x0000000000004e73) #x0000000000000000))
(constraint (= (f #x0000000000006891) #x0000000000000000))
(constraint (= (f #x0000000000002bd7) #xfffffffffffffd6a))
(constraint (= (f #x000000000000cc76) #xfffffffffffff3b9))
(constraint (= (f #x000000000000e02a) #xfffffffffffffffd))
(constraint (= (f #x000000000000ce49) #xfffffffffffff3bf))
(constraint (= (f #x0000000000003837) #xfffffffffffffffc))
(constraint (= (f #x4000000000006149) #xffffffffffffffff))
(constraint (= (f #xc000000000006d8a) #xfffffffffffffb77))
(constraint (= (f #x4000000000006c29) #xfffffffffffffbff))
(constraint (= (f #xc000000000004657) #xfffffffffffffbba))
(constraint (= (f #x8000000000007069) #xffffffffffffffff))
(constraint (= (f #x0000000000117997) #xffffffffffffffff))
(constraint (= (f #x0000000000192a56) #xffffffffffffffff))
(constraint (= (f #x00000000001a1889) #xffffffffffffffff))
(constraint (= (f #x0000000000111ac9) #xffffffffffffffff))
(constraint (= (f #x00000000001ea7f6) #xffffffffffffffff))
(constraint (= (f #x00000000000052e6) #xffffffffffffffd9))
(constraint (= (f #x0000000000004487) #xfffffffffffffbff))
(constraint (= (f #x0000000000007279) #xfffffffffffffdde))
(constraint (= (f #x0000000000007bd9) #xfffffffffffffc66))
(constraint (= (f #x0000000000004727) #xfffffffffffffbdd))
(constraint (= (f #x00000000000054e9) #xfffffffffffffbb7))
(constraint (= (f #x0000000000006088) #xfffffffffffffff7))
(constraint (= (f #x0000000000007737) #xfffffffffffff8cc))
(constraint (= (f #x0000000000007669) #xfffffffffffff99f))
(constraint (= (f #x000000000000670a) #xfffffffffffff9ff))
(check-synth)
