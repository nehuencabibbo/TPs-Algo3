!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #LimitedOOStackTest category: 'Stack-Exercise'!
OOStackTest subclass: #LimitedOOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LimitedOOStackTest methodsFor: 'test' stamp: 'ca 5/15/2022 17:10:23'!
test01CannotCreateAStackWithNegativeNumbersAsALimit

	| creationOfLimitedOOStackWithNegativeLimit consecuenceOfCreatingAStackWithANegativeLimit | 
	
	creationOfLimitedOOStackWithNegativeLimit := [ LimitedOOStack withALimitOfElements: -1. ].
	consecuenceOfCreatingAStackWithANegativeLimit :=  [ :anError	 | 
			self assert: (anError messageText = LimitedOOStack creatingAStackWithANegativeLimitOfElementsErrorDescription).		].
	
	self 
		should: creationOfLimitedOOStackWithNegativeLimit 
		raise: Error
		withExceptionDo: consecuenceOfCreatingAStackWithANegativeLimit.! !

!LimitedOOStackTest methodsFor: 'test' stamp: 'ca 5/15/2022 19:31:11'!
test02CannotPushElementsToAFullStack

	| aLimitedOOStack anActionThatShouldFail aConsecuenceOfTheActionThatShouldFail | 
	
	aLimitedOOStack := LimitedOOStack withALimitOfElements: 1.
	
	aLimitedOOStack push: 'aaa'.
	
	anActionThatShouldFail := [ aLimitedOOStack push: 'aaaa'. ].
	aConsecuenceOfTheActionThatShouldFail := [ :anError | 
		self assert: (anError messageText = LimitedOOStack stackFullErrorDescription). ].
	
	self 
		should: anActionThatShouldFail 
		raise: Error 
		withExceptionDo: aConsecuenceOfTheActionThatShouldFail.
	
	! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'listOfStringsToTest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NC 5/15/2022 16:09:19'!
test01FindPrefixShouldNotBeAnEmptyString

	| anOOStack sentenceFinder findWhenPrefixIsAnEmptyString aConsecuenceOfTheError |

	
	anOOStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: anOOStack.
	
	findWhenPrefixIsAnEmptyString := [ sentenceFinder find: ''. ].
	aConsecuenceOfTheError := [ :anError | 
		self assert: anError messageText = EmptyPrefix invalidPrefixErrorDescription ].
	
	self 
		should: findWhenPrefixIsAnEmptyString 
		raise: Error
		withExceptionDo: aConsecuenceOfTheError.
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'NC 5/15/2022 16:10:42'!
test02FindPrefixShouldNotContainABlank

	| anOOStack sentenceFinder findWhenPrefixHasABlank aConsecuenceOfTheError |
	
	anOOStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: anOOStack.
	
	findWhenPrefixHasABlank  := [ sentenceFinder find: 'Un Espacio'. ].
	aConsecuenceOfTheError := [:anError | 
			self assert: anError messageText = APrefixThatContainsABlank invalidPrefixErrorDescription ].
		
	self 
		should: findWhenPrefixHasABlank 
		raise: Error 
		withExceptionDo: aConsecuenceOfTheError. 
	
		! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ca 5/15/2022 19:44:20'!
test03FindPrefixShouldBeAString

	| anOOStack sentenceFinder findWhenPrefixIsNotAString aConsecuenceOfTheError |

	
	anOOStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: anOOStack.
	
	findWhenPrefixIsNotAString := [ sentenceFinder find: 2. ].
	aConsecuenceOfTheError := [ :anError | 
		self assert: anError messageText = APrefixThatsNotString invalidPrefixErrorDescription ].
	
	self 
		should: findWhenPrefixIsNotAString 
		raise: Error
		withExceptionDo: aConsecuenceOfTheError.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ca 5/15/2022 21:25:11'!
test04StackShouldNotBeModifiedAfterUsingFind

	| anOOStack sentenceFinder | 
	
	anOOStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: anOOStack.
	
	listOfStringsToTest do: [ :aString |
		anOOStack push: aString. ].
	
	sentenceFinder find: 'Wint'.
	
	listOfStringsToTest reversed do: [ :aString |
		self assert: anOOStack pop = aString. ].
	
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ca 5/15/2022 21:25:20'!
test05FindShouldReturnAnEmptyOrderedCollectionWhenLookingForAStringWithAPrefixThatsNotInTheStack

	| anOOStack sentenceFinder | 
	
	anOOStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: anOOStack.
	
	self assert: (sentenceFinder find: 'Wint') isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ca 5/15/2022 21:25:28'!
test06FindShouldBeCaseSensitive

	| anOOStack sentenceFinder | 
	
	anOOStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: anOOStack.
	
	anOOStack push: 'AAA'.
	
	self assert: (sentenceFinder find: 'aaa') isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ca 5/15/2022 21:25:36'!
test07FindReturnsTheCorrectStringWhenTheresOnlyOneStringThatMatchesPrefix

	| anOOStack sentenceFinder listOfFoundWords | 
	
	anOOStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: anOOStack.
	
	listOfStringsToTest do: [ :aString |
		anOOStack push: aString. ].
	
	listOfFoundWords := sentenceFinder find: 'Wint'.
	
	self assert: (listOfFoundWords size = 1 and: (listOfFoundWords at: 1) = 'Winter is here').
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'ca 5/15/2022 21:25:42'!
test08FindReturnsTheCorrectStringsWhenTheresMoreThanOneStringThatMatchesPrefix

	| anOOStack sentenceFinder listOfFoundWords | 
	
	anOOStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: anOOStack.
	
	anOOStack push: 'aaa'.
	anOOStack push: 'aaaa'.
	
	listOfFoundWords := sentenceFinder find: 'aaa'.
	
	self assert: (listOfFoundWords at: 1) = 'aaa'. 
	self assert: (listOfFoundWords at: 2) = 'aaaa'.! !


!SentenceFinderByPrefixTest methodsFor: 'set up' stamp: 'NC 5/15/2022 00:20:15'!
setUp

	listOfStringsToTest := OrderedCollection new.
	
	listOfStringsToTest add: 'winter is coming'.
	listOfStringsToTest add: 'winning is everything'.
	listOfStringsToTest add: 'The winds of Winter'.
	listOfStringsToTest add: 'Winter is here'.! !


!classDefinition: #InvalidPrefix category: 'Stack-Exercise'!
Object subclass: #InvalidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidPrefix class' category: 'Stack-Exercise'!
InvalidPrefix class
	instanceVariableNames: ''!

!InvalidPrefix class methodsFor: 'validations' stamp: 'NC 5/14/2022 21:11:06'!
isThisPrefixValid: aPrefix

	self subclassResponsibility.! !


!InvalidPrefix class methodsFor: 'error descriptions' stamp: 'NC 5/14/2022 21:30:28'!
invalidPrefixErrorDescription

	self subclassResponsibility.! !


!classDefinition: #APrefixThatContainsABlank category: 'Stack-Exercise'!
InvalidPrefix subclass: #APrefixThatContainsABlank
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'APrefixThatContainsABlank class' category: 'Stack-Exercise'!
APrefixThatContainsABlank class
	instanceVariableNames: ''!

!APrefixThatContainsABlank class methodsFor: 'error descriptions' stamp: 'NC 5/14/2022 21:30:28'!
invalidPrefixErrorDescription

	^ 'Prefix should not contain an empty character'

! !


!APrefixThatContainsABlank class methodsFor: 'validations' stamp: 'ca 5/15/2022 20:28:16'!
isThisPrefixValid: aPrefix
	
	^ aPrefix isString and: [aPrefix includesSubString: ' ']! !


!classDefinition: #APrefixThatsNotString category: 'Stack-Exercise'!
InvalidPrefix subclass: #APrefixThatsNotString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'APrefixThatsNotString class' category: 'Stack-Exercise'!
APrefixThatsNotString class
	instanceVariableNames: ''!

!APrefixThatsNotString class methodsFor: 'error description' stamp: 'ca 5/15/2022 19:35:19'!
invalidPrefixErrorDescription

	^ 'Prefix should be a string'.! !


!APrefixThatsNotString class methodsFor: 'validations' stamp: 'ca 5/15/2022 19:58:17'!
isThisPrefixValid: aPrefix

	^ aPrefix isString not.! !


!classDefinition: #EmptyPrefix category: 'Stack-Exercise'!
InvalidPrefix subclass: #EmptyPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyPrefix class' category: 'Stack-Exercise'!
EmptyPrefix class
	instanceVariableNames: ''!

!EmptyPrefix class methodsFor: 'error descriptions' stamp: 'NC 5/14/2022 21:30:28'!
invalidPrefixErrorDescription

	^ 'Prefix should not be an empty string'! !


!EmptyPrefix class methodsFor: 'validations' stamp: 'NC 5/14/2022 20:52:31'!
isThisPrefixValid: aPrefix

	^ aPrefix = ''! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackStorage limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'NC 5/15/2022 16:14:48'!
assertThatItsNotEmpty
	
	self status assertThatItsNotEmpty.! !

!OOStack methodsFor: 'private' stamp: 'ca 5/15/2022 19:30:10'!
status

	OOStackStatus subclasses
		detect:  [ :aSubclass | aSubclass isTheStatusOf: self ]
		ifFound: [ :selectedSubclass | ^ selectedSubclass new]
		ifNone: [ ].! !


!OOStack methodsFor: 'basic operations' stamp: 'NC 5/15/2022 16:13:31'!
isEmpty

	^ stackStorage isEmpty ! !

!OOStack methodsFor: 'basic operations' stamp: 'ca 5/15/2022 17:33:41'!
isFull

	^false.! !

!OOStack methodsFor: 'basic operations' stamp: 'NC 5/15/2022 16:14:24'!
pop

	| aValueToReturn | 
	
	self status assertThatItsNotEmpty.
	aValueToReturn := stackStorage removeLast.
	
	^aValueToReturn ! !

!OOStack methodsFor: 'basic operations' stamp: 'NC 5/15/2022 16:14:28'!
push: aString 

	stackStorage add: aString.
	
	"
	self assertThatTheCurrentSizeIsNotTheLimit
	-> 
	assertThatTheCurrent...
	
		(self size = self limitOfElements) ifTrue: [ self error: self fullStackErrorDescription ].
		
		(self size < self limitOfElements) ifTrue: [ ]	
	->
	Tendriamos que implementar en OOStack el estado fullStack y lo que corresponda (pertenece etc)
	" 
	! !

!OOStack methodsFor: 'basic operations' stamp: 'NC 5/15/2022 16:13:31'!
size

	^ stackStorage size! !

!OOStack methodsFor: 'basic operations' stamp: 'NC 5/15/2022 16:14:40'!
top

	self status assertThatItsNotEmpty.
	^ stackStorage last.! !


!OOStack methodsFor: 'initialization' stamp: 'ca 5/15/2022 19:28:36'!
initialize

	limit := PlusInfinity new. 
	stackStorage := OrderedCollection new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #LimitedOOStack category: 'Stack-Exercise'!
OOStack subclass: #LimitedOOStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LimitedOOStack methodsFor: 'basic operations' stamp: 'ca 5/15/2022 17:33:28'!
isFull

	^ self size = limit.! !

!LimitedOOStack methodsFor: 'basic operations' stamp: 'ca 5/15/2022 21:31:45'!
push: aString 

	self assertThatTheCurrentSizeIsNotTheLimit.
	stackStorage add: aString.
	! !


!LimitedOOStack methodsFor: 'private' stamp: 'ca 5/15/2022 21:32:07'!
assertThatTheCurrentSizeIsNotTheLimit
	
	self status assertThatisNotFull.! !


!LimitedOOStack methodsFor: 'initialization' stamp: 'NC 5/15/2022 16:31:15'!
initializeWith: aLimitOfElements
	
	limit := aLimitOfElements.
	stackStorage := OrderedCollection new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LimitedOOStack class' category: 'Stack-Exercise'!
LimitedOOStack class
	instanceVariableNames: ''!

!LimitedOOStack class methodsFor: 'instance creation' stamp: 'ca 5/15/2022 21:47:48'!
withALimitOfElements: aLimitOfElements

	(aLimitOfElements < 0) ifTrue: [ self error: self creatingAStackWithANegativeLimitOfElementsErrorDescription ].
	
	^ self new initializeWith: aLimitOfElements! !


!LimitedOOStack class methodsFor: 'error description' stamp: 'NC 5/15/2022 16:29:14'!
creatingAStackWithANegativeLimitOfElementsErrorDescription
	
	^ 'Cannot create a stack with a negative limit of elements'! !

!LimitedOOStack class methodsFor: 'error description' stamp: 'ca 5/15/2022 19:32:10'!
stackFullErrorDescription

	^ 'The stack is full'! !


!classDefinition: #OOStackStatus category: 'Stack-Exercise'!
Object subclass: #OOStackStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStatus methodsFor: 'validations' stamp: 'NC 5/15/2022 16:01:39'!
assertThatItsNotEmpty

	self subclassResponsibility.! !

!OOStackStatus methodsFor: 'validations' stamp: 'ca 5/15/2022 19:39:01'!
assertThatisNotFull

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStatus class' category: 'Stack-Exercise'!
OOStackStatus class
	instanceVariableNames: ''!

!OOStackStatus class methodsFor: 'validations' stamp: 'ca 5/15/2022 21:31:16'!
isTheStatusOf: aStack

	self subclassResponsibility.! !


!classDefinition: #EmptyStack category: 'Stack-Exercise'!
OOStackStatus subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'validations' stamp: 'NC 5/15/2022 16:00:27'!
assertThatItsNotEmpty

	self error: self class stackEmptyErrorDescription.! !

!EmptyStack methodsFor: 'validations' stamp: 'ca 5/15/2022 16:50:40'!
assertThatisNotFull
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: 'Stack-Exercise'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'error description' stamp: 'NC 5/13/2022 19:03:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!EmptyStack class methodsFor: 'validations' stamp: 'ca 5/15/2022 21:31:05'!
isTheStatusOf: anOOStack

	^ (anOOStack size = 0) & ((anOOStack isFull) not)
	 "En este caso isFull es para chequear q si el limite es 0, esta llleno."
! !


!classDefinition: #FullStack category: 'Stack-Exercise'!
OOStackStatus subclass: #FullStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FullStack methodsFor: 'validations' stamp: 'ca 5/15/2022 16:38:10'!
assertThatItsNotEmpty! !

!FullStack methodsFor: 'validations' stamp: 'ca 5/15/2022 17:37:24'!
assertThatisNotFull

	self error: self class stackFullErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FullStack class' category: 'Stack-Exercise'!
FullStack class
	instanceVariableNames: ''!

!FullStack class methodsFor: 'validations' stamp: 'ca 5/15/2022 21:30:09'!
isTheStatusOf: anOOStack
	
	^ anOOStack isFull.
! !


!FullStack class methodsFor: 'error description' stamp: 'ca 5/15/2022 17:11:59'!
stackFullErrorDescription

	^ 'The stack is full'! !


!classDefinition: #NotEmptyStack category: 'Stack-Exercise'!
OOStackStatus subclass: #NotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStack methodsFor: 'validations' stamp: 'NC 5/15/2022 16:01:09'!
assertThatItsNotEmpty

! !

!NotEmptyStack methodsFor: 'validations' stamp: 'ca 5/15/2022 16:50:48'!
assertThatisNotFull
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStack class' category: 'Stack-Exercise'!
NotEmptyStack class
	instanceVariableNames: ''!

!NotEmptyStack class methodsFor: 'validations' stamp: 'ca 5/15/2022 21:30:20'!
isTheStatusOf: anOOStack
	
	^ (anOOStack size ~= 0) & ((anOOStack isFull) not)
	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'NC 5/13/2022 20:21:24'!
initializeWith: anOOStack

	stack := anOOStack! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'ca 5/15/2022 21:27:44'!
assertThatAPrefixIsValid: aPrefix
	
	| invalidStringSubclases |
	
	invalidStringSubclases := InvalidPrefix subclasses.
	
	invalidStringSubclases 
		detect: [ :invalidStringSubclass | 
			invalidStringSubclass isThisPrefixValid: aPrefix. ]
		ifFound: [ :invalidStringSubclass |
			self error: invalidStringSubclass invalidPrefixErrorDescription. ]
		ifNone: []! !


!SentenceFinderByPrefix methodsFor: 'basic operations' stamp: 'ca 5/15/2022 19:23:26'!
find: aPrefix
	
	| listWithStringsThatStartWithAPrefix auxiliaryOrderedCollection stackSize |
	self assertThatAPrefixIsValid: aPrefix.
	
	auxiliaryOrderedCollection := OrderedCollection new.
	listWithStringsThatStartWithAPrefix := OrderedCollection new.
	
	stackSize := stack size.
	
	( stackSize ) timesRepeat: [ | actualString |
		actualString := stack pop.
		auxiliaryOrderedCollection addFirst: actualString. ].
	
	listWithStringsThatStartWithAPrefix := auxiliaryOrderedCollection select: [:aString |
		aString beginsWith: aPrefix. ].
	
	( stackSize ) timesRepeat: [	 
		stack push: auxiliaryOrderedCollection removeFirst. 
	].
	
	^ listWithStringsThatStartWithAPrefix
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'NC 5/13/2022 20:20:23'!
with: anOOStack

	^ self new initializeWith: anOOStack! !


!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'NC 5/14/2022 20:55:22'!
stringContainingPrefixNotFoundErrorDescription

	^ 'There`s no word with such a prefix' ! !
