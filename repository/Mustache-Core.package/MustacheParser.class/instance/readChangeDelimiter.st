reading
readChangeDelimiter
	self startDelimiter: (String streamContents: [ :s| 
		[ stream peek isSeparator ] whileFalse: [ 
			s nextPut: stream next ]]).
	self consumeWhiteSpace.
	self endDelimiter: (stream upToAll: self endDelimiter) allButLast