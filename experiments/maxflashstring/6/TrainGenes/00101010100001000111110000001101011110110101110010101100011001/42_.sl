(set-logic SLIA)
(define-fun func0  ((A String) (B String) (C String) ) String (str.++ (str.++ B  C ) A ))
(define-fun func1  ((A String) (B String) (C Int) (D Int) ) String (str.++ (str.substr B  C  D ) A ))
(define-fun func2  ((A String) (B String) (C Int) ) String (str.++ (str.substr B  0  C ) A ))
(define-fun func3  ((A String) (B String) ) String (str.++ (str.substr B  0  1 ) A ))
(define-fun func4  ((A String) (B String) (C Int) ) String (str.++ (str.substr B  C  1 ) A ))
(define-fun func5  ((A String) (B Int) (C Int) (D String) (E String) ) String (str.++ (str.substr A  B  C ) (str.++ D  E )))
(define-fun func6  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func7  ((A String) (B String) (C Int) (D Int) ) String (str.++ A  (str.substr B  C  D )))
(define-fun func8  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func9  ((A String) (B String) (C String) (D Int) (E Int) ) String (str.++ A  (str.++ B  (str.substr C  D  E ))))
(define-fun func10  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func11  ((A String) ) String (str.substr A  0  1 ))
(define-fun func12  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func13  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func14  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  (+ 1  (str.indexof A  C  D )) B ))
(define-fun func15  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  (+ 1  (str.indexof C  D  E )) B ))
(define-fun func16  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 1  C ) B ))
(define-fun func17  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (+ C  (str.indexof A  D  E )) B ))
(define-fun func18  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ C  (str.indexof D  E  F )) B ))
(define-fun func19  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func20  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) 3 ))
(define-fun func21  ((A String) (B Int) ) String (str.substr A  1  B ))
(define-fun func22  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (- (str.indexof A  D  E ) C ) B ))
(define-fun func23  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (- (str.indexof D  E  F ) C ) B ))
(define-fun func24  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (- C  D ) B ))
(define-fun func25  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (+ C  D )))
(define-fun func26  ((A String) (B Int) ) String (str.substr A  B  1 ))
(define-fun func27  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func28  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func29  ((A String) (B Int) ) String (str.substr A  B  (str.len A )))
(define-fun func30  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (- C  D )))
(define-fun func31  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func32  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  1 )))
(define-fun func33  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func34  ((A Int) ) Int (+ 1  A ))
(define-fun func35  ((A String) (B String) (C Int) ) Int (+ 1  (str.indexof A  B  C )))
(define-fun func36  ((A Int) ) Int (+ -1  A ))
(define-fun func37  ((A Int) (B String) (C String) (D Int) ) Int (+ A  (str.indexof B  C  D )))
(define-fun func38  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  1 )))
(define-fun func39  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(define-fun func40  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func41  ((A Int) (B String) (C String) (D Int) ) Int (- (str.indexof B  C  D ) A ))
(define-fun func42  ((A Int) (B String) ) Int (- (str.len B ) A ))
(define-fun func43  ((A Int) ) Int (- A  -1 ))
(define-fun func44  ((A String) (B String) (C String) (D Int) (E Int) ) String (str.replace (str.substr C  D  E ) A  B ))
(define-fun func45  ((A String) (B String) (C String) (D String) (E String) ) String (str.replace (str.replace C  D  E ) A  B ))
(synth-fun f ((_arg_0 Int)) String
( (Start String (ntString))
 (ntString String (
	"" " " 
	(func2 ntString ntString ntInt)
	(func4 ntString ntString ntInt)
	(func6 ntString ntString ntString)
	(func8 ntString ntString ntString ntString)
	(func13 ntString ntString ntString ntInt)
	(func17 ntString ntInt ntInt ntString ntInt)
	(func18 ntString ntInt ntInt ntString ntString ntInt)
	(func19 ntString ntInt ntInt ntInt)
	(func20 ntString ntInt ntInt)
	(func21 ntString ntInt)
	(func28 ntString ntInt ntString ntString ntInt)
	(func29 ntString ntInt)
	(func31 ntString ntInt)
	(func33 ntString ntInt ntString)
	(func44 ntString ntString ntString ntInt ntInt)
	(func45 ntString ntString ntString ntString ntString)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(int.to.str ntInt)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	_arg_0 1 0 -1 
	(func34 ntInt)
	(func36 ntInt)
	(func37 ntInt ntString ntString ntInt)
	(func39 ntString ntString)
	(func41 ntInt ntString ntString ntInt)
	(func42 ntInt ntString)
	(func43 ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
))
 (ntBool Bool (
	true false
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
))
))
(constraint (= (f 101) "101"))
(constraint (= (f 1002) "1002"))
(constraint (= (f 743) "743"))
(check-synth)
