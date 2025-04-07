#lang racket
(require 2htdp/image)
(define (Main)
    (define rectangleOne (rectangle 700 255 "outline" "black"))
    (define rectangleTwo (rectangle 600 155 "outline" "black"))
    (overlay rectangleOne rectangleTwo)
)   
(Main)