Extension { #name : 'HashedCollection' }

{ #category : '*mustache-core' }
HashedCollection >> mustacheDo: aBlock [
	aBlock value: self
]

{ #category : '*mustache-core' }
HashedCollection >> mustacheDo: aBlock inverted: aBoolean [
	aBoolean ifFalse: [ aBlock cull: self ]
]
