*mustache-core
mustacheLookupComplex: aString
	| stream firstPart |
	stream := aString readStream.
	firstPart := stream upTo: $. .
	^ stream atEnd
		ifTrue: [ self mustacheDefaultWhenLookupFails ]
		ifFalse: [ (self mustacheLookup: firstPart) mustacheLookup: stream upToEnd ]