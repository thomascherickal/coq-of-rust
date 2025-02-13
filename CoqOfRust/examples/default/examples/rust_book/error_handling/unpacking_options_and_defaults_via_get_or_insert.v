(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
Enum Fruit
{
  ty_params := [];
  variants :=
    [
      {
        name := "Apple";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Orange";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Banana";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Kiwi";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Lemon";
        item := StructTuple [];
        discriminant := None;
      }
    ];
}
*)

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit.
  Definition Self : Ty.t := Ty.path "unpacking_options_and_defaults_via_get_or_insert::Fruit".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_str", [] |),
          [
            M.read (| f |);
            M.read (|
              M.match_operator (|
                self,
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      M.alloc (| M.read (| Value.String "Apple" |) |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      M.alloc (| M.read (| Value.String "Orange" |) |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      M.alloc (| M.read (| Value.String "Banana" |) |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      M.alloc (| M.read (| Value.String "Kiwi" |) |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      M.alloc (| M.read (| Value.String "Lemon" |) |)))
                ]
              |)
            |)
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit.

(*
fn main() {
    let mut my_fruit: Option<Fruit> = None;
    let apple = Fruit::Apple;
    let first_available_fruit = my_fruit.get_or_insert(apple);
    println!("my_fruit is: {:?}", first_available_fruit);
    println!("first_available_fruit is: {:?}", first_available_fruit);
    // my_fruit is: Apple
    // first_available_fruit is: Apple
    //println!("Variable named `apple` is moved: {:?}", apple);
    // TODO: uncomment the line above to see the compiler error
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let my_fruit := M.alloc (| Value.StructTuple "core::option::Option::None" [] |) in
        let apple :=
          M.alloc (|
            Value.StructTuple "unpacking_options_and_defaults_via_get_or_insert::Fruit::Apple" []
          |) in
        let first_available_fruit :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "core::option::Option")
                  [ Ty.path "unpacking_options_and_defaults_via_get_or_insert::Fruit" ],
                "get_or_insert",
                []
              |),
              [ my_fruit; M.read (| apple |) ]
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
                              M.read (| Value.String "my_fruit is: " |);
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
                                      (Ty.path "&mut")
                                      [
                                        Ty.path
                                          "unpacking_options_and_defaults_via_get_or_insert::Fruit"
                                      ]
                                  ]
                                |),
                                [ first_available_fruit ]
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
                              M.read (| Value.String "first_available_fruit is: " |);
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
                                      (Ty.path "&mut")
                                      [
                                        Ty.path
                                          "unpacking_options_and_defaults_via_get_or_insert::Fruit"
                                      ]
                                  ]
                                |),
                                [ first_available_fruit ]
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
