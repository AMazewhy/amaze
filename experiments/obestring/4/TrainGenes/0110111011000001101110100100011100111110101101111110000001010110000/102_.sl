(set-logic SLIA)
(define-fun func0  ((A String) (B String) (C String) (D String) (E String) ) String (str.replace (str.replace C  D  E ) A  B ))
(define-fun func1  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func2  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func3  ((A String) (B String) (C Int) ) String (str.++ (str.at B  C ) A ))
(define-fun func4  ((A String) (B String) ) String (str.++ (str.at B  0 ) A ))
(define-fun func5  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  (+ 1  (str.indexof A  C  D )) B ))
(define-fun func6  ((A String) (B Int) (C String) ) String (str.substr A  (+ 1  (str.indexof A  C  0 )) B ))
(define-fun func7  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  (+ 1  (str.indexof C  D  E )) B ))
(define-fun func8  ((A String) (B Int) (C String) (D String) ) String (str.substr A  (+ 1  (str.indexof C  D  0 )) B ))
(define-fun func9  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 1  C ) B ))
(define-fun func10  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (+ C  (str.indexof A  D  E )) B ))
(define-fun func11  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ C  (str.indexof A  D  0 )) B ))
(define-fun func12  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ C  (str.indexof D  E  F )) B ))
(define-fun func13  ((A String) (B Int) (C Int) (D String) (E String) ) String (str.substr A  (+ C  (str.indexof D  E  0 )) B ))
(define-fun func14  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func15  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) 3 ))
(define-fun func16  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) (str.len A )))
(define-fun func17  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (- C  D ) B ))
(define-fun func18  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func19  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func20  ((A String) (B String) ) String (str.substr A  0  (str.indexof A  B  0 )))
(define-fun func21  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func22  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  0 )))
(define-fun func23  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (+ C  D )))
(define-fun func24  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func25  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  0 )))
(define-fun func26  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func27  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  1 )))
(define-fun func28  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  0 )))
(define-fun func29  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  B  (- C  D )))
(define-fun func30  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func31  ((A String) (B Int) ) String (str.substr A  B  (str.len A )))
(define-fun func32  ((A String) (B Int) (C Int) (D String) (E String) ) String (str.substr A  (+ C  (str.indexof D  E  1 )) B ))
(define-fun func33  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ B  C ) (str.len D )))
(define-fun func34  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  1 )))
(define-fun func35  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func36  ((A Int) ) Int (+ -1  A ))
(define-fun func37  ((A String) (B String) (C Int) ) Int (+ 1  (str.indexof A  B  C )))
(define-fun func38  ((A String) (B String) ) Int (+ 1  (str.indexof A  B  0 )))
(define-fun func39  ((A String) (B String) ) Int (+ 1  (str.indexof A  B  1 )))
(define-fun func40  ((A Int) (B Int) (C Int) ) Int (+ A  (+ B  C )))
(define-fun func41  ((A Int) ) Int (+ A  -1 ))
(define-fun func42  ((A Int) (B String) (C String) (D Int) ) Int (+ A  (str.indexof B  C  D )))
(define-fun func43  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  1 )))
(define-fun func44  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  0 )))
(define-fun func45  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func46  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(define-fun func47  ((A Int) (B String) ) Int (- (str.len B ) A ))
(define-fun func48  ((A String) ) Int (- (str.len A ) 3 ))
(define-fun func49  ((A Int) ) Int (- A  3 ))
(define-fun func50  ((A String) ) String (str.at A  0 ))
(synth-fun f ((firstname String) (lastname String)) String
( (Start String (ntString))
 (ntString String (
	firstname lastname " " 
	(func1 ntString ntString ntString)
	(func2 ntString ntString ntString ntString)
	(func4 ntString ntString)
	(func5 ntString ntInt ntString ntInt)
	(func6 ntString ntInt ntString)
	(func8 ntString ntInt ntString ntString)
	(func9 ntString ntInt ntInt)
	(func15 ntString ntInt ntInt)
	(func16 ntString ntInt ntInt)
	(func18 ntString ntInt)
	(func19 ntString ntString ntInt)
	(func20 ntString ntString)
	(func22 ntString ntString ntString)
	(func25 ntString ntInt ntString)
	(func29 ntString ntInt ntInt ntInt)
	(func30 ntString ntInt)
	(func31 ntString ntInt)
	(func34 ntString ntString ntString)
	(func35 ntString ntInt ntString)
	(func50 ntString)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 
	(func36 ntInt)
	(func37 ntString ntString ntInt)
	(func39 ntString ntString)
	(func41 ntInt)
	(func42 ntInt ntString ntString ntInt)
	(func44 ntInt ntString ntString)
	(func45 ntString ntString)
	(func46 ntString ntString)
	(func47 ntInt ntString)
	(func48 ntString)
	(func49 ntInt)
	(- ntInt ntInt)
	(str.to.int ntString)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
))
))
(constraint (= (f "Nancy" "FreeHafer") "Nancy FreeHafer"))
(constraint (= (f "Andrew" "Cencici") "Andrew Cencici"))
(constraint (= (f "Jan" "Kotas") "Jan Kotas"))
(constraint (= (f "Mariya" "Sergienko") "Mariya Sergienko"))
(constraint (= (f "Launa" "Withers") "Launa Withers"))
(constraint (= (f "Launa" "Withers") "Launa Withers"))
(constraint (= (f "Launa" "Withers") "Launa Withers"))
(constraint (= (f "Lakenya" "Edison") "Lakenya Edison"))
(constraint (= (f "Lakenya" "Edison") "Lakenya Edison"))
(constraint (= (f "Lakenya" "Edison") "Lakenya Edison"))
(constraint (= (f "Brendan" "Hage") "Brendan Hage"))
(constraint (= (f "Brendan" "Hage") "Brendan Hage"))
(constraint (= (f "Brendan" "Hage") "Brendan Hage"))
(constraint (= (f "Bradford" "Lango") "Bradford Lango"))
(constraint (= (f "Bradford" "Lango") "Bradford Lango"))
(constraint (= (f "Bradford" "Lango") "Bradford Lango"))
(constraint (= (f "Rudolf" "Akiyama") "Rudolf Akiyama"))
(constraint (= (f "Rudolf" "Akiyama") "Rudolf Akiyama"))
(constraint (= (f "Rudolf" "Akiyama") "Rudolf Akiyama"))
(constraint (= (f "Lara" "Constable") "Lara Constable"))
(constraint (= (f "Lara" "Constable") "Lara Constable"))
(constraint (= (f "Lara" "Constable") "Lara Constable"))
(constraint (= (f "Madelaine" "Ghoston") "Madelaine Ghoston"))
(constraint (= (f "Madelaine" "Ghoston") "Madelaine Ghoston"))
(constraint (= (f "Madelaine" "Ghoston") "Madelaine Ghoston"))
(constraint (= (f "Salley" "Hornak") "Salley Hornak"))
(constraint (= (f "Salley" "Hornak") "Salley Hornak"))
(constraint (= (f "Salley" "Hornak") "Salley Hornak"))
(constraint (= (f "Micha" "Junkin") "Micha Junkin"))
(constraint (= (f "Micha" "Junkin") "Micha Junkin"))
(constraint (= (f "Micha" "Junkin") "Micha Junkin"))
(constraint (= (f "Teddy" "Bobo") "Teddy Bobo"))
(constraint (= (f "Teddy" "Bobo") "Teddy Bobo"))
(constraint (= (f "Teddy" "Bobo") "Teddy Bobo"))
(constraint (= (f "Coralee" "Scalia") "Coralee Scalia"))
(constraint (= (f "Coralee" "Scalia") "Coralee Scalia"))
(constraint (= (f "Coralee" "Scalia") "Coralee Scalia"))
(constraint (= (f "Jeff" "Quashie") "Jeff Quashie"))
(constraint (= (f "Jeff" "Quashie") "Jeff Quashie"))
(constraint (= (f "Jeff" "Quashie") "Jeff Quashie"))
(constraint (= (f "Vena" "Babiarz") "Vena Babiarz"))
(constraint (= (f "Vena" "Babiarz") "Vena Babiarz"))
(constraint (= (f "Vena" "Babiarz") "Vena Babiarz"))
(constraint (= (f "Karrie" "Lain") "Karrie Lain"))
(constraint (= (f "Karrie" "Lain") "Karrie Lain"))
(constraint (= (f "Karrie" "Lain") "Karrie Lain"))
(constraint (= (f "Tobias" "Dermody") "Tobias Dermody"))
(constraint (= (f "Tobias" "Dermody") "Tobias Dermody"))
(constraint (= (f "Tobias" "Dermody") "Tobias Dermody"))
(constraint (= (f "Celsa" "Hopkins") "Celsa Hopkins"))
(constraint (= (f "Celsa" "Hopkins") "Celsa Hopkins"))
(constraint (= (f "Celsa" "Hopkins") "Celsa Hopkins"))
(constraint (= (f "Kimberley" "Halpern") "Kimberley Halpern"))
(constraint (= (f "Kimberley" "Halpern") "Kimberley Halpern"))
(constraint (= (f "Kimberley" "Halpern") "Kimberley Halpern"))
(constraint (= (f "Phillip" "Rowden") "Phillip Rowden"))
(constraint (= (f "Phillip" "Rowden") "Phillip Rowden"))
(constraint (= (f "Phillip" "Rowden") "Phillip Rowden"))
(constraint (= (f "Elias" "Neil") "Elias Neil"))
(constraint (= (f "Elias" "Neil") "Elias Neil"))
(constraint (= (f "Elias" "Neil") "Elias Neil"))
(constraint (= (f "Lashanda" "Cortes") "Lashanda Cortes"))
(constraint (= (f "Lashanda" "Cortes") "Lashanda Cortes"))
(constraint (= (f "Lashanda" "Cortes") "Lashanda Cortes"))
(constraint (= (f "Mackenzie" "Spell") "Mackenzie Spell"))
(constraint (= (f "Mackenzie" "Spell") "Mackenzie Spell"))
(constraint (= (f "Mackenzie" "Spell") "Mackenzie Spell"))
(constraint (= (f "Kathlyn" "Eccleston") "Kathlyn Eccleston"))
(constraint (= (f "Kathlyn" "Eccleston") "Kathlyn Eccleston"))
(constraint (= (f "Kathlyn" "Eccleston") "Kathlyn Eccleston"))
(constraint (= (f "Georgina" "Brescia") "Georgina Brescia"))
(constraint (= (f "Georgina" "Brescia") "Georgina Brescia"))
(constraint (= (f "Georgina" "Brescia") "Georgina Brescia"))
(constraint (= (f "Beata" "Miah") "Beata Miah"))
(constraint (= (f "Beata" "Miah") "Beata Miah"))
(constraint (= (f "Beata" "Miah") "Beata Miah"))
(constraint (= (f "Desiree" "Seamons") "Desiree Seamons"))
(constraint (= (f "Desiree" "Seamons") "Desiree Seamons"))
(constraint (= (f "Desiree" "Seamons") "Desiree Seamons"))
(constraint (= (f "Jeanice" "Soderstrom") "Jeanice Soderstrom"))
(constraint (= (f "Jeanice" "Soderstrom") "Jeanice Soderstrom"))
(constraint (= (f "Jeanice" "Soderstrom") "Jeanice Soderstrom"))
(constraint (= (f "Mariel" "Jurgens") "Mariel Jurgens"))
(constraint (= (f "Mariel" "Jurgens") "Mariel Jurgens"))
(constraint (= (f "Mariel" "Jurgens") "Mariel Jurgens"))
(constraint (= (f "Alida" "Bogle") "Alida Bogle"))
(constraint (= (f "Alida" "Bogle") "Alida Bogle"))
(constraint (= (f "Alida" "Bogle") "Alida Bogle"))
(constraint (= (f "Jacqualine" "Olague") "Jacqualine Olague"))
(constraint (= (f "Jacqualine" "Olague") "Jacqualine Olague"))
(constraint (= (f "Jacqualine" "Olague") "Jacqualine Olague"))
(constraint (= (f "Joaquin" "Clasen") "Joaquin Clasen"))
(constraint (= (f "Joaquin" "Clasen") "Joaquin Clasen"))
(constraint (= (f "Joaquin" "Clasen") "Joaquin Clasen"))
(constraint (= (f "Samuel" "Richert") "Samuel Richert"))
(constraint (= (f "Samuel" "Richert") "Samuel Richert"))
(constraint (= (f "Samuel" "Richert") "Samuel Richert"))
(constraint (= (f "Malissa" "Marcus") "Malissa Marcus"))
(constraint (= (f "Malissa" "Marcus") "Malissa Marcus"))
(constraint (= (f "Malissa" "Marcus") "Malissa Marcus"))
(constraint (= (f "Alaina" "Partida") "Alaina Partida"))
(constraint (= (f "Alaina" "Partida") "Alaina Partida"))
(constraint (= (f "Alaina" "Partida") "Alaina Partida"))
(constraint (= (f "Trinidad" "Mulloy") "Trinidad Mulloy"))
(constraint (= (f "Trinidad" "Mulloy") "Trinidad Mulloy"))
(constraint (= (f "Trinidad" "Mulloy") "Trinidad Mulloy"))
(constraint (= (f "Carlene" "Garrard") "Carlene Garrard"))
(constraint (= (f "Carlene" "Garrard") "Carlene Garrard"))
(constraint (= (f "Carlene" "Garrard") "Carlene Garrard"))
(constraint (= (f "Melodi" "Chism") "Melodi Chism"))
(constraint (= (f "Melodi" "Chism") "Melodi Chism"))
(constraint (= (f "Melodi" "Chism") "Melodi Chism"))
(constraint (= (f "Bess" "Chilcott") "Bess Chilcott"))
(constraint (= (f "Bess" "Chilcott") "Bess Chilcott"))
(constraint (= (f "Bess" "Chilcott") "Bess Chilcott"))
(constraint (= (f "Chong" "Aylward") "Chong Aylward"))
(constraint (= (f "Chong" "Aylward") "Chong Aylward"))
(constraint (= (f "Chong" "Aylward") "Chong Aylward"))
(constraint (= (f "Jani" "Ramthun") "Jani Ramthun"))
(constraint (= (f "Jani" "Ramthun") "Jani Ramthun"))
(constraint (= (f "Jani" "Ramthun") "Jani Ramthun"))
(constraint (= (f "Jacquiline" "Heintz") "Jacquiline Heintz"))
(constraint (= (f "Jacquiline" "Heintz") "Jacquiline Heintz"))
(constraint (= (f "Jacquiline" "Heintz") "Jacquiline Heintz"))
(constraint (= (f "Hayley" "Marquess") "Hayley Marquess"))
(constraint (= (f "Hayley" "Marquess") "Hayley Marquess"))
(constraint (= (f "Hayley" "Marquess") "Hayley Marquess"))
(constraint (= (f "Andria" "Spagnoli") "Andria Spagnoli"))
(constraint (= (f "Andria" "Spagnoli") "Andria Spagnoli"))
(constraint (= (f "Andria" "Spagnoli") "Andria Spagnoli"))
(constraint (= (f "Irwin" "Covelli") "Irwin Covelli"))
(constraint (= (f "Irwin" "Covelli") "Irwin Covelli"))
(constraint (= (f "Irwin" "Covelli") "Irwin Covelli"))
(constraint (= (f "Gertude" "Montiel") "Gertude Montiel"))
(constraint (= (f "Gertude" "Montiel") "Gertude Montiel"))
(constraint (= (f "Gertude" "Montiel") "Gertude Montiel"))
(constraint (= (f "Stefany" "Reily") "Stefany Reily"))
(constraint (= (f "Stefany" "Reily") "Stefany Reily"))
(constraint (= (f "Stefany" "Reily") "Stefany Reily"))
(constraint (= (f "Rae" "Mcgaughey") "Rae Mcgaughey"))
(constraint (= (f "Rae" "Mcgaughey") "Rae Mcgaughey"))
(constraint (= (f "Rae" "Mcgaughey") "Rae Mcgaughey"))
(constraint (= (f "Cruz" "Latimore") "Cruz Latimore"))
(constraint (= (f "Cruz" "Latimore") "Cruz Latimore"))
(constraint (= (f "Cruz" "Latimore") "Cruz Latimore"))
(constraint (= (f "Maryann" "Casler") "Maryann Casler"))
(constraint (= (f "Maryann" "Casler") "Maryann Casler"))
(constraint (= (f "Maryann" "Casler") "Maryann Casler"))
(constraint (= (f "Annalisa" "Gregori") "Annalisa Gregori"))
(constraint (= (f "Annalisa" "Gregori") "Annalisa Gregori"))
(constraint (= (f "Annalisa" "Gregori") "Annalisa Gregori"))
(constraint (= (f "Jenee" "Pannell") "Jenee Pannell"))
(constraint (= (f "Jenee" "Pannell") "Jenee Pannell"))
(constraint (= (f "Jenee" "Pannell") "Jenee Pannell"))
(constraint (= (f "Launa" "Withers") "Launa Withers"))
(constraint (= (f "Lakenya" "Edison") "Lakenya Edison"))
(constraint (= (f "Brendan" "Hage") "Brendan Hage"))
(constraint (= (f "Bradford" "Lango") "Bradford Lango"))
(constraint (= (f "Rudolf" "Akiyama") "Rudolf Akiyama"))
(constraint (= (f "Lara" "Constable") "Lara Constable"))
(constraint (= (f "Madelaine" "Ghoston") "Madelaine Ghoston"))
(constraint (= (f "Salley" "Hornak") "Salley Hornak"))
(constraint (= (f "Micha" "Junkin") "Micha Junkin"))
(constraint (= (f "Teddy" "Bobo") "Teddy Bobo"))
(constraint (= (f "Coralee" "Scalia") "Coralee Scalia"))
(constraint (= (f "Jeff" "Quashie") "Jeff Quashie"))
(constraint (= (f "Vena" "Babiarz") "Vena Babiarz"))
(constraint (= (f "Karrie" "Lain") "Karrie Lain"))
(constraint (= (f "Tobias" "Dermody") "Tobias Dermody"))
(constraint (= (f "Celsa" "Hopkins") "Celsa Hopkins"))
(constraint (= (f "Kimberley" "Halpern") "Kimberley Halpern"))
(constraint (= (f "Phillip" "Rowden") "Phillip Rowden"))
(constraint (= (f "Elias" "Neil") "Elias Neil"))
(constraint (= (f "Lashanda" "Cortes") "Lashanda Cortes"))
(constraint (= (f "Mackenzie" "Spell") "Mackenzie Spell"))
(constraint (= (f "Kathlyn" "Eccleston") "Kathlyn Eccleston"))
(constraint (= (f "Georgina" "Brescia") "Georgina Brescia"))
(constraint (= (f "Beata" "Miah") "Beata Miah"))
(constraint (= (f "Desiree" "Seamons") "Desiree Seamons"))
(constraint (= (f "Jeanice" "Soderstrom") "Jeanice Soderstrom"))
(constraint (= (f "Mariel" "Jurgens") "Mariel Jurgens"))
(constraint (= (f "Alida" "Bogle") "Alida Bogle"))
(constraint (= (f "Jacqualine" "Olague") "Jacqualine Olague"))
(constraint (= (f "Joaquin" "Clasen") "Joaquin Clasen"))
(constraint (= (f "Samuel" "Richert") "Samuel Richert"))
(constraint (= (f "Malissa" "Marcus") "Malissa Marcus"))
(constraint (= (f "Alaina" "Partida") "Alaina Partida"))
(constraint (= (f "Trinidad" "Mulloy") "Trinidad Mulloy"))
(constraint (= (f "Carlene" "Garrard") "Carlene Garrard"))
(constraint (= (f "Melodi" "Chism") "Melodi Chism"))
(constraint (= (f "Bess" "Chilcott") "Bess Chilcott"))
(constraint (= (f "Chong" "Aylward") "Chong Aylward"))
(constraint (= (f "Jani" "Ramthun") "Jani Ramthun"))
(constraint (= (f "Jacquiline" "Heintz") "Jacquiline Heintz"))
(constraint (= (f "Hayley" "Marquess") "Hayley Marquess"))
(constraint (= (f "Andria" "Spagnoli") "Andria Spagnoli"))
(constraint (= (f "Irwin" "Covelli") "Irwin Covelli"))
(constraint (= (f "Gertude" "Montiel") "Gertude Montiel"))
(constraint (= (f "Stefany" "Reily") "Stefany Reily"))
(constraint (= (f "Rae" "Mcgaughey") "Rae Mcgaughey"))
(constraint (= (f "Cruz" "Latimore") "Cruz Latimore"))
(constraint (= (f "Maryann" "Casler") "Maryann Casler"))
(constraint (= (f "Annalisa" "Gregori") "Annalisa Gregori"))
(constraint (= (f "Jenee" "Pannell") "Jenee Pannell"))
(check-synth)
