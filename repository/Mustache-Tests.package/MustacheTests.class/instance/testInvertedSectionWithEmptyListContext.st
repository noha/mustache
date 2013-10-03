tests
testInvertedSectionWithEmptyListContext
	| template result |
	template := MustacheTemplate on: 'list{{^ list }} is {{/ list}}displayed'.
	result := template value: { 
		'list' -> { }
	} asDictionary.
	self assert: result = 'list is displayed' 