(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    let cmd = 0xd1;
    unsafe {
        asm!("out 0x64, eax", in("eax") cmd);
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let cmd := M.alloc (| Value.Integer 209 |) in
        let _ := InlineAssembly in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
