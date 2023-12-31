
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
(define-fun func41  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvshl A  B ) #x0000000000000004 ))
(define-fun func42  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvlshr (bvadd B  C ) A ))
(define-fun func43  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot B ) A ))
(define-fun func44  ((A (BitVec 64)) ) (BitVec 64) (bvlshr (bvnot A ) #x0000000000000010 ))
(define-fun func45  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvor (bvlshr B  C ) A ))
(define-fun func46  ((A (BitVec 64)) ) (BitVec 64) (bvor A  #x0000000000000001 ))
(define-fun func47  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  C ) A ))
(define-fun func48  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr B  #x0000000000000001 ) A ))
(define-fun func49  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvlshr A  B ) #x0000000000000001 ))
(define-fun func51  ((A (BitVec 64)) (B (BitVec 64)) (C (BitVec 64)) ) (BitVec 64) (bvshl (bvshl B  C ) A ))
(define-fun func52  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvshl B  #x0000000000000001 ) A ))
(define-fun func53  ((A (BitVec 64)) (B (BitVec 64)) ) (BitVec 64) (bvshl (bvshl A  B ) #x0000000000000001 ))
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
   (func24 Start Start Start)
   (func25 Start Start)
   (func26 Start Start)
   (func27 Start Start)
   (func29 Start)
   (func33 Start Start)
   (func35 Start Start)
   (func38 Start Start)
   (func44 Start)
   (func46 Start)
   (func48 Start Start)
   (func49 Start Start)
   (func52 Start Start)
   (func53 Start Start)
   (func54 Start Start Start)
   (func55 Start)
   (func57 Start Start)
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
(constraint (= (f #xbe169945ac7d6317) #x5f0b4ca2d63eb18c))
(constraint (= (f #x2b9d72a432e9153f) #x15ceb95219748aa0))
(constraint (= (f #x6085c6bdfb0f880b) #x3042e35efd87c406))
(constraint (= (f #x5de715f44ab915e3) #x2ef38afa255c8af2))
(constraint (= (f #x2ec7d4cf051fdc63) #x1763ea67828fee32))
(constraint (= (f #x06adb959822844d5) #xf2a48d4cfbaf7656))
(constraint (= (f #x809e8ccf7e1fcce1) #xfec2e66103c0663e))
(constraint (= (f #xc5962f6e0e01a02d) #x74d3a123e3fcbfa6))
(constraint (= (f #x1904b1ff358ec79d) #xcdf69c0194e270c6))
(constraint (= (f #xc972f26950acd5b1) #x6d1a1b2d5ea6549e))
(constraint (= (f #xfffffffffffebf8b) #x7fffffffffff5fc6))
(constraint (= (f #xfffffffffffec207) #x7fffffffffff6104))
(constraint (= (f #xfffffffffffe0b0b) #x7fffffffffff0586))
(constraint (= (f #xfffffffffffe7a7f) #x7fffffffffff3d40))
(constraint (= (f #xfffffffffffeceef) #x7fffffffffff6778))
(constraint (= (f #x1fffffffffffffff) #x1000000000000000))
(constraint (= (f #xe58303f5f495673e) #x72c181fafa4ab39f))
(constraint (= (f #x54250f036e4aebba) #x2a128781b72575dd))
(constraint (= (f #x10b2df7f12ce6f9e) #x08596fbf896737cf))
(constraint (= (f #xea4dff41bbe515e2) #x7526ffa0ddf28af1))
(constraint (= (f #x2195fd9ea55bf5c6) #x10cafecf52adfae3))
(constraint (= (f #xfffffffffffef5cd) #x7fffffffffff7ae7))
(constraint (= (f #xfffffffffffe7999) #x7fffffffffff3ccd))
(constraint (= (f #xfffffffffffeec29) #x7fffffffffff7615))
(constraint (= (f #xfffffffffffee1c1) #x7fffffffffff70e1))
(constraint (= (f #xfffffffffffe2c31) #x7fffffffffff1619))
(constraint (= (f #x008311d4df5ca5e0) #xfef9dc564146b43c))
(constraint (= (f #x3e70b0ab473474f8) #x831e9ea97197160c))
(constraint (= (f #x9e568c828d80cf2c) #xc352e6fae4fe61a4))
(constraint (= (f #xc8892e08c943515c) #x6eeda3ee6d795d44))
(constraint (= (f #x1837f6c5d9c420f8) #xcf9012744c77be0c))
(constraint (= (f #xfffffffffffefa22) #x0000000000020bb8))
(constraint (= (f #xfffffffffffe5d16) #x00000000000345d0))
(constraint (= (f #xfffffffffffe9e42) #x000000000002c378))
(constraint (= (f #xfffffffffffe23fe) #x000000000003b800))
(constraint (= (f #xfffffffffffed4d2) #x0000000000025658))
(constraint (= (f #xfffffffffffec010) #x0000000000027fdc))
(constraint (= (f #xfffffffffffedc70) #x000000000002471c))
(constraint (= (f #xfffffffffffeb9f0) #x0000000000028c1c))
(constraint (= (f #xfffffffffffea634) #x000000000002b394))
(constraint (= (f #xfffffffffffee5e4) #x0000000000023434))
(constraint (= (f #x4f8d5a82cdf0fdce) #x27c6ad4166f87ee7))
(constraint (= (f #x0e571ec6f5717aef) #x072b8f637ab8bd78))
(constraint (= (f #x885657b2f7e8d06d) #xef53509a102e5f26))
(constraint (= (f #x555459e7971ba83f) #x2aaa2cf3cb8dd420))
(constraint (= (f #x8cdd36c2a7415171) #xe645927ab17d5d1e))
(constraint (= (f #xaffd6832d76079a8) #xa0052f9a513f0cac))
(constraint (= (f #x198d95ec6cdaf5c0) #xcce4d427264a147c))
(constraint (= (f #x786053a3272b7032) #x3c3029d19395b819))
(constraint (= (f #x8c7f32f339a12888) #xe7019a198cbdaeec))
(constraint (= (f #xd6ee9376317b175d) #x5222d9139d09d146))
(constraint (= (f #xfffffffffffe41aa) #x0000000000037ca8))
(constraint (= (f #xfffffffffffe4149) #x7fffffffffff20a5))
(constraint (= (f #xfffffffffffe4598) #x00000000000374cc))
(constraint (= (f #xfffffffffffe33cf) #x7fffffffffff19e8))
(constraint (= (f #x3f193e1916100011) #x81cd83cdd3dfffde))
(constraint (= (f #xffffffffffffffff) #x0000000000000000))
(check-synth)
