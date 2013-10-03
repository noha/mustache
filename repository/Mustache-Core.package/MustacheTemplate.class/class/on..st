instance creation
on: aStringOrStream 
	^ self new
		stream: aStringOrStream readStream;
		compile;
		yourself