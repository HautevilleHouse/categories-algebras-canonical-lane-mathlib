import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesAlgebrasCanonicalLaneLean.CategoryAlgebra

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure AlgebraPackage (C : CategoryPackage) where
  underlyingObject : C.objects
  multiplication : C.morphisms (C.composition C.identity C.identity) (C.identity)
  unit : C.morphisms C.identity (C.identity)
  associativity : Prop
  unitLeft : Prop
  unitRight : Prop

structure AlgebraEvidence {C : CategoryPackage} (A : AlgebraPackage C) where
  associativityClosed : A.associativity
  unitLeftClosed : A.unitLeft
  unitRightClosed : A.unitRight

def AlgebraClosed {C : CategoryPackage} (A : AlgebraPackage C) : Prop :=
  A.associativity ∧ A.unitLeft ∧ A.unitRight

theorem algebra_closed_from_evidence {C : CategoryPackage} (A : AlgebraPackage C) (E : AlgebraEvidence A) : AlgebraClosed A :=
  And.intro E.associativityClosed (And.intro E.unitLeftClosed E.unitRightClosed)

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse
