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
 * Quake 1 model format is used to store 3D models completely with
 * textures and animations used in the game. Quake 1 engine
 * (retroactively named "idtech2") is a popular 3D engine first used
 * for Quake game by id Software in 1996.
 * 
 * Model is constructed traditionally from vertices in 3D space, faces
 * which connect vertices, textures ("skins", i.e. 2D bitmaps) and
 * texture UV mapping information. As opposed to more modern,
 * bones-based animation formats, Quake model was animated by changing
 * locations of all vertices it included in 3D space, frame by frame.
 * 
 * File format stores:
 * 
 * * "Skins" — effectively 2D bitmaps which will be used as a
 *   texture. Every model can have multiple skins — e.g. these can be
 *   switched to depict various levels of damage to the
 *   monsters. Bitmaps are 8-bit-per-pixel, indexed in global Quake
 *   palette, subject to lighting and gamma adjustment when rendering
 *   in the game using colormap technique.
 * * "Texture coordinates" — UV coordinates, mapping 3D vertices to
 *   skin coordinates.
 * * "Triangles" — triangular faces connecting 3D vertices.
 * * "Frames" — locations of vertices in 3D space; can include more
 *   than one frame, thus allowing representation of different frames
 *   for animation purposes.
 * 
 * Originally, 3D geometry for models for Quake was designed in [Alias
 * PowerAnimator](https://en.wikipedia.org/wiki/PowerAnimator),
 * precursor of modern day Autodesk Maya and Autodesk Alias. Therefore,
 * 3D-related part of Quake model format followed closely Alias TRI
 * format, and Quake development utilities included a converter from Alias
 * TRI (`modelgen`).
 * 
 * Skins (textures) where prepared as LBM bitmaps with the help from
 * `texmap` utility in the same development utilities toolkit.
 */

#[derive(Default, Debug, Clone)]
pub struct QuakeMdl {
    pub _root: SharedType<QuakeMdl>,
    pub _parent: SharedType<QuakeMdl>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<QuakeMdl_MdlHeader>>,
    skins: RefCell<Vec<OptRc<QuakeMdl_MdlSkin>>>,
    texture_coordinates: RefCell<Vec<OptRc<QuakeMdl_MdlTexcoord>>>,
    triangles: RefCell<Vec<OptRc<QuakeMdl_MdlTriangle>>>,
    frames: RefCell<Vec<OptRc<QuakeMdl_MdlFrame>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuakeMdl {
    type Root = QuakeMdl;
    type Parent = QuakeMdl;

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
        let t = Self::read_into::<_, QuakeMdl_MdlHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.skins.borrow_mut() = Vec::new();
        let l_skins = *self_rc.header().num_skins();
        for _i in 0..l_skins {
            let t = Self::read_into::<_, QuakeMdl_MdlSkin>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.skins.borrow_mut().push(t);
        }
        *self_rc.texture_coordinates.borrow_mut() = Vec::new();
        let l_texture_coordinates = *self_rc.header().num_verts();
        for _i in 0..l_texture_coordinates {
            let t = Self::read_into::<_, QuakeMdl_MdlTexcoord>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.texture_coordinates.borrow_mut().push(t);
        }
        *self_rc.triangles.borrow_mut() = Vec::new();
        let l_triangles = *self_rc.header().num_tris();
        for _i in 0..l_triangles {
            let t = Self::read_into::<_, QuakeMdl_MdlTriangle>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.triangles.borrow_mut().push(t);
        }
        *self_rc.frames.borrow_mut() = Vec::new();
        let l_frames = *self_rc.header().num_frames();
        for _i in 0..l_frames {
            let t = Self::read_into::<_, QuakeMdl_MdlFrame>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.frames.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl QuakeMdl {
}
impl QuakeMdl {
    pub fn header(&self) -> Ref<'_, OptRc<QuakeMdl_MdlHeader>> {
        self.header.borrow()
    }
}
impl QuakeMdl {
    pub fn skins(&self) -> Ref<'_, Vec<OptRc<QuakeMdl_MdlSkin>>> {
        self.skins.borrow()
    }
}
impl QuakeMdl {
    pub fn texture_coordinates(&self) -> Ref<'_, Vec<OptRc<QuakeMdl_MdlTexcoord>>> {
        self.texture_coordinates.borrow()
    }
}
impl QuakeMdl {
    pub fn triangles(&self) -> Ref<'_, Vec<OptRc<QuakeMdl_MdlTriangle>>> {
        self.triangles.borrow()
    }
}
impl QuakeMdl {
    pub fn frames(&self) -> Ref<'_, Vec<OptRc<QuakeMdl_MdlFrame>>> {
        self.frames.borrow()
    }
}
impl QuakeMdl {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct QuakeMdl_MdlFrame {
    pub _root: SharedType<QuakeMdl>,
    pub _parent: SharedType<QuakeMdl>,
    pub _self: SharedType<Self>,
    type: RefCell<i32>,
    min: RefCell<OptRc<QuakeMdl_MdlVertex>>,
    max: RefCell<OptRc<QuakeMdl_MdlVertex>>,
    time: RefCell<Vec<f32>>,
    frames: RefCell<Vec<OptRc<QuakeMdl_MdlSimpleFrame>>>,
    _io: RefCell<BytesReader>,
    f_num_simple_frames: Cell<bool>,
    num_simple_frames: RefCell<i32>,
}
impl KStruct for QuakeMdl_MdlFrame {
    type Root = QuakeMdl;
    type Parent = QuakeMdl;

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
        *self_rc.type.borrow_mut() = _io.read_s4le()?.into();
        if ((*self_rc.type() as i32) != (0 as i32)) {
            let t = Self::read_into::<_, QuakeMdl_MdlVertex>(&*_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.min.borrow_mut() = t;
        }
        if ((*self_rc.type() as i32) != (0 as i32)) {
            let t = Self::read_into::<_, QuakeMdl_MdlVertex>(&*_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.max.borrow_mut() = t;
        }
        if ((*self_rc.type() as i32) != (0 as i32)) {
            *self_rc.time.borrow_mut() = Vec::new();
            let l_time = *self_rc.type();
            for _i in 0..l_time {
                self_rc.time.borrow_mut().push(_io.read_f4le()?.into());
            }
        }
        *self_rc.frames.borrow_mut() = Vec::new();
        let l_frames = *self_rc.num_simple_frames()?;
        for _i in 0..l_frames {
            let t = Self::read_into::<_, QuakeMdl_MdlSimpleFrame>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.frames.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl QuakeMdl_MdlFrame {
    pub fn num_simple_frames(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_simple_frames.get() {
            return Ok(self.num_simple_frames.borrow());
        }
        self.f_num_simple_frames.set(true);
        *self.num_simple_frames.borrow_mut() = (if ((*self.type() as i32) == (0 as i32)) { 1 } else { *self.type() }) as i32;
        Ok(self.num_simple_frames.borrow())
    }
}
impl QuakeMdl_MdlFrame {
    pub fn type(&self) -> Ref<'_, i32> {
        self.type.borrow()
    }
}
impl QuakeMdl_MdlFrame {
    pub fn min(&self) -> Ref<'_, OptRc<QuakeMdl_MdlVertex>> {
        self.min.borrow()
    }
}
impl QuakeMdl_MdlFrame {
    pub fn max(&self) -> Ref<'_, OptRc<QuakeMdl_MdlVertex>> {
        self.max.borrow()
    }
}
impl QuakeMdl_MdlFrame {
    pub fn time(&self) -> Ref<'_, Vec<f32>> {
        self.time.borrow()
    }
}
impl QuakeMdl_MdlFrame {
    pub fn frames(&self) -> Ref<'_, Vec<OptRc<QuakeMdl_MdlSimpleFrame>>> {
        self.frames.borrow()
    }
}
impl QuakeMdl_MdlFrame {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75 Source
 * \sa https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0 Source
 */

#[derive(Default, Debug, Clone)]
pub struct QuakeMdl_MdlHeader {
    pub _root: SharedType<QuakeMdl>,
    pub _parent: SharedType<QuakeMdl>,
    pub _self: SharedType<Self>,
    ident: RefCell<Vec<u8>>,
    version: RefCell<i32>,
    scale: RefCell<OptRc<QuakeMdl_Vec3>>,
    origin: RefCell<OptRc<QuakeMdl_Vec3>>,
    radius: RefCell<f32>,
    eye_position: RefCell<OptRc<QuakeMdl_Vec3>>,
    num_skins: RefCell<i32>,
    skin_width: RefCell<i32>,
    skin_height: RefCell<i32>,
    num_verts: RefCell<i32>,
    num_tris: RefCell<i32>,
    num_frames: RefCell<i32>,
    synctype: RefCell<i32>,
    flags: RefCell<i32>,
    size: RefCell<f32>,
    _io: RefCell<BytesReader>,
    f_skin_size: Cell<bool>,
    skin_size: RefCell<i32>,
}
impl KStruct for QuakeMdl_MdlHeader {
    type Root = QuakeMdl;
    type Parent = QuakeMdl;

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
        *self_rc.ident.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.ident() == vec![0x49u8, 0x44u8, 0x50u8, 0x4fu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/mdl_header/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_s4le()?.into();
        if !(((*self_rc.version() as i32) == (6 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/mdl_header/seq/1".to_string() }));
        }
        let t = Self::read_into::<_, QuakeMdl_Vec3>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.scale.borrow_mut() = t;
        let t = Self::read_into::<_, QuakeMdl_Vec3>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.origin.borrow_mut() = t;
        *self_rc.radius.borrow_mut() = _io.read_f4le()?.into();
        let t = Self::read_into::<_, QuakeMdl_Vec3>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.eye_position.borrow_mut() = t;
        *self_rc.num_skins.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.skin_width.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.skin_height.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.num_verts.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.num_tris.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.num_frames.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.synctype.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.size.borrow_mut() = _io.read_f4le()?.into();
        Ok(())
    }
}
impl QuakeMdl_MdlHeader {

    /**
     * Skin size in pixels.
     */
    pub fn skin_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_skin_size.get() {
            return Ok(self.skin_size.borrow());
        }
        self.f_skin_size.set(true);
        *self.skin_size.borrow_mut() = (((*self.skin_width() as i32) * (*self.skin_height() as i32))) as i32;
        Ok(self.skin_size.borrow())
    }
}

/**
 * Magic signature bytes that every Quake model must
 * have. "IDPO" is short for "IDPOLYHEADER".
 * \sa https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L132-L133 Source
 */
impl QuakeMdl_MdlHeader {
    pub fn ident(&self) -> Ref<'_, Vec<u8>> {
        self.ident.borrow()
    }
}
impl QuakeMdl_MdlHeader {
    pub fn version(&self) -> Ref<'_, i32> {
        self.version.borrow()
    }
}

/**
 * Global scaling factors in 3 dimensions for whole model. When
 * represented in 3D world, this model local coordinates will
 * be multiplied by these factors.
 */
impl QuakeMdl_MdlHeader {
    pub fn scale(&self) -> Ref<'_, OptRc<QuakeMdl_Vec3>> {
        self.scale.borrow()
    }
}
impl QuakeMdl_MdlHeader {
    pub fn origin(&self) -> Ref<'_, OptRc<QuakeMdl_Vec3>> {
        self.origin.borrow()
    }
}
impl QuakeMdl_MdlHeader {
    pub fn radius(&self) -> Ref<'_, f32> {
        self.radius.borrow()
    }
}
impl QuakeMdl_MdlHeader {
    pub fn eye_position(&self) -> Ref<'_, OptRc<QuakeMdl_Vec3>> {
        self.eye_position.borrow()
    }
}

/**
 * Number of skins (=texture bitmaps) included in this model.
 */
impl QuakeMdl_MdlHeader {
    pub fn num_skins(&self) -> Ref<'_, i32> {
        self.num_skins.borrow()
    }
}

/**
 * Width (U coordinate max) of every skin (=texture) in pixels.
 */
impl QuakeMdl_MdlHeader {
    pub fn skin_width(&self) -> Ref<'_, i32> {
        self.skin_width.borrow()
    }
}

/**
 * Height (V coordinate max) of every skin (=texture) in
 * pixels.
 */
impl QuakeMdl_MdlHeader {
    pub fn skin_height(&self) -> Ref<'_, i32> {
        self.skin_height.borrow()
    }
}

/**
 * Number of vertices in this model. Note that this is constant
 * for all the animation frames and all textures.
 */
impl QuakeMdl_MdlHeader {
    pub fn num_verts(&self) -> Ref<'_, i32> {
        self.num_verts.borrow()
    }
}

/**
 * Number of triangles (=triangular faces) in this model.
 */
impl QuakeMdl_MdlHeader {
    pub fn num_tris(&self) -> Ref<'_, i32> {
        self.num_tris.borrow()
    }
}

/**
 * Number of animation frames included in this model.
 */
impl QuakeMdl_MdlHeader {
    pub fn num_frames(&self) -> Ref<'_, i32> {
        self.num_frames.borrow()
    }
}
impl QuakeMdl_MdlHeader {
    pub fn synctype(&self) -> Ref<'_, i32> {
        self.synctype.borrow()
    }
}
impl QuakeMdl_MdlHeader {
    pub fn flags(&self) -> Ref<'_, i32> {
        self.flags.borrow()
    }
}
impl QuakeMdl_MdlHeader {
    pub fn size(&self) -> Ref<'_, f32> {
        self.size.borrow()
    }
}
impl QuakeMdl_MdlHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct QuakeMdl_MdlSimpleFrame {
    pub _root: SharedType<QuakeMdl>,
    pub _parent: SharedType<QuakeMdl_MdlFrame>,
    pub _self: SharedType<Self>,
    bbox_min: RefCell<OptRc<QuakeMdl_MdlVertex>>,
    bbox_max: RefCell<OptRc<QuakeMdl_MdlVertex>>,
    name: RefCell<String>,
    vertices: RefCell<Vec<OptRc<QuakeMdl_MdlVertex>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuakeMdl_MdlSimpleFrame {
    type Root = QuakeMdl;
    type Parent = QuakeMdl_MdlFrame;

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
        let t = Self::read_into::<_, QuakeMdl_MdlVertex>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.bbox_min.borrow_mut() = t;
        let t = Self::read_into::<_, QuakeMdl_MdlVertex>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.bbox_max.borrow_mut() = t;
        *self_rc.name.borrow_mut() = bytes_to_str(&bytes_terminate(&bytes_strip_right(&_io.read_bytes(16 as usize)?.into(), 0).into(), 0, false).into(), "ASCII")?;
        *self_rc.vertices.borrow_mut() = Vec::new();
        let l_vertices = *_r.header().num_verts();
        for _i in 0..l_vertices {
            let t = Self::read_into::<_, QuakeMdl_MdlVertex>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.vertices.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl QuakeMdl_MdlSimpleFrame {
}
impl QuakeMdl_MdlSimpleFrame {
    pub fn bbox_min(&self) -> Ref<'_, OptRc<QuakeMdl_MdlVertex>> {
        self.bbox_min.borrow()
    }
}
impl QuakeMdl_MdlSimpleFrame {
    pub fn bbox_max(&self) -> Ref<'_, OptRc<QuakeMdl_MdlVertex>> {
        self.bbox_max.borrow()
    }
}
impl QuakeMdl_MdlSimpleFrame {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl QuakeMdl_MdlSimpleFrame {
    pub fn vertices(&self) -> Ref<'_, Vec<OptRc<QuakeMdl_MdlVertex>>> {
        self.vertices.borrow()
    }
}
impl QuakeMdl_MdlSimpleFrame {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct QuakeMdl_MdlSkin {
    pub _root: SharedType<QuakeMdl>,
    pub _parent: SharedType<QuakeMdl>,
    pub _self: SharedType<Self>,
    group: RefCell<i32>,
    single_texture_data: RefCell<Vec<u8>>,
    num_frames: RefCell<u32>,
    frame_times: RefCell<Vec<f32>>,
    group_texture_data: RefCell<Vec<Vec<u8>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuakeMdl_MdlSkin {
    type Root = QuakeMdl;
    type Parent = QuakeMdl;

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
        *self_rc.group.borrow_mut() = _io.read_s4le()?.into();
        if ((*self_rc.group() as i32) == (0 as i32)) {
            *self_rc.single_texture_data.borrow_mut() = _io.read_bytes(*_r.header().skin_size()? as usize)?.into();
        }
        if ((*self_rc.group() as i32) != (0 as i32)) {
            *self_rc.num_frames.borrow_mut() = _io.read_u4le()?.into();
        }
        if ((*self_rc.group() as i32) != (0 as i32)) {
            *self_rc.frame_times.borrow_mut() = Vec::new();
            let l_frame_times = *self_rc.num_frames();
            for _i in 0..l_frame_times {
                self_rc.frame_times.borrow_mut().push(_io.read_f4le()?.into());
            }
        }
        if ((*self_rc.group() as i32) != (0 as i32)) {
            *self_rc.group_texture_data.borrow_mut() = Vec::new();
            let l_group_texture_data = *self_rc.num_frames();
            for _i in 0..l_group_texture_data {
                self_rc.group_texture_data.borrow_mut().push(_io.read_bytes(*_r.header().skin_size()? as usize)?.into());
            }
        }
        Ok(())
    }
}
impl QuakeMdl_MdlSkin {
}
impl QuakeMdl_MdlSkin {
    pub fn group(&self) -> Ref<'_, i32> {
        self.group.borrow()
    }
}
impl QuakeMdl_MdlSkin {
    pub fn single_texture_data(&self) -> Ref<'_, Vec<u8>> {
        self.single_texture_data.borrow()
    }
}
impl QuakeMdl_MdlSkin {
    pub fn num_frames(&self) -> Ref<'_, u32> {
        self.num_frames.borrow()
    }
}
impl QuakeMdl_MdlSkin {
    pub fn frame_times(&self) -> Ref<'_, Vec<f32>> {
        self.frame_times.borrow()
    }
}
impl QuakeMdl_MdlSkin {
    pub fn group_texture_data(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.group_texture_data.borrow()
    }
}
impl QuakeMdl_MdlSkin {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83 Source
 * \sa https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2 Source
 */

#[derive(Default, Debug, Clone)]
pub struct QuakeMdl_MdlTexcoord {
    pub _root: SharedType<QuakeMdl>,
    pub _parent: SharedType<QuakeMdl>,
    pub _self: SharedType<Self>,
    on_seam: RefCell<i32>,
    s: RefCell<i32>,
    t: RefCell<i32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuakeMdl_MdlTexcoord {
    type Root = QuakeMdl;
    type Parent = QuakeMdl;

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
        *self_rc.on_seam.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.s.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.t.borrow_mut() = _io.read_s4le()?.into();
        Ok(())
    }
}
impl QuakeMdl_MdlTexcoord {
}
impl QuakeMdl_MdlTexcoord {
    pub fn on_seam(&self) -> Ref<'_, i32> {
        self.on_seam.borrow()
    }
}
impl QuakeMdl_MdlTexcoord {
    pub fn s(&self) -> Ref<'_, i32> {
        self.s.borrow()
    }
}
impl QuakeMdl_MdlTexcoord {
    pub fn t(&self) -> Ref<'_, i32> {
        self.t.borrow()
    }
}
impl QuakeMdl_MdlTexcoord {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Represents a triangular face, connecting 3 vertices, referenced
 * by their indexes.
 * \sa https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88 Source
 * \sa https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3 Source
 */

#[derive(Default, Debug, Clone)]
pub struct QuakeMdl_MdlTriangle {
    pub _root: SharedType<QuakeMdl>,
    pub _parent: SharedType<QuakeMdl>,
    pub _self: SharedType<Self>,
    faces_front: RefCell<i32>,
    vertices: RefCell<Vec<i32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuakeMdl_MdlTriangle {
    type Root = QuakeMdl;
    type Parent = QuakeMdl;

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
        *self_rc.faces_front.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.vertices.borrow_mut() = Vec::new();
        let l_vertices = 3;
        for _i in 0..l_vertices {
            self_rc.vertices.borrow_mut().push(_io.read_s4le()?.into());
        }
        Ok(())
    }
}
impl QuakeMdl_MdlTriangle {
}
impl QuakeMdl_MdlTriangle {
    pub fn faces_front(&self) -> Ref<'_, i32> {
        self.faces_front.borrow()
    }
}
impl QuakeMdl_MdlTriangle {
    pub fn vertices(&self) -> Ref<'_, Vec<i32>> {
        self.vertices.borrow()
    }
}
impl QuakeMdl_MdlTriangle {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct QuakeMdl_MdlVertex {
    pub _root: SharedType<QuakeMdl>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<u8>>,
    normal_index: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuakeMdl_MdlVertex {
    type Root = QuakeMdl;
    type Parent = KStructUnit;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = 3;
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(_io.read_u1()?.into());
        }
        *self_rc.normal_index.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl QuakeMdl_MdlVertex {
}
impl QuakeMdl_MdlVertex {
    pub fn values(&self) -> Ref<'_, Vec<u8>> {
        self.values.borrow()
    }
}
impl QuakeMdl_MdlVertex {
    pub fn normal_index(&self) -> Ref<'_, u8> {
        self.normal_index.borrow()
    }
}
impl QuakeMdl_MdlVertex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Basic 3D vector (x, y, z) using single-precision floating point
 * coordnates. Can be used to specify a point in 3D space,
 * direction, scaling factor, etc.
 */

#[derive(Default, Debug, Clone)]
pub struct QuakeMdl_Vec3 {
    pub _root: SharedType<QuakeMdl>,
    pub _parent: SharedType<QuakeMdl_MdlHeader>,
    pub _self: SharedType<Self>,
    x: RefCell<f32>,
    y: RefCell<f32>,
    z: RefCell<f32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for QuakeMdl_Vec3 {
    type Root = QuakeMdl;
    type Parent = QuakeMdl_MdlHeader;

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
impl QuakeMdl_Vec3 {
}
impl QuakeMdl_Vec3 {
    pub fn x(&self) -> Ref<'_, f32> {
        self.x.borrow()
    }
}
impl QuakeMdl_Vec3 {
    pub fn y(&self) -> Ref<'_, f32> {
        self.y.borrow()
    }
}
impl QuakeMdl_Vec3 {
    pub fn z(&self) -> Ref<'_, f32> {
        self.z.borrow()
    }
}
impl QuakeMdl_Vec3 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
