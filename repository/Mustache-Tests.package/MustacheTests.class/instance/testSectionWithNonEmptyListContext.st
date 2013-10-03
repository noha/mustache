tests
testSectionWithNonEmptyListContext
	| template result |
	template := MustacheTemplate on: 'list {{# list }}{{  label }} {{/ list}}trailer'.
	result := template value: { 
		'list' -> {  
			{ 'label' -> 'has 2' } asDictionary.
			{ 'label' -> 'elements'} asDictionary 
		}} asDictionary.
	self assert: result = 'list has 2 elements trailer' 