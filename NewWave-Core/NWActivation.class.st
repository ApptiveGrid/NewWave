Class {
	#name : #NWActivation,
	#superclass : #Object,
	#instVars : [
		'node',
		'executor',
		'properties',
		'state'
	],
	#category : #'NewWave-Core-Engine'
}

{ #category : #'as yet unclassified' }
NWActivation class >> node: aNode executor: anExecutor [

^ self new 
	node: aNode;
	executor: anExecutor;
	state: #initialized;
	yourself
]

{ #category : #accessing }
NWActivation >> executor [
	^ executor
]

{ #category : #accessing }
NWActivation >> executor: anExecutor [
	executor := anExecutor
]

{ #category : #accessing }
NWActivation >> initialize [ 
	super initialize.
	properties := Dictionary new.
]

{ #category : #accessing }
NWActivation >> isActivated [
	^ state = #activated
]

{ #category : #accessing }
NWActivation >> isCompleted [
	^ state = #completed
]

{ #category : #accessing }
NWActivation >> node [ 
	^ node
]

{ #category : #accessing }
NWActivation >> node: aNode [
	node := aNode
]

{ #category : #accessing }
NWActivation >> printOn: aStream [
	"super printOn: aStream."
	aStream
		nextPutAll: 'Act(';
		nextPutAll: self node description;
		nextPutAll: ')'.
]

{ #category : #accessing }
NWActivation >> properties [
	^ properties
]

{ #category : #accessing }
NWActivation >> state [ 
	^ state
]

{ #category : #accessing }
NWActivation >> state: aState [
	state := aState
]
