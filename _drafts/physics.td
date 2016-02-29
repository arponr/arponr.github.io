---
layout: post
math: true
title: Physics
tags:
- math
- physics
---

*Classical mechanics* is a formalism for describing the dynamics of systems of particles at the macroscopic scale. The formalism is governed by three main principles:

# Principle of states @princ-states
The *state space* of a classical system is *phase space* $M = \lR^{2d}$, with coordinates $(q_j,p_j) = (q_1,\ldots,q_d,p_1,\ldots,p_d)$ representing $d$ *position* variables and $d$ *momentum* variables. States, i.e. positions in phase space, can be thought of as initial conditions for trajectories in the system.

# Principle of observables @princ-observables
*Observables* of a classical system are given by (smooth) functions $M \to \lR$ on the state space.

# Principle of dynamics @princ-dynamics
There is a distinguished observable of a classical system, called the *Hamiltonian* and denoted $h$, such that time evolution of states in the system $(q_j,p_j) \in \cH$ is given by
$$
\dot q_j = \f{\partial h}{\partial p_j}
\quad\text{and}\quad
\dot p_j = -\f{\partial h}{\partial q_j}.
$$
More generally, for an observable $f \c M \to \lR$ we have (by the chain rule)
$$
\dot f = \sum_{j=1}^d \l(
\f{df}{dq_j}\f{\partial h}{\partial p_j} -
\f{df}{dp_j}\f{\partial h}{\partial q_j} \r)
\ec \{f, h\}.
$$
The operation $\{-,-\}$ is called the *Poisson bracket*, and is bilinear, anti-symmetric, and satisfies the Jacobi identity, giving the space of observables the structure of a Lie algebra.

# Example
For simplicity take $d=1$ so our coordinates are $(p,q) \in M$. Consider a particle of mass $m$ subject to a potential $V(q)$. The Hamiltonian is given by the total energy
$$
h = \f{p^2}{2m} + V(q).
$$
Then the formalism above recovers good old Newtonian mechanics:
$$
\dot q = \f{p}{m}
\quad\text{and}\quad
\dot p = - \frac{\partial V}{\partial q}.
$$




*Quantum mechanics* is a formalism for describing the dynamics of systems of particles at the atomic scale. The formalism is governed by three main principles:

# Principle of states @princ-states
The *state space* of a quantum-mechanical system is a complex Hilbert space $\cH$.

# Principle of observables @princ-observables
*Observables* of a quantum mechanical system are given by self-adjoint linear operators on the state space $A \c \cH \to \cH$.

# Principle of dynamics @princ-dynamics
There is a distinguished observable of a quantum-mechanical system, called the *Hamiltonian* and denoted $H$, such that time evolution of states $\psi(t) \in \cH$ is given by the *Schrödinger equation*:
$$
\dot\psi(t) = -i H \psi(t).
$$
Assuming $H$ is time-independent, this is solved by $\psi(t) = U(t)\psi(0)$ for $U(t) \ce e^{-iHt}$.

This perspective where the states evolve over time is known as the *Schrödinger picture*. We can alternatively describe the time evolution of operators $A(t) \c \cH \to \cH$, giving what is known as the *Heisenberg picture*, as follows. Since $U(t) \c \cH \to \cH$ describes evolution of states in time, we should have $A(t)= U(t)^{-1} A(0) U(t)$. The Schrödinger equation, which is equivalent to $\dot U(t) = -iH U(t)$, then gives that
$$
\dot A(t) = [A(t), -iH],
$$
 where $[X,Y] \ce XY - YX$ is the commutator.
 
 
 
 
 Observables in quantum mechanics are given by self-adjoint, i.e. hermitian, operators $A \c \cH \to \cH$ on the state space $\cH$. One way natural observables arise is through representations of Lie groups and algebras, as follows.

# Construction: observables from representations @rep-observ

Let $G$ be a Lie group. Let $\kg$ be its Lie algebra. Suppose given a unitary representation of $G$ on our state space $\cH$, i.e. a map $\rho \c G \to \rU(\cH)$. This determines a representation of Lie algebras (by taking the differential at the identity elements) $\rho' \c \kg \to \ku(\cH)$. Recall that there is an identification $\gl(\cH) \iso \End(\cH)$, which identifies $\ku(\cH)$ with the space of *skew-hermitian* operators on $\cH$. Now, if $B \in \ku(\cH)$ is a skew-hermitian operator, then $-iB$ is a hermitian operator. Thus for each $x \in \kg$ our representation gives rise to an observable $-i\rho'(x)$.

# Example: time and the Hamiltonian @time-hamiltonian

Whenever we have a system, time evolution should give a representation $U \c \lR \to \GL(\cH)$. The (time-independent) Schrödinger equation, i.e. the principle governing quantum-mechanical dynamics, is roughly equivalent to requiring that $U$ be a unitary representation. More precisely, Stone's theorem on one-parameter unitary groups tells us that the representation $U$ is of the form $t \mapsto e^{-itH}$ for a unique self-adjoint operator $H$ on $\cH$ (i.e. Schrödinger's equation is satisfied) if and only if $U$ is unitary and satisfies a continuity hypothesis (is *strongly continuous*). (Note however that the operator $H$ may be *unbounded*, i.e. only defined on a dense subspace of $\cH$, and thus the exponential above must be defined using spectral theory.) In this quantum-mechanical situation, the unitary representation $U$ gives rise to the Lie algebra representation $\lR \to \ku(\cH)$ generated by $U'(0) = -iH$, and hence by the recipe of @rep-observ determines the observable $H$, the Hamiltonian.

## Subexample: time-translation of functions @time-translation

For a simple but illustrative example of the relationship between time and the Hamiltonian described above, take $\cH$ to be the space of functions $L^2(\lR)$ on the real line. If we think of the real line here as parameterizing time, then time evolution $U(t)$ should map a function $f(s)$ to the function $f(s-t)$.
