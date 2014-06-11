---
layout: text
math: true
section: blog
title: "Bordism I: definitions"
permalink: /bordism-i-definitions
desc: Something.
preamble:
- [l, 0, "\\left"]
- [r, 0, "\\right"]
- [f, 0, "\\frac"]
- [wt, 0, "\\widetilde"]
- [c, 0, "\\colon"]
- [ce, 0, "\\mathrel{:=}"]
- [ec, 0, "\\mathrel{=:}"]
- [inj, 0, "\\hookrightarrow"]
- [obj, 0, "\\opname{obj}"]
- [id, 0, "\\mathrm{id}"]
- [colim, 0, "\\opname{colim}"]
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

\begin{example}{main-example}
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
space). We will in particular discuss at the end why this
definition of bordism is equivalent to the more familiar one for
manifolds.

\begin{definitions}
- We say $M,N \in \obj(\B)$ are *bordant*, and write $M \equiv N$,
  if there exist $U,V \in \obj(\B)$ such that $M \amalg \d U \iso N
  \amalg \d V$.
- The relation $\equiv$ is called *bordism*.
- We say $M \in \obj(\B)$ is *closed* if $\d M \iso \e$ and a
 *boundary* if $M \equiv \e$.
\end{definitions}

\begin{proposition}{bordism-props}
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
\end{proposition}

\begin{proof}
Easy. (Note that we required $\B$ to be essentially small precisely
so that the bordism classes form a set.)
\end{proof}

\begin{definition}
Let $\Omega(\B)$ denote the set of bordism classes of closed objects
of $\B$. By points (iv) and (vi) of \ref{bordism-props}, coproduct in
$\B$ induces a commutative monoid structure on $\Omega(\B)$, with
identity given by $\e$.
\end{definition}


#### Bordism of (structured) manifolds

Let's first discuss the type of "structure" we will allow on our
manifolds. It will come from "structure" on the stable normal bundle,
so we begin there.

\begin{notation}
Let $TM$ denote the tangent bundle of a smooth manifold $M$.
\end{notation}

\begin{definition}
Let $i \c M \to N$ be an immersion of smooth manifolds. The *normal
bundle* $\nu_i$ of $i$ (or of $M$ in $N$) is the vector bundle on $M$
defined by short exact sequence $0 \to TM \to i^*TN \to \nu_i \to 0$.
\end{definition}

\begin{proposition}{normal-composition}
Let $i \c L \to M$ and $j \c M \to N$ be immersions of smooth
manifolds. Let $k \ce j \circ i$. Then there is a short exact sequence
\[
0 \to \nu_i \to \nu_k \to i^*\nu_j \to 0
\]
of bundles on $L$.
\end{proposition}

\begin{proof}
Since pullback of vector bundles is exact we have
\[
i^*\nu_j \iso i^*\l(\f{j^*TN}{TM}\r) \iso \f{k^*TN}{i^*TM} \iso
\f{k^*TN/TL}{i^*TM/TL} \iso \f{\nu_k}{\nu_i}.
\]
\end{proof}

\begin{definition}{stable-normal}
Let $M$ be a compact smooth manifold. let $[\xi] \in [M, BO]$ be the
homotopy class classifying the tangent bundle $TM \to M$ (stably). The
*stable normal bundle* $\nu_M$ of $M$ is defined as the inverse of
$[\xi]$ in the group $[M, BO] \iso \wt{KO}(M)$.

Note if $i \c M \to \R^n$ is an immersion (which always exists, as
remarked in \ref{main-example}) then by definition we have a short
exact sequence
\[
0 \to TM \to i^*T\R^n \to \nu_i \to 0.
\]
Since $T\R^n$ is trivial it follows that $\nu_i$ is inverse to $TM$ in
$\wt{KO}(M)$. Thus the stable classifying map $M \to BO$ of $\nu_i$
determines the homotopy class of the stable normal bundle $\nu_M$
(hence the terminology). But note that, by definition, $\nu_M$ does
not depend on the choice of dimension $n$ and immersion $i$.
\end{definition}

\begin{definitions}
Let $f \c B \to BO$ be a fibration. Let $\xi$ be a vector bundle on a
compact smooth manifold $M$. Let $g \c M \to BO$ be a map classifying
$\xi$. An *$f$-structure* on $\xi$ is the homotopy class $[\wt g] \in
[M,B]$ of a lift in the diagram
\begin{equation}{f-structure}
\begin{xy}
\xymatrix {
  & B \ar[d]_{f} \\
  M \ar@{-->}[ur]^{\wt g} \ar[r]^g & BO.
}
\end{xy}
\end{equation}
Note that the class $[\wt g]$ only depends on the class $[g]$, i.e. on
the bundle $\xi$, since $f$ is a fibration.

An *$f$-structure* on a compact smooth manifold $M$ is an
$f$-structure on its stable normal bundle $\nu_M$.
\end{definitions}

\begin{examples}
Why should we care about fibrations $B \to BO$? Well, maybe the
primary class of examples will answer that. Whenever we have a
morphism of topological groups $\phi \c G \to O$ we get a fibration $f
\ce B\phi \c BG \to BO$. In particular if we have a sequence of
morphisms
\[
\begin{xy}
\xymatrix {
  G(0) \ar[r] \ar[d] & G(1) \ar[r] \ar[d] & G(2) \ar[r] \ar[d] &
  \cdots \ar[d] \\
  O(0) \ar[r] & O(1) \ar[r] & O(2) \ar[r] & \cdots
}
\end{xy}
\]
we get a morphism $\colim_n G(n) \ec G \to O \ce \colim_n
O(n)$. Then a lift in \ref{f-structure} is a choice of $G$-structure
on the bundle, and indeed in this situation we will abusively refer to
$f$-structures (on bundles and manifolds) as *$G$-structures*. Here
are some important subexamples:

1. The most basic case comes from the identity $\id \c O \to O$,
   inducing $f = \id \c BO \to BO$. Obviously every vector bundle on a
   compact smooth manifold, and hence every compact smooth manifold,
   has a unique $O$-structure.
2. Slightly less trivially we have the inclusion $SO \to O$ coming
   from the inclusions $SO(n) \to O(n)$. This induces the two-to-one
   cover $BSO \to BO$ arising from a choice of orientation. I.e., an
   $SO$-structure on a bundle is precisely an orientation.
3. The inclusions $U(n) \to O(2n)$ give a morphism $U \to O$ and hence
   a fibration $BU \to BO$. A $U$-structure on a bundle is called an
   *almost-complex structure*.
\end{examples}

\begin{proposition}{trivial-normal}
Let $i \c M \to N$ be an immersion of compact smooth manifolds whose
normal bundle $\nu_i$ is trivial. Then $\nu_M = i^*\nu_N$, and for any
fibration $f \c B \to BO$, an $f$-structure on $N$ induces a canonical
$f$-structure on $M$.
\end{proposition}

\begin{proof}
Choose an immersion $j \c N \to \R^n$ and let $k \ce j \circ i$. By
\ref{normal-composition} we have an exact sequene $0 \to \nu_i \to
\nu_k \to i^*\nu_j \to 0$. Since $\nu_i$ is trivial, $\nu_k$ and
$i^*\nu_j$ are equal in $\wt{KO}(M) \iso [M,BO]$. By the discussion
in \ref{stable-normal} we know then that if we take a map $N \to BO$
classifying the stable normal bundle $\nu_N$, then its restriction to
$M$ will classify $\nu_M$, as desired. It follows immediately that any
lift defining an $f$-structure on $N$ canonically restricts to a lift
defining an $f$-structure on $M$.
\end{proof}

Finally we may define the bordism categories of manifolds, whose
bordism classes we will analyse in future posts.

\begin{definition}
Let $X$ be a space and $f \c B \to BO$ a fibration. The category
$\Mfld^f_X$ of *compact smooth manifolds with $f$-structure over $X$*
is defined as follows:

- objects are continuous maps $M \to X$ where $M$ is a compact smooth
  manifold equipped with an $f$-structure (note we will often abuse
  as usual and refer to an object of simply by the underlying manifold
  $M$);
- morphisms are commutative diagrams
  \[
  \begin{xy}
  \xymatrix {
    M \ar[rr]^i \ar[dr] & & N \ar[dl] \\
    & X &
  }
  \end{xy}
  \]
  where $i$ is a smooth immersion whose normal bundle $\nu_i$ is
  trivial, such that the $f$-structure induced by $i$ on $M$
  by \ref{trivial-normal} agrees with its equipped $f$-structure.

We claim $\Mfld^f_X$ is in fact a bordism category. Generalising
\ref{main-example}, we still take $\d$ to be the boundary and $\iota$
to be the inclusion of the boundary, noting that the inclusion $\d M
\to M$ always has trivial normal bundle[^boundary-trivial] so that $M$
induces a canonical $f$-structure on $\d M$ by
\ref{trivial-normal}. Moreover:

1. Obviously the unique map from the empty manifold $\e \to X$ gives
   the initial object. We claim disjoint union still gives finite
   coproducts. Given maps $M \to X$ and $N \to X$ there is of
   course a canonical map $M \amalg N \to X$. Moreover $[M \amalg N,
   B] \iso [M, B] \times [N, B]$ so $f$-structures on $M$ and $N$
   induce a canonical $f$-structure on $M \amalg N$. The maps
   $M \to M \amalg N$ and $N \to M \amalg N$ are open embeddings, so
   are clearly immersions with trivial (zero-dimensional) normal
   bundles. It's not difficult to see then that $M \amalg N \to X$
   really does define a coproduct in $\Mfld^f_X$.
2. Essential smallness follows again from the embedding theorem.
3. Clearly $\d$ and $\iota$ preserve coproducts.
4. It's also evident that $\d\e \iso \e$ and $\d\d M \iso \e$.

So indeed we have a bordism category.
\end{definition}

\begin{remark}
One might be concerned that we haven't properly generalised
\ref{main-example} since we have restricted our set of morphisms. But
since we have the same coproduct and boundary, and we only need to
care about *isomorphisms* to define the set of bordism classes
$\Omega(\Mfld^f_X)$, indeed setting $X$ to be a point and $f \ce \id
\c BO \to BO$ recovers the same bordism classes $\Omega(\Mfld)$ of
compact smooth manifolds.
\end{remark}

We finish by assuring ourselves that we aren't working with some
ridiculous notion of bordism, as promised above. Fix a space $X$ and
fibration $f \c B \to BO$ for the remainder.

\begin{lemma}{cross-interval}
Suppose $M \in \obj(\Mfld^f_X)$ is closed. Then $M \times I$ has the
structure (not necessarily unique) of an object of $\Mfld^f_X$ such
that the inclusion $i \c M \iso M \times \{0\} \inj M \times I$
determines a morphism in $\Mfld^f_X$.
\end{lemma}

\begin{proof}
Since $M$ is closed, $M \times I$ is a compact smooth manifold and
composition with projection $M \times I \to M \to X$ gives us a map to
$X$. Now, $\nu_i$ is clearly trivial, so by \ref{trivial-normal} we have
$\nu_M = i^*\nu_{M \times I}$. I.e., we have a commutative diagram
\[
\begin{xy}
\xymatrix{
  M \ar[r]^{\wt g} \ar[d]_i \ar[dr]^g & B \ar[d]^f \\
  M \times I \ar[r]^h & BO
}
\end{xy}
\]
where $g$ classifies $\nu_M$, $h$ classifies $\nu_{M \times I}$, and
$\wt g$ gives the $f$-structure on $M$. Since $f$ is a fibration there
exists a lift $\wt h \c M \times I \to B$ in the diagram. It's then
clear that the $f$-structure $[\tilde h]$ on $M \times I$ is as desired.
\end{proof}

\begin{definition}{inverse}
Let $M \in \obj(\Mfld^f_X)$ be closed. Let $M \times I \in
\obj(\Mfld^f_X)$ be as given by \ref{cross-interval}. Observe that
\[
\d(M \times I) = M \times \{0\} \amalg M \times \{1\} \iso M \amalg M'
\]
where $M'$ has the same underlying manifold and map to $X$ as $M$, but
possibly a different $f$-structure. We call $M'$ an *inverse* of $M$;
this is not unique since the $f$-structure on $M \times I$ is not
unique, but we abusively denote any inverse by $-M$. (This terminology
and notation will be earned below.)
\end{definition}

\begin{remark}{inverse-props}
One may check easily that the following properties hold for $M,N \in
\obj(\Mfld^f_X)$:

1. If we have an isomorpshism $M \to N$ then the canonical morphisms
   $M \times I \to N \times I$ and $-M \to -N$ are isomorphisms.
2. Inverse respects coproducts: $-(M \amalg N) \iso -M \amalg -N$.
3. Inverse is an involution: $-(-M) \simeq M$.
\end{remark}

\begin{proposition}
Let $M,N \in \obj(\Mfld^f_X)$ be closed. Then $M \equiv N$ if and only
if there exists $W \in \obj(\Mfld^f_X)$ such that $M \amalg -N \iso \d
W$ for some inverse $-N$ of $N$.
\end{proposition}

\begin{proof}
($\Rightarrow$) Assume $M \amalg -N \iso \d W$. By \ref{inverse} we
have $N \times I \in \obj(\Mfld^f_X)$ such that $\d(N \times I) \iso
-N \amalg N$. Then
\[
M \amalg \d(N \times I) \iso M \amalg -N \amalg N \iso \d W \amalg N
\]
so $M \equiv N$.

($\Leftarrow$) Assume $M \equiv N$, so $M \amalg \d U \iso N \amalg d
V$.
\end{proof}


[^boundary-trivial]:
    That $\d M \to M$ has trivial normal bundle can be seen by the
    existence of a collar: an open neighbourhood $U \subseteq M$ of
    $\d M$ isomorphic to $\d M \times [0, 1)$ with $\d M$ identified
    with $\d M \times \{0\}$. For $\d M \times \{0\} \to \d M \times
    [0,1)$ certainly has trivial normal bundle, and the open embedding
    $U \to M$ obviously has zero-dimensional normal bundle, so then
    it's immediate from \ref{normal-composition}. See, e.g.,
    [Kosinski][kosinski] for a proof of the existence of a collar.



[miller]: //www-math.mit.edu/~hrm/papers/cobordism.pdf
[weston]: //www.math.umass.edu/~weston/oldpapers/cobord.pdf
[kosinski]: //www.maths.ed.ac.uk/~aar/papers/kosinski.pdf