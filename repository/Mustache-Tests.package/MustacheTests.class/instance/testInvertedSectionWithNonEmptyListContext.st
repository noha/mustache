tests
testInvertedSectionWithNonEmptyListContext
	| template result |
	template := MustacheTemplate on: 'list{{^ list }} is {{/ list}}displayed'.
	result := template value: { 
		'list' -> { 1 }
	} asDictionary.
	self assert: result = 'listdisplayed' 