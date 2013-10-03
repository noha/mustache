reading
readHtmlEscapedToken
	self addPart: (MustacheHtmlEscapedToken token: self readToken)