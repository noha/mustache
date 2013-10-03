generating
compile
	|  sequenceStart |
	sequenceStart := [ 
		self readStringChunk.
		[ self readTag. sequenceStart ] ].
	self readUpToEndUsing: sequenceStart 