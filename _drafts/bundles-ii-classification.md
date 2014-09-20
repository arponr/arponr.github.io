---
layout: text
math: true
section: math
title: "Bundles II: comparisons"
permalink: /bundles-ii-comparisons
desc: Comparing the general notion of bundle described in the previous
      post with the motivating notion of fibre bundle, and comparing
      different fibres.
preamble:
- [c, 0, "\\colon"]
- [ce, 0, "\\mathrel{:=}"]
- [u, 1, '\underline{#1}']
- [id, 0, '\opname{id}']
- [hom, 0, '\opname{hom}']
- [aut, 0, '\opname{aut}']
- [saut, 0, '\mathcal{A}\!\opname{ut}']
- [Bun, 0, '\opname{Bun}']
- [E, 0, '\mathcal{E}']
- [F, 0, '\mathcal{F}']
- [G, 0, '\mathcal{G}']
- [H, 0, '\mathcal{H}']
---

This is a continuation of the [previous post][prev], in which we
defined a sheaf-theoretic notion of *bundle* over a
space, in analogy with the notion of fibre bundles. This time we
deal with a couple of comparison problems. Namely, we discuss:

- why our notion of bundle is in fact a strict generalisation of the
  notion of fibre bundle;
- the "change of fibre", or "associated bundle", construction.

----------------------------------------------------------------------

We start by defining the categories which will feature in our
comparisons. We fix a space $X$ as we did last time.

\begin{definitions}{fibre-bundle-cat}
Let $G$ be a topological group and $F$ a left
$G$-space. [Recall][fibre-bundle] that a $G$-bundle on $X$ with fibre
$F$ is a fibre bundle $\pi \c E \to X$ with fibre $F$ equipped with a
trivialisation $\{(U_i,\kappa_i)\}$ with transition maps in $G$. We
define a *morphism of $G$-bundles with fibre $F$* to be a continous
map $\lambda \c E \to E'$ over $X$ and a common refinement $\{V_j\}$ of
$\{U_i\}$ and $\{U'_{i'}\}$ satisfying the following condition. For
any $i,i',j$ such that $V_j \subseteq U_i$ and $V_j \subseteq
U'_{i'}$, the map
\[
\begin{xy}
  \xymatrix{
    V_j \times F \ar[r]^{\kappa_i^{-1}} &
    \pi^{-1}(V_j) \ar[r]^{\lambda} &
    \pi'^{-1}(V_j) \ar[r]^{\kappa'_{i'}} &
    V_j \times F
  }
\end{xy}
\]
is an automorphism of the form $(v,f) \mapsto (v, g(v)f)$, where $g$
is a map $V_j \to G$.

This defines the *category $\Bun_G(X;F)$ of $G$-bundles on
$X$ with fibre $F$*.
\end{definitions}
  
\begin{definitions}{bundle-sheaf-cat}
Let $\G$ be a sheaf of groups on $X$ and $\F$ a left
$\G$-sheaf. [Recall][bundle-sheaf] that a $\G$-bundle on $X$ with
fibre $\F$ is a bundle $\E$ on $X$ with fibre $\F$ equipped with a
trivialisation $\{(U_i,\kappa_i)\}$ with transition morphisms in
$\G$. We define a *morphism of $\G$-bundles with fibre $\F$* to be a
morphism $\lambda \c \E \to \E'$ of sheaves on $X$ and a common
refinement $\{V_j\}$ of $\{U_i\}$ and $\{U'_{i'}\}$ satisfying the
following condition. For any $i,i',j$ such that $V_j \subseteq U_i$
and $V_j \subseteq U'_{i'}$, the map
\[
\begin{xy}
  \xymatrix{
    \F|_{V_j} \ar[r]^{\kappa_i^{-1}} &
    \E|_{V_j} \ar[r]^{\lambda} &
    \E'|_{V_j} \ar[r]^{\kappa'_{i'}} &
    \F|_{V_j}
  }
\end{xy}
\]
is an automorphism given by the action of an element of $\G(V_j)$.

This defines the *category $\Bun_\G(X;\F)$ of $\G$-bundles on
$X$ with fibre $\F$*.
\end{definitions}

\begin{remark}
Note that all morphisms of $G$-bundles with fibre $F$ and morphisms of
$\G$-bundles with fibre $\F$ are isomorphisms (i.e. $\Bun_G(X;F)$ and
$\Bun_\G(X;\F)$ are groupoids). These are the notions of isomorphism
we will use for these objects.
\end{remark}

\begin{remark}
It follows from a [lemma][auto-left] from last time that if $\lambda \c
\E \to \E'$ is a morphism of sheaves on $X$ with $\E,\E'$ both
principal $\G$-bundles (i.e. $\G$-torsors) then $\lambda$ is a morphism
in $\Bun_\G(X;\G)$ if and only if $\lambda$ is a morphism of right
$\G$-sheaves.

After proving a similar (also easy) lemma for principal $G$-bundles,
we can also see that a continuous map $\lambda \c E \to E'$ over $X$
between principal $G$-bundles $E \to X$ and $E' \to X$ is a morphism
in $\Bun_G(X;G)$ if and only if it is $G$-equivariant.
\end{remark}

We now show that the topological $\Bun_G(X;F)$ is really a special
case of the sheaf-theoretic $\Bun_\G(X;\F)$. [Recall][map-sheaf] that
to a space $Y$ we may associate the sheaf $\u{Y}$ on $X$ of continuous
maps to $Y$.

\begin{proposition}
Let $G$ be a topological group and $F$ a left $G$-space. Taking
sheaves of sections defines an equivalence of categories
\[
\Bun_G(X;F) \iso \Bun_{\u{G}}(X;\u{F}).
\]
\end{proposition}

\begin{proof}
Before beginning observe that the action of $G$ on $F$ certainly
defines an action of $\u{G}$ on $\u{F}$, so the right-hand category is
indeed defined.

Now, we first show that sheaves of sections in fact defines a functor
$\Bun_G(X;F) \to \Bun_{\u{G}}(X;\u{F})$. Let $\pi \c E \to X$ be a
$G$-bundle with fibre $F$ and trivialisation $\{(U_i,\kappa_i)\}$. Let
$\E$ denote the sheaf of sections of $\pi$. A section of $U \times F
\to U$ is simply a continuous map $U \to F$, so composition with the
homeomorphisms $\kappa_i \c \pi^{-1}(U_i) \to U_i \times F$ over $U_i$
determine isomorphisms $\u{\kappa}_i \c \E|_{U_i} \to
\u{F}|_{U_i}$. Then the resulting transition morphism $\u{t}_{ij} \ce
\u{\kappa}_i\u{\kappa}_j^{-1}$ is composition with the transition map
$\kappa_i\kappa_j^{-1}$, which is of the form
\[
(U_i \cap U_j) \times F \to (U_i \cap U_j) \times F, \quad
(u,f) \mapsto (u, t_{ij}(u)f)
\]
for some map $t_{ij} \c U_i \cap U_j \to G$ since $\pi$ has structure
group $G$. Thus $\u{t}_{ij}$ is given by the action of $t_{ij} \in
\u{G}(U_i \cap U_j)$. So indeed $\E$ equipped with the trivialisation
$\{(U_i, \u{\kappa}_i)\}$ is a $\u{G}$-bundle with fibre $\u{F}$.

This defines the functor on objects. For morphisms, a map $\lambda \c
E \to E'$ over $X$ defines (again via composition) a morphism of
sheaves $\u{\lambda} \c \E \to \E'$. That the common refinement and
condition defining a morphism in $\Bun_G(X;F)$ imply the condition
defining a morphism in $\Bun_{\u{G}}(X;\u{F})$ is the same as the
argument above showing that $\E$ has structure group $\u{G}$ if $\pi$
has structure group $G$.

We now sketch why this actually gives an equivalence:

- Essential surjectivity: Suppose we have a $\u{G}$-bundle $\E$ with
  fibre $\F$ and trivialisation $\{(U_i, \kappa_i)\}$ with transition
  morphisms given by the action of $t_{ij} \in \u{G}(U_i \cap
  U_j)$. We form a $G$-bundle $\pi \c E \to X$ with fibre $F$ by
  gluing the trivial bundles $U_i \times F$ over each $U_i$ along the
  transition maps $t_{ij}$. (This will be possible because they come
  from transitions on $\E$ and hence satisfy the cocycle condition.)
  It's clear that the sheaf of sections of $\pi$ will be isomorphic to
  $\E$.
- Full-faithfulness: This follows from the fact that the morphisms in
  $\Bun_G(X;F)$ are determined by the automorphisms of $V_j \times F$
  which appear in \ref{fibre-bundle-cat}, and the morphisms in
  $\Bun_{\u{G}}(X;\u{F})$ are determined by the automorphisms of
  $\F|_{V_j}$ appearing in \ref{bundle-sheaf-cat}. Both automorphisms
  determine and are determined by an element of $\u{G}(V_j)$, which
  implies full-faithfulness.
\end{proof}

So any work we do in studying $\Bun_\G(X;\F)$ for general $\G,\F$ will
in particular give results for $\Bun_G(X;F)$ for general $G,F$ as
well. As a first example we discuss "change of fibre" for bundles,
which will allow us to relate bundles with arbitrary fibre to
principal bundles. This is also known as the "associated bundle"
construction.

\begin{definition}
Let $\G$ be a sheaf of groups on $X$ and $\F$ a $\G$-sheaf. The action
of $\G$ on $\F$ is called *faithful* if the induced morphism of
sheaves $\G \to \saut_X(\F)$ is injective.
\end{definition}

\begin{proposition}
Let $\G$ be a sheaf of groups on $X$ and $\F,\F'$ be two left
$\G$-sheaves. If the action of $\G$ on $\F$ is faithful, then there is
a functor
\[
\Theta_{\F,\F'} \c \Bun_\G(X;\F) \to \Bun_\G(X;\F').
\]
If the action of $\G$ on $\F'$ is also faithful then $\Theta_{\F,\F'}$
and $\Theta_{\F',\F}$ are quasi-inverse equivalences.
\end{proposition}

\begin{proof}
We first define $\Theta_{\F,\F'}$ on objects. Let $\E$ be a
$\G$-bundle on $X$ with fibre $\F$, equipped with trivialisation
$\{(U_i, \kappa_i)\}$ and transition morphisms $\tau_{ij} \in \G(U_i
\cap U_j)$.
\end{proof}





[prev]: /bundles-i-definitions
[fibre-bundle]: /bundles-i-definitions/#bundles-structure-groups
[bundle-sheaf]: /bundles-i-definitions/#bundle-sheaf
[auto-left]: /bundles-i-definitions/#auto-left
[map-sheaf]: /bundles-i-definitions/#map-sheaf
