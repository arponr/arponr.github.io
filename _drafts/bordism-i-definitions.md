---
layout: text
math: true
section: blog
title: "Bordism I: definitions"
permalink: /bordism-i-definitions
desc: Something.
preamble:
- [c, 0, "\\colon"]
- [ce, 0, "\\mathrel{:=}"]
- [obj, 0, "\\opname{obj}"]
- [id, 0, "\\mathrm{id}"]
- [B, 0, "\\mathcal{B}"]
- [Mfld, 0, "\\mathtt{Mfld}"]
- [e, 0, "\\emptyset"]
- [d, 0, "\\partial"]
- [R, 0, "\\mathbb{R}"]
---

I'm trying to learn some stable homotopy theory this summer, and am
starting out by reading about bordism. My first goal is to understand
Thom's computation of the unoriented bordism ring, i.e., the
classification of unoriented compact smooth manifolds up to
bordism. This post is just about the basic setup of the problem (with
an eye towards other bordism problems as well). I've been following a
couple of sets of notes by [Haynes Miller][miller] and [Tom
Weston][weston].

#### Generalities

\begin{definition}
A *bordism category* is a category $\B$ equipped
with a functor $\d \c \B \to \B$ and natural transformation
$\iota \c \d \to \id_\B$ such that:

1. $\B$ has finite coproducts $M \amalg N$, including an initial
   object $\e$;
2. $\B$ is essentially small, i.e., has a small subcategory $\B_0$
   such that every $M \in \obj(\B)$ is isomorphic to some $M_0 \in
   \obj(\B_0)$;
3. $\d$ and $\iota$ preserve coproducts;
4. $\d\e \iso \e$ and $\d\d M \iso \e$ for all $M \in
   \obj(\B)$.
\end{definition}

\begin{example}
Hopefully the notation is suggestive enough so that
this motivating example is predictable. We take $\B$ to be the
category $\Mfld$ of compact smooth manifolds (and smooth maps),
$\d$ to be the boundary, and $\iota$ to be the inclusion of the
boundary. Finite coproducts in $\Mfld$ are given by disjoint union,
and $\e$ is the empty manifold. Note, $\Mfld$ is essentially
small because every object can be embedded as a subset of
$\R^\infty$.
\end{example}

In the remainder of this section we state some elementary facts about
a general bordism category $\B$. Then in the next section we will
address this main example (although in slightly more generality, by
letting our manifolds have extra structure and working over a base
space).

\begin{definitions}
- We say $M,N \in \obj(\B)$ are *bordant*, and write $M \equiv N$,
  if there exist $U,V \in \obj(\B)$ such that $M \amalg \d U \iso N
  \amalg \d V$.
- The relation $\equiv$ is called *bordism*.
- We say $M \in \obj(\B)$ is *closed* if $\d M \iso \e$ and a
 *boundary* if $M \equiv \e$.
\end{definitions}

\begin{lemma}
Let $K,L,M,N \in \obj(\B)$.

1. Bordism is an equivalence relation, whose equivalence classes form
   a set.
2. $M \equiv N \implies \d M \iso \d N$.
3. $\d M \equiv \e$.
4. $K \equiv M, L \equiv N \implies K \amalg L \equiv M \amalg N$.
5. If $M \equiv N$ then $M$ is closed (resp. a boundary) if and
   only if $N$ is closed (resp. a boundary).
6. If $M,N$ are closed (resp. boundaries) then $M \amalg N$ is
   closed (resp. a boundary).
7. If $M$ is a boundary then $M$ is closed.
\end{lemma}

\begin{proof}
Easy. (Note that we required $\B$ to be essentially small precisely
so that the bordism classes form a set.)
\end{proof}

\begin{definition}
Let $\Omega(\B)$ denote the set of bordism classes of closed objects
of $\B$. By points 4 and 6 of the lemma, coproduct in $\B$ induces
a monoid structure on $\Omega(\B)$, with identity given by $\e$.
\end{definition}


#### Bordism of (structured) manifolds

Let's first discuss the type of "structure" we will allow on our
manifolds.




[miller]: //www-math.mit.edu/~hrm/papers/cobordism.pdf
[weston]: //www.math.umass.edu/~weston/oldpapers/cobord.pdf