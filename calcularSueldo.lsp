(defun calcularSueldo (anios)
  (let ((sueldo 40000)
        (aumento 0.0))  ; Debe ser decimal para que el cálculo sea correcto
    (cond
      ((> anios 10) (setf aumento 0.10))   ; 10% de aumento
      ((<= 5 anios 10) (setf aumento 0.07)) ; 7% de aumento
      ((<= 3 anios 5) (setf aumento 0.05))  ; 5% de aumento
      ((> 3 anios) (setf aumento 0.03)))   ; 3% de aumento
    
    (* sueldo (+ 1 aumento))))  ; Calcula el nuevo sueldo

;; Ejemplo de uso
(format t "~%El sueldo con 8 años de experiencia es: ~a euros" (calcularSueldo 8))
