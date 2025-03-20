Class {
	#name : 'MustacheHtmlEscapedToken',
	#superclass : 'MustacheToken',
	#category : 'Mustache-Core',
	#package : 'Mustache-Core'
}

{ #category : 'visiting' }
MustacheHtmlEscapedToken >> accept: aVisitor [ 
	aVisitor visitHtmlEscapedToken: self 
]

{ #category : 'writing' }
MustacheHtmlEscapedToken >> storeOn: aWriteStream [ 
	aWriteStream << '{{' << token << '}}'
]

{ #category : 'resolving' }
MustacheHtmlEscapedToken >> valueInContext: anObject visitor: aVisitor [
	^ (super valueInContext: anObject visitor: aVisitor) asHTMLString 
]
