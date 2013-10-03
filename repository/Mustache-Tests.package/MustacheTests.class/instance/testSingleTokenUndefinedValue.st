tests
testSingleTokenUndefinedValue
	| template result |
	template := MustacheTemplate on: 'This is a test for {{ name }}.'.
	result := template value: { 'name' -> nil } asDictionary .
	self assert: result = 'This is a test for .' 
	