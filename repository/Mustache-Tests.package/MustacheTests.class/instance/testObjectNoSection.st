tests
testObjectNoSection
	| template result |
	template := MustacheTemplate on: 'Class: {{stream.class}}, Position: {{stream.position}}, Next: {{stream.next}}, Position: {{stream.position}}' .
	result := template 
		value: { 'stream' -> 'Hello' readStream } asDictionary.
	self assert: result = 'Class: ReadStream, Position: 0, Next: H, Position: 1' 