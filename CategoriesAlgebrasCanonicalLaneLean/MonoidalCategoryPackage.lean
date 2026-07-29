import HautevilleHouse.CategoriesAlgebrasCanonicalLaneLean.CategoriesAlgebrasAdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure MonoidalCategoryPackage where
  objType : Type u
  tensorProduct : objType → objType → objType
  unitObject : objType
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop

structure MonoidalCategoryEvidence (M : MonoidalCategoryPackage) where
  associatorClosed : M.associator
  leftUnitorClosed : M.leftUnitor
  rightUnitorClosed : M.rightUnitor
  pentagonIdentityClosed : M.pentagonIdentity
  triangleIdentityClosed : M.triangleIdentity

def MonoidalCategoryClosed (M : MonoidalCategoryPackage) : Prop :=
  M.associator ∧ M.leftUnitor ∧ M.rightUnitor ∧ M.pentagonIdentity ∧ M.triangleIdentity

theorem monoidal_category_closed_from_evidence (M : MonoidalCategoryPackage)
    (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M := by
  exact And.intro E.associatorClosed
    (And.intro E.leftUnitorClosed
      (And.intro E.rightUnitorClosed
        (And.intro E.pentagonIdentityClosed E.triangleIdentityClosed)))

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse