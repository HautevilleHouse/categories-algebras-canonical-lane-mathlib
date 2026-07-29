import CategoriesAlgebrasCanonicalLaneLean.CategoryAlgebraStructure

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure GroupoidAlgebra (C : CategoryAlgebra) where
  groupoid : Type u
  inversion : C.algebra → C.algebra
  involution : ∀ a : C.algebra, multiplication a (inversion a) = C.unit ∧ multiplication (inversion a) a = C.unit
  groupoidActionInv : ∀ a : C.algebra, ∀ x : C.category, C.categoryAction (inversion a) (C.categoryAction a x) = x ∧ C.categoryAction a (C.categoryAction (inversion a) x) = x

structure GroupoidAlgebraEvidence {C : CategoryAlgebra} (G : GroupoidAlgebra C) where
  involutionClosed : G.involution
  groupoidActionInvClosed : G.groupoidActionInv

def GroupoidAlgebraClosed {C : CategoryAlgebra} (G : GroupoidAlgebra C) : Prop :=
  G.involution ∧ G.groupoidActionInv

theorem groupoid_algebra_closed_from_evidence {C : CategoryAlgebra} (G : GroupoidAlgebra C) (E : GroupoidAlgebraEvidence G) :
    GroupoidAlgebraClosed G := by
  exact And.intro E.involutionClosed E.groupoidActionInvClosed

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse