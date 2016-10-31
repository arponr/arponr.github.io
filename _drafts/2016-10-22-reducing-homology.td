---
layout: post
math: true
title: Reducing (co)homology
date: 2016-10-22 12:30:00 -0800
tags:
- math
- topology
- homology
- cohomology
- eilenberg-steenrod axioms
preamble:
- [Ab, 0, '\operatorname{Ab}']
- [AbGroups, 0, '\mathrm{AbGroups}']
- [fin, 0, '\mathrm{fin}']
- [Ho, 0, '\operatorname{Ho}']
- [pt, 0, '\star']
- [Push, 0, '\operatorname{Push}']
- [Sing, 0, '\operatorname{Sing}']
- [Spaces, 0, '\mathrm{Spaces}']
---

This is a continuation of a [previous post][homology-def], in which I introduced the definition of homology and cohomology theories after giving some motivation for considering these things.

--- Observation [pt-split]

    Let $(E^n,\del^n)_{n \in \bZ}$ be a cohomology theory on $\Spaces$. Suppose given a pointed space $i \c \pt \to X$. Let $p \c X \to \pt$ be the canonical map. Then $pi \iso \id_\pt \implies E^*(i)E^*(p) = \id_{E_*(\pt)}$, so for each $n \in \bZ$ we get a canonical splitting
    $$
    E^*(X) \iso \til{E}^*(X) \oplus E^*(\pt),
    $$
    where $\til{E}^*(X) \ce \ker(E^*(i))$. For example, given any space $Y$, if we take $X = Y_+ \ce Y \amalg \pt$ and $i \c \pt \to Y_+$ to be the inclusion of the disjoint basepoint, then by additivity we have natural isomorphisms
    $$
    E^*(Y_+) \iso E^*(Y) \oplus E^*(\pt), \quad
    \til{E}^*(Y_+) \iso E^*(Y).
    $$
    Thus all the information of the functors $E^*$ is contained in the functors $\til{E}^*$.
    
    In light of this observation, the goal of this post is to reformulate the definition of cohomology theories in terms of these "reduced" functors $\til{E}^*$. We will see in future posts that this reformulation is quite illuminating!

--- [reduced]
    
    Let $\sC_\pt$ be a pointed $\infty$-category admitting finite colimits, the zero object denoted $\pt$.[^pt-decoration] Let $\Sigma \c \sC_\pt \to \sC_\pt$ denote the suspension functor.
    
    [^pt-decoration]: Note that, for now, the subscript $\pt$ in $\sC_\pt$ is purely decorative, reminding us that we're in the pointed setting. However, we will soon consider the case where $\sC_\pt$ is the $\infty$-category of pointed objects in some non-pointed $\infty$-category $\sC$, e.g. $\sC = \Spaces$ and $\sC_\star = \Spaces_\pt$ is the $\infty$-category of pointed spaces.

    --- Definition [reduced-cohomology]
        
        A *reduced cohomology theory* on $\sC_\pt$ is a sequence of functors[^til-decoration] and natural isomorphisms
        $$
        \begin{align*}
        &\til{E}^n \c \sC_*^\op \to \AbGroups, & \\
        &\delta^n \c \til{E}^n \isoto \til{E}^{n+1} \circ \Sigma\c \sC_\pt^\op \to \AbGroups &
        \end{align*}
        $$
        for $n \in\bZ$ satisfying the following conditions:
        
        [^til-decoration]: In the same spirit as the previous footnote: the tildes on the functors $\til{E}^*$ are just a decorative reminder for now, but later will become meaningful.
        
        ~~~ [reduced-cohomology-additivity]
            *Additivity*: For any set of objects $\{X_i\}$ in $\sC_\pt$ that admits a coproduct, the canonical map $\til{E}^n(\bigvee_i X_i) \to \prod_i \til{E}^n(X_i)$ is an isomorphism. Here $\bigvee$ denotes the coproduct in $\sC_\pt$.[^wedge-sum]
        ~~~ [reduced-cohomology-exactness]
            *Exactness*: For any cofiber sequence $X \to Y \to Z$ in $\sC_\pt$, the induced sequence $\til{E}^n(Z) \to \til{E}^n(Y) \to \til{E}^n(Z)$ is exact for each $n \in \bZ$.
            
        [^wedge-sum]: In the same spirit as the previous two footnotes: we use $\bigvee$ instead of $\coprod$ for the coproduct in $\sC_\pt$ to evoke "wedge sum", which is what the coproduct is in the case $\sC_\pt = \Spaces_\pt$ (as well as to distinguish it from the coproduct in non-pointed categories later on).
    
    --- Remark [reduced-cohomology-homotopy-factor]
    
        [As in][homology-def-homotopy-factor] the definition of cohomology theory, note that the functors $\til{E}^n$ automatically factor through the homotopy category $\Ho(\sC_\pt)^\op$.
    
    --- Warning [reduced-cohomology-additivity-warning]
    
        Out additivity axiom @reduced-cohomology-additivity is nonstandard in the same way [as in][homology-def-additivity-warning] our definition of cohomology theory, e.g. if $\sC_\pt$ is cocomplete than we require infinite additivity.

    --- Remark [reduced-cohomology-point]
        
        The additivity axiom @reduced-cohomology-additivity includes the degenerate case of the empty set of objects, in which case it tells us that $\til{E}^n(\pt) \iso 0$ for all $n \in \bZ$.
        
        This implies that $\til{E}^n(h) = 0$ for any nullhomotopic map $h$ in $\sC_\pt$. In particular, if
        $$
        X \lblto{f} Y \lblto{g} Z
        $$
        is a cofiber sequence in $\sC_\pt$, the induced composite $\til{E}^n(f)\til{E}^n(g) = \til{E}^n(gf)$ must be the zero map. Thus, the exactness condition @reduced-cohomology-exactness is equivalent to requiring only that any element in the kernel of $\til{E}^n(f)$ lies in the image of the map $\til{E}^n(g)$.

    --- Remark [reduced-cohomology-full-exactness]
        
        In comparison to the [Mayer-Vietoris sequence][homology-def-mayer-vietoris] appearing in the definition of cohomology theory, perhaps the exactness axiom @reduced-cohomology-exactness here seems too weak: we only demanded a three-term exact sequence at each $n \in \bZ$, rather than a long exact sequence relating all $n$. However, this weakness is an illusion; we in fact automatically get a long exact sequence, as follows.
        
        Suppose given a cofiber sequence
        $$
        X \lblto{f} Y \lblto{g} Z
        $$
        in $\sC_*$. Recall that there is a canonical map $h \c Z \to \Sigma X$, coming from the pasting of pushout squares
        $$
        \begin{xy}
        \xymatrix{
            X \ar[r]^f \ar[d] &
            Y \ar[r] \ar[d]^g &
            \pt \ar[d] \\
            \pt \ar[r] &
            Z \ar[r]^h \ar[d] &
            \Sigma X \ar[d]^{\Sigma f} \\
            &
            \pt \ar[r] &
            \Sigma Y.
        }
        \end{xy}
        $$
    Composing $\til{E}^{n+1}(h) \c \til{E}^{n+1}(\Sigma X) \to \til{E}^{n+1}(Z)$ with $\delta^n \c \til{E}^n(X) \isoto \til{E}^{n+1}(\Sigma X)$, we obtain a map $\del^n \c \til{E}^n(X) \to \til{E}^{n+1}(Z)$. This gives us a sequence
    $$
      \cdots \to
      \til{E}^{n-1}(X) \lblto{\del^{n-1}}
      \til{E}^n(Z) \lblto{\til{E}^n(g)}
      \til{E}^n(Y) \lblto{\til{E}^n(f)}
      \til{E}^n(X) \lblto{\del^n}
      \til{E}^{n+1}(Z) \to
      \cdots,
    $$
    and in fact it's exact:
    
    - Exactness at $\til{E}^n(Y)$ follows from our exactness condition
      applied to the original cofiber sequence $X \lblto{f} Y \lblto{g} Z$.
    - Exactness at $\til{E}^n(Z)$ follows from our exactness condition applied to the cofiber sequence $Y \lblto{g} Z \lblto{h} \Sigma X$.
    - Exactness at $\til{E}^n(X)$ follows from our exactness condition applied to the cofiber sequence $Z \lblto{h} \Sigma X \lblto{\Sigma f} \Sigma Y$.
    
--- [reducing]

    Let $\sC$ be an $\infty$-category admitting finite colimits and a final object $\pt$. Let $\sC_\pt \ce \sC_{\pt /}$ denote the $\infty$-category of pointed objects in $\sC$.
    
    --- Remark [reducing-ptd-colimits]
    
        By general theory, $\sC_\pt$ also admits finite colimits.[^ptd-colimits-cite]
    
        [^ptd-colimits-cite]: See e.g. the proof of 5.5.3.11 in [*Higher Topos Theory*][HTT].
    
    --- [reducing-suspend-comparison]
    
        Recall from classical algebraic topology that if one has a pointed, then its unreduced and reduced suspensions are homotopy equivalent (basically since passing from the former to the latter amounts to collapsing a contracible thing (an interval)). This actually holds in our general context for purely categorical reasons.
        
        --- Lemma
            
            Let $x \c \pt \to X$ and $y \c \pt \to Y$ be pointed objects of $\sC$. 
        
            
    
    --- Construction [reducing-constr]
    
        We now show how our first observation @pt-split allows us to associate to any cohomology theory $(E^n,\del^n)_{n \in \bZ}$ on $\sC$ a reduced cohomology theory $(\til{E}^n,\delta^n)_{n \in \bZ}$ on $\sC_\pt$.
        
        As in @pt-split, for a pointed space $i \c \pt \to X$, we define
        $$
        \til{E}^n(X) \ce \ker(E^n(i) \c E^n(X) \to E^n(\pt));
        $$
        this is clearly functorial. Next, consid
    
        


[homology-def]: /2016/10/15/motivating-homology/
[homology-def-homotopy-factor]: /2016/10/15/motivating-homology/#theory-homotopy-factor
[homology-def-additivity-warning]: /2016/10/15/motivating-homology/#theory-additivity-warning
[homology-def-mayer-vietoris]: /2016/10/15/motivating-homology/#theory-homology-locality

[HTT]: //www.math.harvard.edu/~lurie/papers/croppedtopoi.pdf
