versions
version049: spec
	<version: '0.49' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: ''.
		spec author: 'NorbertHartl'.
		spec timestamp: '2/25/2014 16:16'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.20';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.8'. ].
