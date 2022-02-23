"
I am BasicLinkedList, an ordered list data structure consisting of Node connected to each other by knowing who is after.

I can hold multiple Node and act like any other collection. I only hold Node and not any other object.

An example of creating an instance and adding a Node :
  | l n |
  l := BasicLinkedList new.
  n := Node new value: 1.
  l add: n.
"
Class {
	#name : #BasicLinkedList,
	#superclass : #Object,
	#instVars : [
		'head',
		'tail'
	],
	#category : #BasicLinkedListImp
}

{ #category : #adding }
BasicLinkedList >> add: aNode [
	"Add aNode at the end of me."
	^ self addLast: aNode
]

{ #category : #adding }
BasicLinkedList >> add: aNode at: anInteger [
	"Add aNode at the given position."
	| n s |
	head ifNil: [ EmptyListException signal ].
	s := self size.
	s = anInteger
	  ifTrue: [ ^ self addLast: aNode ].
	n := head.
	anInteger - 2 timesRepeat: [ n ifNil: [ OutOfBoundException signal ]. n := n next ].
	aNode next: n next.
	n next: aNode.
	^ aNode
]

{ #category : #adding }
BasicLinkedList >> addAll: aCollection [
	"Add all the node of the collection at the end of me."
	aCollection do: [ :each | self add: each ]
]

{ #category : #adding }
BasicLinkedList >> addFirst: aNode [
	"Add aNode at the beginning of me."
	head ifNotNil: [ aNode next: head . head := aNode ].
	head ifNil: [ head := aNode ]
]

{ #category : #adding }
BasicLinkedList >> addLast: aNode [
	"Add aNode at the end of me."
	tail ifNotNil: [ tail next: aNode. tail := aNode ].
	head ifNotNil: [tail ifNil: [ head next: aNode. tail := aNode ]].
	head ifNil: [ head := aNode ]
]

{ #category : #removing }
BasicLinkedList >> delAll [
	"Delete all the node of me."
	head := nil.
	tail := nil.
]

{ #category : #removing }
BasicLinkedList >> delAt: anInteger [
	"Delete aNode at given position of me."
	| n s |
	head ifNil: [ EmptyListException signal ].
	s := self size.
	s = anInteger ifTrue: [ 
		n := self get: s - 1.
		n next: nil.
		^ self tail: n ].
	n := head.
	anInteger - 2 timesRepeat: [ 
		n ifNil: [ OutOfBoundException signal ].
		n := n next ].
	n next ifNil: [ OutOfBoundException signal ].
	n next next ifNil: [ OutOfBoundException signal ].
	n next: n next next
]

{ #category : #removing }
BasicLinkedList >> delFirst [
	"Delete the first node of me."
	| s |
	head ifNil: [ EmptyListException signal ].
	tail ifNil: [head ifNotNil: [ head := nil ]].
	s := self size.
	s = 2
		ifTrue: [ head := tail. tail := nil ].
	head := head next
]

{ #category : #removing }
BasicLinkedList >> delLast [
	"Delete the last node of me."
	| s n |
	head ifNil: [ EmptyListException signal ].
	tail ifNil: [head ifNotNil: [ head := nil ]].
	s := self size.
	s = 2
		ifTrue: [ head next: nil. tail := nil ].
	n := self get: (s - 1).
	n next: nil.
	tail := n. 
]

{ #category : #enumerating }
BasicLinkedList >> forAll: aBlock [
	"Execute a block for all the node i contains."
	| node |
	head ifNil: [ EmptyListException signal ].
	node := self head.
	[ node notNil ] whileTrue:
	[ aBlock value: node . node := node next ].
]

{ #category : #accessing }
BasicLinkedList >> get: anInteger [
	"Give the node at the given position of me."
	| n s |
	head ifNil: [ EmptyListException signal ].
	n := head.
	s := self size.
	s = anInteger
	  ifTrue: [ ^ tail ].
	anInteger -1 timesRepeat: [ n ifNil: [ OutOfBoundException signal ]. n := n next ].
	^ n
]

{ #category : #accessing }
BasicLinkedList >> getN: aNode [
	"Give the node asked of me."
	| n |
	head ifNil: [ EmptyListException signal ].
	n := head.
	  [ n isNil ] whileFalse: [ ( n = aNode) ifTrue: [^ n] ifFalse: [ n := n next ]].
]

{ #category : #accessing }
BasicLinkedList >> head [
	^ head
]

{ #category : #accessing }
BasicLinkedList >> head: aNode [
	head := aNode
]

{ #category : #enumerating }
BasicLinkedList >> reject: aBlock [
	"Create a new BasicLinkedList with all the node which return false for the block given."
	| list node |
	list := self class new.
	self forAll: [ :each | (aBlock value: each) 
		ifFalse: [ list add: (node := Node value: each value) ] ].
	^ list
]

{ #category : #enumerating }
BasicLinkedList >> select: aBlock [
	"Create a new BasicLinkedList with all the node which return true for the block given."
	| list node |
	list := self class new.
	self forAll: [ :each | (aBlock value: each) 
		ifTrue: [ list add: (node := Node value: each value) ] ].
	^ list
]

{ #category : #accessing }
BasicLinkedList >> size [
	"Return the size of the BasicLinkedList."
	| n i |
	head ifNil: [ ^ 0 ].
	tail ifNil: [ ^ 1 ].
	n := head.
	i := 1.
	[ n next notNil ] whileTrue: [ n := n next. i := i + 1 ].
	^ i
]

{ #category : #accessing }
BasicLinkedList >> tail [
	^ tail
]

{ #category : #accessing }
BasicLinkedList >> tail: aNode [
	tail := aNode
]
