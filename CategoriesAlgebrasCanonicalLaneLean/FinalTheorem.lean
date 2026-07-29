import CategoriesAlgebrasCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

def ConstrainedCategoriesAlgebrasClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_categories_algebras_endgame (A : AdmissibleClass) :
    ConstrainedCategoriesAlgebrasClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse