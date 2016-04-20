accessing
templateOption
	^ self optionAt: 'template' ifAbsent: [ self errorNeed: 'template' ]