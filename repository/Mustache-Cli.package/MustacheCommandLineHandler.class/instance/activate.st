activation
activate
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
		value: (Json readFrom: json readStream)
		partials: partials.
	self stdout nextPutAll: result.
	self stdout flush.
	self exitSuccess