---
layout: post
math: true
title: Local systems, (co)induction, and (co)homology
date: 2016-10-17 23:00:00 -0800
tags:
- math
- homotopy theory
- representation theory
- local systems
- ambidexterity
preamble:
- [BH, 0, '{\rB H}']
- [BG, 0, '{\rB G}']
- [Loc, 0, '\operatorname{Loc}']
- [Mod, 0, '\mathrm{Mod}']
- [pt, 0, '\star']
- [Sets, 0, '\mathrm{Sets}']
- [Spaces, 0, '\mathrm{Spaces}']
- [Spectra, 0, '\mathrm{Spectra}']
- [Vect, 0, '\mathrm{Vect}']
---

This is partially a continuation of the [previous post][induced-reps] on (co)induced representations, but the goal here is to put things in a more general context.

--- [reps-as-local-systems]

    To begin, let's reformulate the definition of representations, say of a (discrete) group $G$ over a field $k$. In the previous post we profited from the equivalence of representations with (left) modules over the group algebra $k[G]$. Here I want to stick more closely to perspective of homomorphisms $G \to \Aut(V)$. These are manifestly equivalent to functors $\BG \to \Vect(k)$, where here $\BG$ denotes the one-object groupoid with automorphism group $G$, and $\Vect(k)$ denotes the category of vector spaces over $k$. Noting that groupoids are in particular $\infty$-groupoids, i.e. spaces, we make the following definition.[^classifying-space]
    
    [^classifying-space]: If one wants to think of spaces as presented by topological spaces, then the groupoid $\BG$ is presented by what is usually called the *classifying space* of $G$, also denoted $\BG$. I find it more helpful in most situations, especially in the context of local systems, to just think of the groupoid itself as presenting the space, since it's a much simpler object.
    
--- Definition [local-system]
    
    Let $X$ be a space and $\sC$ an $\infty$-category. A *$\sC$-valued local system on $X$* is a functor $L \c X \to \sC$ (where here $X$ is thought of as an $\infty$-groupoid). The $\infty$-category of such functors, usually denoted $\Fun(X,\sC)$, will in this context be denoted $\Loc_X(\sC)$.

    --- Unpacking [local-system-unpack]
    
        Let's begin by making sure we understand what data comprises a local system $L \c X \to \sC$:
        
        - to each $x \in X$ we assign an object $L(x) \in \sC$;
        - to each path $p \c x \to y$ in $X$ we assign an equivalence $L(p) \c L(x) \iso L(y)$;
        - to each two-simplex $\sigma$:
          $$
          \begin{xy}
          \xymatrix{
          & y \ar[dr]^q & \\
          x \ar[ur]^p \ar[rr]^r & & z
          }
          \end{xy}
          $$
          in $X$ we assign an equivalence (of equivalences) $L(\sigma) \c L(r) \iso L(q)L(p)$;
        - to higher simplices we assign higher coherence data.

    --- Remark [local-system-classical]
    
        If $\sC$ a discrete/ordinary category, then we don't have to worry about the higher coherences mentioned in @local-system-unpack. More precisely, for any space $X$, a functor $X \to \sC$ factors uniquely through the $1$-truncation $\tau_{\le 1}X$, which is a (discrete/ordinary) groupoid, usually called the *fundamental groupoid* of $X$ and sometimes denoted $\pi_{\le 1}(X)$; if $X$ is connected this groupoid is (non-canonically) equivalent to $\rB \pi_1(X)$.
        
        Thus, in this case, $\sC$-valued local systems on $X$ are just functors 
        $\pi_{\le 1}(X) \to \sC$, or representations of $\pi_1(X)$ in $\sC$ if $X$ is connected, so we recover the classical notion of local system.

    --- Example [local-system-bg]
    
        Take $X$ to be $\BG$. Then for any $\infty$-category $\sC$, $\Loc_{\BG}(\sC)$ is the $\infty$-category of objects with $G$-action in $\sC$, or equivalently the $\infty$-category of representations of $G$ in $\sC$.
        
        Combining this example with @local-system-classical, we see that if $\sC = \Vect(k)$ is the category of $k$-vector spaces then we recover the category of $k$-linear representations of $G$, as mentioned above; and if $\sC = \Sets$ is the category of sets then we recover the category of $G$-sets.
    
    --- Example [local-system-constant]
        
        Let $X$ be any space and $\sC$ be any $\infty$-category. Given any object $C \in \sC$ we can form the *constant local system* on $X$ with value $C$ (given by the constant functor $X \to \sC$ with value $C$).

--- [pullback]
    
    We now discuss how restriction, induction, and coinduction of representations fit into the framework of local systems.
    
    --- Definition [pullback-local-system]
    
        Let $\sC$ be an $\infty$-category. Let $f \c Y \to X$ be a map of spaces. Then precomposition with $f$ determines a functor
        $$
        f^* \c \Loc_X(\sC) \to \Loc_Y(\sC),
        $$
        which we refer to as *pullback (or restriction) of local systems* along $f$.
    
    --- Example [pullback-bg]
    
        Let $G$ be a group and $H \le G$ a subgroup. Then the inclusion $H \inj G$ determines a unique map of spaces $f \c \BH \to \BG$. Pullback of local systems in $f$ is precisely restriction of $G$-representations to $H$-representations.
    
    --- Example [pullback-constant]
    
        Let $X$ be any space and let $f \c X \to \pt$ be the unique map to the one-point space. For any $\infty$-category $\sC$, we canonically have $\Loc_\pt(\sC) \iso \sC$, and given an object $C \in \sC$, $f^*(C)$ is the constant local system with value $C$ discussed in @local-system-constant.

    --- Definition [pullback-adjoint]
        
        Let $\sC$ be an $\infty$-category and $f \c Y \to X$ a map of spaces.
        
        ~~~ [pullback-adjoint-left]
            Suppose $\sC$ is cocomplete. Then $f^*$ admits a left adjoint
            $$
            f_! \c \Loc_Y(\sC) \to \Loc_X(\sC),
            $$
            given by [left Kan extension](//en.wikipedia.org/wiki/Kan_extension) along $f$, which we refer to here as *induction of local systems* along $f$.
        ~~~ [pullback-adjoint-right]
            Suppose $\sC$ is complete. Then $f^*$ admits a right adjoint
            $$
            f_* \c \Loc_Y(\sC) \to \Loc_X(\sC),
            $$
            given by right Kan extension along $f$, which we refer to here as *coinduction of local systems* along $f$.
    
    --- Example [pullback-adjoint-bg]
    
        Let $f \c \BH \to \BG$ be as in @pullback-bg. Since pullback of local systems $f^*$ gives restriction of reprsentations, its left and right adjoints (when they exist) $f_!$ and $f_*$ must give induction and coinduction of representations (which was discussed in the case of $\sC = \Vect(k)$ in the [previous post][induced-reps]), justifying our terminology.
    
    --- Example [pullback-adjoint-constant]
    
        Let $f \c X \to \pt$ be as in @pullback-constant. We saw there that $f^* \c \Loc_\pt(\sC) \iso \sC \to \Loc_X(\sC)$ was given by forming constant local systems. If $\sC$ is complete then the left adjoint $f_!$ is given by the formation of colimits:
        $$
        f_!(L) \iso \colim_X L \quad
        \text{for } L \in \Loc_X(\sC);
        $$
        and if $\sC$ is cocomplete then the right adjoint $f_*$ is given by the formation of limits:
        $$
        f_*(L) \iso \lim_X L \quad
        \text{for } L \in \Loc_X(\sC).
        $$
        (This is the standard reformulation of the definition of (co)limits, and the standard way in which Kan extensions generalize (co)limits.)
        
    --- Definition [pullback-homcohom]
        
        In the situation of @pullback-adjoint-constant we will use different terminology for the adjoint functors $f_!$ and $f_*$:
        
        ~~~ [pullback-homology]
            We refer to the colimit $f_!(L)$ of a local system $L \in \Loc_X(\sC)$ as its *homology*.
        ~~~ [pullback-cohomology]
            We refer to the limit $f_*(L)$ of a local system $L \in \Loc_X(\sC)$ as its *cohomology*.
        
        --- Subexample [pullback-homcohom-top]
        
            Suppose $\sC = \Spectra$ (which is cocomplete and complete). Fix a spectrum $E$ and consider the constant local system $L \ce f^*(E)$ on $X$. The colimit of $L$ will be given by the smash product $X \otimes E$, and the limit of $L$ will be given by mapping spectrum $E^X$.[^tensoring] The homotopy groups of these spectra precisely give us the $E$-homology and $E$-cohomology of $X$. (For non-constant local systems we get some "twisted" form of homology and cohomology.)
            
            [^tensoring]: In general, any cocomplete $\infty$-category $\sC$ is tensored over $\Spaces$, and the colimit of the constant functor $X \to \sC$ at $C \in \sC$ will be given by the tensoring $X \otimes C$; and any complete $\infty$-category $\sC$ is cotensored over $\Spaces$, with the limit of the constant functor at $C$ being given by the cotensoring $C^X$.
        
        --- Subexample [pullback-homcohom-group]
            
            Suppose we take $X = \BG$, and $\sC$ any $\infty$-category. Given $L \in \Loc_\BG(\sC)$, thought of as an object with $G$-action, the colimit of $L$ (if it exists) will the be (homotopy) quotient object $L_G$, and the limit of $L$ (if it exists) will be the (homotopy) fixed-point object $L^G$. We may think of these as forms of group homology and cohomology.
    
        --- Remark [pullback-adjoint-formula]
            
            We have seen that left and right Kan extension generalize the formation of colimits and limits, but [recall](//en.wikipedia.org/wiki/Kan_extension#Kan_extensions_as_.28co.29limits) that general Kan extensions can be expressed in terms of (co)limits as well, over "fibers" of the functor we're extending along. In general, "fiber" really refers to a comma category construction, but since we're working with functors on *spaces*, these really just become honest (homotopy) fibers!
            
            In our situation, if $f \c Y \to X$ is any map of spaces, and $\sC$ is any cocomplete $\infty$-category, then we have a natural isomorphism
            $$
            f_!(L)(x) \iso \colim_{y \in Y_x} L(y),
            $$
            where $Y_x \ce Y \times_X \{x\}$ is the fiber of $Y$ over $x \in X$, and if $\sC$ is complete we have a natural isomorphism
            $$
            f_*(L)(x) \iso \lim_{y \in Y_x} L(y).
            $$
            We may thus alternatively think of $f_!$ and $f_*$ as a "fiberwise" relative version of homology and cohomology.

--- [ambidexterity]
    
    Finally, let us rediscover in this framework the conclusion from the [previous post][induced-reps] that induction and coinduction of representations are naturally isomorphic.
    
    --- Definition [semiadditive]
    
        We say an $\infty$-category $\sC$ is *semiadditive* if it admits finite coproducts and finite products, and for any finite collection of objects $\{C_i\}_{1 \le i \le n}$ in $\sC$, the canonical map
        $$
        \coprod_{i=1}^n C_i \to \prod_{i=1}^n C_i
        $$
        is an isomorphism. (This includes the degenerate case of the empty collection, which says that $\sC$ has a zero object.)
    
    --- Examples [semiadditive-eg]
    
        Abelian categories like $\Vect(k)$ are semiadditive, as are stable $\infty$-categories like $\Spectra$.
    
    --- Proposition [ambidexterity-induction]
    
        Let $f \c \BH \to \BG$ be as in @pullback-bg. Let $\sC$ be a semiadditive $\infty$-category. Then there is a natural isomorphism
        $$
        f_! \iso f_* \c \Loc_\BH(\sC) \to \Loc_\BG(\sC)
        $$
        between induction and coinduction of representations in $\sC$.
        
        --- Proof
        
            We appeal to the formulae for $f_!,f_*$ in terms of (co)limits given in @pullback-adjoint-formula. The (co)limits are taken over the fibers of the map $f$, which here are equivalent to the finite discrete space $G/H$, hence are just finite (co)products. The natural isomorphism is then immediate from the definition of semiadditivity @semiadditive.
    
    
        
    
[induced-reps]: /2016/10/17/induced-reps/
