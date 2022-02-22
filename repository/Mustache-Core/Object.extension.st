Extension { #name : #Object }

{ #category : #'*mustache-core' }
Object >> mustacheDefaultWhenLookupFails [
	^ nil
]

{ #category : #'*mustache-core' }
Object >> mustacheDo: aBlock [
	self mustacheDo: aBlock inverted: false
]

{ #category : #'*mustache-core' }
Object >> mustacheDo: aBlock inverted: aBoolean [
	aBoolean ifFalse:  [ aBlock cull: self ]
]

{ #category : #'*mustache-core' }
Object >> mustacheLookup: aString [
	(aString = '.') ifTrue: [ ^ self ].
	^ [ self perform: aString asSymbol ]
		on: MessageNotUnderstood 
		do: [ :err | self mustacheLookupComplex: aString  ]
]

{ #category : #'*mustache-core' }
Object >> mustacheLookupComplex: aString [
	| stream firstPart |
	stream := aString readStream.
	firstPart := stream upTo: $. .
	^ stream atEnd
		ifTrue: [ self mustacheDefaultWhenLookupFails ]
		ifFalse: [ (self mustacheLookup: firstPart) mustacheLookup: stream upToEnd ]
]
