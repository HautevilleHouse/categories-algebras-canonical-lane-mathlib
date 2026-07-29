import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure CoherencePackage {M : MonoidalCategoryPackage}
    {A : AlgebraObjectPackage M} where
  macLaneCoherence : Prop
  strictificationExists : Prop
  coherenceTheoremForAlgebras : Prop

structure CoherenceEvidence {M : MonoidalCategoryPackage}
    {A : AlgebraObjectPackage M} (C : CoherencePackage M A) where
  macLaneCoherenceClosed : C.macLaneCoherence
  strictificationExistsClosed : C.strictificationExists
  coherenceTheoremForAlgebrasClosed : C.coherenceTheoremForAlgebras

def CoherenceClosed {M : MonoidalCategoryPackage}
    {A : AlgebraObjectPackage M} (C : CoherencePackage M A) : Prop :=
  C.macLaneCoherence ∧ C.strictificationExists ∧ C.coherenceTheoremForAlgebras

theorem coherence_closed_from_evidence {M : MonoidalCategoryPackage}
    {A : AlgebraObjectPackage M} (C : CoherencePackage M A)
    (E : CoherenceEvidence C) : CoherenceClosed C := by
  exact And.intro E.macLaneCoherenceClosed
    (And.intro E.strictificationExistsClosed E.coherenceTheoremForAlgebrasClosed)

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse