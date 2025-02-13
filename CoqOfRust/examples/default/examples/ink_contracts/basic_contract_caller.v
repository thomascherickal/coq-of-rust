(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::AccountId".
  
  (* Default *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructTuple
          "basic_contract_caller::AccountId"
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
End Impl_core_default_Default_for_basic_contract_caller_AccountId.

Module Impl_core_clone_Clone_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::AccountId".
  
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
End Impl_core_clone_Clone_for_basic_contract_caller_AccountId.

Module Impl_core_marker_Copy_for_basic_contract_caller_AccountId.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_basic_contract_caller_AccountId.

Axiom Hash :
  (Ty.path "basic_contract_caller::Hash") = (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(*
Enum Error
{
  ty_params := [];
  variants := [];
}
*)

(* StructRecord
  {
    name := "OtherContract";
    ty_params := [];
    fields := [ ("value", Ty.path "bool") ];
  } *)

Module Impl_basic_contract_caller_OtherContract.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::OtherContract".
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ init_value ] =>
      ltac:(M.monadic
        (let init_value := M.alloc (| init_value |) in
        Value.StructRecord
          "basic_contract_caller::OtherContract"
          [ ("value", M.read (| init_value |)) ]))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let _ :=
            M.write (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "basic_contract_caller::OtherContract",
                "value"
              |),
              UnOp.Pure.not
                (M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "basic_contract_caller::OtherContract",
                    "value"
                  |)
                |))
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_flip : M.IsAssociatedFunction Self "flip" flip.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.SubPointer.get_struct_record_field (|
            M.read (| self |),
            "basic_contract_caller::OtherContract",
            "value"
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
End Impl_basic_contract_caller_OtherContract.

(* StructRecord
  {
    name := "BasicContractCaller";
    ty_params := [];
    fields := [ ("other_contract", Ty.path "basic_contract_caller::OtherContract") ];
  } *)

Module Impl_basic_contract_caller_BasicContractCaller.
  Definition Self : Ty.t := Ty.path "basic_contract_caller::BasicContractCaller".
  
  (*
      pub fn new(other_contract_code_hash: Hash) -> Self {
          // let other_contract = OtherContract::new(true)
          //     .code_hash(other_contract_code_hash)
          //     .endowment(0)
          //     .salt_bytes([0xDE, 0xAD, 0xBE, 0xEF])
          //     .instantiate();
          let other_contract = todo!();
  
          Self { other_contract }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ other_contract_code_hash ] =>
      ltac:(M.monadic
        (let other_contract_code_hash := M.alloc (| other_contract_code_hash |) in
        M.read (|
          let other_contract :=
            M.alloc (|
              M.never_to_any (|
                M.call_closure (|
                  M.get_function (| "core::panicking::panic", [] |),
                  [ M.read (| Value.String "not yet implemented" |) ]
                |)
              |)
            |) in
          M.alloc (|
            Value.StructRecord
              "basic_contract_caller::BasicContractCaller"
              [ ("other_contract", M.read (| other_contract |)) ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn flip_and_get(&mut self) -> bool {
          self.other_contract.flip();
          self.other_contract.get()
      }
  *)
  Definition flip_and_get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "basic_contract_caller::OtherContract",
                  "flip",
                  []
                |),
                [
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "basic_contract_caller::BasicContractCaller",
                    "other_contract"
                  |)
                ]
              |)
            |) in
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "basic_contract_caller::OtherContract",
                "get",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "basic_contract_caller::BasicContractCaller",
                  "other_contract"
                |)
              ]
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_flip_and_get : M.IsAssociatedFunction Self "flip_and_get" flip_and_get.
End Impl_basic_contract_caller_BasicContractCaller.
