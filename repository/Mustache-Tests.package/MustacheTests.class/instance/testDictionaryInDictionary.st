tests
testDictionaryInDictionary
	| template result |
	template := MustacheTemplate on: '{{#person?}} Hi {{name}}! {{/person?}}' .
	result := template 
		value: { 'person?' -> 
			{ 'name' -> 'Jon' } asDictionary  } asDictionary.
	self assert: result = ' Hi Jon! ' 