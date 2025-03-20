"
A MustacheParser is the internally used parser that is used my MustacheTemplate to compile a template string into a template structure
"
Class {
	#name : 'MustacheParser',
	#superclass : 'Object',
	#instVars : [
		'stream',
		'startDelimiter',
		'endDelimiter',
		'stack',
		'delimiterExtensions'
	],
	#category : 'Mustache-Core',
	#package : 'Mustache-Core'
}

{ #category : 'instance creation' }
MustacheParser class >> on: aStringOrStream [ 
	^ self new
		stream: aStringOrStream readStream 
]

{ #category : 'accessing' }
MustacheParser >> addPart: aMustachePart [
	stack top addPart: aMustachePart
	
]

{ #category : 'accessing' }
MustacheParser >> buildDelimiterExtensions [
	^ Dictionary new
		at: $# put: [ self startSection: MustacheSection ];
		at: $/ put: [ self endSection ];
		at: ${ put: [ self readDefaultUnescapedToken ];
		at: $& put: [ self readUnescapedToken  ];
		at: $! put: [ self readComment ];
		at: $^ put: [ self startSection: MustacheInvertedSection ];
		at: $= put: [ self readChangeDelimiter ];
		at: $> put: [ self readPartial ];
		yourself
]

{ #category : 'generating' }
MustacheParser >> compile [
	|  sequenceStart |
	sequenceStart := [ 
		self readStringChunk.
		[ self readTag. sequenceStart ] ].
	self readUpToEndUsing: sequenceStart 
]

{ #category : 'as yet unclassified' }
MustacheParser >> compileTemplate: aTemplate [
	self push: aTemplate.
	self compile
]

{ #category : 'reading' }
MustacheParser >> consumeWhiteSpace [
	[ stream atEnd not and: [ stream peek isSeparator ] ] whileTrue: [ 
		stream next ]
]

{ #category : 'accessing' }
MustacheParser >> defaultEndDelimiter [
	^ '}}'
]

{ #category : 'accessing' }
MustacheParser >> defaultStartDelimiter [
	^ '{{'
]

{ #category : 'accessing' }
MustacheParser >> delimiterExtensions [
	^ delimiterExtensions ifNil: [ 
		delimiterExtensions := self buildDelimiterExtensions ]
]

{ #category : 'accessing' }
MustacheParser >> endDelimiter [
	^ endDelimiter ifNil: [ 
		endDelimiter := self defaultEndDelimiter  ]
]

{ #category : 'accessing' }
MustacheParser >> endDelimiter: aString [
	endDelimiter := aString
]

{ #category : 'reading' }
MustacheParser >> endSection [
	| token |
	token := self readToken.
	(stack top selector = token) ifFalse: [ 
		Error signal: 'end section does not match ', stack top selector asString ].
	stack pop
]

{ #category : 'initialize-release' }
MustacheParser >> initialize [ 
	super initialize.
	stack := Stack new
]

{ #category : 'testing' }
MustacheParser >> isDelimiterExtension: aCharacter [
	^ self delimiterExtensions keys includes: aCharacter
]

{ #category : 'accessing' }
MustacheParser >> push: aTemplate [ 
	stack push: aTemplate 
]

{ #category : 'reading' }
MustacheParser >> readChangeDelimiter [
	self startDelimiter: (String streamContents: [ :s| 
		[ stream peek isSeparator ] whileFalse: [ 
			s nextPut: stream next ]]).
	self consumeWhiteSpace.
	self endDelimiter: (stream upToAll: self endDelimiter) allButLast
]

{ #category : 'reading' }
MustacheParser >> readComment [
	"just read and forget"
	self readToken
]

{ #category : 'reading' }
MustacheParser >> readDefaultTag [
	self readHtmlEscapedToken
]

{ #category : 'reading' }
MustacheParser >> readDefaultUnescapedToken [
	self readUnescapedToken.
	(stream next = $}) ifFalse: [ 
		Error signal: $} asString, ' character expected' ].

]

{ #category : 'reading' }
MustacheParser >> readExtendedTag [
	 ^ (self delimiterExtensions at: stream next) value
]

{ #category : 'reading' }
MustacheParser >> readHtmlEscapedToken [
	self addPart: (MustacheHtmlEscapedToken token: self readToken)
]

{ #category : 'reading' }
MustacheParser >> readPartial [
	self addPart: (MustachePartial name: self readToken)
]

{ #category : 'reading' }
MustacheParser >> readStringChunk [
	(stream upToAll: self startDelimiter) ifNotNil: [:chunk|
		self addPart: (MustacheStringChunk string: chunk) ].
]

{ #category : 'reading' }
MustacheParser >> readTag [
	(self isDelimiterExtension: stream peek)
		ifTrue: [  self readExtendedTag  ]
		ifFalse: [  self readDefaultTag  ]
]

{ #category : 'reading' }
MustacheParser >> readToken [
	^ (stream upToAll: self endDelimiter) trimBoth

]

{ #category : 'reading' }
MustacheParser >> readUnescapedToken [
	self addPart: (MustacheToken token: self readToken)
]

{ #category : 'reading' }
MustacheParser >> readUpToEndUsing: aBlock [
	| nextRead |
	nextRead := aBlock.
	[ stream atEnd ] whileFalse: [  
		 nextRead := nextRead value ]
]

{ #category : 'accessing' }
MustacheParser >> startDelimiter [
	^ startDelimiter ifNil: [
		startDelimiter := self defaultStartDelimiter ]
]

{ #category : 'accessing' }
MustacheParser >> startDelimiter: aString [
	startDelimiter := aString
]

{ #category : 'reading' }
MustacheParser >> startSection: aSectionClass [
	| section |
	section := aSectionClass selector: self readToken.
	self addPart: section. 
	stack push: section	
]

{ #category : 'accessing' }
MustacheParser >> stream: aStream [ 
	stream := aStream
]
