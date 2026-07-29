import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

structure RightKanExtension {C D E : Type u} [Category C] [Category D] [Category E]
    (F : C ⥤ D) (G : C ⥤ E) where
  extension : D ⥤ E
  unit : G ⟶ F ⋙ extension
  universal : ∀ (H : D ⥤ E) (α : G ⟶ F ⋙ H), extension ⟹ H

def KanExtensionClosed {C D E : Type u} [Category C] [Category D] [Category E]
    (F : C ⥤ D) (G : C ⥤ E) (R : RightKanExtension F G) : Prop :=
  ∀ (H : D ⥤ E) (α : G ⟶ F ⋙ H), R.extension ≅ H

theorem right_kan_extension_closed_from_universal {C D E : Type u} [Category C] [Category D] [Category E]
    (F : C ⥤ D) (G : C ⥤ E) (R : RightKanExtension F G) : KanExtensionClosed F G R :=
  λ H α => R.universal H α

def AdjointClass (A : AdmissibleClass) : Prop := True

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse