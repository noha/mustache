"
A MustachePart is the base class for all entities that are parsed from a template string. The structure is held internally by MustacheTemplate to render a string from a template.

For public access have a look at MustacheTemplate
"
Class {
	#name : #MustachePart,
	#superclass : #Object,
	#category : #'Mustache-Core'
}

{ #category : #resolving }
MustachePart >> lookup: aToken inContext: anObject [
	^ anObject mustacheLookup: aToken
]

{ #category : #writing }
MustachePart >> printString [
	^ self storeString
]

{ #category : #writing }
MustachePart >> storeSize [
	self shouldBeImplemented 
]

{ #category : #writing }
MustachePart >> storeString [
	^ String 
		new: self storeSize
		streamContents: [ :stream | 
			self storeOn: stream ]
]
