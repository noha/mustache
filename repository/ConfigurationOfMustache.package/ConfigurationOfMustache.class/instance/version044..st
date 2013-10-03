versions
version044: spec
	<version: '0.44' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.43 : release on smalltalkhub'.
		spec author: 'NorbertHartl'.
		spec timestamp: '10/3/2013 21:38'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.15';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.6'. ].
