#lang racket/gui

; Call the necessary API
(require "asip/AsipMain.rkt")

; Call all the helper files
(require "helpers/asip.rkt")

; Open the connection
(open-asip)

; Setup
(out 13) ; Traffic light 1 red
(out 12) ; Traffic light 1 amber
(out 11) ; Traffic light 1 green

(out 10) ; Traffic light 2 red
(out 9) ; Traffic light 2 amber
(out 8) ; Traffic light 2 green

(out 7) ; Padestrian crossing 1 red
(out 6) ; Padestrian crossing 1 green

(out 5) ; Padestrian crossing 2 red
(out 4) ; Padestrian crossing 2 green

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
