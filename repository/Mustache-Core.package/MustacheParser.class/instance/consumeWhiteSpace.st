reading
consumeWhiteSpace
	[ stream atEnd not and: [ stream peek isSeparator ] ] whileTrue: [ 
		stream next ]