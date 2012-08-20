;;;; koutput.lisp

(in-package #:koutput)

;;; "koutput" goes here. Hacks and glory await!

(defvar *default-stream* t)

(defmacro make-level (level triglyph)
  (let* ((message-format-name (gensym)))
      `(defun ,level (message &optional (stream *default-stream*) &rest args)
         (let ((,message-format-name (format nil "~A ~A" ,triglyph message)))
           (apply #'format stream
                           ,message-format-name
                           args)))))

;;; this seems to be more code than i should need to write, need to
;;; find a way to convert level -> level-default and skip the name.
(defmacro make-default-level (level name)
  `(defun ,name (message &rest args)
     (apply ,level
            message
            *default-stream* args)))

(make-level info "[+]")
(make-level item "~4T[*]")
(make-level dbg "[-]")
(make-level err "[!]")

(make-default-level 'info info-default)
(make-default-level 'item item-default)
(make-default-level 'dbg dbg-default)
(make-default-level 'err err-default)

(defun set-default-stream (new-stream)
  (setf *default-stream* new-stream))
