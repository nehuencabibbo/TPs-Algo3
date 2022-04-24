!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: ''!

!AvispaLara class methodsFor: 'funcionalidades basicas' stamp: 'NC 4/23/2022 18:56:25'!
agregarUnHuevo
	self robarHuevo ifTrue: [ElHabitat agregarUnHuevoConLaFirmaGeneticaDeLara.]
	! !

!AvispaLara class methodsFor: 'funcionalidades basicas' stamp: 'NC 4/23/2022 18:55:29'!
intentarReproducirse
	ElHabitat cantidadDeHuevosDeAvispas > 0 ifTrue: [ 
		self agregarUnHuevo.
	].
	! !


!AvispaLara class methodsFor: 'privado' stamp: 'NC 4/24/2022 19:05:01'!
robarHuevo
	ElHabitat cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella > 0 ifTrue: [
		ElHabitat sacarUnHuevoConLaFirmaGeneticaDeOrianaYOrnella.
		^true
	].
	ElHabitat cantidadDeHuevosConLaFirmaGeneticaDePolly > 0 ifTrue: [
		ElHabitat sacarUnHuevoConLaFirmaGeneticaDePolly. 
		^true
	].
	^false! !


!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: ''!

!AvispaOriana class methodsFor: 'funcionalidades basicas' stamp: 'NC 4/24/2022 18:34:31'!
agregarUnHuevo
	ElHabitat agregarUnHuevoConLaFirmaGeneticaDeOrianaYOrnella.
	ElHabitat sacarUnaOruga.
	! !

!AvispaOriana class methodsFor: 'funcionalidades basicas' stamp: 'NC 4/23/2022 18:54:32'!
intentarReproducirse
	ElHabitat cantidadDeOrugas > 0 ifTrue: [ 
		self agregarUnHuevo.
		].
	! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #AvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejasParte2'!
AvispaPolly class
	instanceVariableNames: ''!

!AvispaPolly class methodsFor: 'funcionalidades basicas' stamp: 'NC 4/24/2022 18:34:04'!
agregarUnHuevo
	ElHabitat agregarUnHuevoConLaFirmaGeneticaDePolly.
	ElHabitat sacarUnaPolilla.
	! !

!AvispaPolly class methodsFor: 'funcionalidades basicas' stamp: 'NC 4/23/2022 18:56:00'!
intentarReproducirse
	ElHabitat cantidadDePolillas > 0 ifTrue: [ 
		self agregarUnHuevo.
		].
	! !


!classDefinition: #ElHabitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #ElHabitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElHabitat class' category: 'AvispasYAbejasParte2'!
ElHabitat class
	instanceVariableNames: 'cantidadDeHuevosDeAvispa cantidadDeRecursos'!

!ElHabitat class methodsFor: 'funcionalidades de Lara' stamp: 'NC 4/24/2022 19:13:21'!
agregarUnHuevoConLaFirmaGeneticaDeLara
	cantidadDeHuevosDeAvispa at: 'HuevosDeLara' put: self cantidadDeHuevosConLaFirmaGeneticaDeLara + 1.! !

!ElHabitat class methodsFor: 'funcionalidades de Lara' stamp: 'ca 4/23/2022 20:21:31'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^cantidadDeHuevosDeAvispa at: 'HuevosDeLara'! !


!ElHabitat class methodsFor: 'funcionalidades basicas' stamp: 'NC 4/24/2022 19:07:48'!
cantidadDeHuevosDeAvispas
	^ self cantidadDeHuevosConLaFirmaGeneticaDeLara + self cantidadDeHuevosConLaFirmaGeneticaDePolly + self cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella! !

!ElHabitat class methodsFor: 'funcionalidades basicas' stamp: 'NC 4/24/2022 19:12:09'!
retrocederAlInicioDeLosTiempos
	cantidadDeHuevosDeAvispa  := Dictionary new.
	cantidadDeHuevosDeAvispa  at: 'HuevosDeLara' put: 0.
	cantidadDeHuevosDeAvispa  at: 'HuevosDePolly' put: 0.
	cantidadDeHuevosDeAvispa  at: 'HuevosDeOrianaYOrnella' put: 0.
	
	cantidadDeRecursos := Dictionary new.
	cantidadDeRecursos at: 'Orugas' put: 0.
	cantidadDeRecursos at: 'Polillas' put: 0. ! !


!ElHabitat class methodsFor: 'agregar, eliminar y cantidad de recursos' stamp: 'NC 4/24/2022 18:56:12'!
agregarUnaOruga
	cantidadDeRecursos at: 'Orugas' put: self cantidadDeOrugas + 1! !

!ElHabitat class methodsFor: 'agregar, eliminar y cantidad de recursos' stamp: 'NC 4/24/2022 18:57:15'!
agregarUnaPolilla
	cantidadDeRecursos at: 'Polillas' put: self cantidadDePolillas + 1! !

!ElHabitat class methodsFor: 'agregar, eliminar y cantidad de recursos' stamp: 'NC 4/24/2022 18:54:18'!
cantidadDeOrugas
	^cantidadDeRecursos at: 'Orugas'! !

!ElHabitat class methodsFor: 'agregar, eliminar y cantidad de recursos' stamp: 'NC 4/24/2022 18:54:32'!
cantidadDePolillas
	^cantidadDeRecursos at: 'Polillas'! !

!ElHabitat class methodsFor: 'agregar, eliminar y cantidad de recursos' stamp: 'NC 4/24/2022 18:58:20'!
sacarUnaOruga
	self cantidadDeOrugas > 0 ifTrue: [
	cantidadDeRecursos at: 'Orugas' put: self cantidadDeOrugas - 1.
	].! !

!ElHabitat class methodsFor: 'agregar, eliminar y cantidad de recursos' stamp: 'NC 4/24/2022 18:57:51'!
sacarUnaPolilla
	self cantidadDePolillas > 0 ifTrue: [
	cantidadDeRecursos at: 'Polillas' put: self cantidadDePolillas - 1.
	].! !


!ElHabitat class methodsFor: 'funcionalidades de Polly' stamp: 'NC 4/24/2022 19:01:17'!
agregarUnHuevoConLaFirmaGeneticaDePolly
	cantidadDeHuevosDeAvispa at: 'HuevosDePolly' put: self cantidadDeHuevosConLaFirmaGeneticaDePolly + 1.! !

!ElHabitat class methodsFor: 'funcionalidades de Polly' stamp: 'ca 4/23/2022 20:25:53'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ cantidadDeHuevosDeAvispa at: 'HuevosDePolly'.! !

!ElHabitat class methodsFor: 'funcionalidades de Polly' stamp: 'NC 4/24/2022 19:03:12'!
sacarUnHuevoConLaFirmaGeneticaDePolly
	self cantidadDeHuevosConLaFirmaGeneticaDePolly > 0 ifTrue: [
	cantidadDeHuevosDeAvispa at: 'HuevosDePolly' put: self cantidadDeHuevosConLaFirmaGeneticaDePolly - 1.
	].! !


!ElHabitat class methodsFor: 'funcionalidades de Oriana y Ornella' stamp: 'NC 4/24/2022 19:03:58'!
agregarUnHuevoConLaFirmaGeneticaDeOrianaYOrnella
	cantidadDeHuevosDeAvispa at: 'HuevosDeOrianaYOrnella' put: self cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella + 1.! !

!ElHabitat class methodsFor: 'funcionalidades de Oriana y Ornella' stamp: 'NC 4/24/2022 19:12:31'!
cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella
	^cantidadDeHuevosDeAvispa at: 'HuevosDeOrianaYOrnella'.! !

!ElHabitat class methodsFor: 'funcionalidades de Oriana y Ornella' stamp: 'NC 4/24/2022 19:10:00'!
sacarUnHuevoConLaFirmaGeneticaDeOrianaYOrnella
	self cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella > 0 ifTrue: [
	cantidadDeHuevosDeAvispa at: 'HuevosDeOrianaYOrnella' put: self cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella - 1.
	].! !


!ElHabitat class methodsFor: '--** private fileout/in **--' stamp: 'NC 4/24/2022 19:15:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosDeAvispa := ((Dictionary new) add: ('HuevosDeLara'->1); add: ('HuevosDeOrianaYOrnella'->0); add: ('HuevosDePolly'->0); yourself).
	cantidadDeRecursos := ((Dictionary new) add: ('Orugas'->2); add: ('Polillas'->1); yourself).! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NC 4/22/2022 20:56:04'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeLara! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'ca 4/23/2022 20:41:56'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'ca 4/23/2022 20:39:37'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NC 4/22/2022 20:26:10'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDePolly ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Meme 4/21/2022 19:22:47'!
habitat
	^ ElHabitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NC 4/22/2022 20:17:24'!
hacerQueElHabitatTengaLosRecursosSuficientes
	2 timesRepeat: [ 
		self habitat agregarUnaOruga. 
		self habitat agregarUnaPolilla.
		]! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'NC 4/22/2022 20:55:27'!
laAvispaLara
	^AvispaLara! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Meme 4/21/2022 19:31:04'!
laAvispaOriana
	^AvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Meme 4/22/2022 19:11:41'!
laAvispaOrnella
	^AvispaOrnella ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Meme 4/22/2022 19:21:28'!
laAvispaPolly
	^AvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Meme 4/21/2022 20:15:51'!
queElHabitatTengaDosOrugasMas
	self habitat agregarUnaOruga.
	self habitat agregarUnaOruga. ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Meme 4/22/2022 19:25:14'!
queElHabitatTengaDosPolillasMas
	2 timesRepeat: [ self habitat agregarUnaPolilla ]! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Meme 4/21/2022 20:05:27'!
queElHabitatTengaUnaOrugaMas
	self habitat agregarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Meme 4/22/2022 19:24:22'!
queElHabitatTengaUnaPolillaMas
	self habitat agregarUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Meme 4/21/2022 19:55:39'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat retrocederAlInicioDeLosTiempos.! !

ElHabitat initializeAfterFileIn!