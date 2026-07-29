import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure FunctoredAlgebraPackage where
  functorCategory : Type u
  underlyingCategory : Type v
  algebraObject : Type w
  algebraMorphism : Type x
  functorAction : algebraObject → functorCategory → algebraObject
  unitMap : underlyingCategory → algebraObject
  multiplicationMap : algebraObject → algebraObject → algebraObject
  associativity : Prop
  unitality : Prop
  functoriality : Prop

structure FunctoredAlgebraEvidence (F : FunctoredAlgebraPackage) where
  associativityClosed : F.associativity
  unitalityClosed : F.unitality
  functorialityClosed : F.functoriality

def FunctoredAlgebraClosed (F : FunctoredAlgebraPackage) : Prop :=
  F.associativity ∧ F.unitality ∧ F.functoriality

theorem functored_algebra_closed_from_evidence (F : FunctoredAlgebraPackage)
    (E : FunctoredAlgebraEvidence F) : FunctoredAlgebraClosed F := by
  exact And.intro E.associativityClosed
    (And.intro E.unitalityClosed E.functorialityClosed)

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse