Class {
	#name : #MustacheToken,
	#superclass : #MustachePart,
	#instVars : [
		'token'
	],
	#category : #'Mustache-Core'
}

{ #category : #'instance creation' }
MustacheToken class >> token: aString [ 
	^ self new
		token: aString
]

{ #category : #visting }
MustacheToken >> accept: aVisitor [ 
	aVisitor visitToken: self
]

{ #category : #resolving }
MustacheToken >> lookupInContext: anObject [
	^ self lookup: token inContext: anObject
]

{ #category : #accessing }
MustacheToken >> token [
	^ token 
]

{ #category : #accessing }
MustacheToken >> token: aString [ 
	token := aString
]

{ #category : #resolving }
MustacheToken >> valueInContext: anObject [
	"lookup to token, perfrom value on it in case we have a block and 
	finally convert it to string"
	^ (self lookupInContext: anObject) 
		ifNotNil: [ :object | object value asString ]
		ifNil: [ '' ]
]
