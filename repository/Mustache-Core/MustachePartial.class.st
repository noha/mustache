Class {
	#name : #MustachePartial,
	#superclass : #MustachePart,
	#instVars : [
		'name'
	],
	#category : 'Mustache-Core'
}

{ #category : #'instance creation' }
MustachePartial class >> name: aString [ 
	^ self new
		name: aString
]

{ #category : #visiting }
MustachePartial >> accept: aVisitor [ 
	aVisitor visitPartial: self 
]

{ #category : #accessing }
MustachePartial >> name [
	^ name
]

{ #category : #accessing }
MustachePartial >> name: aString [ 
	name := aString
]
