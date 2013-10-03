versions
version045: spec
	<version: '0.45' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.44 : comments added and code critics'.
		spec author: 'NorbertHartl'.
		spec timestamp: '10/3/2013 21:50'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.16';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.6'. ].
