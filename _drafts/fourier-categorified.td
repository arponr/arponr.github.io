---
layout: post
math: true
title: A categorified fourier transform
tags:
- math
- category theory
- fourier transform
- representation theory
---


Here I work out in some detail the story told in [Lurie's talk](//vimeo.com/120708135) on categorifying the Fourier transform.

# Notation

We work throughout over a fixed algebraically closed field $k$. By *category* we always mean a semisimple abelian $k$-linear category; we denote the $2$-category of categories by $\Cat$. By *vector space* we always mean a finite dimensional $k$-vector space; we denote the category of vector spaces by $\Vect$.

For $G$ a group we let $\dual G$ denote the dual group of homomorphisms $G \to k^\times$ and we let $\Rep(G;\Cat)$ denote the $2$-category of categories with $G$-action. Recall that taking homotopy fixed points determines a functor
$$
(-)^G \c \Rep(G;\Cat) \to \Rep(\dual G; \Cat).
$$

# Theorem

Let $G$ be a finite abelian group. Recall there is a canonical isomorphism $G \iso \ddual G$, allowing us to interpret $(-)^{\dual G}$ as a functor $\Rep(\dual G;\Cat) \to \Rep(G;\Cat)$. In fact, $(-)^{\dual G}$ is an inverse to the functor $(-)^G$, determining an equivalence
$$
\Rep(G;\Cat) \iso \Rep(\dual G;\Cat).
$$

# Proof

By symmetry in $G$ and $\dual G$, it suffices to give a natural equivalence $(\cC^{\dual G})^G \iso \cC$ for $\cC \in \Rep(\dual G;\Cat)$. Before we begin, let's note that the intuition behind this isomorphism comes from the prototypical example, when $\cC$ is the category of $\dual G$-graded vector spaces. In this case, taking $\dual G$-fixed points of $\cC$ gives the category $\Vect$ of vector spaces, equipped with the trivial $G$ action. Then taking $G$-fixed points of $\Vect$ gives the category $\Rep(G;\Vect)$ of (linear) representations of $G$. In this example our equivalence $\Rep(G;\Vect) \to \cC$ should reconstruct the decomposition of a representation into irreducibles. Indeed since $G$ is abelian, its irreducible representations are precisely its characters $\lambda \in \dual G$), and so for any representation $V$ of $G$ we have a decomposition of representations $V = \bigoplus_{\lambda \in \dual G} V_\lambda$ where
$$
V_\lambda \ce \{v \in V : gv = \lambda(g)v \text{ for all } g \in G\}
$$
is the subrepresentation of $V$ on which $G$ acts by $\lambda \in \dual G$. So the desired functor should be $V \mapsto \{V_\lambda\}_{\lambda \in \dual G}$.


