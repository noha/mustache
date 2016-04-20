accessing
errorFileNotFound: aString
	self help.
	self exitFailure: 'The file ', aString, ' was not found'.