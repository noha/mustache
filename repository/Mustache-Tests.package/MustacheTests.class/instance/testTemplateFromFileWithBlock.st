tests
testTemplateFromFileWithBlock
	| file result |
	file := FileSystem memory root / 'file'.
	file writeStreamDo: [ :stream | stream nextPutAll: '12{{i}}4' ].
	file mustacheTemplateDuring: [ :template | result := template value: {('i' -> '3')} asDictionary ].
	self assert: result asString equals: '1234'