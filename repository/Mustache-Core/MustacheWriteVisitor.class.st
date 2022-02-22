"
A MustacheWriteVisitor is the main visitor produces a final string from a template and a context object. 

It is used by MustacheTemplate
"
Class {
	#name : #MustacheWriteVisitor,
	#superclass : #MustacheVisitor,
	#instVars : [
		'strings',
		'context'
	],
	#category : 'Mustache-Core'
}

{ #category : #accessing }
MustacheWriteVisitor >> addString: aString [
	aString ifNotEmpty: [ 
		strings add: aString ]
]

{ #category : #accessing }
MustacheWriteVisitor >> context: anObject [
	context := anObject
]

{ #category : #'initialize-release' }
MustacheWriteVisitor >> initialize [ 
	super initialize.
	strings := OrderedCollection new: 50.
]

{ #category : #rendering }
MustacheWriteVisitor >> renderSection: aSection withBlock: aBlock [
	"generate a render continuation block and hand it over to block
	in the template. Return value will be a string that add as a whole
	to the local string stack"
	self addString: (aBlock value: [ 
		self class new 
			context: context;
			visitCompositePart: aSection;
			string ]) 
]

{ #category : #rendering }
MustacheWriteVisitor >> renderSection: aSection withObject: anObject [
	aSection 
		mustacheDo: [:item|
			"if we are in collection context the lookup context
			is shifted to the actual element of the collection"
			item notNil ifTrue: [  context := item ].
			self visitCompositePart: aSection ]
		inContext: anObject
]

{ #category : #accessing }
MustacheWriteVisitor >> string [
	^ strings
		ifNotEmpty: [   
			String 
				new: ( strings sum: #size ) 
				streamContents: [ :stream|
					strings do: [ :string| 
					stream nextPutAll: string ] ] ]
		ifEmpty: [ '' ]
]

{ #category : #visiting }
MustacheWriteVisitor >> visitHtmlEscapedToken: aToken [
	self addString: (aToken valueInContext: context)
]

{ #category : #visiting }
MustacheWriteVisitor >> visitSection: aSection [ 
	 | oldContext value |
	oldContext := context.
	value := aSection valueInContext: context.
	[ value isClosure 
		ifTrue: [ self renderSection: aSection withBlock: value ]
		ifFalse: [ self renderSection: aSection withObject: value ]]
			ensure: [ context := oldContext ]
]

{ #category : #visiting }
MustacheWriteVisitor >> visitStringChunk: aStringChunk [
	self addString: aStringChunk string
]
