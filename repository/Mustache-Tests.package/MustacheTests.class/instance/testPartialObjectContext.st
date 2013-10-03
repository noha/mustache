tests
testPartialObjectContext
	| template result |
	template := MustacheTemplate on: 'This is a test for {{> partial }} .'.
	result := template 
		value: { 'name' -> 'partial template' } asDictionary
		partials: (Dictionary new
			at: 'partial' put: (MustacheTemplate on: '{{name}} rendering');
			yourself) .
	self assert: result = 'This is a test for partial template rendering .'