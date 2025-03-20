Class {
	#name : 'MustachePartial',
	#superclass : 'MustachePart',
	#instVars : [
		'name'
	],
	#category : 'Mustache-Core',
	#package : 'Mustache-Core'
}

{ #category : 'instance creation' }
MustachePartial class >> name: aString [ 
	^ self new
		name: aString
]

{ #category : 'visiting' }
MustachePartial >> accept: aVisitor [ 
	aVisitor visitPartial: self 
]

{ #category : 'accessing' }
MustachePartial >> name [
	^ name
]

{ #category : 'accessing' }
MustachePartial >> name: aString [ 
	name := aString
]

{ #category : 'writing' }
MustachePartial >> storeOn: aStream [ 
	aStream << '{{>' << name << '}}'
]

{ #category : 'accessing' }
MustachePartial >> storeSize [ 
	"the size is the name of the partial plus 5 markup chararcters {{>}}"
	^ name size + 5
]
