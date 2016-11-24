#lang racket/gui

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


; Setting up stuff
(define (tl1 color)
  (cond
    [(equal? color 'green) 11]
    [(equal? color 'amber) 12]
    [(equal? color 'red) 13]
  )
)

(define (tl2 color)
  (cond
    [(equal? color 'green) 10]
    [(equal? color 'amber) 9]
    [(equal? color 'red) 8]
  )
)

(transition (lambda ()
  (on (tl1 'green))
  (on (tl2 'red))
  (off (tl2 'green))
  (off (tl1 'red))
) 30)

(transition (lambda ()
  (on (tl2 'amber))
  (on (tl1 'amber))
  (off (tl1 'green))
  (off (tl2 'red))
) 30)

(transition (lambda ()
  (on (tl2 'green))
  (on (tl1 'red))
  (off (tl1 'amber))
  (off (tl2 'amber))
) 30)

; Define the loop and run it
(define loop (new timer% [interval 100] [notify-callback call]))

; Close the connection
; (close-asip)
