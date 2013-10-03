reading
readUpToEndUsing: aBlock
	| nextRead |
	nextRead := aBlock.
	[ stream atEnd ] whileFalse: [  
		 nextRead := nextRead value ]