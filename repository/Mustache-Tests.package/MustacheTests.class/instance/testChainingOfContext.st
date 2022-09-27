tests
testChainingOfContext
	| template delegatingObject result |
	template := 'Text {{ capitalized }} text' asMustacheTemplate.
	delegatingObject := MustacheContextDelegator new 
		delegate: 'some string'.
	result := template value: delegatingObject.
	self assert: result equals: 'Text Some string text'
	
	