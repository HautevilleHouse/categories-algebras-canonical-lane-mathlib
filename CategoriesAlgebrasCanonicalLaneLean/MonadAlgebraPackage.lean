import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure MonadAlgebraPackage where
  monad : Type u → Type u
  algebraType : Type u
  unitMap : algebraType → monad algebraType
  multiplicationMap : monad (monad algebraType) → monad algebraType
  unitLawLeft : Prop
  unitLawRight : Prop
  associativityLaw : Prop

structure MonadAlgebraEvidence (M : MonadAlgebraPackage) where
  unitLawLeftClosed : M.unitLawLeft
  unitLawRightClosed : M.unitLawRight
  associativityLawClosed : M.associativityLaw

def MonadAlgebraClosed (M : MonadAlgebraPackage) : Prop :=
  M.unitLawLeft ∧ M.unitLawRight ∧ M.associativityLaw

theorem monad_algebra_closed_from_evidence (M : MonadAlgebraPackage) (E : MonadAlgebraEvidence M) :
    MonadAlgebraClosed M := by
  exact And.intro E.unitLawLeftClosed (And.intro E.unitLawRightClosed E.associativityLawClosed)

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse