---
layout: post
math: true
title: Length and semisimplicity
date: 2015-11-16 12:00:00 -0000
tags:
- math
- abelian category theory
- length
- semisimplicity
- schur lemma
preamble:
- [lg, 0, '\operatorname{lg}']
- [im, 0, '\operatorname{im}']
- [End, 0, '\mathrm{End}']
---

Let $\cA$ be an abelian category. In the [last post][last-post] we formulated the notion of simple objects in $\cA$. Here we discuss ways in which objects of $\cA$ may be built out of simple objects.

[last-post]: /2015/11/15/schur-lemma

## Length

--- Definitions [length]
    
    Let $M \in \cA$. 
    ~~~ [composition]
        A *composition series* of $M$ is a finite filtration $F$ of $M$,
        $$
        0 = M_0 \inj M_1 \inj \cdots \inj M_{n-1} \inj M_n = M,
        $$
        such that the successive quotients $M_i/M_{i-1}$ ($1 \le i \le n$) are all simple. The integer $n$ is called the *length* of the composition series.
    ~~~ [composition-multiplicity]
        If $F$ is a composition series of $M$ as above and $N \in \cA$ a simple object, we denote by $[M : N]_F$ the *multiplicity* of $N$ in $F$, i.e. the number of $1 \le i \le n$ such that $M_i/M_{i-1} \iso N$.
    ~~~ [finite-length]
        We say $M$ is of *finite length* if it admits a composition series. More specifically, we say $M$ is of *length* $\le n$ if it admits a composition series of length $n$.
    
--- Lemma [multiplicity-independent]

    Let $M \in \cA$ be an object of finite length, and let $N \in \cA$ be a simple object. The multiplicity $[M : N]_F$ is independent of the choice of composition series $F$ of $M$.
    
    --- Proof
    
        Hi there
    
    --- Notation [multiplicity]
    
        By virtue of @multiplicity-independent, we may speak of the multiplicity of $N$ in $M$ independently of $F$, and denote it by $[M : N]$.
        
    --- Corollary [length-independent]
    
        It follows from @multiplicity-independent that if $M$ is of length $\le n$, then
        $$
        n = \sum_{[N]} [M : N]
        $$
        is independent of the choice of composition series of $M$, where the sum is over a set of representatives for the isomorphism classes of simple objects in $\cA$. That is, if $M$ is of finite length, then it is of length $\le n$ for a unique integer $n$.
        
        Thus we update our terminology to say $M$ is of *length* $n$, and denote its length $n$ by $\lg(M)$.
        
## Semisimplicity

--- Definition [semisimple]

    ~~~ An object $X \in \cA$ is said to be *semisimple* if it is a direct sum of finitely many simple objects.
    ~~~ We say the entire category $\cA$ is *semisimple* if all objects in $\cA$ are semisimple.

--- Example [vect]
    
    The category of finite-dimensional vector spaces over a field $k$ is evidently semisimple. Of course, this doesn't remain true when we consider modules over any ring, commutative even. E.g. suppose $A$ is a Noetherian commutative ring; to be semisimple as a module over itself, $A$ must in particular have finite length, i.e. be *Artinian*. If $A$ is moreover a domain, then $A$ is Artinian if and only if it's a field, so for example $\lZ$ is not of finite length (hence not semisimple) over itself.

--- Proposition [semisimple-iff-split]

    $\cA$ is semisimple if and only if all objects in $\cA$ have finite length and every short exact sequence in $\cA$ splits.

    --- Proof
    
        ($\shimplied$) We want to show any $X \in \cA$ is semisimple. We induct on the length of $X$ (finite by hypothesis). The cases $\lg(X) = 0$ (i.e. $X \iso 0$) and $\lg(X) = 1$ (i.e. $X$ simple) are tautological. If $\lg(X) > 1$ then we can choose a simple subobject $X' \inj X$ and consider the resulting short exact sequence
        $$
        0 \to X' \to X \to X'' \to 0.
        $$
        By hypothesis this splits. Since $X'$ is simple, this reduces the semisimplicity of $X$ to the semisimplicity of $X''$. But $\lg(X'') = \lg(X) - 1$ so we're done by induction.
        
        ($\shimplies$) Obviously if $X \in \cA$ is semisimple then it has finite length. So suppose given a short exact sequence
        $$
        0 \to X' \to X \to X'' \to 0.
        $$
        By hypothesis we may write $X \iso \bigoplus_{i \in I} X_i$ and $X' \iso \bigoplus_{j \in J} X'_j$ where $I,J$ are finite sets and the $X_i,X'_j$ are simple. Then the inclusion $\phi \c X' \to X$ is given by a matrix of maps $\phi_{i,j} \c X'_j \to X_i$, each of which is either zero or an isomorphism by Schur's lemma @schur-lemma. Since $\phi$ is injective each $\phi_{i,j}$ must in fact be an isomorphism. I.e. we may take $J \subseteq I$ and $X'_j \iso X_j$. Then there's an obvious projection $X \to X'$ splitting the sequence.

