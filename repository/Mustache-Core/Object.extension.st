Extension { #name : 'Object' }

{ #category : '*mustache-core' }
Object >> mustacheDefaultWhenLookupFails: failingPartString [

	^ nil
]

{ #category : '*mustache-core' }
Object >> mustacheDo: aBlock [
	self mustacheDo: aBlock inverted: false
]

{ #category : '*mustache-core' }
Object >> mustacheDo: aBlock inverted: aBoolean [
	aBoolean ifFalse:  [ aBlock cull: self ]
]

{ #category : '*mustache-core' }
Object >> mustacheLookup: aString [
	"The lookup supports navigation between objects using messages expressed by $. 
	
	For example {{{ site.configuration }}} means that the template accesses the value returned by the message configuration sent to the result of the message site."

	(aString = '.') ifTrue: [ ^ self ].
	^ [ self perform: aString asSymbol ]
		on: MessageNotUnderstood 
		do: [ :err | self mustacheLookupComplex: aString  ]
]

{ #category : '*mustache-core' }
Object >> mustacheLookupComplex: aString [
	| stream firstPart |
	stream := aString readStream.
	firstPart := stream upTo: $. .
	^ stream atEnd
		ifTrue: [ self mustacheDefaultWhenLookupFails: aString ]
		ifFalse: [ (self mustacheLookup: firstPart) mustacheLookup: stream upToEnd ]
]

{ #category : '*mustache-core' }
Object >> mustacheString [ 
	^ self asString 
]
