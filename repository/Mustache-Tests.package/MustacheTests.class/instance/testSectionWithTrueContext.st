tests
testSectionWithTrueContext
	| template result |
	template := MustacheTemplate on: 'list{{# list }} is {{/ list}}displayed'.
	result := template value: { 
		'list' -> true
	} asDictionary.
	self assert: result = 'list is displayed' 