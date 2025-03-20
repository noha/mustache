Class {
	#name : 'MustacheCompositePart',
	#superclass : 'MustachePart',
	#instVars : [
		'parts'
	],
	#category : 'Mustache-Core',
	#package : 'Mustache-Core'
}

{ #category : 'adding' }
MustacheCompositePart >> addPart: aMustachePart [
	parts add: aMustachePart 
]

{ #category : 'initialize-release' }
MustacheCompositePart >> initialize [ 
	super initialize.
	parts := OrderedCollection new.
]

{ #category : 'accessing' }
MustacheCompositePart >> parts [
	^ parts
]

{ #category : 'writing' }
MustacheCompositePart >> storeOn: aWriteStream [ 
	parts do: [ :part |
		part storeOn: aWriteStream  ]
]

{ #category : 'accessing' }
MustacheCompositePart >> storeSize [
	^ parts sum: #storeSize
]
