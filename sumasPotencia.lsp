(defun multiplicar (a b)
  (if (= b 0)
      0
      (+ a (multiplicar a (- b 1)))))  ; Suma a b veces

(defun potencia (a b)
  (if (= b 0)
      1
      (multiplicar a (potencia a (- b 1)))))  ; Multiplica a por sí mismo b veces
