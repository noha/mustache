versions
version072: spec
	<version: '0.72' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'Added support for dot (.) selectors. Sections and values can use dot to select current object in context. This supports e.g. using collections containing plain strings'.
		spec author: 'NorbertHartl'.
		spec timestamp: '9/19/2015 16:21'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.31';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.16'. ].
