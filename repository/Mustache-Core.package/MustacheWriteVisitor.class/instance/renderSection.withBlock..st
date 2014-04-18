rendering
renderSection: aSection withBlock: aBlock
	"generate a render continuation block and hand it over to block
	in the template. Return value will be a string that add as a whole
	to the local string stack"
	self addString: (aBlock value: [ 
		self class new 
			context: context;
			visitCompositePart: aSection;
			string ]) 