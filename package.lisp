;;;; package.lisp

(defpackage #:koutput
  (:use #:cl)
  (:export #:info
           #:info-default
           #:item
           #:item-default
           #:dbg
           #:dbg-default
           #:err
           #:err-default
           #:set-default-stream))
