import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure EnrichedCategoryPackage where
  baseCategory : Type u
  baseCategoryStructure : CategoryPackage
  enrichedObjects : Type v
  enrichedMorphisms : Type w
  composition : enrichedMorphisms → enrichedMorphisms → enrichedMorphisms
  associativity : Prop
  identity : enrichedObjects → enrichedMorphisms
  identityLaws : Prop

structure EnrichedCategoryEvidence (E : EnrichedCategoryPackage) where
  associativityClosed : E.associativity
  identityLawsClosed : E.identityLaws

def EnrichedCategoryClosed (E : EnrichedCategoryPackage) : Prop :=
  E.associativity ∧ E.identityLaws

theorem enriched_category_closed_from_evidence (E : EnrichedCategoryPackage) (Ev : EnrichedCategoryEvidence E) :
    EnrichedCategoryClosed E := by
  exact And.intro Ev.associativityClosed Ev.identityLawsClosed

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse