(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
Enum WebEvent
{
  ty_params := [];
  variants :=
    [
      {
        name := "PageLoad";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "PageUnload";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "KeyPress";
        item := StructTuple [ Ty.path "char" ];
        discriminant := None;
      };
      {
        name := "Paste";
        item := StructTuple [ Ty.path "alloc::string::String" ];
        discriminant := None;
      };
      {
        name := "Click";
        item := StructRecord [ ("x", Ty.path "i64"); ("y", Ty.path "i64") ];
        discriminant := None;
      }
    ];
}
*)

(*
fn inspect(event: WebEvent) {
    match event {
        WebEvent::PageLoad => println!("page loaded, réfé"),
        WebEvent::PageUnload => println!("page unloaded"),
        // Destructure `c` from inside the `enum`.
        WebEvent::KeyPress(c) => println!("pressed '{}'.", c),
        WebEvent::Paste(s) => println!("pasted \"{}\".", s),
        // Destructure `Click` into `x` and `y`.
        WebEvent::Click { x, y } => {
            println!("clicked at x={}, y={}.", x, y);
        }
    }
}
*)
Definition inspect (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ event ] =>
    ltac:(M.monadic
      (let event := M.alloc (| event |) in
      M.read (|
        M.match_operator (|
          event,
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
                            "new_const",
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
                                        ("page loaded, r"
                                          ++
                                          (String.String "233" ("f" ++ (String.String "233" "
"))))
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
                (let _ :=
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
                                Value.Array [ M.read (| Value.String "page unloaded
" |) ]
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
                  M.SubPointer.get_struct_tuple_field (| γ, "enums::WebEvent::KeyPress", 0 |) in
                let c := M.copy (| γ0_0 |) in
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
                                    M.read (| Value.String "pressed '" |);
                                    M.read (| Value.String "'.
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
                                        [ Ty.path "char" ]
                                      |),
                                      [ c ]
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
                  M.SubPointer.get_struct_tuple_field (| γ, "enums::WebEvent::Paste", 0 |) in
                let s := M.copy (| γ0_0 |) in
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
                                    M.read (| Value.String "pasted """ |);
                                    M.read (| Value.String """.
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
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_record_field (| γ, "enums::WebEvent::Click", "x" |) in
                let γ0_1 :=
                  M.SubPointer.get_struct_record_field (| γ, "enums::WebEvent::Click", "y" |) in
                let x := M.copy (| γ0_0 |) in
                let y := M.copy (| γ0_1 |) in
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
                                      M.read (| Value.String "clicked at x=" |);
                                      M.read (| Value.String ", y=" |);
                                      M.read (| Value.String ".
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
                                          [ Ty.path "i64" ]
                                        |),
                                        [ x ]
                                      |);
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.path "core::fmt::rt::Argument",
                                          "new_display",
                                          [ Ty.path "i64" ]
                                        |),
                                        [ y ]
                                      |)
                                    ]
                                |))
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |) in
                M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn main() {
    let pressed = WebEvent::KeyPress('x');
    // `to_owned()` creates an owned `String` from a string slice.
    let pasted = WebEvent::Paste("my text".to_owned());
    let click = WebEvent::Click { x: 20, y: 80 };
    let load = WebEvent::PageLoad;
    let unload = WebEvent::PageUnload;

    inspect(pressed);
    inspect(pasted);
    inspect(click);
    inspect(load);
    inspect(unload);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let pressed :=
          M.alloc (| Value.StructTuple "enums::WebEvent::KeyPress" [ Value.UnicodeChar 120 ] |) in
        let pasted :=
          M.alloc (|
            Value.StructTuple
              "enums::WebEvent::Paste"
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "alloc::borrow::ToOwned",
                    Ty.path "str",
                    [],
                    "to_owned",
                    []
                  |),
                  [ M.read (| Value.String "my text" |) ]
                |)
              ]
          |) in
        let click :=
          M.alloc (|
            Value.StructRecord
              "enums::WebEvent::Click"
              [ ("x", Value.Integer 20); ("y", Value.Integer 80) ]
          |) in
        let load := M.alloc (| Value.StructTuple "enums::WebEvent::PageLoad" [] |) in
        let unload := M.alloc (| Value.StructTuple "enums::WebEvent::PageUnload" [] |) in
        let _ :=
          M.alloc (|
            M.call_closure (| M.get_function (| "enums::inspect", [] |), [ M.read (| pressed |) ] |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (| M.get_function (| "enums::inspect", [] |), [ M.read (| pasted |) ] |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (| M.get_function (| "enums::inspect", [] |), [ M.read (| click |) ] |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (| M.get_function (| "enums::inspect", [] |), [ M.read (| load |) ] |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (| M.get_function (| "enums::inspect", [] |), [ M.read (| unload |) ] |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
