(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module mem.
  (*
  pub const fn forget<T>(t: T) {
      let _ = ManuallyDrop::new(t);
  }
  *)
  Definition forget (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ t ] =>
      ltac:(M.monadic
        (let t := M.alloc (| t |) in
        M.read (|
          M.match_operator (|
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply (Ty.path "core::mem::manually_drop::ManuallyDrop") [ T ],
                  "new",
                  []
                |),
                [ M.read (| t |) ]
              |)
            |),
            [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub fn forget_unsized<T: ?Sized>(t: T) {
      intrinsics::forget(t)
  }
  *)
  Definition forget_unsized (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ t ] =>
      ltac:(M.monadic
        (let t := M.alloc (| t |) in
        M.call_closure (|
          M.get_function (| "core::intrinsics::forget", [ T ] |),
          [ M.read (| t |) ]
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const fn size_of<T>() -> usize {
      intrinsics::size_of::<T>()
  }
  *)
  Definition size_of (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [] =>
      ltac:(M.monadic
        (M.call_closure (| M.get_function (| "core::intrinsics::size_of", [ T ] |), [] |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const fn size_of_val<T: ?Sized>(val: &T) -> usize {
      // SAFETY: `val` is a reference, so it's a valid raw pointer
      unsafe { intrinsics::size_of_val(val) }
  }
  *)
  Definition size_of_val (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ val ] =>
      ltac:(M.monadic
        (let val := M.alloc (| val |) in
        M.call_closure (|
          M.get_function (| "core::intrinsics::size_of_val", [ T ] |),
          [ M.read (| val |) ]
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const unsafe fn size_of_val_raw<T: ?Sized>(val: *const T) -> usize {
      // SAFETY: the caller must provide a valid raw pointer
      unsafe { intrinsics::size_of_val(val) }
  }
  *)
  Definition size_of_val_raw (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ val ] =>
      ltac:(M.monadic
        (let val := M.alloc (| val |) in
        M.call_closure (|
          M.get_function (| "core::intrinsics::size_of_val", [ T ] |),
          [ M.read (| val |) ]
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub fn min_align_of<T>() -> usize {
      intrinsics::min_align_of::<T>()
  }
  *)
  Definition min_align_of (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [] =>
      ltac:(M.monadic
        (M.call_closure (| M.get_function (| "core::intrinsics::min_align_of", [ T ] |), [] |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub fn min_align_of_val<T: ?Sized>(val: &T) -> usize {
      // SAFETY: val is a reference, so it's a valid raw pointer
      unsafe { intrinsics::min_align_of_val(val) }
  }
  *)
  Definition min_align_of_val (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ val ] =>
      ltac:(M.monadic
        (let val := M.alloc (| val |) in
        M.call_closure (|
          M.get_function (| "core::intrinsics::min_align_of_val", [ T ] |),
          [ M.read (| val |) ]
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const fn align_of<T>() -> usize {
      intrinsics::min_align_of::<T>()
  }
  *)
  Definition align_of (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [] =>
      ltac:(M.monadic
        (M.call_closure (| M.get_function (| "core::intrinsics::min_align_of", [ T ] |), [] |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const fn align_of_val<T: ?Sized>(val: &T) -> usize {
      // SAFETY: val is a reference, so it's a valid raw pointer
      unsafe { intrinsics::min_align_of_val(val) }
  }
  *)
  Definition align_of_val (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ val ] =>
      ltac:(M.monadic
        (let val := M.alloc (| val |) in
        M.call_closure (|
          M.get_function (| "core::intrinsics::min_align_of_val", [ T ] |),
          [ M.read (| val |) ]
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const unsafe fn align_of_val_raw<T: ?Sized>(val: *const T) -> usize {
      // SAFETY: the caller must provide a valid raw pointer
      unsafe { intrinsics::min_align_of_val(val) }
  }
  *)
  Definition align_of_val_raw (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ val ] =>
      ltac:(M.monadic
        (let val := M.alloc (| val |) in
        M.call_closure (|
          M.get_function (| "core::intrinsics::min_align_of_val", [ T ] |),
          [ M.read (| val |) ]
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const fn needs_drop<T: ?Sized>() -> bool {
      intrinsics::needs_drop::<T>()
  }
  *)
  Definition needs_drop (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [] =>
      ltac:(M.monadic
        (M.call_closure (| M.get_function (| "core::intrinsics::needs_drop", [ T ] |), [] |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const unsafe fn zeroed<T>() -> T {
      // SAFETY: the caller must guarantee that an all-zero value is valid for `T`.
      unsafe {
          intrinsics::assert_zero_valid::<T>();
          MaybeUninit::zeroed().assume_init()
      }
  }
  *)
  Definition zeroed (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [] =>
      ltac:(M.monadic
        (M.read (|
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "core::intrinsics::assert_zero_valid", [ T ] |),
                []
              |)
            |) in
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "core::mem::maybe_uninit::MaybeUninit") [ T ],
                "assume_init",
                []
              |),
              [
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply (Ty.path "core::mem::maybe_uninit::MaybeUninit") [ T ],
                    "zeroed",
                    []
                  |),
                  []
                |)
              ]
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub unsafe fn uninitialized<T>() -> T {
      // SAFETY: the caller must guarantee that an uninitialized value is valid for `T`.
      unsafe {
          intrinsics::assert_mem_uninitialized_valid::<T>();
          let mut val = MaybeUninit::<T>::uninit();
  
          // Fill memory with 0x01, as an imperfect mitigation for old code that uses this function on
          // bool, nonnull, and noundef types. But don't do this if we actively want to detect UB.
          if !cfg!(any(miri, sanitize = "memory")) {
              val.as_mut_ptr().write_bytes(0x01, 1);
          }
  
          val.assume_init()
      }
  }
  *)
  Definition uninitialized (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [] =>
      ltac:(M.monadic
        (M.read (|
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "core::intrinsics::assert_mem_uninitialized_valid", [ T ] |),
                []
              |)
            |) in
          let val :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply (Ty.path "core::mem::maybe_uninit::MaybeUninit") [ T ],
                  "uninit",
                  []
                |),
                []
              |)
            |) in
          let _ :=
            M.match_operator (|
              M.alloc (| Value.Tuple [] |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.use (M.alloc (| UnOp.Pure.not (Value.Bool false) |)) in
                    let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                    let _ :=
                      M.alloc (|
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.apply (Ty.path "*mut") [ T ],
                            "write_bytes",
                            []
                          |),
                          [
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.apply (Ty.path "core::mem::maybe_uninit::MaybeUninit") [ T ],
                                "as_mut_ptr",
                                []
                              |),
                              [ val ]
                            |);
                            Value.Integer 1;
                            Value.Integer 1
                          ]
                        |)
                      |) in
                    M.alloc (| Value.Tuple [] |)));
                fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
              ]
            |) in
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "core::mem::maybe_uninit::MaybeUninit") [ T ],
                "assume_init",
                []
              |),
              [ M.read (| val |) ]
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const fn swap<T>(x: &mut T, y: &mut T) {
      // NOTE(eddyb) SPIR-V's Logical addressing model doesn't allow for arbitrary
      // reinterpretation of values as (chunkable) byte arrays, and the loop in the
      // block optimization in `swap_slice` is hard to rewrite back
      // into the (unoptimized) direct swapping implementation, so we disable it.
      #[cfg(not(any(target_arch = "spirv")))]
      {
          // For types that are larger multiples of their alignment, the simple way
          // tends to copy the whole thing to stack rather than doing it one part
          // at a time, so instead treat them as one-element slices and piggy-back
          // the slice optimizations that will split up the swaps.
          if size_of::<T>() / align_of::<T>() > 4 {
              // SAFETY: exclusive references always point to one non-overlapping
              // element and are non-null and properly aligned.
              return unsafe { ptr::swap_nonoverlapping(x, y, 1) };
          }
      }
  
      // If a scalar consists of just a small number of alignment units, let
      // the codegen just swap those pieces directly, as it's likely just a
      // few instructions and anything else is probably overcomplicated.
      //
      // Most importantly, this covers primitives and simd types that tend to
      // have size=align where doing anything else can be a pessimization.
      // (This will also be used for ZSTs, though any solution works for them.)
      swap_simple(x, y);
  }
  *)
  Definition swap (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ x; y ] =>
      ltac:(M.monadic
        (let x := M.alloc (| x |) in
        let y := M.alloc (| y |) in
        M.catch_return (|
          ltac:(M.monadic
            (M.read (|
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              BinOp.Pure.gt
                                (BinOp.Panic.div (|
                                  Integer.Usize,
                                  M.call_closure (|
                                    M.get_function (| "core::mem::size_of", [ T ] |),
                                    []
                                  |),
                                  M.call_closure (|
                                    M.get_function (| "core::mem::align_of", [ T ] |),
                                    []
                                  |)
                                |))
                                (Value.Integer 4)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        M.alloc (|
                          M.never_to_any (|
                            M.read (|
                              M.return_ (|
                                M.call_closure (|
                                  M.get_function (| "core::ptr::swap_nonoverlapping", [ T ] |),
                                  [ M.read (| x |); M.read (| y |); Value.Integer 1 ]
                                |)
                              |)
                            |)
                          |)
                        |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              let _ :=
                M.alloc (|
                  M.call_closure (|
                    M.get_function (| "core::mem::swap_simple", [ T ] |),
                    [ M.read (| x |); M.read (| y |) ]
                  |)
                |) in
              M.alloc (| Value.Tuple [] |)
            |)))
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub(crate) const fn swap_simple<T>(x: &mut T, y: &mut T) {
      // We arrange for this to typically be called with small types,
      // so this reads-and-writes approach is actually better than using
      // copy_nonoverlapping as it easily puts things in LLVM registers
      // directly and doesn't end up inlining allocas.
      // And LLVM actually optimizes it to 3×memcpy if called with
      // a type larger than it's willing to keep in a register.
      // Having typed reads and writes in MIR here is also good as
      // it lets Miri and CTFE understand them better, including things
      // like enforcing type validity for them.
      // Importantly, read+copy_nonoverlapping+write introduces confusing
      // asymmetry to the behaviour where one value went through read+write
      // whereas the other was copied over by the intrinsic (see #94371).
      // Furthermore, using only read+write here benefits limited backends
      // such as SPIR-V that work on an underlying *typed* view of memory,
      // and thus have trouble with Rust's untyped memory operations.
  
      // SAFETY: exclusive references are always valid to read/write,
      // including being aligned, and nothing here panics so it's drop-safe.
      unsafe {
          let a = ptr::read(x);
          let b = ptr::read(y);
          ptr::write(x, b);
          ptr::write(y, a);
      }
  }
  *)
  Definition swap_simple (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ x; y ] =>
      ltac:(M.monadic
        (let x := M.alloc (| x |) in
        let y := M.alloc (| y |) in
        M.read (|
          let a :=
            M.alloc (|
              M.call_closure (| M.get_function (| "core::ptr::read", [ T ] |), [ M.read (| x |) ] |)
            |) in
          let b :=
            M.alloc (|
              M.call_closure (| M.get_function (| "core::ptr::read", [ T ] |), [ M.read (| y |) ] |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "core::ptr::write", [ T ] |),
                [ M.read (| x |); M.read (| b |) ]
              |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "core::ptr::write", [ T ] |),
                [ M.read (| y |); M.read (| a |) ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub fn take<T: Default>(dest: &mut T) -> T {
      replace(dest, T::default())
  }
  *)
  Definition take (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ dest ] =>
      ltac:(M.monadic
        (let dest := M.alloc (| dest |) in
        M.call_closure (|
          M.get_function (| "core::mem::replace", [ T ] |),
          [
            M.read (| dest |);
            M.call_closure (|
              M.get_trait_method (| "core::default::Default", T, [], "default", [] |),
              []
            |)
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const fn replace<T>(dest: &mut T, src: T) -> T {
      // It may be tempting to use `swap` to avoid `unsafe` here. Don't!
      // The compiler optimizes the implementation below to two `memcpy`s
      // while `swap` would require at least three. See PR#83022 for details.
  
      // SAFETY: We read from `dest` but directly write `src` into it afterwards,
      // such that the old value is not duplicated. Nothing is dropped and
      // nothing here can panic.
      unsafe {
          let result = ptr::read(dest);
          ptr::write(dest, src);
          result
      }
  }
  *)
  Definition replace (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ dest; src ] =>
      ltac:(M.monadic
        (let dest := M.alloc (| dest |) in
        let src := M.alloc (| src |) in
        M.read (|
          let result :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "core::ptr::read", [ T ] |),
                [ M.read (| dest |) ]
              |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "core::ptr::write", [ T ] |),
                [ M.read (| dest |); M.read (| src |) ]
              |)
            |) in
          result
        |)))
    | _, _ => M.impossible
    end.
  
  (* pub fn drop<T>(_x: T) {} *)
  Definition drop (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ _x ] =>
      ltac:(M.monadic
        (let _x := M.alloc (| _x |) in
        Value.Tuple []))
    | _, _ => M.impossible
    end.
  
  (*
  pub const fn copy<T: Copy>(x: &T) -> T {
      *x
  }
  *)
  Definition copy (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ x ] =>
      ltac:(M.monadic
        (let x := M.alloc (| x |) in
        M.read (| M.read (| x |) |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const unsafe fn transmute_copy<Src, Dst>(src: &Src) -> Dst {
      assert!(
          size_of::<Src>() >= size_of::<Dst>(),
          "cannot transmute_copy if Dst is larger than Src"
      );
  
      // If Dst has a higher alignment requirement, src might not be suitably aligned.
      if align_of::<Dst>() > align_of::<Src>() {
          // SAFETY: `src` is a reference which is guaranteed to be valid for reads.
          // The caller must guarantee that the actual transmutation is safe.
          unsafe { ptr::read_unaligned(src as *const Src as *const Dst) }
      } else {
          // SAFETY: `src` is a reference which is guaranteed to be valid for reads.
          // We just checked that `src as *const Dst` was properly aligned.
          // The caller must guarantee that the actual transmutation is safe.
          unsafe { ptr::read(src as *const Src as *const Dst) }
      }
  }
  *)
  Definition transmute_copy (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ Src; Dst ], [ src ] =>
      ltac:(M.monadic
        (let src := M.alloc (| src |) in
        M.read (|
          let _ :=
            M.match_operator (|
              M.alloc (| Value.Tuple [] |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ :=
                      M.use
                        (M.alloc (|
                          UnOp.Pure.not
                            (BinOp.Pure.ge
                              (M.call_closure (|
                                M.get_function (| "core::mem::size_of", [ Src ] |),
                                []
                              |))
                              (M.call_closure (|
                                M.get_function (| "core::mem::size_of", [ Dst ] |),
                                []
                              |)))
                        |)) in
                    let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
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
                                          Value.String
                                            "cannot transmute_copy if Dst is larger than Src"
                                        |)
                                      ]
                                  |))
                              ]
                            |)
                          ]
                        |)
                      |)
                    |)));
                fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
              ]
            |) in
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ :=
                    M.use
                      (M.alloc (|
                        BinOp.Pure.gt
                          (M.call_closure (|
                            M.get_function (| "core::mem::align_of", [ Dst ] |),
                            []
                          |))
                          (M.call_closure (|
                            M.get_function (| "core::mem::align_of", [ Src ] |),
                            []
                          |))
                      |)) in
                  let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                  M.alloc (|
                    M.call_closure (|
                      M.get_function (| "core::ptr::read_unaligned", [ Dst ] |),
                      [ M.rust_cast (M.read (| M.use (M.alloc (| M.read (| src |) |)) |)) ]
                    |)
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (|
                    M.call_closure (|
                      M.get_function (| "core::ptr::read", [ Dst ] |),
                      [ M.rust_cast (M.read (| M.use (M.alloc (| M.read (| src |) |)) |)) ]
                    |)
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  (* StructTuple
    {
      name := "Discriminant";
      ty_params := [ "T" ];
      fields := [ Ty.associated ];
    } *)
  
  Module Impl_core_marker_Copy_for_core_mem_Discriminant_T.
    Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::mem::Discriminant") [ T ].
    
    Axiom Implements :
      forall (T : Ty.t),
      M.IsTraitInstance
        "core::marker::Copy"
        (Self T)
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_marker_Copy_for_core_mem_Discriminant_T.
  
  Module Impl_core_clone_Clone_for_core_mem_Discriminant_T.
    Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::mem::Discriminant") [ T ].
    
    (*
        fn clone(&self) -> Self {
            *self
        }
    *)
    Definition clone (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
      let Self : Ty.t := Self T in
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (| M.read (| self |) |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      forall (T : Ty.t),
      M.IsTraitInstance
        "core::clone::Clone"
        (Self T)
        (* Trait polymorphic types *) []
        (* Instance *) [ ("clone", InstanceField.Method (clone T)) ].
  End Impl_core_clone_Clone_for_core_mem_Discriminant_T.
  
  Module Impl_core_cmp_PartialEq_for_core_mem_Discriminant_T.
    Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::mem::Discriminant") [ T ].
    
    (*
        fn eq(&self, rhs: &Self) -> bool {
            self.0 == rhs.0
        }
    *)
    Definition eq (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
      let Self : Ty.t := Self T in
      match τ, α with
      | [], [ self; rhs ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let rhs := M.alloc (| rhs |) in
          M.call_closure (|
            M.get_trait_method (|
              "core::cmp::PartialEq",
              Ty.associated,
              [ Ty.associated ],
              "eq",
              []
            |),
            [
              M.SubPointer.get_struct_tuple_field (|
                M.read (| self |),
                "core::mem::Discriminant",
                0
              |);
              M.SubPointer.get_struct_tuple_field (|
                M.read (| rhs |),
                "core::mem::Discriminant",
                0
              |)
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      forall (T : Ty.t),
      M.IsTraitInstance
        "core::cmp::PartialEq"
        (Self T)
        (* Trait polymorphic types *) []
        (* Instance *) [ ("eq", InstanceField.Method (eq T)) ].
  End Impl_core_cmp_PartialEq_for_core_mem_Discriminant_T.
  
  Module Impl_core_cmp_Eq_for_core_mem_Discriminant_T.
    Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::mem::Discriminant") [ T ].
    
    Axiom Implements :
      forall (T : Ty.t),
      M.IsTraitInstance "core::cmp::Eq" (Self T) (* Trait polymorphic types *) [] (* Instance *) [].
  End Impl_core_cmp_Eq_for_core_mem_Discriminant_T.
  
  Module Impl_core_hash_Hash_for_core_mem_Discriminant_T.
    Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::mem::Discriminant") [ T ].
    
    (*
        fn hash<H: hash::Hasher>(&self, state: &mut H) {
            self.0.hash(state);
        }
    *)
    Definition hash (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
      let Self : Ty.t := Self T in
      match τ, α with
      | [ H ], [ self; state ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let state := M.alloc (| state |) in
          M.read (|
            let _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (| "core::hash::Hash", Ty.associated, [], "hash", [ H ] |),
                  [
                    M.SubPointer.get_struct_tuple_field (|
                      M.read (| self |),
                      "core::mem::Discriminant",
                      0
                    |);
                    M.read (| state |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      forall (T : Ty.t),
      M.IsTraitInstance
        "core::hash::Hash"
        (Self T)
        (* Trait polymorphic types *) []
        (* Instance *) [ ("hash", InstanceField.Method (hash T)) ].
  End Impl_core_hash_Hash_for_core_mem_Discriminant_T.
  
  Module Impl_core_fmt_Debug_for_core_mem_Discriminant_T.
    Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::mem::Discriminant") [ T ].
    
    (*
        fn fmt(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
            fmt.debug_tuple("Discriminant").field(&self.0).finish()
        }
    *)
    Definition fmt (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
      let Self : Ty.t := Self T in
      match τ, α with
      | [], [ self; fmt ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let fmt := M.alloc (| fmt |) in
          M.call_closure (|
            M.get_associated_function (| Ty.path "core::fmt::builders::DebugTuple", "finish", [] |),
            [
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "core::fmt::builders::DebugTuple",
                  "field",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "core::fmt::Formatter",
                        "debug_tuple",
                        []
                      |),
                      [ M.read (| fmt |); M.read (| Value.String "Discriminant" |) ]
                    |)
                  |);
                  (* Unsize *)
                  M.pointer_coercion
                    (M.SubPointer.get_struct_tuple_field (|
                      M.read (| self |),
                      "core::mem::Discriminant",
                      0
                    |))
                ]
              |)
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
  End Impl_core_fmt_Debug_for_core_mem_Discriminant_T.
  
  (*
  pub const fn discriminant<T>(v: &T) -> Discriminant<T> {
      Discriminant(intrinsics::discriminant_value(v))
  }
  *)
  Definition discriminant (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ v ] =>
      ltac:(M.monadic
        (let v := M.alloc (| v |) in
        Value.StructTuple
          "core::mem::Discriminant"
          [
            M.call_closure (|
              M.get_function (| "core::intrinsics::discriminant_value", [ T ] |),
              [ M.read (| v |) ]
            |)
          ]))
    | _, _ => M.impossible
    end.
  
  (*
  pub const fn variant_count<T>() -> usize {
      intrinsics::variant_count::<T>()
  }
  *)
  Definition variant_count (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [] =>
      ltac:(M.monadic
        (M.call_closure (| M.get_function (| "core::intrinsics::variant_count", [ T ] |), [] |)))
    | _, _ => M.impossible
    end.
  
  (* Trait *)
  (* Empty module 'SizedTypeProperties' *)
  
  Module Impl_core_mem_SizedTypeProperties_for_T.
    Definition Self (T : Ty.t) : Ty.t := T.
    
    Axiom Implements :
      forall (T : Ty.t),
      M.IsTraitInstance
        "core::mem::SizedTypeProperties"
        (Self T)
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_mem_SizedTypeProperties_for_T.
End mem.
