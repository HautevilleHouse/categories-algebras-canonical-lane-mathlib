import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure MonoidalCategoryPackage where
  category : Type u
  tensorProduct : Type v
  unitObject : Type w
  associatorNatural : Prop
  leftUnitorNatural : Prop
  rightUnitorNatural : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop

structure MonoidalCategoryEvidence (M : MonoidalCategoryPackage) where
  associatorNaturalClosed : M.associatorNatural
  leftUnitorNaturalClosed : M.leftUnitorNatural
  rightUnitorNaturalClosed : M.rightUnitorNatural
  pentagonIdentityClosed : M.pentagonIdentity
  triangleIdentityClosed : M.triangleIdentity

def MonoidalCategoryClosed (M : MonoidalCategoryPackage) : Prop :=
  M.associatorNatural ∧ M.leftUnitorNatural ∧ M.rightUnitorNatural ∧
  M.pentagonIdentity ∧ M.triangleIdentity

theorem monoidal_category_closed_from_evidence (M : MonoidalCategoryPackage)
    (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M := by
  exact And.intro E.associatorNaturalClosed
    (And.intro E.leftUnitorNaturalClosed
      (And.intro E.rightUnitorNaturalClosed
        (And.intro E.pentagonIdentityClosed E.triangleIdentityClosed)))

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse