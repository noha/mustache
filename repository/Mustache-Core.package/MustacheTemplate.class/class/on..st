instance creation
on: aStringOrStream 
	^ self new
		compile: aStringOrStream readStream;
		yourself