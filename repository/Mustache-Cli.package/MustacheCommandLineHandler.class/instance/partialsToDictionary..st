private
partialsToDictionary: aString
	| fileNames file partials name |
	self flag: #TODO.
	"Change this to have partials file name with space"
	partials := Dictionary new.
	fileNames := aString substrings: ' '.
	fileNames
		replace: [ :each | 
			file := (self baseDirectory resolve: each). 
			file exists
				ifTrue: [ 
					name := (each substrings: '.') first. 
					partials add: name -> file contents ]
				ifFalse: [ self errorFileNotFound: each ] ].
	^ partials 