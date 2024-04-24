# ⊥'tsh, a dependently timed drum machine language

It is customary for digital audio workstations such as Pro Tools and Ableton
Live to support grid-editing sequence programming interfaces. These
interfaces, naturally trade off rhythmic expressibility for syntactically
enforced constraints on duration and alignment.

The syntactic nature of these constraints, mean that they must be made up
front. For instance, one must speculatively introduce a grid coarseness
_before_ programming a sequence, and changing this choice requires heavy
refactoring.

Interestingly, a programming language does not need to make this trade off,
as dependent types can be used to enforce temporal constraints. In this way,
we can provide metric freedom without sacrificing said temporal constraints.
Furthermore, the constraints can be introduced _after_ programming the
sequence.

In this talk I will present ⊥'tsh: an Agda-embedded domain specific
programming language for programming drum loop sequences, allowing the
programmer to focus on music first, and only worry about grids later.
