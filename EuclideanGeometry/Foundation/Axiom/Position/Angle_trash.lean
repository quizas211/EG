import EuclideanGeometry.Foundation.Axiom.Position.Angle

namespace EuclidGeom

variable {P : Type _} [EuclideanPlane P]

theorem sin_pos_iff_angle_pos (A : Angle P) : 0 < Real.Angle.sin A.value ↔ A.value.IsPos := sorry

theorem end_ray_todir_rev_todir_of_ang_rev_ang {ang₁ ang₂ : Angle P} (hs : ang₁.start_ray.toDir = (ang₂.start_ray).reverse.toDir) (h : ang₁.value = ang₂.value) : ang₁.end_ray.toDir = (ang₂.end_ray).reverse.toDir := sorry

theorem start_ray_todir_rev_todir_of_ang_rev_ang {ang₁ ang₂ : Angle P} (hs : ang₁.end_ray.toDir = (ang₂.end_ray).reverse.toDir) (h : ang₁.value = ang₂.value) : ang₁.start_ray.toDir = (ang₂.start_ray).reverse.toDir := sorry

theorem angle_value_eq_angle {A : P} {ray : Ray P} (h : A ≠ ray.1) : (Angle.mk_ray_pt ray A h).value = Vec_nd.angle ray.2.toVec_nd (VEC_nd ray.source A h) := sorry

theorem ang_eq_ang_of_todir_rev_todir {ang₁ ang₂ : Angle P} (hs : ang₁.start_ray.toDir = - ang₂.start_ray.toDir) (he : ang₁.end_ray.toDir = - ang₂.end_ray.toDir) : ang₁.value = ang₂.value := sorry

theorem eq_ang_of_lieson_lieson {A A' B B' O: P} (h₁ : A ≠ O) (h₂ : B ≠ O) (h₁' : A' ≠ O) (h₂' : B' ≠ O) (LiesInt1 : A' LiesInt (RAY O A h₁) )  (LiesInt2 :  B' LiesInt (RAY O B h₂) ) : ANG A O B h₁ h₂ = ANG A' O B' h₁' h₂' := sorry

theorem neg_value_of_rev_ang {A B O: P} (h₁ : A ≠ O) (h₂ : B ≠ O) : ∠ A O B h₁ h₂ = -∠ B O A h₂ h₁ := sorry

namespace Angle

theorem end_ray_eq_start_ray_mul_value {ang : Angle P} : ang.end_ray.toDir = ang.start_ray.toDir * ang.value.toDir := sorry

theorem ang_source_eq_end_ray_source {ang : Angle P} : ang.source = ang.end_ray.source := sorry

def mk_start_ray (ang : Angle P) (ray : Ray P) (h : ang.source = ray.source) : Angle P := Angle.mk ang.start_ray ray h

def mk_ray_end (ang : Angle P) (ray : Ray P) (h : ang.source = ray.source) : Angle P := Angle.mk ray ang.end_ray (by rw[h.symm, ang_source_eq_end_ray_source])

theorem value_eq_angdiff {ray₁ : Ray P} {ray₂ : Ray P} (h: ray₁.source = ray₂.source) : (Angle.mk ray₁ ray₂ h).value = Dir.AngDiff ray₁.toDir ray₂.toDir := sorry

theorem mk_start_ray_value_eq_angdiff {ang : Angle P} {ray : Ray P} (h : ang.source = ray.source) : (Angle.mk_start_ray ang ray h).value = Dir.AngDiff ang.start_ray.toDir ray.toDir := sorry

theorem mk_ray_end_value_eq_angdiff {ang : Angle P} {ray : Ray P} (h : ang.source = ray.source) : (Angle.mk_ray_end ang ray h).value = Dir.AngDiff ray.toDir ang.end_ray.toDir := sorry

def reverse (ang: Angle P) : Angle P := Angle.mk ang.end_ray ang.start_ray ang.source_eq_source.symm

theorem ang_source_rev_eq_source {ang : Angle P} : ang.reverse.source = ang.source := by
  rw [ang.reverse.ang_source_eq_end_ray_source]
  rw [ang.ang_source_eq_end_ray_source]
  exact ang.source_eq_source

theorem ang_value_rev_eq_neg_value {ang : Angle P} :  ang.reverse.value = - ang.value := by
  unfold value DirObj.AngDiff Dir.AngDiff reverse
  simp

theorem pi_ang_rev_is_pi {ang : Angle P} (pi : ang.value = π ) :  ang.reverse.value = π  := by simp[ang_value_rev_eq_neg_value, pi]

end Angle

end EuclidGeom
