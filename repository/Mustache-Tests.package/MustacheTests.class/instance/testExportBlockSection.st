tests
testExportBlockSection
	| template |
	template := MustacheTemplate on: '{{#wrapped}} {{name}} is awesome {{/wrapped}}'.
	
	self assert: template export equals: '{{#wrapped}} {{name}} is awesome {{/wrapped}}'.
	
