accessing
string
	^ String 
		new: ( strings sum: #size ) 
		streamContents: [ :stream|
			strings do: [ :string| 
				stream nextPutAll: string ] ]