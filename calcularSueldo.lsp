(defun calcularSueldo (anios)
  (let ((sueldo 40000)
        (aumento 0.0))
    (cond
      ((> anios 10) (setf aumento 0.10))
      ((<= 5 anios 10) (setf aumento 0.07))
      ((<= 3 anios 5) (setf aumento 0.05))
      ((> 3 anios) (setf aumento 0.03)))
    (* sueldo (+ 1 aumento))))
 
