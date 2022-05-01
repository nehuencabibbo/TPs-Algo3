!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'privado' stamp: 'NC 4/30/2022 20:17:04'!
validarQueElTiempoQueSeTardaEn: unBloqueDeCodigo esMenorQue: unTiempoDetermindado
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	unBloqueDeCodigo  value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: millisecondsAfterRunning - millisecondsBeforeRunning < unTiempoDetermindado.

	

	
! !

!CustomerBookTest methodsFor: 'privado' stamp: 'ca 5/1/2022 17:31:15'!
validarQueFalla: unBloqueDeCodigo por: unError yOcurreComoConsecuencia: otroBloqueDeCodigo

	| unaAccionQueDebeFallar consecuenciaDelError |
	
	unaAccionQueDebeFallar := unBloqueDeCodigo.
	consecuenciaDelError := otroBloqueDeCodigo.

	[unaAccionQueDebeFallar value. self fail]
		on: unError
		do: consecuenciaDelError
		
! !

!CustomerBookTest methodsFor: 'privado' stamp: 'ca 5/1/2022 17:31:35'!
validarQueHayEn: unCustomerBook unTotalDeClientesActivosDe: cantidadDeClientesActivos yUnTotalDeClientesSuspendidosDe: cantidadDeClientesSuspendidos

	self assert: cantidadDeClientesActivos equals: unCustomerBook numberOfActiveCustomers.
	self assert: cantidadDeClientesSuspendidos equals: unCustomerBook numberOfSuspendedCustomers.
	self assert: cantidadDeClientesActivos + cantidadDeClientesSuspendidos equals: unCustomerBook numberOfCustomers.! !


!CustomerBookTest methodsFor: 'testing' stamp: 'NC 5/1/2022 00:22:59'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook  añadirUnCliente |
	
	customerBook := CustomerBook new.
	
	añadirUnCliente := [ customerBook addCustomerNamed: 'John Lennon'. ].
	
	self validarQueElTiempoQueSeTardaEn: añadirUnCliente esMenorQue: 50 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NC 5/1/2022 00:23:05'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	
	| customerBook  añadirUnCliente |
	
	customerBook := CustomerBook new.
	
	añadirUnCliente := [ customerBook addCustomerNamed: 'Paul McCartney'. ].
	
	self validarQueElTiempoQueSeTardaEn: añadirUnCliente esMenorQue: 100 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NC 5/1/2022 14:32:39'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook accionARealizar error consecuenciaDelError |
			
	customerBook := CustomerBook new.
	
	accionARealizar := [ customerBook addCustomerNamed: '' ].
	error := Error.
	consecuenciaDelError := [ :anError |
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty.
		].
	
	self validarQueFalla: accionARealizar por: error yOcurreComoConsecuencia: consecuenciaDelError
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NC 5/1/2022 00:03:55'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon accionARealizar error consecuenciaDelError|
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.

	accionARealizar := [
		customerBook addCustomerNamed: johnLennon. 
		customerBook removeCustomerNamed: 'Paul McCartney'.
	].
	error := NotFound.
	consecuenciaDelError := [ 
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon).
	].

	self validarQueFalla: accionARealizar por: error yOcurreComoConsecuencia: consecuenciaDelError.
	

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NC 5/1/2022 15:52:02'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney cantidadDeClientesActivos cantidadDeClientesSuspendidos |
	
	customerBook := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
	cantidadDeClientesActivos  := 0.
	cantidadDeClientesSuspendidos := 1.
	
	customerBook añadirYSuspender: paulMcCartney.
	
	self validarQueHayEn: customerBook unTotalDeClientesActivosDe: cantidadDeClientesActivos yUnTotalDeClientesSuspendidosDe: cantidadDeClientesSuspendidos.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NC 5/1/2022 15:52:15'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney cantidadDeClientesActivos cantidadDeClientesSuspendidos |
	
	customerBook := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
	cantidadDeClientesActivos  := 0.
	cantidadDeClientesSuspendidos := 0.
	
	customerBook añadirYSuspender: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self validarQueHayEn: customerBook unTotalDeClientesActivosDe: cantidadDeClientesActivos yUnTotalDeClientesSuspendidosDe: cantidadDeClientesSuspendidos.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NC 5/1/2022 00:07:17'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon accionARealizar error consecuenciaDelError |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	
	accionARealizar := [
		customerBook addCustomerNamed: johnLennon. 
		customerBook suspendCustomerNamed: 'Ringo Starr'.
	].
	error := CantSuspend.
	consecuenciaDelError :=[
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon).
	].

	self validarQueFalla: accionARealizar por: error yOcurreComoConsecuencia: consecuenciaDelError.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NC 5/1/2022 00:10:26'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon accionARealizar error consecuenciaDelError |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	
	accionARealizar := 	[	
		customerBook addCustomerNamed: johnLennon.
		customerBook suspendCustomerNamed: johnLennon.
		customerBook suspendCustomerNamed: johnLennon.
	].
	error := CantSuspend.
	consecuenciaDelError := [ 
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon). 
	].

	self validarQueFalla: accionARealizar por: error yOcurreComoConsecuencia: consecuenciaDelError.

! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NC 5/1/2022 00:22:15'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NC 5/1/2022 00:31:07'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NC 5/1/2022 00:31:13'!
añadirYSuspender: unaPersona

	self addCustomerNamed: unaPersona.
	self suspendCustomerNamed: unaPersona.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NC 5/1/2022 00:31:50'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'ca 5/1/2022 17:30:14'!
removeCustomerNamed: aName 
 
	^active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [NotFound signal.]].
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
