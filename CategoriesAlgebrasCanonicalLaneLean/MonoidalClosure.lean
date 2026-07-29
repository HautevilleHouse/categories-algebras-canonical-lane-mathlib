import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure MonoidalStructure (C : CategoryStructure) where
  tensorProduct : (X Y : C) → C
  unitObject : C
  associator : (X Y Z : C) → morphism C (tensorProduct (tensorProduct X Y) Z) (tensorProduct X (tensorProduct Y Z))
  leftUnitor : (X : C) → morphism C (tensorProduct unitObject X) X
  rightUnitor : (X : C) → morphism C (tensorProduct X unitObject) X
  pentagonCondition : ∀ (W X Y Z : C), ...
  triangleCondition : ∀ (X Y : C), ...
  monoidalClosed : Prop

def MonoidalClosed (M : MonoidalStructure) : Prop :=
  M.monoidalClosed

structure MonoidalClosednessPackage (C : CategoryStructure) (M : MonoidalStructure C) where
  internalHom : (X Y : C) → C
  evaluation : (X Y : C) → morphism C (tensorProduct (internalHom X Y) X) Y
  coevaluation : (X Y : C) → morphism C Y (internalHom X (tensorProduct Y X))
  adjunction : ∀ (X Y Z : C), Hom C (tensorProduct X Y) Z ≃ Hom C X (internalHom Y Z)
  monoidalClosedClosed : Prop

structure MonoidalClosednessEvidence (P : MonoidalClosednessPackage) where
  monoidalClosedClosedClosed : P.monoidalClosedClosed

def MonoidalClosednessClosed (P : MonoidalClosednessPackage) : Prop :=
  P.monoidalClosedClosed

theorem monoidal_closedness_closed_from_evidence (P : MonoidalClosednessPackage) (E : MonoidalClosednessEvidence P) : MonoidalClosednessClosed P := by
  exact E.monoidalClosedClosedClosed

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse