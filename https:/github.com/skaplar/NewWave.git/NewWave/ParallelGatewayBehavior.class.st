"
I am a class that splits the execution into two or more processes.
"
Class {
	#name : #ParallelGatewayBehavior,
	#superclass : #EventBehavior,
	#category : #'NewWave-Engine'
}

{ #category : #accessing }
ParallelGatewayBehavior >> performExecution: elemToExecute executor: wave [
	| rez |
	rez := elemToExecute outgoingFlows do: [ :each | | se we | we := WaveExecutor initialNode: each targetRef. se := SubExecutor new. se parentExecutor: wave. se executor: we. se startSubExecutor ].
	
]