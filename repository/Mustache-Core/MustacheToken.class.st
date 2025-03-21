Class {
	#name : 'MustacheToken',
	#superclass : 'MustachePart',
	#instVars : [
		'token'
	],
	#category : 'Mustache-Core',
	#package : 'Mustache-Core'
}

{ #category : 'instance creation' }
MustacheToken class >> token: aString [ 
	^ self new
		token: aString
]

{ #category : 'visting' }
MustacheToken >> accept: aVisitor [ 
	aVisitor visitToken: self
]

{ #category : 'resolving' }
MustacheToken >> lookupInContext: anObject [
	^ self lookup: token inContext: anObject
]

{ #category : 'writing' }
MustacheToken >> storeOn: aWriteStream [ 
	aWriteStream << '{{{' << token << '}}}'
]

{ #category : 'accessing' }
MustacheToken >> storeSize [ 
	"size of the token plus 4 markup characters {{}}"
	^ token size + 4
]

{ #category : 'accessing' }
MustacheToken >> token [

	^ token
]

{ #category : 'accessing' }
MustacheToken >> token: aString [ 
	token := aString
]

{ #category : 'resolving' }
MustacheToken >> valueInContext: anObject visitor: aVisitor [
	"lookup to token, perfrom value on it in case we have a block and 
	finally convert it to string"
	^ (self lookupInContext: anObject) 
		ifNotNil: [ :object | aVisitor convertToString: object value ]
		ifNil: [ '' ]
]
