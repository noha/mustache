tests
testComment
	| template result |
	template := MustacheTemplate on: 'This is a test for {{! ignore me }}.'.
	result := template value: { 'name' -> 'simpletoken' } asDictionary .
	self assert: result = 'This is a test for .' 
	