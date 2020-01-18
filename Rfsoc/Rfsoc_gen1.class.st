"
RfSoc:
	Class to manage connection to a Rfsoc board 


Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	ctrl_port:		<Object>
	data_port:		<Object>
	ip:		<Object>
	timeout:		<Object>


    Implementation Points
"
Class {
	#name : #'Rfsoc_gen1',
	#superclass : #Object,
	#instVars : [
		'ctrl_port',
		'data_port',
		'ip',
		'timeout'
	],
	#category : #Rfsoc
}

{ #category : #public }
Rfsoc_gen1 class >> connectTo: ip [
	" show transcript to see message"
	Smalltalk tools transcript open.
	"connectTo: (TCPAddress ip: #[127 0 0 1] port: 40423)"
	^self new ip: ip ; yourself.
]

{ #category : #examples }
Rfsoc_gen1 class >> example01 [ 
	"comment stating purpose of message"
 Rfsoc_gen1 connectTo: '192.168.2.100'
]

{ #category : #'api - queries' }
Rfsoc_gen1 >> cmd: cmd [
| s_ctrl return_value |
 s_ctrl := SocketStream openConnectionToHost: (self ip) port: (self ctrl_port) timeout: (self timeout).
 s_ctrl sendCommand: cmd.
 return_value := s_ctrl nextLine.
 s_ctrl close.
 ^return_value.
]

{ #category : #'api - queries' }
Rfsoc_gen1 >> cmd: cmd withDataAsByte: data [

| s_ctrl s_data return_value|
self notYetImplemented .
 s_ctrl := SocketStream openConnectionToHost: (self ip) port: (self ctrl_port) timeout: (self timeout).
 s_data := SocketStream openConnectionToHost: (self ip) port: (self data_port) timeout: (self timeout).
 s_ctrl sendCommand: cmd.
 s_data sendCommand: data.
 return_value := s_ctrl nextLineCrLf.
 s_ctrl close.
 s_data close.
 ^return_value.
]

{ #category : #'api - queries' }
Rfsoc_gen1 >> cmd: cmd withDataAsByteTo: data [
self notYetImplemented .
 
]

{ #category : #accessing }
Rfsoc_gen1 >> ctrl_port [
	ctrl_port ifNil: [ ctrl_port := 8081 ].
	^ctrl_port.
]

{ #category : #accessing }
Rfsoc_gen1 >> ctrl_port: anObject [
	ctrl_port := anObject
]

{ #category : #accessing }
Rfsoc_gen1 >> data_port [
	data_port ifNil: [ data_port := 8082 ].
	^data_port.
]

{ #category : #accessing }
Rfsoc_gen1 >> data_port: anObject [
	data_port := anObject
]

{ #category : #'private ' }
Rfsoc_gen1 >> getData: nb [
| s_data return_value |
 return_value:= ''.
 s_data := SocketStream openConnectionToHost: (self ip) port: (self data_port) timeout: (self timeout).
 1 to: nb do: [ return_value join: (s_data nextLineCrLf )].
 s_data close.
 ^return_value.
]

{ #category : #'private ' }
Rfsoc_gen1 >> inform: msg [
	UIManager default inform: msg.
]

{ #category : #public }
Rfsoc_gen1 >> initialize [ 
	timeout := 10. "secondes"
]

{ #category : #accessing }
Rfsoc_gen1 >> ip [
	^ ip
]

{ #category : #accessing }
Rfsoc_gen1 >> ip: anObject [
	ip := anObject.
]

{ #category : #'api - queries' }
Rfsoc_gen1 >> script: script [
	self notYetImplemented.
"{ s_data. s_ctrl. } do: [ :s |  s ifNotNil:  [ s | s close ] ]."
]

{ #category : #accessing }
Rfsoc_gen1 >> timeout [
	^ timeout
]

{ #category : #accessing }
Rfsoc_gen1 >> timeout: anObject [
	timeout := anObject
]
