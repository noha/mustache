activation
activate
	| result template json |
	self activateHelp
		ifTrue: [ ^ self ].
	self optionAt: 'baseDirectory' ifPresent: [ :dir | baseDirectory := dir asFileReference ].
	template := (self baseDirectory resolve: self templateOption) contents.
	json := (self baseDirectory resolve: self jsonDataOption) contents.
	result := (MustacheTemplate on: template) value: (Json readFrom: json readStream).
	self stdout nextPutAll: result.
	self stdout flush.
	self exitSuccess