tests
testSectionWithDotAsTokenListValue
	| template result |
	template := MustacheTemplate on: '{{# list }}<{{ . }}>{{/ list}}'.
	result := template value: { 
		'list' -> #( a b c )
	} asDictionary.
	self assert: result = '<a><b><c>' 