(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn checked_division(dividend: i32, divisor: i32) -> Option<i32> {
    if divisor == 0 {
        // Failure is represented as the `None` variant
        None
    } else {
        // Result is wrapped in a `Some` variant
        Some(dividend / divisor)
    }
}
*)
Definition checked_division (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ dividend; divisor ] =>
    ltac:(M.monadic
      (let dividend := M.alloc (| dividend |) in
      let divisor := M.alloc (| divisor |) in
      M.read (|
        M.match_operator (|
          M.alloc (| Value.Tuple [] |),
          [
            fun γ =>
              ltac:(M.monadic
                (let γ :=
                  M.use (M.alloc (| BinOp.Pure.eq (M.read (| divisor |)) (Value.Integer 0) |)) in
                let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                M.alloc (| Value.StructTuple "core::option::Option::None" [] |)));
            fun γ =>
              ltac:(M.monadic
                (M.alloc (|
                  Value.StructTuple
                    "core::option::Option::Some"
                    [ BinOp.Panic.div (| Integer.I32, M.read (| dividend |), M.read (| divisor |) |)
                    ]
                |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn try_division(dividend: i32, divisor: i32) {
    // `Option` values can be pattern matched, just like other enums
    match checked_division(dividend, divisor) {
        None => println!("{} / {} failed!", dividend, divisor),
        Some(quotient) => {
            println!("{} / {} = {}", dividend, divisor, quotient)
        }
    }
}
*)
Definition try_division (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ dividend; divisor ] =>
    ltac:(M.monadic
      (let dividend := M.alloc (| dividend |) in
      let divisor := M.alloc (| divisor |) in
      M.read (|
        M.match_operator (|
          M.alloc (|
            M.call_closure (|
              M.get_function (| "option::checked_division", [] |),
              [ M.read (| dividend |); M.read (| divisor |) ]
            |)
          |),
          [
            fun γ =>
              ltac:(M.monadic
                (let _ :=
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
                                    M.read (| Value.String "" |);
                                    M.read (| Value.String " / " |);
                                    M.read (| Value.String " failed!
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
                                        [ Ty.path "i32" ]
                                      |),
                                      [ dividend ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ divisor ]
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ, "core::option::Option::Some", 0 |) in
                let quotient := M.copy (| γ0_0 |) in
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
                                    M.read (| Value.String "" |);
                                    M.read (| Value.String " / " |);
                                    M.read (| Value.String " = " |);
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
                                        [ Ty.path "i32" ]
                                      |),
                                      [ dividend ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ divisor ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ quotient ]
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn main() {
    try_division(4, 2);
    try_division(1, 0);

    // Binding `None` to a variable needs to be type annotated
    let none: Option<i32> = None;
    let _equivalent_none = None::<i32>;

    let optional_float = Some(0f32);

    // Unwrapping a `Some` variant will extract the value wrapped.
    println!(
        "{:?} unwraps to {:?}",
        optional_float,
        optional_float.unwrap()
    );

    // Unwrapping a `None` variant will `panic!`
    println!("{:?} unwraps to {:?}", none, none.unwrap());
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "option::try_division", [] |),
              [ Value.Integer 4; Value.Integer 2 ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "option::try_division", [] |),
              [ Value.Integer 1; Value.Integer 0 ]
            |)
          |) in
        let none := M.alloc (| Value.StructTuple "core::option::Option::None" [] |) in
        let _equivalent_none := M.alloc (| Value.StructTuple "core::option::Option::None" [] |) in
        let optional_float :=
          M.alloc (|
            Value.StructTuple "core::option::Option::Some" [ M.read (| UnsupportedLiteral |) ]
          |) in
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "" |);
                              M.read (| Value.String " unwraps to " |);
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
                                  "new_debug",
                                  [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "f32" ] ]
                                |),
                                [ optional_float ]
                              |);
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_debug",
                                  [ Ty.path "f32" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "f32" ],
                                        "unwrap",
                                        []
                                      |),
                                      [ M.read (| optional_float |) ]
                                    |)
                                  |)
                                ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "" |);
                              M.read (| Value.String " unwraps to " |);
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
                                  "new_debug",
                                  [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ] ]
                                |),
                                [ none ]
                              |);
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_debug",
                                  [ Ty.path "i32" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ],
                                        "unwrap",
                                        []
                                      |),
                                      [ M.read (| none |) ]
                                    |)
                                  |)
                                ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
