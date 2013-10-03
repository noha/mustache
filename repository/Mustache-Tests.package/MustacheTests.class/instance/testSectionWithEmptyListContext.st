tests
testSectionWithEmptyListContext
	| template result |
	template := MustacheTemplate on: 'list {{# list }}{{  label }} {{/ list}}trailer'.
	result := template value: { 
		'list' -> {  
		}} asDictionary.
	self assert: result = 'list trailer' 