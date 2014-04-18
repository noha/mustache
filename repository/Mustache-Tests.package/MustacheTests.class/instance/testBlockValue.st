tests
testBlockValue
	| template result |
	template := MustacheTemplate on: 'This is a test for {{ name }}.'.
	result := template value: { 'name' -> [ 'blockcontent' ] } asDictionary .
	self assert: result = 'This is a test for blockcontent.'.
	