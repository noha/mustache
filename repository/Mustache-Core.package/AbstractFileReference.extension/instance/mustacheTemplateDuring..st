*mustache-core
mustacheTemplateDuring: aBlock
	^ self
		readStreamDo: [ :input | | input2 |
			"The following are here because of case #12259: 'FileSystem memory reads/writes using a binary stream by default'."
			input2 := input.
			(self fileSystem store isKindOf: MemoryStore)
				ifTrue: [ input2 := input2 contents asString readStream ].
			aBlock value: (MustacheTemplate on: input2) ]