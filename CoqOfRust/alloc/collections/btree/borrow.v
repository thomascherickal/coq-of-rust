(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module collections.
  Module btree.
    Module borrow.
      (* StructRecord
        {
          name := "DormantMutRef";
          ty_params := [ "T" ];
          fields :=
            [
              ("ptr", Ty.apply (Ty.path "core::ptr::non_null::NonNull") [ T ]);
              ("_marker",
                Ty.apply (Ty.path "core::marker::PhantomData") [ Ty.apply (Ty.path "&mut") [ T ] ])
            ];
        } *)
      
      Module Impl_core_marker_Sync_where_core_marker_Sync_ref_mut_T_for_alloc_collections_btree_borrow_DormantMutRef_T.
        Definition Self (T : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "alloc::collections::btree::borrow::DormantMutRef") [ T ].
        
        Axiom Implements :
          forall (T : Ty.t),
          M.IsTraitInstance
            "core::marker::Sync"
            (Self T)
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_Sync_where_core_marker_Sync_ref_mut_T_for_alloc_collections_btree_borrow_DormantMutRef_T.
      
      Module Impl_core_marker_Send_where_core_marker_Send_ref_mut_T_for_alloc_collections_btree_borrow_DormantMutRef_T.
        Definition Self (T : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "alloc::collections::btree::borrow::DormantMutRef") [ T ].
        
        Axiom Implements :
          forall (T : Ty.t),
          M.IsTraitInstance
            "core::marker::Send"
            (Self T)
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_Send_where_core_marker_Send_ref_mut_T_for_alloc_collections_btree_borrow_DormantMutRef_T.
      
      Module Impl_alloc_collections_btree_borrow_DormantMutRef_T.
        Definition Self (T : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "alloc::collections::btree::borrow::DormantMutRef") [ T ].
        
        (*
            pub fn new(t: &'a mut T) -> (&'a mut T, Self) {
                let ptr = NonNull::from(t);
                // SAFETY: we hold the borrow throughout 'a via `_marker`, and we expose
                // only this reference, so it is unique.
                let new_ref = unsafe { &mut *ptr.as_ptr() };
                (new_ref, Self { ptr, _marker: PhantomData })
            }
        *)
        Definition new (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self T in
          match τ, α with
          | [], [ t ] =>
            ltac:(M.monadic
              (let t := M.alloc (| t |) in
              M.read (|
                let ptr :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::convert::From",
                        Ty.apply (Ty.path "core::ptr::non_null::NonNull") [ T ],
                        [ Ty.apply (Ty.path "&mut") [ T ] ],
                        "from",
                        []
                      |),
                      [ M.read (| t |) ]
                    |)
                  |) in
                let new_ref :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply (Ty.path "core::ptr::non_null::NonNull") [ T ],
                        "as_ptr",
                        []
                      |),
                      [ M.read (| ptr |) ]
                    |)
                  |) in
                M.alloc (|
                  Value.Tuple
                    [
                      M.read (| new_ref |);
                      Value.StructRecord
                        "alloc::collections::btree::borrow::DormantMutRef"
                        [
                          ("ptr", M.read (| ptr |));
                          ("_marker", Value.StructTuple "core::marker::PhantomData" [])
                        ]
                    ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_new :
          forall (T : Ty.t),
          M.IsAssociatedFunction (Self T) "new" (new T).
        
        (*
            pub unsafe fn awaken(self) -> &'a mut T {
                // SAFETY: our own safety conditions imply this reference is again unique.
                unsafe { &mut *self.ptr.as_ptr() }
            }
        *)
        Definition awaken (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self T in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply (Ty.path "core::ptr::non_null::NonNull") [ T ],
                  "as_ptr",
                  []
                |),
                [
                  M.read (|
                    M.SubPointer.get_struct_record_field (|
                      self,
                      "alloc::collections::btree::borrow::DormantMutRef",
                      "ptr"
                    |)
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_awaken :
          forall (T : Ty.t),
          M.IsAssociatedFunction (Self T) "awaken" (awaken T).
        
        (*
            pub unsafe fn reborrow(&mut self) -> &'a mut T {
                // SAFETY: our own safety conditions imply this reference is again unique.
                unsafe { &mut *self.ptr.as_ptr() }
            }
        *)
        Definition reborrow (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self T in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply (Ty.path "core::ptr::non_null::NonNull") [ T ],
                  "as_ptr",
                  []
                |),
                [
                  M.read (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "alloc::collections::btree::borrow::DormantMutRef",
                      "ptr"
                    |)
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_reborrow :
          forall (T : Ty.t),
          M.IsAssociatedFunction (Self T) "reborrow" (reborrow T).
        
        (*
            pub unsafe fn reborrow_shared(&self) -> &'a T {
                // SAFETY: our own safety conditions imply this reference is again unique.
                unsafe { &*self.ptr.as_ptr() }
            }
        *)
        Definition reborrow_shared (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self T in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply (Ty.path "core::ptr::non_null::NonNull") [ T ],
                  "as_ptr",
                  []
                |),
                [
                  M.read (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "alloc::collections::btree::borrow::DormantMutRef",
                      "ptr"
                    |)
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_reborrow_shared :
          forall (T : Ty.t),
          M.IsAssociatedFunction (Self T) "reborrow_shared" (reborrow_shared T).
      End Impl_alloc_collections_btree_borrow_DormantMutRef_T.
    End borrow.
  End btree.
End collections.
