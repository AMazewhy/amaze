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
(synth-fun f ((name String)) String
( (Start String (ntString))
 (ntString String (
	name " " "." "Dr." 
	(func0 ntString ntString ntString ntString ntString)
	(func1 ntString ntString ntString ntString)
	(func2 ntString ntString ntString)
	(func3 ntString ntString ntString ntString)
	(func4 ntString ntString ntString ntInt)
	(func5 ntString ntString ntInt)
	(func6 ntString ntString)
	(func19 ntString ntInt ntString)
	(func22 ntString ntInt ntInt)
	(func24 ntString ntInt ntInt ntString)
	(func26 ntString ntInt ntInt ntString ntString)
	(func27 ntString ntInt ntInt ntInt)
	(func28 ntString ntInt ntInt)
	(func29 ntString ntInt ntInt)
	(func30 ntString ntInt)
	(func31 ntString ntInt ntInt)
	(func32 ntString ntString ntInt)
	(func37 ntString ntInt ntInt ntInt)
	(func38 ntString ntInt ntInt ntInt)
	(func39 ntString ntInt)
	(func41 ntString ntInt ntString ntInt)
	(func43 ntString ntInt ntString ntString ntInt)
	(func44 ntString ntInt ntString ntString)
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
	(func12 ntInt ntInt ntInt)
	(func13 ntInt)
	(func15 ntInt ntString ntString)
	(func16 ntInt ntString ntString)
	(func17 ntInt ntString)
	(func51 ntString ntString)
	(+ ntInt ntInt)
	(- ntInt ntInt)
	(str.to.int ntString)
	(str.indexof ntString ntString ntInt)
))
 (ntBool Bool (
	true false
	(str.prefixof ntString ntString)
))
))
(constraint (= (f "Launa Withers") "Dr. Launa"))
(constraint (= (f "Lakenya Edison") "Dr. Lakenya"))
(constraint (= (f "Brendan Hage") "Dr. Brendan"))
(constraint (= (f "Bradford Lango") "Dr. Bradford"))
(constraint (= (f "Rudolf Akiyama") "Dr. Rudolf"))
(constraint (= (f "Lara Constable") "Dr. Lara"))
(constraint (= (f "Madelaine Ghoston") "Dr. Madelaine"))
(constraint (= (f "Salley Hornak") "Dr. Salley"))
(constraint (= (f "Micha Junkin") "Dr. Micha"))
(constraint (= (f "Teddy Bobo") "Dr. Teddy"))
(constraint (= (f "Coralee Scalia") "Dr. Coralee"))
(constraint (= (f "Jeff Quashie") "Dr. Jeff"))
(constraint (= (f "Vena Babiarz") "Dr. Vena"))
(constraint (= (f "Karrie Lain") "Dr. Karrie"))
(constraint (= (f "Tobias Dermody") "Dr. Tobias"))
(constraint (= (f "Celsa Hopkins") "Dr. Celsa"))
(constraint (= (f "Kimberley Halpern") "Dr. Kimberley"))
(constraint (= (f "Phillip Rowden") "Dr. Phillip"))
(constraint (= (f "Elias Neil") "Dr. Elias"))
(constraint (= (f "Lashanda Cortes") "Dr. Lashanda"))
(constraint (= (f "Mackenzie Spell") "Dr. Mackenzie"))
(constraint (= (f "Kathlyn Eccleston") "Dr. Kathlyn"))
(constraint (= (f "Georgina Brescia") "Dr. Georgina"))
(constraint (= (f "Beata Miah") "Dr. Beata"))
(constraint (= (f "Desiree Seamons") "Dr. Desiree"))
(constraint (= (f "Jeanice Soderstrom") "Dr. Jeanice"))
(constraint (= (f "Mariel Jurgens") "Dr. Mariel"))
(constraint (= (f "Alida Bogle") "Dr. Alida"))
(constraint (= (f "Jacqualine Olague") "Dr. Jacqualine"))
(constraint (= (f "Joaquin Clasen") "Dr. Joaquin"))
(constraint (= (f "Samuel Richert") "Dr. Samuel"))
(constraint (= (f "Malissa Marcus") "Dr. Malissa"))
(constraint (= (f "Alaina Partida") "Dr. Alaina"))
(constraint (= (f "Trinidad Mulloy") "Dr. Trinidad"))
(constraint (= (f "Carlene Garrard") "Dr. Carlene"))
(constraint (= (f "Melodi Chism") "Dr. Melodi"))
(constraint (= (f "Bess Chilcott") "Dr. Bess"))
(constraint (= (f "Chong Aylward") "Dr. Chong"))
(constraint (= (f "Jani Ramthun") "Dr. Jani"))
(constraint (= (f "Jacquiline Heintz") "Dr. Jacquiline"))
(constraint (= (f "Hayley Marquess") "Dr. Hayley"))
(constraint (= (f "Andria Spagnoli") "Dr. Andria"))
(constraint (= (f "Irwin Covelli") "Dr. Irwin"))
(constraint (= (f "Gertude Montiel") "Dr. Gertude"))
(constraint (= (f "Stefany Reily") "Dr. Stefany"))
(constraint (= (f "Rae Mcgaughey") "Dr. Rae"))
(constraint (= (f "Cruz Latimore") "Dr. Cruz"))
(constraint (= (f "Maryann Casler") "Dr. Maryann"))
(constraint (= (f "Annalisa Gregori") "Dr. Annalisa"))
(constraint (= (f "Jenee Pannell") "Dr. Jenee"))
(check-synth)
