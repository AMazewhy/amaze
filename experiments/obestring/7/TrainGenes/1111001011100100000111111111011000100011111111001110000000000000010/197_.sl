(set-logic SLIA)
(define-fun func0  ((A String) (B String) (C String) (D String) (E String) ) String (str.replace (str.replace C  D  E ) A  B ))
(define-fun func1  ((A String) (B String) (C String) (D String) ) String (str.replace A  B  (str.++ C  D )))
(define-fun func2  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func3  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func4  ((A String) (B String) (C String) (D Int) ) String (str.++ A  (str.++ (str.at C  D ) B )))
(define-fun func5  ((A String) (B String) (C Int) ) String (str.++ (str.at B  C ) A ))
(define-fun func6  ((A String) (B String) ) String (str.++ (str.at B  0 ) A ))
(define-fun func7  ((A String) (B String) (C String) (D String) (E Int) ) String (str.++ A  (str.++ B  (str.++ (str.at D  E ) C ))))
(define-fun func8  ((A String) (B String) (C String) (D String) (E String) ) String (str.++ A  (str.++ B  (str.++ C  (str.++ D  E )))))
(define-fun func9  ((A Int) ) Int (+ 1  A ))
(define-fun func10  ((A String) (B String) (C Int) ) Int (+ 1  (str.indexof A  B  C )))
(define-fun func11  ((A String) (B String) ) Int (+ 1  (str.indexof A  B  0 )))
(define-fun func12  ((A Int) (B Int) (C Int) ) Int (+ A  (+ B  C )))
(define-fun func13  ((A Int) ) Int (+ A  -1 ))
(define-fun func14  ((A Int) (B String) (C String) (D Int) ) Int (+ A  (str.indexof B  C  D )))
(define-fun func15  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  1 )))
(define-fun func16  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  0 )))
(define-fun func17  ((A Int) (B String) ) Int (- (str.len B ) A ))
(define-fun func18  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  (+ 1  (str.indexof A  C  D )) B ))
(define-fun func19  ((A String) (B Int) (C String) ) String (str.substr A  (+ 1  (str.indexof A  C  0 )) B ))
(define-fun func20  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  (+ 1  (str.indexof C  D  E )) B ))
(define-fun func21  ((A String) (B Int) (C String) (D String) ) String (str.substr A  (+ 1  (str.indexof C  D  0 )) B ))
(define-fun func22  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 1  C ) B ))
(define-fun func23  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (+ C  (str.indexof A  D  E )) B ))
(define-fun func24  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ C  (str.indexof A  D  0 )) B ))
(define-fun func25  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ C  (str.indexof D  E  F )) B ))
(define-fun func26  ((A String) (B Int) (C Int) (D String) (E String) ) String (str.substr A  (+ C  (str.indexof D  E  0 )) B ))
(define-fun func27  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func28  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) 3 ))
(define-fun func29  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) (str.len A )))
(define-fun func30  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func31  ((A String) (B Int) (C Int) ) String (str.substr A  0  (+ B  C )))
(define-fun func32  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func33  ((A String) (B String) ) String (str.substr A  0  (str.indexof A  B  0 )))
(define-fun func34  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func35  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  1 )))
(define-fun func36  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  0 )))
(define-fun func37  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (+ C  D )))
(define-fun func38  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (- C  D )))
(define-fun func39  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func40  ((A String) (B Int) ) String (str.substr A  B  (str.len A )))
(define-fun func41  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func42  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  0 )))
(define-fun func43  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func44  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  1 )))
(define-fun func45  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  0 )))
(define-fun func46  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ B  C ) (str.len D )))
(define-fun func47  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func48  ((A String) (B String) ) Bool (str.contains A  B ))
(define-fun func49  ((A String) ) String (str.at A  0 ))
(define-fun func50  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func51  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(synth-fun f ((col1 String) (col2 String)) String
( (Start String (ntString))
 (ntString String (
	col1 col2 " " "," "USA" "PA" "CT" "CA" "MD" "NY" 
	(func0 ntString ntString ntString ntString ntString)
	(func1 ntString ntString ntString ntString)
	(func2 ntString ntString ntString)
	(func3 ntString ntString ntString ntString)
	(func6 ntString ntString)
	(func8 ntString ntString ntString ntString ntString)
	(func18 ntString ntInt ntString ntInt)
	(func19 ntString ntInt ntString)
	(func22 ntString ntInt ntInt)
	(func28 ntString ntInt ntInt)
	(func29 ntString ntInt ntInt)
	(func30 ntString ntInt)
	(func31 ntString ntInt ntInt)
	(func32 ntString ntString ntInt)
	(func33 ntString ntString)
	(func34 ntString ntString ntString ntInt)
	(func35 ntString ntString ntString)
	(func36 ntString ntString ntString)
	(func38 ntString ntInt ntInt ntInt)
	(func39 ntString ntInt)
	(func43 ntString ntInt ntString ntString ntInt)
	(func47 ntString ntInt ntString)
	(func49 ntString)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 
	(func9 ntInt)
	(func10 ntString ntString ntInt)
	(func11 ntString ntString)
	(func12 ntInt ntInt ntInt)
	(func13 ntInt)
	(func14 ntInt ntString ntString ntInt)
	(func17 ntInt ntString)
	(func50 ntString ntString)
	(func51 ntString ntString)
	(+ ntInt ntInt)
	(- ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
	(str.indexof ntString ntString ntInt)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.prefixof ntString ntString)
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
