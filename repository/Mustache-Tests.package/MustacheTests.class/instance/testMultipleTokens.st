tests
testMultipleTokens
	| template result |
	template := MustacheTemplate on: '1 = {{ one }}, 2 = {{ two }}, and so on'.
	result := template value: { 'one' -> 1 . 'two' -> 2 } asDictionary .
	self assert: result = '1 = 1, 2 = 2, and so on' 
	