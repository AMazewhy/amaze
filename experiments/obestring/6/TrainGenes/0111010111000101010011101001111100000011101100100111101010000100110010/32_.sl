(set-logic SLIA)
(define-fun func0  ((A String) (B String) (C String) (D String) (E String) ) String (str.replace (str.replace C  D  E ) A  B ))
(define-fun func1  ((A String) (B String) (C String) (D String) ) String (str.replace A  B  (str.++ C  D )))
(define-fun func2  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func3  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func4  ((A String) (B String) (C Int) ) String (str.++ (str.at B  C ) A ))
(define-fun func5  ((A String) (B String) ) String (str.++ (str.at B  0 ) A ))
(define-fun func6  ((A String) (B String) (C String) (D String) (E String) ) String (str.++ A  (str.++ B  (str.++ C  (str.++ D  E )))))
(define-fun func7  ((A Int) ) Int (+ 1  A ))
(define-fun func8  ((A String) (B String) (C Int) ) Int (+ 1  (str.indexof A  B  C )))
(define-fun func9  ((A String) (B String) ) Int (+ 1  (str.indexof A  B  0 )))
(define-fun func10  ((A Int) ) Int (+ -1  A ))
(define-fun func11  ((A Int) (B Int) (C Int) ) Int (+ A  (+ B  C )))
(define-fun func12  ((A Int) ) Int (+ A  -1 ))
(define-fun func13  ((A Int) (B String) (C String) (D Int) ) Int (+ A  (str.indexof B  C  D )))
(define-fun func14  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  1 )))
(define-fun func15  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  0 )))
(define-fun func16  ((A Int) (B String) ) Int (- (str.len B ) A ))
(define-fun func17  ((A String) ) Int (- (str.len A ) 3 ))
(define-fun func18  ((A Int) ) Int (- A  3 ))
(define-fun func19  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  (+ 1  (str.indexof A  C  D )) B ))
(define-fun func20  ((A String) (B Int) (C String) ) String (str.substr A  (+ 1  (str.indexof A  C  0 )) B ))
(define-fun func21  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  (+ 1  (str.indexof C  D  E )) B ))
(define-fun func22  ((A String) (B Int) (C String) (D String) ) String (str.substr A  (+ 1  (str.indexof C  D  0 )) B ))
(define-fun func23  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 1  C ) B ))
(define-fun func24  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (+ C  (str.indexof A  D  E )) B ))
(define-fun func25  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ C  (str.indexof A  D  0 )) B ))
(define-fun func26  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ C  (str.indexof D  E  F )) B ))
(define-fun func27  ((A String) (B Int) (C Int) (D String) (E String) ) String (str.substr A  (+ C  (str.indexof D  E  0 )) B ))
(define-fun func28  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func29  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) 3 ))
(define-fun func30  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) (str.len A )))
(define-fun func31  ((A String) (B Int) ) String (str.substr A  1  B ))
(define-fun func32  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func33  ((A String) (B Int) (C Int) ) String (str.substr A  0  (+ B  C )))
(define-fun func34  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func35  ((A String) (B String) ) String (str.substr A  0  (str.indexof A  B  0 )))
(define-fun func36  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func37  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  1 )))
(define-fun func38  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  0 )))
(define-fun func39  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (+ C  D )))
(define-fun func40  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (- C  D )))
(define-fun func41  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func42  ((A String) (B Int) ) String (str.substr A  B  (str.len A )))
(define-fun func43  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func44  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  1 )))
(define-fun func45  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  0 )))
(define-fun func46  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func47  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  1 )))
(define-fun func48  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  0 )))
(define-fun func49  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ B  C ) (str.len D )))
(define-fun func50  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func51  ((A String) (B String) ) Bool (str.contains A  B ))
(define-fun func52  ((A String) ) String (str.at A  0 ))
(define-fun func53  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func54  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(synth-fun f ((_arg_0 String) (_arg_1 String) (_arg_2 String) (_arg_3 String)) Bool
( (Start Bool (ntBool))
 (ntString String (
	_arg_0 _arg_1 _arg_2 _arg_3 "" " " 
	(func1 ntString ntString ntString ntString)
	(func2 ntString ntString ntString)
	(func3 ntString ntString ntString ntString)
	(func5 ntString ntString)
	(func19 ntString ntInt ntString ntInt)
	(func20 ntString ntInt ntString)
	(func21 ntString ntInt ntString ntString ntInt)
	(func25 ntString ntInt ntInt ntString)
	(func27 ntString ntInt ntInt ntString ntString)
	(func29 ntString ntInt ntInt)
	(func32 ntString ntInt)
	(func33 ntString ntInt ntInt)
	(func34 ntString ntString ntInt)
	(func36 ntString ntString ntString ntInt)
	(func39 ntString ntInt ntInt ntInt)
	(func40 ntString ntInt ntInt ntInt)
	(func41 ntString ntInt)
	(func42 ntString ntInt)
	(func43 ntString ntInt ntString ntInt)
	(func50 ntString ntInt ntString)
	(func52 ntString)
	(str.replace ntString ntString ntString)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	1 0 -1 
	(func7 ntInt)
	(func9 ntString ntString)
	(func10 ntInt)
	(func13 ntInt ntString ntString ntInt)
	(func16 ntInt ntString)
	(func17 ntString)
	(func18 ntInt)
	(func53 ntString ntString)
	(+ ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.prefixof ntString ntString)
	(str.contains ntString ntString)
))
))
(constraint (= (f "yellow dog on green grass" "yellow" "green" "dog") true))
(constraint (= (f "Lone dog with a green frisbie on yellow sand" "yellow" "green" "dog") true))
(constraint (= (f "A yellow sun in a green field" "yellow" "green" "dog") false))
(constraint (= (f "yellow neon sign with a green background" "yellow" "green" "dog") false))
(check-synth)
