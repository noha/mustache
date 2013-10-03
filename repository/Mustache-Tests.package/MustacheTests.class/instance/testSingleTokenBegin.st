tests
testSingleTokenBegin
	| template result |
	template := MustacheTemplate on: '{{ name }} test it is.'.
	result := template value: { 'name' -> 'simpletoken' } asDictionary .
	self assert: result = 'simpletoken test it is.' 
	