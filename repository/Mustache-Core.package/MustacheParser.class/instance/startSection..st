reading
startSection: aSectionClass
	| section |
	section := aSectionClass selector: self readToken.
	self addPart: section. 
	stack push: section	