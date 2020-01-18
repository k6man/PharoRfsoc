Class {
	#name : #Rfsoc,
	#superclass : #Object,
	#instVars : [
		'ctrl_port',
		'data_port',
		'ip',
		'timeout',
		'ctrl_socket',
		'data_socket'
	],
	#category : #Rfsoc
}

{ #category : #public }
Rfsoc class >> connectTo: ip [

	"connectTo: (TCPAddress ip: #[127 0 0 1] port: 40423)"
	^self new ip: ip ; connect ; yourself.
]

{ #category : #examples }
Rfsoc class >> example01 [ 
	"comment stating purpose of message"
	| rfsoc |
 rfsoc := Rfsoc new ip: '192.168.2.100'; yourself.
 rfsoc connect.	
]

{ #category : #examples }
Rfsoc class >> example02 [ 
	"comment stating purpose of message"
 Rfsoc connectTo: '192.168.2.100'
]

{ #category : #'api - queries' }
Rfsoc >> cmd: cmd [
| s_ctrl return_value |
 s_ctrl := SocketStream openConnectionToHost: (self ip) port: (self ctrl_port) timeout: (self timeout).
 s_ctrl sendCommand: cmd.
 return_value := s_ctrl nextLine.
 s_ctrl close.
 ^return_value.
]

{ #category : #'api - queries' }
Rfsoc >> cmd: cmd withDataAsByte: data [

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
Rfsoc >> cmd: cmd withDataAsByteTo: data [
self notYetImplemented .
 
]

{ #category : #public }
Rfsoc >> connect [ 
	ctrl_socket := SocketStream openConnectionToHost: (self ip) port: (self ctrl_port) timeout: (self timeout).
   data_socket := SocketStream openConnectionToHost: (self ip) port: (self data_port) timeout: (self timeout).
]

{ #category : #accessing }
Rfsoc >> ctrl_port [
	ctrl_port ifNil: [ ctrl_port := 8081 ].
	^ctrl_port.
]

{ #category : #accessing }
Rfsoc >> ctrl_port: anObject [
	ctrl_port := anObject
]

{ #category : #accessing }
Rfsoc >> data_port [
	data_port ifNil: [ data_port := 8082 ].
	^data_port.
]

{ #category : #accessing }
Rfsoc >> data_port: anObject [
	data_port := anObject
]

{ #category : #'private ' }
Rfsoc >> getData: nb [
| s_data return_value |
 return_value:= ''.
 s_data := SocketStream openConnectionToHost: (self ip) port: (self data_port) timeout: (self timeout).
 1 to: nb do: [ return_value join: (s_data nextLineCrLf )].
 s_data close.
 ^return_value.
]

{ #category : #'private ' }
Rfsoc >> inform: msg [
	UIManager default inform: msg.
]

{ #category : #public }
Rfsoc >> initialize [ 
   " show transcript to see message"
	Smalltalk tools transcript open.
]

{ #category : #accessing }
Rfsoc >> ip [
	ip ifNil: [ ip := '192.168.2.100' ].
	^ip.
]

{ #category : #accessing }
Rfsoc >> ip: anObject [
	ip := anObject.
]

{ #category : #'api - queries' }
Rfsoc >> script: script [
	self notYetImplemented.
"{ s_data. s_ctrl. } do: [ :s |  s ifNotNil:  [ s | s close ] ]."
]

{ #category : #accessing }
Rfsoc >> timeout [ 
	timeout ifNil: [ timeout := 10 "seconds" ].
	^timeout.
]

{ #category : #accessing }
Rfsoc >> timeout: anObject [
	timeout := anObject
]
