#lang racket

;
; This file contains helper functions for communication via the ASIP protocol
;

; Call the necessary API
(require "../asip/AsipMain.rkt")

(provide
  on?
  off?
  on
  off
  out
  in
  transitions
  transition
  call
  current
  total-transition-time
  timer
)

(define timer 0)
(define current 0)

(define (on? pin)
  (equal? (digital-read pin) HIGH)
)

(define (off? pin)
  (not (on? pin))
)

(define (on pin)
  (digital-write pin HIGH)
)

(define (off pin)
  (digital-write pin LOW)
)

(define (out pin)
  (set-pin-mode pin OUTPUT_MODE)
)

(define (in pin)
  (set-pin-mode pin INPUT_PULLUP_MODE)
)

(define transitions (list))
(define (transition callback sleep)
  (set! transitions (append transitions (list (list callback sleep))))
)

(define (total-transition-time all)
  (cond
    [(null? (cdr all)) (cadar all)]
    [#t (+ (cadar all) (total-transition-time (cdr all)))]
  )
)

(define (call)
  (set! timer (+ timer 1))
  (set! current 0)

  (let ([state (modulo timer (total-transition-time transitions))])
    (for ([t transitions] #:break (< state current))
      (set! current (+ current (cadr t)))
      (if (< state current) ((car t)) (void))
    )
  )
)
