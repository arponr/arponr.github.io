---
layout: post
math: true
date: 2014-07-05 13:30:00 -0500
title: Homotopy (co)limits aren't (co)limits in the homotopy category
tags:
- math
- homotopy theory
- limits
preamble:
- [Grp, 0, '\mathrm{Grp}']
- [RP, 0, '\bR\bP']
---

It's really nice to be able to think about things via universal properties, and I in particular know and love how to do this for limits and colimits in ordinary categories. But in homotopy theory things these notions need to be fixed slightly, since they're not homotopy invariant. The canonical example in the familiar realm of spaces is that $D^n \from S^{n-1} \to D^n$ has pushout $S^n$ but $* \from S^{n-1} \to *$ has pushout $*$.

This is what leads one to define homotopy limits and homotopy colimits, which *are* homotopy invariant. But, not understanding these things all too well, and seeking to retreat into familiar territory, I'm tempted to just think of them as limits as colimits in the homotopy category. But this is so, so wrong! The example above already shows that, but I wanted to write down a perhaps even more severe example I learned from [the internet][exist] which helped hammer this point home.

--- Notation

    Let $\cH$ denote the homotopy category of pointed spaces (for definiteness maybe take this to be pointed CW complexes and maps up to homotopy). For $X,Y \in \cH$, denote $\Hom_\cH(X,Y)$ by $[X,Y]$.

--- Example (a colimit which doesn't exist)

    Consider the diagram
    $$
    \begin{xy}
    \xymatrix{
        S^1 \ar[r]_i \ar[d]^f & D^2 \\ S^1. &
    }
    \end{xy}
    $$
    where $i$ is the canonical inclusion and $f$ is a degree $2$ map. If we imagine the bottom $S^1$ as $\RP^1$, then this diagram is the attaching of the $2$-cell which forms $\RP^2$, so the homotopy pushout of the diagram (which agrees with the ordinary pushout in the category of pointed spaces, since $i$ is already a cofibration) is $\RP^2$. On the other hand, we can show that this diagram has no colimit in $\cH$.
    
    Suppose there is a pushout $X \in \cH$: then for $Y \in \cH$ we have
    $$
    [X,Y] \iso [S^1,Y] \times_{[S^1, Y]} [D^2,Y] \iso \pi_1(Y)
    \times_{\pi_1(Y)} 1,
    $$
    where the map $\pi_1(Y) \to \pi_1(Y)$ defining the fiber product is multiplication by $2$, by definition of $f$. Thus $[X,Y] \iso \pi_1(Y)[2]$ is the set of $2$-torsion in $\pi_1(Y)$. We'll use this fact to obtain a contradiction, proving that the functor $Y \mapsto \pi_1(Y)[2]$ on $\cH$ cannot be corepresentable.

    First, we have $[X,S^0] \iso \pi_1(S^0)[2] \iso 0$, implying $X$ is connected. Second, for $G$ a (discrete) group, we may consider the classifying space $BG$. Since $X$ is connected and $BG$ is a $1$-type, taking $\pi_1$ induces an isomorphism
    $$ [one-type]
    [X, BG] \iso \Hom_\Grp(\pi_1(X),G),
    $$
    and hence we obtain isomorphisms
    $$
    \Hom_\Grp(\pi_1(X),G) \iso \pi_1(BG)[2] \iso G[2],
    $$
    all natural in $G$. I.e. $\pi_1(X)$ corepresents the $2$-torsion functor $G \mapsto G[2]$ on $\Grp$. But so does $\bZ/2$, so by Yoneda we get an isomorphism $\pi_1(X) \iso \bZ/2$. Again applying @one-type, this isomorphism is induced by a map $X \to B\bZ/2 \iso \RP^\infty$.
    
    Now, since $\pi_1(\RP^2) \iso \bZ/2$ and $\RP^2$ consists of a single $0$-, $1$-, and $2$-cell, we can also construct a map $\RP^2 \to X$ inducing an isomorphism on $\pi_1$. So we now have a sequence
    $$
    \RP^2 \to X \to \RP^\infty
    $$
    inducing isomorphisms on $\pi_1$, and hence isomorphisms on $H_1(-;\bZ)$. Since
    $$
    H_2(\RP^2;\bZ) \iso 0 \iso H_2(\RP^\infty;\bZ),
    $$
    it follows by the universal coefficient theorem that the composition $\RP^2 \to \RP^\infty$ is an isomorphism on $H^2(-;\bZ)$. But this is impossible, since the induced map factors through
    $$
    H^2(X;\bZ) \iso [X,K(\bZ,2)] \iso \pi_1(K(\bZ,2))[2] \iso 1,
    $$
    while $H^2(\RP^2)$ and $H^2(\RP^\infty)$ are nontrivial (both isomorphic to $\bZ/2$).


[exist]: http://mathoverflow.net/questions/10364/categorical-homotopy-colimits
