A MustacheTemplate is the main class to interact when dealing with mustache templates.

A MustacheTemplate can be created from a string containing mustache template markup either with

MustacheTemplate on: aString

or

aString asMustacheTemplate 

To fill out a template just provide a context object and do

aMustacheTemplate value: aContextObject 

Nested templates can be used be providing a dictionary with keys as the names used in the master template and values being individual mustache templates