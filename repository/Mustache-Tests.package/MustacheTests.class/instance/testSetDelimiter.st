tests
testSetDelimiter
	| template result |
	template := MustacheTemplate on: '* {{default_tags}} {{=<% %>=}} * <%erb_style_tags%> <%={{ }}=%> * {{default_tags_again}} *'.
	result := template value: (Array with: 'default_tags' -> '1' with: 'erb_style_tags' -> '2' with: 'default_tags_again' -> '3') asDictionary .
	self assert: result = '* 1  * 2  * 3 *'.