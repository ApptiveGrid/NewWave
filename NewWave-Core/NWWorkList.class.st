Class {
	#name : #NWWorkList,
	#superclass : #Object,
	#instVars : [
		'running'
	],
	#category : #'NewWave-Core-Engine'
}

{ #category : #adding }
NWWorkList >> addToCompleted: activation [
	activation state: #completed
]

{ #category : #adding }
NWWorkList >> addToRunning: activation [
	"Proveriti da li je vec aktivacija pocela, ako je pocela podigni error"
	"running add: activation"
	activation state: #activated.
	running indexOf: activation ifAbsent: [ running add: activation ].
	"Treba zabaleziti za istoriju.... noteRunOf: anActivation in: self"
	
]

{ #category : #adding }
NWWorkList >> completed [
	^ running select: [ :each | each isCompleted ]
]

{ #category : #adding }
NWWorkList >> initialize [ 
	super initialize.
	running := OrderedCollection new.
]

{ #category : #printing }
NWWorkList >> printOn: aStream [ 
	super printOn: aStream.
	aStream << ' (running: ' << running asString << ')'
]

{ #category : #adding }
NWWorkList >> running [
	^ running select: [ :each | each isActivated ].
]
