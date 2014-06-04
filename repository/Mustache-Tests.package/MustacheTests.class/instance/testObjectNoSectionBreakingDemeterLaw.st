tests
testObjectNoSectionBreakingDemeterLaw
	| template result |
	template := MustacheTemplate on: '{{stream class name first lowercase}}' .
	result := template 
		value: { 'stream' -> 'Hello' readStream } asDictionary.
	self assert: result = 'r' 