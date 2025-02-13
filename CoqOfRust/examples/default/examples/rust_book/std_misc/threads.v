(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition value_NTHREADS : Value.t := M.run ltac:(M.monadic (M.alloc (| Value.Integer 10 |))).

(*
fn main() {
    // Make a vector to hold the children which are spawned.
    let mut children = vec![];

    for i in 0..NTHREADS {
        // Spin up another thread
        children.push(thread::spawn(move || {
            println!("this is thread number {}", i);
        }));
    }

    for child in children {
        // Wait for the thread to finish. Returns a result.
        let _ = child.join();
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let children :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [
                    Ty.apply (Ty.path "std::thread::JoinHandle") [ Ty.tuple [] ];
                    Ty.path "alloc::alloc::Global"
                  ],
                "new",
                []
              |),
              []
            |)
          |) in
        let _ :=
          M.use
            (M.match_operator (|
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (|
                    "core::iter::traits::collect::IntoIterator",
                    Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "u32" ],
                    [],
                    "into_iter",
                    []
                  |),
                  [
                    Value.StructRecord
                      "core::ops::range::Range"
                      [
                        ("start", Value.Integer 0);
                        ("end_", M.read (| M.get_constant (| "threads::NTHREADS" |) |))
                      ]
                  ]
                |)
              |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let iter := M.copy (| γ |) in
                    M.loop (|
                      ltac:(M.monadic
                        (let _ :=
                          M.match_operator (|
                            M.alloc (|
                              M.call_closure (|
                                M.get_trait_method (|
                                  "core::iter::traits::iterator::Iterator",
                                  Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "u32" ],
                                  [],
                                  "next",
                                  []
                                |),
                                [ iter ]
                              |)
                            |),
                            [
                              fun γ =>
                                ltac:(M.monadic
                                  (M.alloc (| M.never_to_any (| M.read (| M.break (||) |) |) |)));
                              fun γ =>
                                ltac:(M.monadic
                                  (let γ0_0 :=
                                    M.SubPointer.get_struct_tuple_field (|
                                      γ,
                                      "core::option::Option::Some",
                                      0
                                    |) in
                                  let i := M.copy (| γ0_0 |) in
                                  let _ :=
                                    M.alloc (|
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.apply
                                            (Ty.path "alloc::vec::Vec")
                                            [
                                              Ty.apply
                                                (Ty.path "std::thread::JoinHandle")
                                                [ Ty.tuple [] ];
                                              Ty.path "alloc::alloc::Global"
                                            ],
                                          "push",
                                          []
                                        |),
                                        [
                                          children;
                                          M.call_closure (|
                                            M.get_function (|
                                              "std::thread::spawn",
                                              [
                                                Ty.function [ Ty.tuple [] ] (Ty.tuple []);
                                                Ty.tuple []
                                              ]
                                            |),
                                            [
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
                                                              (M.read (|
                                                                let _ :=
                                                                  let _ :=
                                                                    M.alloc (|
                                                                      M.call_closure (|
                                                                        M.get_function (|
                                                                          "std::io::stdio::_print",
                                                                          []
                                                                        |),
                                                                        [
                                                                          M.call_closure (|
                                                                            M.get_associated_function (|
                                                                              Ty.path
                                                                                "core::fmt::Arguments",
                                                                              "new_v1",
                                                                              []
                                                                            |),
                                                                            [
                                                                              (* Unsize *)
                                                                              M.pointer_coercion
                                                                                (M.alloc (|
                                                                                  Value.Array
                                                                                    [
                                                                                      M.read (|
                                                                                        Value.String
                                                                                          "this is thread number "
                                                                                      |);
                                                                                      M.read (|
                                                                                        Value.String
                                                                                          "
"
                                                                                      |)
                                                                                    ]
                                                                                |));
                                                                              (* Unsize *)
                                                                              M.pointer_coercion
                                                                                (M.alloc (|
                                                                                  Value.Array
                                                                                    [
                                                                                      M.call_closure (|
                                                                                        M.get_associated_function (|
                                                                                          Ty.path
                                                                                            "core::fmt::rt::Argument",
                                                                                          "new_display",
                                                                                          [
                                                                                            Ty.path
                                                                                              "u32"
                                                                                          ]
                                                                                        |),
                                                                                        [ i ]
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
                                                        ]
                                                      |)
                                                    | _ => M.impossible (||)
                                                    end))
                                            ]
                                          |)
                                        ]
                                      |)
                                    |) in
                                  M.alloc (| Value.Tuple [] |)))
                            ]
                          |) in
                        M.alloc (| Value.Tuple [] |)))
                    |)))
              ]
            |)) in
        M.use
          (M.match_operator (|
            M.alloc (|
              M.call_closure (|
                M.get_trait_method (|
                  "core::iter::traits::collect::IntoIterator",
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [
                      Ty.apply (Ty.path "std::thread::JoinHandle") [ Ty.tuple [] ];
                      Ty.path "alloc::alloc::Global"
                    ],
                  [],
                  "into_iter",
                  []
                |),
                [ M.read (| children |) ]
              |)
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let iter := M.copy (| γ |) in
                  M.loop (|
                    ltac:(M.monadic
                      (let _ :=
                        M.match_operator (|
                          M.alloc (|
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::iter::traits::iterator::Iterator",
                                Ty.apply
                                  (Ty.path "alloc::vec::into_iter::IntoIter")
                                  [
                                    Ty.apply (Ty.path "std::thread::JoinHandle") [ Ty.tuple [] ];
                                    Ty.path "alloc::alloc::Global"
                                  ],
                                [],
                                "next",
                                []
                              |),
                              [ iter ]
                            |)
                          |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (M.alloc (| M.never_to_any (| M.read (| M.break (||) |) |) |)));
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.SubPointer.get_struct_tuple_field (|
                                    γ,
                                    "core::option::Option::Some",
                                    0
                                  |) in
                                let child := M.copy (| γ0_0 |) in
                                M.match_operator (|
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.apply
                                          (Ty.path "std::thread::JoinHandle")
                                          [ Ty.tuple [] ],
                                        "join",
                                        []
                                      |),
                                      [ M.read (| child |) ]
                                    |)
                                  |),
                                  [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
                                |)))
                          ]
                        |) in
                      M.alloc (| Value.Tuple [] |)))
                  |)))
            ]
          |))
      |)))
  | _, _ => M.impossible
  end.
