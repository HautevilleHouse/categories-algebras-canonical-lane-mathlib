import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure AdjunctionPackage (C D : CategoryStructure) where
  leftAdjoint : (X : C) → D
  rightAdjoint : (Y : D) → C
  unit : (X : C) → morphism C X (rightAdjoint (leftAdjoint X))
  counit : (Y : D) → morphism D (leftAdjoint (rightAdjoint Y)) Y
  triangleLeft : ∀ (X : C), compose (counit (leftAdjoint X)) (leftAdjoint (unit X)) = identity (leftAdjoint X)
  triangleRight : ∀ (Y : D), compose (rightAdjoint (counit Y)) (unit (rightAdjoint Y)) = identity (rightAdjoint Y)
  adjunctionClosed : Prop

structure AdjunctionEvidence (A : AdjunctionPackage) where
  adjunctionClosedClosed : A.adjunctionClosed

def AdjunctionClosed (A : AdjunctionPackage) : Prop :=
  A.adjunctionClosed

theorem adjunction_closed_from_evidence (A : AdjunctionPackage) (E : AdjunctionEvidence A) : AdjunctionClosed A := by
  exact E.adjunctionClosedClosed

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse