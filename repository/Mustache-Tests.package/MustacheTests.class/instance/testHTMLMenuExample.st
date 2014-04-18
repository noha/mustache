tests
testHTMLMenuExample
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