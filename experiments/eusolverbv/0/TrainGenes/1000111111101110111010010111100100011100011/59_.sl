
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
   (func31 Start Start Start)
   (func32 Start Start Start)
   (func33 Start Start Start)
   (func35 Start Start)
   (func36 Start Start)
   (func37 Start Start)
   (func39 Start Start)
   (func40 Start Start)
   (func41 Start Start Start)
   (func43 Start Start Start)
   (func46 Start Start Start)
   (func48 Start Start Start)
   (func49 Start Start)
   (func50 Start Start)
   (func52 Start Start Start)
   (func55 Start Start)
   (bvnot Start)
   (shl1 Start)
   (bvand Start Start)
   (bvor Start Start)
   (bvxor Start Start)
   (if0 Start Start Start)
))
))
(constraint (= (f #x45aa8665d7b3d31c) #x0000000000000000))
(constraint (= (f #xa568f608633f9298) #x0000000000000000))
(constraint (= (f #xd46c5e33671a14dc) #x0000000000000000))
(constraint (= (f #x1cb5f0230aff2192) #x0000000000000000))
(constraint (= (f #xeb1a14966159ee58) #x0000000000000000))
(constraint (= (f #x112a0d5620193e5a) #x0000000000000000))
(constraint (= (f #x207d200467198a3c) #x0000000000000000))
(constraint (= (f #xdcd0322888311cd0) #x0000000000000000))
(constraint (= (f #x48e9314c281146f2) #x0000000000000000))
(constraint (= (f #xa2c5118a241124f6) #x0000000000000000))
(constraint (= (f #x000888889999999c) #x0000000000000000))
(constraint (= (f #x000088888899bffe) #x0000000000000000))
(constraint (= (f #x0000000089bbfffe) #x0000000000000000))
(constraint (= (f #x88888cccdddddddc) #x0000000000000000))
(constraint (= (f #x044444cccddddddc) #x0000000000000000))
(constraint (= (f #x1ec186baef42f096) #x0000000000000000))
(constraint (= (f #x4ff29bbd0d46d9be) #x0000000000000000))
(constraint (= (f #xbdc86b3604ecae38) #x0000000000000000))
(constraint (= (f #xca744f301e6c4b1a) #x0000000000000000))
(constraint (= (f #xb9721a7bffa6661c) #x0000000000000000))
(constraint (= (f #x6a9f7ba41a74c240) #xd53ef74834e98480))
(constraint (= (f #x4fac4eeb1a1b5bac) #x9f589dd63436b758))
(constraint (= (f #xad76a0c57114af8a) #x5aed418ae2295f14))
(constraint (= (f #x31974ad67c300602) #x632e95acf8600c04))
(constraint (= (f #x3397d71aaeff4662) #x672fae355dfe8cc4))
(constraint (= (f #x2d9be67e1be2f56b) #x0000423608e03540))
(constraint (= (f #x7c65da2d3787d5e5) #x0000d80934024504))
(constraint (= (f #x1cb67f78708081e7) #x0000396870808100))
(constraint (= (f #x25dad0f370cca3a5) #x000040b120c4a180))
(constraint (= (f #xbb28ce789e069c21) #x000046509c001c00))
(constraint (= (f #x36089b6008e371d4) #x0000000000000000))
(constraint (= (f #xe3114088e341c090) #x0000000000000000))
(constraint (= (f #x13dc421080a5f53c) #x0000000000000000))
(constraint (= (f #x12b894102c4d0832) #x0000000000000000))
(constraint (= (f #xfe101c4e2a0d4730) #x0000000000000000))
(constraint (= (f #x000006666666effe) #x00000ccccccddffc))
(constraint (= (f #x0000000000033376) #x00000000000666ec))
(constraint (= (f #x466666666667777e) #x8cccccccccceeefc))
(constraint (= (f #x002aaaaaeeeeeefe) #x00555555ddddddfc))
(constraint (= (f #x000000008888899a) #x0000000111111334))
(constraint (= (f #x1645f404f966c6a8) #x2c8be809f2cd8d50))
(constraint (= (f #x4aac48eb1189ca84) #x955891d623139508))
(constraint (= (f #x03f42448a162ec2c) #x07e8489142c5d858))
(constraint (= (f #x9dbf0b915a0094a0) #x3b7e1722b4012940))
(constraint (= (f #xaa4dd38cea4fcd86) #x549ba719d49f9b0c))
(constraint (= (f #x544281e02a5912ef) #x00008080024010a2))
(constraint (= (f #x9a7b864a23b723e1) #x0001044200940360))
(constraint (= (f #xeba0b335899c0ac7) #x0000930100080200))
(constraint (= (f #xb3ec4fa7a353e82b) #x0000478083434022))
(constraint (= (f #x6098714aecbe2949) #x00004100e0940948))
(constraint (= (f #x3c19a7bdf2c522b5) #x78334f7be58a456a))
(constraint (= (f #xb0d687322eafb0df) #x61ad0e645d5f61be))
(constraint (= (f #x0c43b2eb11871e97) #x188765d6230e3d2e))
(constraint (= (f #x95b91d1914c7e31f) #x2b723a32298fc63e))
(constraint (= (f #xa7d3cb5599ace399) #x4fa796ab3359c732))
(constraint (= (f #x00000000000177fe) #x0000000000000000))
(constraint (= (f #x0000000000011ddc) #x0000000000000000))
(constraint (= (f #x00000000000199ba) #x0000000000000000))
(constraint (= (f #x00000000000117fe) #x0000000000000000))
(constraint (= (f #x00000000000113be) #x0000000000000000))
(constraint (= (f #x0a86439302030c95) #x0000000000000000))
(constraint (= (f #x60d970084c232019) #x0000000000000000))
(constraint (= (f #x2a31488346419a17) #x0000000000000000))
(constraint (= (f #x7418ae540a830155) #x0000000000000000))
(constraint (= (f #x02274881432bc517) #x0000000000000000))
(constraint (= (f #xb54e25374eb080f9) #x6a9c4a6e9d6101f2))
(constraint (= (f #x180119efedfa55fd) #x300233dfdbf4abfa))
(constraint (= (f #xf7f4fc201b529ebf) #xefe9f84036a53d7e))
(constraint (= (f #xdf9446364550ca19) #xbf288c6c8aa19432))
(constraint (= (f #xeb61d02d8aff0cb3) #xd6c3a05b15fe1966))
(constraint (= (f #x09e26118e03184f7) #x0000000000000000))
(constraint (= (f #x0529092a44593237) #x0000000000000000))
(constraint (= (f #x88051aa60417a29d) #x0000000000000000))
(constraint (= (f #x3d082938085b3a5b) #x0000000000000000))
(constraint (= (f #x6b4008d202df9013) #x0000000000000000))
(constraint (= (f #x0c488862762e9d22) #x189110c4ec5d3a44))
(constraint (= (f #xf78c08fcb2a6ece9) #x0000081810a06448))
(constraint (= (f #x38a2cb1e9ab7ebe7) #x0000410492352166))
(constraint (= (f #xe5e1d8558611c033) #xcbc3b0ab0c238066))
(constraint (= (f #x8db899bc3f067328) #x1b7133787e0ce650))
(constraint (= (f #xf39fcac10422e134) #x0000000000000000))
(constraint (= (f #x67e1465076c81b51) #xcfc28ca0ed9036a2))
(constraint (= (f #x199d8cf45416da3a) #x0000000000000000))
(constraint (= (f #xd6330d29a9d64e9e) #x0000000000000000))
(constraint (= (f #xb1272203f6ed3e31) #x624e4407edda7c62))
(constraint (= (f #xc281c1a2c081c7d1) #x0000000000000000))
(constraint (= (f #xfd01f7738799f288) #xfa03eee70f33e510))
(constraint (= (f #xeab1040588257d17) #x0000000000000000))
(constraint (= (f #xc27c1ec33cafb395) #x84f83d86795f672a))
(constraint (= (f #x6e27518f53a577bb) #xdc4ea31ea74aef76))
(constraint (= (f #x90d0a0d1026f5819) #x0000000000000000))
(constraint (= (f #xf53af300b9679219) #xea75e60172cf2432))
(constraint (= (f #x39000b020415b2b3) #x0000000000000000))
(constraint (= (f #x43663b828777925b) #x86cc77050eef24b6))
(constraint (= (f #x4bd16b00cf3c69b1) #x97a2d6019e78d362))
(constraint (= (f #x7b300cfc0019c81d) #x0000000000000000))
(constraint (= (f #xd3288754e970e8bf) #xa6510ea9d2e1d17e))
(constraint (= (f #x977cc2485cf1289d) #x2ef98490b9e2513a))
(constraint (= (f #x654ff30cc451e5f7) #xca9fe61988a3cbee))
(constraint (= (f #x000000000001bbfe) #x0000000000000000))
(constraint (= (f #x222aaaaaaaaaaaba) #x4455555555555574))
(constraint (= (f #x000000000001408a) #x0000000000028114))
(constraint (= (f #x60a1d580073b0853) #x0000000000000000))
(constraint (= (f #x47fc973018dbb5bd) #x8ff92e6031b76b7a))
(constraint (= (f #xf5164ed667c37600) #xea2c9daccf86ec00))
(constraint (= (f #x5c0f8b66c13cd4b7) #xb81f16cd8279a96e))
(constraint (= (f #x7864796628bd68f1) #xf0c8f2cc517ad1e2))
(constraint (= (f #x6a0f87af78f3d757) #xd41f0f5ef1e7aeae))
(constraint (= (f #x5ebcbf60761f1e97) #xbd797ec0ec3e3d2e))
(constraint (= (f #xb024b1308497929f) #x0000000000000000))
(constraint (= (f #x24e9264732cf1559) #x49d24c8e659e2ab2))
(constraint (= (f #x2a8295512aa5f60e) #x55052aa2554bec1c))
(constraint (= (f #xd75e603399cbbc97) #xaebcc0673397792e))
(constraint (= (f #x184e4a0301016bbf) #x0000000000000000))
(constraint (= (f #x68772834e3258ad3) #xd0ee5069c64b15a6))
(constraint (= (f #x0feacf48a3636295) #x1fd59e9146c6c52a))
(constraint (= (f #xa8124889554428b4) #x0000000000000000))
(constraint (= (f #x000000000000155c) #x0000000000002ab8))
(constraint (= (f #x90955095080a5532) #x0000000000000000))
(constraint (= (f #xa4454a0a248928bb) #x488a941449125176))
(constraint (= (f #x03233aace703d4fa) #x0000000000000000))
(constraint (= (f #x252a5492a142913e) #x0000000000000000))
(constraint (= (f #xa8952a844a4a92b2) #x0000000000000000))
(constraint (= (f #x00000000000125f7) #x0000000000000000))
(constraint (= (f #x9425088848884939) #x284a111091109272))
(constraint (= (f #x0666666666677776) #x0cccccccccceeeec))
(constraint (= (f #x510ff776098d709c) #x0000000000000000))
(constraint (= (f #x9e3e43f8b80d689e) #x0000000000000000))
(constraint (= (f #x422a1250540a94be) #x0000000000000000))
(constraint (= (f #x2be33a266eaa4cba) #x0000000000000000))
(constraint (= (f #x4e116d522b4c1e34) #x0000000000000000))
(constraint (= (f #xf101e86eea6f3bf0) #x0000000000000000))
(constraint (= (f #x949c3ff2f96a0736) #x0000000000000000))
(constraint (= (f #xb50085acaa4b1276) #x0000000000000000))
(constraint (= (f #x000000177777fffe) #x0000000000000000))
(constraint (= (f #x011111111199bbfe) #x0000000000000000))
(constraint (= (f #x0888cccccccccddc) #x1111999999999bb8))
(constraint (= (f #x00000ccddddddddc) #x0000000000000000))
(constraint (= (f #x46666666667777fe) #x0000000000000000))
(constraint (= (f #x0055555555555556) #x0000000000000000))
(constraint (= (f #x001111111111113a) #x0000000000000000))
(constraint (= (f #x000000011333333a) #x0000000000000000))
(constraint (= (f #x9f00cff6e5b6c901) #x00000e0085a4c900))
(constraint (= (f #x01c930b56020fe27) #x000000906020c000))
(constraint (= (f #x8012541f7099ea94) #x0000000000000000))
(constraint (= (f #x890ee1ebcce683ab) #x00000009c0c68188))
(constraint (= (f #x5492a2952514103b) #xa925452a4a282076))
(constraint (= (f #x030c0a2f45012af4) #x0000000000000000))
(constraint (= (f #xa0b43498827598b2) #x0000000000000000))
(constraint (= (f #xeeeeeeeeeeeefffe) #xddddddddddddfffc))
(check-synth)
