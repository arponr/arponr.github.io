---
layout: post
math: true
title: Suspension and rigor
date: 2016-10-31 16:30:00 -0800
tags:
- math
- category theory
- homotopy theory
- type theory
- suspension
- dependent sum
- straightening
preamble:
- [Equiv, 0, '\operatorname{Equiv}']
- [Loc, 0, '\operatorname{Loc}']
- [pt, 0, '\star']
- [Spaces, 0, '\mathrm{Spaces}']
---

Last weekend, I was in the middle of writing a post on how to translate between unreduced (co)homology theories (defined [earlier][homology-def]) and reduced (co)homology theories, when I realized I needed the fact that unreduced and reduced suspension were homotopy equivalent. This is geometrically clear in the setting of CW-complexes, say, but I wanted to formulate things within a general homotopy theory, so I started trying to prove this using the universal properties of the homotopy pushouts defining the two suspensions. Namely, I wanted to prove the following.

--- Proposition [main]

    Let $\sC$ be an $\infty$-category admitting finite colimits and a final object $\pt$. Let $\sC_\pt \ce \sC_{\pt/}$ be the $\infty$-category of pointed objects in $\sC$, which will also admit finite colimits.[^ptd-colimits-cite] Let $\Sigma \c \sC \to \sC$ and $\Sigma_\pt \c \sC_\pt \to \sC_\pt$ denote the suspension functors in these $\infty$-categories.
    
    Let $(X,x \c \pt \to X)$ be a pointed object in $\sC$. Consider the pushout square
    $$
    \begin{xy}
    \xymatrix{
    X \ar[r]^p \ar[d]_p &
    \pt \ar[d]^s \\
    \pt \ar[r]^t &
    \Sigma X
    }
    \end{xy}
    $$
    defining $\Sigma X$. Then viewing $\Sigma X$ as a pointed object via $s \c \pt \to \Sigma X$, this will also canonically give a pushout square in $\sC_\pt$.
    
    Thus $(\Sigma X, s) \iso \Sigma_\pt(X,x)$ in $\sC_\pt$, or more informally, $\Sigma X \iso \Sigma_\pt X$.
    
    [^ptd-colimits-cite]: See e.g. the proof of 5.5.3.11 in [*Higher Topos Theory*][HTT].

I ended up getting kind of stuck on this that night, which is why that post isn't up yet. The thing is: there's a bunch of data involved when you're dealing with homotopy coherent diagrams, and you have to handle it carefully. Small diagrams like the pushouts appearing above are pretty manageable, but note the reduced suspension is a pushout in the $\infty$-category of *pointed* objects, and the pointings give you some extra data to worry about. Anyway, sometime during the week, I spent an hour staring at the blackboard in my office, trying to be careful with all my data, and finally came up with an informal/intuitive argument I was happy with.

As far as $\infty$-categorical arguments go, I usually leave it at that---that is, at informality and intuition. But I wanted to write this argument up in the post, so I decided to try to make it rigorous, or rather as rigorous as I could while still reasoning model-independently. Today I finally arrived at something I'm pleased with, because it's actually a direct formalization of my original intuition, inspired by thinking about what I might do if I understood and was working in homotopy type theory. So, before finishing that post on reduced (co)homology theories, I figure I should document what I came up with.

## The informal argument

Let me begin by stating the informal argument I came up with first.

--- Sketch proof of @main [informal-proof]
    
    Let $(Y, y \c \pt \to Y)$ be a pointed object of $\sC$. The universal property of the pushout in $\sC_\pt$ tells us that $\Map_{\sC_\pt}(\Sigma_\pt(X,x),(Y,y))$ is the space of data
    $$
    D_1 \ce \{y',y'' \c \pt \to_\pt (Y,y), \quad
      \phi \c y'p \iso_\pt y''p\},
    $$
    where here $\to_\pt$ and $\iso_\pt$ denote maps and homotopies of maps in $\sC_\pt$. Thinking about what pointed maps and homotopies are in terms of the original $\infty$-category $\sC$, we may rewrite this as the space of data
    $$
    D_2 \ce \{y',y'' \c \pt \to Y, \quad
      \alpha' \c y \iso y',\ \alpha'' \c y \iso y'', \quad
      \phi \c y'p \iso y''p,\ \psi \c \phi_x\alpha' \iso \alpha''\},
    $$
    where now $\to$ and $\iso$ just denote maps and homotopies in $\sC$, and $\phi_x \ce \phi \circ x \c y' \iso y'px \iso y''px \iso y''$; note that we just invoked the canonical/unique homotopy $px \iso \id_\pt$, which we're using essentially to say that the pushout square in @main defining $\Sigma X$ is canonically a commutative diagram in $\sC_\pt$. Next, $D_2$ admits an evident project to the space of data
    $$
    D_3 \ce
    \{y',y'' \c \pt \to Y, \quad
      \alpha' \c y \iso y', \quad
      \phi \c y'p \iso y''p\},
    $$
    and the fiber of this projection over a point $(y',y'',\alpha',\phi) \in D_3$ is the space of data
    $$
    F \ce
    \{\alpha'' \c y \iso y'', \quad
      \psi \c \phi_x\alpha' \iso \alpha''\}.
    $$
    Now, $F$ has an initial object $(\phi_x\alpha', \id_{\phi_x\alpha'})$ (because $F$ is a certain path space), so is contractible. Thus we have $D_3 \iso D_2 \iso D_1$. But observe, now by the universal property of the pushout in $\sC$, that $D_3$ is precisely the space $\Map_{\sC_\pt}((\Sigma X,s), (Y,y))$. We thus conclude by Yoneda that $\Sigma_\pt(X,x) \iso (\Sigma X,s)$ in $\sC_\pt$, as desired.


## Fiber products and dependent sums

Hopefully it is clear why the argument in @informal-proof isn't rigorous: expressing universal properties in terms of these "spaces of data", specified just by their points, is sketchy intuition---or so I thought! It turns out there is actually a rigorous way to write the above argument. Before we get there, let me explain my first strategy for translating the above argument into something rigorous.

A precise way to encode the universal property of the pushout is via pullback / fiber product of spaces:
$$
\Map(A \amalg_C B, D) \iso \Map(A,D) \times_{\Map(C,D)} \Map(B,D).
$$
We can similarly encode pointed maps and homotopies:
$$
\Map_\pt((A,a),(B,b)) \iso \Map(A,B) \times_{\Map(\pt,B)} \{b\}
$$
(where the projection $\Map(A,B) \to \Map(\pt,B)$ is evaluation at $a$). But now, if we want to use these characterizations in place of the spaces of data from our sketch @informal-proof, we're going to have to start considering quite nasty fiber products (where all the terms involved are themselves fiber products). I tried doing this, but failed.

The connection between the rigorous fiber product perspective here and the informal "spaces of data" perspective above is an intuitive understanding about what fiber products look like in the $\infty$-category $\Spaces$. Namely, a point of a fiber product of spaces $U \times_W V$ should consist of a point of $U$, a point of $V$, and a path between their images in $W$. In our sketch @informal-proof we basically just wrote down these fiber products as sets of points, which is why it was unsatisfactory.

The key to moving forward will be to make this intuitive understanding completely formal. Namely, we have the following.

--- Fact [fiber-product-fiber]

    Let $f \c U \to W$ and $g \c V \to W$ be maps of spaces, and form their fiber product $U \times_W V$. Then the fiber of the canonical map
    $$
    U \times_W V \to U \times V
    $$
    over a point $(u,v) \in U \times V$ is the space $\Equiv_W(f(u),g(v))$ of paths $f(u) \iso g(v)$ in $W$.[^discrete-fiber]
    
    [^discrete-fiber]: If we were working in the discrete category of sets, then these fibers would be the "sets of equalities" $f(u) = g(v)$, which of course have either 0 or 1 point, so that $U \times_W V \to U \times V$ is a monomorphism. But in homotopy theory the equivalences $f(u) \iso g(v)$ are really extra data.

The other idea we need to work with this formalization is the "straightening" construction.

--- Fact [straightening]

    Fix a base space $U$. We describe a canonical equivalence of $\infty$-categories
    $$
    \Spaces_{/U} \iso \Loc_U(\Spaces);
    $$
    here the left-hand side is the $\infty$-category of spaces over $U$, i.e. maps $V \to U$, and the right-hand side is the $\infty$-category of local systems of spaces on $U$, i.e. functors $U \to \Spaces$ (discussed previously [here][local-systems]).
    
    The functor $\Spaces_{/U} \to \Loc_U(\Spaces)$ in this equivalence is called *straightening*, and takes a map $V \to U$ to the local system $u \goesto V_u = V \times_U \{u\}$. 
    
    The functor $\Loc_U(\Spaces) \to \Spaces_{/U}$ in this equivalence is called *unstraightening*, and takes a local system $L \c U \to \Spaces$ to its colimit $\colim_{u \in U} L(u)$. To see that this colimit admits a canonical map to $U$, observe the constant local system $\pt_U$ on $U$ with value $\pt$ is a final object of $\Loc_U(\Spaces)$ and has colimit $U$ itself; thus the unique map $L \to \pt_U$ functorially determines a map $\colim_U L \to \colim_U \pt \iso U$.
    
    I.e., this equivalence articulates that we can think of a space over $U$ equivalently as a family of spaces (namely the fibers) parametrized by $U$.
    
    --- Remark [straightening-functoriality]
    
        Suppose given a map of spaces $f \c U' \to U$. Recall that this gives us a pullback functor given by precomposition,
        $$
        f^* \c \Loc_U(\Spaces) \to \Loc_{U'}(\Spaces), \\
        f^*(L)(u') \iso L(f(u')),
        $$
        as well as a left adjoint given by forming fiberwise colimits (i.e. left Kan extension),
        $$
        f_! \c \Loc_{U'}(\Spaces) \to \Loc_U(\Spaces), \\
        f_!(L')(u) \iso \colim_{u' \in U'_u} L'(u').
        $$
        These functors have a simple form after unstraightening. That is, under the equivalences $\Spaces_{/U} \iso \Loc_U(\Spaces)$ and $\Spaces_{/U'} \iso \Loc_{U'}(\Spaces)$, we have:
        
        ~~~ [straightening-functoriality-pull]
            The functor $f^* \c \Spaces_{/U} \to \Spaces_{/U'}$ is given by pullback in the other sense of the word, i.e.
            $$
            f^*(g \c V \to U) \iso (g' \ce g \times_U U' \c  V \times_U U' \to U').
            $$
        ~~~ [straightening-functoriality-push]
            The functor $f_! \c \Spaces_{/U'} \to \Spaces_{/U}$ is given by composition with $f$, i.e.
            $$
            f_!(g' \c V' \to U') \iso (fg' \c V' \to U).
            $$
            (For example, when $U = \pt$, you can check this is consistent by observing that the formula for $f_!$ is precisely the colimit used to define the unstraightening construction above.)
    
--- Notation [dependent-sum]
    
    Given a functor $L \c U \to \Spaces$, we will denote the colimit of $L$ also by $\coprod_{u \in U} L(u)$. This suggests that we think of the colimit as a kind of sum or coproduct indexed by the space $U$. Indeed, in type theory this construction goes by the name of *dependent sum*.
    
    So in particular, given a map of spaces $V \to U$, by @straightening we have $V \iso \coprod_{u \in U} V_u$; i.e., the total space is the dependent sum of the fibers.

--- Example [product-dependent-sum]

    Let $U, V$ be spaces, and consider the projection map $U \times V \to V$. The fiber over any $v \in V$ is canonically equivalent to $U$, so applying straightening to this map tells us that
    $$
    U \times V \iso \coprod_{v \in V} U.
    $$

--- Example [fiber-product-dependent-sum]

    Let $f \c U \to W$ and $g \c V \to W$ be maps of spaces, and consider the map $U \times_W V \to U \times V$. By @fiber-product-fiber, applying straightening to this map tells us that
    $$
    U \times_W V \iso \coprod_{(u,v) \in U \times V} \Equiv_W(f(u),g(v)).
    $$
    This is how we precisely write down the intuition that $U \times_W V$ is the "space of data"
    $$
    \{u \in U, \quad
      v \in V, \quad
      \phi \c f(u) \iso g(v)\}.
    $$
    We will apply this shortly to make our sketch from @informal-proof rigorous, after repackaging some of the discussion above to help us think cleanly about dependent sums.

--- Lemma [iterated-sum]

    Let $U$ be a space. Let $L \c U \to \Spaces$ be a local system of spaces on $U$, and let $f \c U' \to U$ be its unstraightening, so $U' \iso \coprod_{u \in U} L(u)$. Let $L' \c U' \to \Spaces$ be a local system of spaces on $U'$ and let $f' \c U'' \to U'$ be its unstraightening, so $U'' \iso \coprod_{u' \in U'} L'(u')$. Then the straightening of the composite $ff' \c U'' \to U$ is the local system
    $$
    u \mapsto \coprod_{u' \in L(u)} L'(u');
    $$
    In particular, applying unstraightening again, we have an equivalence
    $$
    \coprod_{u' \in U'} L'(u') \iso \coprod_{u \in U} \coprod_{u' \in L(u)} L'(u')
    $$
    of spaces over $U$.
    
    --- Proof
        
        We are simply restating in different notation the equivalence of $f_!(L')$ and $f_!(f' \c U'' \to U') \iso (ff' \c U'' \to U)$ under straightening and unstraightening.
    
    --- Example [iterated-sum-fiber-product]
    
        We may combine examples @product-dependent-sum and @fiber-product-dependent-sum with this lemma to write
        $$
        \begin{align*}
        U \times_W V &\iso \coprod_{u \in U} \coprod_{v \in V} \Equiv_W(f(u),g(v)) \\
        &\iso \coprod_{v \in V} \coprod_{u \in U} \Equiv_W(f(u),g(v)).
        \end{align*}
        $$
    
        
## The rigorous translation

We end by giving the repeatedly promised rigorous proof of @main, translating the intuition of @informal-proof. First, just as we claimed fact @fiber-product-fiber to rewrite fiber products of spaces as a dependent sum in @fiber-product-dependent-sum, we will need to claim some facts that will allow us to write spaces of pointed maps and homotopies as dependent sums.

--- Fact [pointed-dependent-sum]

    Let $(U, u)$ and $(V, v)$ be pointed spaces. We will write $\Map(-,-)$ for mapping spaces in $\Spaces$ and $\Map_\pt(-,-)$ for mapping spaces in $\Spaces_\pt$.
    
    ~~~ [pointed-dependent-sum-map]
        Let $f \c U \to V$ be an unpointed map. Then the fiber of the canonical map
        $$
        \Map_\pt((U,u),(V,v)) \to \Map(U,V)
        $$
        over $f$ is the space $\Equiv_V(v,f(u))$ of paths $v \iso f(u)$ in $V$. Thus by @straightening we have
        $$
        \Map_\pt((U,u),(V,v)) \iso \coprod_{f \c U \to V} \Equiv_V(v,f(u)).
        $$
    ~~~ [pointed-dependent-sum-homotopy]
        Consider two pointed maps $(U,u) \to (V,v)$, which by @@pointed-dependent-sum-map we may specify as pairs $(f,\alpha),(g,\beta)$, where $f,g \c U \to V$ are unpointed maps and $\alpha \c v \iso f(u), \beta \c v \iso g(u)$ are paths. Let $\phi \c f \iso g$ be an unpointed homotopy. Then the fiber of the canonical map
        $$
        \Equiv_{\Map_\pt((U,u),(V,v))}((f,\alpha),(g,\beta)) \to
        \Equiv_{\Map(U,V)}(f,g)
        $$
        over $\phi$ is the space $\Equiv_{\Equiv_V(v,g(u))}(\phi_u\alpha, \beta)$ of homotopies between the two paths $\phi_u\alpha,\beta \c v \iso g(u)$ in $V$, where here $\phi_u$ denotes the path $f(u) \iso g(u)$ determined by $\phi$. So by @straightening we have
        $$
        \Equiv_{\Map_*((U,u),(V,v))}((f,\alpha),(g,\beta)) \iso
        \coprod_{\phi \c f \iso g} \Equiv_{\Equiv_V(v,g(u))}(\phi_u\alpha, \beta).
        $$

--- Proof of @main [final-proof]
    
    All we have to do is replace the set-theoretic notation for our "spaces of data" from @informal-proof with the relevant dependent sums that precisely describe these spaces.
    
    Firstly, for any pointed object $(Y,y \c \pt Y)$ of $\sC$, as stated at the start of the previous section, the universal property of the homotopy pushout in $\sC_\pt$ tells us that $\Map_{\sC_\pt}(\Sigma_\pt(X,x),(Y,y))$ is equivalent to the fiber product
    $$
    \Map_{\sC_\pt}(\pt,(Y,y)) \times_{\Map_{\sC_\pt}((X,x),(Y,y))} \Map_{\sC_\pt}(\pt,(Y,y)).
    $$
    By @fiber-product-dependent-sum we may rewrite this space as the dependent sum
    $$
    \coprod_{(y',\alpha'),(y'',\alpha'') \c \\ \pt \to (Y,y)} \Equiv_{\Map_{\sC_\pt}((X,x),(Y,y))}((y'p,\alpha'p), (y''p,\alpha''p)).
    $$
    Applying @pointed-dependent-sum and @iterated-sum this is equivalent to
    $$
    \coprod_{y',y'' \c \pt \to Y} \coprod_{\alpha' \c y \iso y',\\ \alpha'' \c y \iso y''} \coprod_{\phi \c y'p \iso y''p} \Equiv_{\Equiv_{\Map_\sC(\pt,Y)}}(\phi_x\alpha',\alpha''),
    $$
    where $\phi_x$ is as defined in @informal-proof. Then @iterated-sum allows us to rewrite this as
    $$
    \coprod_{y',y'' \c \pt \to Y} \coprod_{\phi \c y'p \iso y''p} \coprod_{\alpha' \c y \iso y'} \coprod_{\alpha'' \c y \iso y''} \Equiv_{\Equiv_{\Map_\sC(\pt,Y)}}(\phi_x\alpha',\alpha''),
    $$
    and tells us that this admits a map to
    $$
    B \ce \coprod_{y',y'' \c \pt \to Y} \coprod_{\phi \c y'p \iso y''p} \coprod_{\alpha' \c y \iso y'} \pt
    $$
    with fibers
    $$
    F_{y',y'',\phi,\alpha'} \ce \coprod_{\alpha'' \c y \iso y''} \Equiv_{\Equiv_{\Map_\sC(\pt,Y)}}(\phi_x\alpha',\alpha'').
    $$
    But, as in @informal-proof, we recognize these fibers to be path spaces with initial objects, hence contractible. And applying @fiber-product-dependent-sum and @pointed-dependent-sum gives us that
    $$
    B \iso \Map_{\sC_*}((\Sigma X,s),(Y,y)).
    $$
    So as in @informal-proof we conclude $\Sigma_\pt(X,x)$ and $(\Sigma X,s)$ represent the same functor in $\sC_\pt$, and hence are equivalent.

Ok, this took way too long to write up, but we're finally done. The slogan to take away is: intuitions for $\infty$-categorical universal properties can be encoded precisely with dependent sums. (And unreduced and reduced suspension are the same!)


[homology-def]: /2016/10/15/motivating-homology/
[local-systems]: /2016/10/18/local-systems/
[local-systems]: /2016/10/18/local-systems/

[HTT]: //www.math.harvard.edu/~lurie/papers/croppedtopoi.pdf
