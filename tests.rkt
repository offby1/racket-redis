#! /bin/sh
#| Hey Emacs, this is -*-scheme-*- code!
#$Id$
exec racket -l errortrace --require "$0" --main -- ${1+"$@"}
|#

#lang racket
(require rackunit rackunit/text-ui)
(require "redis.rkt")

(define-test-suite redis-tests
  (check-equal? (ping) #"PONG")
  (check-equal? (get "foo") #"bar"))

(define (main . args)
  (exit (run-tests redis-tests 'verbose)))

(provide main)
