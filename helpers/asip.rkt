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
)

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
