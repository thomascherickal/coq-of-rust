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

(*
fn main() {
    // Create example variables
    let a = Foo::Bar;
    let b = Foo::Baz;
    let c = Foo::Qux(100);

    // Variable a matches Foo::Bar
    if let Foo::Bar = a {
        println!("a is foobar");
    }

    // Variable b does not match Foo::Bar
    // So this will print nothing
    if let Foo::Bar = b {
        println!("b is foobar");
    }

    // Variable c matches Foo::Qux which has a value
    // Similar to Some() in the previous example
    if let Foo::Qux(value) = c {
        println!("c is {}", value);
    }

    // Binding also works with `if let`
    if let Foo::Qux(value @ 100) = c {
        println!("c is one hundred");
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let a := M.alloc (| Value.StructTuple "if_let_match_enum_values::Foo::Bar" [] |) in
        let b := M.alloc (| Value.StructTuple "if_let_match_enum_values::Foo::Baz" [] |) in
        let c :=
          M.alloc (|
            Value.StructTuple "if_let_match_enum_values::Foo::Qux" [ Value.Integer 100 ]
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ := a in
                  let _ :=
                    let _ :=
                      M.alloc (|
                        M.call_closure (|
                          M.get_function (| "std::io::stdio::_print", [] |),
                          [
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::Arguments",
                                "new_const",
                                []
                              |),
                              [
                                (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                    Value.Array [ M.read (| Value.String "a is foobar
" |) ]
                                  |))
                              ]
                            |)
                          ]
                        |)
                      |) in
                    M.alloc (| Value.Tuple [] |) in
                  M.alloc (| Value.Tuple [] |)));
              fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
            ]
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ := b in
                  let _ :=
                    let _ :=
                      M.alloc (|
                        M.call_closure (|
                          M.get_function (| "std::io::stdio::_print", [] |),
                          [
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::Arguments",
                                "new_const",
                                []
                              |),
                              [
                                (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                    Value.Array [ M.read (| Value.String "b is foobar
" |) ]
                                  |))
                              ]
                            |)
                          ]
                        |)
                      |) in
                    M.alloc (| Value.Tuple [] |) in
                  M.alloc (| Value.Tuple [] |)));
              fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
            ]
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ := c in
                  let γ0_0 :=
                    M.SubPointer.get_struct_tuple_field (|
                      γ,
                      "if_let_match_enum_values::Foo::Qux",
                      0
                    |) in
                  let value := M.copy (| γ0_0 |) in
                  let _ :=
                    let _ :=
                      M.alloc (|
                        M.call_closure (|
                          M.get_function (| "std::io::stdio::_print", [] |),
                          [
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::Arguments",
                                "new_v1",
                                []
                              |),
                              [
                                (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                    Value.Array
                                      [
                                        M.read (| Value.String "c is " |);
                                        M.read (| Value.String "
" |)
                                      ]
                                  |));
                                (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                    Value.Array
                                      [
                                        M.call_closure (|
                                          M.get_associated_function (|
                                            Ty.path "core::fmt::rt::Argument",
                                            "new_display",
                                            [ Ty.path "u32" ]
                                          |),
                                          [ value ]
                                        |)
                                      ]
                                  |))
                              ]
                            |)
                          ]
                        |)
                      |) in
                    M.alloc (| Value.Tuple [] |) in
                  M.alloc (| Value.Tuple [] |)));
              fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
            ]
          |) in
        M.match_operator (|
          M.alloc (| Value.Tuple [] |),
          [
            fun γ =>
              ltac:(M.monadic
                (let γ := c in
                let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "if_let_match_enum_values::Foo::Qux",
                    0
                  |) in
                let value := M.copy (| γ0_0 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_0 |), Value.Integer 100 |) in
                let _ :=
                  let _ :=
                    M.alloc (|
                      M.call_closure (|
                        M.get_function (| "std::io::stdio::_print", [] |),
                        [
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Arguments",
                              "new_const",
                              []
                            |),
                            [
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array [ M.read (| Value.String "c is one hundred
" |) ]
                                |))
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.
