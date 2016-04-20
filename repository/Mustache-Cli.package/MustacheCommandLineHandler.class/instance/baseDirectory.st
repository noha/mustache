activation
baseDirectory
	^ baseDirectory ifNil: [ FileSystem workingDirectory ]