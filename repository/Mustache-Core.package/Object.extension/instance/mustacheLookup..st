*mustache-core
mustacheLookup: aString
	"The lookup supports navigation between objects using messages expressed by $. 
	
	For example {{{ site.configuration }}} means that the template accesses the value returned by the message configuration sent to the result of the message site."
	
	(aString = '.') ifTrue: [ ^ self ].
	^ (self respondsTo: aString asSymbol) 
		ifTrue: [ self perform: aString asSymbol ]
		ifFalse: [  self mustacheLookupComplex: aString ]