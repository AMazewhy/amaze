
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
   (func25 Start Start Start)
   (func29 Start Start)
   (func35 Start Start Start)
   (func39 Start Start)
   (func44 Start Start)
   (func46 Start Start Start)
   (func47 Start Start)
   (func49 Start Start Start)
   (func50 Start)
   (func51 Start Start Start)
   (func52 Start Start)
   (func53 Start Start)
   (func56 Start)
   (func57 Start Start Start)
   (func58 Start Start)
   (func59 Start Start)
   (bvnot Start)
   (shr1 Start)
   (shr4 Start)
   (shr16 Start)
   (bvor Start Start)
   (bvxor Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x385aae170aa67a0e) #x70b55c2e154cf41d))
(constraint (= (f #xbdfc0554d76e9b24) #x7bf80aa9aedd3649))
(constraint (= (f #x7636b15935025367) #xec6d62b26a04a6cf))
(constraint (= (f #xe2518f197c7ac95f) #xc4a31e32f8f592bf))
(constraint (= (f #x1b412de3726a06ba) #x36825bc6e4d40d75))
(constraint (= (f #x92a5092429504aa9) #x92a5092429504aa9))
(constraint (= (f #xa94554288a82a945) #xa94554288a82a945))
(constraint (= (f #x82aa954928042221) #x82aa954928042221))
(constraint (= (f #x82a0a448a5285411) #x82a0a448a5285411))
(constraint (= (f #x455252a92a2454a5) #x455252a92a2454a5))
(constraint (= (f #x68bf0ebb92f1ed90) #x90b50058b3def396))
(constraint (= (f #xba87933526eb5bcc) #x39cff39786a5ee77))
(constraint (= (f #x844d37c37d8faea4) #x736df4c04a975671))
(constraint (= (f #x8232852382ad692c) #x75aa528a4527c041))
(constraint (= (f #xa7b8f6a7f623d834) #x4dcb79ed8a79ea48))
(constraint (= (f #x140b50532fa74fdd) #x2816a0a65f4e9fbb))
(constraint (= (f #xceac9372181d91f7) #x9d5926e4303b23ef))
(constraint (= (f #x6ec2e38a8b13cf9d) #xdd85c71516279f3b))
(constraint (= (f #x482c273d542d165d) #x90584e7aa85a2cbb))
(constraint (= (f #xf0c515fe526fb559) #xe18a2bfca4df6ab3))
(constraint (= (f #x2226666666667776) #x444ccccccccceeed))
(constraint (= (f #x088888888aaaeefe) #x111111111555ddfd))
(constraint (= (f #x0222222222223332) #x0444444444446665))
(constraint (= (f #x000008888888bffe) #x0000111111117ffd))
(constraint (= (f #x08888888aaaabbba) #x1111111155557775))
(constraint (= (f #x42a254a522512a95) #x42a254a522512a95))
(constraint (= (f #x8142a92942514295) #x8142a92942514295))
(constraint (= (f #x80a8411154511155) #x80a8411154511155))
(constraint (= (f #x401244a0a2510a55) #x401244a0a2510a55))
(constraint (= (f #x8514aa40aa255555) #x8514aa40aa255555))
(constraint (= (f #x000088ddddddddfe) #xffff772219944424))
(constraint (= (f #xaaaabbbbbbbbbffe) #x5555399998888446))
(constraint (= (f #x22222333333337fe) #xdddddaaaaa9994ce))
(constraint (= (f #x8888999ddddddffe) #x77775dd998884224))
(constraint (= (f #x133333333333377e) #xeccccb999999954e))
(check-synth)
