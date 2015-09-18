*mustache-core
mustacheLookup: aString
	(aString = '.') ifTrue: [ ^ self ].
	^ self at: aString ifAbsent: [ self mustacheLookupComplex: aString ]