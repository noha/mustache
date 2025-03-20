Class {
	#name : 'MustacheInvertedSection',
	#superclass : 'MustacheSection',
	#category : 'Mustache-Core',
	#package : 'Mustache-Core'
}

{ #category : 'testing' }
MustacheInvertedSection >> isInverted [
	^ true
]

{ #category : 'writing' }
MustacheInvertedSection >> storeOn: aWriteStream [ 
	aWriteStream << '{{^' << selector << '}}'.
	parts do: [ :part |
		part storeOn: aWriteStream ].
	aWriteStream << '{{/' << selector << '}}'
]
