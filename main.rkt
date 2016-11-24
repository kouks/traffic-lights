#lang racket/gui

; Call the necessary API
(require "asip/AsipMain.rkt")

; Call all the helper files
(require "helpers/asip.rkt")

; Open the connection
(open-asip)

; Setting up stuff
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

(in 3) ; Padestrian button 1
(in 2) ; Padestrian button 2

;Traffic 1;
(transition (lambda ()
  (apply-state 0)
) 40)

(transition (lambda ()
  (apply-state 1)
) 20)

(transition (lambda ()
  (apply-state 2)
) 40)

(transition (lambda ()
  (apply-state 3)
) 20)


; Define the loop and run it
(define pressed #f)

(define loop (new timer% [interval 100] [notify-callback (lambda ()

  ; Padestrian crossing button press
  (cond
    [(or (on? 3) (on? 2))
      (apply-state 4)
      (sleep 2)
      (apply-state 5)
      (sleep 4)
      (apply-state 6)
      (reset)
      (sleep 2)
    ]
  )
  (call)
)]))
