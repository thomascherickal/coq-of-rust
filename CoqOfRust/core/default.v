(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module default.
  (* Trait *)
  (* Empty module 'Default' *)
  
  Module Impl_core_default_Default_for_Tuple_.
    Definition Self : Ty.t := Ty.tuple [].
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Tuple [])) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_Tuple_.
  
  Module Impl_core_default_Default_for_bool.
    Definition Self : Ty.t := Ty.path "bool".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Bool false)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_bool.
  
  Module Impl_core_default_Default_for_char.
    Definition Self : Ty.t := Ty.path "char".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.UnicodeChar 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_char.
  
  Module Impl_core_default_Default_for_usize.
    Definition Self : Ty.t := Ty.path "usize".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_usize.
  
  Module Impl_core_default_Default_for_u8.
    Definition Self : Ty.t := Ty.path "u8".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_u8.
  
  Module Impl_core_default_Default_for_u16.
    Definition Self : Ty.t := Ty.path "u16".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_u16.
  
  Module Impl_core_default_Default_for_u32.
    Definition Self : Ty.t := Ty.path "u32".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_u32.
  
  Module Impl_core_default_Default_for_u64.
    Definition Self : Ty.t := Ty.path "u64".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_u64.
  
  Module Impl_core_default_Default_for_u128.
    Definition Self : Ty.t := Ty.path "u128".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_u128.
  
  Module Impl_core_default_Default_for_isize.
    Definition Self : Ty.t := Ty.path "isize".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_isize.
  
  Module Impl_core_default_Default_for_i8.
    Definition Self : Ty.t := Ty.path "i8".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_i8.
  
  Module Impl_core_default_Default_for_i16.
    Definition Self : Ty.t := Ty.path "i16".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_i16.
  
  Module Impl_core_default_Default_for_i32.
    Definition Self : Ty.t := Ty.path "i32".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_i32.
  
  Module Impl_core_default_Default_for_i64.
    Definition Self : Ty.t := Ty.path "i64".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_i64.
  
  Module Impl_core_default_Default_for_i128.
    Definition Self : Ty.t := Ty.path "i128".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with | [], [] => ltac:(M.monadic (Value.Integer 0)) | _, _ => M.impossible end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_i128.
  
  Module Impl_core_default_Default_for_f32.
    Definition Self : Ty.t := Ty.path "f32".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] => ltac:(M.monadic (M.read (| UnsupportedLiteral |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_f32.
  
  Module Impl_core_default_Default_for_f64.
    Definition Self : Ty.t := Ty.path "f64".
    
    (*
                fn default() -> $t {
                    $v
                }
    *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] => ltac:(M.monadic (M.read (| UnsupportedLiteral |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_f64.
End default.
