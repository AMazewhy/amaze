(set-logic SLIA)
(define-fun func0  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func1  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func2  ((A String) (B String) ) String (str.substr A  0  (str.indexof A  B  0 )))
(define-fun func3  ((A String) (B String) ) String (str.substr A  0  (str.indexof A  B  1 )))
(define-fun func4  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func5  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  0 )))
(define-fun func6  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  1 )))
(define-fun func7  ((A String) (B Int) ) String (str.substr A  (+ 3  5 ) B ))
(define-fun func8  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 3  C ) B ))
(define-fun func9  ((A String) (B Int) (C Int) ) String (str.substr A  (+ C  5 ) B ))
(define-fun func10  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func11  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) 3 ))
(define-fun func12  ((A String) ) String (str.substr A  4  3 ))
(define-fun func13  ((A String) (B Int) ) String (str.substr A  3  B ))
(define-fun func14  ((A String) (B Int) (C Int) ) String (str.substr A  (- (str.len A ) C ) B ))
(define-fun func15  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (- (str.len D ) C ) B ))
(define-fun func16  ((A String) (B Int) (C String) ) String (str.substr A  (- (str.len C ) 3 ) B ))
(define-fun func17  ((A String) (B Int) (C Int) ) String (str.substr A  (- C  3 ) B ))
(define-fun func18  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (- C  D ) B ))
(define-fun func19  ((A String) (B Int) (C Int) ) String (str.substr A  (- B  C ) 3 ))
(define-fun func20  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func21  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  0 )))
(define-fun func22  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  1 )))
(define-fun func23  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func24  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  0 )))
(define-fun func25  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  1 )))
(define-fun func26  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func27  ((A String) (B Int) ) String (str.substr A  B  (str.len A )))
(define-fun func28  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func30  ((A Int) (B String) (C String) (D Int) ) Int (+ A  (str.indexof B  C  D )))
(define-fun func31  ((A Int) ) Int (+ A  5 ))
(define-fun func32  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(define-fun func33  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func34  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func35  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func36  ((A String) (B String) (C String) (D String) (E Int) ) String (str.++ A  (str.++ B  (str.++ (str.at D  E ) C ))))
(define-fun func37  ((A String) (B String) (C String) (D Int) ) String (str.++ A  (str.++ (str.at C  D ) B )))
(define-fun func38  ((A String) (B String) (C String) (D String) (E String) ) String (str.++ A  (str.replace B  C  (str.++ D  E ))))
(define-fun func39  ((A String) (B String) (C Int) ) String (str.++ (str.at B  C ) A ))
(define-fun func40  ((A String) (B String) ) String (str.++ (str.at B  0 ) A ))
(define-fun func41  ((A String) (B Int) (C String) (D String) (E String) ) String (str.++ (str.at A  B ) (str.++ C  (str.++ D  E ))))
(define-fun func42  ((A String) ) String (str.at A  0 ))
(define-fun func43  ((A String) (B String) (C String) (D String) ) String (str.replace A  B  (str.++ C  D )))
(define-fun func44  ((A String) (B String) (C String) (D String) (E String) ) String (str.replace (str.replace C  D  E ) A  B ))
(define-fun func45  ((A Int) (B String) ) Int (- (str.len B ) A ))
(define-fun func46  ((A String) ) Int (- (str.len A ) 3 ))
(define-fun func47  ((A Int) ) Int (- A  3 ))
(synth-fun f ((col1 String) (col2 String)) String
( (Start String (ntString))
 (ntString String (
	col1 col2 " " "," "USA" "PA" "CT" "CA" "MD" "NY" 
	(func0 ntString ntInt)
	(func2 ntString ntString)
	(func10 ntString ntInt ntInt ntInt)
	(func11 ntString ntInt ntInt)
	(func12 ntString)
	(func18 ntString ntInt ntInt ntInt)
	(func20 ntString ntInt ntString ntInt)
	(func21 ntString ntInt ntString)
	(func23 ntString ntInt ntString ntString ntInt)
	(func28 ntString ntInt ntString)
	(func36 ntString ntString ntString ntString ntInt)
	(func37 ntString ntString ntString ntInt)
	(func38 ntString ntString ntString ntString ntString)
	(func40 ntString ntString)
	(func41 ntString ntInt ntString ntString ntString)
	(func43 ntString ntString ntString ntString)
	(func44 ntString ntString ntString ntString ntString)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(str.at ntString ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 
	(func31 ntInt)
	(func32 ntString ntString)
	(func46 ntString)
	(func47 ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
	(str.indexof ntString ntString ntInt)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
))
))
(constraint (= (f "University of Pennsylvania" "Phialdelphia, PA, USA") "University of Pennsylvania, Phialdelphia, PA, USA"))
(constraint (= (f "UCLA" "Los Angeles, CA") "UCLA, Los Angeles, CA, USA"))
(constraint (= (f "Cornell University" "Ithaca, New York, USA") "Cornell University, Ithaca, New York, USA"))
(constraint (= (f "Penn" "Philadelphia, PA, USA") "Penn, Philadelphia, PA, USA"))
(constraint (= (f "University of Maryland College Park" "College Park, MD") "University of Maryland College Park, College Park, MD, USA"))
(constraint (= (f "University of Michigan" "Ann Arbor, MI, USA") "University of Michigan, Ann Arbor, MI, USA"))
(check-synth)
