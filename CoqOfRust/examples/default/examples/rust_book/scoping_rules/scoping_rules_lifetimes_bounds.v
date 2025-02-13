(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Ref";
    ty_params := [ "T" ];
    fields := [ Ty.apply (Ty.path "&") [ T ] ];
  } *)

Module Impl_core_fmt_Debug_where_core_fmt_Debug_T_for_scoping_rules_lifetimes_bounds_Ref_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "scoping_rules_lifetimes_bounds::Ref") [ T ].
  
  (* Debug *)
  Definition fmt (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self T in
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.path "core::fmt::Formatter",
            "debug_tuple_field1_finish",
            []
          |),
          [
            M.read (| f |);
            M.read (| Value.String "Ref" |);
            (* Unsize *)
            M.pointer_coercion
              (M.alloc (|
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "scoping_rules_lifetimes_bounds::Ref",
                  0
                |)
              |))
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "core::fmt::Debug"
      (Self T)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method (fmt T)) ].
End Impl_core_fmt_Debug_where_core_fmt_Debug_T_for_scoping_rules_lifetimes_bounds_Ref_T.

(*
fn print<T>(t: T)
where
    T: Debug,
{
    println!("`print`: t is {:?}", t);
}
*)
Definition print (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ T ], [ t ] =>
    ltac:(M.monadic
      (let t := M.alloc (| t |) in
      M.read (|
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
                              M.read (| Value.String "`print`: t is " |);
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
                                  [ T ]
                                |),
                                [ t ]
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

(*
fn print_ref<'a, T>(t: &'a T)
where
    T: Debug + 'a,
{
    println!("`print_ref`: t is {:?}", t);
}
*)
Definition print_ref (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ T ], [ t ] =>
    ltac:(M.monadic
      (let t := M.alloc (| t |) in
      M.read (|
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
                              M.read (| Value.String "`print_ref`: t is " |);
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
                                  [ Ty.apply (Ty.path "&") [ T ] ]
                                |),
                                [ t ]
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

(*
fn main() {
    let x = 7;
    let ref_x = Ref(&x);

    print_ref(&ref_x);
    print(ref_x);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let x := M.alloc (| Value.Integer 7 |) in
        let ref_x := M.alloc (| Value.StructTuple "scoping_rules_lifetimes_bounds::Ref" [ x ] |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (|
                "scoping_rules_lifetimes_bounds::print_ref",
                [ Ty.apply (Ty.path "scoping_rules_lifetimes_bounds::Ref") [ Ty.path "i32" ] ]
              |),
              [ ref_x ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (|
                "scoping_rules_lifetimes_bounds::print",
                [ Ty.apply (Ty.path "scoping_rules_lifetimes_bounds::Ref") [ Ty.path "i32" ] ]
              |),
              [ M.read (| ref_x |) ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
