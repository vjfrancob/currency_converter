# Reto # 1

Construcción de una calculadora de conversión de divisas básica,
a partir de datos tazas de cambio establecidas en memoria,
el código consta de:

## Lógica
El usuario al iniciar la app debe seleccionar la divisa de origen y destino
en la parte superior izquierda y derecha respectivamente.
Posteriormente, debe proceder a escribir el monto de la divisa 1 (izquierda) que desea convertir
a la divisa 2 (derecha). La aplicación automáticamente muestra el valor en la divisa 2.
La aplicación cuenta con botones de borrado completo y de borrado del último valor ubicados en la 
parte inferior izquierda y derecha, respectivamente.

## Operación

La app utiliza una lista de divisas y una matriz de cambio la cual es posteriormente llamada y 
emparejada con la divisa seleccioanda para garantizar la selección del valor de cambio correcto.

Para el teclado se creó una función que permite construirlo a partir de ingreso de enteros o texto, siendo ubicado
en filas. La función de botones devuelve el valor del botón el cual es igual al del texto de construcción o uno predefinido 
como en el caso de "AC" y "borrar". Al presionar cada botón se define la función de callback la cual implementa la lógica de validación de botones presionados, la cual contempla:

 1. Validación de si el botón de "AC" fue presionado para poner todas las variables en 0 y borrar el string de concatenación.
 2. Validación del botón de borrado unitario para eliminar el último caracter del string de concatenación, asignar el nuevo valor y calcular el monto en la divisa 2.
 3. Al presionar botones de números se concatena cada boton en un string, el cual es posteriormente convertido a entero para multiplicar por la tasa de cambio, valor que finalmente es presentado en pantalla.

## Link de repositorio

https://github.com/vjfrancob/currency_converter.git


## Video de Explicación
https://user-images.githubusercontent.com/111591094/190627476-d54f68c9-33c5-450b-8ede-d787968b5af8.mp4
