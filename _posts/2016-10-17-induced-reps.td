---
layout: post
hidden: true
math: true
title: Induced and coinduced representations
date: 2016-10-17 00:15:00 -0800
tags:
- math
- representation theory
- adjunctions
preamble:
- [LMod, 0, '\mathrm{LMod}']
---

--- Notation
    
    Let $G$ be a (discrete) group and $H \le G$ a *finite-index* subgroup. Let $k$ be a field. For now, by a *representation* we will mean a finite dimensional $k$-linear representation.
    
There is an evident way to restrict representations of $G$ to representations of $H$. Conversely, one learns that out of a representation $(V,\rho)$ of $H$ there is a canonical way to build a representation $(V',\rho')$ of $G$. Depending on who's writing or lecturing (or thinking), there are a various ways this might be presented. The first time I saw it was in a course taught by Joe Harris, so I saw the following completely explicit construction. 
    
--- Construction [explicit]
    
    Let $n \ce [G:H]$ and choose a set of left-coset representatives $\{g_1,\ldots,g_n\} \subseteq G$ for $G/H$, say with $g_1 = 1$. The underlying vector space is defined as
    $$
    V' \ce \bigoplus_{i=1}^n V,
    $$
    i.e. $[G:H]$-many copies of $V$; write $V_i$ for the $i$-th factor in $V'$ and $\alpha_i \c V \to V_i$ the tautological isomorphism. The $G$-action $\rho'$ on $V'$ is then defined so that the representatives $g_i$ send $V_1$ to $V_i$ (via the identity $V \to V$), and so that $H$ acts on each $V_i$ via $\rho$. These requirements force the following definition: for $g \in G$ and $1 \le i \le n$ we may write $g \cdot g_i = g_j \cdot h$ for unique $1 \le j \le n$ and $h \in H$ since $\{g_1,\ldots,g_n\}$ are left-coset representatives); then for $v \in V$ we define
    $$
    \rho'(g)\alpha_i(v) \ce \alpha_j(\rho(h)v).
    $$
    One then has to check that this is indeed a representation.
    
The idea of this construction is fairly clear, but in what sense is it "canonical", and what naturality properties does it have? There are actually two interpretations of this construction, hence two answers to these questions.
    
--- [interpretation]
    
    Recall that representations of $H$ and $G$ may be thought of equivalently as left modules over the group algebras $k[H]$ and $k[G]$. In this language, restriction of representations from $G$ to $H$ is restriction of scalars in the canonical $k$-algebra map $\psi \c k[H] \to k[G]$. This brings us to the following.
    
    --- Lemma [ring-adjunction]
        
        Let $\phi \c R \to S$ be a map of rings. Let $\phi^* \c \LMod(S) \to \LMod(R)$ be the restriction of scalars functor from left $S$-modules to left $R$-modules. Then $\phi^*$:
        
        ~~~ [ring-adjunction-left]
            has a left adjoint $\phi_! \c \LMod(R) \to \LMod(S)$ given by *extension of scalars* $M \mapsto S \otimes_R M$;
        ~~~ [ring-adjunction-right]
            has a right adjoint $\phi_* \c \LMod(R) \to \LMod(S)$ given by *coextension of scalars* $M \mapsto \Hom_R(S,M)$.
        
        --- Proof
            
            @@ring-adjunction-left: If we view $S$ as an $(S,R)$-bimodule in the obvious fashion, then there is a natural isomorphism
            $$
            \phi^*(N) \iso \Hom_S(S,N) \in \LMod(R).
            $$
            The claim then follows from the [tensor-hom adjunction](//en.wikipedia.org/wiki/Tensor-hom_adjunction) for $(S,R)$-bimodules.
            
            @@ring-adjunction-right: If we view $S$ as an $(R,S)$-bimodule in the obvious fashion, then there is a natural isomorphism
            $$
            \phi^*(N) \iso S \otimes_R N.
            $$
            The claim then follows from the tensor-hom adjunction for $(R,S)$-bimodules.
    
    We now apply @ring-adjunction to the ring map $\psi \c k[H] \to k[G]$ mentioned above. Suppose given an $H$-representation $V \in \LMod(k[H])$.
    
    --- Definition [induction]
        
        We define the *induced $G$-representation* associated to $V$ to be
        $$
        \psi_!(V) \iso k[G] \otimes_{k[H]} V \in \LMod(k[G]),
        $$
        and the *coinduced $G$-representation* associated to $V$ to be
        $$
        \psi_*(V) \iso \Hom_{k[H]}(k[G], V) \in \LMod(k[G]).
        $$
        
    --- Unpacking [induction-unpack]
        
        A choice of left-coset representatives $\{g_1,\ldots,g_n\}$ of $G/H$ as in @explicit defines a basis of $k[G]$ as a (free) right $k[H]$-module, hence determines an isomorphism of left $k[H]$-modules
        $$
        k[G] \otimes_{k[H]} V \iso \bigoplus_{i=1}^n V.
        $$
        Translating the left $k[G]$-module structure from the left-hand to the right-hand side precisely recovers the $G$-representation structure constructed in @explicit.
        
        Next, note that $\{g_1^{-1},\ldots,g_n^{-1}\}$ will be a choice of *right*-coset representatives, defining a basis of $k[G]$ as a (free) *left* $k[H]$-module, hence determining an isomorphism of left $k[H]$-modules
        $$
        \Hom_{k[H]}(k[G], V) \iso \prod_{i=1}^n V \iso \bigoplus_{i=1}^n V.
        $$
        (Observe that we have crucially used that $n = [G:H] < \infty$ in the second isomorphism.) And again, translating the left $k[G]$-module structure from the left-hand to the right-hand side recovers the construction in @explicit.

--- Conclusion [conclusion]

    We thus conclude from @induction-unpack that the construction of @explicit is "canonical", or natural, in two senses: it defines both left and right adjoints to restriction of represenations from $G$ to $H$. In fact, even though the identification above went through an ugly choice of coset representatives, one can see that the discussion above still supplies a natural isomorphism between the two adjoints; the choice only depended on our fixed $G$ and $H$, and hence only makes it non-obvious that this natural isomorphism itself is natural. I.e. we have proved in a non-canonical way that the construction is canonical in a canonical way. (Sorry.)
    
    Looking at the situation from the other side, we may be surprised to conclude that the left and right adjoints of restriction, induction and coinduction, are naturally isomorphic! Near-future posts will explain how to understand this phenomenon more generally and systematically (in particular getting rid of that last shred of non-canonicity).
    
    


