versions
version046: spec
	<version: '0.46' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '0.46 : Provide AbstractFileReference>>asMustacheTemplate and AbstractFileReference>>mustacheTemplateDuring:'.
		spec author: 'DamienCassou'.
		spec timestamp: '27/11/2013 18:14'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-DamienCassou.17';
			package: 'Mustache-Tests' with: 'Mustache-Tests-DamienCassou.7'. ].
