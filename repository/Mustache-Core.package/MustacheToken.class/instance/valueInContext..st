as yet unclassified
valueInContext: anObject
	"lookup to token, perfrom value on it in case we have a block and 
	finally convert it to string"
	^ (self lookupInContext: anObject) 
		ifNotNil: [ :object | object value asString ]
		ifNil: [ '' ]