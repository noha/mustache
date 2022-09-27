visiting
visitHtmlEscapedToken: aToken
	self addString: '{{' ; addString: aToken token ; addString: '}}'