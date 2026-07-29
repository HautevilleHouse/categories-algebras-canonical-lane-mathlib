import HautevilleHouse.CategoriesAlgebrasCanonicalLaneLean.MonoidalCategoryPackage

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure AlgebraObjectPackage {M : MonoidalCategoryPackage} where
  underlyingObject : M.objType
  multiplication : M.tensorProduct underlyingObject underlyingObject → M.objType
  unit : M.unitObject → M.objType
  associativityLaw : Prop
  unitLaw : Prop

structure AlgebraObjectEvidence {M : MonoidalCategoryPackage}
    (A : AlgebraObjectPackage M) where
  associativityLawClosed : A.associativityLaw
  unitLawClosed : A.unitLaw

def AlgebraObjectClosed {M : MonoidalCategoryPackage} (A : AlgebraObjectPackage M) : Prop :=
  A.associativityLaw ∧ A.unitLaw

theorem algebra_object_closed_from_evidence {M : MonoidalCategoryPackage}
    (A : AlgebraObjectPackage M) (E : AlgebraObjectEvidence A) : AlgebraObjectClosed A := by
  exact And.intro E.associativityLawClosed E.unitLawClosed

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse