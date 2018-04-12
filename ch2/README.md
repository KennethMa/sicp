# SICP CH2 Building Abstractions with Data
#sicp#

*Why do we want compound data in a programming language?* To elevate the conceptual level at which we can design our programs, to increase the modularity of our designs, and to enhance the expressive power of our language.

The  general technique of isolating the parts of a program that deal with *how data objects are represented* from the parts of program that deal with *how data objects are used* is a powerful design methodology called *data abstraction*.

One key idea in dealing with compound data is the notion of *closure* — that the glue we use for combining data objects should allow us to *combine not only primitive data objects, but compound data objects as well*. Another key idea is that compound data objects can serve as *conventional interfaces* for combining program modules in *mix-and-match* ways.

*Symbolic expressions*, 符号表达式 — data whose elementary parts can be *arbitrary symbols*  rather than only numbers.

*Generic Operations*, which must handle many different types of data.

*Data-directed Programming*, allows individual data representations to be designed in isolation and then combined *additively*.

## Introduction to Data Abstraction
The basic idea of *data abstraction* is to structure the programs that are to use compound data objects so that they operate on *abstract data*.

*Pair*序对, a compound  structure provided by our language, which can be constructed with the primitive procedure *cons*, *car*, *cdr*.
Constructor : `cons`
Selectors: `car`, `cdr`

The ability to combine pairs means that pairs can be used as *general-purpose building blocks* to create all sorts of complex data structures.

Data objects constructed from pairs are called *list-structured* data.表结构

*Abstraction barriers*, 抽象屏障, that isolate different ‘level’ of the system.At each level, the barrier separates the programs that *use* the data abstraction from the programs that *implement* the data abstraction.

*Constraining the dependence  on the representation* to a few interface procedures helps us design programs as well as modify them.

The operations satisfy the condition that, for any objects *x* and *y*, if *z* is `(cons x y)` then `(car z)` is *x* and `(cdr z)` is *y*.Any triple of procedures that satisfies the above condition can be used as the basis for implementing *pairs*.

Implement `cons` `car` `cdr` without using any data structures at all but only using procedures.

``` scheme
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch)

(define (car z) (z 0))

(define (cdr z) (z 1))
```


## Hierarchical Data and the Closure Property
In general, an operation for combining data objects satisfies the *closure property* if the results of combining things with that operation can themselves be combined using the same operation.

> 术语*闭包*来自抽象代数。在抽象代数里，一集元素称为在某个运算（操作）之下封闭，如果将该运算应用于这一集合中的元素，产生出的仍然是该集合里的元素。

### Representing Sequences
*sequence*, an *ordered* collection of data objects.

Scheme provides a primitive called `list` to help in constructing lists. In general,
`(list <a1> <a2> … <an>)`
Is equivalent to
`(cons <a1> (cons <a2> (cons … (cons <an> nil) … )))`

The value of *nil*, used to terminate the chain of pairs, can be thought of as a sequence of no elements, *the empty list*

> The word *nil* is a contraction of the Latin word *nihil*, which means *nothing*.

The procedures `+`, `*`, and `list` take arbitrary numbers of arguments.One way to define such procedures is to use `define` with *dotted-tail notation*.
`(define (f x y . z) <body>)`

`map`, established a higher level of abstraction in dealing with lists.
``` scheme
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))
```

### Sequences as Conventional Interfaces
The key to organizing programs so as to more clearly reflect the signal-flow structure is to concentrate on the *signal* that flow from one stage in the process to the next.

[Fold (higher-order function) - Wikipedia](https://en.wikipedia.org/wiki/Fold_(higher-order_function) )
``` scheme
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))
```

*flatmap*, combination of mapping and accumulating with append.
``` scheme
(define (flatmap proc seq)
  (fold-right append nil (map proc seq)))
```

*stratified design*, a complex system should be structured as a sequence of levels that are described using a sequence of languages.Each level is constructed by combining parts that are regarded as primitive at that level, and the parts constructed at each level are used as primitives at the next level.The language used at each level of a stratified design has primitives, means of combination, and means of abstraction appropriate to that level of detail.

Stratified design helps make programs robust, that is, it makes it likely that small changes in a specification will require correspondingly small changes in the program.

## Symbolic Data
### Quotation
In order to manipulate symbols we need a new element in our language: the ability to quote a data object.

The meaning of the single quote character is to quote the next object.


## Systems with Generic Operations

[image:E9624D3C-2CBB-4DDB-A400-87A799A88228-278-0000A3A60161177A/4D0A7433-FC2A-463C-B805-68D7A57E4CED.png]


Build one abstraction barriers from different type data.

*Coercion*, 强制类型转换, we need to write only one procedure for each pair of types rather than a different procedure for each collection of types and each generic operation

Hierarchies of types,
> for example, integers are a *subtype* of rational numbers(i.e, any operation that can be applied to a rational number can automatically be applied to an integer).Conversely, we say that rational numbers form a *supertype* of integers.

[image:ECDB86A0-9E0F-49C5-BBA0-AB143E15147D-278-0000A3A0D40859DE/DAF7C95A-2940-4FDC-A8CB-6E7BDCD0CBC6.png]

