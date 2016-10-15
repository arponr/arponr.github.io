---
layout: post
math: true
title: Motivating (co)homology in topology
date: 2016-10-15 12:30:00 -0500
tags:
- math
- topology
- homology
- cohomology
- eilenberg-steenrod axioms
preamble:
- [AbGroups, 0, '\mathrm{AbGroups}']
- [fin, 0, '\mathrm{fin}']
- [Ho, 0, '\operatorname{Ho}']
- [pt, 0, '\star']
- [Push, 0, '\operatorname{Push}']
- [Spaces, 0, '\mathrm{Spaces}']
---

--- Notation [spaces]

    I currently denote the $\infty$-category of spaces by $\Spaces$ and the one-point space by $\pt \in \Spaces$.

--- Spiel [topology-spiel]
    
    The central goal of algebraic topology is to learn about spaces[^spaces-def] by constructing and analyzing algebraic invariants of them. Precisely, an "algebraic invariant" should be a functor $\Spaces \to \sA$ (or $\Spaces^\op \to \sA$), where $\sA$ is some kind of "algebraic" category we can get our hands on, e.g. the categories of groups or rings, or perhaps sheaves of such on some geometric object. For this to be fruitful, we'd like to find invariants that both:

    - contain interesting information;
    - are readily computable.
    
    [^spaces-def]: Classically this means topological spaces up to weak homotopy equivalence, but we can just take this to mean objects of the $\infty$-category of $\Spaces$.

    These desiderata are of course in tension with each other. For example, the homotopy group functors $X \goesto \pi_*(X)$ in a sense encode all information in spaces, but are incredibly difficult to compute. Nevertheless, various invariants that are simultaneously interesting and computable have been found; they're what make algebraic topology worthwhile!

    *Homology and cohomology theories* give one class of (often) interesting but (sometimes) computable invariants. In fact, we will introduce them here from an axiomatic perspective, due to Eilenberg and Steenrod, that essentially says: (co)homology theories are invariants satisfying some axioms ensuring they are somewhat computable.

    --- Motivation [locality-motivation]
        
        The main axiom we will impose is a kind of *locality*. Let's discuss this. Suppose we have an invariant of spaces $E \c \Spaces^\op \to \sA$ (cohomology theories will be contravariant), and we want to compute $E(X)$ for some space $X$. Let's take the target category $\sA$ of $E$ to be any abelian (discrete) category.[^feel-free]
        
        [^feel-free]: Feel free to just take $\sA$ to be the category of abelian groups. We'll be focusing on this case shortly anyways.
        
        It's often the case that we can break $X$ up into smaller pieces $\{U_i\}$ that are easier to understand; e.g., if $X$ is the underlying space of a manifold, then $X$ can be covered by pieces equivalent to $\bR^n$, hence equivalent to a point. It would be nice if $E$ was of a "local" nature, so that knowing the pieces $E(U_i)$ would allow us to compute $E(X)$. Of course, the word "compute" might mean anything, and indeed the form it takes in the definition of cohomology theory probably isn't the first thing you'd think of. To partially justify this, let's see why the thing you actually might think of first wouldn't make for a great definition.
        
        The categorical/homotopical way to speak about being broken into pieces is via the notion of pushout. Namely, we think of a space $X$ as being the "gluing" of two spaces $U_1$ and $U_2$ along a third space $U_{1,2}$ when we are given a pushout square
        $$
        \begin{xy}
        \xymatrix{
            U_{1,2} \ar[r]^{i_1} \ar[d]_{i_2} &
            U_1 \ar[d]^{j_1} \\
            U_2 \ar[r]^{j_2} &
            X
        }
        \end{xy}
        $$
        in the $\infty$-category $\Spaces$. Such a square determines a sequence of maps
        $$
        E(X) \lblto{(E(j_1),-E(j_2))}
        E(U_1) \oplus E(U_2) \lblto{E(i_1) + E(i_2)}
        E(U_{1,2});
        $$
        and since $j_1i_1 \iso j_2i_2 \implies E(i_1)E(j_1) = E(i_2)E(j_2)$, we see that the composite of these maps is zero. Thus, if we'd like to recover $E(X)$ from $E(U_1)$, $E(U_2)$, and $E(U_{1,2})$, we might first think to ask that this sequence be a short-exact one.
        
        However, I claim that any invariant satisfying this strong locality property (and valued in an abelian category) isn't too interesting. Namely, given any space $Y$, suppose we take $U_{1,2} = Y$ and $U_1 = \pt = U_2$, so that $X \iso \Sigma Y$, and suppose we get a short-exact sequence
        $$
        0 \to E(X) \lblto{\alpha} E(\pt) \oplus E(\pt) \lblto{\beta} E(Y) \to 0
        $$
        from the above. Now, in addition to the maps $j_1,j_2 \c \pt \to X$, we have our canonical map $p \c X \to \pt$; these maps satisfy $pj_1 \iso \id_\pt \iso pj_2$, and hence we get $E(j_1)E(p) = \id_{E(\pt)} = E(j_2)E(p)$. This implies $E(j_1),E(j_2)$ must be surjective, and hence $\alpha$ is surjective. By exactness in the middle it follows that $\beta = 0$, and by exactness on the right this means $E(Y) \iso 0$. Thus $E$ takes every space to $0$; hopefully we can agree that this won't be too useful.[^homology-asymmetry]
        
        [^homology-asymmetry]: Note that this argument isn't self-dual, so it doesn't run through in the same way for a covariant, or "homological", functor. You can still show easily that the invariant is trivial, but I didn't find such a conceptually satisfying argument. I find this unfortunate.
        
        Observe, though, that it was really the requirement of right-exactness that trivialized the situation above, and that left-exactness really played no role. So what if we just demand that the sequence be exact in the middle? It turns out that this is much more reasonable. However, once we relax to this situation, it's natural to demand something else. Namely, we'd like to systematically understand the "failure" of the sequence to be short-exact; one precise way to achieve this would be to extend the sequence on both sides, i.e. to put in the context of a long(er) exact sequence. This finally motivates the following definition of cohomology theories, and the dual definition of homology theories.[^artificial]
    
        [^artificial]: Of course, while I find this motivation conceptually satisfying, it is somewhat artificial. The true motivation for the definition of cohomology theory is the fact that "nature" contains many interesting examples!

--- [cohomology-theory]
    
    Let $\sC$ be a $\infty$-category admitting finite colimits (the primary example of interest is $\sC = \Spaces$, but allowing for some variations here---e.g. $\sC = \Spaces^\fin$, the $\infty$-category of *finite* spaces---will be useful).

    --- Notation [pushout-category]
        
        Let $\Push(\sC)$ denote the $\infty$-category of pushout squares in $\sC$ (i.e. take the diagram category of squares in $\sC$, and then restrict to the full subcategory of pushout squares).
        
        Let $\rI \c \Push(\sC) \to \sC$ denote the functor taking a pushout square to its initial object (i.e. the object we "glue along"), and $\rF \c \Push(\sC) \to \sC$ the functor taking a pushout square to its final object (i.e. the actual pushout, or "glued" object).
    
    --- Notation [abgroups]
        
        We denote the category of abelian groups by $\AbGroups$.

    --- Definition [cohomology-theory-def]
        
        A *cohomology theory* on $\sC$ is a sequence of functors and natural transformations
        $$
        \begin{align*}
        &E^n \c \sC^\op \to \AbGroups,  \\
        &\del^n \c E^n \circ \rI \to E^{n+1} \circ \rF \c \Push(\sC) \to \AbGroups
        \end{align*}
        $$
        for $n \in \bZ$ satisfying the following conditions:
        ~~~ [cohomology-theory-additivity]
            *Additivity*: For any set of objects $\{X_i\}$ that admits a coproduct in $\sC$, the canonical map $E^n(\coprod_i X_i) \to \prod_i E^n(X_i)$ is an isomorphism.
        ~~~ [cohomology-theory-locality]
            *Locality*: For any pushout square $\sigma$:
            $$
            \begin{xy}
            \xymatrix{
                U_{1,2} \ar[r]^{i_1} \ar[d]_{i_2} &
                U_1 \ar[d]^{j_1} \\
                U_2 \ar[r]^{j_2} &
                X
            }
            \end{xy}
            $$
            in $\sC$, the sequence
            $$
            \cdots \to
            E^{n-1}(U_{1,2}) \lblto{\del^{n-1}}
            E^n(X) \lblto{\alpha^n}
            E^n(U_1) \oplus E(U_2) \lblto{\beta^n}
            E^n(U_{1,2}) \lblto{\del^n}
            E^{n+1}(X) \to
            \cdots
            $$
            is exact, where here
            $$
            \alpha^n \ce (E^n(j_1),-E^n(j_2)), \quad
            \beta^n \ce E^n(i_1) + E^n(i_2).
            $$

    --- Definition [homology-theory-def]
        
        A *homology theory* on $\sC$ is a sequence of functors and natural transformations
        $$
        \begin{align*}
        &E_n \c \sC \to \AbGroups,  \\
        &\del_n \c E^n \circ \rF \to E^{n-1} \circ \rI \c \Push(\sC) \to \AbGroups
        \end{align*}
        $$
        for $n \in \bZ$ satisfying the following conditions:
        ~~~ [homology-theory-additivity]
            *Additivity*: For any set of objects $\{X_i\}$ that admits a coproduct in $\sC$, the canonical map $E_n(\coprod_i X_i) \to \bigoplus_i E_n(X_i)$ is an isomorphism.
        ~~~ [homology-theory-locality]
            *Locality*: For any pushout square $\sigma$:
            $$
            \begin{xy}
            \xymatrix{
                U_{1,2} \ar[r]^{i_1} \ar[d]_{i_2} &
                U_1 \ar[d]^{j_1} \\
                U_2 \ar[r]^{j_2} &
                X
            }
            \end{xy}
            $$
            in $\sC$, the sequence
            $$
            \cdots \to
            E_{n+1}(X) \lblto{\del_{n+1}}
            E_n(U_{1,2}) \lblto{\alpha_n}
            E_n(U_1) \oplus E(U_2) \lblto{\beta_n}
            E_n(U_X) \lblto{\del_n}
            E_{n-1}(U_{1,2}) \to
            \cdots
            $$
            is exact, where here
            $$
            \alpha_n \ce (E_n(i_1),-E_n(i_2)), \quad
            \beta_n \ce E_n(j_1) + E_n(j_2).
            $$

    --- Remark [cohomology-theory-homotopy-factor]
        
        Note that the functors $E^n$ and $E_n$ in @cohomology-theory-def and @homology-theory-def automatically factor through the homotopy category $\Ho(\sC)$, as $\AbGroups$ is a discrete category.

    --- Warning [cohomology-theory-additivity-warning]
        
        Note that our additivity axioms @cohomology-theory-additivity and @homology-theory-additivity are slightly nonstandard, in that they are stated for any set of objects admitting a coproduct in $\sC$. In particular, if $\sC$ is in fact cocomplete (though we only assumed finite colimits to make the above definition), we require infinite additivity. 

    --- Remark [cohomology-theory-mayer-vietoris]
        The locality axioms @cohomology-theory-locality and @homology-theory-locality are usually named after Mayer and Vietoris, and the exact sequences there are referred to as *Mayer-Vietoris sequences*.
