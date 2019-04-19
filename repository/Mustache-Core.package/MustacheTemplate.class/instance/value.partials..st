resolving
value: anObject partials: aDictionary
	^ self
		value: anObject 
		partials: aDictionary
		visitor: self defaultVisitorClass new