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
(define-fun func9  ((A String) (B String) (C String) (D String) (E Int) (F Int) ) String (str.++ A  (str.++ B  (str.++ C  (str.substr D  E  F )))))
(define-fun func10  ((A String) (B String) (C String) (D Int) (E Int) ) String (str.++ A  (str.++ B  (str.substr C  D  E ))))
(define-fun func11  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func12  ((A String) ) String (str.substr A  0  1 ))
(define-fun func13  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func14  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func15  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  (+ 1  (str.indexof A  C  D )) B ))
(define-fun func16  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  (+ 1  (str.indexof C  D  E )) B ))
(define-fun func17  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 1  C ) B ))
(define-fun func18  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (+ C  (str.indexof A  D  E )) B ))
(define-fun func19  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ C  (str.indexof D  E  F )) B ))
(define-fun func20  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func21  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) 3 ))
(define-fun func22  ((A String) (B Int) ) String (str.substr A  1  B ))
(define-fun func23  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (- C  D ) B ))
(define-fun func24  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (+ C  D )))
(define-fun func25  ((A String) (B Int) ) String (str.substr A  B  1 ))
(define-fun func26  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func27  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func28  ((A String) (B Int) ) String (str.substr A  B  (str.len A )))
(define-fun func29  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (- C  D )))
(define-fun func30  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func31  ((A String) (B Int) (C Int) ) String (str.substr A  0  (+ B  C )))
(define-fun func32  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  1 )))
(define-fun func33  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func34  ((A Int) ) Int (+ 1  A ))
(define-fun func35  ((A String) (B String) (C Int) ) Int (+ 1  (str.indexof A  B  C )))
(define-fun func36  ((A String) (B String) ) Int (+ 1  (str.indexof A  B  1 )))
(define-fun func37  ((A Int) ) Int (+ -1  A ))
(define-fun func38  ((A Int) (B String) (C String) (D Int) ) Int (+ A  (str.indexof B  C  D )))
(define-fun func39  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  1 )))
(define-fun func40  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(define-fun func41  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func42  ((A Int) (B String) (C String) (D Int) ) Int (- (str.indexof B  C  D ) A ))
(define-fun func43  ((A Int) (B String) ) Int (- (str.len B ) A ))
(define-fun func44  ((A String) (B String) (C String) (D Int) (E Int) ) String (str.replace (str.substr C  D  E ) A  B ))
(define-fun func45  ((A String) (B String) (C String) (D String) (E String) ) String (str.replace (str.replace C  D  E ) A  B ))
(synth-fun f ((col1 String) (col2 String)) String
( (Start String (ntString))
 (ntString String (
	col1 col2 " " "," "AK" "AZ" "AR" "CA" "CO" "CT" "DE" "FL" "GA" "HI" "ID" "IL" "IN" "IA" "KS" "KY" "LA" "ME" "MD" "MA" "MI" "MN" "MS" "MO" "MT" "NE" "NV" "NH" "NJ" "NM" "NY" "NC" "ND" "OH" "OK" "OR" "PA" "RI" "SC" "SD" "TN" "TX" "UT" "VT" "VA" "WA" "WV" "WI" "USA" "New York" 
	(func6 ntString ntString ntString)
	(func15 ntString ntInt ntString ntInt)
	(func18 ntString ntInt ntInt ntString ntInt)
	(func21 ntString ntInt ntInt)
	(func25 ntString ntInt)
	(func26 ntString ntInt ntString ntInt)
	(func29 ntString ntInt ntInt ntInt)
	(func45 ntString ntString ntString ntString ntString)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(int.to.str ntInt)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 
	(func38 ntInt ntString ntString ntInt)
	(func40 ntString ntString)
	(- ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
))
 (ntBool Bool (
	true false
	(str.contains ntString ntString)
))
))
(constraint (= (f "UC Berkeley" "Berkeley, CA") "Berkeley, CA, USA"))
(constraint (= (f "University of Pennsylvania" "Phialdelphia, PA, USA") "Phialdelphia, PA, USA"))
(constraint (= (f "UCLA" "Los Angeles, CA") "UCLA, Los Angeles, CA, USA"))
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
(constraint (= (f "Drexel University" "Philadelphia, PA") "DPhiladelphia, PA, USA"))
(constraint (= (f "NYU" "New York, New York, USA") "New York, NY, USA"))
(constraint (= (f "UIUC" "Urbana, IL") "Urbana, IL, USA"))
(constraint (= (f "New Haven University" "New Haven, CT, USA") "New Haven, CT, USA"))
(constraint (= (f "University of California, Santa Barbara" "Santa Barbara, CA, USA") "Santa Barbara, CA, USA"))
(constraint (= (f "University of Connecticut" "Storrs, CT, USA") "Storrs, CT, USA"))
(check-synth)
