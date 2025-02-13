(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module slice.
  Module raw.
    (*
    pub const unsafe fn from_raw_parts<'a, T>(data: *const T, len: usize) -> &'a [T] {
        // SAFETY: the caller must uphold the safety contract for `from_raw_parts`.
        unsafe {
            assert_unsafe_precondition!(
                "slice::from_raw_parts requires the pointer to be aligned and non-null, and the total size of the slice not to exceed `isize::MAX`",
                [T](data: *const T, len: usize) => is_aligned_and_not_null(data)
                    && is_valid_allocation_size::<T>(len)
            );
            &*ptr::slice_from_raw_parts(data, len)
        }
    }
    *)
    Definition from_raw_parts (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ T ], [ data; len ] =>
        ltac:(M.monadic
          (let data := M.alloc (| data |) in
          let len := M.alloc (| len |) in
          M.read (|
            let _ :=
              M.match_operator (|
                M.alloc (| Value.Tuple [] |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.use (M.alloc (| Value.Bool true |)) in
                      let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                      let _ :=
                        M.alloc (|
                          M.call_closure (|
                            M.get_function (|
                              "core::intrinsics::const_eval_select",
                              [
                                Ty.tuple [ Ty.apply (Ty.path "*const") [ T ]; Ty.path "usize" ];
                                Ty.function
                                  [ Ty.apply (Ty.path "*const") [ T ]; Ty.path "usize" ]
                                  (Ty.tuple []);
                                Ty.function
                                  [ Ty.apply (Ty.path "*const") [ T ]; Ty.path "usize" ]
                                  (Ty.tuple []);
                                Ty.tuple []
                              ]
                            |),
                            [
                              Value.Tuple [ M.read (| data |); M.read (| len |) ];
                              M.get_function (| "core::slice::raw::from_raw_parts.comptime", [] |);
                              M.get_function (| "core::slice::raw::from_raw_parts.runtime", [] |)
                            ]
                          |)
                        |) in
                      M.alloc (| Value.Tuple [] |)));
                  fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                ]
              |) in
            M.alloc (|
              M.call_closure (|
                M.get_function (| "core::ptr::slice_from_raw_parts", [ T ] |),
                [ M.read (| data |); M.read (| len |) ]
              |)
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    (*
    pub const unsafe fn from_raw_parts_mut<'a, T>(data: *mut T, len: usize) -> &'a mut [T] {
        // SAFETY: the caller must uphold the safety contract for `from_raw_parts_mut`.
        unsafe {
            assert_unsafe_precondition!(
                "slice::from_raw_parts_mut requires the pointer to be aligned and non-null, and the total size of the slice not to exceed `isize::MAX`",
                [T](data: *mut T, len: usize) => is_aligned_and_not_null(data)
                    && is_valid_allocation_size::<T>(len)
            );
            &mut *ptr::slice_from_raw_parts_mut(data, len)
        }
    }
    *)
    Definition from_raw_parts_mut (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ T ], [ data; len ] =>
        ltac:(M.monadic
          (let data := M.alloc (| data |) in
          let len := M.alloc (| len |) in
          M.read (|
            let _ :=
              M.match_operator (|
                M.alloc (| Value.Tuple [] |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.use (M.alloc (| Value.Bool true |)) in
                      let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                      let _ :=
                        M.alloc (|
                          M.call_closure (|
                            M.get_function (|
                              "core::intrinsics::const_eval_select",
                              [
                                Ty.tuple [ Ty.apply (Ty.path "*mut") [ T ]; Ty.path "usize" ];
                                Ty.function
                                  [ Ty.apply (Ty.path "*mut") [ T ]; Ty.path "usize" ]
                                  (Ty.tuple []);
                                Ty.function
                                  [ Ty.apply (Ty.path "*mut") [ T ]; Ty.path "usize" ]
                                  (Ty.tuple []);
                                Ty.tuple []
                              ]
                            |),
                            [
                              Value.Tuple [ M.read (| data |); M.read (| len |) ];
                              M.get_function (|
                                "core::slice::raw::from_raw_parts_mut.comptime",
                                []
                              |);
                              M.get_function (|
                                "core::slice::raw::from_raw_parts_mut.runtime",
                                []
                              |)
                            ]
                          |)
                        |) in
                      M.alloc (| Value.Tuple [] |)));
                  fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                ]
              |) in
            M.alloc (|
              M.call_closure (|
                M.get_function (| "core::ptr::slice_from_raw_parts_mut", [ T ] |),
                [ M.read (| data |); M.read (| len |) ]
              |)
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    (*
    pub const fn from_ref<T>(s: &T) -> &[T] {
        array::from_ref(s)
    }
    *)
    Definition from_ref (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ T ], [ s ] =>
        ltac:(M.monadic
          (let s := M.alloc (| s |) in
          (* Unsize *)
          M.pointer_coercion
            (M.call_closure (|
              M.get_function (| "core::array::from_ref", [ T ] |),
              [ M.read (| s |) ]
            |))))
      | _, _ => M.impossible
      end.
    
    (*
    pub const fn from_mut<T>(s: &mut T) -> &mut [T] {
        array::from_mut(s)
    }
    *)
    Definition from_mut (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ T ], [ s ] =>
        ltac:(M.monadic
          (let s := M.alloc (| s |) in
          (* Unsize *)
          M.pointer_coercion
            (M.call_closure (|
              M.get_function (| "core::array::from_mut", [ T ] |),
              [ M.read (| s |) ]
            |))))
      | _, _ => M.impossible
      end.
    
    (*
    pub const unsafe fn from_ptr_range<'a, T>(range: Range<*const T>) -> &'a [T] {
        // SAFETY: the caller must uphold the safety contract for `from_ptr_range`.
        unsafe { from_raw_parts(range.start, range.end.sub_ptr(range.start)) }
    }
    *)
    Definition from_ptr_range (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ T ], [ range ] =>
        ltac:(M.monadic
          (let range := M.alloc (| range |) in
          M.call_closure (|
            M.get_function (| "core::slice::raw::from_raw_parts", [ T ] |),
            [
              M.read (|
                M.SubPointer.get_struct_record_field (| range, "core::ops::range::Range", "start" |)
              |);
              M.call_closure (|
                M.get_associated_function (| Ty.apply (Ty.path "*const") [ T ], "sub_ptr", [] |),
                [
                  M.read (|
                    M.SubPointer.get_struct_record_field (|
                      range,
                      "core::ops::range::Range",
                      "end"
                    |)
                  |);
                  M.read (|
                    M.SubPointer.get_struct_record_field (|
                      range,
                      "core::ops::range::Range",
                      "start"
                    |)
                  |)
                ]
              |)
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    (*
    pub const unsafe fn from_mut_ptr_range<'a, T>(range: Range<*mut T>) -> &'a mut [T] {
        // SAFETY: the caller must uphold the safety contract for `from_mut_ptr_range`.
        unsafe { from_raw_parts_mut(range.start, range.end.sub_ptr(range.start)) }
    }
    *)
    Definition from_mut_ptr_range (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ T ], [ range ] =>
        ltac:(M.monadic
          (let range := M.alloc (| range |) in
          M.call_closure (|
            M.get_function (| "core::slice::raw::from_raw_parts_mut", [ T ] |),
            [
              M.read (|
                M.SubPointer.get_struct_record_field (| range, "core::ops::range::Range", "start" |)
              |);
              M.call_closure (|
                M.get_associated_function (| Ty.apply (Ty.path "*mut") [ T ], "sub_ptr", [] |),
                [
                  M.read (|
                    M.SubPointer.get_struct_record_field (|
                      range,
                      "core::ops::range::Range",
                      "end"
                    |)
                  |);
                  (* MutToConstPointer *)
                  M.pointer_coercion
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        range,
                        "core::ops::range::Range",
                        "start"
                      |)
                    |))
                ]
              |)
            ]
          |)))
      | _, _ => M.impossible
      end.
  End raw.
End slice.
