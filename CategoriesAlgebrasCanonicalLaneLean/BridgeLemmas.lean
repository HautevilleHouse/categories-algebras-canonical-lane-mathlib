import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesAlgebrasCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CategoriesAlgebrasWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoriesAlgebrasCanonicalLaneLean
end HautevilleHouse