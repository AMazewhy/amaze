(set-logic SLIA)
(define-fun func0  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func1  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func2  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func3  ((A String) ) String (str.substr A  0  3 ))
(define-fun func4  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  (+ 1  (str.indexof A  C  D )) B ))
(define-fun func5  ((A String) (B Int) (C String) ) String (str.substr A  (+ 1  (str.indexof A  C  0 )) B ))
(define-fun func6  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  (+ 1  (str.indexof C  D  E )) B ))
(define-fun func7  ((A String) (B Int) (C String) (D String) ) String (str.substr A  (+ 1  (str.indexof C  D  0 )) B ))
(define-fun func8  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 1  C ) B ))
(define-fun func9  ((A String) (B Int) ) String (str.substr A  (+ 3  5 ) B ))
(define-fun func10  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 3  C ) B ))
(define-fun func11  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (+ C  (str.indexof A  D  E )) B ))
(define-fun func12  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ C  (str.indexof A  D  0 )) B ))
(define-fun func13  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ C  (str.indexof D  E  F )) B ))
(define-fun func14  ((A String) (B Int) (C Int) (D String) (E String) ) String (str.substr A  (+ C  (str.indexof D  E  0 )) B ))
(define-fun func15  ((A String) (B Int) (C Int) ) String (str.substr A  (+ C  5 ) B ))
(define-fun func16  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func17  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) 3 ))
(define-fun func18  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) (str.len A )))
(define-fun func19  ((A String) ) String (str.substr A  4  3 ))
(define-fun func20  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func21  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func22  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func23  ((A String) (B Int) ) String (str.substr A  B  (str.len A )))
(define-fun func24  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ B  C ) (str.len D )))
(define-fun func25  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  1 )))
(define-fun func26  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func27  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func28  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(define-fun func29  ((A String) (B String) (C Int) ) Int (+ 1  (str.indexof A  B  C )))
(define-fun func30  ((A String) (B String) ) Int (+ 1  (str.indexof A  B  0 )))
(define-fun func32  ((A Int) (B String) (C String) (D Int) ) Int (+ A  (str.indexof B  C  D )))
(define-fun func33  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  0 )))
(define-fun func34  ((A Int) ) Int (+ A  5 ))
(define-fun func35  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func36  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func37  ((A String) (B String) (C String) (D String) (E Int) ) String (str.++ A  (str.++ B  (str.++ (str.at D  E ) C ))))
(define-fun func38  ((A String) (B String) (C String) (D Int) ) String (str.++ A  (str.++ (str.at C  D ) B )))
(define-fun func39  ((A String) (B String) (C Int) ) String (str.++ (str.at B  C ) A ))
(define-fun func40  ((A String) (B String) ) String (str.++ (str.at B  0 ) A ))
(define-fun func41  ((A String) (B Int) (C String) (D String) (E String) ) String (str.++ (str.at A  B ) (str.++ C  (str.++ D  E ))))
(define-fun func42  ((A String) (B Int) (C String) (D String) ) String (str.++ (str.at A  B ) (str.++ C  D )))
(define-fun func43  ((A String) ) String (str.at A  0 ))
(define-fun func44  ((A Int) (B String) ) Int (- (str.len B ) A ))
(synth-fun f ((name String)) String
( (Start String (ntString))
 (ntString String (
	name " " "." 
	(func0 ntString ntInt)
	(func8 ntString ntInt ntInt)
	(func10 ntString ntInt ntInt)
	(func13 ntString ntInt ntInt ntString ntString ntInt)
	(func14 ntString ntInt ntInt ntString ntString)
	(func15 ntString ntInt ntInt)
	(func16 ntString ntInt ntInt ntInt)
	(func17 ntString ntInt ntInt)
	(func18 ntString ntInt ntInt)
	(func20 ntString ntInt ntString ntInt)
	(func21 ntString ntInt ntString ntString ntInt)
	(func22 ntString ntInt)
	(func23 ntString ntInt)
	(func25 ntString ntInt ntString ntString)
	(func26 ntString ntInt ntString)
	(func35 ntString ntString ntString)
	(func36 ntString ntString ntString ntString)
	(func37 ntString ntString ntString ntString ntInt)
	(func39 ntString ntString ntInt)
	(func40 ntString ntString)
	(func41 ntString ntInt ntString ntString ntString)
	(func42 ntString ntInt ntString ntString)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(str.at ntString ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 
	(func28 ntString ntString)
	(func29 ntString ntString ntInt)
	(func30 ntString ntString)
	(func32 ntInt ntString ntString ntInt)
	(func33 ntInt ntString ntString)
	(func34 ntInt)
	(func44 ntInt ntString)
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
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
))
))
(constraint (= (f "Nancy FreeHafer") "N.F."))
(constraint (= (f "Andrew Cencici") "A.C."))
(constraint (= (f "Jan Kotas") "J.K."))
(constraint (= (f "Mariya Sergienko") "M.S."))
(constraint (= (f "Launa Withers") "L.W."))
(constraint (= (f "Launa Withers") "L.W."))
(constraint (= (f "Launa Withers") "L.W."))
(constraint (= (f "Lakenya Edison") "L.E."))
(constraint (= (f "Lakenya Edison") "L.E."))
(constraint (= (f "Lakenya Edison") "L.E."))
(constraint (= (f "Brendan Hage") "B.H."))
(constraint (= (f "Brendan Hage") "B.H."))
(constraint (= (f "Brendan Hage") "B.H."))
(constraint (= (f "Bradford Lango") "B.L."))
(constraint (= (f "Bradford Lango") "B.L."))
(constraint (= (f "Bradford Lango") "B.L."))
(constraint (= (f "Rudolf Akiyama") "R.A."))
(constraint (= (f "Rudolf Akiyama") "R.A."))
(constraint (= (f "Rudolf Akiyama") "R.A."))
(constraint (= (f "Lara Constable") "L.C."))
(constraint (= (f "Lara Constable") "L.C."))
(constraint (= (f "Lara Constable") "L.C."))
(constraint (= (f "Madelaine Ghoston") "M.G."))
(constraint (= (f "Madelaine Ghoston") "M.G."))
(constraint (= (f "Madelaine Ghoston") "M.G."))
(constraint (= (f "Salley Hornak") "S.H."))
(constraint (= (f "Salley Hornak") "S.H."))
(constraint (= (f "Salley Hornak") "S.H."))
(constraint (= (f "Micha Junkin") "M.J."))
(constraint (= (f "Micha Junkin") "M.J."))
(constraint (= (f "Micha Junkin") "M.J."))
(constraint (= (f "Teddy Bobo") "T.B."))
(constraint (= (f "Teddy Bobo") "T.B."))
(constraint (= (f "Teddy Bobo") "T.B."))
(constraint (= (f "Coralee Scalia") "C.S."))
(constraint (= (f "Coralee Scalia") "C.S."))
(constraint (= (f "Coralee Scalia") "C.S."))
(constraint (= (f "Jeff Quashie") "J.Q."))
(constraint (= (f "Jeff Quashie") "J.Q."))
(constraint (= (f "Jeff Quashie") "J.Q."))
(constraint (= (f "Vena Babiarz") "V.B."))
(constraint (= (f "Vena Babiarz") "V.B."))
(constraint (= (f "Vena Babiarz") "V.B."))
(constraint (= (f "Karrie Lain") "K.L."))
(constraint (= (f "Karrie Lain") "K.L."))
(constraint (= (f "Karrie Lain") "K.L."))
(constraint (= (f "Tobias Dermody") "T.D."))
(constraint (= (f "Tobias Dermody") "T.D."))
(constraint (= (f "Tobias Dermody") "T.D."))
(constraint (= (f "Celsa Hopkins") "C.H."))
(constraint (= (f "Celsa Hopkins") "C.H."))
(constraint (= (f "Celsa Hopkins") "C.H."))
(constraint (= (f "Kimberley Halpern") "K.H."))
(constraint (= (f "Kimberley Halpern") "K.H."))
(constraint (= (f "Kimberley Halpern") "K.H."))
(constraint (= (f "Phillip Rowden") "P.R."))
(constraint (= (f "Phillip Rowden") "P.R."))
(constraint (= (f "Phillip Rowden") "P.R."))
(constraint (= (f "Elias Neil") "E.N."))
(constraint (= (f "Elias Neil") "E.N."))
(constraint (= (f "Elias Neil") "E.N."))
(constraint (= (f "Lashanda Cortes") "L.C."))
(constraint (= (f "Lashanda Cortes") "L.C."))
(constraint (= (f "Lashanda Cortes") "L.C."))
(constraint (= (f "Mackenzie Spell") "M.S."))
(constraint (= (f "Mackenzie Spell") "M.S."))
(constraint (= (f "Mackenzie Spell") "M.S."))
(constraint (= (f "Kathlyn Eccleston") "K.E."))
(constraint (= (f "Kathlyn Eccleston") "K.E."))
(constraint (= (f "Kathlyn Eccleston") "K.E."))
(constraint (= (f "Georgina Brescia") "G.B."))
(constraint (= (f "Georgina Brescia") "G.B."))
(constraint (= (f "Georgina Brescia") "G.B."))
(constraint (= (f "Beata Miah") "B.M."))
(constraint (= (f "Beata Miah") "B.M."))
(constraint (= (f "Beata Miah") "B.M."))
(constraint (= (f "Desiree Seamons") "D.S."))
(constraint (= (f "Desiree Seamons") "D.S."))
(constraint (= (f "Desiree Seamons") "D.S."))
(constraint (= (f "Jeanice Soderstrom") "J.S."))
(constraint (= (f "Jeanice Soderstrom") "J.S."))
(constraint (= (f "Jeanice Soderstrom") "J.S."))
(constraint (= (f "Mariel Jurgens") "M.J."))
(constraint (= (f "Mariel Jurgens") "M.J."))
(constraint (= (f "Mariel Jurgens") "M.J."))
(constraint (= (f "Alida Bogle") "A.B."))
(constraint (= (f "Alida Bogle") "A.B."))
(constraint (= (f "Alida Bogle") "A.B."))
(constraint (= (f "Jacqualine Olague") "J.O."))
(constraint (= (f "Jacqualine Olague") "J.O."))
(constraint (= (f "Jacqualine Olague") "J.O."))
(constraint (= (f "Joaquin Clasen") "J.C."))
(constraint (= (f "Joaquin Clasen") "J.C."))
(constraint (= (f "Joaquin Clasen") "J.C."))
(constraint (= (f "Samuel Richert") "S.R."))
(constraint (= (f "Samuel Richert") "S.R."))
(constraint (= (f "Samuel Richert") "S.R."))
(constraint (= (f "Malissa Marcus") "M.M."))
(constraint (= (f "Malissa Marcus") "M.M."))
(constraint (= (f "Malissa Marcus") "M.M."))
(constraint (= (f "Alaina Partida") "A.P."))
(constraint (= (f "Alaina Partida") "A.P."))
(constraint (= (f "Alaina Partida") "A.P."))
(constraint (= (f "Trinidad Mulloy") "T.M."))
(constraint (= (f "Trinidad Mulloy") "T.M."))
(constraint (= (f "Trinidad Mulloy") "T.M."))
(constraint (= (f "Carlene Garrard") "C.G."))
(constraint (= (f "Carlene Garrard") "C.G."))
(constraint (= (f "Carlene Garrard") "C.G."))
(constraint (= (f "Melodi Chism") "M.C."))
(constraint (= (f "Melodi Chism") "M.C."))
(constraint (= (f "Melodi Chism") "M.C."))
(constraint (= (f "Bess Chilcott") "B.C."))
(constraint (= (f "Bess Chilcott") "B.C."))
(constraint (= (f "Bess Chilcott") "B.C."))
(constraint (= (f "Chong Aylward") "C.A."))
(constraint (= (f "Chong Aylward") "C.A."))
(constraint (= (f "Chong Aylward") "C.A."))
(constraint (= (f "Jani Ramthun") "J.R."))
(constraint (= (f "Jani Ramthun") "J.R."))
(constraint (= (f "Jani Ramthun") "J.R."))
(constraint (= (f "Jacquiline Heintz") "J.H."))
(constraint (= (f "Jacquiline Heintz") "J.H."))
(constraint (= (f "Jacquiline Heintz") "J.H."))
(constraint (= (f "Hayley Marquess") "H.M."))
(constraint (= (f "Hayley Marquess") "H.M."))
(constraint (= (f "Hayley Marquess") "H.M."))
(constraint (= (f "Andria Spagnoli") "A.S."))
(constraint (= (f "Andria Spagnoli") "A.S."))
(constraint (= (f "Andria Spagnoli") "A.S."))
(constraint (= (f "Irwin Covelli") "I.C."))
(constraint (= (f "Irwin Covelli") "I.C."))
(constraint (= (f "Irwin Covelli") "I.C."))
(constraint (= (f "Gertude Montiel") "G.M."))
(constraint (= (f "Gertude Montiel") "G.M."))
(constraint (= (f "Gertude Montiel") "G.M."))
(constraint (= (f "Stefany Reily") "S.R."))
(constraint (= (f "Stefany Reily") "S.R."))
(constraint (= (f "Stefany Reily") "S.R."))
(constraint (= (f "Rae Mcgaughey") "R.M."))
(constraint (= (f "Rae Mcgaughey") "R.M."))
(constraint (= (f "Rae Mcgaughey") "R.M."))
(constraint (= (f "Cruz Latimore") "C.L."))
(constraint (= (f "Cruz Latimore") "C.L."))
(constraint (= (f "Cruz Latimore") "C.L."))
(constraint (= (f "Maryann Casler") "M.C."))
(constraint (= (f "Maryann Casler") "M.C."))
(constraint (= (f "Maryann Casler") "M.C."))
(constraint (= (f "Annalisa Gregori") "A.G."))
(constraint (= (f "Annalisa Gregori") "A.G."))
(constraint (= (f "Annalisa Gregori") "A.G."))
(constraint (= (f "Jenee Pannell") "J.P."))
(constraint (= (f "Jenee Pannell") "J.P."))
(constraint (= (f "Jenee Pannell") "J.P."))
(constraint (= (f "Launa Withers") "L.W."))
(constraint (= (f "Lakenya Edison") "L.E."))
(constraint (= (f "Brendan Hage") "B.H."))
(constraint (= (f "Bradford Lango") "B.L."))
(constraint (= (f "Rudolf Akiyama") "R.A."))
(constraint (= (f "Lara Constable") "L.C."))
(constraint (= (f "Madelaine Ghoston") "M.G."))
(constraint (= (f "Salley Hornak") "S.H."))
(constraint (= (f "Micha Junkin") "M.J."))
(constraint (= (f "Teddy Bobo") "T.B."))
(constraint (= (f "Coralee Scalia") "C.S."))
(constraint (= (f "Jeff Quashie") "J.Q."))
(constraint (= (f "Vena Babiarz") "V.B."))
(constraint (= (f "Karrie Lain") "K.L."))
(constraint (= (f "Tobias Dermody") "T.D."))
(constraint (= (f "Celsa Hopkins") "C.H."))
(constraint (= (f "Kimberley Halpern") "K.H."))
(constraint (= (f "Phillip Rowden") "P.R."))
(constraint (= (f "Elias Neil") "E.N."))
(constraint (= (f "Lashanda Cortes") "L.C."))
(constraint (= (f "Mackenzie Spell") "M.S."))
(constraint (= (f "Kathlyn Eccleston") "K.E."))
(constraint (= (f "Georgina Brescia") "G.B."))
(constraint (= (f "Beata Miah") "B.M."))
(constraint (= (f "Desiree Seamons") "D.S."))
(constraint (= (f "Jeanice Soderstrom") "J.S."))
(constraint (= (f "Mariel Jurgens") "M.J."))
(constraint (= (f "Alida Bogle") "A.B."))
(constraint (= (f "Jacqualine Olague") "J.O."))
(constraint (= (f "Joaquin Clasen") "J.C."))
(constraint (= (f "Samuel Richert") "S.R."))
(constraint (= (f "Malissa Marcus") "M.M."))
(constraint (= (f "Alaina Partida") "A.P."))
(constraint (= (f "Trinidad Mulloy") "T.M."))
(constraint (= (f "Carlene Garrard") "C.G."))
(constraint (= (f "Melodi Chism") "M.C."))
(constraint (= (f "Bess Chilcott") "B.C."))
(constraint (= (f "Chong Aylward") "C.A."))
(constraint (= (f "Jani Ramthun") "J.R."))
(constraint (= (f "Jacquiline Heintz") "J.H."))
(constraint (= (f "Hayley Marquess") "H.M."))
(constraint (= (f "Andria Spagnoli") "A.S."))
(constraint (= (f "Irwin Covelli") "I.C."))
(constraint (= (f "Gertude Montiel") "G.M."))
(constraint (= (f "Stefany Reily") "S.R."))
(constraint (= (f "Rae Mcgaughey") "R.M."))
(constraint (= (f "Cruz Latimore") "C.L."))
(constraint (= (f "Maryann Casler") "M.C."))
(constraint (= (f "Annalisa Gregori") "A.G."))
(constraint (= (f "Jenee Pannell") "J.P."))
(check-synth)
