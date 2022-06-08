!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'anAccount aPortfolioWithAnAccount anotherAccount aPortfolioWithTwoAccounts listOfTransactions aPortfolioWithAPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'test' stamp: 'NC 6/5/2022 21:19:50'!
test01WhenThePortfolioIsEmptyBalanceIsZero

	| portfolio |
	portfolio := Portfolio new.
	
	self assert: (portfolio balance = (0*peso))

	! !

!PortfolioTest methodsFor: 'test' stamp: 'ca 6/7/2022 18:20:28'!
test02WhenThePortfolioHasOneAccountItsBalanceIsTheAccountsBalance

	self assert: (aPortfolioWithAnAccount  balance = anAccount balance).! !

!PortfolioTest methodsFor: 'test' stamp: 'ca 6/7/2022 18:20:36'!
test03WhenThePortfolioHasManyAccountsItsBalanceIsTheSumOfTheAccountsBalances
	
	self assert: (aPortfolioWithTwoAccounts  balance = (anAccount balance + anotherAccount balance)).! !

!PortfolioTest methodsFor: 'test' stamp: 'ca 6/7/2022 18:08:31'!
test04PortfolioKnowsRegisteredTransactionsOfItsAccounts

	self assert: (aPortfolioWithTwoAccounts hasRegistered: (Deposit for: 100*peso) )! !

!PortfolioTest methodsFor: 'test' stamp: 'ca 6/7/2022 18:07:23'!
test05PortfolioDoesNotKnowNotRegisteredTransactionsOfItsAccounts

	self deny: (aPortfolioWithTwoAccounts hasRegistered: (Withdraw for: 100 * peso))! !

!PortfolioTest methodsFor: 'test' stamp: 'ca 6/7/2022 19:34:40'!
test06PortfolioHasTheSameTransactionsAsTheAccountsItHasRegistered
	
	self assert: ((aPortfolioWithTwoAccounts transactions difference: listOfTransactions) isEmpty).! !

!PortfolioTest methodsFor: 'test' stamp: 'ca 6/7/2022 18:20:35'!
test07PortfolioOfPortfoliosCalculatesItsBalanceCorrectly

	self assert: aPortfolioWithAPortfolio balance equals: (anAccount balance + anotherAccount balance).! !

!PortfolioTest methodsFor: 'test' stamp: 'ca 6/7/2022 18:17:30'!
test08PortfolioOfPortfolioKnowsRegisteredTransactionsOfItsAccounts

	self assert: (aPortfolioWithAPortfolio hasRegistered: (Deposit for: 100*peso)).! !

!PortfolioTest methodsFor: 'test' stamp: 'ca 6/7/2022 19:35:08'!
test09PortfolioOfPortfolioHasTheSameTransactionsAsTheAccountsItHasRegistered
	
	self assert: ((aPortfolioWithAPortfolio transactions difference: listOfTransactions) isEmpty).! !


!PortfolioTest methodsFor: 'setUp' stamp: 'ca 6/7/2022 19:40:16'!
setUp

	| aTransference |
	anAccount := ReceptiveAccount  new.
	anotherAccount := ReceptiveAccount new.
	aTransference := Transference register: 10*peso from: anAccount to: anotherAccount.
	listOfTransactions := {
		Deposit register: 100 * peso on: anAccount.
		Withdraw register: 20 * peso on: anAccount.
		Deposit register: 200 * peso on: anotherAccount.
		aTransference depositPart.
		aTransference withdrawPart
	}.
	
	aPortfolioWithAnAccount := Portfolio new. 
	aPortfolioWithAnAccount add: anAccount.
	
	aPortfolioWithTwoAccounts :=  Portfolio new.
	aPortfolioWithTwoAccounts add: anAccount ; add: anotherAccount.
	
	aPortfolioWithAPortfolio := Portfolio new.
	aPortfolioWithAPortfolio add: aPortfolioWithTwoAccounts ! !


!classDefinition: #PortfolioExtraTest category: 'ServiciosFinancieros-Ejercicio'!
PortfolioTest subclass: #PortfolioExtraTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioExtraTest methodsFor: 'tests' stamp: 'NC 6/7/2022 21:05:04'!
test01PortfolioCannotAddAnIncludedAccount

	self 
		should: [aPortfolioWithAnAccount add: anAccount] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: (anError messageText = Portfolio cannotAddAnIncludedAccountErrorDescription). ].! !

!PortfolioExtraTest methodsFor: 'tests' stamp: 'NC 6/7/2022 21:05:16'!
test02PortfolioOfPortfoliosCannotAddAnIncludedAccount

	self 
		should: [aPortfolioWithAPortfolio add: anAccount] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: (anError messageText = Portfolio cannotAddAnIncludedAccountErrorDescription). ].! !

!PortfolioExtraTest methodsFor: 'tests' stamp: 'NC 6/8/2022 19:05:36'!
test03PortfolioCannotContainItself

	self 
		should: [aPortfolioWithAnAccount add: aPortfolioWithAnAccount ] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: (anError messageText = Portfolio cannotAddAPortfolioToItselfErrorDescription). ].! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NC 6/8/2022 19:34:10'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: 'aDepositingAccount aReceivingAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'test' stamp: 'NC 6/5/2022 20:01:27'!
test01ATransferenceCanBeMadeBetweenTwoAccounts

	| anAmountOfMoneyToTranser |
	anAmountOfMoneyToTranser := 50 * peso. 
	
	Transference register: anAmountOfMoneyToTranser from: aDepositingAccount to: aReceivingAccount.
	
	self assertThatAnAccount: aDepositingAccount hasABalanceOf: (50*peso).
	self assertThatAnAccount: aReceivingAccount hasABalanceOf: (50*peso).! !

!TransferenceTest methodsFor: 'test' stamp: 'NC 6/5/2022 20:06:40'!
test02CannotTransferZeroPesos

	self 
		should: [Transference register: 0*peso from: aDepositingAccount to: aReceivingAccount.] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: Transference transferenceWithZeroPesosErrorDescription
		].
	
	
! !

!TransferenceTest methodsFor: 'test' stamp: 'NC 6/5/2022 20:06:28'!
test03CannotTransferANegativeAmountOfPesos

	self 
		should: [Transference register: -10*peso from: aDepositingAccount to: aReceivingAccount.] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: Transference transferenceWithANegativeAmountOfPesosErrorDescription
		].		
	
	
! !

!TransferenceTest methodsFor: 'test' stamp: 'NC 6/5/2022 20:01:27'!
test04CannotTransferMoneyToMyself

	self 
		should: [Transference register: 10*peso from: aDepositingAccount to: aDepositingAccount.] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: Transference transferToMyselfErrorDescription
		].! !

!TransferenceTest methodsFor: 'test' stamp: 'NC 6/5/2022 20:02:16'!
test05AnExtractionPartKnowsItsCounterpart

	| transference |
	transference := Transference register: 10*peso from: aDepositingAccount to: aReceivingAccount.
	
	self assertThatTheExtractionPartKnowsItsCounterpartInATransference: transference.! !

!TransferenceTest methodsFor: 'test' stamp: 'NC 6/5/2022 20:01:27'!
test06ADepositPartKnowsItsCounterpart

	| transfer |
	
	transfer := Transference register: 10*peso from: aDepositingAccount to: aReceivingAccount.
	
	self assertThatTheDepositPartKnowsItsCounterpartInATransference: transfer.! !


!TransferenceTest methodsFor: 'validation' stamp: 'ca 6/5/2022 17:53:58'!
assertThatAnAccount: anAccount hasABalanceOf: anAmountOfPesos

	self assert: anAccount balance = anAmountOfPesos .! !

!TransferenceTest methodsFor: 'validation' stamp: 'ca 6/7/2022 19:40:16'!
assertThatTheDepositPartKnowsItsCounterpartInATransference: aTransference

	self assert: aTransference depositPart == aTransference withdrawPart counterpart.! !

!TransferenceTest methodsFor: 'validation' stamp: 'ca 6/7/2022 19:40:16'!
assertThatTheExtractionPartKnowsItsCounterpartInATransference: aTransference

	self assert: aTransference withdrawPart == aTransference depositPart counterpart.! !


!TransferenceTest methodsFor: 'setUp' stamp: 'ca 6/5/2022 17:47:19'!
setUp

	aDepositingAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: aDepositingAccount.
	aReceivingAccount := ReceptiveAccount  new. ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'basic operations' stamp: 'ca 6/7/2022 18:32:49'!
addToBalance: aBalance

	^ aBalance + value.! !


!Deposit methodsFor: '=' stamp: 'ca 6/6/2022 20:27:21'!
= anotherDesposit

	^ self class = anotherDesposit class and: [self value = anotherDesposit value.]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'basic operations' stamp: 'ca 6/7/2022 18:33:13'!
addToBalance: aBalance

	^ aBalance - value.! !


!Withdraw methodsFor: '=' stamp: 'ca 6/6/2022 20:27:49'!
= anotherWitdraw

	^ self class = anotherWitdraw class and: [self value = anotherWitdraw value.]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'allAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'NC 6/8/2022 19:46:17'!
initialize 

	allAccounts := OrderedCollection new.! !


!Portfolio methodsFor: 'basic operations' stamp: 'NC 6/8/2022 19:47:43'!
add: anAccount

	self assertThatAnAccountIsNotMyself: anAccount.
	self assertThatAReceptiveAccountIsNotIncluded: anAccount.
	(anAccount class = Portfolio ) ifTrue: [ anAccount assertThatAPortfolioIsNotIncluded: self. ].
		
	allAccounts add: anAccount
! !

!Portfolio methodsFor: 'basic operations' stamp: 'NC 6/8/2022 19:22:52'!
assertThatAnAccountIsNotMyself: anAccount

	^ (anAccount == self) ifTrue: [ self error: self class cannotAddAPortfolioToItselfErrorDescription. ]! !

!Portfolio methodsFor: 'basic operations' stamp: 'NC 6/8/2022 19:46:17'!
balance
	
	^ allAccounts inject: 0 into: [:totalBalance :anAccount | 
		totalBalance + anAccount balance.]! !

!Portfolio methodsFor: 'basic operations' stamp: 'NC 6/8/2022 19:46:17'!
hasRegistered: aTransaction

	allAccounts 
		detect: [ :anAccount | anAccount hasRegistered: aTransaction. ]
		ifFound: [ :anAccount | ^ true ]
		ifNone: [ ^ false ].

		
		! !

!Portfolio methodsFor: 'basic operations' stamp: 'ca 6/7/2022 17:46:37'!
transactions

	^ self allTransactions.! !


!Portfolio methodsFor: 'private' stamp: 'NC 6/8/2022 19:46:17'!
allTransactions

	| allTransactions |
	allTransactions := OrderedCollection new.
	allAccounts do: [ :anAccount |  allTransactions addAllLast: anAccount transactions].
	
	^ allTransactions ! !

!Portfolio methodsFor: 'private' stamp: 'NC 6/8/2022 19:46:17'!
assertThatAPortfolioIsNotIncluded: aPortfolio

	allAccounts 
		detect: [ :anAccount | self does: anAccount includesOrIsAPortfolio: aPortfolio. ]
		ifFound: [ :unusedParameter | self error: self class cannotAddAPortfolioToItselfErrorDescription . ]
		ifNone: [ ].! !

!Portfolio methodsFor: 'private' stamp: 'NC 6/8/2022 19:46:17'!
assertThatAReceptiveAccountIsNotIncluded: aReceptiveAccount

	allAccounts 
		detect: [ :anIncludedAccount |
			self does: anIncludedAccount includesOrIsAReceptiveAccount: aReceptiveAccount.
			
			
			" :anIncludedAccount | 
			(anIncludedAccount class = ReceptiveAccount) ifTrue: [
				anIncludedAccount == aReceptiveAccount ] ifFalse:
					[ anIncludedAccount includesAReceptiveAccount: aReceptiveAccount. ]."
		]
		ifFound: [ :unusedParameter | self error: self class cannotAddAnIncludedAccountErrorDescription. ]
		ifNone: [ ].! !

!Portfolio methodsFor: 'private' stamp: 'NC 6/8/2022 19:45:14'!
does: anAccount includesOrIsAPortfolio: aPortfolio

	^ (anAccount class = Portfolio) and: 
		[(anAccount == aPortfolio) or: 
			[anAccount includesAPortfolio: aPortfolio]].! !

!Portfolio methodsFor: 'private' stamp: 'NC 6/8/2022 19:32:42'!
does: anAccount includesOrIsAReceptiveAccount: aReceptiveAccount

	^ (anAccount class = ReceptiveAccount) ifTrue:
		[anAccount == aReceptiveAccount ] ifFalse:
			[anAccount includesAReceptiveAccount: aReceptiveAccount]! !

!Portfolio methodsFor: 'private' stamp: 'NC 6/8/2022 19:46:17'!
includesAPortfolio: aPortfolio
	
	"includes: anAccount andDoesNotInclude: aPortfolio"
	allAccounts 
		detect: [ :anAccount | self does: anAccount includesOrIsAPortfolio: aPortfolio.]
		ifFound: [ :anAccount | ^ true ]
		ifNone: [ ^ false ].
		! !

!Portfolio methodsFor: 'private' stamp: 'NC 6/8/2022 19:46:17'!
includesAReceptiveAccount: aReceptiveAccount
	
	"includes: anAccount andDoesNotInclude: aPortfolio"
	allAccounts 
		detect: [ :anAccount | self does: anAccount includesOrIsAReceptiveAccount: aReceptiveAccount.]
		ifFound: [ :anAccount | ^ true ]
		ifNone: [ ^ false ].
		! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error description' stamp: 'NC 6/7/2022 21:11:37'!
cannotAddAPortfolioToItselfErrorDescription

	^ 'A portfolio cannot add itself'! !

!Portfolio class methodsFor: 'error description' stamp: 'NC 6/7/2022 20:14:24'!
cannotAddAnIncludedAccountErrorDescription

	^ 'Cannot add an included account'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'ca 6/7/2022 18:49:04'!
balance

	^transactions inject: 0 into: [ :balance :aTransaction | aTransaction addToBalance: balance]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NC 6/8/2022 19:30:10'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value withdrawPart depositPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!
!Transference commentStamp: '<historical>' prior: 0!
esto no hay q subclasificarlo de AccountTransaction ??
el valor de la transferencia lo debe saber la transferencia y las patas deben conocer la transferencia para que las patas le preguntan a las transferencias el valor!


!Transference methodsFor: 'initialization' stamp: 'ca 6/7/2022 19:40:29'!
initializeFor: aValue from: anAccount to: anotherAccount

	value := aValue.
	withdrawPart := TransferWithdrawPart for: aValue from: anAccount of: self.
	depositPart := TransferenceDepositPart for: aValue from: anotherAccount of: self. ! !


!Transference methodsFor: 'basic operations' stamp: 'ca 6/5/2022 17:32:47'!
depositPart
	
	^ depositPart! !

!Transference methodsFor: 'basic operations' stamp: 'ca 6/7/2022 19:40:29'!
withdrawPart
	
	^ withdrawPart! !


!Transference methodsFor: 'value' stamp: 'ca 6/5/2022 18:03:19'!
value

	^value! !

!Transference methodsFor: 'value' stamp: 'ca 6/6/2022 20:37:57'!
valueForDeposit

	^ self value! !

!Transference methodsFor: 'value' stamp: 'ca 6/6/2022 20:38:04'!
valueForExtraction

	^ self value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'validations' stamp: 'NC 6/5/2022 20:05:44'!
assertThatATransferenceIsValidBetween: anAccount and: anotherAccount.

	(anAccount == anotherAccount ) ifTrue: [
		self error: self transferToMyselfErrorDescription 
	]! !

!Transference class methodsFor: 'validations' stamp: 'NC 6/5/2022 20:06:40'!
assertThatATransferenceIsValidFor: aValue

	(aValue = 0 ) ifTrue: [
		self error: self transferenceWithZeroPesosErrorDescription
	].
	(aValue < 0 ) ifTrue: [
		self error: self transferenceWithANegativeAmountOfPesosErrorDescription
	].
	! !


!Transference class methodsFor: 'instance creation' stamp: 'ca 6/7/2022 18:51:10'!
for: aValue from: anAccount to: anotherAccount 

	self assertThatATransferenceIsValidBetween: anAccount and: anotherAccount.
	self assertThatATransferenceIsValidFor: aValue.
	^self new initializeFor: aValue from: anAccount to: anotherAccount! !

!Transference class methodsFor: 'instance creation' stamp: 'ca 6/7/2022 19:40:16'!
register: aValue from: anAccount to: anotherAccount

	| transaction |
	
	transaction := self for: aValue from: anAccount to: anotherAccount.
	anAccount register: transaction withdrawPart.
	anotherAccount register: transaction depositPart.
		
	^ transaction! !


!Transference class methodsFor: 'error description' stamp: 'ca 6/5/2022 16:20:19'!
transferToMyselfErrorDescription

	^ 'Cannot transfer pesos to the same account'! !

!Transference class methodsFor: 'error description' stamp: 'NC 6/5/2022 20:06:28'!
transferenceWithANegativeAmountOfPesosErrorDescription

	^'Cannot transmer a negative amount of pesos'! !

!Transference class methodsFor: 'error description' stamp: 'NC 6/5/2022 20:06:40'!
transferenceWithZeroPesosErrorDescription

	^'Cannot transfer zero pesos'! !


!classDefinition: #TransferencePart category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferencePart
	instanceVariableNames: 'account transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferencePart methodsFor: 'basic operations' stamp: 'ca 6/7/2022 18:42:28'!
addToBalance: aBalance

	^ aBalance + self valueInBalance! !

!TransferencePart methodsFor: 'basic operations' stamp: 'ca 6/5/2022 17:28:10'!
counterpart

	self subclassResponsibility ! !


!TransferencePart methodsFor: 'validations' stamp: 'ca 6/6/2022 20:46:58'!
isPartOfATransference: aTransference

	^ transference == aTransference ! !

!TransferencePart methodsFor: 'validations' stamp: 'ca 6/5/2022 17:43:44'!
isTheAccountInvolved: anAccount 

	^ account == anAccount ! !


!TransferencePart methodsFor: 'initialization' stamp: 'ca 6/7/2022 19:12:55'!
initializeFor: aValue  from: anAccount of: aTransference
 
	account := anAccount.
	transference := aTransference.! !


!TransferencePart methodsFor: '=' stamp: 'ca 6/7/2022 19:21:53'!
= anotherTransferPart

	^ (self class = anotherTransferPart class) and:
		[anotherTransferPart isTheAccountInvolved: account] and: 
			[self counterpart == anotherTransferPart counterpart] and: 
				[anotherTransferPart isPartOfATransference: transference ]! !


!TransferencePart methodsFor: 'private' stamp: 'ca 6/5/2022 17:16:13'!
valueInBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferencePart class' category: 'ServiciosFinancieros-Ejercicio'!
TransferencePart class
	instanceVariableNames: ''!

!TransferencePart class methodsFor: 'instance creation' stamp: 'NC 6/5/2022 20:02:47'!
for: aValue from: anAccount of: aTransference

	^self new initializeFor: aValue  from: anAccount of: aTransference! !


!classDefinition: #TransferWithdrawPart category: 'ServiciosFinancieros-Ejercicio'!
TransferencePart subclass: #TransferWithdrawPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdrawPart methodsFor: 'basic operations' stamp: 'NC 6/5/2022 20:03:22'!
counterpart

	^ transference depositPart ! !


!TransferWithdrawPart methodsFor: 'private' stamp: 'ca 6/6/2022 20:36:34'!
valueInBalance

	^transference valueForExtraction! !


!classDefinition: #TransferenceDepositPart category: 'ServiciosFinancieros-Ejercicio'!
TransferencePart subclass: #TransferenceDepositPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDepositPart methodsFor: 'basic operations' stamp: 'ca 6/7/2022 19:40:16'!
counterpart

	^ transference withdrawPart ! !


!TransferenceDepositPart methodsFor: 'private' stamp: 'ca 6/6/2022 20:36:13'!
valueInBalance

	^ transference valueForDeposit! !
