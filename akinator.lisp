(defparameter *base-conocimiento*
  '((animal (vertebrado)
            (invertebrado))
    
    ;; Vertebrados
    (vertebrado (mamifero)
                (ave)
                (reptil)
                (anfibio)
                (pez))
    
    ;; Mamíferos
    (mamifero (carnivoro)
              (herbivoro)
              (omnivoro))
    (carnivoro (leon)
               (tigre)
               (lobo)
               (guepardo)
               (hiena))
    (herbivoro (elefante)
               (jirafa)
               (caballo)
               (ciervo)
               (rinoceronte))
    (omnivoro (oso)
              (cerdo)
              (mapache)
              (humano))
    
    ;; Aves
    (ave (rapaz)
         (no-rapaz))
    (rapaz (aguila)
           (halcon)
           (buho)
           (condor))
    (no-rapaz (paloma)
              (loro)
              (pinguino)
              (gallina)
              (pato))
    
    ;; Reptiles
    (reptil (carnivoro)
            (herbivoro))
    (carnivoro (cocodrilo)
               (serpiente)
               (dragon-de-komodo)
               (lagarto))
    (herbivoro (iguana)
               (tortuga)
               (camaleon))
    
    ;; Anfibios
    (anfibio (rana)
             (salamandra)
             (triton))
    
    ;; Peces
    (pez (tiburon)
         (dorado)
         (betta)
         (pez-globo))
    
    ;; Invertebrados
    (invertebrado (insecto)
                  (aracnido)
                  (molusco)
                  (crustaceo))
    
    ;; Insectos
    (insecto (hormiga)
             (mariposa)
             (escarabajo)
             (mosquito)
             (libelula))
    
    ;; Arácnidos
    (aracnido (araña)
              (escorpion)
              (garrapata))
    
    ;; Moluscos
    (molusco (pulpo)
             (calamar)
             (caracol)
             (ostra)
             (mejillon))
    
    ;; Crustáceos
    (crustaceo (cangrejo)
               (langosta)
               (camaron)
               (percebe))))


(defun hacer-pregunta (pregunta)
  "Realiza una pregunta al usuario y devuelve T o NIL según la respuesta."
  (format t "~%¿El animal es un ~A? (si/no): " (string-capitalize (symbol-name pregunta)))
  (let ((respuesta (read-line)))
    (string-equal respuesta "si")))

(defun adivinar (nodo)
  "Función recursiva que hace preguntas hasta llegar a una respuesta."
  (let ((rama (assoc nodo *base-conocimiento*)))
    (if (null rama)
        (format t "~%¡Creo que estás pensando en un ~A!~%" (string-capitalize (symbol-name nodo)))
        (dolist (subrama (cdr rama))
          (when (hacer-pregunta (car subrama))
            (return (adivinar (car subrama))))))))  ; Ahora está bien cerrado

(defun iniciar-akinator ()
  "Inicia el juego de adivinanza."
  (format t "~%Piensa en un animal, te haré preguntas para adivinarlo...~%")
  (adivinar 'animal))
