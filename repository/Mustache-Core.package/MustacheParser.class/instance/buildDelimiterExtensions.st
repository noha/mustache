accessing
buildDelimiterExtensions
	^ Dictionary new
		at: $# put: [ self startSection: MustacheSection ];
		at: $/ put: [ self endSection ];
		at: ${ put: [ self readDefaultUnescapedToken ];
		at: $& put: [ self readUnescapedToken  ];
		at: $! put: [ self readComment ];
		at: $^ put: [ self startSection: MustacheInvertedSection ];
		at: $= put: [ self readChangeDelimiter ];
		at: $> put: [ self readPartial ];
		yourself