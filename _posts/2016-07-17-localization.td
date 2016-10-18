---
layout: post
math: true
title: Localization
date: 2016-07-17 10:15:00 -0500
tags:
- math
- category theory
- localization
- adjunctions
- monads
preamble:
- [Fun, 0, '\mathrm{Fun}']
- [Sh, 0, '\mathrm{Sh}']
- [PSh, 0, '\mathrm{PSh}']
- [Mod, 0, '\mathrm{Mod}']
---

    
Let $C$ be a category, $i \c C_0 \inj C$ a full subcategory.
    
--- Definition [category-localization]
        
    We say $C_0$ is a *localization* of $C$ if the inclusion $i$ admits a left adjoint $a \c C \to C_0$.

--- Claim [counit-isomorphism]

    Let $u \c D \to E$ be a functor with left adjoint $f \c E \to D$. Then $u$ is fully faithful (i.e. exhibits $D$ as a localization of $E$) if and only if the counit $\epsilon \c f \circ u \to \id_D$ is an isomorphism.
    
    --- Proof
    
        For each $x \in D$, we have a commtuative diagram
        $$
        \begin{xy}
        \xymatrix{
            \Map_D(x,-) \ar[r]^{\epsilon_x^*} \ar[dr]_u &
            \Map_D(f(u(x)),-) \ar[d]^{\sim} \\
            &
            \Map_E(u(x),u(-)).
        }
        \end{xy}
        $$
        where the vertical map is the isomorphism given by the adjunction. Now, $u$ being fully faithful means that the diagonal map is an isomorphism for all $x \in D$. By the above diagram this is equivalent to $\epsilon_x^*$ being an isomorphism for all $x \in D$, which by Yoneda is equivalent to $\epsilon$ being an isomorphism.

--- Remark [idempotent-monad]

    Since $C_0$ is a full subcategory, i.e. $i$ is fully faithful, it is natural to think of a functor $a \c C \to C_0$ as an endofunctor $L \ce i \circ a \c C \to C$ which lands in $C_0$. When $a$ is left adjoint to $i$, this amounts to considering the monad on $C$ associated to the adjunction. It follows from @counit-isomorphism that in this situation the monad $L$ is actually idempotent, i.e. acts as a projection onto the subcategory $C_0$.

--- [unit-isomorphism]
    
    Suppose $C_0$ is a localization of $C$; let $a \c C \to C_0$ be a left adjoint to $i$. Consider the unit transformation $\eta \c \id_C \to i \circ a$.

    --- Claim [projected-unit-isomorphism]
        
        The natural transformation $a(\eta) \c a \to a \circ i \circ a$ is an isomorphism.
    
        --- Proof
            
            The triangle identity of the adjunction tells us that the diagram of natural transformations
            $$
            \begin{xy}
            \xymatrix {
                a \ar[r]^{a(\eta)} \ar[dr]_{\id_a} &
                a \circ i \circ a \ar[d]^{\epsilon_a} \\
                &
                a
            }
            \end{xy}
            $$
            commutes. Since the counit $\epsilon_a$ is an isomorphism by @counit-isomorphism, $a(\eta)$ must be the inverse isomorphism.
        
    --- Claim [unit-detection]
    
        Let $x \in C$. The following are equivalent:
        ~~~ [unit-detection-in]
            The object $x$ lies in the (essential) image of $i$ (i.e. belongs to $C_0$).
        ~~~ [unit-detection-rep]
            For any map $\phi \c y \to z$ in $C$ such that $a(\phi)$ is an isomorphism in $C_0$, the induced map
            $$
            \phi^* \c \Map_C(z,x) \to \Map_C(y,x)
            $$
            is an isomorphism.
        ~~~ [unit-detection-unit]
            The unit map $\eta_x \c x \to i(a(x))$ is an isomorphism.
        
        --- Proof
        
            @@unit-detection-in $\shimplies$ @@unit-detection-rep: Suppose $x \iso i(x_0)$. Let $\phi \c y \to z$ be a map in $C$. From the adjunction we get a commutative diagram
            $$
            \begin{xy}
            \xymatrix {
                \Map_C(z,x) \ar[r]^{\phi^*} \ar[d]_{\sim} &
                \Map_C(y,x) \ar[d]^{\sim} \\
                \Map_{C_0}(a(z),x_0) \ar[r]^{a(\phi)^*} &
                \Map_{C_0}(a(y),x_0).
            }
            \end{xy}
            $$
            It follows that $\phi^*$ is an isomorphism if $a(\phi)^*$ is an isomorphism, in particular if $a(\phi)$ is an isomorphism.
            
            @@unit-detection-rep $\shimplies$ @@unit-detection-unit: Suppose $X$ satisfies @@unit-detection-rep. By @projected-unit-isomorphism, $a(\eta_x)$ is an isomorphism, implying
            $$
            \eta_x^* \c \Map_C(i(a(x)),x) \to \Map_C(x,x)
            $$
            is an isomorphism. Surjectivity gives us a map $\xi_x \c i(a(x)) \to x$ such that $\xi_x\eta_x = \id_x$. From the previous implication we know that $i(a(x))$ also satisfies @@unit-detection-rep, so we also get an isomorphism 
            $$
            \eta_x^* \c \Map_C(i(a(x)),i(a(x))) \to \Map_C(x,i(a(x))).
            $$
            Here injectivity tells us that $\eta_x \xi_x \eta_x = \eta_x \implies \eta_x\xi_x = \id_{i(a(x))}$. Thus $\xi_x$ is inverse to $\eta_x$.
            
            @@unit-detection-unit $\shimplies$ @@unit-detection-in: Clear.

--- [objectwise-localization]
    
    We can actually check whether $C_0$ is a localization of $C$ by looking at each object of $C$ individually.

    --- Definition [object-localization]
    
        Let $x \in C$. A *$C_0$-localization* of $x$ is a map $\eta \c x \to i(y)$ in $C$ with $y \in C_0$ such that
        $$
        \eta^* \c \Map_D(y,z) \iso \Map_C(i(y),i(z)) \to \Map_C(x,i(z))
        $$
        is an isomorphism for every $z \in C_0$.
        
    --- Claim [localization-universal]
        
        Let $x \in C$. A $C_0$-localization of $x$ is equivalent to an initial object in the comma category $(C_0)_{x/}$ whose objects are maps $x \to i(z)$ in $C$ with $z \in C_0$.
    
        --- Proof
            
            Straightforward rephrasing of the definition @object-localization.

    --- Claim [localization-equivalence]
        
        The following are equivalent:
        ~~~ [localization-equivalence-category]
            $C_0$ is a localization of $C$.
        ~~~ [localization-equivalence-object]
            Every object of $C$ admits a $C_0$-localization.
        
        --- Proof
            
            @@localization-equivalence-category $\shimplies$ @@localization-equivalence-object: Assume the inclusion $i \c C_0 \to C$ admits a left adjoint $a \c C \to C_0$. Take any $x \in C$. The unit of the adjunction gives us a map $\eta \c x \to i(a(x))$ in $C$, which is a $C_0$-localization of $x$ by definition of adjunction.
            
            @@localization-equivalence-object $\shimplies$ @@localization-equivalence-category: Assume every $x \in C$ admits a $C_0$-localization $\eta_x \c x \to i(a(x))$. Given a map $\phi \c x \to y$ in $C$, @localization-universal implies that there is a unique map $a(\phi) \c a(x) \to a(y)$ making
            $$
            \begin{xy}
            \xymatrix {
            x \ar[r]^\phi \ar[d]_{\eta_x} &
            y \ar[d]^{\eta_y} \\
            i(a(x)) \ar[r]^{i(a(\phi))}  &
            i(a(y))
            }
            \end{xy}
            $$
            commute. It follows that $x \mapsto a(x)$ defines a functor $a \c C \to C_0$, and the definition of $C_0$-localization says precisely that $a$ is left adjoint to the inclusion $C_0 \inj C$.

    
--- Remark [localization-dual]
    
    We may dually define $C_0$ to be a *colocalization* of $C$ when the inclusion $i$ admits a right adjoint. This is equivalent to saying $C_0^\op$ is a localization of $C^\op$, so the above statements all have formally dual analogues for colocalization.

--- [localization-deserves-name]

    The following explains why this concept is deserving of the name localization.

    --- Claim
        
        Suppose $C_0$ is a localization of $C$; let $a \c C \to C_0$ be a left adjoint to $i$. Let $W$ be the class of maps $\phi$ in $C$ such that $a(\phi)$ is an isomorphism. Then $a$ exhibits $C_0$ as the localization of $C$ at $W$; i.e. for any functor $g \c C \to D$ taking the class $W$ to isomorphisms in $D$, there is a unique functor $g' \c C_0 \to D$ such that $g \iso g' \circ a$.
        
        --- Proof
        
            Given two categories $A,B$, let $\Fun(A,B)$ denote the category of functors $A \to B$ and natural transformations of such. Fix any category $D$. The (2-)functor $\Fun(-,D)$ takes the adjunction $a \dashv i$ to an adjunction $i^* \dashv a^*$, where $i^* \c \Fun(C,D) \to \Fun(C_0,D)$ and $a^* \c \Fun(C_0,D) \to \Fun(C,D)$ are the induced pullback functors. By @counit-isomorphism the counit $a \circ i \to \id_{C_0}$ is an isomorphism, which implies the induced counit $i^* \circ a^* \to \id_{\Fun(C_0,D)}$ is also an isomorphism; applying the other direction of @counit-isomorphism then gives that $a^*$ is fully faithful.
            
            All we need to show now is that a functor $g \c C \to D$ lies in the essential image of $a^*$ if and only if it takes $W$ to isomorphisms. The "only if" direction is obvious. Conversely, suppose given a functor $g$ taking $W$ to isomorphisms. Let $g' \ce g \circ i$. We claim that the natural transformation 
            $$
            g(\eta) \c g \to g' \circ a = g \circ i \circ a
            $$
            induced by the unit $\eta \c \id_C \to i \circ a$ is an isomorphism. This follows from our hypothesis on $g$, since $a(\eta)$ is an isomorphism, by @projected-unit-isomorphism. We conclude that $g \iso a^*(g')$, completing the proof.
    
--- [examples]

    Let's end with a couple of examples.
    
    --- Example [example-sheaves]
        
        Let $X$ be a topological space. Take $C$ to be the category $\PSh(X)$ of presheaves on $X$ and $C_0$ the full subcategory $\Sh(X) \subseteq \PSh(X)$ of sheaves.
        
        The inclusion $i \c \PSh(X) \inj \Sh(X)$ has a left adjoint $a \c \Sh(X) \to \PSh(X)$, usually referred to as sheafification, so the subcategory of sheaves is a localization.
        
        Isomorphisms of sheaves are determined stalkwise, and sheafification preserves stalks, so @localization-deserves-name tells us that we may think of $\Sh(X)$ as the localization of $\PSh(X)$ at the local/stalkwise isomorphisms.
    
    --- Example [example-modules]
    
        Let $R$ be a commutative ring, $S \subseteq R$ a multiplicative subset. Take $C$ to be the category $\Mod(R)$ of $R$-modules.
        
        --- Definition
        
            We say an $R$-module $M$ is *$S$-local* if all $s \in S$ act invertibly on $M$.
        
        Take $C_0$ to be the full subcategory $\Mod(R)_S \subseteq \Mod(R)$ spanned by the $S$-local modules. The inclusion has a left adjoint $a \c \Mod(R) \to \Mod(R)_S$ given by localization at $S$, which I'll denote by $a(M) = M_S$.
        
        Suppose given a morphism $\phi \c M \to N$ in $\Mod(R)$. Consider the localized morphism $a(s) = \phi_S \c M_S \to M_S$. Since localization is exact, we have
        $$
        \ker(\phi_S) \iso \ker(\phi)_S,\ 
        \coker(\phi_S) \iso \coker(\phi)_S.
        $$
        It follows that $\phi_S$ is an isomorphism if and only if $\ker(\phi)_S$ and $\coker(\phi)_S$ vanish, which is equivalent to $\ker(\phi)$ and $\coker(\phi)$ being $S$-torsion. Thus, in this case @localization-deserves-name tells us that $\Mod(R)_S$ is the localization of $\Mod(R)$ at the morphisms which are isomorphisms up to $S$-torsion.
        
    
        
        
        
        
    
    
