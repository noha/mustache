Extension { #name : 'False' }

{ #category : '*mustache-core' }
False >> mustacheDo: aBlock inverted: aBoolean [
	aBoolean ifTrue:  [ aBlock value: nil ]
]
