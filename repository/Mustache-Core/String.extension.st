Extension { #name : 'String' }

{ #category : '*mustache-core' }
String >> asMustacheTemplate [
	^ MustacheTemplate on: self 
]

{ #category : '*mustache-core' }
String >> mustacheDo: aBlock [
	"as strings are collections we need to prevent it from iterating
	over all of the characters. Invoke the block with self instead"
	aBlock value: self 
]
