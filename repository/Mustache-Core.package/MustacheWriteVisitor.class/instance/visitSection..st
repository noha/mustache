visiting
visitSection: aSection 
	 | oldContext value |
	oldContext := context.
	value := aSection valueInContext: context.
	[aSection 
		mustacheDo: [:item|
			"if we are in collection context the lookup context
			is shifted to the actual element of the collection"
			item notNil ifTrue: [  context := item ].
			self visitCompositePart: aSection ]
		inContext: value]
				ensure: [ context := oldContext ]