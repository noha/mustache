"
I am the top level command line handler for Mustache.

My keyword is ""mustache-pharo"".

Options:
	--data 				a json file
	--template			a template for mustache
	[--partials]			template files
	[--baseDirectory] 		a directory where files can be found
"
Class {
	#name : 'MustacheCommandLineHandler',
	#superclass : 'CommandLineHandler',
	#instVars : [
		'baseDirectory'
	],
	#category : 'Mustache-Cli',
	#package : 'Mustache-Cli'
}

{ #category : 'as yet unclassified' }
MustacheCommandLineHandler class >> commandName [
	^'mustache'
]

{ #category : 'activation' }
MustacheCommandLineHandler >> activate [
	| result template json partials |
	self activateHelp
		ifTrue: [ ^ self ].
	self
		optionAt: 'baseDirectory'
		ifPresent: [ :dir | baseDirectory := dir asFileReference ].
	json := (self baseDirectory resolve: self jsonDataOption) contents.
	template := (self baseDirectory resolve: self templateOption) contents.
	partials := self partialsToDictionary: self partialsOption.
	result := (MustacheTemplate on: template)
		value: (STONJSON fromStream: json readStream)
		partials: partials.
	self stdout nextPutAll: result.
	self stdout flush.
	self exitSuccess
]

{ #category : 'activation' }
MustacheCommandLineHandler >> baseDirectory [
	^ baseDirectory ifNil: [ FileSystem workingDirectory ]
]

{ #category : 'accessing' }
MustacheCommandLineHandler >> errorFileNotFound: aString [
	self help.
	self exitFailure: 'The file ', aString, ' was not found'.
]

{ #category : 'accessing' }
MustacheCommandLineHandler >> errorNeed: aString [
	self help.
	self exitFailure: 'You need to define ', aString.
]

{ #category : 'accessing' }
MustacheCommandLineHandler >> jsonDataOption [
	^ self optionAt: 'data' ifAbsent: [ self errorNeed: 'data' ]
]

{ #category : 'accessing' }
MustacheCommandLineHandler >> partialsOption [
	^ self optionAt: 'partials' ifAbsent: [ '' ].
]

{ #category : 'private' }
MustacheCommandLineHandler >> partialsToDictionary: aString [
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
]

{ #category : 'accessing' }
MustacheCommandLineHandler >> templateOption [
	^ self optionAt: 'template' ifAbsent: [ self errorNeed: 'template' ]
]
