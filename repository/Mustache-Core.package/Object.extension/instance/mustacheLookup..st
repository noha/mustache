*mustache-core
mustacheLookup: aString
	(aString = '.') ifTrue: [ ^ self ].
	^ [ self perform: aString asSymbol ]
		on: MessageNotUnderstood 
		do: [ :err | self mustacheLookupComplex: aString  ]