"
I represent a Process. 

    Instance Variables
	dataObjects:		Array of DataObjects
	flowElementList:		List of all elements that are part of the flow.
	initialFlowElement:		Initial flow element. Usually a StartEvent.
	managementName:		Name of the corresponding management.
	name:		Process name.
	processInstanceId:		Instance id of the process.
	variables:		Additional variables.


    Implementation Points
"
Class {
	#name : #NWProcess,
	#superclass : #NWElement,
	#instVars : [
		'name',
		'initialFlowElement'
	],
	#category : #'NewWave-Core-Core'
}

{ #category : #'as yet unclassified' }
NWProcess class >> id: anId name: aName initialFlowElement: anElement [
	^ self new 
		id: anId;
		name: aName;
		initialFlowElement: anElement;
		yourself
]

{ #category : #accessing }
NWProcess >> initialFlowElement [
	^ initialFlowElement
]

{ #category : #accessing }
NWProcess >> initialFlowElement: anObject [
	initialFlowElement := anObject
]

{ #category : #accessing }
NWProcess >> name [
	^ name
]

{ #category : #accessing }
NWProcess >> name: anObject [
	name := anObject
]
