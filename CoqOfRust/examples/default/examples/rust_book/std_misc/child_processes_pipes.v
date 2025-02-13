(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition value_PANGRAM : Value.t :=
  M.run
    ltac:(M.monadic (M.alloc (| Value.String "the quick brown fox jumped over the lazy dog
" |))).

(*
fn main() {
    // Spawn the `wc` command
    let process = match Command::new("wc")
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .spawn()
    {
        Err(why) => panic!("couldn't spawn wc: {}", why),
        Ok(process) => process,
    };

    // Write a string to the `stdin` of `wc`.
    //
    // `stdin` has type `Option<ChildStdin>`, but since we know this instance
    // must have one, we can directly `unwrap` it.
    match process.stdin.unwrap().write_all(PANGRAM.as_bytes()) {
        Err(why) => panic!("couldn't write to wc stdin: {}", why),
        Ok(_) => println!("sent pangram to wc"),
    }

    // Because `stdin` does not live after the above calls, it is `drop`ed,
    // and the pipe is closed.
    //
    // This is very important, otherwise `wc` wouldn't start processing the
    // input we just sent.

    // The `stdout` field also has type `Option<ChildStdout>` so must be unwrapped.
    let mut s = String::new();
    match process.stdout.unwrap().read_to_string(&mut s) {
        Err(why) => panic!("couldn't read wc stdout: {}", why),
        Ok(_) => print!("wc responded with:\n{}", s),
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let process :=
          M.copy (|
            M.match_operator (|
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (| Ty.path "std::process::Command", "spawn", [] |),
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "std::process::Command",
                        "stdout",
                        [ Ty.path "std::process::Stdio" ]
                      |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "std::process::Command",
                            "stdin",
                            [ Ty.path "std::process::Stdio" ]
                          |),
                          [
                            M.alloc (|
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "std::process::Command",
                                  "new",
                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                |),
                                [ M.read (| Value.String "wc" |) ]
                              |)
                            |);
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "std::process::Stdio",
                                "piped",
                                []
                              |),
                              []
                            |)
                          ]
                        |);
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "std::process::Stdio",
                            "piped",
                            []
                          |),
                          []
                        |)
                      ]
                    |)
                  ]
                |)
              |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
                    let why := M.copy (| γ0_0 |) in
                    M.alloc (|
                      M.never_to_any (|
                        M.call_closure (|
                          M.get_function (| "core::panicking::panic_fmt", [] |),
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
                                    Value.Array [ M.read (| Value.String "couldn't spawn wc: " |) ]
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
                                            [ Ty.path "std::io::error::Error" ]
                                          |),
                                          [ why ]
                                        |)
                                      ]
                                  |))
                              ]
                            |)
                          ]
                        |)
                      |)
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
                    let process := M.copy (| γ0_0 |) in
                    process))
              ]
            |)
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              M.call_closure (|
                M.get_trait_method (|
                  "std::io::Write",
                  Ty.path "std::process::ChildStdin",
                  [],
                  "write_all",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "core::option::Option")
                          [ Ty.path "std::process::ChildStdin" ],
                        "unwrap",
                        []
                      |),
                      [
                        M.read (|
                          M.SubPointer.get_struct_record_field (|
                            process,
                            "std::process::Child",
                            "stdin"
                          |)
                        |)
                      ]
                    |)
                  |);
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "str", "as_bytes", [] |),
                    [
                      M.read (|
                        M.read (| M.get_constant (| "child_processes_pipes::PANGRAM" |) |)
                      |)
                    ]
                  |)
                ]
              |)
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 :=
                    M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
                  let why := M.copy (| γ0_0 |) in
                  M.alloc (|
                    M.never_to_any (|
                      M.call_closure (|
                        M.get_function (| "core::panicking::panic_fmt", [] |),
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
                                    [ M.read (| Value.String "couldn't write to wc stdin: " |) ]
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
                                          [ Ty.path "std::io::error::Error" ]
                                        |),
                                        [ why ]
                                      |)
                                    ]
                                |))
                            ]
                          |)
                        ]
                      |)
                    |)
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 :=
                    M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
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
                                  Value.Array [ M.read (| Value.String "sent pangram to wc
" |) ]
                                |))
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |)))
            ]
          |) in
        let s :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (| Ty.path "alloc::string::String", "new", [] |),
              []
            |)
          |) in
        M.match_operator (|
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "std::io::Read",
                Ty.path "std::process::ChildStdout",
                [],
                "read_to_string",
                []
              |),
              [
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "std::process::ChildStdout" ],
                      "unwrap",
                      []
                    |),
                    [
                      M.read (|
                        M.SubPointer.get_struct_record_field (|
                          process,
                          "std::process::Child",
                          "stdout"
                        |)
                      |)
                    ]
                  |)
                |);
                s
              ]
            |)
          |),
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
                let why := M.copy (| γ0_0 |) in
                M.alloc (|
                  M.never_to_any (|
                    M.call_closure (|
                      M.get_function (| "core::panicking::panic_fmt", [] |),
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
                                  [ M.read (| Value.String "couldn't read wc stdout: " |) ]
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
                                        [ Ty.path "std::io::error::Error" ]
                                      |),
                                      [ why ]
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |)
                |)));
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
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
                                Value.Array [ M.read (| Value.String "wc responded with:
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
                                        "new_display",
                                        [ Ty.path "alloc::string::String" ]
                                      |),
                                      [ s ]
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
