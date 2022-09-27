Class {
	#name : #MustacheTests,
	#superclass : #TestCase,
	#category : #'Mustache-Tests'
}

{ #category : #tests }
MustacheTests >> testBlockSection [
	| template result |
	template := MustacheTemplate on: '{{#wrapped}} {{name}} is awesome {{/wrapped}}'.
	result := template value: { 
		'name' -> 'Willy'.
		'wrapped' -> [ :render | '<b>',  render value, '</b>' ]  } asDictionary  .
	self assert: result = '<b> Willy is awesome </b>'.
	

]

{ #category : #tests }
MustacheTests >> testBlockValue [
	| template result |
	template := MustacheTemplate on: 'This is a test for {{ name }}.'.
	result := template value: { 'name' -> [ 'blockcontent' ] } asDictionary .
	self assert: result = 'This is a test for blockcontent.'.
	
]

{ #category : #tests }
MustacheTests >> testChainingOfContext [
	| template delegatingObject result |
	template := 'Text {{ capitalized }} text' asMustacheTemplate.
	delegatingObject := MustacheContextDelegator new 
		delegate: 'some string'.
	result := template value: delegatingObject.
	self assert: result equals: 'Text Some string text'
	
	
]

{ #category : #tests }
MustacheTests >> testChangeDelimiter [
	| template result |
	template := MustacheTemplate on: 'This is a test for {{ name }} {{=<% %>=}} and something that uses <% delimiter %> delimiter. And change it back to <%={{ }}=%>{{back}}.'.
	result := template value: { 
		'name' -> 'simpletoken' . 
		'delimiter' -> 'another' . 
		'back' -> 'normal' } asDictionary .
	self assert: result = 'This is a test for simpletoken  and something that uses another delimiter. And change it back to normal.'. 
]

{ #category : #tests }
MustacheTests >> testComment [
	| template result |
	template := MustacheTemplate on: 'This is a test for {{! ignore me }}.'.
	result := template value: { 'name' -> 'simpletoken' } asDictionary .
	self assert: result = 'This is a test for .' 
	
]

{ #category : #tests }
MustacheTests >> testContextDo [
	| called block |
	called := 0.
	block := [ :el |called := called + 1 ].
	
	false mustacheDo:  block inverted: false.
	self assert: called = 0.
	
	called := 0.
	true mustacheDo:  block inverted: false.
	self assert: called = 1.
	
	called := 0.
	nil mustacheDo:  block inverted: false.
	self assert: called = 0.
	
	called := 0.
	Object new mustacheDo:  block inverted: false.
	self assert: called = 1.
	
	called := 0.
	#() mustacheDo:  block inverted: false.
	self assert: called = 0.
	
	called := 0.
	#(1 2 3) mustacheDo:  block inverted: false.
	self assert: called = 3.

]

{ #category : #tests }
MustacheTests >> testContextDoInverted [
	| called block |
	called := 0.
	block := [ :el |called := called + 1 ].
	
	false mustacheDo:  block inverted: true.
	self assert: called = 1.
	
	called := 0.
	true mustacheDo:  block inverted: true.
	self assert: called = 0.
	
	called := 0.
	nil mustacheDo:  block inverted: true.
	self assert: called = 1.
	
	called := 0.
	Object new mustacheDo:  block inverted: true.
	self assert: called = 0.
	
	called := 0.
	#() mustacheDo:  block inverted: true.
	self assert: called = 1.
	
	called := 0.
	#(1 2 3) mustacheDo:  block inverted: true.
	self assert: called = 0.

]

{ #category : #tests }
MustacheTests >> testDefaultUnescapedToken [
	| template result |
	template := MustacheTemplate on: 'This is a test for {{{ name }}}.'.
	result := template value: { 'name' -> '&' } asDictionary .
	self assert: result = 'This is a test for &.'.
	
]

{ #category : #tests }
MustacheTests >> testDictionaryInDictionary [
	| template result |
	template := MustacheTemplate on: '{{#person?}} Hi {{name}}! {{/person?}}' .
	result := template 
		value: { 'person?' -> 
			{ 'name' -> 'Jon' } asDictionary  } asDictionary.
	self assert: result = ' Hi Jon! ' 
]

{ #category : #tests }
MustacheTests >> testDotToken [
	| template result |
	template := MustacheTemplate on: '{{ . }}'.
	result := template value: #a.
	self assert: result = 'a' 
]

{ #category : #tests }
MustacheTests >> testDotTokenWithDictionary [
	| template result |
	template := MustacheTemplate on: '{{ . }}'.
	result := template value: {
		'foo' -> 'bar' } asDictionary.
	self assert: result = 'a Dictionary(''foo''-&gt;''bar'' )' 
]

{ #category : #tests }
MustacheTests >> testExportBlockSection [
	| template |
	template := MustacheTemplate on: '{{#wrapped}} {{name}} is awesome {{/wrapped}}'.
	
	self assert: template export equals: '{{#wrapped}} {{name}} is awesome {{/wrapped}}'.
	

]

{ #category : #tests }
MustacheTests >> testExportMultipleTokens [
	| template |
	template := MustacheTemplate on: '1 = {{ one }}, 2 = {{ two }}, and so on'.
self assert: template export equals: '1 = {{one}}, 2 = {{two}}, and so on'
]

{ #category : #tests }
MustacheTests >> testHTMLEscapedToken [
	| template result |
	template := MustacheTemplate on: 'This is a test for {{ name }}.'.
	result := template value: { 'name' -> '&' } asDictionary .
	self assert: result = 'This is a test for &amp;.'.
	
]

{ #category : #tests }
MustacheTests >> testHTMLMenuExample [
	| template result |
	template := MustacheTemplate on: '<ul>
	{{#entries}}<li class="menuEntry{{#active}} active{{/active}}">{{label}}</li>
	{{/entries}}
</ul>' .
	result := template 
		value: { 'entries' -> {   
			{ 'label' -> 'first' } asDictionary. 
			{ 'label' -> 'second' . 'active' -> true } asDictionary.
			{ 'label' -> 'third' } asDictionary } } asDictionary.
	self assert: result = '<ul>
	<li class="menuEntry">first</li>
	<li class="menuEntry active">second</li>
	<li class="menuEntry">third</li>
	
</ul>' 
]

{ #category : #tests }
MustacheTests >> testInvertedSectionWithEmptyListContext [
	| template result |
	template := MustacheTemplate on: 'list{{^ list }} is {{/ list}}displayed'.
	result := template value: { 
		'list' -> { }
	} asDictionary.
	self assert: result = 'list is displayed' 
]

{ #category : #tests }
MustacheTests >> testInvertedSectionWithFalseContext [
	| template result |
	template := MustacheTemplate on: 'list{{^ list }} is {{/ list}}displayed'.
	result := template value: { 
		'list' -> false
	} asDictionary.
	self assert: result = 'list is displayed' 
]

{ #category : #tests }
MustacheTests >> testInvertedSectionWithNonEmptyListContext [
	| template result |
	template := MustacheTemplate on: 'list{{^ list }} is {{/ list}}displayed'.
	result := template value: { 
		'list' -> { 1 }
	} asDictionary.
	self assert: result = 'listdisplayed' 
]

{ #category : #tests }
MustacheTests >> testInvertedSectionWithTrueContext [
	| template result |
	template := MustacheTemplate on: 'list{{^ list }} is {{/ list}}displayed'.
	result := template value: { 
		'list' -> false
	} asDictionary.
	self assert: result = 'list is displayed' 
]

{ #category : #tests }
MustacheTests >> testMultipleTokens [
	| template result |
	template := MustacheTemplate on: '1 = {{ one }}, 2 = {{ two }}, and so on'.
	result := template value: { 'one' -> 1 . 'two' -> 2 } asDictionary .
	self assert: result = '1 = 1, 2 = 2, and so on' 
	
]

{ #category : #tests }
MustacheTests >> testObject [
	| template result |
	template := MustacheTemplate on: '{{#stream}}Class: {{class}}, Position: {{position}}, Next: {{next}}, Position: {{position}}{{/stream}}' .
	result := template 
		value: { 'stream' -> 'Hello' readStream } asDictionary.
	self assert: result = 'Class: ReadStream, Position: 0, Next: H, Position: 1' 
]

{ #category : #tests }
MustacheTests >> testObjectNoSection [
	| template result |
	template := MustacheTemplate on: 'Class: {{stream.class}}, Position: {{stream.position}}, Next: {{stream.next}}, Position: {{stream.position}}' .
	result := template 
		value: { 'stream' -> 'Hello' readStream } asDictionary.
	self assert: result = 'Class: ReadStream, Position: 0, Next: H, Position: 1' 
]

{ #category : #tests }
MustacheTests >> testObjectNoSectionBreakingDemeterLaw [
	| template result |
	template := MustacheTemplate on: '{{stream.class.name.first.lowercase}}' .
	result := template 
		value: { 'stream' -> 'Hello' readStream } asDictionary.
	self assert: result = 'r' 
]

{ #category : #tests }
MustacheTests >> testPartialAsString [
	| template result |
	template := 'This is a test for {{> partial }} .' asMustacheTemplate.
	result := template 
		value: { 'name' -> 'partial template' } asDictionary
		partials: { 'partial' ->  '{{name}} rendering' } asDictionary.
	self assert: result = 'This is a test for partial template rendering .'
]

{ #category : #tests }
MustacheTests >> testPartialListContext [
	| template result |
	template := MustacheTemplate on: 'We can have a lists ({{# list}} [ {{> partial }} ] {{/ list}}) .'.
	result := template 
		value: { 'list' -> {
			{ 'name' -> 'first list' } asDictionary.
			{ 'name' -> 'last list' } asDictionary  } } asDictionary
		partials: (Dictionary new
			at: 'partial' put: (MustacheTemplate on: 'including {{name}} item');
			yourself) .
	self assert: result = 'We can have a lists ( [ including first list item ]  [ including last list item ] ) .' 
]

{ #category : #tests }
MustacheTests >> testPartialObjectContext [
	| template result |
	template := MustacheTemplate on: 'This is a test for {{> partial }} .'.
	result := template 
		value: { 'name' -> 'partial template' } asDictionary
		partials: (Dictionary new
			at: 'partial' put: (MustacheTemplate on: '{{name}} rendering');
			yourself) .
	self assert: result = 'This is a test for partial template rendering .'
]

{ #category : #tests }
MustacheTests >> testSectionWithDotAsTokenListValue [
	| template result |
	template := MustacheTemplate on: '{{# list }}<{{ . }}>{{/ list}}'.
	result := template value: { 
		'list' -> #( a b c )
	} asDictionary.
	self assert: result = '<a><b><c>' 
]

{ #category : #tests }
MustacheTests >> testSectionWithDotAsTokenStringValue [
	| template result |
	template := MustacheTemplate on: '{{# list }}<{{ . }}>{{/ list}}'.
	result := template value: { 
		'list' -> 'abc'
	} asDictionary.
	self assert: result = '<abc>' 
]

{ #category : #tests }
MustacheTests >> testSectionWithEmptyListContext [
	| template result |
	template := MustacheTemplate on: 'list {{# list }}{{  label }} {{/ list}}trailer'.
	result := template value: { 
		'list' -> {  
		}} asDictionary.
	self assert: result = 'list trailer' 
]

{ #category : #tests }
MustacheTests >> testSectionWithFalseContext [
	| template result |
	template := MustacheTemplate on: 'list{{# list }} is {{/ list}}displayed'.
	result := template value: { 
		'list' -> false
	} asDictionary.
	self assert: result = 'listdisplayed' 
]

{ #category : #tests }
MustacheTests >> testSectionWithNonEmptyListContext [
	| template result |
	template := MustacheTemplate on: 'list {{# list }}{{  label }} {{/ list}}trailer'.
	result := template value: { 
		'list' -> {  
			{ 'label' -> 'has 2' } asDictionary.
			{ 'label' -> 'elements'} asDictionary 
		}} asDictionary.
	self assert: result = 'list has 2 elements trailer' 
]

{ #category : #tests }
MustacheTests >> testSectionWithStringContextUsingDot [
	| template result |
	template := MustacheTemplate on: '{{#list}}before {{.}} after{{/list}}'.
	result := template value: { 
		'list' -> 'list'
	} asDictionary.
	self assert: result = 'before list after' 
]

{ #category : #tests }
MustacheTests >> testSectionWithTrueContext [
	| template result |
	template := MustacheTemplate on: 'list{{# list }} is {{/ list}}displayed'.
	result := template value: { 
		'list' -> true
	} asDictionary.
	self assert: result = 'list is displayed' 
]

{ #category : #tests }
MustacheTests >> testSetDelimiter [
	| template result |
	template := MustacheTemplate on: '* {{default_tags}} {{=<% %>=}} * <%erb_style_tags%> <%={{ }}=%> * {{default_tags_again}} *'.
	result := template value: (Array with: 'default_tags' -> '1' with: 'erb_style_tags' -> '2' with: 'default_tags_again' -> '3') asDictionary .
	self assert: result = '* 1  * 2  * 3 *'.
]

{ #category : #tests }
MustacheTests >> testSingleToken [
	| template result |
	template := MustacheTemplate on: 'This is a test for {{ name }}.'.
	result := template value: { 'name' -> 'simpletoken' } asDictionary .
	self assert: result = 'This is a test for simpletoken.' 
	
]

{ #category : #tests }
MustacheTests >> testSingleTokenBegin [
	| template result |
	template := MustacheTemplate on: '{{ name }} test it is.'.
	result := template value: { 'name' -> 'simpletoken' } asDictionary .
	self assert: result = 'simpletoken test it is.' 
	
]

{ #category : #tests }
MustacheTests >> testSingleTokenEnd [
	| template result |
	template := MustacheTemplate on: 'test for {{ name }}'.
	result := template value: { 'name' -> 'simpletoken' } asDictionary .
	self assert: result = 'test for simpletoken' 
	
]

{ #category : #tests }
MustacheTests >> testSingleTokenNoneExisting [
	| template result |
	template := MustacheTemplate on: 'This is a test for {{ name }}.'.
	result := template value: { 'noname' -> 'simpletoken' } asDictionary .
	self assert: result = 'This is a test for .' 
	
]

{ #category : #tests }
MustacheTests >> testSingleTokenUndefinedValue [
	| template result |
	template := MustacheTemplate on: 'This is a test for {{ name }}.'.
	result := template value: { 'name' -> nil } asDictionary .
	self assert: result = 'This is a test for .' 
	
]

{ #category : #tests }
MustacheTests >> testTemplateFromFile [
	| file template result |
	file := FileSystem memory root / 'file'.
	file writeStreamDo: [ :stream | stream nextPutAll: '12{{i}}4' ].
	template := file asMustacheTemplate.
	result := template value: { 'i' -> '3' } asDictionary .
	self assert: result asString equals: '1234' 
]

{ #category : #tests }
MustacheTests >> testTemplateFromFileWithBlock [
	| file result |
	file := FileSystem memory root / 'file'.
	file writeStreamDo: [ :stream | stream nextPutAll: '12{{i}}4' ].
	file mustacheTemplateDuring: [ :template | result := template value: {('i' -> '3')} asDictionary ].
	self assert: result asString equals: '1234'
]

{ #category : #tests }
MustacheTests >> testUnescapedToken [
	| template result |
	template := MustacheTemplate on: 'This is a test for {{& name }}.'.
	result := template value: { 'name' -> '&' } asDictionary .
	self assert: result = 'This is a test for &.'.
	
]
