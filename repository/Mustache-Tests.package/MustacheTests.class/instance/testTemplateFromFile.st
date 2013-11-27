tests
testTemplateFromFile
	| file template result |
	file := FileSystem memory root / 'file'.
	file writeStreamDo: [ :stream | stream nextPutAll: '12{{i}}4' ].
	template := file asMustacheTemplate.
	result := template value: { 'i' -> '3' } asDictionary .
	self assert: result asString equals: '1234' 