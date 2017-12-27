visiting
visitSection: aSection 
	 | oldContext value |
	oldContext := context.
	value := aSection valueInContext: context.
	[ value isClosure 
		ifTrue: [ self renderSection: aSection withBlock: value ]
		ifFalse: [ 
			value isDictionary 
			ifTrue: [ self renderSection: aSection withObject: value ]
			ifFalse: [self renderSection: aSection withObject: context] 
			]]
			ensure: [ context := oldContext ]