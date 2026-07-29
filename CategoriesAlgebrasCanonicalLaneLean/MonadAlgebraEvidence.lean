import CategoriesAlgebrasCanonicalLaneLean.MonadAlgebraPackage

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure MonadAlgebraEvidenceTerms {M : MonadAlgebraPackage} (C : MonadAlgebraCertificate M) where
  unitLawLeft : C.unitLawLeft
  unitLawRight : C.unitLawRight
  associativityLaw : C.associativityLaw
  monadAlgebraClosed : MonadAlgebraClosed M

def MonadAlgebraCertificate.evidenceTerms {M : MonadAlgebraPackage} (C : MonadAlgebraCertificate M) :
    MonadAlgebraEvidenceTerms C := {
  unitLawLeft := C.unitLawLeftClosed
  unitLawRight := C.unitLawRightClosed
  associativityLaw := C.associativityLawClosed
  monadAlgebraClosed := monad_algebra_closed_from_evidence M C.monadAlgebraEvidence
}

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse