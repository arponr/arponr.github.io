---
layout: text
math: true
section: blog
title: Bundles and structure groups
permalink: /bundles-structure-groups
desc: Something.
---

\begin{definition}
For $G$ a topological group and $X$ a (sufficiently nice) space, let
$\Bun_G(X)$ denote the set of principal $G$-bundles on $X$. Recall the
following facts.

- This defines a bifunctor, covariant in $G$ and contravariant in $X$;
- There is a classifying space $BG$, defining a covariant functor
  in $G$, such that there is a natural isomorphism of bifunctors
  $\Bun_G(X) \simeq [X,BG]$, where $[-,-]$ denotes homotopy classes of
  maps.
\end{definition}


\begin{example}
Recall that vector bundles of dimension $n$ have structure group
$O(n)$, so the set of vector bundles of dimension $n$ on $X$ is just
$\Bun_{O(n)}(X) \simeq [X, BO(n)]$.
\end{example}