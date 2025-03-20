Class {
	#name : 'MustacheStringChunk',
	#superclass : 'MustachePart',
	#instVars : [
		'string'
	],
	#category : 'Mustache-Core',
	#package : 'Mustache-Core'
}

{ #category : 'instance creation' }
MustacheStringChunk class >> string: aString [ 
	^ self new
		string: aString
]

{ #category : 'visiting' }
MustacheStringChunk >> accept: aVisitor [ 
	aVisitor visitStringChunk: self
]

{ #category : 'writing' }
MustacheStringChunk >> storeOn: aWriteStream [ 
	aWriteStream nextPutAll: string
]

{ #category : 'accessing' }
MustacheStringChunk >> storeSize [
	^ string size
]

{ #category : 'accessing' }
MustacheStringChunk >> string [
	^ string
]

{ #category : 'accessing' }
MustacheStringChunk >> string: aString [ 
	string := aString
]
