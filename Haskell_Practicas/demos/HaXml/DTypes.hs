{- Generated by DrIFT (Automatic class derivations for Haskell) -}
{-# LINE 1 "DTypes.hs" #-}
module DTypes where

import Text.XML.HaXml.Haskell2XmlNew hiding (Name)

-- data types for a simple test program

data Person = Person Name Email [Rating] Version {-! derive :Haskell2XmlNew !-}

newtype Name = Name String {-! derive :Haskell2XmlNew !-}
newtype Email = Email String {-! derive :Haskell2XmlNew !-}
newtype Version = Version Int {-! derive :Haskell2XmlNew !-}

data Rating = Rating SubjectID Interest Skill {-! derive :Haskell2XmlNew !-}

newtype SubjectID = SubjectID Int {-! derive :Haskell2XmlNew !-}
newtype Interest = Interest Score {-! derive :Haskell2XmlNew !-}
newtype Skill = Skill Score {-! derive :Haskell2XmlNew !-}

data Score = ScoreNone | ScoreLow | ScoreMedium | ScoreHigh {-! derive :Haskell2XmlNew !-}

{-* Generated by DrIFT : Look, but Don't Touch. *-}
instance Haskell2XmlNew Person where
    toHType v =
	Defined "Person" []
		[Constr "Person" [] [toHType aa,toHType ab,toHType ac,toHType ad]]
      where
	(Person aa ab ac ad) = v
    parseContents = do
	{ e@(Elem t _ _) <- element  ["Person"]
	; case t of
	  _ | "Person" `isPrefixOf` t -> interior e $
		do { aa <- parseContents
		   ; ab <- parseContents
		   ; ac <- parseContents
		   ; ad <- parseContents
		   ; return (Person aa ab ac ad)
		   }
	}
    toContents v@(Person aa ab ac ad) =
	[mkElemC (showConstr 0 (toHType v)) (concat [toContents aa,
						     toContents ab,toContents ac,toContents ad])]

instance Haskell2XmlNew Name where
    toHType v =
	Defined "Name" [] [Constr "Name" [] [toHType aa]]
      where
	(Name aa) = v
    parseContents = do
	{ e@(Elem t _ _) <- element  ["Name"]
	; case t of
	  _ | "Name" `isPrefixOf` t -> interior e $ fmap Name parseContents
	}
    toContents v@(Name aa) =
	[mkElemC (showConstr 0 (toHType v)) (toContents aa)]

instance Haskell2XmlNew Email where
    toHType v =
	Defined "Email" [] [Constr "Email" [] [toHType aa]]
      where
	(Email aa) = v
    parseContents = do
	{ e@(Elem t _ _) <- element  ["Email"]
	; case t of
	  _ | "Email" `isPrefixOf` t -> interior e $ fmap Email parseContents
	}
    toContents v@(Email aa) =
	[mkElemC (showConstr 0 (toHType v)) (toContents aa)]

instance Haskell2XmlNew Version where
    toHType v =
	Defined "Version" [] [Constr "Version" [] [toHType aa]]
      where
	(Version aa) = v
    parseContents = do
	{ e@(Elem t _ _) <- element  ["Version"]
	; case t of
	  _ | "Version" `isPrefixOf` t -> interior e $ fmap Version parseContents
	}
    toContents v@(Version aa) =
	[mkElemC (showConstr 0 (toHType v)) (toContents aa)]

instance Haskell2XmlNew Rating where
    toHType v =
	Defined "Rating" []
		[Constr "Rating" [] [toHType aa,toHType ab,toHType ac]]
      where
	(Rating aa ab ac) = v
    parseContents = do
	{ e@(Elem t _ _) <- element  ["Rating"]
	; case t of
	  _ | "Rating" `isPrefixOf` t -> interior e $
		do { aa <- parseContents
		   ; ab <- parseContents
		   ; ac <- parseContents
		   ; return (Rating aa ab ac)
		   }
	}
    toContents v@(Rating aa ab ac) =
	[mkElemC (showConstr 0 (toHType v)) (concat [toContents aa,
						     toContents ab,toContents ac])]

instance Haskell2XmlNew SubjectID where
    toHType v =
	Defined "SubjectID" [] [Constr "SubjectID" [] [toHType aa]]
      where
	(SubjectID aa) = v
    parseContents = do
	{ e@(Elem t _ _) <- element  ["SubjectID"]
	; case t of
	  _ | "SubjectID" `isPrefixOf` t -> interior e $ fmap SubjectID parseContents
	}
    toContents v@(SubjectID aa) =
	[mkElemC (showConstr 0 (toHType v)) (toContents aa)]

instance Haskell2XmlNew Interest where
    toHType v =
	Defined "Interest" [] [Constr "Interest" [] [toHType aa]]
      where
	(Interest aa) = v
    parseContents = do
	{ e@(Elem t _ _) <- element  ["Interest"]
	; case t of
	  _ | "Interest" `isPrefixOf` t -> interior e $ fmap Interest parseContents
	}
    toContents v@(Interest aa) =
	[mkElemC (showConstr 0 (toHType v)) (toContents aa)]

instance Haskell2XmlNew Skill where
    toHType v =
	Defined "Skill" [] [Constr "Skill" [] [toHType aa]]
      where
	(Skill aa) = v
    parseContents = do
	{ e@(Elem t _ _) <- element  ["Skill"]
	; case t of
	  _ | "Skill" `isPrefixOf` t -> interior e $ fmap Skill parseContents
	}
    toContents v@(Skill aa) =
	[mkElemC (showConstr 0 (toHType v)) (toContents aa)]

instance Haskell2XmlNew Score where
    toHType v =
	Defined "Score" []
		[Constr "ScoreNone" [] [],Constr "ScoreLow" [] [],
		 Constr "ScoreMedium" [] [],Constr "ScoreHigh" [] []]
    parseContents = do
	{ e@(Elem t _ _) <- element  ["ScoreNone","ScoreLow","ScoreMedium","ScoreHigh"]
	; case t of
	  _ | "ScoreNone" `isPrefixOf` t -> interior e $ return ScoreNone
	    | "ScoreMedium" `isPrefixOf` t -> interior e $ return ScoreMedium
	    | "ScoreLow" `isPrefixOf` t -> interior e $ return ScoreLow
	    | "ScoreHigh" `isPrefixOf` t -> interior e $ return ScoreHigh
	}
    toContents v@ScoreNone =
	[mkElemC (showConstr 0 (toHType v)) []]
    toContents v@ScoreLow =
	[mkElemC (showConstr 1 (toHType v)) []]
    toContents v@ScoreMedium =
	[mkElemC (showConstr 2 (toHType v)) []]
    toContents v@ScoreHigh =
	[mkElemC (showConstr 3 (toHType v)) []]

--  Imported from other files :-