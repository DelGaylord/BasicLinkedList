"
I am Node, the elementary part of a BasicLinkedList.

I hold a value and a link to my successor (next) which can be nil.
"
Class {
	#name : #Node,
	#superclass : #Object,
	#instVars : [
		'value',
		'next'
	],
	#category : #BasicLinkedListImp
}

{ #category : #accessing }
Node class >> value: aData [
	^ self new value: aData
]

{ #category : #accessing }
Node >> hasNext [
	^ next notNil
]

{ #category : #accessing }
Node >> hasValue [
	^ value notNil
]

{ #category : #accessing }
Node >> next [
	^ next
]

{ #category : #accessing }
Node >> next: aNode [
	next := aNode
]

{ #category : #accessing }
Node >> value [
	^ value
]

{ #category : #accessing }
Node >> value: aValue [
	value := aValue
]
