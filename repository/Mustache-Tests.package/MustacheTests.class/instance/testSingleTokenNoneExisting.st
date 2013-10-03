tests
testSingleTokenNoneExisting
	| template result |
	template := MustacheTemplate on: 'This is a test for {{ name }}.'.
	result := template value: { 'noname' -> 'simpletoken' } asDictionary .
	self assert: result = 'This is a test for .' 
	