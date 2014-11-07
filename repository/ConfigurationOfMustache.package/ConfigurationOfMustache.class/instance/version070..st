versions
version070: spec 
        <version: '0.70' imports: #('0.1-baseline')>

        spec for: #common do: [
                spec blessing: #release.
			spec package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.25'.
			spec package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.15'.
                ].