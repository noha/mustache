tests
testBlockSection
	| template result |
	template := MustacheTemplate on: '{{#wrapped}} {{name}} is awesome {{/wrapped}}'.
	result := template value: { 
		'name' -> 'Willy'.
		'wrapped' -> [ :render | '<b>',  render value, '</b>' ]  } asDictionary  .
	self assert: result = '<b> Willy is awesome </b>'.
	
