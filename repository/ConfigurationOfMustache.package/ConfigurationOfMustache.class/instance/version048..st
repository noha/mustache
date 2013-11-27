versions
version048: spec
	<version: '0.48' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '0.48 : Fix for Pharo 2.0'.
		spec author: 'DamienCassou'.
		spec timestamp: '27/11/2013 18:31'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-DamienCassou.19';
			package: 'Mustache-Tests' with: 'Mustache-Tests-DamienCassou.7'. ].
