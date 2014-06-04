*mustache-core
mustacheLookup: aString
	^ self at: aString ifAbsent: [ self mustacheLookupComplex: aString ]