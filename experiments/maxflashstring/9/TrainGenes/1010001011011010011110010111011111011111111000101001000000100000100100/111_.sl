(set-logic SLIA)
(define-fun func0  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  (+ 1  (str.indexof A  C  D )) B ))
(define-fun func1  ((A String) (B Int) (C String) ) String (str.substr A  (+ 1  (str.indexof A  C  0 )) B ))
(define-fun func2  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  (+ 1  (str.indexof C  D  E )) B ))
(define-fun func3  ((A String) (B Int) (C String) (D String) ) String (str.substr A  (+ 1  (str.indexof C  D  0 )) B ))
(define-fun func4  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 1  C ) B ))
(define-fun func5  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (+ C  (str.indexof A  D  E )) B ))
(define-fun func6  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ C  (str.indexof A  D  0 )) B ))
(define-fun func7  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ C  (str.indexof D  E  F )) B ))
(define-fun func8  ((A String) (B Int) (C Int) (D String) (E String) ) String (str.substr A  (+ C  (str.indexof D  E  0 )) B ))
(define-fun func9  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func10  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) 3 ))
(define-fun func11  ((A String) (B Int) ) String (str.substr A  1  B ))
(define-fun func12  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (- (str.indexof A  D  E ) C ) B ))
(define-fun func13  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (- (str.indexof D  E  F ) C ) B ))
(define-fun func14  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (- C  D ) B ))
(define-fun func15  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func16  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func17  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func18  ((A String) ) String (str.substr A  0  1 ))
(define-fun func19  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func20  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func21  ((A String) (B Int) ) String (str.substr A  B  1 ))
(define-fun func22  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (- C  D )))
(define-fun func23  ((A String) (B Int) ) String (str.substr A  B  (str.len A )))
(define-fun func24  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func25  ((A String) (B Int) (C Int) ) String (str.substr A  (- C  -1 ) B ))
(define-fun func26  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (- B  C ) (str.len D )))
(define-fun func27  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func28  ((A String) (B String) (C Int) ) Int (+ 1  (str.indexof A  B  C )))
(define-fun func29  ((A String) (B String) ) Int (+ 1  (str.indexof A  B  0 )))
(define-fun func30  ((A String) (B String) ) Int (+ 1  (str.indexof A  B  1 )))
(define-fun func31  ((A Int) (B String) (C String) (D Int) ) Int (+ A  (str.indexof B  C  D )))
(define-fun func32  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  1 )))
(define-fun func33  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  0 )))
(define-fun func34  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func35  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(define-fun func36  ((A Int) (B String) (C String) (D Int) ) Int (- (str.indexof B  C  D ) A ))
(define-fun func37  ((A Int) (B String) ) Int (- (str.len B ) A ))
(define-fun func38  ((A Int) ) Int (- A  -1 ))
(define-fun func39  ((A Int) ) Int (- A  3 ))
(define-fun func40  ((A String) (B String) (C Int) (D Int) ) String (str.++ (str.substr B  C  D ) A ))
(define-fun func41  ((A String) (B String) (C Int) ) String (str.++ (str.substr B  0  C ) A ))
(define-fun func42  ((A String) (B String) ) String (str.++ (str.substr B  0  1 ) A ))
(define-fun func43  ((A String) (B String) (C Int) ) String (str.++ (str.substr B  C  1 ) A ))
(define-fun func44  ((A String) (B Int) (C Int) (D String) (E String) ) String (str.++ (str.substr A  B  C ) (str.++ D  E )))
(define-fun func45  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func46  ((A String) (B String) (C String) ) String (str.++ (str.++ B  C ) A ))
(define-fun func47  ((A String) (B String) (C Int) (D Int) ) String (str.++ A  (str.substr B  C  D )))
(define-fun func48  ((A String) (B String) (C String) (D Int) (E Int) ) String (str.++ A  (str.++ (str.substr C  D  E ) B )))
(define-fun func49  ((A String) (B String) (C String) (D Int) ) String (str.++ A  (str.++ (str.substr C  0  D ) B )))
(define-fun func50  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func51  ((A String) (B String) (C String) (D Int) (E Int) ) String (str.++ A  (str.++ B  (str.substr C  D  E ))))
(define-fun func52  ((A String) (B String) (C String) (D Int) (E Int) ) String (str.replace (str.substr C  D  E ) A  B ))
(define-fun func53  ((A String) (B String) (C String) (D String) (E String) ) String (str.replace (str.replace C  D  E ) A  B ))
(synth-fun f ((name String)) String
( (Start String (ntString))
 (ntString String (
	name " " "+" "-" "." "(" ")" 
	(func0 ntString ntInt ntString ntInt)
	(func2 ntString ntInt ntString ntString ntInt)
	(func6 ntString ntInt ntInt ntString)
	(func8 ntString ntInt ntInt ntString ntString)
	(func9 ntString ntInt ntInt ntInt)
	(func11 ntString ntInt)
	(func12 ntString ntInt ntInt ntString ntInt)
	(func14 ntString ntInt ntInt ntInt)
	(func17 ntString ntString ntString ntInt)
	(func18 ntString)
	(func19 ntString ntInt ntString ntInt)
	(func20 ntString ntInt ntString ntString ntInt)
	(func23 ntString ntInt)
	(func25 ntString ntInt ntInt)
	(func26 ntString ntInt ntInt ntString)
	(func27 ntString ntInt ntString)
	(func41 ntString ntString ntInt)
	(func42 ntString ntString)
	(func43 ntString ntString ntInt)
	(func44 ntString ntInt ntInt ntString ntString)
	(func45 ntString ntString ntString)
	(func47 ntString ntString ntInt ntInt)
	(func48 ntString ntString ntString ntInt ntInt)
	(func49 ntString ntString ntString ntInt)
	(func50 ntString ntString ntString ntString)
	(func51 ntString ntString ntString ntInt ntInt)
	(func52 ntString ntString ntString ntInt ntInt)
	(func53 ntString ntString ntString ntString ntString)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 
	(func28 ntString ntString ntInt)
	(func32 ntInt ntString ntString)
	(func34 ntString ntString)
	(func37 ntInt ntString)
	(+ ntInt ntInt)
	(- ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(str.indexof ntString ntString ntInt)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
))
))
(constraint (= (f "+106 769-858-438") "+106 (769) 858-438"))
(constraint (= (f "+83 973-757-831") "+83 (973) 757-831"))
(constraint (= (f "+62 647-787-775") "+62 (647) 787-775"))
(constraint (= (f "+172 027-507-632") "+172 (027) 507-632"))
(constraint (= (f "+72 001-050-856") "+72 (001) 050-856"))
(constraint (= (f "+95 310-537-401") "+95 (310) 537-401"))
(constraint (= (f "+6 775-969-238") "+6 (775) 969-238"))
(check-synth)
