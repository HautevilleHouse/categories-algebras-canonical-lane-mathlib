import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure FreeCategoryPackage where
  underlyingGraph : Type u
  vertices : Type v
  edges : Type w
  source : edges → vertices
  target : edges → vertices
  freeMorphisms : Type x
  concatenation : freeMorphisms → freeMorphisms → freeMorphisms
  associativity : Prop
  identityExists : Prop

structure FreeCategoryEvidence (F : FreeCategoryPackage) where
  associativityClosed : F.associativity
  identityExistsClosed : F.identityExists

def FreeCategoryClosed (F : FreeCategoryPackage) : Prop :=
  F.associativity ∧ F.identityExists

theorem free_category_closed_from_evidence (F : FreeCategoryPackage) (E : FreeCategoryEvidence F) :
    FreeCategoryClosed F := by
  exact And.intro E.associativityClosed E.identityExistsClosed

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse