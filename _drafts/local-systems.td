---
layout: post
math: true
title: Local systems
tags:
- math
- homotopy theory
- cohomology
- local systems
preamble:
- [Fun, 0, '\mathrm{Fun}']
- [Loc, 0, '\mathrm{Loc}']
---

Let $X$ be a space. When we're first learning algebraic topology we're introduced to singular homology and cohomology with coefficients in an abelian group $A$. One also sees relatively early on a generalization in which we take our coefficients to be not a fixed abelian group, but a *local system* of abelian groups on $X$. (For example, this notion becomes relevant when studying the Serre spectral sequence.) In this post I want to explain a more general perspective on local systems and their homology and cohomology.

--- [hi-there]
    
    Let $X$ be a space. Let $C$ be an $\infty$-category. A *local system* on $X$ valued in $C$ is simply a functor $X \to C$. The $\infty$-category of such objects, often denoted $\Fun(X,C)$, will in this context be denoted $\Loc(X;C)$.
    
    Observe that a map of spaces $f \c Y \to X$ induces a pullback functor $f^\star \c \Loc(X;C) \to \Loc(Y;C)$ via precomposition.

--- Construction

    Let $C$ be an $\infty$-category which is complete and cocomplete. Let $f \c Y \to X$ be a map of spaces. Then the pullback functor $f^\star \c \Loc(X;C) \to \Loc(Y;C)$ admits right and left adjoints $f_\star$ and $f_\dagger$, given by right and left Kan extension:
    $$
    \begin{xy}
    \xymatrix {
    \Loc(X;C) \ar[rr]|{f^\star} & &
    \Loc(Y;C). \ar@/_3ex/[ll]_{f_\star}^{\top} \ar@/^3ex/[ll]^{f_\dagger}_{\top}
    }
    \end{xy}
    $$

--- Examples
    
    Let $C$ be an $\infty$-category which is complete and cocomplete. Let $X$ be any space and let $f \c X \to 1$ be the unique map to the final object. We can identify $\Loc(1;C) \iso C$. Then:
    
    - Pullback $f^\star \c C \to \Loc(X;C)$ takes $c \in C$ to the *constant local system* $c_X$.
    
    - The left adjoint $f_\dagger \c \Loc(X;C) \to C$ is the colimit functor, sending $L \c X \to C$ to $\colim L \in C$. We call this colimit the *homology* of the local system $L$.
    
    - The right adjoint $f_\star \c \Loc(X;C) \to C$ is the limit functor, sending $L \c X \to C$ to $\lim L \in C$. We call this limit the *cohomology* of the local system $L$.
