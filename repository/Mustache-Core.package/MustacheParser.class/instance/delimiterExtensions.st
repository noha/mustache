accessing
delimiterExtensions
	^ delimiterExtensions ifNil: [ 
		delimiterExtensions := self buildDelimiterExtensions ]