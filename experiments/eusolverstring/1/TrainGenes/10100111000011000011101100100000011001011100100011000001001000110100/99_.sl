(set-logic SLIA)
(define-fun func0  ((A String) (B String) (C String) (D String) (E String) ) String (str.replace (str.replace C  D  E ) A  B ))
(define-fun func1  ((A String) (B Int) ) String (str.substr A  0  B ))
(define-fun func2  ((A String) (B String) (C Int) ) String (str.substr A  0  (str.indexof A  B  C )))
(define-fun func3  ((A String) (B String) (C String) (D Int) ) String (str.substr A  0  (str.indexof B  C  D )))
(define-fun func4  ((A String) ) String (str.substr A  0  3 ))
(define-fun func5  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  (+ 1  (str.indexof A  C  D )) B ))
(define-fun func6  ((A String) (B Int) (C String) ) String (str.substr A  (+ 1  (str.indexof A  C  0 )) B ))
(define-fun func7  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  (+ 1  (str.indexof C  D  E )) B ))
(define-fun func8  ((A String) (B Int) (C String) (D String) ) String (str.substr A  (+ 1  (str.indexof C  D  0 )) B ))
(define-fun func9  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 1  C ) B ))
(define-fun func10  ((A String) (B Int) ) String (str.substr A  (+ 3  5 ) B ))
(define-fun func11  ((A String) (B Int) (C Int) ) String (str.substr A  (+ 3  C ) B ))
(define-fun func12  ((A String) (B Int) (C Int) (D String) (E Int) ) String (str.substr A  (+ C  (str.indexof A  D  E )) B ))
(define-fun func13  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ C  (str.indexof A  D  0 )) B ))
(define-fun func14  ((A String) (B Int) (C Int) (D String) (E String) (F Int) ) String (str.substr A  (+ C  (str.indexof D  E  F )) B ))
(define-fun func15  ((A String) (B Int) (C Int) (D String) (E String) ) String (str.substr A  (+ C  (str.indexof D  E  0 )) B ))
(define-fun func16  ((A String) (B Int) (C Int) ) String (str.substr A  (+ C  5 ) B ))
(define-fun func17  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (+ C  D ) B ))
(define-fun func18  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) (str.len A )))
(define-fun func19  ((A String) (B Int) (C Int) ) String (str.substr A  (+ B  C ) 3 ))
(define-fun func20  ((A String) (B Int) ) String (str.substr A  3  B ))
(define-fun func21  ((A String) (B Int) (C Int) ) String (str.substr A  (- (str.len A ) C ) B ))
(define-fun func22  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (- (str.len D ) C ) B ))
(define-fun func23  ((A String) (B Int) (C String) ) String (str.substr A  (- (str.len C ) 3 ) B ))
(define-fun func24  ((A String) (B Int) (C Int) ) String (str.substr A  (- C  3 ) B ))
(define-fun func25  ((A String) (B Int) (C Int) (D Int) ) String (str.substr A  (- C  D ) B ))
(define-fun func26  ((A String) (B Int) (C Int) ) String (str.substr A  (- B  C ) 3 ))
(define-fun func27  ((A String) (B Int) (C String) (D Int) ) String (str.substr A  B  (str.indexof A  C  D )))
(define-fun func28  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.indexof A  C  1 )))
(define-fun func29  ((A String) (B Int) (C String) (D String) (E Int) ) String (str.substr A  B  (str.indexof C  D  E )))
(define-fun func30  ((A String) (B Int) (C String) (D String) ) String (str.substr A  B  (str.indexof C  D  1 )))
(define-fun func31  ((A String) (B Int) ) String (str.substr A  B  (str.len A )))
(define-fun func32  ((A String) (B Int) ) String (str.substr A  B  3 ))
(define-fun func33  ((A String) (B Int) (C Int) (D String) ) String (str.substr A  (+ B  C ) (str.len D )))
(define-fun func34  ((A String) (B Int) (C String) ) String (str.substr A  B  (str.len C )))
(define-fun func35  ((A String) (B String) ) Int (str.indexof A  B  1 ))
(define-fun func36  ((A String) (B String) ) Int (str.indexof A  B  0 ))
(define-fun func37  ((A String) (B String) (C String) ) String (str.++ A  (str.++ B  C )))
(define-fun func38  ((A String) (B String) (C String) (D String) (E Int) ) String (str.++ A  (str.++ B  (str.++ (str.at D  E ) C ))))
(define-fun func39  ((A String) (B String) (C String) (D String) ) String (str.++ A  (str.++ B  (str.++ C  D ))))
(define-fun func40  ((A String) (B String) (C String) (D Int) ) String (str.++ A  (str.++ (str.at C  D ) B )))
(define-fun func41  ((A String) (B String) (C Int) ) String (str.++ (str.at B  C ) A ))
(define-fun func42  ((A String) (B String) ) String (str.++ (str.at B  0 ) A ))
(define-fun func43  ((A String) (B Int) (C String) (D String) (E String) ) String (str.++ (str.at A  B ) (str.++ C  (str.++ D  E ))))
(define-fun func44  ((A String) (B Int) (C String) (D String) ) String (str.++ (str.at A  B ) (str.++ C  D )))
(define-fun func45  ((A String) ) String (str.at A  0 ))
(define-fun func46  ((A String) (B String) ) Int (+ 1  (str.indexof A  B  0 )))
(define-fun func48  ((A Int) (B String) (C String) ) Int (+ A  (str.indexof B  C  0 )))
(define-fun func49  ((A Int) ) Int (+ A  5 ))
(define-fun func50  ((A Int) (B String) ) Int (- (str.len B ) A ))
(define-fun func51  ((A String) ) Int (- (str.len A ) 3 ))
(define-fun func52  ((A Int) ) Int (- A  3 ))
(synth-fun f ((firstname String) (lastname String)) String
( (Start String (ntString))
 (ntString String (
	firstname lastname " " "." "," 
	(func0 ntString ntString ntString ntString ntString)
	(func2 ntString ntString ntInt)
	(func5 ntString ntInt ntString ntInt)
	(func6 ntString ntInt ntString)
	(func7 ntString ntInt ntString ntString ntInt)
	(func12 ntString ntInt ntInt ntString ntInt)
	(func13 ntString ntInt ntInt ntString)
	(func18 ntString ntInt ntInt)
	(func19 ntString ntInt ntInt)
	(func20 ntString ntInt)
	(func22 ntString ntInt ntInt ntString)
	(func23 ntString ntInt ntString)
	(func26 ntString ntInt ntInt)
	(func33 ntString ntInt ntInt ntString)
	(func34 ntString ntInt ntString)
	(func39 ntString ntString ntString ntString)
	(func41 ntString ntString ntInt)
	(func42 ntString ntString)
	(func43 ntString ntInt ntString ntString ntString)
	(str.++ ntString ntString)
	(str.replace ntString ntString ntString)
	(str.at ntString ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
))
 (ntInt Int (
	0 1 2 
	(func35 ntString ntString)
	(func49 ntInt)
	(func50 ntInt ntString)
	(- ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
))
 (ntBool Bool (
	true false
	(= ntInt ntInt)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
))
))
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
