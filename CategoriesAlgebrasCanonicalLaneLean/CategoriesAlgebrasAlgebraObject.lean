import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure AlgebraObjectPackage {M : MonoidalCategoryPackage} where
  underlyingObject : Type u
  multiplication : Type v
  unitMap : Type w
  associativityCondition : Prop
  unitCondition : Prop

structure AlgebraObjectEvidence {M : MonoidalCategoryPackage}
    (A : AlgebraObjectPackage M) where
  associativityConditionClosed : A.associativityCondition
  unitConditionClosed : A.unitCondition

def AlgebraObjectClosed {M : MonoidalCategoryPackage}
    (A : AlgebraObjectPackage M) : Prop :=
  A.associativityCondition ∧ A.unitCondition

theorem algebra_object_closed_from_evidence {M : MonoidalCategoryPackage}
    (A : AlgebraObjectPackage M) (E : AlgebraObjectEvidence A) :
    AlgebraObjectClosed A := by
  exact And.intro E.associativityConditionClosed E.unitConditionClosed

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse