Class {
	#name : #ConfigurationOfMustache,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfMustache'
}

{ #category : #'development support' }
ConfigurationOfMustache class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfMustache class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfMustache class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfMustache class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfMustache class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfMustache class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfMustache class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfMustache class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfMustache class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfMustache class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfMustache >> baseline01: spec [
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

]

{ #category : #baselines }
ConfigurationOfMustache >> baseline02: spec [
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/NorbertHartl/Mustache/main'.
		spec project: 'JSON' with: [
				spec
					className: #ConfigurationOfJSON;
					versionString: #'stable';
					loads: #('default' );
					repository: 'http://smalltalkhub.com/mc/PharoExtras/JSON/main/' ].
		spec 
			package: 'Mustache-Core';
			package: 'Mustache-Tests' with: [
				spec requires: #('Mustache-Core' ). ];
			package: #'Mustache-Cli' with: [
				spec requires: #('JSON' ). ].
		spec 
			group: 'Core' with: #('Mustache-Core' );
			group: 'Tests' with: #('Mustache-Tests' );
			group: 'default' with: #('Core' 'Tests' #'Mustache-Cli' ). ].

]

{ #category : #'symbolic versions' }
ConfigurationOfMustache >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.2-baseline'.

]

{ #category : #accessing }
ConfigurationOfMustache >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfMustache >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '0.74'.

]

{ #category : #versions }
ConfigurationOfMustache >> version043: spec [
	<version: '0.43' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.42 : last preparations for releasing
0.43 : release on smalltalkhub'.
		spec author: 'NorbertHartl'.
		spec timestamp: '10/3/2013 21:38'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.15';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.6'. ].

]

{ #category : #versions }
ConfigurationOfMustache >> version044: spec [
	<version: '0.44' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.43 : release on smalltalkhub
0.44 : comments added and code critics'.
		spec author: 'NorbertHartl'.
		spec timestamp: '10/3/2013 21:50'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.16';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.6'. ].

]

{ #category : #versions }
ConfigurationOfMustache >> version045: spec [
	<version: '0.45' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '0.45 : comments added and code critics'.
		spec author: 'NorbertHartl'.
		spec timestamp: '10/3/2013 21:50'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.16';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.6'. ].

]

{ #category : #versions }
ConfigurationOfMustache >> version046: spec [
	<version: '0.46' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '0.46 : Provide AbstractFileReference>>asMustacheTemplate and AbstractFileReference>>mustacheTemplateDuring:'.
		spec author: 'DamienCassou'.
		spec timestamp: '27/11/2013 18:14'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-DamienCassou.17';
			package: 'Mustache-Tests' with: 'Mustache-Tests-DamienCassou.7'. ].

]

{ #category : #versions }
ConfigurationOfMustache >> version047: spec [
	<version: '0.47' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '0.47 : Previous didn''t load in Pharo 2.0'.
		spec author: 'DamienCassou'.
		spec timestamp: '27/11/2013 18:23'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-DamienCassou.18';
			package: 'Mustache-Tests' with: 'Mustache-Tests-DamienCassou.7'. ].

]

{ #category : #versions }
ConfigurationOfMustache >> version048: spec [
	<version: '0.48' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '0.48 : Fix for Pharo 2.0'.
		spec author: 'DamienCassou'.
		spec timestamp: '27/11/2013 18:31'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-DamienCassou.19';
			package: 'Mustache-Tests' with: 'Mustache-Tests-DamienCassou.7'. ].

]

{ #category : #versions }
ConfigurationOfMustache >> version049: spec [
	<version: '0.49' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: ''.
		spec author: 'NorbertHartl'.
		spec timestamp: '2/25/2014 16:16'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.20';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.8'. ].

]

{ #category : #versions }
ConfigurationOfMustache >> version050: spec [
	<version: '0.50' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'Old change delimiter test was testing the broken behavior correct'.
		spec author: 'NorbertHartl'.
		spec timestamp: '2/25/2014 16:38'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.20';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.9'. ].

]

{ #category : #versions }
ConfigurationOfMustache >> version060: spec [ 
        <version: '0.60' imports: #('0.1-baseline')>

        spec for: #common do: [
                spec blessing: #release.
			spec package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.23'.
			spec package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.12'.
                ].
]

{ #category : #versions }
ConfigurationOfMustache >> version070: spec [ 
        <version: '0.70' imports: #('0.1-baseline')>

        spec for: #common do: [
                spec blessing: #release.
			spec package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.25'.
			spec package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.15'.
                ].
]

{ #category : #versions }
ConfigurationOfMustache >> version071: spec [
	<version: '0.71' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.71'.
		spec author: 'NorbertHartl'.
		spec timestamp: '12/23/2014 15:16'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.26';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.15'. ].

]

{ #category : #versions }
ConfigurationOfMustache >> version072: spec [
	<version: '0.72' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'Added support for dot (.) selectors. Sections and values can use dot to select current object in context. This supports e.g. using collections containing plain strings'.
		spec author: 'NorbertHartl'.
		spec timestamp: '9/19/2015 16:21'.
		spec 
			package: 'Mustache-Core' with: 'Mustache-Core-NorbertHartl.31';
			package: 'Mustache-Tests' with: 'Mustache-Tests-NorbertHartl.16'. ].

]

{ #category : #versions }
ConfigurationOfMustache >> version073: spec [
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

]

{ #category : #versions }
ConfigurationOfMustache >> version074: spec [
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

]
