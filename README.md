KOUTPUT

This is a Lisp library for outputting message as described in "[A
System of Useful
Output](http://kyleisom.net/blog/2012/08/16/system-of-output/)". It is
fairly simple:

    (info "This is an information message.")

would output

    [+] This is an information message.

The syntax for all the forms is simple:

    (defun level (message-string &optional (stream nil) &rest args)
      ...)

The basic message forms are:

* `info`
* `item`
* `dbg`
* `err`

Note that since the names `error` and `debug` are reserved by the CL
ANSI standard, alternative names have been chosen.

You can change the default stream using `set-default-stream`:

    (set-default-stream nil)

would set the default behaviour to return a string. You can use the
`-default` forms to automatically use the default stream:

    (info-default message-string foo bar baz)

would write the message string (which in this case assumed three
"~A"s) to a string (assuming the previous `set-default-stream`
invocation).

