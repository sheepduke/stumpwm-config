
# Table of Contents

1.  [Installation](#org54643b2)
2.  [Directories and files](#org5ed2508)
    1.  [env.lisp](#org8831740)
    2.  [startup.lisp](#org7c7661b)
    3.  [function.lisp](#org3e9d6d1)
    4.  [binding.lisp](#org1822c36)
    5.  [hook.lisp](#org5eceb59)
    6.  [rule.lisp](#orgfa96380)


<a id="org54643b2"></a>

# Installation

1.  Clone this repo to anywhere on your machine.

2.  Make sure you have `roswell` installed and initialized.

3.  Install `stumpwm` via Quicklisp.
    
    `$ ros run`
    
    `* (ql:quickload :stumpwm)`

4.  Make a symbolic link from this repo to `$HOME/.stumpwm.d/`.

5.  Run command `echo "exec ~/.stumpwm.d/stumpwm.ros" >> ~/.xinitrc`.


<a id="org5ed2508"></a>

# Directories and files


<a id="org8831740"></a>

## env.lisp

Environment variables.


<a id="org7c7661b"></a>

## startup.lisp

Start some programs.


<a id="org3e9d6d1"></a>

## function.lisp

Common functions.


<a id="org1822c36"></a>

## binding.lisp

Key bindings.


<a id="org5eceb59"></a>

## hook.lisp

Hook functions.


<a id="orgfa96380"></a>

## rule.lisp

Rules for window placement.

