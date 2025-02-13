(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "A";
    ty_params := [];
    fields := [];
  } *)

(* StructTuple
  {
    name := "S";
    ty_params := [];
    fields := [ Ty.path "generics_functions::A" ];
  } *)

(* StructTuple
  {
    name := "SGen";
    ty_params := [ "T" ];
    fields := [ T ];
  } *)

(* fn reg_fn(_s: S) {} *)
Definition reg_fn (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ _s ] =>
    ltac:(M.monadic
      (let _s := M.alloc (| _s |) in
      Value.Tuple []))
  | _, _ => M.impossible
  end.

(* fn gen_spec_t(_s: SGen<A>) {} *)
Definition gen_spec_t (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ _s ] =>
    ltac:(M.monadic
      (let _s := M.alloc (| _s |) in
      Value.Tuple []))
  | _, _ => M.impossible
  end.

(* fn gen_spec_i32(_s: SGen<i32>) {} *)
Definition gen_spec_i32 (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ _s ] =>
    ltac:(M.monadic
      (let _s := M.alloc (| _s |) in
      Value.Tuple []))
  | _, _ => M.impossible
  end.

(* fn generic<T>(_s: SGen<T>) {} *)
Definition generic (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ T ], [ _s ] =>
    ltac:(M.monadic
      (let _s := M.alloc (| _s |) in
      Value.Tuple []))
  | _, _ => M.impossible
  end.

(*
fn main() {
    // Using the non-generic functions
    reg_fn(S(A)); // Concrete type.
    gen_spec_t(SGen(A)); // Implicitly specified type parameter `A`.
    gen_spec_i32(SGen(6)); // Implicitly specified type parameter `i32`.

    // Explicitly specified type parameter `char` to `generic()`.
    generic::<char>(SGen('a'));

    // Implicitly specified type parameter `char` to `generic()`.
    generic(SGen('c'));
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
              M.get_function (| "generics_functions::reg_fn", [] |),
              [
                Value.StructTuple
                  "generics_functions::S"
                  [ Value.StructTuple "generics_functions::A" [] ]
              ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "generics_functions::gen_spec_t", [] |),
              [
                Value.StructTuple
                  "generics_functions::SGen"
                  [ Value.StructTuple "generics_functions::A" [] ]
              ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "generics_functions::gen_spec_i32", [] |),
              [ Value.StructTuple "generics_functions::SGen" [ Value.Integer 6 ] ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "generics_functions::generic", [ Ty.path "char" ] |),
              [ Value.StructTuple "generics_functions::SGen" [ Value.UnicodeChar 97 ] ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "generics_functions::generic", [ Ty.path "char" ] |),
              [ Value.StructTuple "generics_functions::SGen" [ Value.UnicodeChar 99 ] ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
