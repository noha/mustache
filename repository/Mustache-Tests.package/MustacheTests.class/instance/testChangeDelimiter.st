tests
testChangeDelimiter
	| template result |
	template := MustacheTemplate on: 'This is a test for {{ name }} {{=<% %>=}} and something that uses <% delimiter %> delimiter. And change it back to <%={{ }}=%>{{back}}.'.
	result := template value: { 
		'name' -> 'simpletoken' . 
		'delimiter' -> 'another' . 
		'back' -> 'normal' } asDictionary .
	self assert: result = 'This is a test for simpletoken  and something that uses another delimiter. And change it back to normal.'. 