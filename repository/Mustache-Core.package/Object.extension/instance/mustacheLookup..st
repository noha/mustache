*mustache-core
mustacheLookup: aString
	(aString = '.') ifTrue: [ ^ self ].
	^ (self respondsTo: aString asSymbol) 
		ifTrue: [ self perform: aString asSymbol ]
		ifFalse: [  self mustacheLookupComplex: aString ]