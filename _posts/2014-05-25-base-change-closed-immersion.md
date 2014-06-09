---
layout: text
math: true
section: blog
title: Base change of closed immersion
permalink: /base-change-closed-immersion
desc: First math post. Basic scheme theory as indicated by title.
preamble:
- [lv, 0, "\\lvert"]
- [rv, 0, "\\rvert"]
- [c, 0, "\\colon"]
- [ce, 0, "\\mathrel{:=}"]
- [ker, 0, "\\opname{ker}"]
- [supp, 0, "\\opname{supp}"]
- [O, 0, "\\mathcal{O}"]
- [I, 0, "\\mathcal{I}"]
---

Here begins my mathematical blogging. Just to get myself moving, let
me start with something short and basic: understanding closed
immersions of schemes a bit better. But I'm not going to use anything
about schemes specifically today, so let me make the following
definition.[^immersion-general]

\begin{definition}
We say a morphism $i \c Z \to X$ of locally ringed spaces is a
*closed immersion* if:

1. the underlying map of spaces $\lv Z \rv \to \lv X \rv$ induces a
   homeomorphism of $\lv X \rv$ onto a closed subset of $\lv X
   \rv$;
2. the underlying map of sheaves $\O_X \to i_*\O_Z$ is
   surjective.

Recall also that:

1. the *ideal sheaf* of $Z$ is defined as $\I \ce \ker(\O_X
   \to i_*\O_Z)$;
2. the *closed subspace* determined by $\I$ is defined as the
   locally ringed space $Z' \ce (\supp(\O_X/\I),
   \O_X/\I)$;
3. the natural map $i' \c Z' \to X$ is a closed immersion with ideal
   sheaf $\I$;
4. $i \c Z \to X$ in fact induces an isomorphism $h \c Z \to Z'$
   such that $i = i' \circ h$.
\end{definition}

\begin{lemma}{monomorphism}
If $i \c Z \to X$ is a closed immersion of locally ringed spaces,
then $i$ is a monomorphism (in the category of locally ringed
spaces).
\end{lemma}

\begin{proof}
By definition, the map of spaces $\lv Z \rv \to \lv X \rv$ is a
monomorphism and the map of sheaves $\O_X \to i_*\O_Z$ is an
epimorphism, so the claim is clear.
\end{proof}

\begin{lemma}{factoring}
Let $i \c Z \to X$ be a closed immersion of locally ringed spaces,
and let $\I$ be the corresponding ideal sheaf. Then a morphism
of locally ringed spaces $f \c Y \to X$ factors through
$i$---i.e., there exists $g \c Y \to Z$ such that $f = i \circ
g$---if and only if the induced map $f^*\I \to f^*\O_X
\iso \O_Y$ is zero. Such a factoring $g$ is unique if it
exists.
\end{lemma}

\begin{proof}
Uniqueness is immediate from $i$ being a monomorphism by
\ref{monomorphism}, so we need only prove the existence statement. As
recalled above, we can assume without loss of generality that $i$ is
the inclusion of the closed subspace $Z \ce
(\supp(\O_X/\I), \O_X/\I)$.

($\Rightarrow$) Assume $f$ factors through $i$. By definition we
have an exact sequence $0 \to \I \to \O_X \to i_*\O_Z \to
0.$ Since $i^*$ is right-exact we get an exact sequence $i^*\I
\to i^*\O_X \to i^*i_*\O_Z \to 0$, where the map $\O_Z
\iso i^*\O_X \to i^*i_*\O_Z \iso \O_Z$ is an
isomorphism. It follows that $i^*\I \to i^*\O_X$ is zero,
and since $f^* = g^* \circ i^*$ this implies $f^*\I \to
\O_Y$ is zero as well.

($\Leftarrow$) Assume $f^*\I \to \O_Y$ is zero. Let $y
\in \lv Y \rv$. Then the map on stalks $\I_{f(y)} \to
\O_{X,f(y)} \to \O_{Y,y}$ is zero. Since $\O_{X,f(y)}
\to \O_{Y,y}$ is a ring morphism this implies $\I_{f(y)} \ne
\O_{X,f(y)}$, whence $f(y) \in
\supp(\O_X/\I)$. Thus, on spaces, $\lv Y \rv \to \lv X
\rv$ factors through $\lv Z \rv$. Then by adjunction the map
$\I \to \O_X \to f_*\O_Y$ is zero, inducing a map on
sheaves $i_*\O_Z \iso \O_X/\I \to \O_Y$. This
defines the required map $g \c Y \to Z$.
\end{proof}

We have now characterised maps into closed subspaces in the way you'd
expect: a map factors through a closed subspace if and only if the
defining equations vanish on the domain space. This allows us to prove
finally that closed immersions are stable under base change, as
alluded to in the title, and moreover lets us see explicitly how the
defining ideals behave under base change.

\begin{lemma}
Let $i \c Z \to X$ be a closed immersion of locally ringed spaces,
and let $\I$ be the corresponding ideal sheaf. Let $f \c Y \to
X$ be any morphism of locally ringed spaces. Let $\I'$ be the
image of the map $f^*\I \to f^*\O_X \iso \O_Y$ and
$i' \c Z' \to Y$ the closed subspace determined by $\I'$. Then
we have a pullback diagram
\[
\begin{xy}
\xymatrix {
 Z' \ar[d]^g \ar[r]_{i'} & Y \ar[d]_f \\
 Z \ar[r]^i & X.
}
\end{xy}
\]
\end{lemma}

\begin{proof}
By \ref{factoring}, giving a morphism of locally ringed spaces $T
\to Z'$ is equivalent to giving a morphism $a \c T \to Y$ such that
the map $a^*\I' \to \O_T$ is zero. We claim this condition
is equivalent to asking that $(f \circ a)^*\I \to \O_T$ is
zero. Assuming this for the moment, this in turn is equivalent by
\ref{factoring} to giving a morphism $b \c T \to Z$ such that $f
\circ a = i \circ b$. Thus $Z'$ satisfies the necessary universal
property (in particular the morphism $g$ is determined by the
identity $Z' \to Z'$, i.e. it is the morphism $b$ corresponding to
$a = i'$).

To prove the claim assumed above, consider $(f \circ a)^*\I
\iso a^*f^*\I \to a^*\I' \to \O_T$. By definition
$f^*\I \to \I'$ is surjective, so since $a^*$ is
right-exact $(f \circ a)^*\I \to a^*I'$ is surjective,
hence an epimorphism. It is then immediate that $(f \circ a)^*\I
\to \O_T$ is zero if and only if $a^*\I' \to \O_T$ is
zero.
\end{proof}


[^immersion-general]:
    Though it suffices for this post, I'm pretty sure one wouldn't
    actually want to use this definition in general. In fact, I'm
    curious to know a correct, general notion of closed immersion.

    The only setting other than the algebraic one where I'm certain
    the sheaf-theoretic perspective is really prominent is complex
    analysis, so this point got me to glance at [Grauert-Remmert's
    *Coherent Analytic Sheaves*][grauert-remmert]. From there I've
    gathered that complex analytic spaces are built locally out of
    closed subspaces of opens $U \subseteq \mathbb{C}^n$ which are cut
    out by finitely generated ideals of the sheaf of holomorphic
    functions on $U$. By [a theorem of Oka][oka] we can equivalently
    require that the ideals are coherent. So I'm guessing more
    generally one should require of a closed immersion of complex
    analytic spaces that it be cut out by a *finite type* or
    *coherent* ideal sheaf. (Of course this is just a complete guess
    based on a superficial reading of some definitions, so I'm still
    curious...)

    The [Stacks project][stacks-closed-immersion] requires that the
    ideal sheaf be locally generated by sections, but this doesn't
    give the finiteness condition for the analytic setting. Lurie
    gives an amazingly general definition in [DAG IX][dag-ix], which I
    can't currently parse. It seems like it's supposed to work for the
    (derived) analytic setting too, since it's treated in the paper.

    To be honest, I would hope there's a general principle of what a
    closed immersion/subspace should mean, but it also seems a little
    crazy that it could automagically encode a finiteness
    condition. That was a long footnote.



[grauert-remmert]: //books.google.com/books/about/Coherent_Analytic_Sheaves.html?id=HyCFQgAACAAJ
[oka]: //en.wikipedia.org/wiki/Oka_coherence_theorem
[stacks-closed-immersion]: //stacks.math.columbia.edu/tag/01HK
[dag-ix]: //www.math.harvard.edu/~lurie/papers/DAG-IX.pdf