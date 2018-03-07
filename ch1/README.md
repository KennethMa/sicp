# SICP CH1 Building Abstractions with Procedures

### The Elements of Programming
Every powerful language has three mechanisms for combining simple ideas to form more complex ideas:
* *primitive expressions*, which represent the simplest entities the language is concerned with.
* *means of combination*, by which compound elements are build from simpler ones, and
* *means of abstraction*, by which compound elements can be named and manipulated as units.


In Lisp some of the elements that must appear in any powerful  programming language:
* Numbers and arithmetic operations are primitive data and procedures.
* Nesting of combinations provides a means of combining operations.
* Definitions that associate names with values provide a limited means of abstraction.

The general form of a procedure definition is
`(define (<name> <formal parameters>) <body>)`

This alternative *fully expand and then reduce* evaluation method is known as `normal-order 正则序` evaluation, in contrast to the *evaluate the arguments and then apply* method that the interpreter actually uses,which is called `applicative-order 应用序` evaluation.

The general form of a conditional expression is
``` scheme
(cond (<p1> <e1>)
      (<p2> <e2>)

      (<pn> <en>))
```

``` scheme
(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))
```

The general form of an `if` expression is
``` scheme
(define (abs x)
  (if (< x 0)
      (- x)
      x))

```
To evaluate an `if` expression, the interpreter starts by evaluating the <predicate> part of the expression. If the <predicate> evaluates to a true value, the interpreter then evaluates the <consequent> and returns its value. Otherwise it evaluates the <alternative> and returns its value.


`(and <e1> … <en>)`
`(or <e1> … <en>)`
`(not <e>)`

Notice that `and` and `or` are special forms, not procedures, because the subexpressions are not necessarily all evaluated.`not` is an ordinary procedure.

*Black-Box Abstraction*
Procedural Abstraction
A procedure definition should be able to suppress detail.

*bound variable*, the procedure definition binds its formal parameters. 

*lexical scoping*, break up large programs into tractable pieces.


### Procedures and the Processes They Generate

`Recursive Process`, expansion followed by contraction, characterized by a chain of *deferred* operations.
`Iterative Process`, whose state can be summarized by a fixed number of state variables, together with a fixed rule that describes how the state variables should be updated as the process moves from state to state and an (optional) end test that specifies conditions under which the process should terminate.

`Tail-Recursive`, it will execute an iterative process in constant space, even if the iterative process is described by a recursive procedure. With a tail-recursive implementation, iteration can be expressed using the ordinary procedure call mechanism, so that special iteration constructs (such as `do`, `repeat`, `until`, `for` and `while`) are useful only as syntactic sugar.

`Tree Recursion`, in general, the number of steps required by a tree-recursive process will be proportional to the number of nodes in the tree, while the space required will be proportional to the maximum depth of the tree.

`Order of Growth`
R(n), represent the number of internal storage registers used.
k1 * f(n) ≤ R(n) ≤ k2 * f(n)
We say that R(n) has order of growth Θ(f(n))

### Formulating Abstractions with Higher-Order Procedures
#### Procedures as Arguments

#### Constructing Procedures Using lambda
In general, *lambda* is used to create procedures in the same way as *define*, except that no name is specified for the procedure:
```
(lambda (<formal-parameters>) <body>)
```

*A lambda expression can be used as the operator in a combination* such as:
```
((lambda (x y z) (+ x y (square z))) 1 2 3)
12
```

The general form of a *let* expression is
```
(let ((<var1> <exp1>)
      (<var2> <exp2>)
      ...
      (<varn> <expn>))
   <body>)
```

Which can be thought of as saying:
```

let	<var1> have the value <exp1> and
		<var2> have the value <exp2> and
		...
		<varn> have the value <expn>
in 	<body>
```

The way this happens is that the *let* expression is interpreted as an alternate syntax for:

```
((lambda (<var1> ...<varn>)
    <body>)
 <exp1>
 ...
 <expn>)
```

> A *let* expression is simply syntactic sugar for the underlying *lambda* application.

#### Procedures as General Methods
Finding roots of equations by the half-interval method:
``` scheme
(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))
```

Finding fixed points of functions
``` scheme
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
```

#### Procedures as Returned Values
*Average Damping*, given a function f, we consider the function whose value at x is equal to the average of x and f(x).
``` scheme
(define (average-damp f)
  (lambda (x) (average x (f x))))
```

derivative, say dx to be 0.00001
``` scheme
(define dx 0.00001)
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
```

Newton Transform:
![](https://mitpress.mit.edu/sicp/full-text/book/ch1-Z-G-37.gif)
``` scheme
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))
```

Newton Method:
``` scheme
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
```

Another form of the square-root procedure:
``` scheme
(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))
```

Abstractions and first-class procedures

``` scheme
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))
```

Square-root:

``` scheme
; s1
(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

; s2
(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))
```

Some of the rights and privileges of *first-class elements* are:
* They may be named by variables.
* They may be passed as arguments to procedures.
* They may be returned as the results of procedures.
* They may be included in data structures.

## Lisp 概览
编写大型复杂系统：techniques for controlling the complexity of these large systems.

### *Black-box abstraction*黑盒抽象：take something and build a box about it.
* *Primitive Elements*, Primitive procedures, primitive data.
* *Means of Combination*, procedure composition, construction of compound data.
* *Means of Abstraction*,procedure definition,simple data abstraction.
* *Capturing Common Patterns*,High-order procedures, data as procedures.


### Conventional Interfaces
* Generic operations
* large-scale structure and modularity
* Object-oriented programming
* Operations on aggregates

*Lisp*: apply 应用, eval 求值

### *Meta-linguistic Abstraction* 元语言抽象
* Interpretation apply-eval
* Example logic programming
* Register machines

Prefix Notation,前缀操作符

Lisp 中的括号，所括之物是一个组合式（combination），applying operators to operands.

``` scheme
(define (square x) (* x x))
; 等同于
(define square (lambda (x) (* x x)))
```

这里的 `square` 是一个复合过程（compound procedure）.前者是后者的语法糖（syntactic sugar)

在复合过程中，你无法区分*内建元素（built-in)* 与 *复合元素（compund）* 的不同。因为复合元素经过了一次抽象封装

*define* 声明需不需要加括号，取决于你定义的是符号还是 procedure。

Recursive Definition

Block Structure, this particular way of packaging internals inside of  a definition.

## 计算过程
Kinds of Expressions:
* Numbers
* Symbols
* Lambda Expressions
* Definitions
* Conditionals
* Combinations 组合式

*Substitution Rule* 表达式求值的规则：
To evaluate an application
* Evaluate the *operator* to get procedure
* Evaluate the *operands* to get arguments
* Apply the procedure to the arguments
	*  Copy the body of the procedure.Substituting the arguments supplied for the formal parameters of the procedure.
	* Evaluate the resulting new body.


*Substitution Model*, 代换模型，用来推到程序的执行步骤，虽然与实际不太一样，但有利于理解计算过程。

if <predicate>
   <consequent>
   <alternative>
To evaluate an *if* expression:
	* Evaluate the predicate expression
		* If it yields *TRUE*
			* Evaluate the consequent expression
		* Otherwise
			* Evaluate the alternative expression


