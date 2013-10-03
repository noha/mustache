reading
readStringChunk
	(stream upToAll: self startDelimiter) ifNotNil: [:chunk|
		self addPart: (MustacheStringChunk string: chunk) ].