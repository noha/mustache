*mustache-core
mustacheLookup: aString
	^ self at: aString ifAbsent: [ '' ]