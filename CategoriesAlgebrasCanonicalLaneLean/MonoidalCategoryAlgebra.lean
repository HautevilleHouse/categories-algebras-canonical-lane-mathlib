import CategoriesAlgebrasCanonicalLaneLean.CategoryAlgebraStructure

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure MonoidalCategoryAlgebra (C : CategoryAlgebra) where
  tensorProduct : C.algebra → C.algebra → C.algebra
  associator : ∀ a b c : C.algebra, tensorProduct (tensorProduct a b) c ≅ tensorProduct a (tensorProduct b c)
  leftUnitor : ∀ a : C.algebra, tensorProduct C.unit a ≅ a
  rightUnitor : ∀ a : C.algebra, tensorProduct a C.unit ≅ a
  pentagon : ∀ a b c d : C.algebra, (associator a b c ▷ d) ∘ associator a (tensorProduct b c) d ∘ (a ◁ associator b c d) = associator (tensorProduct a b) c d ∘ associator a b (tensorProduct c d)
  triangle : ∀ a b : C.algebra, (a ◁ leftUnitor b) ∘ associator a C.unit b = rightUnitor a ▷ b

structure MonoidalCategoryAlgebraEvidence {C : CategoryAlgebra} (M : MonoidalCategoryAlgebra C) where
  pentagonClosed : M.pentagon
  triangleClosed : M.triangle

def MonoidalCategoryAlgebraClosed {C : CategoryAlgebra} (M : MonoidalCategoryAlgebra C) : Prop :=
  M.pentagon ∧ M.triangle

theorem monoidal_category_algebra_closed_from_evidence {C : CategoryAlgebra} (M : MonoidalCategoryAlgebra C) (E : MonoidalCategoryAlgebraEvidence M) :
    MonoidalCategoryAlgebraClosed M := by
  exact And.intro E.pentagonClosed E.triangleClosed

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse