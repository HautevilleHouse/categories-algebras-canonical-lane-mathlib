import HautevilleHouse.CategoriesAlgebrasCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure CategoryPackage where
  Obj : Type u
  Hom : Obj → Obj → Type v
  id : ∀ X : Obj, Hom X X
  comp : ∀ X Y Z : Obj, Hom X Y → Hom Y Z → Hom X Z
  idLeftProp : Prop
  idRightProp : Prop
  assocProp : Prop

structure CategoryEvidence (C : CategoryPackage) where
  idLeftClosed : C.idLeftProp
  idRightClosed : C.idRightProp
  assocClosed : C.assocProp

def CategoryClosed (C : CategoryPackage) : Prop :=
  C.idLeftProp ∧ C.idRightProp ∧ C.assocProp

theorem category_closed_from_evidence (C : CategoryPackage) (E : CategoryEvidence C) :
    CategoryClosed C := by
  exact And.intro E.idLeftClosed (And.intro E.idRightClosed E.assocClosed)

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse