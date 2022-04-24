**Sobre implementar funcionalidad**

```
    Si, logramos que pasen primero el test 01, luego el 02, y luego el 03. La forma en que lo conseguimos fue haciendo
    lo mínimo indispensable para que pase el test en sí, pensando únicamente en que pase la prueba y no en 
    funcionalidades a futuro.
```


**Sobre codigo repetido:**

```
    Técnicamente si nos quedó código repetido, pero en los casos en los que lo hay, suelen ser métodos de una línea,
    que generalizarlos implicaría una complicación innecesaria a fines de nuestro modelo. 
    Por ejemplo: cantidadDeHuevosDePolly, cantidadDeHuevosDeOriannaYOrnella y cantidadDeHuevosDeLara podrían 
    hacerse de una forma general creando un mensaje cantidadDeHuevosDe: unaAvispa, pero se complicaría mucho mas 
    la resolucion de forma innecesaria. 

    En cuanto al responsable de contar las polillas y orugas, para nosotros terminó siendo el hábitat. Pensamos 
    durante un tiempo donde deberia ir, ya que en un principio estaría relacionado a ambos, pero tiene mucho más 
    sentido que le correspondan al hábitat ya que las avispas van, dejan los huevos y de ahí en adelante es 
    el hábitat quien se encargade ellos, por ende la relación más estrecha es entre el hábitat y los huevos 
    más que entre el hábitat y las avispas.
```


**Sobre codigo repetido 2:**

```
    Asumimos que con el código repetido se refieren a la similitud entre la avispa oriana y ornella, 
    en nuestro caso identificamos la relación de parentezco entre ellas, e hicimos que una fuese hija de la otra 
    (son idénticas, por lo tanto era indistinto quien fuese quien), para así no repetir código.

    En cuanto a cómo guardar los huevos, nosotros en primera instancia seguimos la filosofía impuesta 
    por la cátedra de hacer lo mínimo indispensable para que pasasen los tests, por lo tanto, 
    lo que hicimos fue definir un colaborador interno al hábitat para cada elemento (uno para las
    orugas, otro para polillas, otro para huevos de lara, etc), que funcionan como un contador. 
    Esa era la forma más sencilla de resolverlo, pero después a fines de prolijidad y claridad de la 
    representación del modelo, decidimos utilizar dos diccionarios, que los definimos como colaboradores internos
    del hábitat, uno para los huevos de las avispas y otro para los recursos del hábitat. Estos tenían por clave 
    un string con el nombre del dominio del problema que representaban y por valor la cantidad de ese elemento 
    que había. 
```
