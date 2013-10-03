reading
endSection
	| token |
	token := self readToken.
	(stack top selector = token) ifFalse: [ 
		Error signal: 'end section does not match ', stack top selector asString ].
	stack pop