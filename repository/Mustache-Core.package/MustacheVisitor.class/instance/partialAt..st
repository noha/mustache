accessing
partialAt: aString 
	| template |
	partials ifNil: [ Error signal: 'template has no partials' ].
	template := partials at: aString.
	template isString ifTrue: [ 
		template := MustacheTemplate on: template.
		partials at: aString put: template ].
	^ template