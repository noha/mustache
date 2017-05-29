versions
version074: spec
	<version: '0.74' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.74'.
		spec author: 'NorbertHartl'.
		spec timestamp: '5/29/2017 23:56'.
		spec project: 'JSON' with: '1.2'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.33';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.18';
			package: #'Mustache-Cli' with: 'Mustache-Cli-ThibaultArloing.5'. ].
