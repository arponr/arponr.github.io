---
layout: post
math: true
title: Thom spaces and spectra
tags:
- math
- homotopy theory
- Thom spectrum
preamble:
- [Aut, 0, '\mathrm{Aut}']
- [Fun, 0, '\mathrm{Fun}']
- [GL, 0, '\mathrm{GL}']
- [Line, 0, '\mathrm{Line}']
- [Mod, 0, '\mathrm{Mod}']
- [Sets, 0, '\mathrm{Sets}']
- [Spaces, 0, '\mathrm{Spaces}']
- [Spectra, 0, '\mathrm{Spectra}']
---

In this post we define Thom spaces and spectra, giving both the $\infty$-categorical perspective of [ABGHR](//arxiv.org/pdf/1403.4325v1.pdf) and the classical perspective, and demonstrating how the former recovers the latter. We begin with a brief review of (an instance of) the Grothendieck construction.

## The Grothendieck construction

Let $X$ be a space. Recall the intuition that a space $Y$ over $X$, i.e. a map[^fibration] $f \c Y \to X$, can be thought of as a family of spaces parameterized by the points of $X$, namely the (homotopy) fibers of $f$. This intuition is made precise by the following.

[^fibration]: You might want to say fibration or something, but of course homotopically speaking this is unnecessary.

--- Notation

    - Let $\Spaces$ denote the $\infty$-category of spaces.
    - Let $\Fun(X,\Spaces)$ denote the $\infty$-category of functors from the space $X$ (interpreted as an $\infty$-groupoid) to $\Spaces$.
    - Let $\Spaces_{/X}$ denote the overcategory of maps $Y \to X$.

--- Lemma (Grothendieck construction) [grothendieck-constr]

    The colimit functor $\Fun(X, \Spaces) \to \Spaces_{/X}$ is an equivalence of $\infty$-categories.

    --- Remark
    
        A priori, taking colimits defines a functor $\Fun(X, \Spaces) \to \Spaces$. However, note that we have a final object $* \in \Spaces$, and hence a final object in $\Fun(X, \Spaces)$ given by the constant functor at $*$. Thus the colimit of any $X$-diagram in spaces admits a canonical map to the colimit of the constant functor at $*$. The colimit of this constant functor recovers $X$ itself, so we in fact get a functor to $\Spaces_{/X}$.

    --- Remark
    
        Note that if we restrict from the $\infty$-category $\Spaces$ to the $1$-category $\Sets$ of sets we recover the equivalence of functors $X \to \Sets$, or equivalently functors $\pi_{\le 1} X \to \Sets$, with covering spaces over $X$.

    --- Variant (Pointed Grothendieck construction) [pointed-grothendieck-constr]
        
        We can also consider the $\infty$-category $\Spaces_*$ of pointed spaces. Analogous to the considerations in @grothendieck-constr-codomain demonstrating that the colimit of a functor $X \to \Spaces$ canonically admits a map to $X$, we see that a functor $X \to \Spaces_*$ canonically admits a *section* of that map. I.e. we have an equivalence
        $$
        \Fun(X, \Spaces_*) \iso \Spaces_{X//X}
        $$
        of families of pointed spaces paramterized by $X$ with spaces over $X$ equipped with a section.
        
    --- Remark [pointed-grothendieck-constr-not-colim]
        
        Note that in the pointed Grothendieck construction we still take the colimit as a functor to $\Spaces$, not as a functor to $\Spaces_*$. Indeed, taking the colimit inside $\Spaces_*$ instead of $\Spaces$ amounts to collapsing the image of the section of $X$ to a point, i.e. taking the cofiber of the section.


## Thom spectra of stable line bundles

We now recall the setup and definition of Thom spectra as defined in [ABGHR](//arxiv.org/pdf/1403.4325v1.pdf).

--- Notation [abghr-notation]

    Let $R$ be an $\rE_1$-ring spectrum. We denote the $\infty$-category of (left or right, just pick one to use throughout) $R$-module spectra by $\Mod(R)$. We denote the maximal subgroupoid of $\Mod(R)$ containing $R$ by $\Line(R)$.


--- Definition [GL1]

    Define the space $\GL_1(R)$ by the pullback
    $$
    \GL_1(R) \ce \Omega^{\infty}R \times_{\pi_0 R} (\pi_0 R)^\times.
    $$
    Since $R$ is an $\rE_1$-ring, $\GL_1(R)$ is an $\rE_1$-space, i.e. an $\infty$-group, hence has a delooping $\rB\GL_1(R)$. We call $\GL_1(R)$ the *group of units* of $R$.

--- Lemma [GL1-equiv-line]

    There's an equivalence of $\infty$-groups
    $$
    \Aut_{\Mod(R)}(R) \iso \GL_1(R),
    $$
    and hence an equivalence of $\infty$-groupoids/spaces
    $$
    \Line(R) \iso \rB\GL_1(R).
    $$

--- Definition [thom-spectrum]

    Define the *Thom spectrum* functor
    $$
    \rM \c \Spaces_{/\rB\GL_1(R)} \to \Mod(R)
    $$
    by sending a map $f \c X \to \rB\GL_1(R)$ to the colimit of the composite
    $$
    X \lblto{f} \rB\GL_1(R) \iso \Line(R) \inj \Mod(R).
    $$


## Thom spectra of pointed sphere bundles

In this section we give the more classical definition of Thom spaces and spectra. Usually one first sees the definition in the context of vector bundles: given a vector bundle, we obtain its Thom space by one-point compactifying its fibers into spheres, and then identifying all of the points at infinity. Of course, it's not necessary to begin with a vector bundle, so we'll formulate this construction for bundles of spheres equipped with distinguished basepoints (or "points at infinity").

--- Definition [ptd-sphere-bundle]
    
    A *pointed sphere bundle* of dimension $n \in \bZ_{\ge 0}$ over a space $X$ is a pair $(f, s)$ where

    - $f$ is a map of spaces $E \to X$ such that for every $x \in X$ the (homotopy) fiber $E_x$ is equivalent to the sphere $\rS^n$;
    - $s$ is a section $X \to E$ of $f$.

--- Definition [thom-spectrum-ptd-sphere]
    
    Let $(f \c E \to X, s \c X \to E)$ be a pointed sphere bundle of dimension $n \in \bZ_{\ge 0}$. We define the *Thom space* $\bar\rM f$ of $(f,s)$ to be the (homotopy) cofiber of $s$, i.e.
    $$
    \bar\rM f \ce \cofib \l( X \lblto{s} E \r).
    $$
    We define the *Thom spectrum* $\rM f$ of $(f,s)$ as the $n$-fold desuspension of the suspension spectrum of the Thom space $\bar\rM f$, i.e.
    $$
    \rM f \ce \Sigma^{\infty - n} \bar\rM f.
    $$

We now show how this classical formulation is subsumed by the abstract definition given in the previous section

--- Notation [sphere-spectrum]
    
    Let $\bS \ce \Sigma^\infty\rS^0$ denote the sphere spectrum. Recall that $\Mod(\bS)$ is just the $\infty$-category $\Spectra$ of spectra.

--- Definition [stable-spherical-fibration]
    
    A *stable sphere bundle* over a space $X$ is a functor $X \to \rB\GL_1(\bS)$.

--- Lemma [GL1-sphere]
    
    There's an equivalence of $\infty$-groups
    $$
    \colim_{n \in \bZ_{\ge 0}} \Aut_{\Spaces_*}(\rS^n) \isoto
    \GL_1(\bS)
    $$
    induced by the maps $\Aut_{\Spaces_*}(\rS^n) \to \GL_1(\bS)$ sending a map $f \c \rS^n \to \rS^n$ to the map $\Sigma^{\infty - n}f \c \bS \to \bS$ in $\Aut_{\Spectra}(\bS)$, which is equivalent to $\GL_1(\bS)$ by  @GL1-equiv-line.

    This induces an equivalence of $\infty$-groupoids
    $$
    \colim_{n \in \bZ_{\ge 0}} \rB\Aut_{\Spaces_*}(\rS^n) \iso
    \rB\GL_1(\bS).
    $$

--- Construction [ptd-sphere-to-stable-sphere]
    
    Here we associate to any pointed sphere bundle over $X$ a stable sphere bundle over $X$.

    Let $(f \c E \to X, s \c X \to E)$ be a pointed sphere bundle of dimension $n \in \bZ_{\ge 0}$. By the pointed Grothendieck construction @pointed-grothendieck-constr, this data is equivalent to a functor $X \to \Spaces_*$ factoring through the maximal subgroupoid of $\Spaces_*$ containing $\rS^n$ (equipped with some chosen basepoint), i.e. a functor/map $F \c X \to \rB\Aut_{\Spaces_*}(\rS^n)$. As stated in @GL1-sphere there's a canonical map $\rB\Aut_{\Spaces_*}(\rS^n) \to \rB\GL_1(\bS)$; composing $F$ with this map gives us the desired stable sphere bundle $X \to \rB\GL_1(\bS)$.

--- Lemma [thom-ptd-sphere-agrees]

    Let $(f \c E \to X, s \c X \to E)$ be a pointed sphere bundle of dimension $n \in \bZ_{\ge 0}$. Let $g \c X \to \rB\GL_1(\bS)$ be the associated stable sphere bundle constructed in @ptd-sphere-to-stable-sphere. Then our two definitions of Thom spectrum agree: $\rM f \iso \rM g$.

    --- Proof
    
        Consider the diagram of functors
        $$
        \begin{xy}
        \xymatrix {
        \Fun(X, \rB\Aut_{\Spaces_*}(\rS^n)) \ar[d] \ar[r] &
        \Fun(X, \Spaces_*) \ar[d]_{\Sigma^{\infty - n}} \ar[r]^-{\colim} &
        \Spaces_* \ar[d]_{\Sigma^{\infty - n}} \\
        \Fun(X, \rB\GL_1(\bS)) \ar[r] &
        \Fun(X, \Spectra) \ar[r]^-{\colim} &
        \Spectra. \\
        }
        \end{xy}
        $$
        The left-hand square commutes by the definition (see @GL1-sphere) of the map $\rB\Aut_{\Spaces_*}(\rS^n) \to \rB\GL_1(\bS)$ inducing the left-hand vertical arrow. The right-hand square commutes because $\Sigma^\infty$ is a left-adjoint and hence commutes with colimits. Hence the whole diagram commutes. Now, via the pointed Grothendieck construction (in particular, using @pointed-grothendieck-constr-not-colim), the composite of the top row can be identified with the Thom space construction for pointed sphere bundles $(f,s) \mapsto \bar\rM f$, whence going around the diagram clockwise gives the Thom spectrum $\rM f$. On the other hand going around the diagram counter-clockwise gives the Thom spectrum $\rM g$, finishing the proof.


## Thom spectra of sphere bundles

Sometimes one sees an alternate definition of the Thom space of a vector bundle, in which the bundle is equipped with a metric, and rather than considering the compactifications of the fibers, we consider the unit spheres in the fibers. Note that this recipe gives us a bundle of spheres *without* any distinguished basepoints. In this definition of the Thom space, instead of collapsing the points at infinity, we quotient the unit disk bundle (which we may think of just as a homotopy-equivalent thickening of the base space) by this unit sphere bundle. In this section we formulate this definition of the Thom space, and show that it is indeed equivalent to the previous definitions.

--- Definition [sphere-bundle]
    
    A *sphere bundle* of dimension $n \in \bZ_{\ge 0}$ over a space $X$ is a map of spaces $E \to X$ such that for every $x \in X$ the (homotopy) fiber $E_x$ is equivalent to the sphere $\rS^n$.

--- Definition [thom-spectrum-sphere]
    
    Let $f \c E \to X$ be a sphere bundle of dimension $n \in \bZ_{\ge 1}$. We define the *Thom space* $\bar\rM f$ of $f$ to be the (homotopy) cofiber of $f$, i.e.
    $$
    \bar\rM f \ce \cofib \l( E \lblto{f} X \r).
    $$
    We define the *Thom spectrum* $\rM f$ of $f$ as the $(n+1)$-fold desuspension of the suspension spectrum of the Thom space $\bar\rM f$, i.e.
    $$
    \rM f \ce \Sigma^{\infty - n-1} \bar\rM f.
    $$

--- Construction [sphere-to-ptd-sphere]
    
    Here we associate to any sphere bundle $f \c E \to X$ of dimension $n \in \bZ_{\ge 0}$ a pointed sphere bundle of dimension $n+1$ over $X$.

    By the Grothendieck construction @grothendieck-constr we identify $f$ with a functor $X \to \Spaces$ factoring through the maximal subgroupoid $\rB\Aut_{\Spaces}(\rS^n)$ of $\Spaces$ containing $\rS^n$. Composing with the suspension functor $\Sigma \c \Spaces \to \Spaces_*$ (where we take the basepoint to be the top of the suspension, say) gives us a functor $X \to \Spaces_*$ factoring through the maximal subgroupoid $\rB\Aut_{\Spaces_*}(\rS^{n+1})$ containing $\rS^{n+1}$, and by the pointed Grothendieck construction @pointed-grothendieck-constr this is the pointed sphere bundle of dimension $n+1$ we wanted.

--- Lemma [thom-sphere-agrees]
    
    Let $f \c E \to X$ be a sphere bundle of dimension $n \in \bZ_{\ge 0}$. Let $(g \c E' \to X, s \c X \to E')$ be the associated pointed sphere bundle of dimension $n+1$ constructed in @sphere-to-ptd-sphere. Then our two definitions of Thom space agree: $\bar\rM f \iso \bar\rM g$. It follows immediately that the Thom spectra agree as well: $\rM f \iso \rM g$.

    --- Proof
        
        Consider the diagram of functors
        $$
        \begin{xy}
        \xymatrix {
        \Fun(X, \rB\Aut_{\Spaces}(\rS^n)) \ar[d] \ar[r] &
        \Fun(X, \Spaces) \ar[d]_{\Sigma \iso \cofib(- \to *)} \ar[r]^-{\colim} &
        \Spaces_{/X} \ar[d]_{\cofib} \\
        \Fun(X, \rB\Aut_{\Spaces_*}(\rS^{n+1})) \ar[r] &
        \Fun(X, \Spaces_*) \ar[r]^-{\colim} &
        \Spaces_*. \\
        }
        \end{xy}
        $$
        The left-hand square commutes by the definition (see @sphere-to-ptd-sphere) of the map $\rB\Aut_{\Spaces}(\rS^n) \to \rB\Aut_{\Spaces_*}(\rS^{n+1})$ inducing the left-hand vertical arrow. The right-hand square commutes because colimits commute with cofibers. Hence the whole diagram commutes. Now, the top-right horizontal map is the Grothendieck construction @grothendieck-constr, whence going around the diagram clockwise gives the Thom space $\bar\rM f$. On the other hand, as in the proof of @thom-ptd-sphere-agrees, going around the diagram counter-clockwise gives the Thom space $\bar\rM g$, finishing the proof.
