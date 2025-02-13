(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module num.
  Module flt2dec.
    Module decoder.
      (* StructRecord
        {
          name := "Decoded";
          ty_params := [];
          fields :=
            [
              ("mant", Ty.path "u64");
              ("minus", Ty.path "u64");
              ("plus", Ty.path "u64");
              ("exp", Ty.path "i16");
              ("inclusive", Ty.path "bool")
            ];
        } *)
      
      Module Impl_core_marker_Copy_for_core_num_flt2dec_decoder_Decoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::Decoded".
        
        Axiom Implements :
          M.IsTraitInstance
            "core::marker::Copy"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_Copy_for_core_num_flt2dec_decoder_Decoded.
      
      Module Impl_core_clone_Clone_for_core_num_flt2dec_decoder_Decoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::Decoded".
        
        (* Clone *)
        Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.read (|
                M.match_operator (|
                  Value.DeclaredButUndefined,
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (M.match_operator (|
                          Value.DeclaredButUndefined,
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (M.match_operator (|
                                  Value.DeclaredButUndefined,
                                  [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
                                |)))
                          ]
                        |)))
                  ]
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
      End Impl_core_clone_Clone_for_core_num_flt2dec_decoder_Decoded.
      
      Module Impl_core_fmt_Debug_for_core_num_flt2dec_decoder_Decoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::Decoded".
        
        (* Debug *)
        Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self; f ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let f := M.alloc (| f |) in
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "core::fmt::Formatter",
                  "debug_struct_field5_finish",
                  []
                |),
                [
                  M.read (| f |);
                  M.read (| Value.String "Decoded" |);
                  M.read (| Value.String "mant" |);
                  (* Unsize *)
                  M.pointer_coercion
                    (M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::num::flt2dec::decoder::Decoded",
                      "mant"
                    |));
                  M.read (| Value.String "minus" |);
                  (* Unsize *)
                  M.pointer_coercion
                    (M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::num::flt2dec::decoder::Decoded",
                      "minus"
                    |));
                  M.read (| Value.String "plus" |);
                  (* Unsize *)
                  M.pointer_coercion
                    (M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::num::flt2dec::decoder::Decoded",
                      "plus"
                    |));
                  M.read (| Value.String "exp" |);
                  (* Unsize *)
                  M.pointer_coercion
                    (M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::num::flt2dec::decoder::Decoded",
                      "exp"
                    |));
                  M.read (| Value.String "inclusive" |);
                  (* Unsize *)
                  M.pointer_coercion
                    (M.alloc (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::num::flt2dec::decoder::Decoded",
                        "inclusive"
                      |)
                    |))
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
      End Impl_core_fmt_Debug_for_core_num_flt2dec_decoder_Decoded.
      
      Module Impl_core_marker_StructuralPartialEq_for_core_num_flt2dec_decoder_Decoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::Decoded".
        
        Axiom Implements :
          M.IsTraitInstance
            "core::marker::StructuralPartialEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_StructuralPartialEq_for_core_num_flt2dec_decoder_Decoded.
      
      Module Impl_core_cmp_PartialEq_for_core_num_flt2dec_decoder_Decoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::Decoded".
        
        (* PartialEq *)
        Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self; other ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let other := M.alloc (| other |) in
              LogicalOp.and (|
                LogicalOp.and (|
                  LogicalOp.and (|
                    LogicalOp.and (|
                      BinOp.Pure.eq
                        (M.read (|
                          M.SubPointer.get_struct_record_field (|
                            M.read (| self |),
                            "core::num::flt2dec::decoder::Decoded",
                            "mant"
                          |)
                        |))
                        (M.read (|
                          M.SubPointer.get_struct_record_field (|
                            M.read (| other |),
                            "core::num::flt2dec::decoder::Decoded",
                            "mant"
                          |)
                        |)),
                      ltac:(M.monadic
                        (BinOp.Pure.eq
                          (M.read (|
                            M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "core::num::flt2dec::decoder::Decoded",
                              "minus"
                            |)
                          |))
                          (M.read (|
                            M.SubPointer.get_struct_record_field (|
                              M.read (| other |),
                              "core::num::flt2dec::decoder::Decoded",
                              "minus"
                            |)
                          |))))
                    |),
                    ltac:(M.monadic
                      (BinOp.Pure.eq
                        (M.read (|
                          M.SubPointer.get_struct_record_field (|
                            M.read (| self |),
                            "core::num::flt2dec::decoder::Decoded",
                            "plus"
                          |)
                        |))
                        (M.read (|
                          M.SubPointer.get_struct_record_field (|
                            M.read (| other |),
                            "core::num::flt2dec::decoder::Decoded",
                            "plus"
                          |)
                        |))))
                  |),
                  ltac:(M.monadic
                    (BinOp.Pure.eq
                      (M.read (|
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "core::num::flt2dec::decoder::Decoded",
                          "exp"
                        |)
                      |))
                      (M.read (|
                        M.SubPointer.get_struct_record_field (|
                          M.read (| other |),
                          "core::num::flt2dec::decoder::Decoded",
                          "exp"
                        |)
                      |))))
                |),
                ltac:(M.monadic
                  (BinOp.Pure.eq
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::num::flt2dec::decoder::Decoded",
                        "inclusive"
                      |)
                    |))
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "core::num::flt2dec::decoder::Decoded",
                        "inclusive"
                      |)
                    |))))
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::cmp::PartialEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("eq", InstanceField.Method eq) ].
      End Impl_core_cmp_PartialEq_for_core_num_flt2dec_decoder_Decoded.
      
      Module Impl_core_marker_StructuralEq_for_core_num_flt2dec_decoder_Decoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::Decoded".
        
        Axiom Implements :
          M.IsTraitInstance
            "core::marker::StructuralEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_StructuralEq_for_core_num_flt2dec_decoder_Decoded.
      
      Module Impl_core_cmp_Eq_for_core_num_flt2dec_decoder_Decoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::Decoded".
        
        (* Eq *)
        Definition assert_receiver_is_total_eq (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.read (|
                M.match_operator (|
                  Value.DeclaredButUndefined,
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (M.match_operator (|
                          Value.DeclaredButUndefined,
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (M.match_operator (|
                                  Value.DeclaredButUndefined,
                                  [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
                                |)))
                          ]
                        |)))
                  ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::cmp::Eq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *)
            [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
      End Impl_core_cmp_Eq_for_core_num_flt2dec_decoder_Decoded.
      
      (*
      Enum FullDecoded
      {
        ty_params := [];
        variants :=
          [
            {
              name := "Nan";
              item := StructTuple [];
              discriminant := None;
            };
            {
              name := "Infinite";
              item := StructTuple [];
              discriminant := None;
            };
            {
              name := "Zero";
              item := StructTuple [];
              discriminant := None;
            };
            {
              name := "Finite";
              item := StructTuple [ Ty.path "core::num::flt2dec::decoder::Decoded" ];
              discriminant := None;
            }
          ];
      }
      *)
      
      Module Impl_core_marker_Copy_for_core_num_flt2dec_decoder_FullDecoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::FullDecoded".
        
        Axiom Implements :
          M.IsTraitInstance
            "core::marker::Copy"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_Copy_for_core_num_flt2dec_decoder_FullDecoded.
      
      Module Impl_core_clone_Clone_for_core_num_flt2dec_decoder_FullDecoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::FullDecoded".
        
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
      End Impl_core_clone_Clone_for_core_num_flt2dec_decoder_FullDecoded.
      
      Module Impl_core_fmt_Debug_for_core_num_flt2dec_decoder_FullDecoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::FullDecoded".
        
        (* Debug *)
        Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self; f ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let f := M.alloc (| f |) in
              M.read (|
                M.match_operator (|
                  self,
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ := M.read (| γ |) in
                        M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Formatter",
                              "write_str",
                              []
                            |),
                            [ M.read (| f |); M.read (| Value.String "Nan" |) ]
                          |)
                        |)));
                    fun γ =>
                      ltac:(M.monadic
                        (let γ := M.read (| γ |) in
                        M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Formatter",
                              "write_str",
                              []
                            |),
                            [ M.read (| f |); M.read (| Value.String "Infinite" |) ]
                          |)
                        |)));
                    fun γ =>
                      ltac:(M.monadic
                        (let γ := M.read (| γ |) in
                        M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Formatter",
                              "write_str",
                              []
                            |),
                            [ M.read (| f |); M.read (| Value.String "Zero" |) ]
                          |)
                        |)));
                    fun γ =>
                      ltac:(M.monadic
                        (let γ := M.read (| γ |) in
                        let γ1_0 :=
                          M.SubPointer.get_struct_tuple_field (|
                            γ,
                            "core::num::flt2dec::decoder::FullDecoded::Finite",
                            0
                          |) in
                        let __self_0 := M.alloc (| γ1_0 |) in
                        M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Formatter",
                              "debug_tuple_field1_finish",
                              []
                            |),
                            [
                              M.read (| f |);
                              M.read (| Value.String "Finite" |);
                              (* Unsize *) M.pointer_coercion __self_0
                            ]
                          |)
                        |)))
                  ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::fmt::Debug"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
      End Impl_core_fmt_Debug_for_core_num_flt2dec_decoder_FullDecoded.
      
      Module Impl_core_marker_StructuralPartialEq_for_core_num_flt2dec_decoder_FullDecoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::FullDecoded".
        
        Axiom Implements :
          M.IsTraitInstance
            "core::marker::StructuralPartialEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_StructuralPartialEq_for_core_num_flt2dec_decoder_FullDecoded.
      
      Module Impl_core_cmp_PartialEq_for_core_num_flt2dec_decoder_FullDecoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::FullDecoded".
        
        (* PartialEq *)
        Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self; other ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let other := M.alloc (| other |) in
              M.read (|
                let __self_tag :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_function (|
                        "core::intrinsics::discriminant_value",
                        [ Ty.path "core::num::flt2dec::decoder::FullDecoded" ]
                      |),
                      [ M.read (| self |) ]
                    |)
                  |) in
                let __arg1_tag :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_function (|
                        "core::intrinsics::discriminant_value",
                        [ Ty.path "core::num::flt2dec::decoder::FullDecoded" ]
                      |),
                      [ M.read (| other |) ]
                    |)
                  |) in
                M.alloc (|
                  LogicalOp.and (|
                    BinOp.Pure.eq (M.read (| __self_tag |)) (M.read (| __arg1_tag |)),
                    ltac:(M.monadic
                      (M.read (|
                        M.match_operator (|
                          M.alloc (| Value.Tuple [ M.read (| self |); M.read (| other |) ] |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                                let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                                let γ0_0 := M.read (| γ0_0 |) in
                                let γ2_0 :=
                                  M.SubPointer.get_struct_tuple_field (|
                                    γ0_0,
                                    "core::num::flt2dec::decoder::FullDecoded::Finite",
                                    0
                                  |) in
                                let __self_0 := M.alloc (| γ2_0 |) in
                                let γ0_1 := M.read (| γ0_1 |) in
                                let γ2_0 :=
                                  M.SubPointer.get_struct_tuple_field (|
                                    γ0_1,
                                    "core::num::flt2dec::decoder::FullDecoded::Finite",
                                    0
                                  |) in
                                let __arg1_0 := M.alloc (| γ2_0 |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_trait_method (|
                                      "core::cmp::PartialEq",
                                      Ty.path "core::num::flt2dec::decoder::Decoded",
                                      [ Ty.path "core::num::flt2dec::decoder::Decoded" ],
                                      "eq",
                                      []
                                    |),
                                    [ M.read (| __self_0 |); M.read (| __arg1_0 |) ]
                                  |)
                                |)));
                            fun γ => ltac:(M.monadic (M.alloc (| Value.Bool true |)))
                          ]
                        |)
                      |)))
                  |)
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::cmp::PartialEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("eq", InstanceField.Method eq) ].
      End Impl_core_cmp_PartialEq_for_core_num_flt2dec_decoder_FullDecoded.
      
      Module Impl_core_marker_StructuralEq_for_core_num_flt2dec_decoder_FullDecoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::FullDecoded".
        
        Axiom Implements :
          M.IsTraitInstance
            "core::marker::StructuralEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_StructuralEq_for_core_num_flt2dec_decoder_FullDecoded.
      
      Module Impl_core_cmp_Eq_for_core_num_flt2dec_decoder_FullDecoded.
        Definition Self : Ty.t := Ty.path "core::num::flt2dec::decoder::FullDecoded".
        
        (* Eq *)
        Definition assert_receiver_is_total_eq (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.read (|
                M.match_operator (|
                  Value.DeclaredButUndefined,
                  [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::cmp::Eq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *)
            [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
      End Impl_core_cmp_Eq_for_core_num_flt2dec_decoder_FullDecoded.
      
      (* Trait *)
      (* Empty module 'DecodableFloat' *)
      
      Module Impl_core_num_flt2dec_decoder_DecodableFloat_for_f32.
        Definition Self : Ty.t := Ty.path "f32".
        
        (*
            fn min_pos_norm_value() -> Self {
                f32::MIN_POSITIVE
            }
        *)
        Definition min_pos_norm_value (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [] => ltac:(M.monadic (M.read (| M.get_constant (| "core::f32::MIN_POSITIVE" |) |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::num::flt2dec::decoder::DecodableFloat"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("min_pos_norm_value", InstanceField.Method min_pos_norm_value) ].
      End Impl_core_num_flt2dec_decoder_DecodableFloat_for_f32.
      
      Module Impl_core_num_flt2dec_decoder_DecodableFloat_for_f64.
        Definition Self : Ty.t := Ty.path "f64".
        
        (*
            fn min_pos_norm_value() -> Self {
                f64::MIN_POSITIVE
            }
        *)
        Definition min_pos_norm_value (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [] => ltac:(M.monadic (M.read (| M.get_constant (| "core::f64::MIN_POSITIVE" |) |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::num::flt2dec::decoder::DecodableFloat"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("min_pos_norm_value", InstanceField.Method min_pos_norm_value) ].
      End Impl_core_num_flt2dec_decoder_DecodableFloat_for_f64.
      
      (*
      pub fn decode<T: DecodableFloat>(v: T) -> (/*negative?*/ bool, FullDecoded) {
          let (mant, exp, sign) = v.integer_decode();
          let even = (mant & 1) == 0;
          let decoded = match v.classify() {
              FpCategory::Nan => FullDecoded::Nan,
              FpCategory::Infinite => FullDecoded::Infinite,
              FpCategory::Zero => FullDecoded::Zero,
              FpCategory::Subnormal => {
                  // neighbors: (mant - 2, exp) -- (mant, exp) -- (mant + 2, exp)
                  // Float::integer_decode always preserves the exponent,
                  // so the mantissa is scaled for subnormals.
                  FullDecoded::Finite(Decoded { mant, minus: 1, plus: 1, exp, inclusive: even })
              }
              FpCategory::Normal => {
                  let minnorm = <T as DecodableFloat>::min_pos_norm_value().integer_decode();
                  if mant == minnorm.0 {
                      // neighbors: (maxmant, exp - 1) -- (minnormmant, exp) -- (minnormmant + 1, exp)
                      // where maxmant = minnormmant * 2 - 1
                      FullDecoded::Finite(Decoded {
                          mant: mant << 2,
                          minus: 1,
                          plus: 2,
                          exp: exp - 2,
                          inclusive: even,
                      })
                  } else {
                      // neighbors: (mant - 1, exp) -- (mant, exp) -- (mant + 1, exp)
                      FullDecoded::Finite(Decoded {
                          mant: mant << 1,
                          minus: 1,
                          plus: 1,
                          exp: exp - 1,
                          inclusive: even,
                      })
                  }
              }
          };
          (sign < 0, decoded)
      }
      *)
      Definition decode (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [ T ], [ v ] =>
          ltac:(M.monadic
            (let v := M.alloc (| v |) in
            M.read (|
              M.match_operator (|
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::num::dec2flt::float::RawFloat",
                      T,
                      [],
                      "integer_decode",
                      []
                    |),
                    [ M.read (| v |) ]
                  |)
                |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                      let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                      let γ0_2 := M.SubPointer.get_tuple_field (| γ, 2 |) in
                      let mant := M.copy (| γ0_0 |) in
                      let exp := M.copy (| γ0_1 |) in
                      let sign := M.copy (| γ0_2 |) in
                      let even :=
                        M.alloc (|
                          BinOp.Pure.eq
                            (BinOp.Pure.bit_and (M.read (| mant |)) (Value.Integer 1))
                            (Value.Integer 0)
                        |) in
                      let decoded :=
                        M.copy (|
                          M.match_operator (|
                            M.alloc (|
                              M.call_closure (|
                                M.get_trait_method (|
                                  "core::num::dec2flt::float::RawFloat",
                                  T,
                                  [],
                                  "classify",
                                  []
                                |),
                                [ M.read (| v |) ]
                              |)
                            |),
                            [
                              fun γ =>
                                ltac:(M.monadic
                                  (M.alloc (|
                                    Value.StructTuple
                                      "core::num::flt2dec::decoder::FullDecoded::Nan"
                                      []
                                  |)));
                              fun γ =>
                                ltac:(M.monadic
                                  (M.alloc (|
                                    Value.StructTuple
                                      "core::num::flt2dec::decoder::FullDecoded::Infinite"
                                      []
                                  |)));
                              fun γ =>
                                ltac:(M.monadic
                                  (M.alloc (|
                                    Value.StructTuple
                                      "core::num::flt2dec::decoder::FullDecoded::Zero"
                                      []
                                  |)));
                              fun γ =>
                                ltac:(M.monadic
                                  (M.alloc (|
                                    Value.StructTuple
                                      "core::num::flt2dec::decoder::FullDecoded::Finite"
                                      [
                                        Value.StructRecord
                                          "core::num::flt2dec::decoder::Decoded"
                                          [
                                            ("mant", M.read (| mant |));
                                            ("minus", Value.Integer 1);
                                            ("plus", Value.Integer 1);
                                            ("exp", M.read (| exp |));
                                            ("inclusive", M.read (| even |))
                                          ]
                                      ]
                                  |)));
                              fun γ =>
                                ltac:(M.monadic
                                  (let minnorm :=
                                    M.alloc (|
                                      M.call_closure (|
                                        M.get_trait_method (|
                                          "core::num::dec2flt::float::RawFloat",
                                          T,
                                          [],
                                          "integer_decode",
                                          []
                                        |),
                                        [
                                          M.call_closure (|
                                            M.get_trait_method (|
                                              "core::num::flt2dec::decoder::DecodableFloat",
                                              T,
                                              [],
                                              "min_pos_norm_value",
                                              []
                                            |),
                                            []
                                          |)
                                        ]
                                      |)
                                    |) in
                                  M.match_operator (|
                                    M.alloc (| Value.Tuple [] |),
                                    [
                                      fun γ =>
                                        ltac:(M.monadic
                                          (let γ :=
                                            M.use
                                              (M.alloc (|
                                                BinOp.Pure.eq
                                                  (M.read (| mant |))
                                                  (M.read (|
                                                    M.SubPointer.get_tuple_field (| minnorm, 0 |)
                                                  |))
                                              |)) in
                                          let _ :=
                                            M.is_constant_or_break_match (|
                                              M.read (| γ |),
                                              Value.Bool true
                                            |) in
                                          M.alloc (|
                                            Value.StructTuple
                                              "core::num::flt2dec::decoder::FullDecoded::Finite"
                                              [
                                                Value.StructRecord
                                                  "core::num::flt2dec::decoder::Decoded"
                                                  [
                                                    ("mant",
                                                      BinOp.Panic.shl (|
                                                        M.read (| mant |),
                                                        Value.Integer 2
                                                      |));
                                                    ("minus", Value.Integer 1);
                                                    ("plus", Value.Integer 2);
                                                    ("exp",
                                                      BinOp.Panic.sub (|
                                                        Integer.I16,
                                                        M.read (| exp |),
                                                        Value.Integer 2
                                                      |));
                                                    ("inclusive", M.read (| even |))
                                                  ]
                                              ]
                                          |)));
                                      fun γ =>
                                        ltac:(M.monadic
                                          (M.alloc (|
                                            Value.StructTuple
                                              "core::num::flt2dec::decoder::FullDecoded::Finite"
                                              [
                                                Value.StructRecord
                                                  "core::num::flt2dec::decoder::Decoded"
                                                  [
                                                    ("mant",
                                                      BinOp.Panic.shl (|
                                                        M.read (| mant |),
                                                        Value.Integer 1
                                                      |));
                                                    ("minus", Value.Integer 1);
                                                    ("plus", Value.Integer 1);
                                                    ("exp",
                                                      BinOp.Panic.sub (|
                                                        Integer.I16,
                                                        M.read (| exp |),
                                                        Value.Integer 1
                                                      |));
                                                    ("inclusive", M.read (| even |))
                                                  ]
                                              ]
                                          |)))
                                    ]
                                  |)))
                            ]
                          |)
                        |) in
                      M.alloc (|
                        Value.Tuple
                          [
                            BinOp.Pure.lt (M.read (| sign |)) (Value.Integer 0);
                            M.read (| decoded |)
                          ]
                      |)))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
    End decoder.
  End flt2dec.
End num.
