---
layout: post
math: true
title: Simple objects and Schur's lemma
date: 2015-11-15 19:00:00 -0000
tags:
- math
- abelian category theory
- schur lemma
preamble:
- [im, 0, '\operatorname{im}']
- [End, 0, '\mathrm{End}']
---

Let $\cA$ be an abelian category. We formulate the notion of simple objects in $\cA$, and prove Schur's lemma in this context.

--- Definition [simple]

    A nonzero object $M \in \cA$ is called *simple* if it has no non-trivial subobjects, i.e. any monomorphism $M' \inj M$ is either an isomorphism or the zero map $0 \inj M$.

--- Example [vect]
    
    The simplest[^sorry] example to consider is $\cA$ the category of vector spaces over a field $k$. In this case, the only simple object is the one-dimensional vector space $k$.
    
    [^sorry]: Sorry, wasn't even intentional (at first).
    
    More interesting is to consider $\cA$ the category of representations of a finite group $G$ over a field $k$. Here, a simple object is what is usually referred to as an *irreducible* representation of $G$.

--- Schur's lemma [schur-lemma]

    Let $M, N \in \cA$ be simple objects. Then any morphism $T \c M \to N$ is either zero or an isomorphism.

    --- Proof
    
        Consider the subobjects $i \c \ker(T) \inj M$ and $j \c \im(T) \inj N$. Since $M,N$ are simple each of $i$ and $j$ is either zero or an isomorphism. If $i$ is an isomorphism or $j$ is zero then $T$ is zero. Otherwise $i$ is zero and $j$ is an isomorphism, in which case $T$ is an isomorphism.

--- Corollary [schur-corollary]

    Let $k$ be a commutative ring, and suppose $\cA$ is equipped with the structure of a $k$-linear category.
    
    ~~~ [schur-division-algebra]
        Let $M \in \cA$ be a simple object. Then the $k$-algebra $\End_\cA(M)$ is a division algebra.
    ~~~ [schur-alg-closed]
        Assume $k$ is an algebraically closed field. Let $M \in \cA$ be a simple object such that $\End_\cA(M)$ is finite-dimensional over $k$. Then every endomorphism of $M$ is multiplication by a scalar, i.e. the canonical map
        $$
        k \to \End_\cA(M), \quad a \mapsto a \cdot \id_M
        $$
        is an isomorphism.

    --- Proof
        
        @@schur-division-algebra is a restatement of @schur-lemma, and @@schur-alg-closed follows from @@schur-division-algebra once you recall that the only finite-dimensional division algebra over an algebraically closed field $k$ is $k$ itself.
