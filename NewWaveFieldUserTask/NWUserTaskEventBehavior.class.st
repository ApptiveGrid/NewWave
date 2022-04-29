"
I am a class that is used to execute CustomTask.
"
Class {
	#name : #NWUserTaskEventBehavior,
	#superclass : #NWActivityEventBehavior,
	#category : #NewWaveFieldUserTask
}

{ #category : #'as yet unclassified' }
NWUserTaskEventBehavior >> extractNWClassDecription: elemToExecute [
	"If the task doesn't have dataObject associated with it, we can't pull NewWaveDOClassDescription
	from it. So we create a new one, which will be shown just as Finis Task on the client.
	Probably that's not what the user wants, but should be supported anyway."
	
	| dataObject |
	elemToExecute dataOutputAssociations isEmpty ifTrue: [ ^ NewWaveDOClassDescription new ].
	dataObject := elemToExecute dataOutputAssociations first.
	dataObject valuedDataObject 
		ifNil: [ ^ NewWaveDOClassDescription new ]
		ifNotNil: [ :nwClassDescription  | 
"			nwClassDescription taskName: elemToExecute name.
			nwClassDescription taskDescription: elemToExecute description.
			nwClassDescription userName: elemToExecute user username.
			nwClassDescription groupName: elemToExecute group groupName.
			nwClassDescription taskId: elemToExecute id."
			^ nwClassDescription ]
	
]
