*mustache-core
mustacheDo: aBlock inverted: aBoolean
	"as strings are collections we need to prevent it from iterating
	over all of the characters. Invoke the block with self instead"
	aBoolean
		ifTrue: [ self notEmpty mustacheDo: aBlock inverted: aBoolean ]
		ifFalse: [ aBlock value: self ]