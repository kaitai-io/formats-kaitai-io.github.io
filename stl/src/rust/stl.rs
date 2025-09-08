// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]

extern crate kaitai;
use kaitai::*;
use std::convert::{TryFrom, TryInto};
use std::cell::{Ref, Cell, RefCell};
use std::rc::{Rc, Weak};

/**
 * STL files are used to represent simple 3D models, defined using
 * triangular 3D faces.
 * 
 * Initially it was introduced as native format for 3D Systems
 * Stereolithography CAD system, but due to its extreme simplicity, it
 * was adopted by a wide range of 3D modelling, CAD, rapid prototyping
 * and 3D printing applications as the simplest 3D model exchange
 * format.
 * 
 * STL is extremely bare-bones format: there are no complex headers, no
 * texture / color support, no units specifications, no distinct vertex
 * arrays. Whole model is specified as a collection of triangular
 * faces.
 * 
 * There are two versions of the format (text and binary), this spec
 * describes binary version.
 */

#[derive(Default, Debug, Clone)]
pub struct Stl {
    pub _root: SharedType<Stl>,
    pub _parent: SharedType<Stl>,
    pub _self: SharedType<Self>,
    header: RefCell<Vec<u8>>,
    num_triangles: RefCell<u32>,
    triangles: RefCell<Vec<OptRc<Stl_Triangle>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Stl {
    type Root = Stl;
    type Parent = Stl;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.header.borrow_mut() = _io.read_bytes(80 as usize)?.into();
        *self_rc.num_triangles.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.triangles.borrow_mut() = Vec::new();
        let l_triangles = *self_rc.num_triangles();
        for _i in 0..l_triangles {
            let t = Self::read_into::<_, Stl_Triangle>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.triangles.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Stl {
}
impl Stl {
    pub fn header(&self) -> Ref<'_, Vec<u8>> {
        self.header.borrow()
    }
}
impl Stl {
    pub fn num_triangles(&self) -> Ref<'_, u32> {
        self.num_triangles.borrow()
    }
}
impl Stl {
    pub fn triangles(&self) -> Ref<'_, Vec<OptRc<Stl_Triangle>>> {
        self.triangles.borrow()
    }
}
impl Stl {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Each STL triangle is defined by its 3 points in 3D space and a
 * normal vector, which is generally used to determine where is
 * "inside" and "outside" of the model.
 */

#[derive(Default, Debug, Clone)]
pub struct Stl_Triangle {
    pub _root: SharedType<Stl>,
    pub _parent: SharedType<Stl>,
    pub _self: SharedType<Self>,
    normal: RefCell<OptRc<Stl_Vec3d>>,
    vertices: RefCell<Vec<OptRc<Stl_Vec3d>>>,
    abr: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Stl_Triangle {
    type Root = Stl;
    type Parent = Stl;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, Stl_Vec3d>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.normal.borrow_mut() = t;
        *self_rc.vertices.borrow_mut() = Vec::new();
        let l_vertices = 3;
        for _i in 0..l_vertices {
            let t = Self::read_into::<_, Stl_Vec3d>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.vertices.borrow_mut().push(t);
        }
        *self_rc.abr.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Stl_Triangle {
}
impl Stl_Triangle {
    pub fn normal(&self) -> Ref<'_, OptRc<Stl_Vec3d>> {
        self.normal.borrow()
    }
}
impl Stl_Triangle {
    pub fn vertices(&self) -> Ref<'_, Vec<OptRc<Stl_Vec3d>>> {
        self.vertices.borrow()
    }
}

/**
 * In theory (per standard), it's "attribute byte count" with
 * no other details given on what "attribute" is and what
 * should be stored in this field.
 * 
 * In practice, software dealing with STL either expected to
 * see 0 here, or uses this 16-bit field per se to store
 * additional attributes (such as RGB color of a vertex or
 * color index).
 */
impl Stl_Triangle {
    pub fn abr(&self) -> Ref<'_, u16> {
        self.abr.borrow()
    }
}
impl Stl_Triangle {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Stl_Vec3d {
    pub _root: SharedType<Stl>,
    pub _parent: SharedType<Stl_Triangle>,
    pub _self: SharedType<Self>,
    x: RefCell<f32>,
    y: RefCell<f32>,
    z: RefCell<f32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Stl_Vec3d {
    type Root = Stl;
    type Parent = Stl_Triangle;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.x.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.y.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.z.borrow_mut() = _io.read_f4le()?.into();
        Ok(())
    }
}
impl Stl_Vec3d {
}
impl Stl_Vec3d {
    pub fn x(&self) -> Ref<'_, f32> {
        self.x.borrow()
    }
}
impl Stl_Vec3d {
    pub fn y(&self) -> Ref<'_, f32> {
        self.y.borrow()
    }
}
impl Stl_Vec3d {
    pub fn z(&self) -> Ref<'_, f32> {
        self.z.borrow()
    }
}
impl Stl_Vec3d {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
