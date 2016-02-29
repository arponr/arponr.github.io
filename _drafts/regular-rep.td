---
layout: post
math: true
title: The regular representation
tags:
- math
- representation theory
---


# Finite groups @finite

Let $G$ be a finite group. Let $k$ be an algebraically closed field such that $\char(k)$ does not divide $G$. All vector spaces and representations in this section are over $k$.

## Definition @finite-regular-rep

Consider the vector space $\Fun(G)$ of functions from $\phi \c G \to k$. This has the structure of a $G \times G$-representation by letting $(g,h) \in G \times G$ act on $\phi \c G \to k$ via the formula
$$
((g,h)\cdot \phi)(x) = \phi(g^{-1}xh).
$$
This is perhaps what should be called the *regular representation* associated to $G$. Well, note that it's a representation of $G \times G$, but it then naturally induces $G$-representation structures on $\Fun(G)$:

- restricting in the map $(\id_G, 1) \c G \to G \times G$ sending $g \mapsto (g,1)$ gives us the *left regular representation*, where $(g \cdot \phi)(x) = \phi(g^{-1}x)$;

- restricting in the map $(1, \id_G) \c G \to G \times G$ sending $g \mapsto (1,g)$ gives us the *right regular representation*, where $(g \cdot \phi)(x) = \phi(xg)$.

Unless otherwise stated we consider $\Fun(G)$ as a $G$-representation using the left regular representation structure.

## Lemma @maps-to-regular

Let $V$ be a representation of $G$. Then there is a natural isomorphism (of vector spaces)
$$
\Hom_G(V, \Fun(G)) \isoto V^\vee,
$$
given by sending $T \c V \to \Fun(G)$ to the linear functional $v \mapsto T(v)(1)$.

## Proof

Trivial.

## Corollary @regular-decomposition

Let $\{V_i\}_{i \in I}$ be a set of representatives for the isomorphism classes of irreducible representations of $G$. Then there is an isomorphism of $G$-representations
$$
\Fun(G) \iso \bigoplus_{i \in I} V_i^\vee \otimes V_i
$$
(where here $V_i^\vee$ is viewed just as a vector space, i.e. a trivial $G$-representation). In particular, taking dimensions of each side, we get
$$
|G| = \sum_{i \in I} \dim(V_i)^2.
$$

## Proof

For any representation $V$ we have by semisimplicity and Schur's lemma that
$$
V \iso \bigoplus_{i \in I} \Hom_G(V_i, V) \otimes V_i.
$$
The claim then follows from plugging in $V = \Fun(G)$ and applying @maps-to-regular.

* * *

# Compact Lie group @lie

...
