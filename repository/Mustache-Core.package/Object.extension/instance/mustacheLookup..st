*mustache-core
mustacheLookup: aString
	^ (self respondsTo: aString asSymbol) 
		ifTrue: [ self perform: aString asSymbol ]
		ifFalse: [  nil ]