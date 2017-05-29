tests
testSectionWithDotAsTokenStringValue
	| template result |
	template := MustacheTemplate on: '{{# list }}<{{ . }}>{{/ list}}'.
	result := template value: { 
		'list' -> 'abc'
	} asDictionary.
	self assert: result = '<abc>' 