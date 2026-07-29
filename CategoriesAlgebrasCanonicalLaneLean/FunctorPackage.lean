import HautevilleHouse.CategoriesAlgebrasCanonicalLaneLean.CategoryPackage

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure FunctorPackage (C D : CategoryPackage) where
  objectMap : C.Obj → D.Obj
  morphismMap : ∀ X Y : C.Obj, C.Hom X Y → D.Hom (objectMap X) (objectMap Y)
  preservesIdProp : Prop
  preservesCompProp : Prop

structure FunctorEvidence {C D : CategoryPackage} (F : FunctorPackage C D) where
  preservesIdClosed : F.preservesIdProp
  preservesCompClosed : F.preservesCompProp

def FunctorClosed {C D : CategoryPackage} (F : FunctorPackage C D) : Prop :=
  F.preservesIdProp ∧ F.preservesCompProp

theorem functor_closed_from_evidence {C D : CategoryPackage} (F : FunctorPackage C D)
    (E : FunctorEvidence F) : FunctorClosed F := by
  exact And.intro E.preservesIdClosed E.preservesCompClosed

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse