tests
testPartialListContext
	| template result |
	template := MustacheTemplate on: 'We can have a lists ({{# list}} [ {{> partial }} ] {{/ list}}) .'.
	result := template 
		value: { 'list' -> {
			{ 'name' -> 'first list' } asDictionary.
			{ 'name' -> 'last list' } asDictionary  } } asDictionary
		partials: (Dictionary new
			at: 'partial' put: (MustacheTemplate on: 'including {{name}} item');
			yourself) .
	self assert: result = 'We can have a lists ( [ including first list item ]  [ including last list item ] ) .' 