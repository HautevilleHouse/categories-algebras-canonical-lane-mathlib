import CategoriesAlgebrasCanonicalLaneLean.BialgebraStructure

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure HopfAlgebraStructure {C : CategoryAlgebra} {M : MonoidalCategoryAlgebra C} (B : BialgebraStructure M) where
  antipode : C.algebra → C.algebra
  antipodeCompatibility : ∀ a : C.algebra, C.multiplication (antipode a) a = C.multiplication (B.counit a) C.unit ∧ C.multiplication a (antipode a) = C.multiplication (B.counit a) C.unit
  antipodeCoalgebraMorphism : ∀ a : C.algebra, B.comultiplication (antipode a) = tensorProduct (antipode a) (antipode a) (B.comultiplication a) ∧ B.counit (antipode a) = B.counit a

structure HopfAlgebraStructureEvidence {C : CategoryAlgebra} {M : MonoidalCategoryAlgebra C} {B : BialgebraStructure M} (H : HopfAlgebraStructure B) where
  antipodeCompatibilityClosed : H.antipodeCompatibility
  antipodeCoalgebraMorphismClosed : H.antipodeCoalgebraMorphism

def HopfAlgebraStructureClosed {C : CategoryAlgebra} {M : MonoidalCategoryAlgebra C} {B : BialgebraStructure M} (H : HopfAlgebraStructure B) : Prop :=
  H.antipodeCompatibility ∧ H.antipodeCoalgebraMorphism

theorem hopf_algebra_structure_closed_from_evidence {C : CategoryAlgebra} {M : MonoidalCategoryAlgebra C} {B : BialgebraStructure M} (H : HopfAlgebraStructure B) (E : HopfAlgebraStructureEvidence H) :
    HopfAlgebraStructureClosed H := by
  exact And.intro E.antipodeCompatibilityClosed E.antipodeCoalgebraMorphismClosed

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse