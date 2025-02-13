(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Foo";
    ty_params := [ "T" ];
    fields := [ ("data", T) ];
  } *)

Module Impl_polymorphic_associated_function_Foo_A.
  Definition Self (A : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "polymorphic_associated_function::Foo") [ A ].
  
  (*
      fn convert<B: From<A>>(self) -> Foo<B> {
          Foo {
              data: self.data.into(),
          }
      }
  *)
  Definition convert (A : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self A in
    match τ, α with
    | [ B ], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        Value.StructRecord
          "polymorphic_associated_function::Foo"
          [
            ("data",
              M.call_closure (|
                M.get_trait_method (| "core::convert::Into", A, [ B ], "into", [] |),
                [
                  M.read (|
                    M.SubPointer.get_struct_record_field (|
                      self,
                      "polymorphic_associated_function::Foo",
                      "data"
                    |)
                  |)
                ]
              |))
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_convert :
    forall (A : Ty.t),
    M.IsAssociatedFunction (Self A) "convert" (convert A).
End Impl_polymorphic_associated_function_Foo_A.

(*
fn main() {
    let foo = Foo { data: 42 };
    let bar: Foo<f64> = foo.convert();

    assert_eq!(bar.data, 42.0);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let foo :=
          M.alloc (|
            Value.StructRecord "polymorphic_associated_function::Foo" [ ("data", Value.Integer 42) ]
          |) in
        let bar :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "polymorphic_associated_function::Foo") [ Ty.path "i32" ],
                "convert",
                [ Ty.path "f64" ]
              |),
              [ M.read (| foo |) ]
            |)
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple
                [
                  M.SubPointer.get_struct_record_field (|
                    bar,
                    "polymorphic_associated_function::Foo",
                    "data"
                  |);
                  UnsupportedLiteral
                ]
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                  let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                  let left_val := M.copy (| γ0_0 |) in
                  let right_val := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                UnOp.Pure.not
                                  (BinOp.Pure.eq
                                    (M.read (| M.read (| left_val |) |))
                                    (M.read (| M.read (| right_val |) |)))
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                let kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [ Ty.path "f64"; Ty.path "f64" ]
                                    |),
                                    [
                                      M.read (| kind |);
                                      M.read (| left_val |);
                                      M.read (| right_val |);
                                      Value.StructTuple "core::option::Option::None" []
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |)))
            ]
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
