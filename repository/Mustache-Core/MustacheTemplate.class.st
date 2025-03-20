"
A MustacheTemplate is the main class to interact when dealing with mustache templates.

A MustacheTemplate can be created from a string containing mustache template markup either with

MustacheTemplate on: aString

or

aString asMustacheTemplate 

To fill out a template just provide a context object and do

aMustacheTemplate value: aContextObject 

Nested templates can be used be providing a dictionary with keys as the names used in the master template and values being individual mustache templates
"
Class {
	#name : 'MustacheTemplate',
	#superclass : 'MustacheCompositePart',
	#category : 'Mustache-Core',
	#package : 'Mustache-Core'
}

{ #category : 'instance creation' }
MustacheTemplate class >> on: aStringOrStream [ 
	^ self new
		compile: aStringOrStream readStream;
		yourself
]

{ #category : 'visiting' }
MustacheTemplate >> accept: aVisitor [ 
	aVisitor visitTemplate: self
]

{ #category : 'resolving' }
MustacheTemplate >> compile: aStream [
 	(self parserClass on: aStream)
		compileTemplate: self
			
]

{ #category : 'resolving' }
MustacheTemplate >> defaultVisitorClass [
	^ MustacheWriteVisitor
]

{ #category : 'accessing' }
MustacheTemplate >> parserClass [
	^ MustacheParser 
]

{ #category : 'resolving' }
MustacheTemplate >> value: anObject [ 
	^ self 
		value: anObject
		partials: nil
]

{ #category : 'resolving' }
MustacheTemplate >> value: anObject partials: aDictionary [
	^ self
		value: anObject 
		partials: aDictionary
		visitor: self defaultVisitorClass new
]

{ #category : 'resolving' }
MustacheTemplate >> value: anObject partials: aDictionary visitor: aVisitor [
	| visitor |
	visitor := aVisitor
		partials: aDictionary;
		context: anObject.
	self accept: visitor.
	^ visitor string
]

{ #category : 'resolving' }
MustacheTemplate >> value: anObject visitor: aVisitor [
	^ self 
		value: anObject 
		partials: nil
		visitor: aVisitor
]
