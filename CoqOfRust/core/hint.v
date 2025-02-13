(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module hint.
  (*
  pub const unsafe fn unreachable_unchecked() -> ! {
      // SAFETY: the safety contract for `intrinsics::unreachable` must
      // be upheld by the caller.
      unsafe {
          intrinsics::assert_unsafe_precondition!("hint::unreachable_unchecked must never be reached", () => false);
          intrinsics::unreachable()
      }
  }
  *)
  Definition unreachable_unchecked (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.read (|
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
                              Ty.tuple [];
                              Ty.function [] (Ty.tuple []);
                              Ty.function [] (Ty.tuple []);
                              Ty.tuple []
                            ]
                          |),
                          [
                            Value.Tuple [];
                            M.get_function (| "core::hint::unreachable_unchecked.comptime", [] |);
                            M.get_function (| "core::hint::unreachable_unchecked.runtime", [] |)
                          ]
                        |)
                      |) in
                    M.alloc (| Value.Tuple [] |)));
                fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
              ]
            |) in
          M.alloc (|
            M.call_closure (| M.get_function (| "core::intrinsics::unreachable", [] |), [] |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub fn spin_loop() {
      #[cfg(target_arch = "x86")]
      {
          // SAFETY: the `cfg` attr ensures that we only execute this on x86 targets.
          unsafe { crate::arch::x86::_mm_pause() };
      }
  
      #[cfg(target_arch = "x86_64")]
      {
          // SAFETY: the `cfg` attr ensures that we only execute this on x86_64 targets.
          unsafe { crate::arch::x86_64::_mm_pause() };
      }
  
      #[cfg(target_arch = "riscv32")]
      {
          crate::arch::riscv32::pause();
      }
  
      #[cfg(target_arch = "riscv64")]
      {
          crate::arch::riscv64::pause();
      }
  
      #[cfg(target_arch = "aarch64")]
      {
          // SAFETY: the `cfg` attr ensures that we only execute this on aarch64 targets.
          unsafe { crate::arch::aarch64::__isb(crate::arch::aarch64::SY) };
      }
  
      #[cfg(all(target_arch = "arm", target_feature = "v6"))]
      {
          // SAFETY: the `cfg` attr ensures that we only execute this on arm targets
          // with support for the v6 feature.
          unsafe { crate::arch::arm::__yield() };
      }
  }
  *)
  Definition spin_loop (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.read (|
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "core::core_arch::x86::sse2::_mm_pause", [] |),
                []
              |)
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const fn black_box<T>(dummy: T) -> T {
      crate::intrinsics::black_box(dummy)
  }
  *)
  Definition black_box (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ dummy ] =>
      ltac:(M.monadic
        (let dummy := M.alloc (| dummy |) in
        M.call_closure (|
          M.get_function (| "core::intrinsics::black_box", [ T ] |),
          [ M.read (| dummy |) ]
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  pub const fn must_use<T>(value: T) -> T {
      value
  }
  *)
  Definition must_use (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T ], [ value ] =>
      ltac:(M.monadic
        (let value := M.alloc (| value |) in
        M.read (| value |)))
    | _, _ => M.impossible
    end.
End hint.
