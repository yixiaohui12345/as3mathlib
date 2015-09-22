# Flex/Actionscript Math Library (as3mathlib) #

The Flex/Actionscript Math Library (as3mathlib) is intended to provide a rudimentary numerical analysis toolkit for the Actionscript/Flex programming environment.

It is based off of the WIS Actionscript 2 libraries, which are still [available](http://members.shaw.ca/flashprogramming/wisASLibrary/wis/index.html)

## Details ##

This library includes support for
  * Geometric Objects and Intersection calculations
  * Integral and Differential equation calculations
  * Bezier, Quadric, Polynomial, Complex, Vector and Matrix calculations
  * Symbolic expression parsing

## Status ##

This library has just been converted from Actionscript 2 to Actionscript 3.  It is not ready for general use.
  * It compiles with no errors and only a few warnings.
  * It has not been sanity-checked for compatibility or correctness
  * It has not been subjected to unit testing
  * It still uses deprecated AS2 practices and vernacular
  * Its design is heavily functional-programming oriented, and doesn't (for the most part) present an object-oriented, pattern-design interface.

On the positive side,
  * The scope and architecture are in place
  * All of the algorithms are in place and were well-tested in their former incarnation
  * The code base is nicely modular, so different developers can break off little pieces and get them working independently.

## Goals ##

Our two, no three primary goals -- our five primary goals are:
  * Correctness: the library is accompanied by a complete set of regression tests.
  * Clarity of code: the routines are well commented and follow best practices of software engineering.
  * Modularity: In most cases users will need only a few routines out of the package.  To the extent possible, this should require bringing in a correspondingly small portion of the library.
  * Flexibility: A few, general, easily understood routines are more desirable than a comprehensive deathmarch through advanced numerical methods.  Think "[Numerical Recipes](http://www.nr.com/)", not "[Lapack](http://www.netlib.org/lapack/)".
  * Performance: Actionscript will never be a premiere [high-performance computing](http://en.wikipedia.org/wiki/High-performance_computing) environment.  With that said, the library should support prototyping applications calculations of modest scope.  Routines that don't meet this modest standard won't be included.