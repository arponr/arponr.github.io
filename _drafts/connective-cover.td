---
layout: post
math: true
title: Connective covers
tags:
- math
- category theory
- homotopy theory
- localization
- spectra
---

--- [localization]
    
    Let $C$ be a category, $i \c C_0 \inj C$ a full subcategory.
    
    --- Definition [category-localization]
        
        We say $C_0$ is a *localization* of $C$ if the inclusion $i$ admits a left adjoint $L \c C \to C_0$.
    
    --- Definition [object-localization]
        
        Let $X \in C$. A *$C_0$-localization* of $X$ is a map $\eta \c X \to Y$ in $C$ where $Y \in C_0$ and for every $Z \in C_0$,
        $$
        \eta^* \c \Map_C(Y,Z) \to \Map_C(X,Z)
        $$
        is an equivalence.
        
    --- Claim [localization-universal]
    
        Let $X \in C$. A $C_0$-localization of $X$ is equivalent to an initial object in the comma category $(C_0)_{X/}$ whose objects are
        maps $X \to Z$ in $C$ with $Z \in C_0$.
        
        --- Proof
        
            Straightforward rephrasing of the definition @object-localization.

    --- Claim [localization-equivalence]
        
        The following are equivalent:
        ~~~ [localization-equivalence-category]
            $C_0$ is a localization of $C$.
        ~~~ [localization-equivalence-object]
            Every object of $C$ admits a $C_0$-localization.
            
        --- Proof
            
            @@localization-equivalence-category $\shimplies$ @@localization-equivalence-object: Assume the inclusion $i \c C_0 \to C$ admits a left adjoint $L \c C \to C_0$. Take any $X \in C$. The unit of the adjunction gives us a map $\eta \c X \to L(X)$ in $C$, which is a $C_0$-localization of $X$ by definition of adjunction.
            
            @@localization-equivalence-object $\shimplies$ @@localization-equivalence-category: Assume every $X \in C$ admits a $C_0$-localization $\eta_X \c X \to L(X)$. Given a map $f \c X \to Y$ in $C$, @localization-universal implies that there is a unique map $L(f) \c L(X) \to L(Y)$ making
            $$
            \begin{xy}
            \xymatrix {
                X \ar[r]^f \ar[d]_{\eta_X} &
                Y \ar[d]^{\eta_Y} \\
                L(X) \ar[r]^{L(f)}  &
                L(Y)
            }
            \end{xy}
            $$
            commute. It follows that $X \mapsto L(X)$ defines a functor $L \c C \to C_0$, and the definition of $C_0$-localization says precisely that $L$ is left adjoint to the inclusion $C_0 \inj C$.
    
    --- Remark [localization-dual]
    
        We may dually define $C_0$ to be a *colocalization* of $C$ when the inclusion $i$ admits a right adjoint. This is equivalent to saying $C_0^\op$ is a localization of $C^\op$, so the above statements all have formally dual analogues for colocalization.
    
--- [stable-localization]

    All of the discussion in @localization actually goes through when $C$ is more generally an $\infty$-category. Let's now take $C$ to be a stable $\infty$-category, and $i \c C_0 \inj C$ again a full subcategory.
    
    --- Definition [local-object]
        
        We say an object $X \in C$ is *$C_0$-local* if for any $Y \in C_0$, all maps $Y \to X$ in $C$ are nullhomotopic. We denote by $C_0^\perp$ the full subcategory of $C$ spanned by the $C_0$-local objects.
        
    --- Claim [local-object-localization]
        
        Let $X \in C$. Suppose $\epsilon \c X' \to X$ is a $C_0$-colocalization of $X$. Then the cofiber $\eta \c X \to X''$ of $\epsilon$ is a $C_0^\perp$-localization of $X$.
        
        --- Proof
        
            We first show that $X'' \in C_0^\perp$. Suppose $Y \in C_0$. Since $C$ is stable, our cofiber sequence $X' \to X \to X''$ is also a fiber sequence, determining a fiber sequence of mapping spectra
            $$
            \und\Map_C(Y,X') \to \und\Map_C(Y,X) \to \und\Map_C(Y,X''),
            $$
            which is also a cofiber sequence since the $\infty$-category of spectra is also stable; since the first map in this sequence is an equivalence by definition of $C_0$-colocalization, we conclude that 
            $$
            \und\Map_C(Y,X'') \iso *.
            $$
            Thus any map $Y \to X''$ is nullhomotopic, so $X''$ is $C_0$-local.
            
            Now suppose $Z \in C_0^\perp$ is another $C_0$-local object. Since $X' \in C_0$ the restriction of any map $X \to Z$ to $X''$ is nullhomotopic. By definition of the cofiber it follows that
            $$
            \eta^* \c \Map_C(X'',Z) \to \Map_C(X,Z)
            $$
            is an equivalence, and hence $\eta$ is indeed a $C_0^\perp$ localization of $X$.
            
    --- Claim [local-category-localization]
        
        Suppose $C_0$ is a colocalization of $C$. Then $C_0^\perp$ is a localization of $C$, and the adjoints $G \c C \to C_0$, $L \c C \to C_0^\perp$ to the inclusions $i \c C_0 \inj C$, $j \c C_0^\perp \inj C$ fit into a cofiber sequence
        $$
        i \circ G \to \id_C \to j \circ L.
        $$
        
        --- Proof
        
            Combine @localization-equivalence with @local-object-localization.
            
--- [bousfield-localization]
    
    The theory of Bousfield localization (for spectra) is a special case of the discussion in @stable-localization. Namely, suppose now that $(C, \otimes)$ is a stable presentably symmetric monoidal $\infty$-category (e.g. the $\infty$-category of spectra equipped with its smash product). Let $*$ denote the zero object in $C$. Fix $E \in C$.
        
    --- Definition [E-acyclic]
        
        An object $X \in C$ is said to be *$E$-acyclic* if $E \otimes X \iso *$. Let's denote by $C^E$ the full subcategory of $C$ spanned by the $E$-acyclic objects.
    
    --- Claim [E-acyclic-colocal]
    
        $C^E$ is a colocalization of $C$.
        
        --- Proof
        
            Since $C$ is presentably symmetric monoidal, the tensor product $\otimes$  preserves colimits in each variable. This implies:
            
            - A colimit of $E$-acyclic objects is $E$-acyclic. It follows that $C^E$ has colimits and the inclusion $i \c C_E \to C$ preserves them.
            - The functor $E \otimes - \c C \to C$ is accessible. Since $C^E$ is the fiber of this functor over the zero object $*$, it follows from [Higher Topos Theory](//www.math.harvard.edu/~lurie/papers/croppedtopoi.pdf) 5.4.6.6 that $C^E$ is accessible.
            
            Thus $C^E$ is presentable and $i$ preserves colimits, so it admits a right adjoint by the adjoint functor theorem.

    --- Definition [E-local]
        
        An object $X \in C$ is said to be *$E$-local* if it is $C^E$-local in the sense of @local-object. We denote the subcategory $(C^E)^\perp$ of $E$-local objects by $C_E$.
        
    --- Claim [E-local-local]
    
        $C_E$ is a localization of $C$.
        
        --- Proof
        
            Combine @E-acyclic-colocal with @local-category-localization.
        
    
        
