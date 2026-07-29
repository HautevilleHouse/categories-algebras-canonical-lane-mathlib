import CategoriesAlgebrasCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure AlgebraicStructurePackage where
  underlyingType : Type u
  multiplication : underlyingType → underlyingType → underlyingType
  unit : underlyingType
  associativity : ∀ x y z : underlyingType, multiplication (multiplication x y) z = multiplication x (multiplication y z)
  leftIdentity : ∀ x : underlyingType, multiplication unit x = x
  rightIdentity : ∀ x : underlyingType, multiplication x unit = x

structure AlgebraicStructureEvidence (A : AlgebraicStructurePackage) where
  associativityClosed : A.associativity
  leftIdentityClosed : A.leftIdentity
  rightIdentityClosed : A.rightIdentity

def AlgebraicStructureClosed (A : AlgebraicStructurePackage) : Prop :=
  A.associativity ∧ A.leftIdentity ∧ A.rightIdentity

theorem algebraic_structure_closed_from_evidence (A : AlgebraicStructurePackage) (E : AlgebraicStructureEvidence A) :
    AlgebraicStructureClosed A := by
  exact And.intro E.associativityClosed (And.intro E.leftIdentityClosed E.rightIdentityClosed)

def algebraic_bridge_closed (A : AdmissibleClass) : Prop :=
  AlgebraicStructureClosed (A.object.algebraicPackage)

theorem algebraic_bridge_from_admissible_class (A : AdmissibleClass) :
    algebraic_bridge_closed A := by
  sorry

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse