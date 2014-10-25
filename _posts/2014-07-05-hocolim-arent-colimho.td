---
layout: text
math: true
section: math
date: 2014-07-05 13:30:00 -0500
title: "Homotopy (co)limits aren't (co)limits in the homotopy
        category"
permalink: /hocolim-arent-colimho
desc: A couple of (hopefully clarifying) examples illustrating the
      statement in the title.
preamble:
- [c, 0, '\colon']
- [ce, 0, '\mathrel{:=}']
- [from, 0, '\leftarrow']
- [u, 1, '\underline{#1}']
- [id, 0, '\opname{id}']
- [hom, 0, '\opname{hom}']
- [Grp, 0, '\mathrm{Grp}']
- [H, 0, '\mathcal{H}']
- [Z, 0, '\mathbb{Z}']
- [RP, 0, '\mathbb{RP}']
---

-- It's really nice to be able to think about things via universal
   properties, and I in particular know and love how to do this for
   limits and colimits in ordinary categories. But in homotopy theory
   things these notions need to be fixed slightly, since they're not
   homotopy invariant. The canonical example in the familiar realm of
   spaces is that $D^n \from S^{n-1} \to D^n$ has pushout $S^n$ but $*
   \from S^{n-1} \to *$ has pushout $*$.

   This is what leads one to define homotopy limits and homotopy
   colimits, which *are* homotopy invariant. But, not understanding
   these things all too well, and seeking to retreat into familiar
   territory, I'm tempted to just think of them as limits as colimits
   in the homotopy category. But this is so, so wrong! The example
   above already shows that, but I wanted to write down a perhaps even
   more severe example I learned from [the internet][exist] which
   helped hammer this point home.

-- Notation: Let $\H$ denote the homotopy category of pointed spaces
   (for definiteness maybe take this to be pointed CW complexes and
   maps up to homotopy). For $X,Y \in \H$ denote $\hom_\H(X,Y)$ by
   $[X,Y]$.

-- Example (a colimit which doesn't exist): Consider the diagram

  $$
  \begin{xy}
  \xymatrix{
    S^1 \ar[r]_i \ar[d]^f & D^2 \\ S^1. &
  }
  \end{xy}
  $$
  
  where $i$ is the canonical inclusion and $f$ is a degree $2$ map. We
  know this diagram has a homotopy pushout: we can replace $f$ by a
  cofibration and then just take an ordinary pushout. But we can show
  that this diagram has no colimit in $\H$. Suppose there were a
  pushout $X \in \H$: then for $Y \in \H$ we have

  $$
  [X,Y] \iso [S^1,Y] \times_{[S^1, Y]} [D^2,Y] \iso \pi_1(Y)
  \times_{\pi_1(Y)} *
  $$

  where the map $\pi_1(Y) \to \pi_1(Y)$ is multiplication by $2$ by
  definition of $f$. Thus $[X,Y] \iso \pi_1(Y)[2]$, the $2$-torsion of
  $\pi_1(Y)$. We will prove that this functor $Y \mapsto \pi_1(Y)[2]$
  cannot be corepresentable.

  First, we have $[X,S^0] \iso \pi_1(S^0)[2] \iso 0$ implying $X$ is
  connected. Thus for $G$ a (discrete) group, considering the
  classification of principal $G$-bundles (i.e. $G$-coverings) gives
  isomorphisms

  $$
  \hom_\Grp(\pi_1(X),G) \iso H^1(X;G) \iso [X;BG] \iso \pi_1(BG)[2]
  \iso G[2],
  $$

  natural in $G$. By Yoneda this implies $\pi_1(X) \iso \Z/2$. It
  follows that we can construct maps $\RP^2 \to X \to \RP^\infty \iso
  K(\Z/2,1)$ which are isomorphisms on $\pi_1$, and hence isomorphisms
  on $H_1(-;\Z)$. Since $H_2(\RP^2;\Z) \iso 0 \iso H_2(\RP^\infty;\Z)$
  it follows by the universal coefficient theorem that the composition
  $\RP^2 \to \RP^\infty$ is an isomorphism on $H^2(-;\Z)$. But this is
  impossible, for

  $$
  H^2(X;\Z) \iso [X,K(\Z,2)] \iso \pi_1(K(\Z,2))[2] \iso 0.
  $$


[exist]: http://mathoverflow.net/questions/10364/categorical-homotopy-colimits

