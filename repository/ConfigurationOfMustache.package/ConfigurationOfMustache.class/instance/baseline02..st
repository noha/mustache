baselines
baseline02: spec
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/NorbertHartl/Mustache/main'.
		spec project: 'JSON' with: [
				spec
					className: #ConfigurationOfJSON;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/JSON/main/' ].
		spec 
			package: 'Mustache-Core';
			package: 'Mustache-Tests' with: [
				spec requires: #('Mustache-Core' ). ];
			package: #'Mustache-Cli'.
		spec 
			group: 'default' with: #('Core' 'Tests' #'Mustache-Cli' );
			group: 'Tests' with: #('Mustache-Tests' );
			group: 'Core' with: #('Mustache-Core' ). ].
