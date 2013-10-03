tests
testSingleTokenEnd
	| template result |
	template := MustacheTemplate on: 'test for {{ name }}'.
	result := template value: { 'name' -> 'simpletoken' } asDictionary .
	self assert: result = 'test for simpletoken' 
	