(set-logic SLIA)
(define-fun func0  ((A String) (B String) (C String) (D String) (E String) ) String (str.replace (str.replace C  D  E ) A  B ))
(define-fun func1  ((A String) (B String) (C String) (D String) ) String (str.replace A  B  (str.++ C  D )))
(define-fun func2  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func3  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func4  ((A String) (B String) ) String (str.substr A  0  (str.indexof A  B  0 )))
(define-fun func5  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func6  ((A String) (B String) (C String) ) String (str.substr A  0  (str.indexof B  C  0 )))
(define-fun func7  ((A String) (B Int) ) String (str.substr A  (+ 3  5 ) B ))
(define-fun func8  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 3  C ) B ))
(define-fun func9  ((A String) (B Int) (C Int) ) String (str.substr A  (+ C  5 ) B ))
(define-fun func10  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func11  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) 3 ))
(define-fun func12  ((A String) (B Int) ) String (str.substr A  3  B ))
(define-fun func13  ((A String) (B Int) (C Int) ) String (str.substr A  (- (str.len A ) C ) B ))
(define-fun func14  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (- (str.len D ) C ) B ))
(define-fun func15  ((A String) (B Int) (C String) ) String (str.substr A  (- (str.len C ) 3 ) B ))
(define-fun func16  ((A String) (B Int) (C Int) ) String (str.substr A  (- C  3 ) B ))
(define-fun func17  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (- C  D ) B ))
(define-fun func18  ((A String) (B Int) (C Int) ) String (str.substr A  (- B  C ) 3 ))
(define-fun func19  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func20  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  1 )))
(define-fun func21  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  0 )))
(define-fun func22  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func23  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  1 )))
(define-fun func24  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  0 )))
(define-fun func25  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func26  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func27  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(define-fun func28  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func29  ((A String) (B String) (C String) (D String) (E Int) ) String (str.++ A  (str.++ B  (str.++ (str.at D  E ) C ))))
(define-fun func30  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func31  ((A String) (B String) (C String) (D String) (E String) ) String (str.++ A  (str.replace B  C  (str.++ D  E ))))
(define-fun func32  ((A String) (B String) (C String) (D Int) ) String (str.++ A  (str.++ (str.at C  D ) B )))
(define-fun func33  ((A String) (B String) (C Int) ) String (str.++ (str.at B  C ) A ))
(define-fun func34  ((A String) (B String) ) String (str.++ (str.at B  0 ) A ))
(define-fun func35  ((A String) (B Int) (C String) (D String) ) String (str.++ (str.at A  B ) (str.++ C  D )))
(define-fun func36  ((A String) (B Int) (C String) (D String) (E String) ) String (str.++ (str.at A  B ) (str.++ C  (str.++ D  E ))))
(define-fun func37  ((A String) ) String (str.at A  0 ))
(define-fun func39  ((A Int) ) Int (+ A  5 ))
(define-fun func40  ((A Int) (B String) ) Int (- (str.len B ) A ))
(define-fun func41  ((A String) ) Int (- (str.len A ) 3 ))
(define-fun func42  ((A Int) ) Int (- A  3 ))
(synth-fun f ((firstname String) (lastname String)) String
( (Start String (ntString))
 (ntString String (
	firstname lastname " " "." "," 
	(func0 ntString ntString ntString ntString ntString)
	(func1 ntString ntString ntString ntString)
	(func2 ntString ntInt)
	(func3 ntString ntString ntInt)
	(func4 ntString ntString)
	(func7 ntString ntInt)
	(func8 ntString ntInt ntInt)
	(func9 ntString ntInt ntInt)
	(func11 ntString ntInt ntInt)
	(func13 ntString ntInt ntInt)
	(func16 ntString ntInt ntInt)
	(func17 ntString ntInt ntInt ntInt)
	(func18 ntString ntInt ntInt)
	(func19 ntString ntInt ntString ntInt)
	(func20 ntString ntInt ntString)
	(func22 ntString ntInt ntString ntString ntInt)
	(func24 ntString ntInt ntString ntString)
	(func31 ntString ntString ntString ntString ntString)
	(func32 ntString ntString ntString ntInt)
	(func37 ntString)
	(str.at ntString ntInt)
	(ite ntBool ntString ntString)
))
 (ntInt Int (
	0 1 2 
	(func26 ntString ntString)
	(func27 ntString ntString)
	(func42 ntInt)
	(- ntInt ntInt)
))
 (ntBool Bool (
	true false
	(str.suffixof ntString ntString)
))
))
(constraint (= (f "Launa" "Withers") "Withers, L."))
(constraint (= (f "Launa" "Withers") "Withers, L."))
(constraint (= (f "Launa" "Withers") "Withers, L."))
(constraint (= (f "Lakenya" "Edison") "Edison, L."))
(constraint (= (f "Lakenya" "Edison") "Edison, L."))
(constraint (= (f "Lakenya" "Edison") "Edison, L."))
(constraint (= (f "Brendan" "Hage") "Hage, B."))
(constraint (= (f "Brendan" "Hage") "Hage, B."))
(constraint (= (f "Brendan" "Hage") "Hage, B."))
(constraint (= (f "Bradford" "Lango") "Lango, B."))
(constraint (= (f "Bradford" "Lango") "Lango, B."))
(constraint (= (f "Bradford" "Lango") "Lango, B."))
(constraint (= (f "Rudolf" "Akiyama") "Akiyama, R."))
(constraint (= (f "Rudolf" "Akiyama") "Akiyama, R."))
(constraint (= (f "Rudolf" "Akiyama") "Akiyama, R."))
(constraint (= (f "Lara" "Constable") "Constable, L."))
(constraint (= (f "Lara" "Constable") "Constable, L."))
(constraint (= (f "Lara" "Constable") "Constable, L."))
(constraint (= (f "Madelaine" "Ghoston") "Ghoston, M."))
(constraint (= (f "Madelaine" "Ghoston") "Ghoston, M."))
(constraint (= (f "Madelaine" "Ghoston") "Ghoston, M."))
(constraint (= (f "Salley" "Hornak") "Hornak, S."))
(constraint (= (f "Salley" "Hornak") "Hornak, S."))
(constraint (= (f "Salley" "Hornak") "Hornak, S."))
(constraint (= (f "Micha" "Junkin") "Junkin, M."))
(constraint (= (f "Micha" "Junkin") "Junkin, M."))
(constraint (= (f "Micha" "Junkin") "Junkin, M."))
(constraint (= (f "Teddy" "Bobo") "Bobo, T."))
(constraint (= (f "Teddy" "Bobo") "Bobo, T."))
(constraint (= (f "Teddy" "Bobo") "Bobo, T."))
(constraint (= (f "Coralee" "Scalia") "Scalia, C."))
(constraint (= (f "Coralee" "Scalia") "Scalia, C."))
(constraint (= (f "Coralee" "Scalia") "Scalia, C."))
(constraint (= (f "Jeff" "Quashie") "Quashie, J."))
(constraint (= (f "Jeff" "Quashie") "Quashie, J."))
(constraint (= (f "Jeff" "Quashie") "Quashie, J."))
(constraint (= (f "Vena" "Babiarz") "Babiarz, V."))
(constraint (= (f "Vena" "Babiarz") "Babiarz, V."))
(constraint (= (f "Vena" "Babiarz") "Babiarz, V."))
(constraint (= (f "Karrie" "Lain") "Lain, K."))
(constraint (= (f "Karrie" "Lain") "Lain, K."))
(constraint (= (f "Karrie" "Lain") "Lain, K."))
(constraint (= (f "Tobias" "Dermody") "Dermody, T."))
(constraint (= (f "Tobias" "Dermody") "Dermody, T."))
(constraint (= (f "Tobias" "Dermody") "Dermody, T."))
(constraint (= (f "Celsa" "Hopkins") "Hopkins, C."))
(constraint (= (f "Celsa" "Hopkins") "Hopkins, C."))
(constraint (= (f "Celsa" "Hopkins") "Hopkins, C."))
(constraint (= (f "Kimberley" "Halpern") "Halpern, K."))
(constraint (= (f "Kimberley" "Halpern") "Halpern, K."))
(constraint (= (f "Kimberley" "Halpern") "Halpern, K."))
(constraint (= (f "Phillip" "Rowden") "Rowden, P."))
(constraint (= (f "Phillip" "Rowden") "Rowden, P."))
(constraint (= (f "Phillip" "Rowden") "Rowden, P."))
(constraint (= (f "Elias" "Neil") "Neil, E."))
(constraint (= (f "Elias" "Neil") "Neil, E."))
(constraint (= (f "Elias" "Neil") "Neil, E."))
(constraint (= (f "Lashanda" "Cortes") "Cortes, L."))
(constraint (= (f "Lashanda" "Cortes") "Cortes, L."))
(constraint (= (f "Lashanda" "Cortes") "Cortes, L."))
(constraint (= (f "Mackenzie" "Spell") "Spell, M."))
(constraint (= (f "Mackenzie" "Spell") "Spell, M."))
(constraint (= (f "Mackenzie" "Spell") "Spell, M."))
(constraint (= (f "Kathlyn" "Eccleston") "Eccleston, K."))
(constraint (= (f "Kathlyn" "Eccleston") "Eccleston, K."))
(constraint (= (f "Kathlyn" "Eccleston") "Eccleston, K."))
(constraint (= (f "Georgina" "Brescia") "Brescia, G."))
(constraint (= (f "Georgina" "Brescia") "Brescia, G."))
(constraint (= (f "Georgina" "Brescia") "Brescia, G."))
(constraint (= (f "Beata" "Miah") "Miah, B."))
(constraint (= (f "Beata" "Miah") "Miah, B."))
(constraint (= (f "Beata" "Miah") "Miah, B."))
(constraint (= (f "Desiree" "Seamons") "Seamons, D."))
(constraint (= (f "Desiree" "Seamons") "Seamons, D."))
(constraint (= (f "Desiree" "Seamons") "Seamons, D."))
(constraint (= (f "Jeanice" "Soderstrom") "Soderstrom, J."))
(constraint (= (f "Jeanice" "Soderstrom") "Soderstrom, J."))
(constraint (= (f "Jeanice" "Soderstrom") "Soderstrom, J."))
(constraint (= (f "Mariel" "Jurgens") "Jurgens, M."))
(constraint (= (f "Mariel" "Jurgens") "Jurgens, M."))
(constraint (= (f "Mariel" "Jurgens") "Jurgens, M."))
(constraint (= (f "Alida" "Bogle") "Bogle, A."))
(constraint (= (f "Alida" "Bogle") "Bogle, A."))
(constraint (= (f "Alida" "Bogle") "Bogle, A."))
(constraint (= (f "Jacqualine" "Olague") "Olague, J."))
(constraint (= (f "Jacqualine" "Olague") "Olague, J."))
(constraint (= (f "Jacqualine" "Olague") "Olague, J."))
(constraint (= (f "Joaquin" "Clasen") "Clasen, J."))
(constraint (= (f "Joaquin" "Clasen") "Clasen, J."))
(constraint (= (f "Joaquin" "Clasen") "Clasen, J."))
(constraint (= (f "Samuel" "Richert") "Richert, S."))
(constraint (= (f "Samuel" "Richert") "Richert, S."))
(constraint (= (f "Samuel" "Richert") "Richert, S."))
(constraint (= (f "Malissa" "Marcus") "Marcus, M."))
(constraint (= (f "Malissa" "Marcus") "Marcus, M."))
(constraint (= (f "Malissa" "Marcus") "Marcus, M."))
(constraint (= (f "Alaina" "Partida") "Partida, A."))
(constraint (= (f "Alaina" "Partida") "Partida, A."))
(constraint (= (f "Alaina" "Partida") "Partida, A."))
(constraint (= (f "Trinidad" "Mulloy") "Mulloy, T."))
(constraint (= (f "Trinidad" "Mulloy") "Mulloy, T."))
(constraint (= (f "Trinidad" "Mulloy") "Mulloy, T."))
(constraint (= (f "Carlene" "Garrard") "Garrard, C."))
(constraint (= (f "Carlene" "Garrard") "Garrard, C."))
(constraint (= (f "Carlene" "Garrard") "Garrard, C."))
(constraint (= (f "Melodi" "Chism") "Chism, M."))
(constraint (= (f "Melodi" "Chism") "Chism, M."))
(constraint (= (f "Melodi" "Chism") "Chism, M."))
(constraint (= (f "Bess" "Chilcott") "Chilcott, B."))
(constraint (= (f "Bess" "Chilcott") "Chilcott, B."))
(constraint (= (f "Bess" "Chilcott") "Chilcott, B."))
(constraint (= (f "Chong" "Aylward") "Aylward, C."))
(constraint (= (f "Chong" "Aylward") "Aylward, C."))
(constraint (= (f "Chong" "Aylward") "Aylward, C."))
(constraint (= (f "Jani" "Ramthun") "Ramthun, J."))
(constraint (= (f "Jani" "Ramthun") "Ramthun, J."))
(constraint (= (f "Jani" "Ramthun") "Ramthun, J."))
(constraint (= (f "Jacquiline" "Heintz") "Heintz, J."))
(constraint (= (f "Jacquiline" "Heintz") "Heintz, J."))
(constraint (= (f "Jacquiline" "Heintz") "Heintz, J."))
(constraint (= (f "Hayley" "Marquess") "Marquess, H."))
(constraint (= (f "Hayley" "Marquess") "Marquess, H."))
(constraint (= (f "Hayley" "Marquess") "Marquess, H."))
(constraint (= (f "Andria" "Spagnoli") "Spagnoli, A."))
(constraint (= (f "Andria" "Spagnoli") "Spagnoli, A."))
(constraint (= (f "Andria" "Spagnoli") "Spagnoli, A."))
(constraint (= (f "Irwin" "Covelli") "Covelli, I."))
(constraint (= (f "Irwin" "Covelli") "Covelli, I."))
(constraint (= (f "Irwin" "Covelli") "Covelli, I."))
(constraint (= (f "Gertude" "Montiel") "Montiel, G."))
(constraint (= (f "Gertude" "Montiel") "Montiel, G."))
(constraint (= (f "Gertude" "Montiel") "Montiel, G."))
(constraint (= (f "Stefany" "Reily") "Reily, S."))
(constraint (= (f "Stefany" "Reily") "Reily, S."))
(constraint (= (f "Stefany" "Reily") "Reily, S."))
(constraint (= (f "Rae" "Mcgaughey") "Mcgaughey, R."))
(constraint (= (f "Rae" "Mcgaughey") "Mcgaughey, R."))
(constraint (= (f "Rae" "Mcgaughey") "Mcgaughey, R."))
(constraint (= (f "Cruz" "Latimore") "Latimore, C."))
(constraint (= (f "Cruz" "Latimore") "Latimore, C."))
(constraint (= (f "Cruz" "Latimore") "Latimore, C."))
(constraint (= (f "Maryann" "Casler") "Casler, M."))
(constraint (= (f "Maryann" "Casler") "Casler, M."))
(constraint (= (f "Maryann" "Casler") "Casler, M."))
(constraint (= (f "Annalisa" "Gregori") "Gregori, A."))
(constraint (= (f "Annalisa" "Gregori") "Gregori, A."))
(constraint (= (f "Annalisa" "Gregori") "Gregori, A."))
(constraint (= (f "Jenee" "Pannell") "Pannell, J."))
(constraint (= (f "Jenee" "Pannell") "Pannell, J."))
(constraint (= (f "Jenee" "Pannell") "Pannell, J."))
(constraint (= (f "Launa" "Withers") "Withers, L."))
(constraint (= (f "Lakenya" "Edison") "Edison, L."))
(constraint (= (f "Brendan" "Hage") "Hage, B."))
(constraint (= (f "Bradford" "Lango") "Lango, B."))
(constraint (= (f "Rudolf" "Akiyama") "Akiyama, R."))
(constraint (= (f "Lara" "Constable") "Constable, L."))
(constraint (= (f "Madelaine" "Ghoston") "Ghoston, M."))
(constraint (= (f "Salley" "Hornak") "Hornak, S."))
(constraint (= (f "Micha" "Junkin") "Junkin, M."))
(constraint (= (f "Teddy" "Bobo") "Bobo, T."))
(constraint (= (f "Coralee" "Scalia") "Scalia, C."))
(constraint (= (f "Jeff" "Quashie") "Quashie, J."))
(constraint (= (f "Vena" "Babiarz") "Babiarz, V."))
(constraint (= (f "Karrie" "Lain") "Lain, K."))
(constraint (= (f "Tobias" "Dermody") "Dermody, T."))
(constraint (= (f "Celsa" "Hopkins") "Hopkins, C."))
(constraint (= (f "Kimberley" "Halpern") "Halpern, K."))
(constraint (= (f "Phillip" "Rowden") "Rowden, P."))
(constraint (= (f "Elias" "Neil") "Neil, E."))
(constraint (= (f "Lashanda" "Cortes") "Cortes, L."))
(constraint (= (f "Mackenzie" "Spell") "Spell, M."))
(constraint (= (f "Kathlyn" "Eccleston") "Eccleston, K."))
(constraint (= (f "Georgina" "Brescia") "Brescia, G."))
(constraint (= (f "Beata" "Miah") "Miah, B."))
(constraint (= (f "Desiree" "Seamons") "Seamons, D."))
(constraint (= (f "Jeanice" "Soderstrom") "Soderstrom, J."))
(constraint (= (f "Mariel" "Jurgens") "Jurgens, M."))
(constraint (= (f "Alida" "Bogle") "Bogle, A."))
(constraint (= (f "Jacqualine" "Olague") "Olague, J."))
(constraint (= (f "Joaquin" "Clasen") "Clasen, J."))
(constraint (= (f "Samuel" "Richert") "Richert, S."))
(constraint (= (f "Malissa" "Marcus") "Marcus, M."))
(constraint (= (f "Alaina" "Partida") "Partida, A."))
(constraint (= (f "Trinidad" "Mulloy") "Mulloy, T."))
(constraint (= (f "Carlene" "Garrard") "Garrard, C."))
(constraint (= (f "Melodi" "Chism") "Chism, M."))
(constraint (= (f "Bess" "Chilcott") "Chilcott, B."))
(constraint (= (f "Chong" "Aylward") "Aylward, C."))
(constraint (= (f "Jani" "Ramthun") "Ramthun, J."))
(constraint (= (f "Jacquiline" "Heintz") "Heintz, J."))
(constraint (= (f "Hayley" "Marquess") "Marquess, H."))
(constraint (= (f "Andria" "Spagnoli") "Spagnoli, A."))
(constraint (= (f "Irwin" "Covelli") "Covelli, I."))
(constraint (= (f "Gertude" "Montiel") "Montiel, G."))
(constraint (= (f "Stefany" "Reily") "Reily, S."))
(constraint (= (f "Rae" "Mcgaughey") "Mcgaughey, R."))
(constraint (= (f "Cruz" "Latimore") "Latimore, C."))
(constraint (= (f "Maryann" "Casler") "Casler, M."))
(constraint (= (f "Annalisa" "Gregori") "Gregori, A."))
(constraint (= (f "Jenee" "Pannell") "Pannell, J."))
(check-synth)
