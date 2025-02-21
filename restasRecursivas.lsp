(defun dividir (a b)
  (if (< a b)  ; Si a es menor que b, la división ha terminado
      0
      (+ 1 (dividir (- a b) b))))  ; Resta b y cuenta 1 más
