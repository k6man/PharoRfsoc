"
Class to store and visualise Analog Signal Data.


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


    Implementation Points
"
Class {
	#name : #AnalogSignal,
	#superclass : #Object,
	#category : #Rfsoc
}

{ #category : #'as yet unclassified' }
AnalogSignal >> gtInspectorSignalInfo: composite [
	<gtInspectorPresentationOrder: -10>
	"comment stating purpose of message"
	composite roassal2
		title: 'Signal View';
		initializeView: [ | b ds|
"
b := RTGrapher new.
	ds := RTData new.
	ds dotShape color: Color blue.
	ds points: { 4 @ 5 . 10 @ 5 . 3 @ 2 }.
	ds x: #x.
	ds y: #y.
	b add: ds.
	b
"			
			
b := RTGrapher new.
b extent: 300 @ 200.
ds := RTData new.
ds noDot.
ds points: (-50 to: 100 by: 0.1).
ds y: [ :x | (0.1 * x) sin ].
ds noDot.
"ds interaction popupText: 'sinus'."
ds connectColor: Color blue.
b add: ds.
ds := RTData new.
ds noDot.
ds points: (-50 to: 100 by: 0.1).
ds y: [ :x | (0.1 * x) cos ].
ds noDot.
"ds interaction popupText: 'cosinus'."
ds connectColor: Color red.
b add: ds.
b addDecorator: RTHorizontalTickLineDecorator new.
b addDecorator: RTVerticalTickLineDecorator new.
b ]
]
