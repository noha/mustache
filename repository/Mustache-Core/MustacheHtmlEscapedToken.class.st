Class {
	#name : #MustacheHtmlEscapedToken,
	#superclass : #MustacheToken,
	#category : 'Mustache-Core'
}

{ #category : #visiting }
MustacheHtmlEscapedToken >> accept: aVisitor [ 
	aVisitor visitHtmlEscapedToken: self 
]

{ #category : #resolving }
MustacheHtmlEscapedToken >> valueInContext: anObject [
	^ (super valueInContext: anObject) asHTMLString 
]
