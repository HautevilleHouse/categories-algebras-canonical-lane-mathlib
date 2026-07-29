import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure MonoidAlgebraPackage where
  monoid : Type u
  multiplication : monoid → monoid → monoid
  unit : monoid
  associativity : Prop
  identityLeft : Prop
  identityRight : Prop
  linearCombinations : Type v
  algebraStructure : Prop

structure MonoidAlgebraEvidence (M : MonoidAlgebraPackage) where
  associativityClosed : M.associativity
  identityLeftClosed : M.identityLeft
  identityRightClosed : M.identityRight
  algebraStructureClosed : M.algebraStructure

def MonoidAlgebraClosed (M : MonoidAlgebraPackage) : Prop :=
  M.associativity ∧ M.identityLeft ∧ M.identityRight ∧ M.algebraStructure

theorem monoid_algebra_closed_from_evidence (M : MonoidAlgebraPackage) (E : MonoidAlgebraEvidence M) :
    MonoidAlgebraClosed M := by
  exact And.intro E.associativityClosed (And.intro E.identityLeftClosed (And.intro E.identityRightClosed E.algebraStructureClosed))

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse