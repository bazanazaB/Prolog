
#En una calle hay cinco casas, cada una de un color distinto.  En cada
#casa vive una persona de distinta nacionalidad.  Cada dueño bebe un
#único tipo de bebida, fuma una sola marca de cigarrillos y tiene una
#mascota diferente a sus vecinos.  A partir de las 15 pistas
#presentadas a continuación, la consigna que hay que responder es:
#"¿Quién es el dueño del pez?"
 
#El británico vive en la casa roja.
#El sueco tiene un perro como mascota.
#El danés toma té.
#El noruego vive en la primera casa.
#El alemán fuma Prince.
#La casa verde está inmediatamente a la izquierda de la blanca.
#El dueño de la casa verde bebe café.
#El propietario que fuma Pall Mall cría pájaros.
#El dueño de la casa amarilla fuma Dunhill.
#El hombre que vive en la casa del centro bebe leche.
#El vecino que fuma Blends vive al lado del que tiene un gato.
#El hombre que tiene un caballo vive al lado del que fuma Dunhill.
#El propietario que fuma Bluemaster toma cerveza.
#El vecino que fuma Blends viveal lado del que toma agua.
#El noruego vive al lado de la casa azul.


casa(1, amarilla).
casa(2, azul).
casa(3, roja).
casa(4, verde).
casa(5, blanca).

persona(noruego).
persona(danes).
persona(britanico).
persona(sueco).
persona(aleman).

bebida(te).
bebida(cafe).
bebida(leche).
bebida(cerveza).
bebida(agua).

cigarro(pall_mall).
cigarro(prince).
cigarro(dunhill).
cigarro(blends).
cigarro(bluemaster).

mascota(perro).
mascota(gato).
mascota(caballo).
mascota(pajaros).
mascota(pez).


viveEn(britanico, roja).
tieneMascota(sueco, perro).
tomaBebida(danes, te).
fumaCigarro(aleman, prince).
izquierda_de(verde, blanca).
bebeCafe(verde, cafe).
