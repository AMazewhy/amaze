(set-logic SLIA)
(define-fun func0  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func1  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func2  ((A String) (B String) ) String (str.substr A  0  (str.indexof A  B  0 )))
(define-fun func3  ((A String) (B String) ) String (str.substr A  0  (str.indexof A  B  1 )))
(define-fun func4  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func5  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  0 )))
(define-fun func6  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  1 )))
(define-fun func7  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  (+ 1  (str.indexof A  C  D )) B ))
(define-fun func8  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  (+ 1  (str.indexof C  D  E )) B ))
(define-fun func9  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 1  C ) B ))
(define-fun func10  ((A String) (B Int) ) String (str.substr A  (+ 3  5 ) B ))
(define-fun func11  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 3  C ) B ))
(define-fun func12  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (+ C  (str.indexof A  D  E )) B ))
(define-fun func13  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ C  (str.indexof D  E  F )) B ))
(define-fun func14  ((A String) (B Int) (C Int) ) String (str.substr A  (+ C  5 ) B ))
(define-fun func15  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func16  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) (str.len A )))
(define-fun func17  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) 3 ))
(define-fun func18  ((A String) (B Int) ) String (str.substr A  3  B ))
(define-fun func19  ((A String) (B Int) (C Int) ) String (str.substr A  (- (str.len A ) C ) B ))
(define-fun func20  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (- (str.len D ) C ) B ))
(define-fun func21  ((A String) (B Int) (C String) ) String (str.substr A  (- (str.len C ) 3 ) B ))
(define-fun func22  ((A String) (B Int) (C Int) ) String (str.substr A  (- C  3 ) B ))
(define-fun func23  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (- C  D ) B ))
(define-fun func24  ((A String) (B Int) (C Int) ) String (str.substr A  (- B  C ) 3 ))
(define-fun func25  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func26  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  0 )))
(define-fun func27  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  1 )))
(define-fun func28  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func29  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  0 )))
(define-fun func30  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  1 )))
(define-fun func31  ((A String) (B Int) ) String (str.substr A  B  (str.len A )))
(define-fun func32  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func33  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ B  C ) (str.len D )))
(define-fun func34  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func35  ((A String) (B String) (C Int) ) Int (+ 1  (str.indexof A  B  C )))
(define-fun func37  ((A Int) (B String) (C String) (D Int) ) Int (+ A  (str.indexof B  C  D )))
(define-fun func38  ((A Int) ) Int (+ A  5 ))
(define-fun func39  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(define-fun func40  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func41  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func42  ((A String) (B String) (C String) (D String) (E Int) ) String (str.++ A  (str.++ B  (str.++ (str.at D  E ) C ))))
(define-fun func43  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func44  ((A String) (B String) (C String) (D Int) ) String (str.++ A  (str.++ (str.at C  D ) B )))
(define-fun func45  ((A String) (B String) (C String) (D String) (E String) ) String (str.++ A  (str.replace B  C  (str.++ D  E ))))
(define-fun func46  ((A String) (B String) (C Int) ) String (str.++ (str.at B  C ) A ))
(define-fun func47  ((A String) (B String) ) String (str.++ (str.at B  0 ) A ))
(define-fun func48  ((A String) (B Int) (C String) (D String) (E String) ) String (str.++ (str.at A  B ) (str.++ C  (str.++ D  E ))))
(define-fun func49  ((A String) (B String) (C String) (D String) ) String (str.replace A  B  (str.++ C  D )))
(define-fun func50  ((A String) (B String) (C String) (D String) (E String) ) String (str.replace (str.replace C  D  E ) A  B ))
(define-fun func51  ((A String) ) String (str.at A  0 ))
(define-fun func52  ((A Int) (B String) ) Int (- (str.len B ) A ))
(define-fun func53  ((A String) ) Int (- (str.len A ) 3 ))
(define-fun func54  ((A Int) ) Int (- A  3 ))
(synth-fun f ((firstname String) (lastname String)) String
( (Start String (ntString))
 (ntString String (
	firstname lastname " " "." 
	(func0 ntString ntInt)
	(func1 ntString ntString ntInt)
	(func2 ntString ntString)
	(func4 ntString ntString ntString ntInt)
	(func7 ntString ntInt ntString ntInt)
	(func8 ntString ntInt ntString ntString ntInt)
	(func13 ntString ntInt ntInt ntString ntString ntInt)
	(func15 ntString ntInt ntInt ntInt)
	(func16 ntString ntInt ntInt)
	(func18 ntString ntInt)
	(func22 ntString ntInt ntInt)
	(func25 ntString ntInt ntString ntInt)
	(func27 ntString ntInt ntString)
	(func28 ntString ntInt ntString ntString ntInt)
	(func29 ntString ntInt ntString ntString)
	(func30 ntString ntInt ntString ntString)
	(func34 ntString ntInt ntString)
	(func42 ntString ntString ntString ntString ntInt)
	(func44 ntString ntString ntString ntInt)
	(func45 ntString ntString ntString ntString ntString)
	(func46 ntString ntString ntInt)
	(func47 ntString ntString)
	(func48 ntString ntInt ntString ntString ntString)
	(func50 ntString ntString ntString ntString ntString)
	(func51 ntString)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 
	(func37 ntInt ntString ntString ntInt)
	(func38 ntInt)
	(func53 ntString)
	(- ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
))
))
(constraint (= (f "Nancy" "FreeHafer") "Nancy F."))
(constraint (= (f "Andrew" "Cencici") "Andrew C."))
(constraint (= (f "Jan" "Kotas") "Jan K."))
(constraint (= (f "Mariya" "Sergienko") "Mariya S."))
(constraint (= (f "Launa" "Withers") "Launa W."))
(constraint (= (f "Launa" "Withers") "Launa W."))
(constraint (= (f "Launa" "Withers") "Launa W."))
(constraint (= (f "Lakenya" "Edison") "Lakenya E."))
(constraint (= (f "Lakenya" "Edison") "Lakenya E."))
(constraint (= (f "Lakenya" "Edison") "Lakenya E."))
(constraint (= (f "Brendan" "Hage") "Brendan H."))
(constraint (= (f "Brendan" "Hage") "Brendan H."))
(constraint (= (f "Brendan" "Hage") "Brendan H."))
(constraint (= (f "Bradford" "Lango") "Bradford L."))
(constraint (= (f "Bradford" "Lango") "Bradford L."))
(constraint (= (f "Bradford" "Lango") "Bradford L."))
(constraint (= (f "Rudolf" "Akiyama") "Rudolf A."))
(constraint (= (f "Rudolf" "Akiyama") "Rudolf A."))
(constraint (= (f "Rudolf" "Akiyama") "Rudolf A."))
(constraint (= (f "Lara" "Constable") "Lara C."))
(constraint (= (f "Lara" "Constable") "Lara C."))
(constraint (= (f "Lara" "Constable") "Lara C."))
(constraint (= (f "Madelaine" "Ghoston") "Madelaine G."))
(constraint (= (f "Madelaine" "Ghoston") "Madelaine G."))
(constraint (= (f "Madelaine" "Ghoston") "Madelaine G."))
(constraint (= (f "Salley" "Hornak") "Salley H."))
(constraint (= (f "Salley" "Hornak") "Salley H."))
(constraint (= (f "Salley" "Hornak") "Salley H."))
(constraint (= (f "Micha" "Junkin") "Micha J."))
(constraint (= (f "Micha" "Junkin") "Micha J."))
(constraint (= (f "Micha" "Junkin") "Micha J."))
(constraint (= (f "Teddy" "Bobo") "Teddy B."))
(constraint (= (f "Teddy" "Bobo") "Teddy B."))
(constraint (= (f "Teddy" "Bobo") "Teddy B."))
(constraint (= (f "Coralee" "Scalia") "Coralee S."))
(constraint (= (f "Coralee" "Scalia") "Coralee S."))
(constraint (= (f "Coralee" "Scalia") "Coralee S."))
(constraint (= (f "Jeff" "Quashie") "Jeff Q."))
(constraint (= (f "Jeff" "Quashie") "Jeff Q."))
(constraint (= (f "Jeff" "Quashie") "Jeff Q."))
(constraint (= (f "Vena" "Babiarz") "Vena B."))
(constraint (= (f "Vena" "Babiarz") "Vena B."))
(constraint (= (f "Vena" "Babiarz") "Vena B."))
(constraint (= (f "Karrie" "Lain") "Karrie L."))
(constraint (= (f "Karrie" "Lain") "Karrie L."))
(constraint (= (f "Karrie" "Lain") "Karrie L."))
(constraint (= (f "Tobias" "Dermody") "Tobias D."))
(constraint (= (f "Tobias" "Dermody") "Tobias D."))
(constraint (= (f "Tobias" "Dermody") "Tobias D."))
(constraint (= (f "Celsa" "Hopkins") "Celsa H."))
(constraint (= (f "Celsa" "Hopkins") "Celsa H."))
(constraint (= (f "Celsa" "Hopkins") "Celsa H."))
(constraint (= (f "Kimberley" "Halpern") "Kimberley H."))
(constraint (= (f "Kimberley" "Halpern") "Kimberley H."))
(constraint (= (f "Kimberley" "Halpern") "Kimberley H."))
(constraint (= (f "Phillip" "Rowden") "Phillip R."))
(constraint (= (f "Phillip" "Rowden") "Phillip R."))
(constraint (= (f "Phillip" "Rowden") "Phillip R."))
(constraint (= (f "Elias" "Neil") "Elias N."))
(constraint (= (f "Elias" "Neil") "Elias N."))
(constraint (= (f "Elias" "Neil") "Elias N."))
(constraint (= (f "Lashanda" "Cortes") "Lashanda C."))
(constraint (= (f "Lashanda" "Cortes") "Lashanda C."))
(constraint (= (f "Lashanda" "Cortes") "Lashanda C."))
(constraint (= (f "Mackenzie" "Spell") "Mackenzie S."))
(constraint (= (f "Mackenzie" "Spell") "Mackenzie S."))
(constraint (= (f "Mackenzie" "Spell") "Mackenzie S."))
(constraint (= (f "Kathlyn" "Eccleston") "Kathlyn E."))
(constraint (= (f "Kathlyn" "Eccleston") "Kathlyn E."))
(constraint (= (f "Kathlyn" "Eccleston") "Kathlyn E."))
(constraint (= (f "Georgina" "Brescia") "Georgina B."))
(constraint (= (f "Georgina" "Brescia") "Georgina B."))
(constraint (= (f "Georgina" "Brescia") "Georgina B."))
(constraint (= (f "Beata" "Miah") "Beata M."))
(constraint (= (f "Beata" "Miah") "Beata M."))
(constraint (= (f "Beata" "Miah") "Beata M."))
(constraint (= (f "Desiree" "Seamons") "Desiree S."))
(constraint (= (f "Desiree" "Seamons") "Desiree S."))
(constraint (= (f "Desiree" "Seamons") "Desiree S."))
(constraint (= (f "Jeanice" "Soderstrom") "Jeanice S."))
(constraint (= (f "Jeanice" "Soderstrom") "Jeanice S."))
(constraint (= (f "Jeanice" "Soderstrom") "Jeanice S."))
(constraint (= (f "Mariel" "Jurgens") "Mariel J."))
(constraint (= (f "Mariel" "Jurgens") "Mariel J."))
(constraint (= (f "Mariel" "Jurgens") "Mariel J."))
(constraint (= (f "Alida" "Bogle") "Alida B."))
(constraint (= (f "Alida" "Bogle") "Alida B."))
(constraint (= (f "Alida" "Bogle") "Alida B."))
(constraint (= (f "Jacqualine" "Olague") "Jacqualine O."))
(constraint (= (f "Jacqualine" "Olague") "Jacqualine O."))
(constraint (= (f "Jacqualine" "Olague") "Jacqualine O."))
(constraint (= (f "Joaquin" "Clasen") "Joaquin C."))
(constraint (= (f "Joaquin" "Clasen") "Joaquin C."))
(constraint (= (f "Joaquin" "Clasen") "Joaquin C."))
(constraint (= (f "Samuel" "Richert") "Samuel R."))
(constraint (= (f "Samuel" "Richert") "Samuel R."))
(constraint (= (f "Samuel" "Richert") "Samuel R."))
(constraint (= (f "Malissa" "Marcus") "Malissa M."))
(constraint (= (f "Malissa" "Marcus") "Malissa M."))
(constraint (= (f "Malissa" "Marcus") "Malissa M."))
(constraint (= (f "Alaina" "Partida") "Alaina P."))
(constraint (= (f "Alaina" "Partida") "Alaina P."))
(constraint (= (f "Alaina" "Partida") "Alaina P."))
(constraint (= (f "Trinidad" "Mulloy") "Trinidad M."))
(constraint (= (f "Trinidad" "Mulloy") "Trinidad M."))
(constraint (= (f "Trinidad" "Mulloy") "Trinidad M."))
(constraint (= (f "Carlene" "Garrard") "Carlene G."))
(constraint (= (f "Carlene" "Garrard") "Carlene G."))
(constraint (= (f "Carlene" "Garrard") "Carlene G."))
(constraint (= (f "Melodi" "Chism") "Melodi C."))
(constraint (= (f "Melodi" "Chism") "Melodi C."))
(constraint (= (f "Melodi" "Chism") "Melodi C."))
(constraint (= (f "Bess" "Chilcott") "Bess C."))
(constraint (= (f "Bess" "Chilcott") "Bess C."))
(constraint (= (f "Bess" "Chilcott") "Bess C."))
(constraint (= (f "Chong" "Aylward") "Chong A."))
(constraint (= (f "Chong" "Aylward") "Chong A."))
(constraint (= (f "Chong" "Aylward") "Chong A."))
(constraint (= (f "Jani" "Ramthun") "Jani R."))
(constraint (= (f "Jani" "Ramthun") "Jani R."))
(constraint (= (f "Jani" "Ramthun") "Jani R."))
(constraint (= (f "Jacquiline" "Heintz") "Jacquiline H."))
(constraint (= (f "Jacquiline" "Heintz") "Jacquiline H."))
(constraint (= (f "Jacquiline" "Heintz") "Jacquiline H."))
(constraint (= (f "Hayley" "Marquess") "Hayley M."))
(constraint (= (f "Hayley" "Marquess") "Hayley M."))
(constraint (= (f "Hayley" "Marquess") "Hayley M."))
(constraint (= (f "Andria" "Spagnoli") "Andria S."))
(constraint (= (f "Andria" "Spagnoli") "Andria S."))
(constraint (= (f "Andria" "Spagnoli") "Andria S."))
(constraint (= (f "Irwin" "Covelli") "Irwin C."))
(constraint (= (f "Irwin" "Covelli") "Irwin C."))
(constraint (= (f "Irwin" "Covelli") "Irwin C."))
(constraint (= (f "Gertude" "Montiel") "Gertude M."))
(constraint (= (f "Gertude" "Montiel") "Gertude M."))
(constraint (= (f "Gertude" "Montiel") "Gertude M."))
(constraint (= (f "Stefany" "Reily") "Stefany R."))
(constraint (= (f "Stefany" "Reily") "Stefany R."))
(constraint (= (f "Stefany" "Reily") "Stefany R."))
(constraint (= (f "Rae" "Mcgaughey") "Rae M."))
(constraint (= (f "Rae" "Mcgaughey") "Rae M."))
(constraint (= (f "Rae" "Mcgaughey") "Rae M."))
(constraint (= (f "Cruz" "Latimore") "Cruz L."))
(constraint (= (f "Cruz" "Latimore") "Cruz L."))
(constraint (= (f "Cruz" "Latimore") "Cruz L."))
(constraint (= (f "Maryann" "Casler") "Maryann C."))
(constraint (= (f "Maryann" "Casler") "Maryann C."))
(constraint (= (f "Maryann" "Casler") "Maryann C."))
(constraint (= (f "Annalisa" "Gregori") "Annalisa G."))
(constraint (= (f "Annalisa" "Gregori") "Annalisa G."))
(constraint (= (f "Annalisa" "Gregori") "Annalisa G."))
(constraint (= (f "Jenee" "Pannell") "Jenee P."))
(constraint (= (f "Jenee" "Pannell") "Jenee P."))
(constraint (= (f "Jenee" "Pannell") "Jenee P."))
(constraint (= (f "Launa" "Withers") "Launa W."))
(constraint (= (f "Lakenya" "Edison") "Lakenya E."))
(constraint (= (f "Brendan" "Hage") "Brendan H."))
(constraint (= (f "Bradford" "Lango") "Bradford L."))
(constraint (= (f "Rudolf" "Akiyama") "Rudolf A."))
(constraint (= (f "Lara" "Constable") "Lara C."))
(constraint (= (f "Madelaine" "Ghoston") "Madelaine G."))
(constraint (= (f "Salley" "Hornak") "Salley H."))
(constraint (= (f "Micha" "Junkin") "Micha J."))
(constraint (= (f "Teddy" "Bobo") "Teddy B."))
(constraint (= (f "Coralee" "Scalia") "Coralee S."))
(constraint (= (f "Jeff" "Quashie") "Jeff Q."))
(constraint (= (f "Vena" "Babiarz") "Vena B."))
(constraint (= (f "Karrie" "Lain") "Karrie L."))
(constraint (= (f "Tobias" "Dermody") "Tobias D."))
(constraint (= (f "Celsa" "Hopkins") "Celsa H."))
(constraint (= (f "Kimberley" "Halpern") "Kimberley H."))
(constraint (= (f "Phillip" "Rowden") "Phillip R."))
(constraint (= (f "Elias" "Neil") "Elias N."))
(constraint (= (f "Lashanda" "Cortes") "Lashanda C."))
(constraint (= (f "Mackenzie" "Spell") "Mackenzie S."))
(constraint (= (f "Kathlyn" "Eccleston") "Kathlyn E."))
(constraint (= (f "Georgina" "Brescia") "Georgina B."))
(constraint (= (f "Beata" "Miah") "Beata M."))
(constraint (= (f "Desiree" "Seamons") "Desiree S."))
(constraint (= (f "Jeanice" "Soderstrom") "Jeanice S."))
(constraint (= (f "Mariel" "Jurgens") "Mariel J."))
(constraint (= (f "Alida" "Bogle") "Alida B."))
(constraint (= (f "Jacqualine" "Olague") "Jacqualine O."))
(constraint (= (f "Joaquin" "Clasen") "Joaquin C."))
(constraint (= (f "Samuel" "Richert") "Samuel R."))
(constraint (= (f "Malissa" "Marcus") "Malissa M."))
(constraint (= (f "Alaina" "Partida") "Alaina P."))
(constraint (= (f "Trinidad" "Mulloy") "Trinidad M."))
(constraint (= (f "Carlene" "Garrard") "Carlene G."))
(constraint (= (f "Melodi" "Chism") "Melodi C."))
(constraint (= (f "Bess" "Chilcott") "Bess C."))
(constraint (= (f "Chong" "Aylward") "Chong A."))
(constraint (= (f "Jani" "Ramthun") "Jani R."))
(constraint (= (f "Jacquiline" "Heintz") "Jacquiline H."))
(constraint (= (f "Hayley" "Marquess") "Hayley M."))
(constraint (= (f "Andria" "Spagnoli") "Andria S."))
(constraint (= (f "Irwin" "Covelli") "Irwin C."))
(constraint (= (f "Gertude" "Montiel") "Gertude M."))
(constraint (= (f "Stefany" "Reily") "Stefany R."))
(constraint (= (f "Rae" "Mcgaughey") "Rae M."))
(constraint (= (f "Cruz" "Latimore") "Cruz L."))
(constraint (= (f "Maryann" "Casler") "Maryann C."))
(constraint (= (f "Annalisa" "Gregori") "Annalisa G."))
(constraint (= (f "Jenee" "Pannell") "Jenee P."))
(check-synth)
