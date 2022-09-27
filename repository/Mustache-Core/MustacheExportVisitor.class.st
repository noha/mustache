Class {
	#name : #MustacheExportVisitor,
	#superclass : #MustacheVisitor,
	#instVars : [
		'strings',
		'context'
	],
	#category : #'Mustache-Core'
}

{ #category : #accessing }
MustacheExportVisitor >> addString: aString [
	aString ifNotEmpty: [ 
		strings add: aString ]
]

{ #category : #initialization }
MustacheExportVisitor >> initialize [ 
	super initialize.
	strings := OrderedCollection new.
]

{ #category : #accessing }
MustacheExportVisitor >> string [
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
MustacheExportVisitor >> visitHtmlEscapedToken: aToken [
	self addString: '{{' ; addString: aToken token ; addString: '}}'
]

{ #category : #visiting }
MustacheExportVisitor >> visitSection: aSection [ 

	self addString: '{{#' ; addString: aSection selector; addString: '}}'.
	self visitCompositePart: aSection.
	 self addString: '{{/'; addString: aSection selector;addString:'}}' .
]

{ #category : #visiting }
MustacheExportVisitor >> visitStringChunk: aStringChunk [
	self addString: aStringChunk string
]
