visiting
visitSection: aSection 

	self addString: '{{#' ; addString: aSection selector; addString: '}}'.
	self visitCompositePart: aSection.
	 self addString: '{{/'; addString: aSection selector;addString:'}}' .