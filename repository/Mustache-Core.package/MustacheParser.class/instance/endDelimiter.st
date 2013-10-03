accessing
endDelimiter
	^ endDelimiter ifNil: [ 
		endDelimiter := self defaultEndDelimiter  ]