import CategoriesAlgebrasCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure HigherCategoryPackage where
  objectType : Type u
  morphismType : objectType → objectType → Type u
  composition : ∀ {X Y Z : objectType}, morphismType Y Z → morphismType X Y → morphismType X Z
  identity : ∀ (X : objectType), morphismType X X
  associativity : ∀ {W X Y Z : objectType} (f : morphismType W X) (g : morphismType X Y) (h : morphismType Y Z),
    composition (composition h g) f = composition h (composition g f)
  leftIdentity : ∀ {X Y : objectType} (f : morphismType X Y), composition (identity Y) f = f
  rightIdentity : ∀ {X Y : objectType} (f : morphismType X Y), composition f (identity X) = f
  
structure HigherCategoryEvidence (C : HigherCategoryPackage) where
  associativityClosed : C.associativity
  leftIdentityClosed : C.leftIdentity
  rightIdentityClosed : C.rightIdentity

def HigherCategoryClosed (C : HigherCategoryPackage) : Prop :=
  C.associativity ∧ C.leftIdentity ∧ C.rightIdentity

theorem higher_category_closed_from_evidence (C : HigherCategoryPackage) (E : HigherCategoryEvidence C) :
    HigherCategoryClosed C := by
  exact And.intro E.associativityClosed (And.intro E.leftIdentityClosed E.rightIdentityClosed)

def higher_bridge_closed (A : AdmissibleClass) : Prop :=
  HigherCategoryClosed (A.object.higherCategoryPackage)

theorem higher_bridge_from_admissible_class (A : AdmissibleClass) :
    higher_bridge_closed A := by
  sorry

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse