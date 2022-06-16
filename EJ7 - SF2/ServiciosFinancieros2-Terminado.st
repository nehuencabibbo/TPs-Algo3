!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:01:07'!
test01AccountSummaryOfAReceptiveAccountWithoutTransactionsShowsCorrectly
	
	| aReceptiveAccount aReceptiveAccountReport anExpectedReport |
	aReceptiveAccount := ReceptiveAccount new.
	
	aReceptiveAccountReport := (AccountSummary of: aReceptiveAccount) summary.
	anExpectedReport := OrderedCollection with: 'Balance = 0 * pesos'.
	
	self assertThat: aReceptiveAccountReport hasTheSameElementsAs: anExpectedReport.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:01:07'!
test02AccountSummaryOfAReceptiveAccountWithADepositShowsCorrectly
	
	| aReceptiveAccount aReceptiveAccountReport anExpectedReport |
	aReceptiveAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: aReceptiveAccount.
	
	aReceptiveAccountReport := (AccountSummary of: aReceptiveAccount) summary.
	anExpectedReport := OrderedCollection 
			with: 'Depósito por 100 * pesos' 
			with: 'Balance = 100 * pesos'.
	
	self assertThat: aReceptiveAccountReport hasTheSameElementsAs: anExpectedReport! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:01:07'!
test03AccountSummaryOfAReceptiveAccountWithAWithdrawShowsCorrectly
	
	| aReceptiveAccount aReceptiveAccountReport anExpectedReport |
	aReceptiveAccount := ReceptiveAccount new.
	
	Withdraw register: 100 * peso on: aReceptiveAccount.
	
	aReceptiveAccountReport := (AccountSummary of: aReceptiveAccount) summary.
	anExpectedReport := OrderedCollection 
			with: 'Extracción por 100 * pesos' 
			with: 'Balance = -100 * pesos'.
	
	self assertThat: aReceptiveAccountReport hasTheSameElementsAs: anExpectedReport! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:01:07'!
test04AccountSummaryOfAReceptiveAccountWithAnExitingTransferShowsCorrectly
	
	| aReceptiveAccount aReceptiveAccountReport anExpectedReport anotherReceptiveAccount |
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: aReceptiveAccount to: anotherReceptiveAccount.
	
	aReceptiveAccountReport := (AccountSummary of: aReceptiveAccount) summary.
	anExpectedReport := OrderedCollection 
			with: 'Salida por transferencia de 100 * pesos' 
			with: 'Balance = -100 * pesos'.
	
	self assertThat: aReceptiveAccountReport hasTheSameElementsAs: anExpectedReport! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:01:07'!
test05AccountSummaryOfAReceptiveAccountWithAnIncomingTransferShowsCorrectly
	
	| aReceptiveAccount aReceptiveAccountReport anExpectedReport anotherReceptiveAccount |
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: anotherReceptiveAccount to: aReceptiveAccount.
	
	aReceptiveAccountReport := (AccountSummary of: aReceptiveAccount) summary.
	anExpectedReport := OrderedCollection 
			with: 'Entrada por transferencia de 100 * pesos' 
			with: 'Balance = 100 * pesos'.
	
	self assertThat: aReceptiveAccountReport hasTheSameElementsAs: anExpectedReport! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:01:07'!
test06AccountSummaryOfAReceptiveAccountWithMultipleTransactionsShowsCorrectly
	
	| aReceptiveAccount aReceptiveAccountReport anotherReceptiveAccount anExpectedReport |
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: aReceptiveAccount.
	Withdraw register: 50 * peso on: aReceptiveAccount.
	Transfer amount: 20 * peso  from: aReceptiveAccount  to: anotherReceptiveAccount.
	Transfer amount: 30 * peso from: anotherReceptiveAccount to: aReceptiveAccount.
	
	aReceptiveAccountReport := (AccountSummary of: aReceptiveAccount) summary.
	anExpectedReport := OrderedCollection withAll: {
		'Depósito por 100 * pesos'.
		'Extracción por 50 * pesos'.
		'Salida por transferencia de 20 * pesos'.
		'Entrada por transferencia de 30 * pesos'.
		'Balance = 60 * pesos' }.
	
	self assertThat: aReceptiveAccountReport hasTheSameElementsAs: anExpectedReport.
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:02:13'!
test07AccountSummaryOfAPortfolioWithoutTransactionsShowsCorrectly
	
	| aPortfolio aPortfolioReport anExpectedAccountReport |
	aPortfolio := Portfolio new.
	
	aPortfolioReport := (AccountSummary of: aPortfolio) summary.
	anExpectedAccountReport := OrderedCollection with: 'Balance = 0 * pesos'.
	
	self assertThat: aPortfolioReport hasTheSameElementsAs: anExpectedAccountReport.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:02:49'!
test08AccountSummaryOfAPortfolioWithATransactionShowsCorrectly
	
	| aPortfolio aPortfolioReport aReceptiveAccount anExpectedPortfolioReport |
	aPortfolio := Portfolio new.
	aReceptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: aReceptiveAccount.
	aPortfolio add: aReceptiveAccount.
	
	aPortfolioReport := (AccountSummary of: aPortfolio) summary.
	anExpectedPortfolioReport := OrderedCollection withAll: {
		'Depósito por 100 * pesos'.
		'Balance = 100 * pesos'}.
	
	self assertThat: aPortfolioReport hasTheSameElementsAs: anExpectedPortfolioReport.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:04:25'!
test09AccountSummaryOfAPortfolioWithAPortfolioAndMultipleTransactionsShowsCorrectly

	| aPortfolio anotherPortfolio aPortfolioReport aReceptiveAccount anotherReceptiveAccount anExpectedPortfolioReport |
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: aReceptiveAccount.
	Withdraw register: 50 * peso on: anotherReceptiveAccount.
	
	anotherPortfolio add: aReceptiveAccount.
	aPortfolio add: anotherPortfolio.
	aPortfolio add: anotherReceptiveAccount.
	
	aPortfolioReport := (AccountSummary of: aPortfolio) summary.
	anExpectedPortfolioReport := OrderedCollection withAll: {
		'Extracción por 50 * pesos'	.
		'Depósito por 100 * pesos'.
		'Balance = 50 * pesos'}.
	
	self assertThat: aPortfolioReport hasTheSameElementsAs: anExpectedPortfolioReport.! !


!AccountSummaryTest methodsFor: 'validations' stamp: 'ca 6/16/2022 14:01:07'!
assertThat: aReceptiveAccountReport hasTheSameElementsAs: anExpectedReport

	^ self assert: ((aReceptiveAccountReport difference: anExpectedReport) isEmpty)! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #SpecialReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #SpecialReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!SpecialReportTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:15:16'!
test01PortfolioTreePrinterOfAPortfolioWithNoAccountsShowsCorrectly

	| aPortfolio aPortfolioTreePrinter anExcpectedReport |
	
	aPortfolio := Portfolio named: 'Portfolio de la familia'.
	
	aPortfolioTreePrinter := aPortfolio treePrinter.
	anExcpectedReport := OrderedCollection with: 'Portfolio de la familia'.
	
	self assert: (aPortfolioTreePrinter = anExcpectedReport).! !

!SpecialReportTest methodsFor: 'tests' stamp: 'ca 6/15/2022 20:26:08'!
test02PortfolioTreePrinterOfAPortfolioWithOneAccountShowsCorrectly

	| aPortfolio aPortfolioTreePrinter anExcpectedReport angiesAccount |
	
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: angiesAccount.
	
	aPortfolioTreePrinter := aPortfolio treePrinter.
	anExcpectedReport := OrderedCollection withAll: 
		{ 'Portfolio de la familia'. String tab, 'Cuenta de Angeles' }.
	
	self assert: (aPortfolioTreePrinter = anExcpectedReport).! !

!SpecialReportTest methodsFor: 'tests' stamp: 'ca 6/15/2022 20:26:02'!
test03PortfolioTreePrinterOfAPortfolioWithManyAccountsShowsCorrectly

	| aPortfolio aPortfolioTreePrinter anExcpectedReport angiesAccount myAccount |
	
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: angiesAccount with: myAccount.
	
	aPortfolioTreePrinter := aPortfolio treePrinter.
	anExcpectedReport := OrderedCollection withAll: 
		{ 'Portfolio de la familia'. 
		String tab, 'Cuenta de Angeles'. 
		String tab, 'Cuenta mia'}.
	
	self assert: (aPortfolioTreePrinter = anExcpectedReport).! !

!SpecialReportTest methodsFor: 'tests' stamp: 'ca 6/15/2022 20:25:56'!
test04PortfolioTreePrinterOfAPortfolioWithAnEmptyPortfolioShowsCorrectly

	
	| aPortfolio aPortfolioTreePrinter anExcpectedReport childrenPortfolio |
	
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: childrenPortfolio.
	
	aPortfolioTreePrinter := aPortfolio treePrinter.
	anExcpectedReport := OrderedCollection withAll: 
		{ 'Portfolio de la familia'. 
		String tab, 'Portfolio de hijos'}.
	
	self assert: (aPortfolioTreePrinter = anExcpectedReport).! !

!SpecialReportTest methodsFor: 'tests' stamp: 'ca 6/15/2022 20:25:50'!
test05PortfolioTreePrinterOfAPortfolioThatContainsAPortfolioWithOneAccountShowsCorrectly

	| aPortfolio aPortfolioTreePrinter anExcpectedReport angiesAccount childrenPortfolio |
	
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: angiesAccount. 
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: childrenPortfolio.
	aPortfolioTreePrinter := aPortfolio treePrinter.
	anExcpectedReport := OrderedCollection withAll: 
		{ 'Portfolio de la familia'. 
		String tab,'Portfolio de hijos'. 
		String tab, String tab, 'Cuenta de Angeles'}.
	
	self assert: (aPortfolioTreePrinter = anExcpectedReport).! !

!SpecialReportTest methodsFor: 'tests' stamp: 'ca 6/15/2022 20:25:43'!
test06PortfolioDetailTreePrinterOfAPortfolioWithNoAccountsShowsCorrectly

	| aPortfolio aPortfolioTreePrinter anExcpectedReport |
	
	aPortfolio := Portfolio named: 'Portfolio de la familia'.
	
	aPortfolioTreePrinter := aPortfolio detailedTreePrinter.
	anExcpectedReport := OrderedCollection with: 'Portfolio de la familia' with: String tab, 'Balance = 0 * pesos'.
	
	self assert: (aPortfolioTreePrinter = anExcpectedReport).! !

!SpecialReportTest methodsFor: 'tests' stamp: 'ca 6/15/2022 20:26:40'!
test07PortfolioDetailedTreePrinterOfAPortfolioWithOneAccountShowsCorrectly

	| aPortfolio aPortfolioTreePrinter anExcpectedReport angiesAccount |
	
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: angiesAccount.
	
	aPortfolioTreePrinter := aPortfolio detailedTreePrinter.
	anExcpectedReport := OrderedCollection withAll: { 
		'Portfolio de la familia'. 
		String tab, 'Cuenta de Angeles'.
		String tab, String tab, 'Balance = 0 * pesos'.
		String tab, 'Balance = 0 * pesos'
	}.
	
	self assert: (aPortfolioTreePrinter = anExcpectedReport).! !

!SpecialReportTest methodsFor: 'tests' stamp: 'ca 6/16/2022 12:08:58'!
test08PortfolioDetailedTreePrinterOfAPortfolioWithManyAccountsShowsCorrectly

	| aPortfolio aPortfolioTreePrinter anExcpectedReport angiesAccount myAccount |
	
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: angiesAccount with: myAccount.
	
	aPortfolioTreePrinter := aPortfolio detailedTreePrinter.
	anExcpectedReport := OrderedCollection withAll: { 
		'Portfolio de la familia'. 
		String tab, 'Cuenta de Angeles'.
		String tab, String tab, 'Balance = 0 * pesos'.
		String tab, 'Cuenta mia'.
		String tab, String tab, 'Balance = 0 * pesos'.
		String tab, 'Balance = 0 * pesos'
	}.
	
	self assert: (aPortfolioTreePrinter = anExcpectedReport).! !

!SpecialReportTest methodsFor: 'tests' stamp: 'ca 6/15/2022 20:32:39'!
test09PortfolioDetailedTreePrinterOfAPortfolioWithOneTransactionShowsCorrectly

	| aPortfolio aPortfolioTreePrinter anExcpectedReport angiesAccount |
	
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	Deposit register: 100 * peso on:  angiesAccount.
	
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: angiesAccount.
	
	aPortfolioTreePrinter := aPortfolio detailedTreePrinter.
	anExcpectedReport := OrderedCollection withAll: { 
		'Portfolio de la familia'. 
		String tab, 'Cuenta de Angeles'.
		String tab, String tab, 'Depósito por 100 * pesos'.
		String tab, String tab, 'Balance = 100 * pesos'.
		String tab, 'Balance = 100 * pesos'
		}.
	
	self assert: (aPortfolioTreePrinter = anExcpectedReport).! !

!SpecialReportTest methodsFor: 'tests' stamp: 'ca 6/15/2022 20:28:01'!
test10PortfolioDetailedTreePrinterOfAPortfolioWithAnEmptyPortfolioShowsCorrectly

	| aPortfolio aPortfolioTreePrinter anExcpectedReport childrenPortfolio |
	
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: childrenPortfolio.
	
	aPortfolioTreePrinter := aPortfolio detailedTreePrinter.
	anExcpectedReport := OrderedCollection withAll: { 
		'Portfolio de la familia'. 
		String tab, 'Portfolio de hijos'.
		String tab, String tab, 'Balance = 0 * pesos'.
		String tab, 'Balance = 0 * pesos'
		}.
	
	self assert: (aPortfolioTreePrinter = anExcpectedReport).! !

!SpecialReportTest methodsFor: 'tests' stamp: 'ca 6/15/2022 20:29:21'!
test11PortfolioDetailedTreePrinterOfAPortfolioWithAPortfolioThatContainsAPortfolioShowsCorrectly

	| aPortfolio aPortfolioTreePrinter anExcpectedReport childrenPortfolio |
	
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: (Portfolio named: 'Portfolio de nietos').
	
	aPortfolio := Portfolio named: 'Portfolio de la familia' with: childrenPortfolio.
	
	aPortfolioTreePrinter := aPortfolio detailedTreePrinter.
	anExcpectedReport := OrderedCollection withAll: { 
		'Portfolio de la familia'. 
		String tab, 'Portfolio de hijos'.
		String tab, String tab,'Portfolio de nietos'.
		String tab, String tab, String tab, 'Balance = 0 * pesos'.
		String tab, String tab, 'Balance = 0 * pesos'.
		String tab, 'Balance = 0 * pesos'
		}.
	
	self assert: (aPortfolioTreePrinter = anExcpectedReport).! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:07:12'!
test01TransferNetOfReceptiveAccountWithNoTransactionsIsZero
	
	| aReceptiveAccount aReceptiveAccountTransferNet anExpectedTransferNet |
	aReceptiveAccount := ReceptiveAccount new.
	
	aReceptiveAccountTransferNet := (TransferNet of: aReceptiveAccount) transferNet.
	anExpectedTransferNet :=  0 * peso.
	
	self assert: aReceptiveAccountTransferNet equals: anExpectedTransferNet.! !

!TransferNetTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:07:22'!
test02TransferNetOfReceptiveAccountWithARecievingTransferIsCorrect
	
	| aReceptiveAccount aReceptiveAccountTransferNet anExpectedTransferNet anotherReceptiveAccount |
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	
	Transfer amount: 100 * peso  from: anotherReceptiveAccount to: aReceptiveAccount.
	
	aReceptiveAccountTransferNet := (TransferNet of: aReceptiveAccount) transferNet.
	anExpectedTransferNet := 100 * peso.
	
	self assert: aReceptiveAccountTransferNet equals: anExpectedTransferNet.! !

!TransferNetTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:07:35'!
test03TransferNetOfReceptiveAccountWithAnExitingTransferIsCorrect
	
	| aReceptiveAccount aReceptiveAccountTransferNet anExpectedTransferNet anotherReceptiveAccount |
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	Transfer amount: 100 * peso  from: anotherReceptiveAccount to: aReceptiveAccount.
	
	aReceptiveAccountTransferNet := (TransferNet of: anotherReceptiveAccount) transferNet.
	anExpectedTransferNet := -100 * peso.
	
	self assert: aReceptiveAccountTransferNet equals: anExpectedTransferNet.! !

!TransferNetTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:07:39'!
test04TransferNetOfReceptiveAccountWithMultipleTransfersIsCorrect
	
	| aReceptiveAccount aReceptiveAccountTransferNet anExpectedTransferNet anotherReceptiveAccount |
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	
	Transfer amount: 100 * peso  from: anotherReceptiveAccount to: aReceptiveAccount.
	Transfer amount: 50 * peso  from: aReceptiveAccount to: anotherReceptiveAccount.
	Transfer amount: 25 * peso  from: anotherReceptiveAccount to: aReceptiveAccount.
	
	aReceptiveAccountTransferNet := (TransferNet of: aReceptiveAccount) transferNet.
	anExpectedTransferNet := 75 * peso.
	
	self assert: aReceptiveAccountTransferNet equals: anExpectedTransferNet.! !

!TransferNetTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:07:45'!
test05TransferNetOfARecepetiveAccountWithADepositIsZero
	
	| aReceptiveAccount aReceptiveAccountTransferNet anExpectedTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: aReceptiveAccount.
	
	aReceptiveAccountTransferNet := (TransferNet of: aReceptiveAccount) transferNet.
	anExpectedTransferNet :=  0 * peso.
	
	self assert: aReceptiveAccountTransferNet equals: anExpectedTransferNet.! !

!TransferNetTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:07:50'!
test06TransferNetOfARecepetiveAccountWithAWithdrawIsZero
	
	| aReceptiveAccount aReceptiveAccountTransferNet anExpectedTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	
	Withdraw register: 100 * peso on: aReceptiveAccount.
	
	aReceptiveAccountTransferNet := (TransferNet of: aReceptiveAccount) transferNet.
	anExpectedTransferNet :=  0 * peso.
	
	self assert: aReceptiveAccountTransferNet equals: anExpectedTransferNet.! !

!TransferNetTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:08:05'!
test07TransferNetOfAPortfolioWithNoTransactionsIsZero
	
	| aPortfolio aPortfolioTransferNet anExpectedTransferNet |
	aPortfolio := Portfolio new.
	
	aPortfolioTransferNet := (TransferNet of: aPortfolio) transferNet.
	anExpectedTransferNet := 0 * peso.
	
	self assert: aPortfolioTransferNet equals: anExpectedTransferNet.! !

!TransferNetTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:08:20'!
test08TransferNetOfAPortfolioWithAnAccountWithATransferIsCorrect
	
	| aPortfolio aPortfolioTransferNet aReceptiveAccount anExpectedPortfolioTransferNet anotherReceptiveAccount |
	aPortfolio := Portfolio new.
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	
	Transfer amount: 100 * peso from: anotherReceptiveAccount to: aReceptiveAccount.
	aPortfolio add: aReceptiveAccount.
	
	aPortfolioTransferNet := (TransferNet of: aPortfolio) transferNet.
	anExpectedPortfolioTransferNet := 100 * peso.
	
	self assert: aPortfolioTransferNet equals: anExpectedPortfolioTransferNet.! !

!TransferNetTest methodsFor: 'tests' stamp: 'ca 6/16/2022 14:08:25'!
test09TransferNetOfAPortfolioOfPortfoliosWithAnAccountWithTransfersIsCorrect
	
	| aPortfolio aPortfolioTransferNet aReceptiveAccount anExpectedPortfolioTransferNet anotherReceptiveAccount anotherPortfolio |
	
	aPortfolio := Portfolio new.
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	anotherPortfolio := Portfolio new.
	
	Transfer amount: 100 * peso from: anotherReceptiveAccount to: aReceptiveAccount.
	Transfer amount: 200 * peso from: anotherReceptiveAccount to: aReceptiveAccount.
	Transfer amount: 300 * peso from: anotherReceptiveAccount to: aReceptiveAccount.
	anotherPortfolio add: aReceptiveAccount.
	aPortfolio add: anotherPortfolio.
	
	aPortfolioTransferNet := (TransferNet of: aPortfolio) transferNet.
	anExpectedPortfolioTransferNet := 600 * peso.
	
	self assert: aPortfolioTransferNet equals: anExpectedPortfolioTransferNet.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'NC 6/14/2022 16:46:46'!
initializeNamed: aName 

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := aName.! !

!Portfolio methodsFor: 'initialization' stamp: 'NC 6/14/2022 16:59:09'!
initializeNamed: aName with: anAccount 
	
	accounts := OrderedCollection with: anAccount.
	parents := OrderedCollection new.
	name := aName.! !

!Portfolio methodsFor: 'initialization' stamp: 'NC 6/14/2022 17:32:04'!
initializeNamed: aName with: anAccount with: anotherAccount 

	accounts := OrderedCollection with: anAccount with: anotherAccount.
	parents := OrderedCollection new.
	name := aName.

	! !


!Portfolio methodsFor: 'main protocol' stamp: 'NC 6/10/2022 20:39:27'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'NC 6/11/2022 19:20:23'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^ transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'main protocol - tree printer' stamp: 'ca 6/16/2022 14:18:03'!
detailedTreePrinter
	
	| aPortfolioDetailedTree |
	aPortfolioDetailedTree := OrderedCollection new.
	
	self addMyselfWith: 0 andMyChildrenWithTheirSummariesTo: aPortfolioDetailedTree.
	
	^ aPortfolioDetailedTree.! !

!Portfolio methodsFor: 'main protocol - tree printer' stamp: 'ca 6/14/2022 18:56:04'!
treePrinter

	| aPortfolioTree |
	
	aPortfolioTree := OrderedCollection new.
	
	self addMyselfWith: 0 andMyChildrenTo: aPortfolioTree.
	
	^ aPortfolioTree! !


!Portfolio methodsFor: 'private - tree printer' stamp: 'ca 6/14/2022 18:32:52'!
addMyNameTo: anOrderedCollectionOfNames withAnAmountOfTabs: anAmountOfTabs

	anOrderedCollectionOfNames add: (self myNameWith: anAmountOfTabs).! !

!Portfolio methodsFor: 'private - tree printer' stamp: 'ca 6/16/2022 14:16:42'!
addMySummaryTo: aPortfolioDetailedTree withAnAmountOfTabs: anAmountOfTabs
	
	aPortfolioDetailedTree add: (self stringWithAnAmountOfTabs: anAmountOfTabs), 'Balance = ', self balance asString.! !

!Portfolio methodsFor: 'private - tree printer' stamp: 'ca 6/14/2022 18:55:29'!
addMyselfWith: anAmountOfTabs andMyChildrenTo: aPortfolioTree

	self addMyNameTo: aPortfolioTree  withAnAmountOfTabs: anAmountOfTabs. "me añado a mi mismo"
	
	accounts do: [ :anAccount | anAccount addMyselfWith: anAmountOfTabs +1 andMyChildrenTo: aPortfolioTree ]. "añado a mis hijos"
	
! !

!Portfolio methodsFor: 'private - tree printer' stamp: 'ca 6/16/2022 14:17:05'!
addMyselfWith: anAmountOfTabs andMyChildrenWithTheirSummariesTo: aPortfolioDetailedTree.

	self addMyNameTo: aPortfolioDetailedTree  withAnAmountOfTabs: anAmountOfTabs.
	
	accounts do: [:anAccount | 
		anAccount addMyselfWith: (anAmountOfTabs + 1) andMyChildrenWithTheirSummariesTo: aPortfolioDetailedTree.
	].

	self addMySummaryTo: aPortfolioDetailedTree withAnAmountOfTabs: anAmountOfTabs + 1! !

!Portfolio methodsFor: 'private - tree printer' stamp: 'ca 6/16/2022 14:17:29'!
myNameWith: anAmountOfTabs

	^ (self stringWithAnAmountOfTabs: anAmountOfTabs) , name 
	! !

!Portfolio methodsFor: 'private - tree printer' stamp: 'ca 6/16/2022 13:55:02'!
stringWithAnAmountOfTabs: anAmountOfTabs

	| aStringWithAnAmountOfTabs | 
	
	aStringWithAnAmountOfTabs := ''.
	anAmountOfTabs timesRepeat: [ aStringWithAnAmountOfTabs := String tab, aStringWithAnAmountOfTabs ].
	
	^aStringWithAnAmountOfTabs ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error description' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'NC 6/14/2022 16:46:07'!
named: aName 
	
	^self new initializeNamed: aName ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'NC 6/14/2022 16:59:20'!
named: aName with: anAccount 

	^self new initializeNamed: aName with: anAccount ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'NC 6/14/2022 17:31:19'!
named: aName with: anAccount with: anotherAccount

	^self new initializeNamed: aName with: anAccount with: anotherAccount ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'NC 6/14/2022 18:18:15'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'NC 6/14/2022 18:18:26'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NC 6/14/2022 16:56:07'!
initialize

	"super initialize."
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NC 6/14/2022 16:55:35'!
initializeNamed: aName 
	
	super initialize.
	transactions := OrderedCollection new.
	name := aName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NC 6/10/2022 19:44:51'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'tree printer' stamp: 'ca 6/16/2022 14:18:20'!
addMySummaryTo: aPortfolioDetailedTree withAnAmountOfTabs: anAmountOfTabs

	| myTransactions aStringWithAnAmountOfTabs |
	
	myTransactions := (AccountSummary of: self) summary.
	
	aStringWithAnAmountOfTabs := self stringWithAnAmountOfTabs: anAmountOfTabs.
	
	myTransactions do: [ :aTransaction | 
		aPortfolioDetailedTree add: aStringWithAnAmountOfTabs, aTransaction.
	].	
	! !

!ReceptiveAccount methodsFor: 'tree printer' stamp: 'ca 6/14/2022 18:55:29'!
addMyselfWith: anAmountOfTabs andMyChildrenTo: aPortfolioTree

	self addMyNameTo: aPortfolioTree  withAnAmountOfTabs: anAmountOfTabs.! !

!ReceptiveAccount methodsFor: 'tree printer' stamp: 'ca 6/15/2022 20:16:41'!
addMyselfWith: anAmountOfTabs andMyChildrenWithTheirSummariesTo: aPortfolioTree

	self addMyNameTo: aPortfolioTree  withAnAmountOfTabs: anAmountOfTabs.
	self addMySummaryTo: aPortfolioTree withAnAmountOfTabs: anAmountOfTabs + 1.! !


!ReceptiveAccount methodsFor: 'private - tree printer' stamp: 'NC 6/14/2022 17:25:26'!
addMyNameTo: anOrderedCollectionOfNames withAnAmountOfTabs: anAmountOfTabs

	anOrderedCollectionOfNames add: (self myNameWith: anAmountOfTabs).! !

!ReceptiveAccount methodsFor: 'private - tree printer' stamp: 'ca 6/16/2022 14:18:34'!
myNameWith: anAmountOfTabs
	
	^ (self stringWithAnAmountOfTabs: anAmountOfTabs) , name
	! !

!ReceptiveAccount methodsFor: 'private - tree printer' stamp: 'ca 6/16/2022 13:55:07'!
stringWithAnAmountOfTabs: anAmountOfTabs

	| aStringWithAnAmountOfTabs | 
	
	aStringWithAnAmountOfTabs := ''.
	anAmountOfTabs timesRepeat: [ aStringWithAnAmountOfTabs := String tab, aStringWithAnAmountOfTabs ].
	
	^aStringWithAnAmountOfTabs ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'NC 6/14/2022 16:54:54'!
named: aName

	^self new initializeNamed: aName ! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountSummary
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'initialization' stamp: 'NC 6/11/2022 19:18:38'!
intializeOf: anAccount

	account := anAccount! !


!AccountSummary methodsFor: 'private' stamp: 'NC 6/11/2022 19:18:38'!
accountBalanceAsStringForSummary
	
	^ 'Balance = ', account balance asString

	! !

!AccountSummary methodsFor: 'private' stamp: 'ca 6/16/2022 14:18:45'!
collectAllTransactionsAsString
	
	| accountSummary | 
	accountSummary := OrderedCollection new.
	
	account transactions do: [ :aTransaction | accountSummary add: ( aTransaction accept: self )].
		
	^ accountSummary! !

!AccountSummary methodsFor: 'private' stamp: 'ca 6/14/2022 15:51:06'!
depositAsString: aDeposit

	^ 'Depósito por ', (aDeposit value asString).! !

!AccountSummary methodsFor: 'private' stamp: 'ca 6/14/2022 15:55:26'!
depositLegAsString: aDepositLeg

	^ 'Entrada por transferencia de ', (aDepositLeg value asString)! !

!AccountSummary methodsFor: 'private' stamp: 'ca 6/14/2022 15:59:36'!
withdrawAsString: aWithdraw

	^ 'Extracción por ',  (aWithdraw value asString).! !

!AccountSummary methodsFor: 'private' stamp: 'ca 6/14/2022 15:57:28'!
withdrawLegAsString: aWithdrawLeg

	^ 'Salida por transferencia de ', ( aWithdrawLeg value asString)! !


!AccountSummary methodsFor: 'basic operations' stamp: 'NC 6/11/2022 19:10:39'!
summary
	
	| accountSummary | 
	
	accountSummary := self collectAllTransactionsAsString.
	accountSummary add: self accountBalanceAsStringForSummary.
	
	^ accountSummary! !


!AccountSummary methodsFor: 'private - visitor' stamp: 'ca 6/15/2022 18:41:21'!
visitDeposit: aDeposit

	^ self depositAsString: aDeposit! !

!AccountSummary methodsFor: 'private - visitor' stamp: 'ca 6/15/2022 18:42:48'!
visitDepositLeg: aDepositLeg

	^ self depositLegAsString: aDepositLeg! !

!AccountSummary methodsFor: 'private - visitor' stamp: 'ca 6/15/2022 18:42:19'!
visitWithdraw: aWithdraw

	^ self withdrawAsString: aWithdraw! !

!AccountSummary methodsFor: 'private - visitor' stamp: 'ca 6/15/2022 18:43:24'!
visitWithdrawLeg: aWithdrawLeg

	^ self withdrawLegAsString: aWithdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'NC 6/11/2022 17:50:04'!
of: anAccount
	
	^ self new intializeOf: anAccount.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'visitor' stamp: 'ca 6/15/2022 18:48:23'!
accept: aReport

	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'visitor' stamp: 'ca 6/15/2022 18:40:32'!
accept: aReport
	
	^ aReport visitDeposit: self 
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'NC 6/11/2022 19:04:50'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'visitor' stamp: 'ca 6/15/2022 18:44:03'!
accept: aReport
	
	^ aReport visitDepositLeg: self 
	! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'visitor' stamp: 'ca 6/15/2022 18:44:20'!
accept: aReport
	
	^ aReport visitWithdrawLeg: self ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'visitor' stamp: 'ca 6/15/2022 18:44:38'!
accept: aReport
	
	^ aReport visitWithdraw: self ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Object subclass: #TransferNet
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'initialization' stamp: 'NC 6/11/2022 19:36:04'!
initializeOf: anAccount

	account := anAccount
	! !


!TransferNet methodsFor: 'basic operations' stamp: 'ca 6/15/2022 19:05:11'!
transferNet

	 ^ account transactions 
		inject: 0 * peso
		into: [ :aTransferNet :aTransaction | aTransferNet + (aTransaction accept: self)].! !


!TransferNet methodsFor: 'private - visitor' stamp: 'ca 6/15/2022 19:01:41'!
visitDeposit: aDeposit

	^ 0 * peso! !

!TransferNet methodsFor: 'private - visitor' stamp: 'ca 6/15/2022 19:03:56'!
visitDepositLeg: aDepositLeg

	^ aDepositLeg value! !

!TransferNet methodsFor: 'private - visitor' stamp: 'ca 6/15/2022 19:02:14'!
visitWithdraw: aWithdraw

	^ 0 * peso! !

!TransferNet methodsFor: 'private - visitor' stamp: 'ca 6/15/2022 19:03:13'!
visitWithdrawLeg: aWithdrawLeg

	^ aWithdrawLeg value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancieros-Solucion'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'NC 6/11/2022 19:35:35'!
of: anAccount

	^ self new initializeOf: anAccount! !
