**Abstracción de los tests 01 y 02)**
    
    En este caso, el código repetido se encontraba en las pruebas, más que una abstracción a nivel modelo (por la falta de un ente de la realidad), se hizo una a nivel funcional, es decir, a nivel testeo (no modelo) no se reconoció que existía una acción común entre las pruebas de contabilizar el tiempo. Ese sería el "ente" nuevo que no se reconoció antes.

**Como representar en smalltalk)**

    En smalltalk podemos representar los entes de la realidad a través de objetos y sus mensajes. Dentro de los objetos tenemos formas distintas de representar los entes de la realidad (dentro del paradigma de subclasificación) dependiendo de si son concretos, es decir, los objetos tangibles en sí; o si son abstractos, o sea, la idea de esos entes.

    A su vez los mensajes nos sirven para terminar de moldear esas representaciones de los entes, dándoles carácter, ya que, los mensajes nos indican las acciones que sabría responder ese ente de la realidad. También, a los objetos concretos podemos definirles colaboradores internos, para indicar una relación de cercanía entre el mismo y otro objeto.

**Teoría de Naur**
    
    Sacar el código repetido utilizando abstracciones permite, según el texto de Naur, comprender mejor el programa y la teoría a la hora de realizar modificaciones, reduciendo el "costo" de estas. Además, esta mejora de la comprensión significa también una mejora en la mantenibilidad del programa, así como también un aumento en su tiempo de "vida" y reconocer con más facilidad con qué ente de la realidad se relaciona cada parte del código de dicho programa. 
    
