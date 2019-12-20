Class {
	#name : #FUAllUserTasksComponent,
	#superclass : #FUScreenComponent,
	#instVars : [
		'report',
		'component',
		'task'
	],
	#category : #'NewWaveFieldUserTask-Components'
}

{ #category : #'instance creation' }
FUAllUserTasksComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself
]

{ #category : #'as yet unclassified' }
FUAllUserTasksComponent >> buildComponent [
	| taskObject |
	taskObject := (NewWaveMagritteContainerCreator dataObject: self task) createEntity.
	^ taskObject asComponent.

]

{ #category : #accessing }
FUAllUserTasksComponent >> component [
	^ component ifNil: [ 
		component := self buildComponent ]
]

{ #category : #accessing }
FUAllUserTasksComponent >> component: aComponent [
	component := aComponent 
]

{ #category : #initialization }
FUAllUserTasksComponent >> initialize [
|taksskss|
	super initialize.
	"taksskss := self session currentlyLoggedUser tasks."
	taksskss := FUGetTaskServer new getTask: (self session currentlyLoggedUser username).
	taksskss isNil
		ifFalse: [ 
			"self report: (FUTaskReport from: (self session currentlyLoggedUser tasks))"
			self task: taksskss  ].
]

{ #category : #rendering }
FUAllUserTasksComponent >> renderAcceptButton: html [
	html tbsSubmitButton 
		tbsPullRight;
		beSuccess;
		callback: [ self sendResult ];
		value: 'Finish task'.
	html tbsSubmitButton
		tbsPullRight;
		beSuccess;
		callback: [ self goBack ];
		value: 'Cancel'.
	
]

{ #category : #rendering }
FUAllUserTasksComponent >> renderAllTasks: html [
	self tasks isNil 
		ifFalse: [ 
			self tasks do: [ :t | t isWaiting and: [html render: ( FURowTaskComponent new task: t )] ]
	 ]
]

{ #category : #rendering }
FUAllUserTasksComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Choose task and do it:'.
		html horizontalRule].
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 2. 
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 10;
		mediumSize: 8;
		with: [ 
			html tbsModalBody: [
				html tbsForm: [	
					html render: self component.
					self renderAcceptButton: html ].
				]
			].
	html tbsColumn
		extraSmallSize: 0;
		smallSize: 1;
		mediumSize: 2.  
]

{ #category : #accessing }
FUAllUserTasksComponent >> report [
	^ report
]

{ #category : #accessing }
FUAllUserTasksComponent >> report: arg1 [
	report := arg1
]

{ #category : #'as yet unclassified' }
FUAllUserTasksComponent >> sendResult [
	| newValue json |
	self component validate 
		ifFalse: [ ^nil ]."show validation message"
	newValue := self component save model.
	json := (FUDOJSONExporter dataObject: newValue) exportDOToJSON.
	FUCommitTaskServer new commitTask: json.
]

{ #category : #accessing }
FUAllUserTasksComponent >> task [
	^ task
]

{ #category : #accessing }
FUAllUserTasksComponent >> task: anObject [
	task := anObject
]