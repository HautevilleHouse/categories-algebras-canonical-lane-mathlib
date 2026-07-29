import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure AlgebraicTheoryPackage where
  signature : Type u
  equations : Prop
  termAlgebra : Type u
  freeConstruction : Prop
  completeness : Prop

structure AlgebraicTheoryEvidence (T : AlgebraicTheoryPackage) where
  equationsClosed : T.equations
  freeConstructionClosed : T.freeConstruction
  completenessClosed : T.completeness

def AlgebraicTheoryClosed (T : AlgebraicTheoryPackage) : Prop :=
  T.equations ∧ T.freeConstruction ∧ T.completeness

theorem algebraic_theory_closed_from_evidence (T : AlgebraicTheoryPackage) (E : AlgebraicTheoryEvidence T) :
    AlgebraicTheoryClosed T := by
  exact And.intro E.equationsClosed (And.intro E.freeConstructionClosed E.completenessClosed)

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse