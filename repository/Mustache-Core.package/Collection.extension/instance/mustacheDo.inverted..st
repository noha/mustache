*mustache-core
mustacheDo: aBlock inverted: aBoolean
	aBoolean
		ifTrue: [ self notEmpty mustacheDo: aBlock inverted: aBoolean ]
		ifFalse: [ self mustacheDo: aBlock ]