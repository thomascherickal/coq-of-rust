(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter order : (list Ty.t) -> (list Value.t) -> M.

(*
Enum Container
{
  ty_params := [];
  variants :=
    [
      {
        name := "Left";
        item := StructTuple [ Ty.path "i32" ];
        discriminant := None;
      };
      {
        name := "Right";
        item := StructTuple [ Ty.path "i32" ];
        discriminant := None;
      };
      {
        name := "Empty";
        item := StructTuple [];
        discriminant := None;
      }
    ];
}
*)

Parameter extract_value : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
