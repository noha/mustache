*mustache-core
mustacheDo: aBlock inverted: aBoolean
	aBoolean ifFalse:  [ aBlock value: nil ]