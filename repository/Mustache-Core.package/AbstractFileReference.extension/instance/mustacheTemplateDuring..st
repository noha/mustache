*mustache-core
mustacheTemplateDuring: aBlock
	^ self
		readStreamDo: [ :input | 
			"The following are here because of case #12259: 'FileSystem memory reads/writes using a binary stream by default'."
			(self fileSystem store isKindOf: MemoryStore)
				ifTrue: [ input := input contents asString readStream ].
			aBlock value: (MustacheTemplate on: input) ]