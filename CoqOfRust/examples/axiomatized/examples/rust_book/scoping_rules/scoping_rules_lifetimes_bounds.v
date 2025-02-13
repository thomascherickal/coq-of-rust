(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Ref";
    ty_params := [ "T" ];
    fields := [ Ty.apply (Ty.path "&") [ T ] ];
  } *)

Module Impl_core_fmt_Debug_where_core_fmt_Debug_T_for_scoping_rules_lifetimes_bounds_Ref_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "scoping_rules_lifetimes_bounds::Ref") [ T ].
  
  Parameter fmt : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "core::fmt::Debug"
      (Self T)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method (fmt T)) ].
End Impl_core_fmt_Debug_where_core_fmt_Debug_T_for_scoping_rules_lifetimes_bounds_Ref_T.

Parameter print : (list Ty.t) -> (list Value.t) -> M.

Parameter print_ref : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
