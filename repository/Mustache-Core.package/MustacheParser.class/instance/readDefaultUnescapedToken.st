reading
readDefaultUnescapedToken
	self readUnescapedToken.
	(stream next = $}) ifFalse: [ 
		Error signal: $} asString, ' character expected' ].
