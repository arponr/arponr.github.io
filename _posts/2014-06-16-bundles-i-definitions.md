---
layout: text
math: true
section: blog
date: 2014-06-16 16:10:00 -0500
title: "Bundles I: definitions"
permalink: /bundles-i-definitions
desc: Principal bundles and structure groups of fibre bundles, placed
      in the more general context of sheaves and torsors.
preamble:
- [c, 0, "\\colon"]
- [ce, 0, "\\mathrel{:=}"]
- [u, 1, '\underline{#1}']
- [id, 0, '\opname{id}']
- [hom, 0, '\opname{hom}']
- [aut, 0, '\opname{aut}']
- [saut, 0, '\mathcal{A}\!\opname{ut}']
- [Top, 0, '\mathrm{Top}']
- [E, 0, '\mathcal{E}']
- [F, 0, '\mathcal{F}']
- [G, 0, '\mathcal{G}']
- [H, 0, '\mathcal{H}']
---

I decided to sit down and understand how structure groups of fibre
bundles work. Principal bundles in particular seem like fairly
ubiquitous objects, and they'll come up right away in the upcoming
posts about bordism. So I thought I'd work through the basics
carefully and write it down.

It struck me that much of the discussion can be translated immediately
to the more general setting of sheaves, so for fun that's how I'll
approach things. Of course I'll point out throughout how the more
familiar setting of bundles fits into the picture.

The aim of this first post is just to set things up.

----------------------------------------------------------------------

We begin by defining the motivating players advertised in the title:
bundles and structure groups.

\begin{notation}
Fix a topological space $X$ until further notice.
\end{notation}

\begin{definitions}{bundles-structure-groups}
Let $F$ be a space and $G$ a topological group.

- A *fibre bundle* over $X$ with *fibre* $F$ is a map $\pi \c E \to X$
  such that there is an open cover $\{U_i\}$ of $X$ and homeomorphisms
  $\phi_i \c \pi^{-1}(U_i) \to U_i \times F$ over $X$ for each $i$. In
  particular the fibre $\pi^{-1}(x)$ is homeomorphic to $F$ for every
  $x \in X$.
- Such data $\{(U_i,\phi_i)\}$ is called a *trivialisation* of the
  fibre bundle. The *transition maps* associated to a trivialisation
  are the maps
  \[
  t_{ij} \c U_i \cap U_j \to \aut(F),
  \]
  where $\aut(F)$ denotes the group of homeomorphisms of $F$ with
  itself, such that the automorphism $\phi_i\phi_j^{-1}$ of $(U_i \cap
  U_j) \times F$ is given by $\id \times t_{ij}$.
- A fibre bundle $\pi \c E \to X$ with *structure group $G$*, or a
  *$G$-bundle*, is one where the fibre $F$ is equipped with a left
  $G$-action and $\pi$ is equipped with a trivialisation for which the
  transition maps $t_{ij}$ factor through the action $G \to \aut(F)$.
- A $G$-bundle is *principal* if $G$ acts simply transitively on the
  fibre $F$, i.e., $F$ is homeomorphic as a left $G$-space to $G$
  (which is a left $G$-space via left multiplication).
\end{definitions}

\begin{remark}{principal-right-action}
Note that a *trivial* principal $G$-bundle $X \times G$ has both a
left and a right $G$-action, via left and right multiplication on $G$.
Since these two actions commute and a principal $G$-bundle $\pi \c E
\to X$ locally looks like $U \times G$ as a left $G$-space, the right
actions on $U \times G$ will glue together to give a global right
$G$-action on $E$ which preserves fibres. I.e., any principal
$G$-bundle is a right $G$-space over $X$.
\end{remark}

These are the type of objects we should have in the back of our mind
throughout. We will generalise them using the language of sheaves,
with the following definitions as our basic tools.

\begin{definitions}
Let $\G$ be a sheaf of groups on $X$.

- A *$\G$-sheaf* on $X$ is a sheaf of sets $\E$ on $X$ together with
  a right action $\E \times \G \to \E$ of $\G$. A *morphism of
  $\G$-sheaves* $\E \to \E'$ on $X$ is a morphism of sheaves of sets
  which commutes with the $\G$-actions.
- A *$\G$-pseudotorsor* is $\G$-sheaf $\E$ such that for all $U
  \subseteq X$ open, either $\E(U)$ is empty or the action of $\G(U)$
  on $\E(U)$ is simply transitive. A $\G$-pseudotorsor $\E$ is a
  *$\G$-torsor* if moreover $\E(U_i)$ is nonempty for all $i$ in some
  open cover $\{U_i\}$ of $X$. A *morphism of $\G$-pseudotorsors or
  $\G$-torsors* is simply a morphism of the underlying $\G$-sheaves.
- There is a *trivial $\G$-torsor* on $X$ given by $\G$ equipped with
  the action given by right multiplication. A $\G$-sheaf $\E$ is
  called *trivial* if there is an isomorphism of $\G$-sheaves $\E \iso
  \G$.
- Note that if $\E$ is a $\G$-sheaf, then $\E|_U$ is a $\G|_U$-sheaf
  on $U$ for any $U \subseteq X$. If $P$ is some property which can be
  enjoyed by $\H$-sheaves on $Y$ for any sheaf of groups $\H$ on any
  space $Y$---e.g. the properties of being a pseudotorsor, or torsor,
  or trivial---then we say a $\G$-sheaf $\E$ on $X$ *locally has the
  property* $P$ if the $\G|_{U_i}$ sheaf $\E|_{U_i}$ has the property
  $P$ for all $i$ in some open cover $\{U_i\}$ of $X$. The same goes
  for morphisms of $\G$-sheaves.
\end{definitions}

\begin{remark}
Note we should really have called these *right* $\G$-sheaves,
$\G$-pseudotorsors, and $\G$-torsors. Of course we can analogously
define *left* $\G$-sheaves, $\G$-pseudotorsors, and $\G$-torsors. We
will need to distinguish between the two later on (as we needed to
distinguish between left and right $G$-spaces for bundles above), but
until then we agree to leave the modifier "right" implicit.
\end{remark}

\begin{remarks}{torsor-equiv}
Observe that any morphism of $\G$-torsors is an isomorphism, since
clearly it must locally be an isomorphism. So suppose $\E$ is a
$\G$-pseudotorsor with a section $s \in \E(U)$ for some $U \subseteq
X$ open. Then there is a morphism of $\G|_U$-torsors $\G|_U \to \E|_U$
on $U$ given by
\[
\G(V) \ni 1 \mapsto s|_V \in \E(V), \quad V \subseteq U\text{ open}.
\]
As just observed this must an isomorphism. I.e., any global section
trivialises a pseudotorsor, and in particilar a pseudotorsor is a
torsor if and only if it is locally trivial. In fact, any $\G$-sheaf
is a $\G$-torsor if and only if it's locally trivial. This is
immediate from the preceding discussion and the following lemma, that
being a pseudotorsor or torsor is a local condition.
\end{remarks}

\begin{lemma}{torsor-local}
If a $\G$-sheaf $\E$ on $X$ is locally a $\G$-pseudotorsor
(resp. $\G$-torsor), then $\E$ is a $\G$-pseudotorsor
(resp. $\G$-torsor).
\end{lemma}

\begin{proof}
It's clear that the statement for $\G$-torsors follows immediately
from the statement for pseudotorsors, so we need only prove the
latter. Assume $\E|_{U_i}$ is a $\G|_{U_i}$-pseudotorsor for all $i$
in an open cover $\{U_i\}$ of $X$. Let $V \subseteq X$ such that
$\E(V)$ is nonempty. Let $s, t \in \E(V)$. We need to show there is a
unique $g \in \G(V)$ such that $t = sg$. Write
\[
V_i \ce V \cap U_i, \quad V_{ij} \ce V \cap U_i \cap U_j,
\]
\[
s_i \ce s|_{V_i}, \quad s_{ij} \ce s|_{V_{ij}}, \quad t_i \ce
t|_{V_i}, \quad t_{ij} \ce t|_{V_{ij}}
\]
for all $i,j$ where these
intersections are nonempty. Since $\E|_{U_i}$ is a
$\G|_{U_i}$-pseudotorsor, there is a unique $g_i \in \G(V_i)$ such
that $t_i = s_ig_i$; then
\[
s_{ij}g_i|_{V_{ij}} = t_{ij} = s_{ij}g_j|_{V_{ij}},
\]
so uniqueness also implies $g_i|_{V_{ij}} = g_j|_{V_{ij}}$. Since the
$V_i$ cover $V$, the $g_i$ glue to $g \in \G(V)$. The equation $t =
sg$ holds when restricted to each $V_i$ and thus must hold on $V$, and
the uniqueness of $g$ is immediate from the uniqueness of the $g_i$.
\end{proof}

Let's bring things back down to bundles for a second.

\begin{definition}
To any space $Y$ we can associate a sheaf of sets $\u{Y}$ on $X$: the
*sheaf of continuous maps to $Y$*, given by the assignment
\[
U \mapsto \hom_\Top(U,Y), \quad U \subseteq X \text{ open}.
\]
\end{definition}

\begin{example}{bundle-example}
Let $G$ be a topological group. Then $\u{G}$ is in fact a sheaf of
groups. If $\pi \c E \to X$ is a right $G$-space over $X$ (a space
over $X$ with a right $G$-action preserving fibres) then the sheaf
$\E$ of continuous sections of $\pi$ is a $\u{G}$-sheaf in a canonical
manner. By \ref{principal-right-action}, any principal $G$-bundle
gives an example of such a $\pi \c E \to X$. In this case we will
moreover have that $\E$ is locally trivial, and hence a $\u{G}$-torsor
by \ref{torsor-equiv}.
\end{example}

We next generalise the main definitions we began with in
\ref{bundles-structure-groups}. I'm not sure if there's standard
terminology for some of these things so I'm just sticking with the
terminology for fibre bundles.

\begin{definition}
If $\E$ is a sheaf of sets on $X$ then we have a *sheaf of
automorphisms* $\saut_X(\E)$ on $X$ which to every open $U \subseteq
X$ assigns the set $\aut(\E|_U)$ of isomorphisms $\E|_U \to \E|_U$
of sheaves on $U$.
\end{definition}

\begin{remark}
If $G$ is a topological group and $F$ a space then giving a $G$-action
on a space $F$ is equivalent to giving a continuous map $G \to
\aut(F)$. Observe similarly that if $\G$ is a sheaf of groups on
$X$ and $\F$ a sheaf of sets on $X$ then giving a left $\G$-action on
$\F$ is equivalent to giving a morphism of sheaves $\G \to
\saut_X(\E)$.
\end{remark}

\begin{definition}{bundle-sheaf}
Let $\F$ be a sheaf of sets on $X$ and $\G$ a sheaf of groups on $X$.

- A *bundle* over $X$ with *fibre* $\F$ is a sheaf of sets $\E$ on $X$
  such that there is an open cover $\{U_i\}$ of $X$ and isomorphisms
  $\phi_i \c \E|_{U_i} \to \F|_{U_i}$ for each $i$.
- Such data $\{(U_i,\phi_i)\}$ is called a *trivialisation* of the
  bundle. The *transition morpshisms* associated to a trivialisation
  are the automorphisms $t_{ij} \ce \phi_i\phi_j^{-1}$ of $\F|_{U_i
  \cap U_j}$.
- A bundle $\E$ on $X$ with *structure group $\G$*, or a
  *$\G$-bundle*, is one where the fibre $\F$ is equipped with a left
  $\G$-action and $\E$ is equipped with a trivialisation for which the
  transition morphisms $t_{ij}$ lie in the image of $\G(U_i \cap U_j)
  \to \saut_X(\F)(U_i \cap U_j)$.
- A $\G$-bundle is *principal* if $\F$ is isomorphic as a left
  $\G$-sheaf to $\G$ (which is a left $\G$-sheaf via left
  multiplication).
\end{definition}

In fact we could have left that last definition out, since according
to \ref{principal-equals-torsor} below, we have already defined it!

\begin{lemma}{auto-left}
Let $\G$ be a sheaf of groups on $X$. Any morphism of right
$\G$-sheaves $t \c \G \to \G$ is given by left multiplication by some
$g \in \G(X)$:
\[
t_U \c\  \G(U) \ni h \mapsto g|_Uh \in \G(U), \quad U \subseteq X \text{
open}.
\]
\end{lemma}

\begin{proof}
Let $1_U \in \G(U)$ denote the unit for $U \subseteq X$ open. Let $g
\ce t_X(1_X) \in \G(X)$. Since $1_X|_U = 1_U$ and $t$ is a morphism of
right $\G$-sheaves we have for any $U \subseteq X$ open and $h \in
\G(U)$:
\[
t_U(h) = t_U(1_U) \cdot h = t_X(1_X)|_U \cdot h = g|_Uh.
\]
\end{proof}

\begin{proposition}{principal-equals-torsor}
Let $\G$ be a sheaf of groups on $X$. A sheaf of sets $\E$ on $X$ is a
principal $\G$-bundle if and only if it is a right $\G$-torsor.
\end{proposition}

\begin{proof}
($\Rightarrow$) Let $\E$ be a principal $\G$-bundle sheaf. So we have
an open cover $\{U_i\}$ of $X$ and isomorphisms $\E|_{U_i} \iso
\G|_{U_i}$ such that the transition morphisms $t_{ij}$ are given by
left multiplication by some $g_{ij} \in \G(U_i \cap U_j)$. Since left
and right multiplication commute, the right actions of $\G|_{U_i}$ on
$\E|_{U_i}$ via right-multiplication will glue together to give a
global right action of $\G$ on $\E$ (this is precisely analogous to
\ref{principal-right-action}). Thus $\E$ is a right $\G$-sheaf, and
since $\E$ is by construction locally trivial it must be a $\G$-torsor
by \ref{torsor-equiv}.

($\Leftarrow$) Suppose $\E$ is a right $\G$-torsor. By
\ref{torsor-equiv} it is locally trivial: there is an open cover
$\{U_i\}$ of $X$ and isomorphisms of right $\G$-sheaves $\E|_{U_i}
\iso \G|_{U_i}$. So $\E$ is a bundle sheaf with fibre $\G$. Then that
$\E$ has structure group $\G$ is immediate from \ref{auto-left}.
\end{proof}

Now, I've said that we've *generalised* the notion of fibre bundle
with this notion of bundles as sheaves. But we've been proceeding on
analogies alone. So though I've hinted at it in \ref{bundle-example},
I haven't actually proved in what sense this is a generalisation. But
I'll save that for the next post.