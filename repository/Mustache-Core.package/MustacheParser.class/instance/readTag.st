reading
readTag
	(self isDelimiterExtension: stream peek)
		ifTrue: [  self readExtendedTag  ]
		ifFalse: [  self readDefaultTag  ]