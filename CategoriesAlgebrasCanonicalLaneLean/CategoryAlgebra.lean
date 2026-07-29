import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure CategoryPackage where
  objects : Type u
  morphisms : objects → objects → Type v
  identity : (X : objects) → morphisms X X
  composition : {X Y Z : objects} → morphisms X Y → morphisms Y Z → morphisms X Z
  associativity : Prop
  identityLeft : Prop
  identityRight : Prop

structure CategoryEvidence (C : CategoryPackage) where
  associativityClosed : C.associativity
  identityLeftClosed : C.identityLeft
  identityRightClosed : C.identityRight

def CategoryClosed (C : CategoryPackage) : Prop :=
  C.associativity ∧ C.identityLeft ∧ C.identityRight

theorem category_closed_from_evidence (C : CategoryPackage) (E : CategoryEvidence C) : CategoryClosed C :=
  And.intro E.associativityClosed (And.intro E.identityLeftClosed E.identityRightClosed)

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse
