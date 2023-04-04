Class {
	#name : #SimpleLedUi,
	#superclass : #SpPresenter,
	#instVars : [
		'buttonHappy',
		'buttonNeutral',
		'buttonBad',
		'screen',
		'test',
		'image',
		'led',
		'buttonOn',
		'buttonOff'
	],
	#category : #SimpleLedCircuit
}

{ #category : #'instance creation' }
SimpleLedUi >> LedImage [
	^ ImageMorph withForm: self LedImageForm
]

{ #category : #initialization }
SimpleLedUi >> connectPresenters [
	buttonOn action: [ image image: self greenLEDonImage asForm ].
	buttonOff action: [ image image: self greenLEDoffImage asForm ].
]

{ #category : #initialization }
SimpleLedUi >> defaultLayout [
	^ SpBoxLayout newVertical
		add: image;
		spacing: 55;
		add: (SpBoxLayout newLeftToRight
			add: buttonOn;
			add: buttonOff;
		yourself);
		yourself
]

{ #category : #'instance creation' }
SimpleLedUi >> greenLEDoffForm [ 
	
	^ Form fromFileNamed: '/home/jiande/Downloads/greenLedOff.png'
]

{ #category : #'instance creation' }
SimpleLedUi >> greenLEDoffImage [
	
	^ ImageMorph withForm: self greenLEDoffForm  
]

{ #category : #'instance creation' }
SimpleLedUi >> greenLEDonForm [ 
	
	^ Form fromFileNamed: '/home/jiande/Downloads/greenLedOn.png'
]

{ #category : #'instance creation' }
SimpleLedUi >> greenLEDonImage [
	
	^ ImageMorph withForm: self greenLEDonForm  
]

{ #category : #initialization }
SimpleLedUi >> initializePresenters [
screen := self newLabel.
buttonOn := self newButton.
buttonOff := self newButton.
image := self newImage.

screen 
label: 'Please give us your feedback.'.
buttonOn
label: 'On';
icon: (self iconNamed: #smallDoIt).
buttonOff
label: 'Off';
icon: (self iconNamed: #smallCancel).
image
image:  self greenLEDoffImage  asForm;
autoScale: true.
]

{ #category : #'instance creation' }
SimpleLedUi >> initializeWindow: aWindowPresenter [
	aWindowPresenter
	title: 'Simple LED'.
]

{ #category : #'instance creation' }
SimpleLedUi >> ledImage [
	^ ImageMorph withForm: self ledImageForm 
]

{ #category : #'instance creation' }
SimpleLedUi >> ledImageForm [
	^ Form fromFileNamed: '/home/jiande/Downloads/Led-PNG-Photos.png'
]

{ #category : #'instance creation' }
SimpleLedUi >> newButton [

	^ self instantiate: SpButtonPresenter
]

{ #category : #'instance creation' }
SimpleLedUi >> newImage [ 

	^ self instantiate: SpImagePresenter  
]
