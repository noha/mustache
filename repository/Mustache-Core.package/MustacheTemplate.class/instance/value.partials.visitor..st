resolving
value: anObject partials: aDictionary visitor: aVisitor
	| visitor |
	visitor := aVisitor
		partials: aDictionary;
		context: anObject.
	self accept: visitor.
	^ visitor string