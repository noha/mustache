versions
version060: spec 
        <version: '0.60' imports: #('0.1-baseline')>

        spec for: #common do: [
                spec blessing: #release.
			spec package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.23'.
			spec package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.12'.
                ].