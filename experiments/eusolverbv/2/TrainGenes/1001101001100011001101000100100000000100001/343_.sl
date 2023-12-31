
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
   (func23 Start Start Start Start)
   (func26 Start Start)
   (func27 Start Start)
   (func29 Start)
   (func32 Start Start Start)
   (func33 Start Start)
   (func37 Start Start)
   (func38 Start Start)
   (func41 Start Start Start)
   (func42 Start Start)
   (func44 Start Start Start)
   (func48 Start Start)
   (func52 Start Start Start)
   (bvnot Start)
   (shl1 Start)
   (shr1 Start)
   (shr4 Start)
   (bvand Start Start)
   (bvor Start Start)
   (bvxor Start Start)
   (bvadd Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #xfc4a825ec16ef70c) #x03b57da13e9108f3))
(constraint (= (f #xb31126af29efac44) #x4ceed950d61053bb))
(constraint (= (f #xf88c5093d424c30c) #x0773af6c2bdb3cf3))
(constraint (= (f #x4c076465db2034c2) #xb3f89b9a24dfcb3d))
(constraint (= (f #xe447e5eaa869f2ce) #x1bb81a1557960d31))
(constraint (= (f #xe6e815fc8aec529d) #x0000e6e815fc8aec))
(constraint (= (f #xc92dec2d8e7bb2d9) #x0000c92dec2d8e7b))
(constraint (= (f #x6414e27ec76fc1f0) #x00006414e27ec76f))
(constraint (= (f #xbe674c0d970b25f5) #x0000be674c0d970b))
(constraint (= (f #x60e3a8f4544b0818) #x000060e3a8f4544b))
(constraint (= (f #xffff0000ffff0002) #x0000ffff0000fffd))
(constraint (= (f #x0000000000000001) #xfffffffffffffffe))
(constraint (= (f #x7ffffffffffc46e9) #x800000000003b916))
(constraint (= (f #x7ffffffffffc1b04) #x800000000003e4fb))
(constraint (= (f #x7ffffffffffd34a6) #x800000000002cb59))
(constraint (= (f #x7ffffffffffcef64) #x800000000003109b))
(constraint (= (f #x7ffffffffffcb580) #x8000000000034a7f))
(constraint (= (f #x0000000000000000) #xfffffffffffffffd))
(constraint (= (f #x7ffffffffffc05d4) #x0000000000000000))
(constraint (= (f #x7ffffffffffcd798) #x0000000000000000))
(constraint (= (f #x7ffffffffffc35b0) #x0000000000000000))
(constraint (= (f #x7ffffffffffce17d) #x0000000000000000))
(constraint (= (f #x7ffffffffffc7d9f) #x0000000000000000))
(constraint (= (f #x21a593d55416613a) #x000021a593d55416))
(constraint (= (f #xdaafacea3cdc0f2b) #x25505315c323f0d4))
(constraint (= (f #x26bf5cfc96dabfc1) #xd940a3036925403e))
(constraint (= (f #xf94f9611e49dd5a7) #x06b069ee1b622a58))
(constraint (= (f #x6cb9ed3aa533abcc) #x934612c55acc5433))
(constraint (= (f #x05d94f2658e9827a) #x000005d94f2658e9))
(constraint (= (f #x67c9df7c01a26b0d) #x98362083fe5d94f2))
(constraint (= (f #xb06e5ca8e7a5f60a) #x4f91a357185a09f5))
(constraint (= (f #x3165a6927e84d52d) #xce9a596d817b2ad2))
(constraint (= (f #xe903044c66fa7762) #x16fcfbb39905889d))
(constraint (= (f #x7ffffffffffc6ed8) #x0000000000000000))
(constraint (= (f #x0000000000000000) #xfffffffffffffffd))
(constraint (= (f #xa8e1b7c674a12dfc) #x0000a8e1b7c674a1))
(constraint (= (f #xaa4ae2a805fe7650) #x0000aa4ae2a805fe))
(constraint (= (f #xc6d6ce78db987713) #x0000c6d6ce78db98))
(constraint (= (f #x275ef8e950102f3c) #x0000275ef8e95010))
(constraint (= (f #x7311433867499071) #x0000731143386749))
(constraint (= (f #xc6e9e66474ac305e) #x0000c6e9e66474ac))
(constraint (= (f #xe02677edfb3e9eb3) #x0000e02677edfb3e))
(constraint (= (f #xfffffffffffc513f) #x0000fffffffffffc))
(constraint (= (f #xfffffffffffde379) #x0000fffffffffffd))
(constraint (= (f #x1c4a9d0db22efcdb) #x00001c4a9d0db22e))
(constraint (= (f #x728393f67c2c7e99) #x0000728393f67c2c))
(constraint (= (f #x3ba0d2ce6e118a58) #x00003ba0d2ce6e11))
(constraint (= (f #xe54a12750a9475b8) #x0000e54a12750a94))
(constraint (= (f #x7ffffffffffd2fb9) #x0000000000000000))
(constraint (= (f #xf2b32cfd9b9210d0) #x0000f2b32cfd9b92))
(constraint (= (f #x0000000000000001) #xfffffffffffffffe))
(constraint (= (f #x7ffffffffffd1b06) #x800000000002e4f9))
(check-synth)
