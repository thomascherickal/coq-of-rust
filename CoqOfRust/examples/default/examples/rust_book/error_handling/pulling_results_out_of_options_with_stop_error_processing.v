(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn double_first(vec: Vec<&str>) -> Result<Option<i32>, ParseIntError> {
    let opt = vec.first().map(|first| first.parse::<i32>().map(|n| 2 * n));

    opt.map_or(Ok(None), |r| r.map(Some))
}
*)
Definition double_first (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ vec ] =>
    ltac:(M.monadic
      (let vec := M.alloc (| vec |) in
      M.read (|
        let opt :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "core::option::Option")
                  [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ],
                "map",
                [
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ];
                  Ty.function
                    [
                      Ty.tuple
                        [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ]
                    ]
                    (Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
                ]
              |),
              [
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply (Ty.path "slice") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                    "first",
                    []
                  |),
                  [
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::ops::deref::Deref",
                        Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global"
                          ],
                        [],
                        "deref",
                        []
                      |),
                      [ vec ]
                    |)
                  ]
                |);
                M.closure
                  (fun γ =>
                    ltac:(M.monadic
                      match γ with
                      | [ α0 ] =>
                        M.match_operator (|
                          M.alloc (| α0 |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let first := M.copy (| γ |) in
                                M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.apply
                                      (Ty.path "core::result::Result")
                                      [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ],
                                    "map",
                                    [
                                      Ty.path "i32";
                                      Ty.function [ Ty.tuple [ Ty.path "i32" ] ] (Ty.path "i32")
                                    ]
                                  |),
                                  [
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "str",
                                        "parse",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ M.read (| M.read (| first |) |) ]
                                    |);
                                    M.closure
                                      (fun γ =>
                                        ltac:(M.monadic
                                          match γ with
                                          | [ α0 ] =>
                                            M.match_operator (|
                                              M.alloc (| α0 |),
                                              [
                                                fun γ =>
                                                  ltac:(M.monadic
                                                    (let n := M.copy (| γ |) in
                                                    BinOp.Panic.mul (|
                                                      Integer.I32,
                                                      Value.Integer 2,
                                                      M.read (| n |)
                                                    |)))
                                              ]
                                            |)
                                          | _ => M.impossible (||)
                                          end))
                                  ]
                                |)))
                          ]
                        |)
                      | _ => M.impossible (||)
                      end))
              ]
            |)
          |) in
        M.alloc (|
          M.call_closure (|
            M.get_associated_function (|
              Ty.apply
                (Ty.path "core::option::Option")
                [
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ]
                ],
              "map_or",
              [
                Ty.apply
                  (Ty.path "core::result::Result")
                  [
                    Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                    Ty.path "core::num::error::ParseIntError"
                  ];
                Ty.function
                  [
                    Ty.tuple
                      [
                        Ty.apply
                          (Ty.path "core::result::Result")
                          [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ]
                      ]
                  ]
                  (Ty.apply
                    (Ty.path "core::result::Result")
                    [
                      Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                      Ty.path "core::num::error::ParseIntError"
                    ])
              ]
            |),
            [
              M.read (| opt |);
              Value.StructTuple
                "core::result::Result::Ok"
                [ Value.StructTuple "core::option::Option::None" [] ];
              M.closure
                (fun γ =>
                  ltac:(M.monadic
                    match γ with
                    | [ α0 ] =>
                      M.match_operator (|
                        M.alloc (| α0 |),
                        [
                          fun γ =>
                            ltac:(M.monadic
                              (let r := M.copy (| γ |) in
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.apply
                                    (Ty.path "core::result::Result")
                                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ],
                                  "map",
                                  [
                                    Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                                    Ty.function
                                      [ Ty.path "i32" ]
                                      (Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ])
                                  ]
                                |),
                                [
                                  M.read (| r |);
                                  M.constructor_as_closure "core::option::Option::Some"
                                ]
                              |)))
                        ]
                      |)
                    | _ => M.impossible (||)
                    end))
            ]
          |)
        |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn main() {
    let numbers = vec!["42", "93", "18"];
    let empty = vec![];
    let strings = vec!["tofu", "93", "18"];

    println!("The first doubled is {:?}", double_first(numbers));
    println!("The first doubled is {:?}", double_first(empty));
    println!("The first doubled is {:?}", double_first(strings));
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let numbers :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "slice") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                "into_vec",
                [ Ty.path "alloc::alloc::Global" ]
              |),
              [
                (* Unsize *)
                M.pointer_coercion
                  (M.read (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::boxed::Box")
                          [
                            Ty.apply (Ty.path "array") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "42" |);
                              M.read (| Value.String "93" |);
                              M.read (| Value.String "18" |)
                            ]
                        |)
                      ]
                    |)
                  |))
              ]
            |)
          |) in
        let empty :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global" ],
                "new",
                []
              |),
              []
            |)
          |) in
        let strings :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "slice") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                "into_vec",
                [ Ty.path "alloc::alloc::Global" ]
              |),
              [
                (* Unsize *)
                M.pointer_coercion
                  (M.read (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::boxed::Box")
                          [
                            Ty.apply (Ty.path "array") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "tofu" |);
                              M.read (| Value.String "93" |);
                              M.read (| Value.String "18" |)
                            ]
                        |)
                      ]
                    |)
                  |))
              ]
            |)
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
                              M.read (| Value.String "The first doubled is " |);
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
                                  [
                                    Ty.apply
                                      (Ty.path "core::result::Result")
                                      [
                                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                                        Ty.path "core::num::error::ParseIntError"
                                      ]
                                  ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "pulling_results_out_of_options_with_stop_error_processing::double_first",
                                        []
                                      |),
                                      [ M.read (| numbers |) ]
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
                              M.read (| Value.String "The first doubled is " |);
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
                                  [
                                    Ty.apply
                                      (Ty.path "core::result::Result")
                                      [
                                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                                        Ty.path "core::num::error::ParseIntError"
                                      ]
                                  ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "pulling_results_out_of_options_with_stop_error_processing::double_first",
                                        []
                                      |),
                                      [ M.read (| empty |) ]
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
                              M.read (| Value.String "The first doubled is " |);
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
                                  [
                                    Ty.apply
                                      (Ty.path "core::result::Result")
                                      [
                                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                                        Ty.path "core::num::error::ParseIntError"
                                      ]
                                  ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "pulling_results_out_of_options_with_stop_error_processing::double_first",
                                        []
                                      |),
                                      [ M.read (| strings |) ]
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
