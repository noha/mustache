baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/NorbertHartl/Mustache/main'.
		spec 
			package: 'Mustache-Core';
			package: 'Mustache-Tests' with: [
				spec requires: #('Mustache-Core' ). ].
		spec 
			group: 'default' with: #('Core' 'Tests' );
			group: 'Core' with: #('Mustache-Core' );
			group: 'Tests' with: #('Mustache-Tests' ). ].
