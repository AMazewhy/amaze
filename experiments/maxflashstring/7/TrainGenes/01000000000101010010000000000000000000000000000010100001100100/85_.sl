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
(synth-fun f ((name String)) String
( (Start String (ntString))
 (ntString String (
	name " " 
	(func1 ntString ntString ntInt ntInt)
	(func11 ntString ntInt)
	(func13 ntString ntString ntInt)
	(func15 ntString ntInt ntString ntInt)
	(func18 ntString ntInt ntInt ntString ntInt)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(int.to.str ntInt)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 
	(+ ntInt ntInt)
	(- ntInt ntInt)
	(str.len ntString)
	(str.indexof ntString ntString ntInt)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
))
))
(constraint (= (f "Nancy FreeHafer") "FreeHafer"))
(constraint (= (f "Andrew Cencici") "Cencici"))
(constraint (= (f "Jan Kotas") "Kotas"))
(constraint (= (f "Mariya Sergienko") "Sergienko"))
(constraint (= (f "Launa Withers") "Withers"))
(constraint (= (f "Launa Withers") "Withers"))
(constraint (= (f "Launa Withers") "Withers"))
(constraint (= (f "Lakenya Edison") "Edison"))
(constraint (= (f "Lakenya Edison") "Edison"))
(constraint (= (f "Lakenya Edison") "Edison"))
(constraint (= (f "Brendan Hage") "Hage"))
(constraint (= (f "Brendan Hage") "Hage"))
(constraint (= (f "Brendan Hage") "Hage"))
(constraint (= (f "Bradford Lango") "Lango"))
(constraint (= (f "Bradford Lango") "Lango"))
(constraint (= (f "Bradford Lango") "Lango"))
(constraint (= (f "Rudolf Akiyama") "Akiyama"))
(constraint (= (f "Rudolf Akiyama") "Akiyama"))
(constraint (= (f "Rudolf Akiyama") "Akiyama"))
(constraint (= (f "Lara Constable") "Constable"))
(constraint (= (f "Lara Constable") "Constable"))
(constraint (= (f "Lara Constable") "Constable"))
(constraint (= (f "Madelaine Ghoston") "Ghoston"))
(constraint (= (f "Madelaine Ghoston") "Ghoston"))
(constraint (= (f "Madelaine Ghoston") "Ghoston"))
(constraint (= (f "Salley Hornak") "Hornak"))
(constraint (= (f "Salley Hornak") "Hornak"))
(constraint (= (f "Salley Hornak") "Hornak"))
(constraint (= (f "Micha Junkin") "Junkin"))
(constraint (= (f "Micha Junkin") "Junkin"))
(constraint (= (f "Micha Junkin") "Junkin"))
(constraint (= (f "Teddy Bobo") "Bobo"))
(constraint (= (f "Teddy Bobo") "Bobo"))
(constraint (= (f "Teddy Bobo") "Bobo"))
(constraint (= (f "Coralee Scalia") "Scalia"))
(constraint (= (f "Coralee Scalia") "Scalia"))
(constraint (= (f "Coralee Scalia") "Scalia"))
(constraint (= (f "Jeff Quashie") "Quashie"))
(constraint (= (f "Jeff Quashie") "Quashie"))
(constraint (= (f "Jeff Quashie") "Quashie"))
(constraint (= (f "Vena Babiarz") "Babiarz"))
(constraint (= (f "Vena Babiarz") "Babiarz"))
(constraint (= (f "Vena Babiarz") "Babiarz"))
(constraint (= (f "Karrie Lain") "Lain"))
(constraint (= (f "Karrie Lain") "Lain"))
(constraint (= (f "Karrie Lain") "Lain"))
(constraint (= (f "Tobias Dermody") "Dermody"))
(constraint (= (f "Tobias Dermody") "Dermody"))
(constraint (= (f "Tobias Dermody") "Dermody"))
(constraint (= (f "Celsa Hopkins") "Hopkins"))
(constraint (= (f "Celsa Hopkins") "Hopkins"))
(constraint (= (f "Celsa Hopkins") "Hopkins"))
(constraint (= (f "Kimberley Halpern") "Halpern"))
(constraint (= (f "Kimberley Halpern") "Halpern"))
(constraint (= (f "Kimberley Halpern") "Halpern"))
(constraint (= (f "Phillip Rowden") "Rowden"))
(constraint (= (f "Phillip Rowden") "Rowden"))
(constraint (= (f "Phillip Rowden") "Rowden"))
(constraint (= (f "Elias Neil") "Neil"))
(constraint (= (f "Elias Neil") "Neil"))
(constraint (= (f "Elias Neil") "Neil"))
(constraint (= (f "Lashanda Cortes") "Cortes"))
(constraint (= (f "Lashanda Cortes") "Cortes"))
(constraint (= (f "Lashanda Cortes") "Cortes"))
(constraint (= (f "Mackenzie Spell") "Spell"))
(constraint (= (f "Mackenzie Spell") "Spell"))
(constraint (= (f "Mackenzie Spell") "Spell"))
(constraint (= (f "Kathlyn Eccleston") "Eccleston"))
(constraint (= (f "Kathlyn Eccleston") "Eccleston"))
(constraint (= (f "Kathlyn Eccleston") "Eccleston"))
(constraint (= (f "Georgina Brescia") "Brescia"))
(constraint (= (f "Georgina Brescia") "Brescia"))
(constraint (= (f "Georgina Brescia") "Brescia"))
(constraint (= (f "Beata Miah") "Miah"))
(constraint (= (f "Beata Miah") "Miah"))
(constraint (= (f "Beata Miah") "Miah"))
(constraint (= (f "Desiree Seamons") "Seamons"))
(constraint (= (f "Desiree Seamons") "Seamons"))
(constraint (= (f "Desiree Seamons") "Seamons"))
(constraint (= (f "Jeanice Soderstrom") "Soderstrom"))
(constraint (= (f "Jeanice Soderstrom") "Soderstrom"))
(constraint (= (f "Jeanice Soderstrom") "Soderstrom"))
(constraint (= (f "Mariel Jurgens") "Jurgens"))
(constraint (= (f "Mariel Jurgens") "Jurgens"))
(constraint (= (f "Mariel Jurgens") "Jurgens"))
(constraint (= (f "Alida Bogle") "Bogle"))
(constraint (= (f "Alida Bogle") "Bogle"))
(constraint (= (f "Alida Bogle") "Bogle"))
(constraint (= (f "Jacqualine Olague") "Olague"))
(constraint (= (f "Jacqualine Olague") "Olague"))
(constraint (= (f "Jacqualine Olague") "Olague"))
(constraint (= (f "Joaquin Clasen") "Clasen"))
(constraint (= (f "Joaquin Clasen") "Clasen"))
(constraint (= (f "Joaquin Clasen") "Clasen"))
(constraint (= (f "Samuel Richert") "Richert"))
(constraint (= (f "Samuel Richert") "Richert"))
(constraint (= (f "Samuel Richert") "Richert"))
(constraint (= (f "Malissa Marcus") "Marcus"))
(constraint (= (f "Malissa Marcus") "Marcus"))
(constraint (= (f "Malissa Marcus") "Marcus"))
(constraint (= (f "Alaina Partida") "Partida"))
(constraint (= (f "Alaina Partida") "Partida"))
(constraint (= (f "Alaina Partida") "Partida"))
(constraint (= (f "Trinidad Mulloy") "Mulloy"))
(constraint (= (f "Trinidad Mulloy") "Mulloy"))
(constraint (= (f "Trinidad Mulloy") "Mulloy"))
(constraint (= (f "Carlene Garrard") "Garrard"))
(constraint (= (f "Carlene Garrard") "Garrard"))
(constraint (= (f "Carlene Garrard") "Garrard"))
(constraint (= (f "Melodi Chism") "Chism"))
(constraint (= (f "Melodi Chism") "Chism"))
(constraint (= (f "Melodi Chism") "Chism"))
(constraint (= (f "Bess Chilcott") "Chilcott"))
(constraint (= (f "Bess Chilcott") "Chilcott"))
(constraint (= (f "Bess Chilcott") "Chilcott"))
(constraint (= (f "Chong Aylward") "Aylward"))
(constraint (= (f "Chong Aylward") "Aylward"))
(constraint (= (f "Chong Aylward") "Aylward"))
(constraint (= (f "Jani Ramthun") "Ramthun"))
(constraint (= (f "Jani Ramthun") "Ramthun"))
(constraint (= (f "Jani Ramthun") "Ramthun"))
(constraint (= (f "Jacquiline Heintz") "Heintz"))
(constraint (= (f "Jacquiline Heintz") "Heintz"))
(constraint (= (f "Jacquiline Heintz") "Heintz"))
(constraint (= (f "Hayley Marquess") "Marquess"))
(constraint (= (f "Hayley Marquess") "Marquess"))
(constraint (= (f "Hayley Marquess") "Marquess"))
(constraint (= (f "Andria Spagnoli") "Spagnoli"))
(constraint (= (f "Andria Spagnoli") "Spagnoli"))
(constraint (= (f "Andria Spagnoli") "Spagnoli"))
(constraint (= (f "Irwin Covelli") "Covelli"))
(constraint (= (f "Irwin Covelli") "Covelli"))
(constraint (= (f "Irwin Covelli") "Covelli"))
(constraint (= (f "Gertude Montiel") "Montiel"))
(constraint (= (f "Gertude Montiel") "Montiel"))
(constraint (= (f "Gertude Montiel") "Montiel"))
(constraint (= (f "Stefany Reily") "Reily"))
(constraint (= (f "Stefany Reily") "Reily"))
(constraint (= (f "Stefany Reily") "Reily"))
(constraint (= (f "Rae Mcgaughey") "Mcgaughey"))
(constraint (= (f "Rae Mcgaughey") "Mcgaughey"))
(constraint (= (f "Rae Mcgaughey") "Mcgaughey"))
(constraint (= (f "Cruz Latimore") "Latimore"))
(constraint (= (f "Cruz Latimore") "Latimore"))
(constraint (= (f "Cruz Latimore") "Latimore"))
(constraint (= (f "Maryann Casler") "Casler"))
(constraint (= (f "Maryann Casler") "Casler"))
(constraint (= (f "Maryann Casler") "Casler"))
(constraint (= (f "Annalisa Gregori") "Gregori"))
(constraint (= (f "Annalisa Gregori") "Gregori"))
(constraint (= (f "Annalisa Gregori") "Gregori"))
(constraint (= (f "Jenee Pannell") "Pannell"))
(constraint (= (f "Jenee Pannell") "Pannell"))
(constraint (= (f "Jenee Pannell") "Pannell"))
(constraint (= (f "Launa Withers") "Withers"))
(constraint (= (f "Lakenya Edison") "Edison"))
(constraint (= (f "Brendan Hage") "Hage"))
(constraint (= (f "Bradford Lango") "Lango"))
(constraint (= (f "Rudolf Akiyama") "Akiyama"))
(constraint (= (f "Lara Constable") "Constable"))
(constraint (= (f "Madelaine Ghoston") "Ghoston"))
(constraint (= (f "Salley Hornak") "Hornak"))
(constraint (= (f "Micha Junkin") "Junkin"))
(constraint (= (f "Teddy Bobo") "Bobo"))
(constraint (= (f "Coralee Scalia") "Scalia"))
(constraint (= (f "Jeff Quashie") "Quashie"))
(constraint (= (f "Vena Babiarz") "Babiarz"))
(constraint (= (f "Karrie Lain") "Lain"))
(constraint (= (f "Tobias Dermody") "Dermody"))
(constraint (= (f "Celsa Hopkins") "Hopkins"))
(constraint (= (f "Kimberley Halpern") "Halpern"))
(constraint (= (f "Phillip Rowden") "Rowden"))
(constraint (= (f "Elias Neil") "Neil"))
(constraint (= (f "Lashanda Cortes") "Cortes"))
(constraint (= (f "Mackenzie Spell") "Spell"))
(constraint (= (f "Kathlyn Eccleston") "Eccleston"))
(constraint (= (f "Georgina Brescia") "Brescia"))
(constraint (= (f "Beata Miah") "Miah"))
(constraint (= (f "Desiree Seamons") "Seamons"))
(constraint (= (f "Jeanice Soderstrom") "Soderstrom"))
(constraint (= (f "Mariel Jurgens") "Jurgens"))
(constraint (= (f "Alida Bogle") "Bogle"))
(constraint (= (f "Jacqualine Olague") "Olague"))
(constraint (= (f "Joaquin Clasen") "Clasen"))
(constraint (= (f "Samuel Richert") "Richert"))
(constraint (= (f "Malissa Marcus") "Marcus"))
(constraint (= (f "Alaina Partida") "Partida"))
(constraint (= (f "Trinidad Mulloy") "Mulloy"))
(constraint (= (f "Carlene Garrard") "Garrard"))
(constraint (= (f "Melodi Chism") "Chism"))
(constraint (= (f "Bess Chilcott") "Chilcott"))
(constraint (= (f "Chong Aylward") "Aylward"))
(constraint (= (f "Jani Ramthun") "Ramthun"))
(constraint (= (f "Jacquiline Heintz") "Heintz"))
(constraint (= (f "Hayley Marquess") "Marquess"))
(constraint (= (f "Andria Spagnoli") "Spagnoli"))
(constraint (= (f "Irwin Covelli") "Covelli"))
(constraint (= (f "Gertude Montiel") "Montiel"))
(constraint (= (f "Stefany Reily") "Reily"))
(constraint (= (f "Rae Mcgaughey") "Mcgaughey"))
(constraint (= (f "Cruz Latimore") "Latimore"))
(constraint (= (f "Maryann Casler") "Casler"))
(constraint (= (f "Annalisa Gregori") "Gregori"))
(constraint (= (f "Jenee Pannell") "Pannell"))
(check-synth)
