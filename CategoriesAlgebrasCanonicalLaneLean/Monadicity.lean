import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure Monad (C : Type u) [Category C] where
  endofunctor : C ⥤ C
  unit : 𝟙 C ⟶ endofunctor
  multiplication : endofunctor ⋙ endofunctor ⟶ endofunctor
  associativity : (multiplication ▷ endofunctor) ≫ multiplication = (endofunctor ◁ multiplication) ≫ multiplication
  leftUnit : (unit ▷ endofunctor) ≫ multiplication = (ρ_ endofunctor).hom
  rightUnit : (endofunctor ◁ unit) ≫ multiplication = (λ_ endofunctor).hom

def EM-Category (C : Type u) [Category C] (T : Monad C) : Type u :=
  Σ (X : C), T.endofunctor.obj X ⟶ X

theorem monadicity_criterion (C : Type u) [Category C] (T : Monad C) :
    Nonempty (IsEquivalence (comparisonFunctor T)) :=
  sorry

def MonadAdmissible (A : AdmissibleClass) : Prop := True

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse