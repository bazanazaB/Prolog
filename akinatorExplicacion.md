**_*Base de conocimiento*_**

Esta es la estructura de datos principal que define la jerarquía de clasificación de los animales en una especie de árbol.


(defparameter *base-conocimiento*

  '((animal (vertebrado) (invertebrado))
  
    ...
    
  ))
  
animal → Se divide en vertebrado e invertebrado.

vertebrado → Se divide en mamífero, ave, reptil, anfibio, pez.

mamífero → Se divide en carnívoro, herbívoro, omnívoro, y así sucesivamente.

**Ejemplo de recorrido**

Si el usuario está pensando en un león, la estructura seguiría este camino: animal → vertebrado → mamífero → carnívoro → león

Si está pensando en un pulpo, el camino sería: animal → invertebrado → molusco → pulpo

-  -  -  -  -  -  -  -  -  -  -  -  -  -

Función -> hacer-pregunta

Preguntar al usuario si su animal pertenece a una categoría específica.


_**(defun hacer-pregunta (pregunta)
  "Realiza una pregunta al usuario y devuelve T o NIL según la respuesta."
  (format t "~%¿El animal es un ~A? (si/no): " (string-capitalize (symbol-name pregunta)))
  (let ((respuesta (read-line)))
    (string-equal respuesta "si")))**_
    
Ejemplo de ejecución

_¿El animal es un vertebrado? (si/no): si
Si el usuario responde "si", devuelve T (true).
Si responde "no", devuelve NIL (false)._

  -  -  -  -  -  -  -  -  -  -  -  

Función -> adivinar

Recorrer la base de conocimiento de manera recursiva hasta encontrar un animal específico.


_**(defun adivinar (nodo)
  "Función recursiva que hace preguntas hasta llegar a una respuesta."
  (let ((rama (assoc nodo *base-conocimiento*)))  ;; Busca en la base de conocimiento
    (if (null rama)  ;; Si no hay más ramas, se encontró el animal
        (format t "~%¡Creo que estás pensando en un ~A!~%" (string-capitalize (symbol-name nodo)))
        (dolist (subrama (cdr rama))  ;; Recorre las posibles subcategorías
          (when (hacer-pregunta (car subrama))  ;; Pregunta al usuario
            (return (adivinar (car subrama))))))))  ;; Llamada recursiva si responde "si"**_


Busca si el nodo tiene subcategorías en *base-conocimiento*.

Si ya es un animal final, imprime el resultado -> **¡Creo que estás pensando en un León!**

Si aún hay categorías, pregunta al usuario sobre cada una.

Si responde "si", sigue explorando esa rama.

Si responde "no", prueba con la siguiente.

Ejemplo de ejecución

**_Piensa en un animal, te haré preguntas para adivinarlo...
¿El animal es un vertebrado? (si/no): si
¿El animal es un mamífero? (si/no): si
¿El animal es un carnívoro? (si/no): si
¿El animal es un león? (si/no): si
¡Creo que estás pensando en un León!_**

-  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -

Función - > iniciar-akinator

Inicia el juego llamando a adivinar 'animal.

**_(defun iniciar-akinator ()
  "Inicia el juego de adivinanza."
  (format t "~%Piensa en un animal, te haré preguntas para adivinarlo...~%")
  (adivinar 'animal))_**
