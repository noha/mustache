resolving
value: anObject 
	| visitor |
	visitor := MustacheWriteVisitor new
		context: anObject.
	self accept: visitor.
	^ visitor string