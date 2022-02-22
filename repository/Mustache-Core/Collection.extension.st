Extension { #name : #Collection }

{ #category : #'*mustache-core' }
Collection >> mustacheDo: aBlock [
	self do: aBlock
]

{ #category : #'*mustache-core' }
Collection >> mustacheDo: aBlock inverted: aBoolean [
	aBoolean
		ifTrue: [ self notEmpty mustacheDo: aBlock inverted: aBoolean ]
		ifFalse: [ self mustacheDo: aBlock ]
]
