import canonicalLaneMathlib.MathlibObjects
import Mathlib.CategoryTheory.Monoidal.Braided

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure MonoidalCategoryPackage where
  tensorProduct : Type u → Type u → Type u
  unitObject : Type u
  associator : ∀ (X Y Z : Type u), (X ⊗ Y) ⊗ Z ≅ X ⊗ (Y ⊗ Z)
  leftUnitor : ∀ (X : Type u), unitObject ⊗ X ≅ X
  rightUnitor : ∀ (X : Type u), X ⊗ unitObject ≅ X
  braiding : ∀ (X Y : Type u), X ⊗ Y ≅ Y ⊗ X
  pentagonCondition : Prop
  triangleCondition : Prop
  hexagonCondition : Prop

structure MonoidalCategoryEvidence (M : MonoidalCategoryPackage) where
  pentagonConditionClosed : M.pentagonCondition
  triangleConditionClosed : M.triangleCondition
  hexagonConditionClosed : M.hexagonCondition

def MonoidalCategoryClosed (M : MonoidalCategoryPackage) : Prop :=
  M.pentagonCondition ∧ M.triangleCondition ∧ M.hexagonCondition

theorem monoidal_category_closed_from_evidence (M : MonoidalCategoryPackage)
    (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M := by
  exact And.intro E.pentagonConditionClosed
    (And.intro E.triangleConditionClosed E.hexagonConditionClosed)

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse
