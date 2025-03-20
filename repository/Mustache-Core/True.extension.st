Extension { #name : 'True' }

{ #category : '*mustache-core' }
True >> mustacheDo: aBlock inverted: aBoolean [
	aBoolean ifFalse:  [ aBlock value: nil ]
]
