class Growable g where
	grow :: g -> Maybe g
	add :: g -> g -> g

growingSum :: Growable g => g -> g
growingSum g = case grow g of
	Just g' -> g `add` growingSum g'
	_ -> g

instance Growable Int where
	grow n	| n < 100 = Just $ n + 1
		| otherwise = Nothing
	add = (+)
