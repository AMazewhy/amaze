(set-logic SLIA)
(define-fun func0  ((A String) (B String) (C String) (D String) (E String) ) String (str.replace (str.replace C  D  E ) A  B ))
(define-fun func1  ((A String) (B String) (C String) (D String) ) String (str.replace A  B  (str.++ C  D )))
(define-fun func2  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func3  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func4  ((A String) (B String) ) String (str.substr A  0  (str.indexof A  B  1 )))
(define-fun func5  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func6  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  1 )))
(define-fun func7  ((A String) ) String (str.substr A  0  3 ))
(define-fun func8  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  (+ 1  (str.indexof A  C  D )) B ))
(define-fun func9  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  (+ 1  (str.indexof C  D  E )) B ))
(define-fun func10  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 1  C ) B ))
(define-fun func11  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (+ C  (str.indexof A  D  E )) B ))
(define-fun func12  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ C  (str.indexof D  E  F )) B ))
(define-fun func13  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func14  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) (str.len A )))
(define-fun func15  ((A String) ) String (str.substr A  4  3 ))
(define-fun func16  ((A String) (B Int) ) String (str.substr A  3  B ))
(define-fun func17  ((A String) (B Int) (C Int) ) String (str.substr A  (- (str.len A ) C ) B ))
(define-fun func18  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (- (str.len D ) C ) B ))
(define-fun func19  ((A String) (B Int) (C String) ) String (str.substr A  (- (str.len C ) 3 ) B ))
(define-fun func20  ((A String) (B Int) (C Int) ) String (str.substr A  (- C  3 ) B ))
(define-fun func21  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (- C  D ) B ))
(define-fun func22  ((A String) (B Int) (C Int) ) String (str.substr A  (- B  C ) 3 ))
(define-fun func23  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func24  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  1 )))
(define-fun func25  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func26  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  1 )))
(define-fun func27  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func28  ((A String) (B Int) ) String (str.substr A  B  (str.len A )))
(define-fun func29  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ B  C ) (str.len D )))
(define-fun func30  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func31  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func32  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(define-fun func33  ((A String) (B String) (C Int) ) Int (+ 1  (str.indexof A  B  C )))
(define-fun func34  ((A Int) (B String) (C String) (D Int) ) Int (+ A  (str.indexof B  C  D )))
(define-fun func35  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func36  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func37  ((A String) (B String) (C String) (D String) (E String) ) String (str.++ A  (str.replace B  C  (str.++ D  E ))))
(define-fun func38  ((A Int) (B String) ) Int (- (str.len B ) A ))
(define-fun func39  ((A String) ) Int (- (str.len A ) 3 ))
(define-fun func40  ((A Int) ) Int (- A  3 ))
(synth-fun f ((col1 String) (col2 String)) String
( (Start String (ntString))
 (ntString String (
	col1 col2 " " "," "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "New York" 
	(func0 ntString ntString ntString ntString ntString)
	(func2 ntString ntInt)
	(func4 ntString ntString)
	(func5 ntString ntString ntString ntInt)
	(func8 ntString ntInt ntString ntInt)
	(func9 ntString ntInt ntString ntString ntInt)
	(func13 ntString ntInt ntInt ntInt)
	(func18 ntString ntInt ntInt ntString)
	(func24 ntString ntInt ntString)
	(func26 ntString ntInt ntString ntString)
	(func27 ntString ntInt)
	(func29 ntString ntInt ntInt ntString)
	(func30 ntString ntInt ntString)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(str.at ntString ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 
	(func31 ntString ntString)
	(func32 ntString ntString)
	(func33 ntString ntString ntInt)
	(func34 ntInt ntString ntString ntInt)
	(func38 ntInt ntString)
	(func39 ntString)
	(- ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
))
))
(constraint (= (f "UC Berkeley" "Berkeley, CA") "Berkeley, CA, USA"))
(constraint (= (f "University of Pennsylvania" "Phialdelphia, PA, USA") "Phialdelphia, PA, USA"))
(constraint (= (f "Cornell University" "Ithaca, New York, USA") "Ithaca, NY, USA"))
(constraint (= (f "Penn" "Philadelphia, PA, USA") "Philadelphia, PA, USA"))
(constraint (= (f "University of Michigan" "Ann Arbor, MI, USA") "Ann Arbor, MI, USA"))
(constraint (= (f "UC Berkeley" "Berkeley, CA") "Berkeley, CA, USA"))
(constraint (= (f "MIT" "Cambridge, MA") "Cambridge, MA, USA"))
(constraint (= (f "University of Pennsylvania" "Phialdelphia, PA, USA") "Phialdelphia, PA, USA"))
(constraint (= (f "UCLA" "Los Angeles, CA") "Los Angeles, CA, USA"))
(constraint (= (f "University of Maryland College Park" "College Park, MD") "College Park, MD, USA"))
(constraint (= (f "University of Michigan" "Ann Arbor, MI, USA") "Ann Arbor, MI, USA"))
(constraint (= (f "UC Berkeley" "Berkeley, CA") "Berkeley, CA, USA"))
(constraint (= (f "MIT" "Cambridge, MA") "Cambridge, MA, USA"))
(constraint (= (f "Rice University" "Houston, TX") "Houston, TX, USA"))
(constraint (= (f "Yale University" "New Haven, CT, USA") "New Haven, CT, USA"))
(constraint (= (f "Columbia University" "New York, NY, USA") "New York, NY, USA"))
(constraint (= (f "NYU" "New York, New York, USA") "New York, NY, USA"))
(constraint (= (f "Drexel University" "Philadelphia, PA") "Philadelphia, PA, USA"))
(constraint (= (f "UC Berkeley" "Berkeley, CA") "Berkeley, CA, USA"))
(constraint (= (f "UIUC" "Urbana, IL") "Urbana, IL, USA"))
(constraint (= (f "Temple University" "Philadelphia, PA") "Philadelphia, PA, USA"))
(constraint (= (f "Harvard University" "Cambridge, MA, USA") "Cambridge, MA, USA"))
(constraint (= (f "University of Connecticut" "Storrs, CT, USA") "Storrs, CT, USA"))
(constraint (= (f "Drexel University" "Philadelphia, PA") "Philadelphia, PA, USA"))
(constraint (= (f "NYU" "New York, New York, USA") "New York, NY, USA"))
(constraint (= (f "UIUC" "Urbana, IL") "Urbana, IL, USA"))
(constraint (= (f "New Haven University" "New Haven, CT, USA") "New Haven, CT, USA"))
(constraint (= (f "University of California, Santa Barbara" "Santa Barbara, CA, USA") "Santa Barbara, CA, USA"))
(constraint (= (f "University of Connecticut" "Storrs, CT, USA") "Storrs, CT, USA"))
(check-synth)
