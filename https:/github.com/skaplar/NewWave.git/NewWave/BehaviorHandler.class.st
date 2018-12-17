Class {
	#name : #BehaviorHandler,
	#superclass : #Object,
	#instVars : [
		'behaviors'
	],
	#category : #'NewWave-Engine'
}

{ #category : #initialization }
BehaviorHandler >> behaviors [
	^ behaviors
]

{ #category : #initialization }
BehaviorHandler >> behaviors: anObject [
	behaviors := anObject
]

{ #category : #initialization }
BehaviorHandler >> initialize [
	super initialize.
	self behaviors:  {
			(#StartEvent -> StartEventBehavior new) .
			(#runner -> TKTCommonQueueWorkerPool createDefault).
			(#poolWorkerProcess -> TKTWorkerProcess).
			(#process -> Process).
			(#errorHandler -> TKTExceptionHandler).
			(#processProvider -> TKTPharoProcessProvider new).
			(#serviceManager -> TKTServiceManager new)} asDictionary 
]