*mustache-core
mustacheDo: aBlock
	"as strings are collections we need to prevent it from iterating
	over all of the characters. Invoke the block with self instead"
	aBlock value: self 