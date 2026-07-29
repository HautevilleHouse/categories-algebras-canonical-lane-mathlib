import Mathlib.CategoryTheory.Category.Basic
import Mathlib.CategoryTheory.Monad.Algebra

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure CategoriesAlgebrasSpace where
  carrier : Type u
  category : CategoryTheory.Category.{v} carrier

structure CategoriesAlgebrasAdmittedObject where
  space : CategoriesAlgebrasSpace
  monadAlgebra : Prop
  universalProperty : Prop
  algebraType : Type u
  algebraCategory : CategoryTheory.Category.{v} algebraType
  monadicity : Prop
  conclusion : monadAlgebra ∧ universalProperty ∧ monadicity

def CategoriesAlgebrasWitnessClosed (O : CategoriesAlgebrasAdmittedObject) : Prop :=
  O.monadAlgebra ∧ O.universalProperty ∧ O.monadicity

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse