resolving
export
	| visitor |
	visitor := MustacheExportVisitor new.
	self accept: visitor.
	^ visitor string