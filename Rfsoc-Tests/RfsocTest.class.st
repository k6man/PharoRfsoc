"
A RfsocTest is a test class for testing the behavior of Rfsoc
"
Class {
	#name : #RfsocTest,
	#superclass : #TestCase,
	#category : #'Rfsoc-Tests'
}

{ #category : #tests }
RfsocTest >> test01 [ 
	"comment stating purpose of message"
| rf |
rf := Rfsoc_gen1 new.
self assert: rf ctrl_port equals: 8081. 
self assert: rf data_port equals: 8082.
rf inspect
]
