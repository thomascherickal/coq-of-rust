(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
Enum Foo
{
  ty_params := [];
  variants :=
    [
      {
        name := "Bar";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Baz";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Qux";
        item := StructTuple [ Ty.path "u32" ];
        discriminant := None;
      }
    ];
}
*)

Parameter main : (list Ty.t) -> (list Value.t) -> M.
