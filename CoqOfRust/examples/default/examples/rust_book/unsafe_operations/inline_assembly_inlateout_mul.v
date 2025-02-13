(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    fn mul(a: u64, b: u64) -> u128 {
        let lo: u64;
        let hi: u64;

        unsafe {
            asm!(
                // The x86 mul instruction takes rax as an implicit input and writes
                // the 128-bit result of the multiplication to rax:rdx.
                "mul {}",
                in(reg) a,
                inlateout("rax") b => lo,
                lateout("rdx") hi
            );
        }

        ((hi as u128) << 64) + lo as u128
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with | [], [] => ltac:(M.monadic (Value.Tuple [])) | _, _ => M.impossible end.

Module main.
  (*
      fn mul(a: u64, b: u64) -> u128 {
          let lo: u64;
          let hi: u64;
  
          unsafe {
              asm!(
                  // The x86 mul instruction takes rax as an implicit input and writes
                  // the 128-bit result of the multiplication to rax:rdx.
                  "mul {}",
                  in(reg) a,
                  inlateout("rax") b => lo,
                  lateout("rdx") hi
              );
          }
  
          ((hi as u128) << 64) + lo as u128
      }
  *)
  Definition mul (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ a; b ] =>
      ltac:(M.monadic
        (let a := M.alloc (| a |) in
        let b := M.alloc (| b |) in
        M.read (|
          let lo := M.copy (| Value.DeclaredButUndefined |) in
          let hi := M.copy (| Value.DeclaredButUndefined |) in
          let _ :=
            let _ := InlineAssembly in
            M.alloc (| Value.Tuple [] |) in
          M.alloc (|
            BinOp.Panic.add (|
              Integer.U128,
              BinOp.Panic.shl (| M.rust_cast (M.read (| hi |)), Value.Integer 64 |),
              M.rust_cast (M.read (| lo |))
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
End main.
