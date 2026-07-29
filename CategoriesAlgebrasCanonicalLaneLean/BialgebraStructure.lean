import CategoriesAlgebrasCanonicalLaneLean.MonoidalCategoryAlgebra

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure BialgebraStructure {C : CategoryAlgebra} (M : MonoidalCategoryAlgebra C) where
  comultiplication : C.algebra → C.algebra
  counit : C.algebra → C.algebra
  coassociativity : ∀ a : C.algebra, tensorProduct (comultiplication a) (id) (comultiplication a) = comultiplication (tensorProduct a) (comultiplication a)
  leftCounit : ∀ a : C.algebra, tensorProduct (counit a) (id) (comultiplication a) = a
  rightCounit : ∀ a : C.algebra, tensorProduct (id) (counit a) (comultiplication a) = a
  compatibility : ∀ a b : C.algebra, comultiplication (C.multiplication a b) = C.multiplication (comultiplication a) (comultiplication b) ∧ counit (C.multiplication a b) = C.multiplication (counit a) (counit b)

structure BialgebraStructureEvidence {C : CategoryAlgebra} {M : MonoidalCategoryAlgebra C} (B : BialgebraStructure M) where
  coassociativityClosed : B.coassociativity
  leftCounitClosed : B.leftCounit
  rightCounitClosed : B.rightCounit
  compatibilityClosed : B.compatibility

def BialgebraStructureClosed {C : CategoryAlgebra} {M : MonoidalCategoryAlgebra C} (B : BialgebraStructure M) : Prop :=
  B.coassociativity ∧ B.leftCounit ∧ B.rightCounit ∧ B.compatibility

theorem bialgebra_structure_closed_from_evidence {C : CategoryAlgebra} {M : MonoidalCategoryAlgebra C} (B : BialgebraStructure M) (E : BialgebraStructureEvidence B) :
    BialgebraStructureClosed B := by
  exact And.intro E.coassociativityClosed (And.intro E.leftCounitClosed (And.intro E.rightCounitClosed E.compatibilityClosed))

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse