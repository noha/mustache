tests
testDotToken
	| template result |
	template := MustacheTemplate on: '{{ . }}'.
	result := template value: #a.
	self assert: result = 'a' 