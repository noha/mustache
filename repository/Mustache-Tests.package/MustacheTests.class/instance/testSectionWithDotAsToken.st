tests
testSectionWithDotAsToken
	| template result |
	template := MustacheTemplate on: '{{# list }}{{ . }}{{/ list}}'.
	result := template value: { 
		'list' -> #( a b c )
	} asDictionary.
	self assert: result = 'abc' 