# SICP CH3 Modularity, Objects, and State
#sicp#

To a large extent, then, the way we organize a large program is dictated by  our perception of the system to be modeled. In this chapter we will investigate two prominent organizational strategies arising from two rather different ‘world views’ of the structure of systems.
* Object, viewing a large system as a collection of distinct objects whose behaviors may change over time
* Stream, information that flow in the system, much as an electrical engineer views a signal-processing systems.

## Assignment and Local State
Each computational object must have its own *local state variables* describing the actual object’s state.

`set!` :

``` scheme
(set! <name> <new-value>)
```

Here `<name>` is a symbol and `<new-value>` is any expression. `set!` changes <name> so that its value is the result obtained by evaluating <new-value>.

`begin`

``` scheme
(begin <exp1> <exp2> ... <expk>)
```

In general, evaluating the expression causes the expressions `<exp1>` through `<expk>` to be evaluated in sequence and the value of the final expression `<expk>` to be returned as the value of the entire `begin` form.

### The Benefits of Introducing Assignment
From the point of view of one part of a complex process, the other parts appear to change with time. They have hidden time-varying local state.If we wish to write computer programs whose structure reflects this decomposition, we make computational objects whose behavior changes with time.We model state with local state variables, and we model the changes of state with assignments to those variables.

> By introducing assignment and the technique of hiding state in local variables, we are able to structure systems in a more modular fashion than if all state had to be manipulated explicitly, by passing additional parameters.

### The Costs of Introducing Assignment
So long as we do not use assignments, two evaluations of the same procedure with the same arguments will produce the same result, so that procedures can be viewed as computing mathematical functions.

A language that supports the concept that *equals can be substituted for equals* in an expression without changing the value of the expression is said to be `referentially transparent 引用透明`.

In contrast to functional programming, programming that makes extensive use of assignment is known as *imperative programming*.

