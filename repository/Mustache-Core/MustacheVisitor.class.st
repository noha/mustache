Class {
	#name : #MustacheVisitor,
	#superclass : #Object,
	#instVars : [
		'partials'
	],
	#category : 'Mustache-Core'
}

{ #category : #accessing }
MustacheVisitor >> partialAt: aString [ 
	| template |
	partials ifNil: [ Error signal: 'template has no partials' ].
	template := partials at: aString.
	template isString ifTrue: [ 
		template := MustacheTemplate on: template.
		partials at: aString put: template ].
	^ template
]

{ #category : #accessing }
MustacheVisitor >> partials: aDictionary [
	partials := aDictionary
]

{ #category : #visiting }
MustacheVisitor >> visit: aMustachePart [
	aMustachePart accept: self
]

{ #category : #visiting }
MustacheVisitor >> visitAll: aCollection [ 
	aCollection do: [ :each |
		self visit: each ]
]

{ #category : #visiting }
MustacheVisitor >> visitCompositePart: aCompositePart [
	self visitAll: aCompositePart parts
]

{ #category : #visiting }
MustacheVisitor >> visitHtmlEscapedToken: aMustacheHTMLEscapedToken [ 
	
]

{ #category : #visiting }
MustacheVisitor >> visitPartial: aMustachePartial [ 
	self visit: (self partialAt: aMustachePartial name)
]

{ #category : #visiting }
MustacheVisitor >> visitSection: aMustacheSection [ 
	self visitCompositePart: aMustacheSection 
]

{ #category : #visiting }
MustacheVisitor >> visitStringChunk: aMustacheStringChunk [ 
	
]

{ #category : #visiting }
MustacheVisitor >> visitTemplate: aMustacheTemplate [ 
	self visitCompositePart: aMustacheTemplate 
]

{ #category : #visiting }
MustacheVisitor >> visitToken: aMustacheToken [
	self visitHtmlEscapedToken: aMustacheToken  
	
]
