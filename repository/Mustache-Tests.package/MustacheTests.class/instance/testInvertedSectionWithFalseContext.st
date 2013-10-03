tests
testInvertedSectionWithFalseContext
	| template result |
	template := MustacheTemplate on: 'list{{^ list }} is {{/ list}}displayed'.
	result := template value: { 
		'list' -> false
	} asDictionary.
	self assert: result = 'list is displayed' 