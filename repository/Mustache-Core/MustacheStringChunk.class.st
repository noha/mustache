Class {
	#name : #MustacheStringChunk,
	#superclass : #MustachePart,
	#instVars : [
		'string'
	],
	#category : 'Mustache-Core'
}

{ #category : #'instance creation' }
MustacheStringChunk class >> string: aString [ 
	^ self new
		string: aString
]

{ #category : #visiting }
MustacheStringChunk >> accept: aVisitor [ 
	aVisitor visitStringChunk: self
]

{ #category : #accessing }
MustacheStringChunk >> string [
	^ string
]

{ #category : #accessing }
MustacheStringChunk >> string: aString [ 
	string := aString
]
