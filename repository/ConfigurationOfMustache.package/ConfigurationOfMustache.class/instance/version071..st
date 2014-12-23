versions
version071: spec
	<version: '0.71' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.71'.
		spec author: 'NorbertHartl'.
		spec timestamp: '12/23/2014 15:16'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.26';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.15'. ].
