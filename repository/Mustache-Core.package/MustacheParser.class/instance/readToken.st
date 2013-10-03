reading
readToken
	^ (stream upToAll: self endDelimiter) trimBoth
