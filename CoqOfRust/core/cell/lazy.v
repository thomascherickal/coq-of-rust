(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module cell.
  Module lazy.
    (*
    Enum State
    {
      ty_params := [ "T"; "F" ];
      variants :=
        [
          {
            name := "Uninit";
            item := StructTuple [ F ];
            discriminant := None;
          };
          {
            name := "Init";
            item := StructTuple [ T ];
            discriminant := None;
          };
          {
            name := "Poisoned";
            item := StructTuple [];
            discriminant := None;
          }
        ];
    }
    *)
    
    (* StructRecord
      {
        name := "LazyCell";
        ty_params := [ "T"; "F" ];
        fields :=
          [
            ("state",
              Ty.apply
                (Ty.path "core::cell::UnsafeCell")
                [ Ty.apply (Ty.path "core::cell::lazy::State") [ T; F ] ])
          ];
      } *)
    
    Module Impl_core_cell_lazy_LazyCell_T_F.
      Definition Self (T F : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::cell::lazy::LazyCell") [ T; F ].
      
      (*
          pub const fn new(f: F) -> LazyCell<T, F> {
              LazyCell { state: UnsafeCell::new(State::Uninit(f)) }
          }
      *)
      Definition new (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F in
        match τ, α with
        | [], [ f ] =>
          ltac:(M.monadic
            (let f := M.alloc (| f |) in
            Value.StructRecord
              "core::cell::lazy::LazyCell"
              [
                ("state",
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "core::cell::UnsafeCell")
                        [ Ty.apply (Ty.path "core::cell::lazy::State") [ T; F ] ],
                      "new",
                      []
                    |),
                    [ Value.StructTuple "core::cell::lazy::State::Uninit" [ M.read (| f |) ] ]
                  |))
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_new :
        forall (T F : Ty.t),
        M.IsAssociatedFunction (Self T F) "new" (new T F).
      
      (*
          pub fn into_inner(this: Self) -> Result<T, F> {
              match this.state.into_inner() {
                  State::Init(data) => Ok(data),
                  State::Uninit(f) => Err(f),
                  State::Poisoned => panic!("LazyCell instance has previously been poisoned"),
              }
          }
      *)
      Definition into_inner (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F in
        match τ, α with
        | [], [ this ] =>
          ltac:(M.monadic
            (let this := M.alloc (| this |) in
            M.read (|
              M.match_operator (|
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "core::cell::UnsafeCell")
                        [ Ty.apply (Ty.path "core::cell::lazy::State") [ T; F ] ],
                      "into_inner",
                      []
                    |),
                    [
                      M.read (|
                        M.SubPointer.get_struct_record_field (|
                          this,
                          "core::cell::lazy::LazyCell",
                          "state"
                        |)
                      |)
                    ]
                  |)
                |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::cell::lazy::State::Init",
                          0
                        |) in
                      let data := M.copy (| γ0_0 |) in
                      M.alloc (|
                        Value.StructTuple "core::result::Result::Ok" [ M.read (| data |) ]
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::cell::lazy::State::Uninit",
                          0
                        |) in
                      let f := M.copy (| γ0_0 |) in
                      M.alloc (|
                        Value.StructTuple "core::result::Result::Err" [ M.read (| f |) ]
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (M.alloc (|
                        M.never_to_any (|
                          M.call_closure (|
                            M.get_function (| "core::panicking::panic_fmt", [] |),
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
                                              "LazyCell instance has previously been poisoned"
                                          |)
                                        ]
                                    |))
                                ]
                              |)
                            ]
                          |)
                        |)
                      |)))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_into_inner :
        forall (T F : Ty.t),
        M.IsAssociatedFunction (Self T F) "into_inner" (into_inner T F).
      
      (*
          pub fn force(this: &LazyCell<T, F>) -> &T {
              // SAFETY:
              // This invalidates any mutable references to the data. The resulting
              // reference lives either until the end of the borrow of `this` (in the
              // initialized case) or is invalidated in `really_init` (in the
              // uninitialized case; `really_init` will create and return a fresh reference).
              let state = unsafe { &*this.state.get() };
              match state {
                  State::Init(data) => data,
                  // SAFETY: The state is uninitialized.
                  State::Uninit(_) => unsafe { LazyCell::really_init(this) },
                  State::Poisoned => panic!("LazyCell has previously been poisoned"),
              }
          }
      *)
      Definition force (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F in
        match τ, α with
        | [], [ this ] =>
          ltac:(M.monadic
            (let this := M.alloc (| this |) in
            M.read (|
              let state :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "core::cell::UnsafeCell")
                        [ Ty.apply (Ty.path "core::cell::lazy::State") [ T; F ] ],
                      "get",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| this |),
                        "core::cell::lazy::LazyCell",
                        "state"
                      |)
                    ]
                  |)
                |) in
              M.match_operator (|
                state,
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      let γ1_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::cell::lazy::State::Init",
                          0
                        |) in
                      let data := M.alloc (| γ1_0 |) in
                      M.alloc (| M.read (| data |) |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      let γ1_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::cell::lazy::State::Uninit",
                          0
                        |) in
                      M.alloc (|
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.apply (Ty.path "core::cell::lazy::LazyCell") [ T; F ],
                            "really_init",
                            []
                          |),
                          [ M.read (| this |) ]
                        |)
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      M.alloc (|
                        M.never_to_any (|
                          M.call_closure (|
                            M.get_function (| "core::panicking::panic_fmt", [] |),
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
                                            Value.String "LazyCell has previously been poisoned"
                                          |)
                                        ]
                                    |))
                                ]
                              |)
                            ]
                          |)
                        |)
                      |)))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_force :
        forall (T F : Ty.t),
        M.IsAssociatedFunction (Self T F) "force" (force T F).
      
      (*
          unsafe fn really_init(this: &LazyCell<T, F>) -> &T {
              // SAFETY:
              // This function is only called when the state is uninitialized,
              // so no references to `state` can exist except for the reference
              // in `force`, which is invalidated here and not accessed again.
              let state = unsafe { &mut *this.state.get() };
              // Temporarily mark the state as poisoned. This prevents reentrant
              // accesses and correctly poisons the cell if the closure panicked.
              let State::Uninit(f) = mem::replace(state, State::Poisoned) else { unreachable!() };
      
              let data = f();
      
              // SAFETY:
              // If the closure accessed the cell through something like a reentrant
              // mutex, but caught the panic resulting from the state being poisoned,
              // the mutable borrow for `state` will be invalidated, so we need to
              // go through the `UnsafeCell` pointer here. The state can only be
              // poisoned at this point, so using `write` to skip the destructor
              // of `State` should help the optimizer.
              unsafe { this.state.get().write(State::Init(data)) };
      
              // SAFETY:
              // The previous references were invalidated by the `write` call above,
              // so do a new shared borrow of the state instead.
              let state = unsafe { &*this.state.get() };
              let State::Init(data) = state else { unreachable!() };
              data
          }
      *)
      Definition really_init (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F in
        match τ, α with
        | [], [ this ] =>
          ltac:(M.monadic
            (let this := M.alloc (| this |) in
            M.read (|
              let state :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "core::cell::UnsafeCell")
                        [ Ty.apply (Ty.path "core::cell::lazy::State") [ T; F ] ],
                      "get",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| this |),
                        "core::cell::lazy::LazyCell",
                        "state"
                      |)
                    ]
                  |)
                |) in
              M.match_operator (|
                M.alloc (|
                  M.call_closure (|
                    M.get_function (|
                      "core::mem::replace",
                      [ Ty.apply (Ty.path "core::cell::lazy::State") [ T; F ] ]
                    |),
                    [ M.read (| state |); Value.StructTuple "core::cell::lazy::State::Poisoned" [] ]
                  |)
                |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::cell::lazy::State::Uninit",
                          0
                        |) in
                      let f := M.copy (| γ0_0 |) in
                      let data :=
                        M.alloc (|
                          M.call_closure (|
                            M.get_trait_method (|
                              "core::ops::function::FnOnce",
                              F,
                              [ Ty.tuple [] ],
                              "call_once",
                              []
                            |),
                            [ M.read (| f |); Value.Tuple [] ]
                          |)
                        |) in
                      let _ :=
                        M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.apply
                                (Ty.path "*mut")
                                [ Ty.apply (Ty.path "core::cell::lazy::State") [ T; F ] ],
                              "write",
                              []
                            |),
                            [
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.apply
                                    (Ty.path "core::cell::UnsafeCell")
                                    [ Ty.apply (Ty.path "core::cell::lazy::State") [ T; F ] ],
                                  "get",
                                  []
                                |),
                                [
                                  M.SubPointer.get_struct_record_field (|
                                    M.read (| this |),
                                    "core::cell::lazy::LazyCell",
                                    "state"
                                  |)
                                ]
                              |);
                              Value.StructTuple
                                "core::cell::lazy::State::Init"
                                [ M.read (| data |) ]
                            ]
                          |)
                        |) in
                      let state :=
                        M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.apply
                                (Ty.path "core::cell::UnsafeCell")
                                [ Ty.apply (Ty.path "core::cell::lazy::State") [ T; F ] ],
                              "get",
                              []
                            |),
                            [
                              M.SubPointer.get_struct_record_field (|
                                M.read (| this |),
                                "core::cell::lazy::LazyCell",
                                "state"
                              |)
                            ]
                          |)
                        |) in
                      M.match_operator (|
                        state,
                        [
                          fun γ =>
                            ltac:(M.monadic
                              (let γ := M.read (| γ |) in
                              let γ1_0 :=
                                M.SubPointer.get_struct_tuple_field (|
                                  γ,
                                  "core::cell::lazy::State::Init",
                                  0
                                |) in
                              let data := M.alloc (| γ1_0 |) in
                              M.alloc (| M.read (| data |) |)))
                        ]
                      |)))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_really_init :
        forall (T F : Ty.t),
        M.IsAssociatedFunction (Self T F) "really_init" (really_init T F).
      (*
          fn get(&self) -> Option<&T> {
              // SAFETY:
              // This is sound for the same reason as in `force`: once the state is
              // initialized, it will not be mutably accessed again, so this reference
              // will stay valid for the duration of the borrow to `self`.
              let state = unsafe { &*self.state.get() };
              match state {
                  State::Init(data) => Some(data),
                  _ => None,
              }
          }
      *)
      Definition get (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              let state :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "core::cell::UnsafeCell")
                        [ Ty.apply (Ty.path "core::cell::lazy::State") [ T; F ] ],
                      "get",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::cell::lazy::LazyCell",
                        "state"
                      |)
                    ]
                  |)
                |) in
              M.match_operator (|
                state,
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      let γ1_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::cell::lazy::State::Init",
                          0
                        |) in
                      let data := M.alloc (| γ1_0 |) in
                      M.alloc (|
                        Value.StructTuple "core::option::Option::Some" [ M.read (| data |) ]
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (M.alloc (| Value.StructTuple "core::option::Option::None" [] |)))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_get :
        forall (T F : Ty.t),
        M.IsAssociatedFunction (Self T F) "get" (get T F).
    End Impl_core_cell_lazy_LazyCell_T_F.
    
    
    Module Impl_core_ops_deref_Deref_where_core_ops_function_FnOnce_F_Tuple__for_core_cell_lazy_LazyCell_T_F.
      Definition Self (T F : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::cell::lazy::LazyCell") [ T; F ].
      
      (*     type Target = T; *)
      Definition _Target (T F : Ty.t) : Ty.t := T.
      
      (*
          fn deref(&self) -> &T {
              LazyCell::force(self)
          }
      *)
      Definition deref (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "core::cell::lazy::LazyCell") [ T; F ],
                "force",
                []
              |),
              [ M.read (| self |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T F : Ty.t),
        M.IsTraitInstance
          "core::ops::deref::Deref"
          (Self T F)
          (* Trait polymorphic types *) []
          (* Instance *)
          [ ("Target", InstanceField.Ty (_Target T F)); ("deref", InstanceField.Method (deref T F))
          ].
    End Impl_core_ops_deref_Deref_where_core_ops_function_FnOnce_F_Tuple__for_core_cell_lazy_LazyCell_T_F.
    
    Module Impl_core_default_Default_where_core_default_Default_T_for_core_cell_lazy_LazyCell_T_ToT.
      Definition Self (T : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::cell::lazy::LazyCell") [ T; Ty.function [] T ].
      
      (*
          fn default() -> LazyCell<T> {
              LazyCell::new(T::default)
          }
      *)
      Definition default (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "core::cell::lazy::LazyCell") [ T; Ty.function [] T ],
                "new",
                []
              |),
              [
                (* ReifyFnPointer *)
                M.pointer_coercion
                  (M.get_trait_method (| "core::default::Default", T, [], "default", [] |))
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::default::Default"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("default", InstanceField.Method (default T)) ].
    End Impl_core_default_Default_where_core_default_Default_T_for_core_cell_lazy_LazyCell_T_ToT.
    
    Module Impl_core_fmt_Debug_where_core_fmt_Debug_T_for_core_cell_lazy_LazyCell_T_F.
      Definition Self (T F : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::cell::lazy::LazyCell") [ T; F ].
      
      (*
          fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
              let mut d = f.debug_tuple("LazyCell");
              match self.get() {
                  Some(data) => d.field(data),
                  None => d.field(&format_args!("<uninit>")),
              };
              d.finish()
          }
      *)
      Definition fmt (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F in
        match τ, α with
        | [], [ self; f ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let f := M.alloc (| f |) in
            M.read (|
              let d :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "core::fmt::Formatter",
                      "debug_tuple",
                      []
                    |),
                    [ M.read (| f |); M.read (| Value.String "LazyCell" |) ]
                  |)
                |) in
              let _ :=
                M.match_operator (|
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply (Ty.path "core::cell::lazy::LazyCell") [ T; F ],
                        "get",
                        []
                      |),
                      [ M.read (| self |) ]
                    |)
                  |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.SubPointer.get_struct_tuple_field (|
                            γ,
                            "core::option::Option::Some",
                            0
                          |) in
                        let data := M.copy (| γ0_0 |) in
                        M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::builders::DebugTuple",
                              "field",
                              []
                            |),
                            [ d; (* Unsize *) M.pointer_coercion (M.read (| data |)) ]
                          |)
                        |)));
                    fun γ =>
                      ltac:(M.monadic
                        (M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::builders::DebugTuple",
                              "field",
                              []
                            |),
                            [
                              d;
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
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
                                          Value.Array [ M.read (| Value.String "<uninit>" |) ]
                                        |))
                                    ]
                                  |)
                                |))
                            ]
                          |)
                        |)))
                  ]
                |) in
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "core::fmt::builders::DebugTuple",
                    "finish",
                    []
                  |),
                  [ d ]
                |)
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T F : Ty.t),
        M.IsTraitInstance
          "core::fmt::Debug"
          (Self T F)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method (fmt T F)) ].
    End Impl_core_fmt_Debug_where_core_fmt_Debug_T_for_core_cell_lazy_LazyCell_T_F.
  End lazy.
End cell.
