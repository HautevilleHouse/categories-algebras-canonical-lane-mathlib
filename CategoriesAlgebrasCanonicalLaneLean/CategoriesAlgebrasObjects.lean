import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure CategoriesAlgebrasSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CategoriesAlgebrasAdmittedObject where
  space : CategoriesAlgebrasSpace
  monoidalCategoryStructure : Prop
  algebraObject : Prop
  tensorProductDefined : Prop
  coherenceConditions : Prop
  conclusion : coherenceConditions

def CategoriesAlgebrasWitnessClosed (O : CategoriesAlgebrasAdmittedObject) : Prop :=
  O.coherenceConditions

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse