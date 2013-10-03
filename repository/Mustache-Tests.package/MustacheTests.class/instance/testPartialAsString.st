tests
testPartialAsString
	| template result |
	template := 'This is a test for {{> partial }} .' asMustacheTemplate.
	result := template 
		value: { 'name' -> 'partial template' } asDictionary
		partials: { 'partial' ->  '{{name}} rendering' } asDictionary.
	self assert: result = 'This is a test for partial template rendering .'