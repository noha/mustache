visiting
visitSection: aSection 
	 | oldContext value |
	oldContext := context.
	value := aSection valueInContext: context.
	[ value isClosure 
		ifTrue: [ self renderSection: aSection withBlock: value ]
		ifFalse: [ self renderSection: aSection withObject: value ]]
			ensure: [ context := oldContext ]