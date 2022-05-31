!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'set up' stamp: 'ca 5/31/2022 17:40:59'!
setUp

	marsRover := MarsRover startingOn: 0@0 whileFacing: North new.! !


!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:46:47'!
test01WhenNoComandsAreSentToMarsRoverItsPositionIsTheInitialPosition
	
	| aCertainPosition |
	aCertainPosition := (0@0).
	
	self assertThatMyPositionIs: aCertainPosition! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:46:55'!
test02MarsRoverMovesForwardOnceWhenCommanded
	
	| aCertainPosition |
	aCertainPosition := (0@1).
	
	marsRover command: 'f'.
	
	self assertThatMyPositionIs: aCertainPosition! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:46:59'!
test03MarsRoverMovesForwardManyTimesWhenCommanded
	
	| aCertainPosition |
	aCertainPosition := (0@2).
	
	marsRover command: 'ff'.
	
	self assertThatMyPositionIs: aCertainPosition! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:47:04'!
test04MarsRoverMovesBackwardsOnceWhenCommanded
	
	| aCertainPosition |
	aCertainPosition := (0@-1).
	
	marsRover command: 'b'.
	
	self assertThatMyPositionIs: aCertainPosition! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:47:26'!
test05MarsRoverMovesBackwardsManyTimesWhenCommanded
	
	| aCertainPosition |
	aCertainPosition := (0@-2).
	
	marsRover command: 'bb'.
	
	self assertThatMyPositionIs: aCertainPosition! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:51:10'!
test06WhenNoCommandsAreSentToMarsRoverDoesNotRotate
	
	self assertThatMarsRoverIsFacing: North new.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:51:37'!
test07MarsRoverRotatesRightOnceWhenCommanded
	
	marsRover command: 'r'.
	
	self assertThatMarsRoverIsFacing: East new.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:51:47'!
test08MarsRoverRotatesRightTwiceWhenCommanded
	
	marsRover command: 'rr'.
	
	self assertThatMarsRoverIsFacing: South new.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:51:57'!
test09MarsRoverRotatesRightThreeTimesWhenCommanded
	
	marsRover command: 'rrr'.
	
	self assertThatMarsRoverIsFacing: West new.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:35:43'!
test10MarsRoverRotatesRightFourTimesWhenCommanded
	
	marsRover command: 'rrrr'.
	
	self assert: (marsRover isFacing = North new)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:53:09'!
test11MarsRoverRotatesLeftOnceWhenCommanded
	
	marsRover command: 'l'.
	
	self assertThatMarsRoverIsFacing: West new.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:52:22'!
test12MarsRoverRotatesLeftTwiceWhenCommanded

	marsRover command: 'll'.
	
	self assertThatMarsRoverIsFacing: South new.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:52:35'!
test13MarsRoverRotatesLeftThreeTimesWhenCommanded
	
	marsRover command: 'lll'.
	
	self assertThatMarsRoverIsFacing: East new.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:52:44'!
test14MarsRoverRotatesLeftFourTimesWhenCommanded
	
	marsRover command: 'llll'.
	
	self assertThatMarsRoverIsFacing: North new.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:48:06'!
test15MarsRoverRotatesLeftOnceAndMovesForwardOnceWhenCommanded

	| aCertainPosition |
	aCertainPosition := (-1@0).
	
	marsRover command: 'lf'.
	
	self assertThatMyPositionIs: aCertainPosition! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:48:21'!
test16MarsRoverRotatesRightOnceAndMovesForwardOnceWhenCommanded

	| aCertainPosition |
	aCertainPosition := (1@0).
	
	marsRover command: 'rf'.
	
	self assertThatMyPositionIs: aCertainPosition
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:48:43'!
test17MarsRoverRotatesLeftTwiceAndMovesForwardOnceWhenCommanded
	
	| aCertainPosition |
	aCertainPosition := (0@-1).
	
	marsRover command: 'llf'.
	
	self assertThatMyPositionIs: aCertainPosition! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:48:57'!
test18MarsRoverRotatesLeftOnceAndMovesBackwardsOnceWhenCommanded

	| aCertainPosition |
	aCertainPosition := (1@0).
	
	marsRover command: 'lb'.
	
	self assertThatMyPositionIs: aCertainPosition! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:49:09'!
test19MarsRoverRotatesRightOnceAndMovesBackwardsOnceWhenCommanded

	| aCertainPosition |
	aCertainPosition := (-1@0).
	
	marsRover command: 'rb'.
	
	self assertThatMyPositionIs: aCertainPosition! !

!MarsRoverTest methodsFor: 'tests' stamp: 'NC 5/29/2022 18:49:21'!
test20MarsRoverRotatesLeftTwiceAndMovesBackwardsOnceWhenCommanded
	
	| aCertainPosition |
	aCertainPosition := (0@1).
	
	marsRover command: 'llb'.
	
	self assertThatMyPositionIs: aCertainPosition! !

!MarsRoverTest methodsFor: 'tests' stamp: 'ca 5/31/2022 17:23:32'!
test21MarsRoverShouldFailWhenACommandIsInvalid

	| aCertainCommandThatShouldFail | 
	aCertainCommandThatShouldFail := 'x'.
	
	self 
		should: [ marsRover command: aCertainCommandThatShouldFail. ]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: (anError messageText = MarsRover invalidCommandErrorDescription). ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'ca 5/31/2022 18:06:17'!
test22MarsRoverShouldNotProcessCommandsAfterInvalidCommand

	| aCertainCommandThatShouldFail | 
	aCertainCommandThatShouldFail := 'fxf'.
	
	self 
		should: [ marsRover command: aCertainCommandThatShouldFail. ]
		raise: Error
		withExceptionDo: [:anError].
	
	self assertThatMyPositionIs: (0@1).! !


!MarsRoverTest methodsFor: 'private' stamp: 'NC 5/29/2022 18:50:56'!
assertThatMarsRoverIsFacing: aMarsRoverPossibleDirection

	self assert: (marsRover isFacing = aMarsRoverPossibleDirection)

! !

!MarsRoverTest methodsFor: 'private' stamp: 'NC 5/29/2022 18:43:35'!
assertThatMyPositionIs: aCertainPosition

	self assert: (marsRover position = aCertainPosition)! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position directionFacing validCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'basic operations' stamp: 'ca 5/31/2022 18:06:28'!
command: aSequenceOfCommands 

	aSequenceOfCommands do: [ :aCommand | self processACommand: aCommand. ].! !

!MarsRover methodsFor: 'basic operations' stamp: 'NC 5/29/2022 19:54:05'!
isFacing
	^ directionFacing ! !

!MarsRover methodsFor: 'basic operations' stamp: 'ca 5/29/2022 14:18:51'!
position
	^ position! !


!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 19:54:05'!
goBackwards

	directionFacing inMyDirectionMoveBackwards: self.
! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 19:54:05'!
goForward

	directionFacing inMyDirectionMoveForward: self! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 18:20:25'!
moveBackwardsEast

	self moveForwardWest.! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 18:20:05'!
moveBackwardsNorth	

	self moveForwardSouth	.! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 18:20:07'!
moveBackwardsSouth

	self moveForwardNorth.! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 18:20:11'!
moveBackwardsWest

	self moveForwardEast.
! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 18:17:24'!
moveByACertainDistance: aCertainDistance

	position := position + aCertainDistance! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 18:17:52'!
moveForwardEast

	self moveByACertainDistance: (1@0).! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 18:18:05'!
moveForwardNorth
		
	self moveByACertainDistance: (0@1).! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 18:18:14'!
moveForwardSouth	

	self moveByACertainDistance: (0@-1).! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 18:18:21'!
moveForwardWest

	self moveByACertainDistance: (-1@0).! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'ca 5/31/2022 18:05:45'!
processACommand: aCommand

	(validCommands at: aCommand ifAbsent: [self error: self class invalidCommandErrorDescription.]) value! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 19:54:05'!
turnLeft

	^ directionFacing := directionFacing directionToMyLeft! !

!MarsRover methodsFor: 'private - basic operations' stamp: 'NC 5/29/2022 19:54:05'!
turnRight

	^ directionFacing := directionFacing directionToMyRight! !



!MarsRover methodsFor: 'initialization' stamp: 'ca 5/31/2022 18:07:09'!
initialize

	position := 0@0.
	directionFacing := North new.
	validCommands  := Dictionary newFromPairs: {
		$f. [ self goForward	].
		$b. [self goBackwards].
		$r. [ self turnRight. ].
		$l. [ self turnLeft. ].
	}.! !

!MarsRover methodsFor: 'initialization' stamp: 'ca 5/31/2022 18:07:16'!
initializeStartingOn: aStartingPoint whileFacing: aMarsRoverPossibleDirection.

	position := aStartingPoint.
	directionFacing := aMarsRoverPossibleDirection .
	validCommands  := Dictionary newFromPairs: {
		$f. [ self goForward	].
		$b. [self goBackwards].
		$r. [ self turnRight. ].
		$l. [ self turnLeft. ].
	}.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error descriptions' stamp: 'NC 5/29/2022 19:48:42'!
invalidCommandErrorDescription

	^ 'Invalid command'! !


!MarsRover class methodsFor: 'instance creation' stamp: 'ca 5/31/2022 17:39:48'!
startingOn: aStartingPoint whileFacing: aMarsRoverPossibleDirection

	^self new initializeStartingOn: aStartingPoint whileFacing: aMarsRoverPossibleDirection.! !


!classDefinition: #MarsRoverCompassDirection category: 'MarsRover'!
Object subclass: #MarsRoverCompassDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverCompassDirection methodsFor: 'basic operations' stamp: 'NC 5/29/2022 18:08:23'!
directionToMyLeft

	self subclassResponsibility ! !

!MarsRoverCompassDirection methodsFor: 'basic operations' stamp: 'NC 5/29/2022 18:08:32'!
directionToMyRight

	self subclassResponsibility ! !

!MarsRoverCompassDirection methodsFor: 'basic operations' stamp: 'NC 5/29/2022 17:51:40'!
inMyDirectionMoveBackwards: aMarsRover
	
	self subclassResponsibility.! !

!MarsRoverCompassDirection methodsFor: 'basic operations' stamp: 'NC 5/29/2022 17:50:07'!
inMyDirectionMoveForward: aMarsRover
	
	self subclassResponsibility.! !


!MarsRoverCompassDirection methodsFor: '=' stamp: 'ca 5/29/2022 16:23:13'!
= anotherCardinalPoint

	^ self class = anotherCardinalPoint class! !


!classDefinition: #East category: 'MarsRover'!
MarsRoverCompassDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'basic operations' stamp: 'NC 5/29/2022 18:08:23'!
directionToMyLeft

	^ North new! !

!East methodsFor: 'basic operations' stamp: 'NC 5/29/2022 18:08:32'!
directionToMyRight

	^ South new
			
			! !

!East methodsFor: 'basic operations' stamp: 'ca 5/31/2022 18:10:07'!
inMyDirectionMoveBackwards: aMarsRover "by: aCertainDistance" 
	
	aMarsRover moveBackwardsEast! !

!East methodsFor: 'basic operations' stamp: 'NC 5/29/2022 17:50:07'!
inMyDirectionMoveForward: aMarsRover
	
	aMarsRover moveForwardEast! !


!classDefinition: #North category: 'MarsRover'!
MarsRoverCompassDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'basic operations' stamp: 'NC 5/29/2022 18:08:23'!
directionToMyLeft

	^ West new
			! !

!North methodsFor: 'basic operations' stamp: 'NC 5/29/2022 18:08:32'!
directionToMyRight
	
	^ East new
			! !

!North methodsFor: 'basic operations' stamp: 'NC 5/29/2022 17:50:44'!
inMyDirectionMoveBackwards: aMarsRover
	
	aMarsRover moveBackwardsNorth! !

!North methodsFor: 'basic operations' stamp: 'NC 5/29/2022 17:50:07'!
inMyDirectionMoveForward: aMarsRover
	
	aMarsRover moveForwardNorth! !


!classDefinition: #South category: 'MarsRover'!
MarsRoverCompassDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'basic operations' stamp: 'NC 5/29/2022 18:08:23'!
directionToMyLeft
	
	^ East new
			! !

!South methodsFor: 'basic operations' stamp: 'NC 5/29/2022 18:08:32'!
directionToMyRight

	^ West new! !

!South methodsFor: 'basic operations' stamp: 'NC 5/29/2022 17:51:05'!
inMyDirectionMoveBackwards: aMarsRover
	
	aMarsRover moveBackwardsSouth! !

!South methodsFor: 'basic operations' stamp: 'NC 5/29/2022 17:50:07'!
inMyDirectionMoveForward: aMarsRover
	
	aMarsRover moveForwardSouth! !


!classDefinition: #West category: 'MarsRover'!
MarsRoverCompassDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'basic operations' stamp: 'ca 5/31/2022 18:10:23'!
directionToMyLeft

	^ South new
			! !

!West methodsFor: 'basic operations' stamp: 'NC 5/29/2022 18:08:32'!
directionToMyRight

	^ North new
	! !

!West methodsFor: 'basic operations' stamp: 'NC 5/29/2022 17:51:20'!
inMyDirectionMoveBackwards: aMarsRover
	
	aMarsRover moveBackwardsWest! !

!West methodsFor: 'basic operations' stamp: 'NC 5/29/2022 17:50:07'!
inMyDirectionMoveForward: aMarsRover
	
	aMarsRover moveForwardWest! !
