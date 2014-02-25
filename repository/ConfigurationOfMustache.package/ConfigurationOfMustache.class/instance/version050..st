versions
version050: spec
	<version: '0.50' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'Old change delimiter test was testing the broken behavior correct'.
		spec author: 'NorbertHartl'.
		spec timestamp: '2/25/2014 16:38'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.20';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.9'. ].
