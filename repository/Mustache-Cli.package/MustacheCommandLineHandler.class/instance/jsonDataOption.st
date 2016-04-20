accessing
jsonDataOption
	^ self optionAt: 'data' ifAbsent: [ self errorNeed: 'data' ]