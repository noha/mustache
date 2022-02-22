Class {
	#name : #MustacheSection,
	#superclass : #MustacheCompositePart,
	#instVars : [
		'selector'
	],
	#category : 'Mustache-Core'
}

{ #category : #'instance creation' }
MustacheSection class >> selector: aString [ 
	^ self new
		selector: aString
]

{ #category : #visiting }
MustacheSection >> accept: aVisitor [ 
	aVisitor visitSection: self
]

{ #category : #testing }
MustacheSection >> isInverted [
	^ false
]

{ #category : #accessing }
MustacheSection >> lookupInContext: anObject [
	^ self lookup: selector inContext: anObject
]

{ #category : #resolving }
MustacheSection >> mustacheDo: aBlock inContext: aContext [ 
	aContext mustacheDo: aBlock inverted: self isInverted
]

{ #category : #accessing }
MustacheSection >> selector [
	^ selector
]

{ #category : #accessing }
MustacheSection >> selector: aString [ 
	selector := aString
]

{ #category : #accessing }
MustacheSection >> valueInContext: anObject [
	^ self lookupInContext: anObject
]
