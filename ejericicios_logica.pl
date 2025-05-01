Encontrar todas las permutaciones de una lista:
permutacion([], []).
permutacion([H|T], P) :-
    permutacion(T, R),
    insertar(H, R, P).

insertar(X, L, [X|L]).
insertar(X, [H|T], [H|R]) :-
    insertar(X, T, R).

Uso:
 permutacion([1,2,3], P).

Este código genera todas las permutaciones posibles de una lista,la regla principal toma la cabeza (H=head) de la lista y genera 
recursivamente permutaciones del resto (T=tail). Luego, con insertar, coloca H en todas las posiciones posibles de esa sublista permutada.
Es útil para resolver problemas de ordenamiento, combinatorias o búsqueda de soluciones.

- - - - - - - - - - - - - - - - - - - - - - - - - - - 

Generar subconjuntos de una lista:
subconjunto([], []).
subconjunto([H|T], [H|R]) :-
    subconjunto(T, R).
subconjunto([_|T], R) :-
    subconjunto(T, R).

Uso:
subconjunto([a,b,c], S).

Este predicado genera todos los subconjuntos posibles de una lista dada, por cada elemento de la lista, 
se considera el caso en que se incluye y el caso en que no
- - - - - - - - - - - - - - - - - - - - - - - - - - - 

Encontrar todos los números en un rango que cumplen una condición:
numeros_condicion(Inicio, Fin, Condicion, Resultados) :-
    findall(X, (between(Inicio, Fin, X), call(Condicion, X)), Resultados).

par(X) :- 0 is X mod 2.

Uso:
numeros_condicion(1, 10, par, R).

Se generan todos los números entre Inicio y Fin que cumplan una condición pasada como predicado,
en el ejemplo se obtienen los números pares usando par/1

- - - - - - - - - - - - - - - - - - - - - - - - - - - 

Concatenar dos listas:

append([], L, L).
append([H|T], L, [H|R]) :-
    append(T, L, R).


Uso:
append([1,2], [3,4], R).


El predicado append concatena dos listas. Funciona de forma recursiva: toma el primer elemento 
de la primera lista y lo antepone al resultado de concatenar el resto

- - - - - - - - - - - - - - - - - - - - - - - - - - - 

Encontrar elementos únicos en una lista (sin duplicados)
unicos([], []).
unicos([H|T], [H|R]) :-
    \+ member(H, T),
    unicos(T, R).
unicos([H|T], R) :-
    member(H, T),
    unicos(T, R).

Uso:
unicos([1,2,2,3,4,4,5], R).

Este predicado elimina elementos duplicados conservando solo aquellos que aparecen una sola vez. 
Usa member para saber si un elemento se repite en el resto de la lista

- - - - - - - - - - - - - - - - - - - - - - - - - - - 

Calcular la potencia de un número:
potencia(_, 0, 1).
potencia(Base, Exponente, Resultado) :-
    Exponente > 0,
    E1 is Exponente - 1,
    potencia(Base, E1, R1),
    Resultado is Base * R1.


Uso:
potencia(2, 3, Resultado).

Este código calcula la potencia de un número mediante recursión, se define que
cualquier número elevado a 0 es 1, y para otros casos, se multiplica la base por 
el resultado de la potencia con un exponente menor

- - - - - - - - - - - - - - - - - - - - - - - - - - - 

Alinear equipos en un torneo (todas las combinaciones de partidos):

partidos([], []).
partidos([E|Es], Juegos) :-
    findall(juega(E, Otro), member(Otro, Es), Partidos),
    partidos(Es, Resto),
    append(Partidos, Resto, Juegos).

Uso:
partidos([a,b,c], Partidos).

Genera todas las combinaciones posibles de partidos donde cada equipo juega con los demás,
Usa findall para construir todos los partidos entre un equipo y los restantes

- - - - - - - - - - - - - - - - - - - - - - - - - - - 

Resolver problemas de caminos (grafo simple)

camino(A, B, [A,B]) :- conexion(A, B).
camino(A, B, [A|Camino]) :-
    conexion(A, C),
    camino(C, B, Camino),
    \+ member(A, Camino).

conexion(a,b).
conexion(b,c).
conexion(a,c).
conexion(c,d).


Uso:
camino(a,d,Camino).


Busca caminos entre dos nodos de un grafo usando relaciones de conexió,
la recursión permite construir rutas más largas y  member(A, Camino) evita ciclos. 
Este tipo de lógica es para rutas y redes.

- - - - - - - - - - - - - - - - - - - - - - - - - - - 

Generar combinaciones con repetición:
combinacion_repeticion(_, 0, []).
combinacion_repeticion(Lista, K, [E|Resto]) :-
    K > 0,
    member(E, Lista),
    K1 is K - 1,
    combinacion_repeticion(Lista, K1, Resto).


Uso:
combinacion_repeticion([a,b], 2, C).

Genera todas las combinaciones posibles de K elementos permitiendo repeticiones. 
member/2 permite seleccionar  cualquier elemento de la lista inicial en cada
paso
