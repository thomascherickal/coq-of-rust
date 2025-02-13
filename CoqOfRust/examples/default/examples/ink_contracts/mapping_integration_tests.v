(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Mapping";
    ty_params := [ "K"; "V" ];
    fields :=
      [
        ("_key", Ty.apply (Ty.path "core::marker::PhantomData") [ K ]);
        ("_value", Ty.apply (Ty.path "core::marker::PhantomData") [ V ])
      ];
  } *)

Module Impl_core_default_Default_where_core_default_Default_K_where_core_default_Default_V_for_mapping_integration_tests_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::Mapping") [ K; V ].
  
  (* Default *)
  Definition default (K V : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self K V in
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructRecord
          "mapping_integration_tests::Mapping"
          [
            ("_key",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.apply (Ty.path "core::marker::PhantomData") [ K ],
                  [],
                  "default",
                  []
                |),
                []
              |));
            ("_value",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.apply (Ty.path "core::marker::PhantomData") [ V ],
                  [],
                  "default",
                  []
                |),
                []
              |))
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (K V : Ty.t),
    M.IsTraitInstance
      "core::default::Default"
      (Self K V)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method (default K V)) ].
End Impl_core_default_Default_where_core_default_Default_K_where_core_default_Default_V_for_mapping_integration_tests_Mapping_K_V.

Module Impl_mapping_integration_tests_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::Mapping") [ K; V ].
  
  (*
      fn contains(&self, _key: &K) -> bool {
          unimplemented!()
      }
  *)
  Parameter contains : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_contains :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "contains" (contains K V).
  
  (*
      fn get(&self, _key: &K) -> Option<V> {
          unimplemented!()
      }
  *)
  Parameter get : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "get" (get K V).
  
  (*
      fn insert(&mut self, _key: K, _value: V) -> Option<u32> {
          unimplemented!()
      }
  *)
  Parameter insert : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_insert :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "insert" (insert K V).
  
  (*
      fn new() -> Mapping<K, V> {
          unimplemented!()
      }
  *)
  Parameter new : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "new" (new K V).
  
  (*
      fn remove(&self, _key: K) {
          unimplemented!()
      }
  *)
  Parameter remove : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_remove :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "remove" (remove K V).
  
  (*
      fn size(&self, _key: K) -> Option<u32> {
          unimplemented!()
      }
  *)
  Parameter size : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_size :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "size" (size K V).
  
  (*
      fn take(&self, _key: K) -> Option<V> {
          unimplemented!()
      }
  *)
  Parameter take : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_take :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "take" (take K V).
End Impl_mapping_integration_tests_Mapping_K_V.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::AccountId".
  
  (* Default *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructTuple
          "mapping_integration_tests::AccountId"
          [
            M.call_closure (|
              M.get_trait_method (| "core::default::Default", Ty.path "u128", [], "default", [] |),
              []
            |)
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_mapping_integration_tests_AccountId.

Module Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::AccountId".
  
  (* Clone *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            Value.DeclaredButUndefined,
            [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.

Module Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.

Axiom Balance : (Ty.path "mapping_integration_tests::Balance") = (Ty.path "u128").

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "mapping_integration_tests::AccountId") ];
  } *)

Module Impl_mapping_integration_tests_Env.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Env".
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.SubPointer.get_struct_record_field (|
            M.read (| self |),
            "mapping_integration_tests::Env",
            "caller"
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_caller : M.IsAssociatedFunction Self "caller" caller.
End Impl_mapping_integration_tests_Env.

(* StructRecord
  {
    name := "Mappings";
    ty_params := [];
    fields :=
      [
        ("balances",
          Ty.apply
            (Ty.path "mapping_integration_tests::Mapping")
            [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128" ])
      ];
  } *)

Module Impl_core_default_Default_for_mapping_integration_tests_Mappings.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Mappings".
  
  (* Default *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructRecord
          "mapping_integration_tests::Mappings"
          [
            ("balances",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.apply
                    (Ty.path "mapping_integration_tests::Mapping")
                    [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128" ],
                  [],
                  "default",
                  []
                |),
                []
              |))
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_mapping_integration_tests_Mappings.

Module Impl_mapping_integration_tests_Mappings.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Mappings".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env : M.IsAssociatedFunction Self "init_env" init_env.
  
  (*
      fn env() -> Env {
          unimplemented!()
      }
  *)
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  (*
      pub fn new() -> Self {
          let balances = Mapping::default();
          Self { balances }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.read (|
          let balances :=
            M.alloc (|
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.apply
                    (Ty.path "mapping_integration_tests::Mapping")
                    [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128" ],
                  [],
                  "default",
                  []
                |),
                []
              |)
            |) in
          M.alloc (|
            Value.StructRecord
              "mapping_integration_tests::Mappings"
              [ ("balances", M.read (| balances |)) ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn get_balance(&self) -> Option<Balance> {
          let caller = Self::env().caller();
          self.balances.get(&caller)
      }
  *)
  Definition get_balance (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let caller :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "mapping_integration_tests::Env",
                  "caller",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "mapping_integration_tests::Mappings",
                        "env",
                        []
                      |),
                      []
                    |)
                  |)
                ]
              |)
            |) in
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "mapping_integration_tests::Mapping")
                  [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128" ],
                "get",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "mapping_integration_tests::Mappings",
                  "balances"
                |);
                caller
              ]
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get_balance : M.IsAssociatedFunction Self "get_balance" get_balance.
  
  (*
      pub fn insert_balance(&mut self, value: Balance) -> Option<u32> {
          let caller = Self::env().caller();
          self.balances.insert(caller, value)
      }
  *)
  Definition insert_balance (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; value ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let value := M.alloc (| value |) in
        M.read (|
          let caller :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "mapping_integration_tests::Env",
                  "caller",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "mapping_integration_tests::Mappings",
                        "env",
                        []
                      |),
                      []
                    |)
                  |)
                ]
              |)
            |) in
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "mapping_integration_tests::Mapping")
                  [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128" ],
                "insert",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "mapping_integration_tests::Mappings",
                  "balances"
                |);
                M.read (| caller |);
                M.read (| value |)
              ]
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_insert_balance :
    M.IsAssociatedFunction Self "insert_balance" insert_balance.
  
  (*
      pub fn size_balance(&mut self) -> Option<u32> {
          let caller = Self::env().caller();
          self.balances.size(caller)
      }
  *)
  Definition size_balance (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let caller :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "mapping_integration_tests::Env",
                  "caller",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "mapping_integration_tests::Mappings",
                        "env",
                        []
                      |),
                      []
                    |)
                  |)
                ]
              |)
            |) in
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "mapping_integration_tests::Mapping")
                  [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128" ],
                "size",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "mapping_integration_tests::Mappings",
                  "balances"
                |);
                M.read (| caller |)
              ]
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_size_balance : M.IsAssociatedFunction Self "size_balance" size_balance.
  
  (*
      pub fn contains_balance(&self) -> bool {
          let caller = Self::env().caller();
          self.balances.contains(&caller)
      }
  *)
  Definition contains_balance (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let caller :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "mapping_integration_tests::Env",
                  "caller",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "mapping_integration_tests::Mappings",
                        "env",
                        []
                      |),
                      []
                    |)
                  |)
                ]
              |)
            |) in
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "mapping_integration_tests::Mapping")
                  [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128" ],
                "contains",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "mapping_integration_tests::Mappings",
                  "balances"
                |);
                caller
              ]
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_contains_balance :
    M.IsAssociatedFunction Self "contains_balance" contains_balance.
  
  (*
      pub fn remove_balance(&mut self) {
          let caller = Self::env().caller();
          self.balances.remove(caller);
      }
  *)
  Definition remove_balance (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let caller :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "mapping_integration_tests::Env",
                  "caller",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "mapping_integration_tests::Mappings",
                        "env",
                        []
                      |),
                      []
                    |)
                  |)
                ]
              |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply
                    (Ty.path "mapping_integration_tests::Mapping")
                    [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128" ],
                  "remove",
                  []
                |),
                [
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "mapping_integration_tests::Mappings",
                    "balances"
                  |);
                  M.read (| caller |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_remove_balance :
    M.IsAssociatedFunction Self "remove_balance" remove_balance.
  
  (*
      pub fn take_balance(&mut self) -> Option<Balance> {
          let caller = Self::env().caller();
          self.balances.take(caller)
      }
  *)
  Definition take_balance (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let caller :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "mapping_integration_tests::Env",
                  "caller",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "mapping_integration_tests::Mappings",
                        "env",
                        []
                      |),
                      []
                    |)
                  |)
                ]
              |)
            |) in
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "mapping_integration_tests::Mapping")
                  [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128" ],
                "take",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "mapping_integration_tests::Mappings",
                  "balances"
                |);
                M.read (| caller |)
              ]
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_take_balance : M.IsAssociatedFunction Self "take_balance" take_balance.
End Impl_mapping_integration_tests_Mappings.
