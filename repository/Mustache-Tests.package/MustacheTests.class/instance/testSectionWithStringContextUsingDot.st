tests
testSectionWithStringContextUsingDot
	| template result |
	template := MustacheTemplate on: '{{#list}}before {{.}} after{{/list}}'.
	result := template value: { 
		'list' -> 'list'
	} asDictionary.
	self assert: result = 'before list after' 