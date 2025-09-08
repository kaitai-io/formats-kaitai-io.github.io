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
 * The MD2 format is used for 3D animated models in id Sofware's Quake II.
 * 
 * A model consists of named `frames`, each with the same number of `vertices`
 * (`vertices_per_frame`). Each such vertex has a `position` and `normal` in
 * model space. Each vertex has the same topological "meaning" across frames, in
 * terms of triangle and texture info; it just varies in position and normal for
 * animation purposes.
 * 
 * How the vertices form triangles is defined via disjoint `triangles` or via
 * `gl_cmds` (which allows strip and fan topology). Each triangle contains three
 * `vertex_indices` into frame vertices, and three `tex_point_indices` into
 * global `tex_coords`. Each texture point has pixel coords `s_px` and `t_px`
 * ranging from 0 to `skin_{width,height}_px` respectively, along with
 * `{s,t}_normalized` ranging from 0 to 1 for your convenience.
 * 
 * A GL command has a `primitive` type (`TRIANGLE_FAN` or `TRIANGLE_STRIP`) along
 * with some `vertices`. Each GL vertex contains `tex_coords_normalized` from 0
 * to 1, and a `vertex_index` into frame vertices.
 * 
 * A model may also contain `skins`, which are just file paths to PCX images.
 * However, this is empty for many models, in which case it is up to the client
 * (e.g. Q2PRO) to offer skins some other way (e.g. by similar filename in the
 * current directory).
 * 
 * There are 198 `frames` in total, partitioned into a fixed set of ranges used
 * for different animations. Each frame has a standard `name` for humans, but the
 * client just uses their index and the name can be arbitrary. The name, start
 * frame index and frame count of each animation can be looked up in the arrays
 * `anim_names`, `anim_start_indices`, and `anim_num_frames` respectively. This
 * information is summarized in the following table:
 * 
 * ```
 * |   INDEX  |    NAME | SUFFIX | NOTES                                                  |
 * |:--------:|--------:|:-------|:-------------------------------------------------------|
 * |    0-39  |   stand | 01-40  | Idle animation                                         |
 * |   40-45  |     run | 1-6    | Full run cycle                                         |
 * |   46-53  |  attack | 1-8    | Shoot, reload; some weapons just repeat 1st few frames |
 * |   54-57  |   pain1 | 01-04  | Q2Pro also uses this for switching weapons             |
 * |   58-61  |   pain2 | 01-04  |                                                        |
 * |   62-65  |   pain3 | 01-04  |                                                        |
 * |   66-71  |    jump | 1-6    | Starts at height and lands on feet                     |
 * |   72-83  |    flip | 01-12  | Flipoff, i.e. middle finger                            |
 * |   84-94  |  salute | 01-11  |                                                        |
 * |   95-111 |   taunt | 01-17  |                                                        |
 * |  112-122 |    wave | 01-11  | Q2Pro plays this backwards for a handgrenade toss      |
 * |  123-134 |   point | 01-12  |                                                        |
 * |  135-153 |  crstnd | 01-19  | Idle while crouching                                   |
 * |  154-159 |  crwalk | 1-6    |                                                        |
 * |  160-168 | crattak | 1-9    |                                                        |
 * |  169-172 |  crpain | 1-4    |                                                        |
 * |  173-177 | crdeath | 1-5    |                                                        |
 * |  178-183 |  death1 | 01-06  |                                                        |
 * |  184-189 |  death2 | 01-06  |                                                        |
 * |  190-197 |  death3 | 01-08  |                                                        |
 * ```
 * 
 * The above are filled in for player models; for the separate weapon models,
 * the final frame is 173 "g_view" (unknown purpose) since weapons aren't shown
 * during death animations. `a_grenades.md2`, the handgrenade weapon model, is
 * the same except that the `wave` frames are blank (according to the default
 * female model files). This is likely due to its dual use as a grenade throw
 * animation where this model must leave the player's model.
 * \sa https://icculus.org/~phaethon/q3a/formats/md2-schoenblum.html Source
 * \sa http://tfc.duke.free.fr/coding/md2-specs-en.html Source
 * \sa http://tastyspleen.net/~panjoo/downloads/quake2_model_frames.html Source
 * \sa http://wiki.polycount.com/wiki/OldSiteResourcesQuake2FramesList Source
 */

#[derive(Default, Debug, Clone)]
pub struct Quake2Md2 {
    pub _root: SharedType<Quake2Md2>,
    pub _parent: SharedType<Quake2Md2>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<u32>,
    skin_width_px: RefCell<u32>,
    skin_height_px: RefCell<u32>,
    bytes_per_frame: RefCell<u32>,
    num_skins: RefCell<u32>,
    vertices_per_frame: RefCell<u32>,
    num_tex_coords: RefCell<u32>,
    num_triangles: RefCell<u32>,
    num_gl_cmds: RefCell<u32>,
    num_frames: RefCell<u32>,
    ofs_skins: RefCell<u32>,
    ofs_tex_coords: RefCell<u32>,
    ofs_triangles: RefCell<u32>,
    ofs_frames: RefCell<u32>,
    ofs_gl_cmds: RefCell<u32>,
    ofs_eof: RefCell<u32>,
    _io: RefCell<BytesReader>,
    frames_raw: RefCell<Vec<Vec<u8>>>,
    gl_cmds_raw: RefCell<Vec<u8>>,
    f_anim_names: Cell<bool>,
    anim_names: RefCell<Vec<String>>,
    f_anim_num_frames: Cell<bool>,
    anim_num_frames: RefCell<Vec<u8>>,
    f_anim_start_indices: Cell<bool>,
    anim_start_indices: RefCell<Vec<u8>>,
    f_anorms_table: Cell<bool>,
    anorms_table: RefCell<Vec<Vec<f64>>>,
    f_frames: Cell<bool>,
    frames: RefCell<Vec<OptRc<Quake2Md2_Frame>>>,
    f_gl_cmds: Cell<bool>,
    gl_cmds: RefCell<OptRc<Quake2Md2_GlCmdsList>>,
    f_skins: Cell<bool>,
    skins: RefCell<Vec<String>>,
    f_tex_coords: Cell<bool>,
    tex_coords: RefCell<Vec<OptRc<Quake2Md2_TexPoint>>>,
    f_triangles: Cell<bool>,
    triangles: RefCell<Vec<OptRc<Quake2Md2_Triangle>>>,
}
impl KStruct for Quake2Md2 {
    type Root = Quake2Md2;
    type Parent = Quake2Md2;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x49u8, 0x44u8, 0x50u8, 0x32u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.version() as u32) == (8 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/1".to_string() }));
        }
        *self_rc.skin_width_px.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.skin_height_px.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.bytes_per_frame.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_skins.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.vertices_per_frame.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_tex_coords.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_triangles.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_gl_cmds.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_frames.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_skins.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_tex_coords.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_triangles.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_frames.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_gl_cmds.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_eof.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Quake2Md2 {
    pub fn anim_names(
        &self
    ) -> KResult<Ref<'_, Vec<String>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_anim_names.get() {
            return Ok(self.anim_names.borrow());
        }
        self.f_anim_names.set(true);
        *self.anim_names.borrow_mut() = vec!["stand".to_string(), "run".to_string(), "attack".to_string(), "pain1".to_string(), "pain2".to_string(), "pain3".to_string(), "jump".to_string(), "flip".to_string(), "salute".to_string(), "taunt".to_string(), "wave".to_string(), "point".to_string(), "crstnd".to_string(), "crwalk".to_string(), "crattak".to_string(), "crpain".to_string(), "crdeath".to_string(), "death1".to_string(), "death2".to_string(), "death3".to_string()].to_vec();
        Ok(self.anim_names.borrow())
    }
    pub fn anim_num_frames(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_anim_num_frames.get() {
            return Ok(self.anim_num_frames.borrow());
        }
        self.f_anim_num_frames.set(true);
        *self.anim_num_frames.borrow_mut() = vec![0x28u8, 0x6u8, 0x8u8, 0x4u8, 0x4u8, 0x4u8, 0x6u8, 0xcu8, 0xbu8, 0x11u8, 0xbu8, 0xcu8, 0x13u8, 0x6u8, 0x9u8, 0x4u8, 0x5u8, 0x6u8, 0x6u8, 0x8u8].to_vec();
        Ok(self.anim_num_frames.borrow())
    }
    pub fn anim_start_indices(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_anim_start_indices.get() {
            return Ok(self.anim_start_indices.borrow());
        }
        self.f_anim_start_indices.set(true);
        *self.anim_start_indices.borrow_mut() = vec![0x0u8, 0x28u8, 0x2eu8, 0x36u8, 0x3au8, 0x3eu8, 0x42u8, 0x48u8, 0x54u8, 0x5fu8, 0x70u8, 0x7bu8, 0x87u8, 0x9au8, 0xa0u8, 0xa9u8, 0xadu8, 0xb2u8, 0xb8u8, 0xbeu8].to_vec();
        Ok(self.anim_start_indices.borrow())
    }

    /**
     * \sa https://github.com/skullernet/q2pro/blob/f4faabd/src/common/math.c#L80
     * from Quake anorms.h
     */
    pub fn anorms_table(
        &self
    ) -> KResult<Ref<'_, Vec<Vec<f64>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_anorms_table.get() {
            return Ok(self.anorms_table.borrow());
        }
        self.f_anorms_table.set(true);
        *self.anorms_table.borrow_mut() = vec![vec![-0.525731, 0.000000, 0.850651], vec![-0.442863, 0.238856, 0.864188], vec![-0.295242, 0.000000, 0.955423], vec![-0.309017, 0.500000, 0.809017], vec![-0.162460, 0.262866, 0.951056], vec![0.000000, 0.000000, 1.000000], vec![0.000000, 0.850651, 0.525731], vec![-0.147621, 0.716567, 0.681718], vec![0.147621, 0.716567, 0.681718], vec![0.000000, 0.525731, 0.850651], vec![0.309017, 0.500000, 0.809017], vec![0.525731, 0.000000, 0.850651], vec![0.295242, 0.000000, 0.955423], vec![0.442863, 0.238856, 0.864188], vec![0.162460, 0.262866, 0.951056], vec![-0.681718, 0.147621, 0.716567], vec![-0.809017, 0.309017, 0.500000], vec![-0.587785, 0.425325, 0.688191], vec![-0.850651, 0.525731, 0.000000], vec![-0.864188, 0.442863, 0.238856], vec![-0.716567, 0.681718, 0.147621], vec![-0.688191, 0.587785, 0.425325], vec![-0.500000, 0.809017, 0.309017], vec![-0.238856, 0.864188, 0.442863], vec![-0.425325, 0.688191, 0.587785], vec![-0.716567, 0.681718, -0.147621], vec![-0.500000, 0.809017, -0.309017], vec![-0.525731, 0.850651, 0.000000], vec![0.000000, 0.850651, -0.525731], vec![-0.238856, 0.864188, -0.442863], vec![0.000000, 0.955423, -0.295242], vec![-0.262866, 0.951056, -0.162460], vec![0.000000, 1.000000, 0.000000], vec![0.000000, 0.955423, 0.295242], vec![-0.262866, 0.951056, 0.162460], vec![0.238856, 0.864188, 0.442863], vec![0.262866, 0.951056, 0.162460], vec![0.500000, 0.809017, 0.309017], vec![0.238856, 0.864188, -0.442863], vec![0.262866, 0.951056, -0.162460], vec![0.500000, 0.809017, -0.309017], vec![0.850651, 0.525731, 0.000000], vec![0.716567, 0.681718, 0.147621], vec![0.716567, 0.681718, -0.147621], vec![0.525731, 0.850651, 0.000000], vec![0.425325, 0.688191, 0.587785], vec![0.864188, 0.442863, 0.238856], vec![0.688191, 0.587785, 0.425325], vec![0.809017, 0.309017, 0.500000], vec![0.681718, 0.147621, 0.716567], vec![0.587785, 0.425325, 0.688191], vec![0.955423, 0.295242, 0.000000], vec![1.000000, 0.000000, 0.000000], vec![0.951056, 0.162460, 0.262866], vec![0.850651, -0.525731, 0.000000], vec![0.955423, -0.295242, 0.000000], vec![0.864188, -0.442863, 0.238856], vec![0.951056, -0.162460, 0.262866], vec![0.809017, -0.309017, 0.500000], vec![0.681718, -0.147621, 0.716567], vec![0.850651, 0.000000, 0.525731], vec![0.864188, 0.442863, -0.238856], vec![0.809017, 0.309017, -0.500000], vec![0.951056, 0.162460, -0.262866], vec![0.525731, 0.000000, -0.850651], vec![0.681718, 0.147621, -0.716567], vec![0.681718, -0.147621, -0.716567], vec![0.850651, 0.000000, -0.525731], vec![0.809017, -0.309017, -0.500000], vec![0.864188, -0.442863, -0.238856], vec![0.951056, -0.162460, -0.262866], vec![0.147621, 0.716567, -0.681718], vec![0.309017, 0.500000, -0.809017], vec![0.425325, 0.688191, -0.587785], vec![0.442863, 0.238856, -0.864188], vec![0.587785, 0.425325, -0.688191], vec![0.688191, 0.587785, -0.425325], vec![-0.147621, 0.716567, -0.681718], vec![-0.309017, 0.500000, -0.809017], vec![0.000000, 0.525731, -0.850651], vec![-0.525731, 0.000000, -0.850651], vec![-0.442863, 0.238856, -0.864188], vec![-0.295242, 0.000000, -0.955423], vec![-0.162460, 0.262866, -0.951056], vec![0.000000, 0.000000, -1.000000], vec![0.295242, 0.000000, -0.955423], vec![0.162460, 0.262866, -0.951056], vec![-0.442863, -0.238856, -0.864188], vec![-0.309017, -0.500000, -0.809017], vec![-0.162460, -0.262866, -0.951056], vec![0.000000, -0.850651, -0.525731], vec![-0.147621, -0.716567, -0.681718], vec![0.147621, -0.716567, -0.681718], vec![0.000000, -0.525731, -0.850651], vec![0.309017, -0.500000, -0.809017], vec![0.442863, -0.238856, -0.864188], vec![0.162460, -0.262866, -0.951056], vec![0.238856, -0.864188, -0.442863], vec![0.500000, -0.809017, -0.309017], vec![0.425325, -0.688191, -0.587785], vec![0.716567, -0.681718, -0.147621], vec![0.688191, -0.587785, -0.425325], vec![0.587785, -0.425325, -0.688191], vec![0.000000, -0.955423, -0.295242], vec![0.000000, -1.000000, 0.000000], vec![0.262866, -0.951056, -0.162460], vec![0.000000, -0.850651, 0.525731], vec![0.000000, -0.955423, 0.295242], vec![0.238856, -0.864188, 0.442863], vec![0.262866, -0.951056, 0.162460], vec![0.500000, -0.809017, 0.309017], vec![0.716567, -0.681718, 0.147621], vec![0.525731, -0.850651, 0.000000], vec![-0.238856, -0.864188, -0.442863], vec![-0.500000, -0.809017, -0.309017], vec![-0.262866, -0.951056, -0.162460], vec![-0.850651, -0.525731, 0.000000], vec![-0.716567, -0.681718, -0.147621], vec![-0.716567, -0.681718, 0.147621], vec![-0.525731, -0.850651, 0.000000], vec![-0.500000, -0.809017, 0.309017], vec![-0.238856, -0.864188, 0.442863], vec![-0.262866, -0.951056, 0.162460], vec![-0.864188, -0.442863, 0.238856], vec![-0.809017, -0.309017, 0.500000], vec![-0.688191, -0.587785, 0.425325], vec![-0.681718, -0.147621, 0.716567], vec![-0.442863, -0.238856, 0.864188], vec![-0.587785, -0.425325, 0.688191], vec![-0.309017, -0.500000, 0.809017], vec![-0.147621, -0.716567, 0.681718], vec![-0.425325, -0.688191, 0.587785], vec![-0.162460, -0.262866, 0.951056], vec![0.442863, -0.238856, 0.864188], vec![0.162460, -0.262866, 0.951056], vec![0.309017, -0.500000, 0.809017], vec![0.147621, -0.716567, 0.681718], vec![0.000000, -0.525731, 0.850651], vec![0.425325, -0.688191, 0.587785], vec![0.587785, -0.425325, 0.688191], vec![0.688191, -0.587785, 0.425325], vec![-0.955423, 0.295242, 0.000000], vec![-0.951056, 0.162460, 0.262866], vec![-1.000000, 0.000000, 0.000000], vec![-0.850651, 0.000000, 0.525731], vec![-0.955423, -0.295242, 0.000000], vec![-0.951056, -0.162460, 0.262866], vec![-0.864188, 0.442863, -0.238856], vec![-0.951056, 0.162460, -0.262866], vec![-0.809017, 0.309017, -0.500000], vec![-0.864188, -0.442863, -0.238856], vec![-0.951056, -0.162460, -0.262866], vec![-0.809017, -0.309017, -0.500000], vec![-0.681718, 0.147621, -0.716567], vec![-0.681718, -0.147621, -0.716567], vec![-0.850651, 0.000000, -0.525731], vec![-0.688191, 0.587785, -0.425325], vec![-0.587785, 0.425325, -0.688191], vec![-0.425325, 0.688191, -0.587785], vec![-0.425325, -0.688191, -0.587785], vec![-0.587785, -0.425325, -0.688191], vec![-0.688191, -0.587785, -0.425325]].to_vec();
        Ok(self.anorms_table.borrow())
    }
    pub fn frames(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Quake2Md2_Frame>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_frames.get() {
            return Ok(self.frames.borrow());
        }
        self.f_frames.set(true);
        let _pos = _io.pos();
        _io.seek(*self.ofs_frames() as usize)?;
        *self.frames_raw.borrow_mut() = Vec::new();
        *self.frames.borrow_mut() = Vec::new();
        let l_frames = *self.num_frames();
        for _i in 0..l_frames {
            self.frames_raw.borrow_mut().push(_io.read_bytes(*self.bytes_per_frame() as usize)?.into());
            let frames_raw = self.frames_raw.borrow();
            let io_frames_raw = BytesReader::from(frames_raw.last().unwrap().clone());
            let t = Self::read_into::<BytesReader, Quake2Md2_Frame>(&io_frames_raw, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.frames.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.frames.borrow())
    }
    pub fn gl_cmds(
        &self
    ) -> KResult<Ref<'_, OptRc<Quake2Md2_GlCmdsList>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_gl_cmds.get() {
            return Ok(self.gl_cmds.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ofs_gl_cmds() as usize)?;
        *self.gl_cmds_raw.borrow_mut() = _io.read_bytes(((4 as u32) * (*self.num_gl_cmds() as u32)) as usize)?.into();
        let gl_cmds_raw = self.gl_cmds_raw.borrow();
        let _t_gl_cmds_raw_io = BytesReader::from(gl_cmds_raw.clone());
        let t = Self::read_into::<BytesReader, Quake2Md2_GlCmdsList>(&_t_gl_cmds_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.gl_cmds.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.gl_cmds.borrow())
    }
    pub fn skins(
        &self
    ) -> KResult<Ref<'_, Vec<String>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_skins.get() {
            return Ok(self.skins.borrow());
        }
        self.f_skins.set(true);
        let _pos = _io.pos();
        _io.seek(*self.ofs_skins() as usize)?;
        *self.skins.borrow_mut() = Vec::new();
        let l_skins = *self.num_skins();
        for _i in 0..l_skins {
            self.skins.borrow_mut().push(bytes_to_str(&bytes_terminate(&_io.read_bytes(64 as usize)?.into(), 0, false).into(), "ASCII")?);
        }
        _io.seek(_pos)?;
        Ok(self.skins.borrow())
    }
    pub fn tex_coords(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Quake2Md2_TexPoint>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tex_coords.get() {
            return Ok(self.tex_coords.borrow());
        }
        self.f_tex_coords.set(true);
        let _pos = _io.pos();
        _io.seek(*self.ofs_tex_coords() as usize)?;
        *self.tex_coords.borrow_mut() = Vec::new();
        let l_tex_coords = *self.num_tex_coords();
        for _i in 0..l_tex_coords {
            let t = Self::read_into::<_, Quake2Md2_TexPoint>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.tex_coords.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.tex_coords.borrow())
    }
    pub fn triangles(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Quake2Md2_Triangle>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_triangles.get() {
            return Ok(self.triangles.borrow());
        }
        self.f_triangles.set(true);
        let _pos = _io.pos();
        _io.seek(*self.ofs_triangles() as usize)?;
        *self.triangles.borrow_mut() = Vec::new();
        let l_triangles = *self.num_triangles();
        for _i in 0..l_triangles {
            let t = Self::read_into::<_, Quake2Md2_Triangle>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.triangles.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.triangles.borrow())
    }
}
impl Quake2Md2 {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Quake2Md2 {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}
impl Quake2Md2 {
    pub fn skin_width_px(&self) -> Ref<'_, u32> {
        self.skin_width_px.borrow()
    }
}
impl Quake2Md2 {
    pub fn skin_height_px(&self) -> Ref<'_, u32> {
        self.skin_height_px.borrow()
    }
}
impl Quake2Md2 {
    pub fn bytes_per_frame(&self) -> Ref<'_, u32> {
        self.bytes_per_frame.borrow()
    }
}
impl Quake2Md2 {
    pub fn num_skins(&self) -> Ref<'_, u32> {
        self.num_skins.borrow()
    }
}
impl Quake2Md2 {
    pub fn vertices_per_frame(&self) -> Ref<'_, u32> {
        self.vertices_per_frame.borrow()
    }
}
impl Quake2Md2 {
    pub fn num_tex_coords(&self) -> Ref<'_, u32> {
        self.num_tex_coords.borrow()
    }
}
impl Quake2Md2 {
    pub fn num_triangles(&self) -> Ref<'_, u32> {
        self.num_triangles.borrow()
    }
}
impl Quake2Md2 {
    pub fn num_gl_cmds(&self) -> Ref<'_, u32> {
        self.num_gl_cmds.borrow()
    }
}
impl Quake2Md2 {
    pub fn num_frames(&self) -> Ref<'_, u32> {
        self.num_frames.borrow()
    }
}
impl Quake2Md2 {
    pub fn ofs_skins(&self) -> Ref<'_, u32> {
        self.ofs_skins.borrow()
    }
}
impl Quake2Md2 {
    pub fn ofs_tex_coords(&self) -> Ref<'_, u32> {
        self.ofs_tex_coords.borrow()
    }
}
impl Quake2Md2 {
    pub fn ofs_triangles(&self) -> Ref<'_, u32> {
        self.ofs_triangles.borrow()
    }
}
impl Quake2Md2 {
    pub fn ofs_frames(&self) -> Ref<'_, u32> {
        self.ofs_frames.borrow()
    }
}
impl Quake2Md2 {
    pub fn ofs_gl_cmds(&self) -> Ref<'_, u32> {
        self.ofs_gl_cmds.borrow()
    }
}
impl Quake2Md2 {
    pub fn ofs_eof(&self) -> Ref<'_, u32> {
        self.ofs_eof.borrow()
    }
}
impl Quake2Md2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Quake2Md2 {
    pub fn frames_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.frames_raw.borrow()
    }
}
impl Quake2Md2 {
    pub fn gl_cmds_raw(&self) -> Ref<'_, Vec<u8>> {
        self.gl_cmds_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Quake2Md2_GlPrimitive {
    TriangleStrip,
    TriangleFan,
    Unknown(i64),
}

impl TryFrom<i64> for Quake2Md2_GlPrimitive {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Quake2Md2_GlPrimitive> {
        match flag {
            0 => Ok(Quake2Md2_GlPrimitive::TriangleStrip),
            1 => Ok(Quake2Md2_GlPrimitive::TriangleFan),
            _ => Ok(Quake2Md2_GlPrimitive::Unknown(flag)),
        }
    }
}

impl From<&Quake2Md2_GlPrimitive> for i64 {
    fn from(v: &Quake2Md2_GlPrimitive) -> Self {
        match *v {
            Quake2Md2_GlPrimitive::TriangleStrip => 0,
            Quake2Md2_GlPrimitive::TriangleFan => 1,
            Quake2Md2_GlPrimitive::Unknown(v) => v
        }
    }
}

impl Default for Quake2Md2_GlPrimitive {
    fn default() -> Self { Quake2Md2_GlPrimitive::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Quake2Md2_CompressedVec {
    pub _root: SharedType<Quake2Md2>,
    pub _parent: SharedType<Quake2Md2_Vertex>,
    pub _self: SharedType<Self>,
    x_compressed: RefCell<u8>,
    y_compressed: RefCell<u8>,
    z_compressed: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_x: Cell<bool>,
    x: RefCell<f64>,
    f_y: Cell<bool>,
    y: RefCell<f64>,
    f_z: Cell<bool>,
    z: RefCell<f64>,
}
impl KStruct for Quake2Md2_CompressedVec {
    type Root = Quake2Md2;
    type Parent = Quake2Md2_Vertex;

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
        *self_rc.x_compressed.borrow_mut() = _io.read_u1()?.into();
        *self_rc.y_compressed.borrow_mut() = _io.read_u1()?.into();
        *self_rc.z_compressed.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Quake2Md2_CompressedVec {
    pub fn x(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_x.get() {
            return Ok(self.x.borrow());
        }
        self.f_x.set(true);
        *self.x.borrow_mut() = (((((*self.x_compressed() as f64) * (*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().scale().x() as f64)) as f64) + (*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().translate().x() as f64))) as f64;
        Ok(self.x.borrow())
    }
    pub fn y(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_y.get() {
            return Ok(self.y.borrow());
        }
        self.f_y.set(true);
        *self.y.borrow_mut() = (((((*self.y_compressed() as f64) * (*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().scale().y() as f64)) as f64) + (*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().translate().y() as f64))) as f64;
        Ok(self.y.borrow())
    }
    pub fn z(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_z.get() {
            return Ok(self.z.borrow());
        }
        self.f_z.set(true);
        *self.z.borrow_mut() = (((((*self.z_compressed() as f64) * (*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().scale().z() as f64)) as f64) + (*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().translate().z() as f64))) as f64;
        Ok(self.z.borrow())
    }
}
impl Quake2Md2_CompressedVec {
    pub fn x_compressed(&self) -> Ref<'_, u8> {
        self.x_compressed.borrow()
    }
}
impl Quake2Md2_CompressedVec {
    pub fn y_compressed(&self) -> Ref<'_, u8> {
        self.y_compressed.borrow()
    }
}
impl Quake2Md2_CompressedVec {
    pub fn z_compressed(&self) -> Ref<'_, u8> {
        self.z_compressed.borrow()
    }
}
impl Quake2Md2_CompressedVec {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Quake2Md2_Frame {
    pub _root: SharedType<Quake2Md2>,
    pub _parent: SharedType<Quake2Md2>,
    pub _self: SharedType<Self>,
    scale: RefCell<OptRc<Quake2Md2_Vec3f>>,
    translate: RefCell<OptRc<Quake2Md2_Vec3f>>,
    name: RefCell<String>,
    vertices: RefCell<Vec<OptRc<Quake2Md2_Vertex>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Quake2Md2_Frame {
    type Root = Quake2Md2;
    type Parent = Quake2Md2;

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
        let t = Self::read_into::<_, Quake2Md2_Vec3f>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.scale.borrow_mut() = t;
        let t = Self::read_into::<_, Quake2Md2_Vec3f>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.translate.borrow_mut() = t;
        *self_rc.name.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(16 as usize)?.into(), 0, false).into(), "ASCII")?;
        *self_rc.vertices.borrow_mut() = Vec::new();
        let l_vertices = *_r.vertices_per_frame();
        for _i in 0..l_vertices {
            let t = Self::read_into::<_, Quake2Md2_Vertex>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.vertices.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Quake2Md2_Frame {
}
impl Quake2Md2_Frame {
    pub fn scale(&self) -> Ref<'_, OptRc<Quake2Md2_Vec3f>> {
        self.scale.borrow()
    }
}
impl Quake2Md2_Frame {
    pub fn translate(&self) -> Ref<'_, OptRc<Quake2Md2_Vec3f>> {
        self.translate.borrow()
    }
}
impl Quake2Md2_Frame {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Quake2Md2_Frame {
    pub fn vertices(&self) -> Ref<'_, Vec<OptRc<Quake2Md2_Vertex>>> {
        self.vertices.borrow()
    }
}
impl Quake2Md2_Frame {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Quake2Md2_GlCmd {
    pub _root: SharedType<Quake2Md2>,
    pub _parent: SharedType<Quake2Md2_GlCmdsList>,
    pub _self: SharedType<Self>,
    cmd_num_vertices: RefCell<i32>,
    vertices: RefCell<Vec<OptRc<Quake2Md2_GlVertex>>>,
    _io: RefCell<BytesReader>,
    f_num_vertices: Cell<bool>,
    num_vertices: RefCell<i32>,
    f_primitive: Cell<bool>,
    primitive: RefCell<Quake2Md2_GlPrimitive>,
}
impl KStruct for Quake2Md2_GlCmd {
    type Root = Quake2Md2;
    type Parent = Quake2Md2_GlCmdsList;

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
        *self_rc.cmd_num_vertices.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.vertices.borrow_mut() = Vec::new();
        let l_vertices = *self_rc.num_vertices()?;
        for _i in 0..l_vertices {
            let t = Self::read_into::<_, Quake2Md2_GlVertex>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.vertices.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Quake2Md2_GlCmd {
    pub fn num_vertices(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_vertices.get() {
            return Ok(self.num_vertices.borrow());
        }
        self.f_num_vertices.set(true);
        *self.num_vertices.borrow_mut() = (if ((*self.cmd_num_vertices() as i32) < (0 as i32)) { -(*self.cmd_num_vertices()) } else { *self.cmd_num_vertices() }) as i32;
        Ok(self.num_vertices.borrow())
    }
    pub fn primitive(
        &self
    ) -> KResult<Ref<'_, Quake2Md2_GlPrimitive>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_primitive.get() {
            return Ok(self.primitive.borrow());
        }
        self.f_primitive.set(true);
        *self.primitive.borrow_mut() = if ((*self.cmd_num_vertices() as i32) < (0 as i32)) { Quake2Md2_GlPrimitive::TriangleFan.clone() } else { Quake2Md2_GlPrimitive::TriangleStrip.clone() };
        Ok(self.primitive.borrow())
    }
}
impl Quake2Md2_GlCmd {
    pub fn cmd_num_vertices(&self) -> Ref<'_, i32> {
        self.cmd_num_vertices.borrow()
    }
}
impl Quake2Md2_GlCmd {
    pub fn vertices(&self) -> Ref<'_, Vec<OptRc<Quake2Md2_GlVertex>>> {
        self.vertices.borrow()
    }
}
impl Quake2Md2_GlCmd {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Quake2Md2_GlCmdsList {
    pub _root: SharedType<Quake2Md2>,
    pub _parent: SharedType<Quake2Md2>,
    pub _self: SharedType<Self>,
    items: RefCell<Vec<OptRc<Quake2Md2_GlCmd>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Quake2Md2_GlCmdsList {
    type Root = Quake2Md2;
    type Parent = Quake2Md2;

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
        if !(_io.is_eof()) {
            *self_rc.items.borrow_mut() = Vec::new();
            {
                let mut _i = 0;
                while {
                    let t = Self::read_into::<_, Quake2Md2_GlCmd>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    self_rc.items.borrow_mut().push(t);
                    let _t_items = self_rc.items.borrow();
                    let _tmpa = _t_items.last().unwrap();
                    _i += 1;
                    let x = !(((*_tmpa.cmd_num_vertices() as i32) == (0 as i32)));
                    x
                } {}
            }
        }
        Ok(())
    }
}
impl Quake2Md2_GlCmdsList {
}
impl Quake2Md2_GlCmdsList {
    pub fn items(&self) -> Ref<'_, Vec<OptRc<Quake2Md2_GlCmd>>> {
        self.items.borrow()
    }
}
impl Quake2Md2_GlCmdsList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Quake2Md2_GlVertex {
    pub _root: SharedType<Quake2Md2>,
    pub _parent: SharedType<Quake2Md2_GlCmd>,
    pub _self: SharedType<Self>,
    tex_coords_normalized: RefCell<Vec<f32>>,
    vertex_index: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Quake2Md2_GlVertex {
    type Root = Quake2Md2;
    type Parent = Quake2Md2_GlCmd;

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
        *self_rc.tex_coords_normalized.borrow_mut() = Vec::new();
        let l_tex_coords_normalized = 2;
        for _i in 0..l_tex_coords_normalized {
            self_rc.tex_coords_normalized.borrow_mut().push(_io.read_f4le()?.into());
        }
        *self_rc.vertex_index.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Quake2Md2_GlVertex {
}
impl Quake2Md2_GlVertex {
    pub fn tex_coords_normalized(&self) -> Ref<'_, Vec<f32>> {
        self.tex_coords_normalized.borrow()
    }
}

/**
 * index to `_root.frames[i].vertices` (for each frame with index `i`)
 */
impl Quake2Md2_GlVertex {
    pub fn vertex_index(&self) -> Ref<'_, u32> {
        self.vertex_index.borrow()
    }
}
impl Quake2Md2_GlVertex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Quake2Md2_TexPoint {
    pub _root: SharedType<Quake2Md2>,
    pub _parent: SharedType<Quake2Md2>,
    pub _self: SharedType<Self>,
    s_px: RefCell<u16>,
    t_px: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_s_normalized: Cell<bool>,
    s_normalized: RefCell<f64>,
    f_t_normalized: Cell<bool>,
    t_normalized: RefCell<f64>,
}
impl KStruct for Quake2Md2_TexPoint {
    type Root = Quake2Md2;
    type Parent = Quake2Md2;

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
        *self_rc.s_px.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.t_px.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Quake2Md2_TexPoint {
    pub fn s_normalized(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_s_normalized.get() {
            return Ok(self.s_normalized.borrow());
        }
        self.f_s_normalized.set(true);
        *self.s_normalized.borrow_mut() = (((((*self.s_px() as f64) + (0.0 as f64)) as f64) / (*_r.skin_width_px() as f64))) as f64;
        Ok(self.s_normalized.borrow())
    }
    pub fn t_normalized(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_t_normalized.get() {
            return Ok(self.t_normalized.borrow());
        }
        self.f_t_normalized.set(true);
        *self.t_normalized.borrow_mut() = (((((*self.t_px() as f64) + (0.0 as f64)) as f64) / (*_r.skin_height_px() as f64))) as f64;
        Ok(self.t_normalized.borrow())
    }
}
impl Quake2Md2_TexPoint {
    pub fn s_px(&self) -> Ref<'_, u16> {
        self.s_px.borrow()
    }
}
impl Quake2Md2_TexPoint {
    pub fn t_px(&self) -> Ref<'_, u16> {
        self.t_px.borrow()
    }
}
impl Quake2Md2_TexPoint {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Quake2Md2_Triangle {
    pub _root: SharedType<Quake2Md2>,
    pub _parent: SharedType<Quake2Md2>,
    pub _self: SharedType<Self>,
    vertex_indices: RefCell<Vec<u16>>,
    tex_point_indices: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Quake2Md2_Triangle {
    type Root = Quake2Md2;
    type Parent = Quake2Md2;

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
        *self_rc.vertex_indices.borrow_mut() = Vec::new();
        let l_vertex_indices = 3;
        for _i in 0..l_vertex_indices {
            self_rc.vertex_indices.borrow_mut().push(_io.read_u2le()?.into());
        }
        *self_rc.tex_point_indices.borrow_mut() = Vec::new();
        let l_tex_point_indices = 3;
        for _i in 0..l_tex_point_indices {
            self_rc.tex_point_indices.borrow_mut().push(_io.read_u2le()?.into());
        }
        Ok(())
    }
}
impl Quake2Md2_Triangle {
}

/**
 * indices to `_root.frames[i].vertices` (for each frame with index `i`)
 */
impl Quake2Md2_Triangle {
    pub fn vertex_indices(&self) -> Ref<'_, Vec<u16>> {
        self.vertex_indices.borrow()
    }
}

/**
 * indices to `_root.tex_coords`
 */
impl Quake2Md2_Triangle {
    pub fn tex_point_indices(&self) -> Ref<'_, Vec<u16>> {
        self.tex_point_indices.borrow()
    }
}
impl Quake2Md2_Triangle {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Quake2Md2_Vec3f {
    pub _root: SharedType<Quake2Md2>,
    pub _parent: SharedType<Quake2Md2_Frame>,
    pub _self: SharedType<Self>,
    x: RefCell<f32>,
    y: RefCell<f32>,
    z: RefCell<f32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Quake2Md2_Vec3f {
    type Root = Quake2Md2;
    type Parent = Quake2Md2_Frame;

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
impl Quake2Md2_Vec3f {
}
impl Quake2Md2_Vec3f {
    pub fn x(&self) -> Ref<'_, f32> {
        self.x.borrow()
    }
}
impl Quake2Md2_Vec3f {
    pub fn y(&self) -> Ref<'_, f32> {
        self.y.borrow()
    }
}
impl Quake2Md2_Vec3f {
    pub fn z(&self) -> Ref<'_, f32> {
        self.z.borrow()
    }
}
impl Quake2Md2_Vec3f {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Quake2Md2_Vertex {
    pub _root: SharedType<Quake2Md2>,
    pub _parent: SharedType<Quake2Md2_Frame>,
    pub _self: SharedType<Self>,
    position: RefCell<OptRc<Quake2Md2_CompressedVec>>,
    normal_index: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_normal: Cell<bool>,
    normal: RefCell<Vec<f64>>,
}
impl KStruct for Quake2Md2_Vertex {
    type Root = Quake2Md2;
    type Parent = Quake2Md2_Frame;

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
        let t = Self::read_into::<_, Quake2Md2_CompressedVec>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.position.borrow_mut() = t;
        *self_rc.normal_index.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Quake2Md2_Vertex {
    pub fn normal(
        &self
    ) -> KResult<Ref<'_, Vec<f64>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_normal.get() {
            return Ok(self.normal.borrow());
        }
        self.f_normal.set(true);
        *self.normal.borrow_mut() = _r.anorms_table()?[*self.normal_index() as usize].to_vec();
        Ok(self.normal.borrow())
    }
}
impl Quake2Md2_Vertex {
    pub fn position(&self) -> Ref<'_, OptRc<Quake2Md2_CompressedVec>> {
        self.position.borrow()
    }
}
impl Quake2Md2_Vertex {
    pub fn normal_index(&self) -> Ref<'_, u8> {
        self.normal_index.borrow()
    }
}
impl Quake2Md2_Vertex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
