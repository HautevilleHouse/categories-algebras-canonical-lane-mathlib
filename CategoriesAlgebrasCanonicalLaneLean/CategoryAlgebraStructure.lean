import CategoriesAlgebrasCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure CategoryAlgebra where
  category : Type u
  algebra : Type v
  multiplication : algebra → algebra → algebra
  unit : algebra
  associativity : ∀ x y z : algebra, multiplication (multiplication x y) z = multiplication x (multiplication y z)
  leftUnit : ∀ x : algebra, multiplication unit x = x
  rightUnit : ∀ x : algebra, multiplication x unit = x
  categoryAction : algebra → category → category
  actionDistributivity : ∀ a b : algebra, ∀ x : category, categoryAction (multiplication a b) x = categoryAction a (categoryAction b x)

structure CategoryAlgebraEvidence (C : CategoryAlgebra) where
  associativityClosed : C.associativity
  leftUnitClosed : C.leftUnit
  rightUnitClosed : C.rightUnit
  actionDistributivityClosed : C.actionDistributivity

def CategoryAlgebraClosed (C : CategoryAlgebra) : Prop :=
  C.associativity ∧ C.leftUnit ∧ C.rightUnit ∧ C.actionDistributivity

theorem category_algebra_closed_from_evidence (C : CategoryAlgebra) (E : CategoryAlgebraEvidence C) :
    CategoryAlgebraClosed C := by
  exact And.intro E.associativityClosed (And.intro E.leftUnitClosed (And.intro E.rightUnitClosed E.actionDistributivityClosed))

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse