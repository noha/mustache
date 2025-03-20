Class {
	#name : 'MustacheSection',
	#superclass : 'MustacheCompositePart',
	#instVars : [
		'selector'
	],
	#category : 'Mustache-Core',
	#package : 'Mustache-Core'
}

{ #category : 'instance creation' }
MustacheSection class >> selector: aString [ 
	^ self new
		selector: aString
]

{ #category : 'visiting' }
MustacheSection >> accept: aVisitor [ 
	aVisitor visitSection: self
]

{ #category : 'testing' }
MustacheSection >> isInverted [
	^ false
]

{ #category : 'accessing' }
MustacheSection >> lookupInContext: anObject [
	^ self lookup: selector inContext: anObject
]

{ #category : 'resolving' }
MustacheSection >> mustacheDo: aBlock inContext: aContext [ 
	aContext mustacheDo: aBlock inverted: self isInverted
]

{ #category : 'accessing' }
MustacheSection >> selector [
	^ selector
]

{ #category : 'accessing' }
MustacheSection >> selector: aString [ 
	selector := aString
]

{ #category : 'writing' }
MustacheSection >> storeOn: aWriteStream [ 
	aWriteStream << '{{#' << selector << '}}'.
	super storeOn: aWriteStream.
	aWriteStream << '{{/' << selector << '}}'
]

{ #category : 'accessing' }
MustacheSection >> storeSize [ 
	"the size of a section is the size of its content plus two times 
	the selector size plus 5 extra markup characters {{#}} and {{/}}"
	^ super storeSize + (2 * (selector size + 5))
]

{ #category : 'accessing' }
MustacheSection >> valueInContext: anObject visitor: aVisitor [
	^ self lookupInContext: anObject
]
