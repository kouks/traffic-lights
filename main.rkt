#lang racket

; Call the necessary API
(require "asip/AsipMain.rkt")

; Call all the helper files
(require "helpers/asip.rkt")

; Open the connection
(open-asip)

; Setup
(out 13)
(out 12)
(out 11)

(out 10)
(out 9)
(out 8)

(out 7)
(out 6)

(out 5)
(out 4)
(on 13)
(on 12)
(on 11)

(on 10)
(on 9)
(on 8)

(on 7)
(on 6)

(on 5)
(on 4)

; Define the loop and run its
(define (loop)

  (loop)
)

(loop)

; Close the connection
(close-asip)
