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
(synth-fun f ((firstname String) (lastname String)) String
( (Start String (ntString))
 (ntString String (
	firstname lastname " " 
	(func0 ntString ntString ntString ntString ntString)
	(func2 ntString ntInt)
	(func3 ntString ntString ntInt)
	(func4 ntString ntString)
	(func5 ntString ntString ntString ntInt)
	(func8 ntString ntInt ntString ntInt)
	(func9 ntString ntInt ntString ntString ntInt)
	(func11 ntString ntInt ntInt ntString ntInt)
	(func13 ntString ntInt ntInt ntInt)
	(func17 ntString ntInt ntInt)
	(func18 ntString ntInt ntInt ntString)
	(func20 ntString ntInt ntInt)
	(func26 ntString ntInt ntString ntString)
	(func29 ntString ntInt ntInt ntString)
	(func30 ntString ntInt ntString)
	(func35 ntString ntString ntString)
	(func37 ntString ntString ntString ntString ntString)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 
	(func31 ntString ntString)
	(func32 ntString ntString)
	(func34 ntInt ntString ntString ntInt)
	(func38 ntInt ntString)
	(func39 ntString)
	(func40 ntInt)
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
(constraint (= (f "Launa" "Withers") "Withers Launa"))
(constraint (= (f "Launa" "Withers") "Withers Launa"))
(constraint (= (f "Launa" "Withers") "Withers Launa"))
(constraint (= (f "Lakenya" "Edison") "Edison Lakenya"))
(constraint (= (f "Lakenya" "Edison") "Edison Lakenya"))
(constraint (= (f "Lakenya" "Edison") "Edison Lakenya"))
(constraint (= (f "Brendan" "Hage") "Hage Brendan"))
(constraint (= (f "Brendan" "Hage") "Hage Brendan"))
(constraint (= (f "Brendan" "Hage") "Hage Brendan"))
(constraint (= (f "Bradford" "Lango") "Lango Bradford"))
(constraint (= (f "Bradford" "Lango") "Lango Bradford"))
(constraint (= (f "Bradford" "Lango") "Lango Bradford"))
(constraint (= (f "Rudolf" "Akiyama") "Akiyama Rudolf"))
(constraint (= (f "Rudolf" "Akiyama") "Akiyama Rudolf"))
(constraint (= (f "Rudolf" "Akiyama") "Akiyama Rudolf"))
(constraint (= (f "Lara" "Constable") "Constable Lara"))
(constraint (= (f "Lara" "Constable") "Constable Lara"))
(constraint (= (f "Lara" "Constable") "Constable Lara"))
(constraint (= (f "Madelaine" "Ghoston") "Ghoston Madelaine"))
(constraint (= (f "Madelaine" "Ghoston") "Ghoston Madelaine"))
(constraint (= (f "Madelaine" "Ghoston") "Ghoston Madelaine"))
(constraint (= (f "Salley" "Hornak") "Hornak Salley"))
(constraint (= (f "Salley" "Hornak") "Hornak Salley"))
(constraint (= (f "Salley" "Hornak") "Hornak Salley"))
(constraint (= (f "Micha" "Junkin") "Junkin Micha"))
(constraint (= (f "Micha" "Junkin") "Junkin Micha"))
(constraint (= (f "Micha" "Junkin") "Junkin Micha"))
(constraint (= (f "Teddy" "Bobo") "Bobo Teddy"))
(constraint (= (f "Teddy" "Bobo") "Bobo Teddy"))
(constraint (= (f "Teddy" "Bobo") "Bobo Teddy"))
(constraint (= (f "Coralee" "Scalia") "Scalia Coralee"))
(constraint (= (f "Coralee" "Scalia") "Scalia Coralee"))
(constraint (= (f "Coralee" "Scalia") "Scalia Coralee"))
(constraint (= (f "Jeff" "Quashie") "Quashie Jeff"))
(constraint (= (f "Jeff" "Quashie") "Quashie Jeff"))
(constraint (= (f "Jeff" "Quashie") "Quashie Jeff"))
(constraint (= (f "Vena" "Babiarz") "Babiarz Vena"))
(constraint (= (f "Vena" "Babiarz") "Babiarz Vena"))
(constraint (= (f "Vena" "Babiarz") "Babiarz Vena"))
(constraint (= (f "Karrie" "Lain") "Lain Karrie"))
(constraint (= (f "Karrie" "Lain") "Lain Karrie"))
(constraint (= (f "Karrie" "Lain") "Lain Karrie"))
(constraint (= (f "Tobias" "Dermody") "Dermody Tobias"))
(constraint (= (f "Tobias" "Dermody") "Dermody Tobias"))
(constraint (= (f "Tobias" "Dermody") "Dermody Tobias"))
(constraint (= (f "Celsa" "Hopkins") "Hopkins Celsa"))
(constraint (= (f "Celsa" "Hopkins") "Hopkins Celsa"))
(constraint (= (f "Celsa" "Hopkins") "Hopkins Celsa"))
(constraint (= (f "Kimberley" "Halpern") "Halpern Kimberley"))
(constraint (= (f "Kimberley" "Halpern") "Halpern Kimberley"))
(constraint (= (f "Kimberley" "Halpern") "Halpern Kimberley"))
(constraint (= (f "Phillip" "Rowden") "Rowden Phillip"))
(constraint (= (f "Phillip" "Rowden") "Rowden Phillip"))
(constraint (= (f "Phillip" "Rowden") "Rowden Phillip"))
(constraint (= (f "Elias" "Neil") "Neil Elias"))
(constraint (= (f "Elias" "Neil") "Neil Elias"))
(constraint (= (f "Elias" "Neil") "Neil Elias"))
(constraint (= (f "Lashanda" "Cortes") "Cortes Lashanda"))
(constraint (= (f "Lashanda" "Cortes") "Cortes Lashanda"))
(constraint (= (f "Lashanda" "Cortes") "Cortes Lashanda"))
(constraint (= (f "Mackenzie" "Spell") "Spell Mackenzie"))
(constraint (= (f "Mackenzie" "Spell") "Spell Mackenzie"))
(constraint (= (f "Mackenzie" "Spell") "Spell Mackenzie"))
(constraint (= (f "Kathlyn" "Eccleston") "Eccleston Kathlyn"))
(constraint (= (f "Kathlyn" "Eccleston") "Eccleston Kathlyn"))
(constraint (= (f "Kathlyn" "Eccleston") "Eccleston Kathlyn"))
(constraint (= (f "Georgina" "Brescia") "Brescia Georgina"))
(constraint (= (f "Georgina" "Brescia") "Brescia Georgina"))
(constraint (= (f "Georgina" "Brescia") "Brescia Georgina"))
(constraint (= (f "Beata" "Miah") "Miah Beata"))
(constraint (= (f "Beata" "Miah") "Miah Beata"))
(constraint (= (f "Beata" "Miah") "Miah Beata"))
(constraint (= (f "Desiree" "Seamons") "Seamons Desiree"))
(constraint (= (f "Desiree" "Seamons") "Seamons Desiree"))
(constraint (= (f "Desiree" "Seamons") "Seamons Desiree"))
(constraint (= (f "Jeanice" "Soderstrom") "Soderstrom Jeanice"))
(constraint (= (f "Jeanice" "Soderstrom") "Soderstrom Jeanice"))
(constraint (= (f "Jeanice" "Soderstrom") "Soderstrom Jeanice"))
(constraint (= (f "Mariel" "Jurgens") "Jurgens Mariel"))
(constraint (= (f "Mariel" "Jurgens") "Jurgens Mariel"))
(constraint (= (f "Mariel" "Jurgens") "Jurgens Mariel"))
(constraint (= (f "Alida" "Bogle") "Bogle Alida"))
(constraint (= (f "Alida" "Bogle") "Bogle Alida"))
(constraint (= (f "Alida" "Bogle") "Bogle Alida"))
(constraint (= (f "Jacqualine" "Olague") "Olague Jacqualine"))
(constraint (= (f "Jacqualine" "Olague") "Olague Jacqualine"))
(constraint (= (f "Jacqualine" "Olague") "Olague Jacqualine"))
(constraint (= (f "Joaquin" "Clasen") "Clasen Joaquin"))
(constraint (= (f "Joaquin" "Clasen") "Clasen Joaquin"))
(constraint (= (f "Joaquin" "Clasen") "Clasen Joaquin"))
(constraint (= (f "Samuel" "Richert") "Richert Samuel"))
(constraint (= (f "Samuel" "Richert") "Richert Samuel"))
(constraint (= (f "Samuel" "Richert") "Richert Samuel"))
(constraint (= (f "Malissa" "Marcus") "Marcus Malissa"))
(constraint (= (f "Malissa" "Marcus") "Marcus Malissa"))
(constraint (= (f "Malissa" "Marcus") "Marcus Malissa"))
(constraint (= (f "Alaina" "Partida") "Partida Alaina"))
(constraint (= (f "Alaina" "Partida") "Partida Alaina"))
(constraint (= (f "Alaina" "Partida") "Partida Alaina"))
(constraint (= (f "Trinidad" "Mulloy") "Mulloy Trinidad"))
(constraint (= (f "Trinidad" "Mulloy") "Mulloy Trinidad"))
(constraint (= (f "Trinidad" "Mulloy") "Mulloy Trinidad"))
(constraint (= (f "Carlene" "Garrard") "Garrard Carlene"))
(constraint (= (f "Carlene" "Garrard") "Garrard Carlene"))
(constraint (= (f "Carlene" "Garrard") "Garrard Carlene"))
(constraint (= (f "Melodi" "Chism") "Chism Melodi"))
(constraint (= (f "Melodi" "Chism") "Chism Melodi"))
(constraint (= (f "Melodi" "Chism") "Chism Melodi"))
(constraint (= (f "Bess" "Chilcott") "Chilcott Bess"))
(constraint (= (f "Bess" "Chilcott") "Chilcott Bess"))
(constraint (= (f "Bess" "Chilcott") "Chilcott Bess"))
(constraint (= (f "Chong" "Aylward") "Aylward Chong"))
(constraint (= (f "Chong" "Aylward") "Aylward Chong"))
(constraint (= (f "Chong" "Aylward") "Aylward Chong"))
(constraint (= (f "Jani" "Ramthun") "Ramthun Jani"))
(constraint (= (f "Jani" "Ramthun") "Ramthun Jani"))
(constraint (= (f "Jani" "Ramthun") "Ramthun Jani"))
(constraint (= (f "Jacquiline" "Heintz") "Heintz Jacquiline"))
(constraint (= (f "Jacquiline" "Heintz") "Heintz Jacquiline"))
(constraint (= (f "Jacquiline" "Heintz") "Heintz Jacquiline"))
(constraint (= (f "Hayley" "Marquess") "Marquess Hayley"))
(constraint (= (f "Hayley" "Marquess") "Marquess Hayley"))
(constraint (= (f "Hayley" "Marquess") "Marquess Hayley"))
(constraint (= (f "Andria" "Spagnoli") "Spagnoli Andria"))
(constraint (= (f "Andria" "Spagnoli") "Spagnoli Andria"))
(constraint (= (f "Andria" "Spagnoli") "Spagnoli Andria"))
(constraint (= (f "Irwin" "Covelli") "Covelli Irwin"))
(constraint (= (f "Irwin" "Covelli") "Covelli Irwin"))
(constraint (= (f "Irwin" "Covelli") "Covelli Irwin"))
(constraint (= (f "Gertude" "Montiel") "Montiel Gertude"))
(constraint (= (f "Gertude" "Montiel") "Montiel Gertude"))
(constraint (= (f "Gertude" "Montiel") "Montiel Gertude"))
(constraint (= (f "Stefany" "Reily") "Reily Stefany"))
(constraint (= (f "Stefany" "Reily") "Reily Stefany"))
(constraint (= (f "Stefany" "Reily") "Reily Stefany"))
(constraint (= (f "Rae" "Mcgaughey") "Mcgaughey Rae"))
(constraint (= (f "Rae" "Mcgaughey") "Mcgaughey Rae"))
(constraint (= (f "Rae" "Mcgaughey") "Mcgaughey Rae"))
(constraint (= (f "Cruz" "Latimore") "Latimore Cruz"))
(constraint (= (f "Cruz" "Latimore") "Latimore Cruz"))
(constraint (= (f "Cruz" "Latimore") "Latimore Cruz"))
(constraint (= (f "Maryann" "Casler") "Casler Maryann"))
(constraint (= (f "Maryann" "Casler") "Casler Maryann"))
(constraint (= (f "Maryann" "Casler") "Casler Maryann"))
(constraint (= (f "Annalisa" "Gregori") "Gregori Annalisa"))
(constraint (= (f "Annalisa" "Gregori") "Gregori Annalisa"))
(constraint (= (f "Annalisa" "Gregori") "Gregori Annalisa"))
(constraint (= (f "Jenee" "Pannell") "Pannell Jenee"))
(constraint (= (f "Jenee" "Pannell") "Pannell Jenee"))
(constraint (= (f "Jenee" "Pannell") "Pannell Jenee"))
(constraint (= (f "Launa" "Withers") "Withers Launa"))
(constraint (= (f "Lakenya" "Edison") "Edison Lakenya"))
(constraint (= (f "Brendan" "Hage") "Hage Brendan"))
(constraint (= (f "Bradford" "Lango") "Lango Bradford"))
(constraint (= (f "Rudolf" "Akiyama") "Akiyama Rudolf"))
(constraint (= (f "Lara" "Constable") "Constable Lara"))
(constraint (= (f "Madelaine" "Ghoston") "Ghoston Madelaine"))
(constraint (= (f "Salley" "Hornak") "Hornak Salley"))
(constraint (= (f "Micha" "Junkin") "Junkin Micha"))
(constraint (= (f "Teddy" "Bobo") "Bobo Teddy"))
(constraint (= (f "Coralee" "Scalia") "Scalia Coralee"))
(constraint (= (f "Jeff" "Quashie") "Quashie Jeff"))
(constraint (= (f "Vena" "Babiarz") "Babiarz Vena"))
(constraint (= (f "Karrie" "Lain") "Lain Karrie"))
(constraint (= (f "Tobias" "Dermody") "Dermody Tobias"))
(constraint (= (f "Celsa" "Hopkins") "Hopkins Celsa"))
(constraint (= (f "Kimberley" "Halpern") "Halpern Kimberley"))
(constraint (= (f "Phillip" "Rowden") "Rowden Phillip"))
(constraint (= (f "Elias" "Neil") "Neil Elias"))
(constraint (= (f "Lashanda" "Cortes") "Cortes Lashanda"))
(constraint (= (f "Mackenzie" "Spell") "Spell Mackenzie"))
(constraint (= (f "Kathlyn" "Eccleston") "Eccleston Kathlyn"))
(constraint (= (f "Georgina" "Brescia") "Brescia Georgina"))
(constraint (= (f "Beata" "Miah") "Miah Beata"))
(constraint (= (f "Desiree" "Seamons") "Seamons Desiree"))
(constraint (= (f "Jeanice" "Soderstrom") "Soderstrom Jeanice"))
(constraint (= (f "Mariel" "Jurgens") "Jurgens Mariel"))
(constraint (= (f "Alida" "Bogle") "Bogle Alida"))
(constraint (= (f "Jacqualine" "Olague") "Olague Jacqualine"))
(constraint (= (f "Joaquin" "Clasen") "Clasen Joaquin"))
(constraint (= (f "Samuel" "Richert") "Richert Samuel"))
(constraint (= (f "Malissa" "Marcus") "Marcus Malissa"))
(constraint (= (f "Alaina" "Partida") "Partida Alaina"))
(constraint (= (f "Trinidad" "Mulloy") "Mulloy Trinidad"))
(constraint (= (f "Carlene" "Garrard") "Garrard Carlene"))
(constraint (= (f "Melodi" "Chism") "Chism Melodi"))
(constraint (= (f "Bess" "Chilcott") "Chilcott Bess"))
(constraint (= (f "Chong" "Aylward") "Aylward Chong"))
(constraint (= (f "Jani" "Ramthun") "Ramthun Jani"))
(constraint (= (f "Jacquiline" "Heintz") "Heintz Jacquiline"))
(constraint (= (f "Hayley" "Marquess") "Marquess Hayley"))
(constraint (= (f "Andria" "Spagnoli") "Spagnoli Andria"))
(constraint (= (f "Irwin" "Covelli") "Covelli Irwin"))
(constraint (= (f "Gertude" "Montiel") "Montiel Gertude"))
(constraint (= (f "Stefany" "Reily") "Reily Stefany"))
(constraint (= (f "Rae" "Mcgaughey") "Mcgaughey Rae"))
(constraint (= (f "Cruz" "Latimore") "Latimore Cruz"))
(constraint (= (f "Maryann" "Casler") "Casler Maryann"))
(constraint (= (f "Annalisa" "Gregori") "Gregori Annalisa"))
(constraint (= (f "Jenee" "Pannell") "Pannell Jenee"))
(check-synth)
