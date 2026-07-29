import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Category.Basic
import Mathlib.Algebra.Group.Defs

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure CategorySpace where
  carrier : Type u
  category : CategoryTheory.Category.{v} carrier

structure CategoryAdmittedObject where
  space : CategorySpace
  algebraStructure : Prop
  monoidalClosed : Prop
  conclusion : algebraStructure ∧ monoidalClosed

def CategoryWitnessClosed (O : CategoryAdmittedObject) : Prop :=
  O.algebraStructure ∧ O.monoidalClosed

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse
