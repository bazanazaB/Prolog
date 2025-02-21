calcularSueldo:

(defun calcularSueldo (anios)
  (let ((sueldo 40000)
        (aumento 0.0)) 
    (cond
      ((> anios 10) (setf aumento 0.10))   
      ((<= 5 anios 10) (setf aumento 0.07)) 
      ((<= 3 anios 5) (setf aumento 0.05))  
      ((> 3 anios) (setf aumento 0.03)))   
    
    (* sueldo (+ 1 aumento))))  


Este código define una función calcularSueldo, la cual toma como argumento un número entero anios, que representa los años de experiencia de un empleado. Basándose en este valor, se calcula un aumento porcentual sobre un sueldo base de 40,000 euros.

Si el número de años es mayor a 10, se aplica un aumento del 10%.
Si está entre 5 y 10 años, el aumento es del 7%.
Si tiene entre 3 y 5 años de experiencia, el aumento es del 5%.
Si tiene menos de 3 años, el aumento es del 3%.
El resultado es el cálculo del sueldo final con el aumento aplicado.

Ejemplo: Si un empleado tiene 8 años de experiencia, el aumento será del 7%, resultando en un sueldo final de 42,800 euros.

2. factorial.lsp
lisp
Copy
Edit
(defun factorial (n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))
Explicación técnica: La función factorial calcula el factorial de un número entero positivo n de forma recursiva. La definición de factorial es la siguiente: el factorial de n (denotado como n!) es el producto de todos los enteros positivos desde 1 hasta n. La función recursiva en Lisp implementa esta definición.

Caso base: Si n <= 1, retorna 1.
Caso recursivo: Si n > 1, se multiplica n por el factorial de n-1. Este proceso continúa recursivamente hasta llegar al caso base.
Ejemplo: Para (factorial 5), se realiza la siguiente operación: 5 * 4 * 3 * 2 * 1 = 120.

3. fibonacci.lsp
lisp
Copy
Edit
(defun fibonacci (n)
    (if (<= n 1)
    n
    (+ (fibonacci(- n 1))(fibonacci(- n 2)))
    )
)
Explicación técnica: Esta función calcula el n-ésimo número de la secuencia de Fibonacci, donde cada número es la suma de los dos anteriores, comenzando desde 0 y 1.

Caso base: Si n <= 1, devuelve n (es decir, devuelve 0 cuando n es 0, y 1 cuando n es 1).
Caso recursivo: Si n > 1, la función devuelve la suma de los dos valores previos en la secuencia, es decir, fibonacci(n-1) + fibonacci(n-2).
Ejemplo: Para (fibonacci 6), se realiza la siguiente operación: fibonacci(5) + fibonacci(4), y se continúa hasta llegar al caso base. El resultado es 8.

4. guessNumber.lsp
lisp
Copy
Edit
(defun guess-my-number()
 (ash(+ *small* *big*) -1)
)
(defun smaller()
 (setf *big* (1- (guess-my-number)))
 (guess-my-number)
)
(defun bigger()
(setf *small* (1+ (guess-my-number)))
 (guess-my-number)
)
(defun start-over ()
(defparameter *small* 1)
(defparameter *big* 100)
(guess-my-number)
)
Explicación técnica: Este código implementa un juego de adivinanza de números en el que el programa trata de adivinar un número entre 1 y 100. El jugador le dice al programa si el número es más grande o más pequeño que el número adivinado.

guess-my-number: Calcula un valor intermedio entre el rango dado (definido por las variables *small* y *big*), mediante el desplazamiento aritmético ash para realizar una operación de división de enteros.
smaller: Si el número adivinado es más grande que el número correcto, ajusta el límite superior del rango.
bigger: Si el número adivinado es más pequeño, ajusta el límite inferior del rango.
start-over: Resetea el rango a 1-100 y comienza el proceso nuevamente.
5. restasRecursivas.lsp
lisp
Copy
Edit
(defun dividir (a b)
  (if (< a b)  
      0
      (+ 1 (dividir (- a b) b))))  
Explicación técnica: La función dividir realiza una división entera usando solo restas recursivas. Si a es menor que b, el resultado es 0 (porque la división no puede continuar). De lo contrario, resta b de a y realiza la llamada recursiva, contando cuántas veces se puede restar b antes de que a sea menor que b.

Ejemplo: Para (dividir 10 3), el proceso es:

10 - 3 = 7
7 - 3 = 4
4 - 3 = 1 Finalmente, la función retorna 3, que es el número de veces que 3 se resta de 10.
6. sumasPotencia.lsp
lisp
Copy
Edit
(defun multiplicar (a b)
  (if (= b 0)
      0
      (+ a (multiplicar a (- b 1)))))  

(defun potencia (a b)
  (if (= b 0)
      1
      (multiplicar a (potencia a (- b 1)))))  
Explicación técnica:

La función multiplicar calcula el producto de dos números a y b mediante recursión. Si b es 0, devuelve 0 (por definición). De lo contrario, suma a repetidamente b veces.
La función potencia calcula a elevado a la potencia de b, también de forma recursiva. Si b es 0, devuelve 1 (por definición). En caso contrario, calcula la potencia multiplicando a por sí mismo b veces.
Ejemplo:

Para (multiplicar 3 4), se realiza 3 + 3 + 3 + 3 = 12.
Para (potencia 2 3), se realiza 2 * 2 * 2 = 8.
