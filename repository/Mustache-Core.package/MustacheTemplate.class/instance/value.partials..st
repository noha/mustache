resolving
value: anObject partials: aDictionary
	| visitor |
	visitor := MustacheWriteVisitor new
		partials: aDictionary;
		context: anObject.
	self accept: visitor.
	^ visitor string