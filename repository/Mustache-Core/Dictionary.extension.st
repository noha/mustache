Extension { #name : 'Dictionary' }

{ #category : '*mustache-core' }
Dictionary >> mustacheLookup: aString [
	(aString = '.') ifTrue: [ ^ self ].
	^ self at: aString ifAbsent: [ self mustacheLookupComplex: aString ]
]
