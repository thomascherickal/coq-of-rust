(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let strings = vec!["tofu", "93", "18"];
    let numbers: Vec<_> = strings
        .into_iter()
        .filter_map(|s| s.parse::<i32>().ok())
        .collect();
    println!("Results: {:?}", numbers);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
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
        let numbers :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::iter::traits::iterator::Iterator",
                Ty.apply
                  (Ty.path "core::iter::adapters::filter_map::FilterMap")
                  [
                    Ty.apply
                      (Ty.path "alloc::vec::into_iter::IntoIter")
                      [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global" ];
                    Ty.function
                      [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ]
                      (Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ])
                  ],
                [],
                "collect",
                [
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                ]
              |),
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "core::iter::traits::iterator::Iterator",
                    Ty.apply
                      (Ty.path "alloc::vec::into_iter::IntoIter")
                      [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global" ],
                    [],
                    "filter_map",
                    [
                      Ty.path "i32";
                      Ty.function
                        [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ]
                        (Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ])
                    ]
                  |),
                  [
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::iter::traits::collect::IntoIterator",
                        Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global"
                          ],
                        [],
                        "into_iter",
                        []
                      |),
                      [ M.read (| strings |) ]
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
                                    (let s := M.copy (| γ |) in
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError"
                                          ],
                                        "ok",
                                        []
                                      |),
                                      [
                                        M.call_closure (|
                                          M.get_associated_function (|
                                            Ty.path "str",
                                            "parse",
                                            [ Ty.path "i32" ]
                                          |),
                                          [ M.read (| s |) ]
                                        |)
                                      ]
                                    |)))
                              ]
                            |)
                          | _ => M.impossible (||)
                          end))
                  ]
                |)
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
                            [ M.read (| Value.String "Results: " |); M.read (| Value.String "
" |) ]
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
                                      (Ty.path "alloc::vec::Vec")
                                      [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                                  ]
                                |),
                                [ numbers ]
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
