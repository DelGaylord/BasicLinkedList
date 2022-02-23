Class {
	#name : #BasicLinkedListTest,
	#superclass : #TestCase,
	#category : #BasicLinkedListImp
}

{ #category : #tests }
BasicLinkedListTest >> testAddACollectionOfNodes [
	| l c n1 n2 n3 |
	l := BasicLinkedList new.
	n1 := Node new value: 1.
	n2 := Node new value: 2.
	n3 := Node new value: 3.
	c := OrderedCollection new.
	c add: n1.
	c add: n2.
	c add: n3.
	l addAll: c.
	self assert: l head equals: n1.
	self assert: l tail equals: n3
]

{ #category : #tests }
BasicLinkedListTest >> testAddANodeAtTheBeginningOfAList [
	| l n1 n2 n3 |
	n1 := Node new value: 1.
	n2 := Node new value: 2.
	n3 := Node new value: 3.
	l := BasicLinkedList new head: n1;
								   tail: n2.
	l addFirst: n3.
	self assert: l head equals: n3
]

{ #category : #tests }
BasicLinkedListTest >> testAddANodeAtTheSecondPositionOfAListOfThree [
	| l n1 n2 n3 n4 n |
	n1 := Node value: 1.
	n2 := Node value: 2.
	n3 := Node value: 3.
	n4 := Node value: 4.
	l := BasicLinkedList new.
	l add: n1.
	l add: n2.
	l add: n3.
	l add: n4 at: 2.
	n := l get: 2.
	self assert: n equals: n4
]

{ #category : #tests }
BasicLinkedListTest >> testAddANodeToAEmptyList [
	| l n1 |
	l := BasicLinkedList new.
	n1 := Node value: 1.
	l add: n1.
	self assert: l head equals: n1
]

{ #category : #tests }
BasicLinkedListTest >> testAddANodeToANoneEmptyList [
	| l n1 n2 |
	n1 := Node value: 1.
	n2 := Node value: 2.
	l := BasicLinkedList new head: n1.
	l add: n2.
	self assert: l head next equals: n2
]

{ #category : #tests }
BasicLinkedListTest >> testDelANodeAtTheSecondPositionOfAListOfThree [
	| l n1 n2 n3 s |
	n1 := Node value: 1.
	n2 := Node value: 2.
	n3 := Node value: 3.
	l := BasicLinkedList new.
	l add: n1.
	l add: n2.
	l add: n3.
	l delAt: 2.
	s := l size.
	self assert: s equals: 2
]

{ #category : #tests }
BasicLinkedListTest >> testDelANodeAtTheThirdPositionOfAListOfTwo [
	| l n1 n2 |
	n1 := Node value: 1.
	n2 := Node value: 2.
	l := BasicLinkedList new.
	l add: n1.
	l add: n2.
	self 
	should: [l delAt: 3]
	raise: OutOfBoundException 
]

{ #category : #tests }
BasicLinkedListTest >> testDelAllTheNode [
	| l n1 n2 n3 s |
	n1 := Node value: 1.
	n2 := Node value: 2.
	n3 := Node value: 3.
	l := BasicLinkedList new.
	l add: n1.
	l add: n2.
	l add: n3.
	l delAll.
	s := l size.
	self assert: s equals: 0
]

{ #category : #tests }
BasicLinkedListTest >> testDelTheFirstNode [
	| l n1 n2 n3 s |
	n1 := Node value: 1.
	n2 := Node value: 2.
	n3 := Node value: 3.
	l := BasicLinkedList new.
	l add: n1.
	l add: n2.
	l add: n3.
	l delFirst.
	s := l size.
	self assert: s equals: 2
]

{ #category : #tests }
BasicLinkedListTest >> testDelTheLastNode [
	| l n1 n2 n3 s |
	n1 := Node value: 1.
	n2 := Node value: 2.
	n3 := Node value: 3.
	l := BasicLinkedList new.
	l add: n1.
	l add: n2.
	l add: n3.
	l delLast.
	s := l size.
	self assert: s equals: 2
]

{ #category : #tests }
BasicLinkedListTest >> testDoABlockForAllNodes [
	| l n1 n2 n3 |
	l := BasicLinkedList new.
	n1 := Node value: 1.
	n2 := Node value: 2.
	n3 := Node value: 3.
	l add: n1.
	l add: n2.
	l add: n3.
	l forAll: [ :x | x value: (x value + 1) ].
	self assert: (l getN: n1) value equals: 2.
	self assert: (l getN: n2) value equals: 3.
	self assert: (l getN: n3) value equals: 4
]

{ #category : #tests }
BasicLinkedListTest >> testGetTheNodeAtThePositionTwo [
	| l n1 n2 n3 n |
	n1 := Node value: 1.
	n2 := Node value: 2.
	n3 := Node value: 3.
	l := BasicLinkedList new.
	l add: n1.
	l add: n2.
	l add: n3.
	n := l get: 2.
	self assert: n equals: n2
]

{ #category : #tests }
BasicLinkedListTest >> testGetTheNodeAtThePositionTwoOnAEmptyList [
	| l n |
	l := BasicLinkedList new.
	self 
	should: [ n := l get: 2 ]
	raise: EmptyListException
]

{ #category : #tests }
BasicLinkedListTest >> testInitializeABasicLinkedList [
	| l |
	l := BasicLinkedList new.
	self assert: l class equals: BasicLinkedList 
]

{ #category : #tests }
BasicLinkedListTest >> testSelectAllNodesWhichValueIsMoreThanThree [
	| l l2 n1 n2 n3 n4 n5 |
	l := BasicLinkedList new.
	l2 := BasicLinkedList new.
	n1 := Node value: 1.
	n2 := Node value: 2.
	n3 := Node value: 3.
	n4 := Node value: 4.
	n5 := Node value: 5.
	l add: n1.
	l add: n2.
	l add: n3.
	l add: n4.
	l add: n5.
	l2 := l select: [ :x | x value > 3 ].
	self assert: l2 size equals: 2.
]

{ #category : #tests }
BasicLinkedListTest >> testSelectAllNodesWhichValueIsNotMoreThanThree [
	| l l2 n1 n2 n3 n4 n5 |
	l := BasicLinkedList new.
	l2 := BasicLinkedList new.
	n1 := Node value: 1.
	n2 := Node value: 2.
	n3 := Node value: 3.
	n4 := Node value: 4.
	n5 := Node value: 5.
	l add: n1.
	l add: n2.
	l add: n3.
	l add: n4.
	l add: n5.
	l2 := l reject: [ :x | x value > 3 ].
	self assert: l2 size equals: 3.
]

{ #category : #tests }
BasicLinkedListTest >> testSizeOfAListOfFourIsFour [
	| l n1 n2 n3 n4 s |
	n1 := Node value: 1.
	n2 := Node value: 2.
	n3 := Node value: 3.
	n4 := Node value: 4.
	l := BasicLinkedList new.
	l add: n1.
	l add: n2.
	l add: n3.
	l add: n4.
	s := l size.
	self assert: s equals: 4
]
