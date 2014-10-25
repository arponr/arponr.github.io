---
layout: text
math: true
section: math
date: 2014-10-25 16:30:00 -0500
title: "Pulling back a Galois correspondence"
permalink: /galois-pull-back
desc: A general principle that comes up in local class field theory.
preamble:
- [inj, 0, '\hookrightarrow']
- [Sub, 0, '\opname{Sub}']
- [Gal, 0, '\opname{Gal}']
- [Stab, 0, '\opname{Stab}']
- [ab, 0, '\mathrm{ab}']
- [Ab, 0, '\mathrm{Ab}']

---

-- Definition: For $G$ a topological group, we denote by $\Sub_G$ the
   set of open normal subgroups of $G$, which is a poset under
   inclusion.

-- Proposition #main: Let $G$ be a profinite group. Suppose we have a
   morphism of topological groups $\phi \c A \to G$ such that for
   every $N \in \Sub_G$ the induced map $\phi_N \c A/\phi^{-1}(N) \to
   G/N$ is an isomorphism. Then:

   -- #preimage-injective: the preimage map $\Sub_G \to \Sub_A$,
      defined by $N \mapsto \phi^{-1}(N)$, is injective;
   -- #join-preserved: $\phi^{-1}(N_1N_2) =
      \phi^{-1}(N_1)\phi^{-1}(N_2)$ for $N_1,N_2 \in \Sub_G$.

   -- Proof: Let $N_1,N_2 \in \Sub_G$. To prove #preimage-injective It
      suffices to show that $N_1 \subseteq N_2$ if $\phi^{-1}(N_1)
      \subseteq \phi^{-1}(N_2)$, so assume the latter. Then

      $$ #intersection-preserved
      \phi^{-1}(N_1 \cap N_2) = \phi^{-1}(N_1) \cap \phi^{-1}(N_2) =
      \phi^{-1}(N_2).
      $$

      Now consider the commutative diagram

      $$
      \begin{xy}
      \xymatrix{
        A \ar[d]^\phi \ar[r] &
        A/\phi^{-1}(N_1 \cap N_2) \ar[d]^{\phi_{N_1 \cap N_2}} \ar[r]
          &
        A/\phi^{-1}(N_2) \ar[d]^{\phi_{N_2}} \\
        G \ar[r] &
        G/(N_1 \cap N_2) \ar[r] &
        G/N_2
      }
      \end{xy}
      $$

      with the horizontal maps the projections. In the right-hand
      square, the vertical maps are isomorphisms by hypothesis, and
      the top horizontal map is an isomorphism by
      #intersection-preserved; thus the bottom horizontal map is an
      isomorphism, which implies $N_1 \subseteq N_2$.

      We now prove #join-preserved. Certainly $\phi^{-1}(N_1N_2)
      \supseteq \phi^{-1}(N_1)\phi^{-1}(N_2)$. And it's fairly easy to
      see we have the sequence of identifications

      $$
      \frac{\phi^{-1}(N_1)\phi^{-1}(N_2)}{\phi^{-1}(N_1)} \iso
      \frac{\phi^{-1}(N_2)}{\phi^{-1}(N_1) \cap \phi^{-1}(N_2)} =
      \frac{\phi^{-1}(N_2)}{\phi^{-1}(N_1 \cap N_2)} =
      \phi_{N_1 \cap N_2}^{-1}\l( \frac{N_1}{N_1 \cap N_2} \r) \iso 
      \phi_{N_1}^{-1}\l( \frac{N_1N_2}{N_1} \r) =
      \frac{\phi^{-1}(N_1N_2)}{\phi^{-1}(N_1)}.
      $$

      But since $\phi^{-1}(N_1)$ has finite index in $A$, it follows that

      $$
      [\phi^{-1}(N_1N_2) : \phi^{-1}(N_1)\phi^{-1}(N_2)] =
      \l[ \frac{\phi^{-1}(N_1N_2)}{\phi^{-1}(N_1)} :
      \frac{\phi^{-1}(N_1)\phi^{-1}(N_2)}{\phi^{-1}(N_1)} \r] = 1,
      $$

      proving the desired claim.

-- Example: If we take $G$ to be a Galois group in #main, then the
   proposition says that when we have a suitable morphism $A \to G$,
   the Galois theory described by $G$ is in fact controlled by
   $A$. This is what I meant by "pulling back a Galois correspondence"
   in the title. Let's state this in more detail in the motivating
   example.

   Let $K$ be a non-archimedean local field. Let $K^\ab$ be a maximal
   abelian extension of $K$. The Galois group $G \ce \Gal(K^\ab/K)$ is
   a profinite group, and Galois theory tells us that the poset
   $\Sub_G$ is anti-equivalent to the poset $\Ab_K$ of finite abelian
   extensions of $K$, i.e. the set of finite subextensions of $K^\ab$
   ordered by inclusion.[^1] The "reciprocity" statement in local
   class field theory asserts:

   -- the existence of a morphism $\phi_K \c K^\times \to
      \Gal(K^\ab/K)$ satisfying the hypothesis of #main;
   -- if $N \ce \Stab_L \in \Sub_G$ is the subgroup corresponding to a
      finite abelian extension $K \inj L$, then $\phi_K^{-1}(N)$ is
      the *norm group* $N_{L/K}(L^\times) \subseteq K^\times$.

   Thus, putting #main and Galois theory together gives us that the
   poset $\Ab_K$ is anti-equivalent to the poset of norm groups in
   $K^\times$ by the correspondence $L \mapsto
   N_{L/K}(L^\times)$. Then there is an "existence" theorem in local
   class field theory stating that the norm groups are precisely the
   open subgroups of finite index in $K^\times$.

[^1]: I just made up this terminology, who cares. What I mean is when
      you view the posets as categories, there is a contravariant
      equivalence.
