---
layout: text
math: true
section: math
title: "Structures on manifolds"
permalink: /structures-on-manifolds
desc: Working out the details of the "structures" one can put on
      manifolds when studying their bordism classes.
preamble:
- [l, 0, "\\left"]
- [r, 0, "\\right"]
- [f, 0, "\\frac"]
- [c, 0, "\\colon"]
- [ce, 0, "\\mathrel{:=}"]
- [ec, 0, "\\mathrel{=:}"]
- [wt, 0, "\\widetilde"]
- [id, 0, "\\opname{id}"]
- [colim, 0, "\\opname{colim}"]
- [dim, 0, "\\opname{dim}"]
- [R, 0, "\\mathbb{R}"]
- [uR, 0, "\\underline{\\mathbb{R}}"]
- [N, 0, "\\mathbf{N}"]
---

I'm trying to learn some stable homotopy theory this summer, and am
starting out by reading about bordism. My first goal is to understand
Thom's computation of the unoriented bordism ring, i.e., the
classification of unoriented compact smooth manifolds up to
bordism. I've been following a couple of sets of notes by [Haynes
Miller][miller] and [Tom Weston][weston]. I'm hoping to keep my own
detailed notes along the way, which I'll probably put up at the end of
the summer. But I'll try to post about some of it here as I go, too.

This post is the result of me getting rather confused about the
various bordism problems about "strucured" manifolds, and is
essentially just an attempt to sort out how I should think about these
"structures". The structure comes from the stable normal bundle, so we
begin there.

\begin{notation}
Let $TM$ denote the tangent bundle of a smooth manifold $M$.
\end{notation}

\begin{definition}{normal-bundle}
Let $i \c M \to N$ be an immersion of smooth manifolds. The *normal
bundle* $\nu_i$ of $i$ (or of $M$ in $N$) is the vector bundle on $M$
defined by the short exact sequence $0 \to TM \to i^*TN \to \nu_i \to
0$.
\end{definition}

\begin{proposition}{normal-composition}
Let $i \c L \to M$ and $j \c M \to N$ be immersions of smooth
manifolds. Let $k \ce j \circ i$. Then there is a short exact sequence
\[
0 \to \nu_i \to \nu_k \to i^*\nu_j \to 0
\]
of bundles on $L$.
\end{proposition}

\begin{proof}
Since pullback of vector bundles is exact we have
\[
i^*\nu_j \iso i^*\l(\f{j^*TN}{TM}\r) \iso \f{k^*TN}{i^*TM} \iso
\f{k^*TN/TL}{i^*TM/TL} \iso \f{\nu_k}{\nu_i}.
\]
\end{proof}

\begin{definition}{stable-normal}
Let $M$ be a compact smooth manifold. Let $[\xi] \in [M, BO]$ be the
homotopy class classifying the tangent bundle $TM \to M$ (stably). The
*stable normal bundle* $\nu_M$ of $M$ is defined as the inverse of
$[\xi]$ in the group $[M, BO] \iso \wt{KO}(M)$.
\end{definition}

\begin{remark}{normal-classifies-stable}
Note if $i \c M \to \R^n$ is an immersion (which always exists!) then
by definition we have a short exact sequence
\[
0 \to TM \to i^*T\R^n \to \nu_i \to 0.
\]
Since $T\R^n$ is trivial it follows that $\nu_i$ is inverse to $TM$ in
$\wt{KO}(M)$. Thus the stable classifying map $M \to BO$ of $\nu_i$
determines the homotopy class of the stable normal bundle $\nu_M$
(hence the terminology). But note that, by definition, $\nu_M$ does
not depend on the choice of dimension $n$ and immersion $i$.
\end{remark}

\begin{notation}
Suppose we have maps $a,b,c \c X \to Y$. We denote a homotopy $h \c X
\times I \to Y$ from $a$ to $b$ by by $h \c a \to b$. We denote the
composition of homotopies $h \c a \to b$ and $k \c b \to c$ by $k *
h$.
\end{notation}

\begin{definitions}{f-structure-prelim}
Let $f \c B \to BO$ be any map and $g \c M \to BO$ a map from a
compact smooth manifold $M$. An *$f$-structure* on $g$ is an
equivalence class of homotopy lifts $(\bar g, h)$ of $g$, where

- a *homotopy lift* of $g$ is a map $\bar g \c M \to B$ and a homotopy
  $h \c f \circ \bar g \to g$;
- two pairs $(\bar g_1, h_1)$ and $(\bar g_2, h_2)$ are equivalent if
  and only if there is a homotopy $\bar h \c \bar g_1 \to \bar g_2$
  such that $h_2 * (f \circ \bar h) = h_1$.
\end{definitions}

\begin{lemma}{f-structure-bijection}
Let $f \c B \to BO$ and $g \c M \to BO$ as in
\ref{f-structure-prelim}. Then:

1. a homotopy $k \c g \to g'$ determines a bijection $\theta_k$
   between the $f$-structures on $g$ and $g'$;
2. if $k' \c g' \to g''$ is another homotopy, then the bijections
   determined by $k$, $k'$, and $k'' \ce k' * k$ commute:
   \[
   \begin{xy}
   \xymatrix {
     \{f\text{-structures on }g\} \ar@{<->}[r]_{\theta_k}
     \ar@{<->}[dr]_{\theta_{k''}} &
     \{f\text{-structures on }g'\} \ar@{<->}[d]_{\theta_{k'}} \\
     & \{f\text{-structures on }g''\}.
   }
   \end{xy}
   \]
\end{lemma}

\begin{proof}
It suffices to simply give any maps $\theta_k$ satisfying (ii), since
then bijectivity is immediate from taking inverse homotopies. Let $k
\c g \to g'$ be a homotopy. There is a map from homotopy lifts of $g$
to homotopy lifts of $g'$ via $(\bar g, h) \mapsto (\bar g, k *
h)$. This evidently respects the equivalence relation so this descends
to give the map $\theta_k$. Property (ii) then clearly holds.
\end{proof}

\begin{definitions}{f-structure}
Let $f \c B \to BO$ be a map and $\xi \in [M, BO]$ a stable vector
bundle on a compact smooth manifold $M$. An *$f$-structure* on $\xi$
is an equivalence class of pairs $(g,\sigma)$, where

- $g$ is a map $M \to BO$ classifying $\xi$, i.e. $[g] = \xi$, and
  $\sigma$ is an $f$-structure on $g$;
- two pairs $(g,\sigma)$ and $(g',\sigma')$ are equivalent if and only
  if there is a homotopy $k \c g \to g'$ such that $\sigma' =
  \theta_k(\sigma)$; here $\theta_k$ is as defined by
  \ref{f-structure-bijection}, which also shows that this is in fact
  an equivalence relation.

An *$f$-structure* on $M$ is an $f$-structure on its stable normal
bundle $\nu_M$.
\end{definitions}

\begin{remarks}{f-structure-reform}
Note, since the $\theta_k$ are bijections, \ref{f-structure} is
equivalent to saying that an $f$-structure on $\xi$ is an
$f$-structure on $g$ for any fixed $g \c M \to BO$ clasifying $\xi$.
In the case that $f$ is a fibration we may reformulate this
further. Fix a $g \c M \to BO$ classifying $\xi$.

Let $\sigma$ be an $f$-structure on $g$ determined by a homotopy lift
$(\bar g, h)$. The homotopy $h \c f \circ \bar g \to g$ can be lifted,
since $f$ is a fibration, to a homotopy $\bar h \c \bar g \to \bar g'$
so that we have equality $f \circ \bar g' = g$ on the nose. By
\ref{f-structure-prelim}, $\bar h$ gives an equivalence between the
homotopy lifts $(\bar g, h)$ and $(\bar g', \id_g)$, where $\id_g$ is
the constant homotopy.

So any $f$-structure $\sigma$ has a representative $(\bar g, h)$
where $h = \id_g$. Observe that two lifts $(\bar g_1, \id_g)$ and
$(\bar g_2, \id_g)$ are equivalent if and only if there is a homotopy
$\bar h \c \bar g_1 \to \bar g_2$ such that $f \circ \bar h =
\id_g$, which precisely says that $\bar h$ is a *fibrewise
homotopy*. So finally, we may say (when $f$ is a fibration) that an
$f$-structure on $\xi$ is a fibrewise homotopy class of
lifts $\bar g$ in the diagram
\begin{equation}{f-structure-lift}
\begin{xy}
\xymatrix {
  & B \ar[d]_{f} \\
  M \ar@{-->}[ur]^{\bar g} \ar[r]^g & BO;
}
\end{xy}
\end{equation}
remember that here $g$ is any fixed map $M \to BO$ classifying $\xi$,
and these lifts are on the nose, not up to homotopy.
\end{remarks}

\begin{examples}{f-examples}
Why should we care about fibrations $B \to BO$? Well, maybe the
primary class of examples will answer that. Whenever we have a
morphism of topological groups $\phi \c G \to O$ we get a fibration $f
\ce B\phi \c BG \to BO$. In particular if we have a sequence of
morphisms
\[
\begin{xy}
\xymatrix {
  G(0) \ar[r] \ar[d] & G(1) \ar[r] \ar[d] & G(2) \ar[r] \ar[d] &
  \cdots \ar[d] \\
  O(0) \ar[r] & O(1) \ar[r] & O(2) \ar[r] & \cdots
}
\end{xy}
\]
we get a morphism $\colim_n G(n) \ec G \to O \ce \colim_n O(n)$.

Now, let' consider \ref{f-structure} in the situation of a map $f \c
BG \to BO$. What is a homotopy lift $(\bar g, h)$ of a map $g \c M \to
BO$? Well $\bar g \c M \to BG$ classifies a principal $G$-bundle, and
the homotopy $h \c f \circ \bar g \to g$ specifies a reduction to $G$
of the structure group of the stable bundle $\xi$ classified by
$g$. And two homotopy lifts are equivalent when they induce isomorphic
reductions to $G$. Thus, for this class of examples, an $f$-structure
on a stable bundle $\xi$ is precisely an isomorphism class of
reductions of $\xi$ to a $G$-bundle.

So in this situation we will abusively refer to $f$-structures (on
bundles and manifolds) as *$G$-structures*. Here are some important
subexamples:

1. The most basic case comes from the identity $\id \c O \to O$,
   inducing $f = \id \c BO \to BO$. It is immediate from the
   reformulated definition of $f$-structures in
   \ref{f-structure-reform} that very vector bundle on a compact
   smooth manifold, and hence every compact smooth manifold, has a
   unique $O$-structure. (And of course you'd expect there to be a
   unique reduction of structure group from $O$ to $O$.)
2. Slightly less trivially we have the inclusion $SO \to O$ coming
   from the inclusions $SO(n) \to O(n)$. This induces the two-to-one
   cover $BSO \to BO$ arising from a choice of orientation. Indeed an
   $SO$-structure on a manifold is precisely an orientation. Given the
   discussion above, this should be believable, since giving an
   orientation on a $k$-dimensional is equivalent to giving a
   reduction of structure group to $SO(k)$. But we're working stably
   so there are some more details to this. We'll work through these
   details below since for me this example provides the most
   intuition.
3. The inclusions $U(n) \to O(2n)$ give a morphism $U \to O$ and hence
   a fibration $BU \to BO$. A $U$-structure on a manifold is called an
   *almost-complex structure*. This gives rise to the setting of
   complex bordism, which is supposed to be extremely important;
   hopefully I will be posting about that later on this summer.
\end{examples}

For the remainder let $M$ denote a compact smooth manifold and $f \c
BSO \to BO$ the map discussed in \ref{f-examples}. We'll finish the
post by proving that $SO$-structures and orientations on $M$ are the
same thing, as promised above.

\begin{lemma}{normal-orient}
Let $i \c M \to \R^n$ be an immersion. Then giving an orientation on
$M$ is equivalent to giving an orientation on the normal bundle
$\nu_i$.
\end{lemma}

\begin{proof}
By \ref{normal-bundle} of $\nu_i$ we have an exact sequence $0 \to TM
\to i^*T\R^n \to \nu_i \to 0$. There is a canonical trivialisation and
orientation of $T\R^n$, so orienting $\nu_i$ is equivalent to
orienting $TM$. But it is well known that giving an orientation on $M$
is equivalent to giving an orientation on $TM$, so then we're done.
\end{proof}

\begin{proposition}{SO-orientation}
Giving an $SO$-structure on $M$ is equivalent to giving an orientation
on $M$.
\end{proposition}

\begin{proof}
Fix an immersion $i \c M \to \R^n$. Let $p \ce \dim(\nu_i)$ Let $g_0
\c M \to BO(p)$ be a map classifying $\nu_i$ and let $g$ be the
composition $M \to BO(p) \to BO$. Recall from
\ref{normal-classifies-stable} that $[g] = \nu_M$, and hence by
\ref{f-structure-reform} that giving an $SO$-structure on $M$ is
equivalent to giving an $SO$-structure on $g$. Combining this with
\ref{normal-orient}, we just left to show that giving an
$SO$-structure on $g$ is equivalent to giving an orientation on
$\nu_i$.

($\Rightarrow$) Suppose we have an $SO$-structure $\sigma$ on $g$,
represented by a homotopy lift $(\bar g, h)$. Since $M$ is compact,
and hence $M \times I$ is compact too, there must be some finite $q
\in \N$ such that the map $\bar g \c M \to BSO$ factors through
$BSO(q)$ and the homotopy $h \c f \circ \bar g \to g$ factors through
$BO(q)$. In particular we have that the factoring $g \c M \to BO(q)$
classifies the vector bundle $\nu_i \oplus \uR^{q-p}$, where $\uR$
denotes the one-dimensional trivial bundle. Now the map $M \to BSO(q)$
classifies an oriented vector bundle $\mu$ and the homotopy $h$ gives
an isomorphism of unoriented vector bundles $\mu \iso \nu_i \oplus
\uR^{q-p}$. With this isomorphism, the orientation on $\mu$ determines
an orientation on $\nu_i \oplus \uR^{q-p}$, and since $\uR^{q-p}$ is
canonically oriented this specifies an orientation on $\nu_i$.

We need to check this does not depend on the representative $(\bar g,
h)$. Note that taking $q$ larger in the previous paragraph does not
affect the resulting orientation on $\nu_i$ since the map $BSO(q) \to
BSO(q+1)$ by definition classifies $\xi \mapsto \xi \oplus \uR$ with
$\uR$ given its canonical orientation. Thus, given another
representing pair $(\bar g', h')$ of $\sigma$ we may also assume $\bar
g'$ factors through $BSO(q)$ and $h$ factors through $BO(q)$. Since
$(\bar g, h)$ and $(\bar g', h')$ are equivalent homotopy lifts we by
definition have a homotopy $\bar h \c \bar g \to \bar g'$ such that
$h' * (f \circ \bar h) = h$. I.e., if $\bar g' \c M \to BSO(q)$
classifies the oriented bundle $\mu'$, then we have specified an
isomorphism $\mu \iso \mu'$ of oriented vector bundles which commutes
with the (unoriented) isomorphisms $\mu \iso \nu_i \oplus \uR^{q-p}$
and $\mu' \iso \nu_i \oplus \uR^{q-p}$. It follows that the induced
orientations on $\nu_i$ will agree.

($\Leftarrow$) Suppose we have an orientation on $\nu_i$. This is
equivalent to specifying a reduction of structure group of $\nu_i$ to
$SO(p)$, that is, an oriented $p$-dimensional vector bundle $\mu$ and
an isomorphism of unoriented bundles $\alpha \c \mu \iso \nu_i$. Of
course this is equivalent to a map $\bar g_0 \c M \to BSO(p)$ and a
homotopy $h_0 \c f \circ \bar g_0 \to g_0$. By composing with the maps
$BSO(p) \to BSO$ and $BO(p) \to BO$ we get a homotopy lift $(\bar g,
h)$ of $g$ defining an $SO$-structure on $g$.

We need to check this does not depend on the choice of $\mu$ and
$\alpha$. Clearly another oriented bundle $\mu'$ and isomorphism
$\alpha' \c \mu' \iso \nu_i$ induces the same orientation on $\nu_i$
if and only if there is an isomorphism $\beta \c \mu \iso \mu'$ of
oriented bundles such that $\alpha' \circ \beta = \alpha$. If $\mu'$
and $\alpha'$ correspond to a map $\bar g_0' \c M \to BSO(p)$ and
homotopy $h_0' \c f \circ \bar g_0' \to g_0$ this is equivalent to
asking for a homotopy $\bar h \c \bar g_0 \to \bar g_0'$ such that
$h_0' * (f \circ \bar h) = h_0$. Again composing with $BSO(p) \to BSO$
and $BO(p) \to BO$, this precisely determines an equivalence of the
homotopy lifts $(\bar g, h)$ and $(\bar g', h')$. Hence the resulting
$SO$-structure is well-defined.

The two constructions are evidently mutually inverse, so we win.
\end{proof}
    
\begin{remark}
Hopefully the argument in \ref{SO-orientation} has made it more clear
why we always need to specify our homotopy $f \circ \bar g \to g$, and
why the notion of equivalence of homotopy lifts is as it is in
\ref{f-structure-prelim}. In particular, observe that the commuting
condition on homotopies in the equivalence of homotopy lifts is
absolutely key. For example, suppose $\eta$ is an orientable bundle
and $\xi \iso \eta$ an isomorphism of unoriented bundles. The two
orientations on $\eta$ might in fact give isomorphic oriented bundles,
but tautologically won't induce the same orientation on $\xi$ via the
isomorphism $\xi \iso \eta$. In this case the necessary commuting
condition isn't satisfied. (Note, the two orientations on any
orientable bundle are always *stably* isomorphic, since multiplication
by $-1$ on $\uR$ gives an orientation reversing isomorphism $\eta
\oplus \uR \iso \eta \oplus \uR$.)
\end{remark}



[miller]: //www-math.mit.edu/~hrm/papers/cobordism.pdf
[weston]: //www.math.umass.edu/~weston/oldpapers/cobord.pdf