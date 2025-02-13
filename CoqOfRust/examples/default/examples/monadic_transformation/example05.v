(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Foo";
    ty_params := [];
    fields := [ Ty.path "u32" ];
  } *)

Module Impl_example05_Foo.
  Definition Self : Ty.t := Ty.path "example05::Foo".
  
  (*
      fn plus1(self) -> u32 {
          self.0 + 1
      }
  *)
  Definition plus1 (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        BinOp.Panic.add (|
          Integer.U32,
          M.read (| M.SubPointer.get_struct_tuple_field (| self, "example05::Foo", 0 |) |),
          Value.Integer 1
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_plus1 : M.IsAssociatedFunction Self "plus1" plus1.
End Impl_example05_Foo.

(*
fn main() {
    let foo = Foo(0);
    foo.plus1();
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let foo := M.alloc (| Value.StructTuple "example05::Foo" [ Value.Integer 0 ] |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (| Ty.path "example05::Foo", "plus1", [] |),
              [ M.read (| foo |) ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
