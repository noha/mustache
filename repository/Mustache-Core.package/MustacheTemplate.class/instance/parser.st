accessing
parser
	^ parser ifNil: [ 
		parser := (MustacheParser on: stream)
			push: self  ]