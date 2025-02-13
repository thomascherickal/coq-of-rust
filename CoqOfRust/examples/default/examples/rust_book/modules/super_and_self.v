(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn function() {
    println!("called `function()`");
}
*)
Definition function (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_const", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array [ M.read (| Value.String "called `function()`
" |) ]
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

Module cool.
  (*
      pub fn function() {
          println!("called `cool::function()`");
      }
  *)
  Definition function (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.read (|
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
                            Value.Array [ M.read (| Value.String "called `cool::function()`
" |) ]
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
End cool.

Module my.
  (*
      fn function() {
          println!("called `my::function()`");
      }
  *)
  Definition function (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.read (|
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
                            Value.Array [ M.read (| Value.String "called `my::function()`
" |) ]
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
  
  Module cool.
    (*
            pub fn function() {
                println!("called `my::cool::function()`");
            }
    *)
    Definition function (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (M.read (|
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
                              Value.Array
                                [ M.read (| Value.String "called `my::cool::function()`
" |) ]
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
  End cool.
  
  (*
      pub fn indirect_call() {
          // Let's access all the functions named `function` from this scope!
          print!("called `my::indirect_call()`, that\n> ");
  
          // The `self` keyword refers to the current module scope - in this case `my`.
          // Calling `self::function()` and calling `function()` directly both give
          // the same result, because they refer to the same function.
          self::function();
          function();
  
          // We can also use `self` to access another module inside `my`:
          self::cool::function();
  
          // The `super` keyword refers to the parent scope (outside the `my` module).
          super::function();
  
          // This will bind to the `cool::function` in the *crate* scope.
          // In this case the crate scope is the outermost scope.
          {
              use crate::cool::function as root_function;
              root_function();
          }
      }
  *)
  Definition indirect_call (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.read (|
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
                            Value.Array
                              [ M.read (| Value.String "called `my::indirect_call()`, that
> " |) ]
                          |))
                      ]
                    |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |) in
          let _ :=
            M.alloc (|
              M.call_closure (| M.get_function (| "super_and_self::my::function", [] |), [] |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (| M.get_function (| "super_and_self::my::function", [] |), [] |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (| M.get_function (| "super_and_self::my::cool::function", [] |), [] |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (| M.get_function (| "super_and_self::function", [] |), [] |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (| M.get_function (| "super_and_self::cool::function", [] |), [] |)
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
End my.

(*
fn main() {
    my::indirect_call();
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let _ :=
          M.alloc (|
            M.call_closure (| M.get_function (| "super_and_self::my::indirect_call", [] |), [] |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
