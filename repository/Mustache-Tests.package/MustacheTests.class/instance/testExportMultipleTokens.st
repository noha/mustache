tests
testExportMultipleTokens
	| template |
	template := MustacheTemplate on: '1 = {{ one }}, 2 = {{ two }}, and so on'.
self assert: template export equals: '1 = {{one}}, 2 = {{two}}, and so on'