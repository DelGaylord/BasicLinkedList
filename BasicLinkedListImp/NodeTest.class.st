Class {
	#name : #NodeTest,
	#superclass : #TestCase,
	#category : #BasicLinkedListImp
}

{ #category : #tests }
NodeTest >> testAddingANodeToAnotherNode [
	| n1 n2 |
	n1 := Node new value: 1.
	n2 := Node new value: 2.
	n1 next: n2.
	self assert: n1 next equals: n2.
]
