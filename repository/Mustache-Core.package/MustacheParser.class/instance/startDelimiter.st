accessing
startDelimiter
	^ startDelimiter ifNil: [
		startDelimiter := self defaultStartDelimiter ]