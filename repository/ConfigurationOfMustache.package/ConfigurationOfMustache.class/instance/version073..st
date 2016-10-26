versions
version073: spec
	<version: '0.73' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.73 fixed bug when string is context and evaluation is using dot'.
		spec author: 'NorbertHartl'.
		spec timestamp: '10/26/2016 15:37'.
		spec project: 'JSON' with: '1.2'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.32';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.17';
			package: #'Mustache-Cli' with: 'Mustache-Cli-ThibaultArloing.5'. ].
