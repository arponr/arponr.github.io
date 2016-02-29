---
layout: post
math: true
title: Representations in an abelian category
date: 2015-11-17 20:00:00 -0000
tags:
- math
- abelian category theory
- representation theory
preamble:
- [char, 0, '\operatorname{char}']
- [End, 0, '\operatorname{End}']
- [dual, 1, '#1^\vee']
---

Let $k$ be a field. Let $\cA$ be an abelian $k$-linear category. The prototypical example, from which we are straightforwardly generalizing everything that follows, is where $\cA$ itself is the category of finite-dimensional $k$-vector spaces.

Let $G$ be a finite group such that $\char(k)$ does not divide $\abs{G}$. Denote by $\cA^G$ the (abelian $k$-linear) category of $G$-representations in $\cA$, i.e. the functor category $[\rB G, \cA]$. We review some basic facts from representation theory in this context.

## Semisimplicity of representations

In this section, we formulate the fact that a finite-dimensional linear representation of $G$ decomposes as a direct sum of irreducible representations.

--- Lemma (Averaging trick) [rep-split]

    Consider a short exact sequence
    $$
    0 \to X' \to X \to X'' \to 0,
    $$
    in $\cA^G$, which by definition is short exact when viewed in $\cA$. If it splits in $\cA$ then it splits in $\cA^G$.

    --- Proof
        
        Suppose there is a splitting $T \c X'' \to X$ in $\cA$. Then the average
        $$
        \frac{1}{|G|} \sum_{g \in G} gTg^{-1}
        $$
        is a morphism $X'' \to X$ in $\cA^G$ which also splits the sequence. (Note that this average makes sense by our hypothesis that $\char(k)$ does not divide $\abs{G}$.)

--- Proposition [rep-semisimple]

    Suppose $\cA$ is [semisimple][abelcat-semisimple]. Then $\cA^G$ is semisimple.

    --- Proof

        [Recall that][abelcat-semisimple-iff-split] $\cA$ being semisimple is equivalent to all short exact sequences in $\cA$ splitting and all objects in $\cA$ having finite length. If an object in $\cA^G$ has finite length as an object in $\cA$, it evidently also has finite length as an object in $\cA^G$. The claim then follows from @rep-split.


## Representations of abelian groups

We now formulate the fact that any irreducible (finite-dimensional) linear representation of an abelian group over an algebraically closed field is a character.

--- Assumptions [abel-algclose-fd]

    In this section we assume:
    
    ~~~ [abel]
        $G$ is abelian;
    ~~~ [algclose]
        $k$ is algebraically closed;
    ~~~ [fd]
        $\cA$ is in fact enriched over *finite-dimensional* $k$-vector spaces.

--- Definition [char-dual]

    A *character* on $G$ (over $k$) is a group homomorphism $G \to k^\times$, where $k^\times$ denotes the multiplicative group of $k$. The group of characters on $G$, also called the *dual group* of $G$, is denoted $\dual{G}$.

--- Proposition [simple-impl-char]

    Let $M$ be a simple object in $\cA^G$. Then there's a character $\lambda \c G \to k^\times$ such that the action of $G$ on $M$ is given by multiplication by $\lambda$.

    --- Proof
        
        The claim is simply that the action $\gamma(g) \in \End_\cA(M)$ of each $g \in G$ is a multiple $\lambda(g) \in k$ of the identity. Since $G$ is abelian (here we use assumption @abel),
        $$
        \gamma(g)\gamma(h) = \gamma(gh) =
        \gamma(hg) = \gamma(h)\gamma(g)
        $$
        for all $h \in H$. I.e. $\gamma(g)$ is also a morphism of representations. The claim then follows from [Schur's lemma][abelcat-schur] (here we use assumptions @algclose and @fd) that $M$ being simple implies $\End_{\cA^G}(M) \iso k$.

--- Corollary [simple-impl-simple]
    
    It follows immediately from @simple-impl-char that if $M$ is simple in $\cA^G$ then $M$ is also simple when viewed as an object in $\cA$.

--- Corollary [isotypic]

    Assume $\cA$ is semisimple. Then any representation $M \in \cA^G$ has an *isotypic decomposition*
    $$
    M \iso \bigoplus_{\lambda \in \dual G} M_\lambda,
    $$
    where for $\lambda \in \dual G$ the representation $M_\lambda \in \cA^G$ is acted on by $G$ via $\lambda$, i.e. for $g \in G$ the action $g \c M \to M$ is given by multiplication by $\lambda(g)$.

    Note that such a decomposition is automatically unique: for $\lambda \in \dual G$ we can recover $M_\lambda$ as the kernel of the map $M \to \bigoplus_{g \in G} M$ which on the factor indexed by $g \in G$ is given by multiplication by $1 - \lambda(g)$.

    --- Proof
        
        By @rep-semisimple, $\cA^G$ is semisimple since $\cA$ is. Thus any $M \in \cA^G$ is a direct sum of simple objects. The claim is now follows from @simple-impl-char.



[abelcat-semisimple]: /2015/11/16/abelcat-semisimplicity/#semisimple
[abelcat-semisimple-iff-split]: /2015/11/16/abelcat-semisimplicity/#semisimple-iff-split
[abelcat-schur]: /2015/11/16/abelcat-semisimplicity/#schur-alg-closed
