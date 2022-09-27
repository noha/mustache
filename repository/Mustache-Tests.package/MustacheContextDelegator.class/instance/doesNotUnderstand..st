reflective operations
doesNotUnderstand: aMessage 
	(delegate respondsTo: aMessage selector)
		ifTrue: [ ^ aMessage sendTo: delegate ].
	^ super doesNotUnderstand: aMessage