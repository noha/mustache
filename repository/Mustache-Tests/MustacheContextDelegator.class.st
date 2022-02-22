Class {
	#name : #MustacheContextDelegator,
	#superclass : #Object,
	#instVars : [
		'delegate'
	],
	#category : 'Mustache-Tests'
}

{ #category : #accessing }
MustacheContextDelegator >> delegate [

	^ delegate
]

{ #category : #accessing }
MustacheContextDelegator >> delegate: anObject [

	delegate := anObject
]

{ #category : #'reflective operations' }
MustacheContextDelegator >> doesNotUnderstand: aMessage [ 
	(delegate respondsTo: aMessage selector)
		ifTrue: [ ^ aMessage sendTo: delegate ].
	^ super doesNotUnderstand: aMessage
]
