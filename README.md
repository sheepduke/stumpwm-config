
# Table of Contents

1.  [Installation](#org083f4ce)
2.  [Directories and files](#org68ffce8)
    1.  [env.lisp](#org3b418fe)
    2.  [startup.lisp](#orgadb5681)
    3.  [function.lisp](#org395218e)
    4.  [binding.lisp](#org9827e3d)
    5.  [hook.lisp](#orga1b7d58)
    6.  [rule.lisp](#org0c71bff)


<a id="org083f4ce"></a>

# Installation

1.  Clone this repo to anywhere on your machine.

2.  Make sure you have `roswell` installed and initialized.

3.  Install `stumpwm` via Quicklisp.
    
    `$ ros run`
    `* (ql:quickload :stumpwm)`

4.  Make a symbolic link from this repo to `$HOME/.stumpwm.d/`.

5.  Run command `echo "exec ~/.stumpwm.d/stumpwm.ros" >> ~/.xinitrc`.


<a id="org68ffce8"></a>

# Directories and files


<a id="org3b418fe"></a>

## env.lisp

Environment variables.


<a id="orgadb5681"></a>

## startup.lisp

Start some programs.


<a id="org395218e"></a>

## function.lisp

Common functions.


<a id="org9827e3d"></a>

## binding.lisp

Key bindings.


<a id="orga1b7d58"></a>

## hook.lisp

Hook functions.


<a id="org0c71bff"></a>

## rule.lisp

Rules for window placement.

