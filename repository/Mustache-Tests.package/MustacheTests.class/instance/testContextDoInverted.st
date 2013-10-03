tests
testContextDoInverted
	| called block |
	called := 0.
	block := [ :el |called := called + 1 ].
	
	false mustacheDo:  block inverted: true.
	self assert: called = 1.
	
	called := 0.
	true mustacheDo:  block inverted: true.
	self assert: called = 0.
	
	called := 0.
	nil mustacheDo:  block inverted: true.
	self assert: called = 1.
	
	called := 0.
	Object new mustacheDo:  block inverted: true.
	self assert: called = 0.
	
	called := 0.
	#() mustacheDo:  block inverted: true.
	self assert: called = 1.
	
	called := 0.
	#(1 2 3) mustacheDo:  block inverted: true.
	self assert: called = 0.
