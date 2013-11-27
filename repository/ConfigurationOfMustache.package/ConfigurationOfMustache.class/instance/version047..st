versions
version047: spec
	<version: '0.47' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '0.47 : Previous didn''t load in Pharo 2.0'.
		spec author: 'DamienCassou'.
		spec timestamp: '27/11/2013 18:23'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-DamienCassou.18';
			package: 'Mustache-Tests' with: 'Mustache-Tests-DamienCassou.7'. ].
