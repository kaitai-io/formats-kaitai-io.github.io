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
 * Format mostly used by Google Chrome and various Android apps to store
 * resources such as translated strings, help messages and images.
 * \sa https://web.archive.org/web/20220126211447/https://dev.chromium.org/developers/design-documents/linuxresourcesandlocalizedstrings Source
 * \sa https://chromium.googlesource.com/chromium/src/tools/grit/+/3c36f27/grit/format/data_pack.py Source
 * \sa https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/grit/format/data_pack.py Source
 */

#[derive(Default, Debug, Clone)]
pub struct ChromePak {
    pub _root: SharedType<ChromePak>,
    pub _parent: SharedType<ChromePak>,
    pub _self: SharedType<Self>,
    version: RefCell<u32>,
    num_resources_v4: RefCell<u32>,
    encoding: RefCell<ChromePak_Encodings>,
    v5_part: RefCell<OptRc<ChromePak_HeaderV5Part>>,
    resources: RefCell<Vec<OptRc<ChromePak_Resource>>>,
    aliases: RefCell<Vec<OptRc<ChromePak_Alias>>>,
    _io: RefCell<BytesReader>,
    f_num_aliases: Cell<bool>,
    num_aliases: RefCell<u16>,
    f_num_resources: Cell<bool>,
    num_resources: RefCell<u32>,
}
impl KStruct for ChromePak {
    type Root = ChromePak;
    type Parent = ChromePak;

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
        *self_rc.version.borrow_mut() = _io.read_u4le()?.into();
        if !( ((((*self_rc.version() as u32) == (4 as u32))) || (((*self_rc.version() as u32) == (5 as u32)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/seq/0".to_string() }));
        }
        if ((*self_rc.version() as u32) == (4 as u32)) {
            *self_rc.num_resources_v4.borrow_mut() = _io.read_u4le()?.into();
        }
        *self_rc.encoding.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if ((*self_rc.version() as u32) == (5 as u32)) {
            let t = Self::read_into::<_, ChromePak_HeaderV5Part>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.v5_part.borrow_mut() = t;
        }
        *self_rc.resources.borrow_mut() = Vec::new();
        let l_resources = ((*self_rc.num_resources()? as u32) + (1 as u32));
        for _i in 0..l_resources {
            let f = |t : &mut ChromePak_Resource| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?, ((_i as i32) < (*self_rc.num_resources()? as i32))));
            let t = Self::read_into_with_init::<_, ChromePak_Resource>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.resources.borrow_mut().push(t);
        }
        *self_rc.aliases.borrow_mut() = Vec::new();
        let l_aliases = *self_rc.num_aliases()?;
        for _i in 0..l_aliases {
            let t = Self::read_into::<_, ChromePak_Alias>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.aliases.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl ChromePak {
    pub fn num_aliases(
        &self
    ) -> KResult<Ref<'_, u16>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_aliases.get() {
            return Ok(self.num_aliases.borrow());
        }
        self.f_num_aliases.set(true);
        *self.num_aliases.borrow_mut() = (if ((*self.version() as u32) == (5 as u32)) { *self.v5_part().num_aliases() } else { 0 }) as u16;
        Ok(self.num_aliases.borrow())
    }
    pub fn num_resources(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_resources.get() {
            return Ok(self.num_resources.borrow());
        }
        self.f_num_resources.set(true);
        *self.num_resources.borrow_mut() = (if ((*self.version() as u32) == (5 as u32)) { *self.v5_part().num_resources() } else { *self.num_resources_v4() }) as u32;
        Ok(self.num_resources.borrow())
    }
}

/**
 * only versions 4 and 5 are supported
 */
impl ChromePak {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}
impl ChromePak {
    pub fn num_resources_v4(&self) -> Ref<'_, u32> {
        self.num_resources_v4.borrow()
    }
}

/**
 * Character encoding of all text resources in the PAK file. Note that
 * the file can **always** contain binary resources, this only applies to
 * those that are supposed to hold text.
 * 
 * In practice, this will probably always be `encodings::utf8` - I haven't
 * seen any organic file that would state otherwise. `UTF8` is also usually
 * hardcoded in Python scripts from the GRIT repository that generate .pak
 * files (for example
 * [`pak_util.py:79`](https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/pak_util.py#79)).
 */
impl ChromePak {
    pub fn encoding(&self) -> Ref<'_, ChromePak_Encodings> {
        self.encoding.borrow()
    }
}
impl ChromePak {
    pub fn v5_part(&self) -> Ref<'_, OptRc<ChromePak_HeaderV5Part>> {
        self.v5_part.borrow()
    }
}

/**
 * The length is calculated by looking at the offset of
 * the next item, so an extra entry is stored with id 0
 * and offset pointing to the end of the resources.
 */
impl ChromePak {
    pub fn resources(&self) -> Ref<'_, Vec<OptRc<ChromePak_Resource>>> {
        self.resources.borrow()
    }
}
impl ChromePak {
    pub fn aliases(&self) -> Ref<'_, Vec<OptRc<ChromePak_Alias>>> {
        self.aliases.borrow()
    }
}
impl ChromePak {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum ChromePak_Encodings {

    /**
     * file is not expected to contain any text resources
     */
    Binary,

    /**
     * all text resources are encoded in UTF-8
     */
    Utf8,

    /**
     * all text resources are encoded in UTF-16
     */
    Utf16,
    Unknown(i64),
}

impl TryFrom<i64> for ChromePak_Encodings {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<ChromePak_Encodings> {
        match flag {
            0 => Ok(ChromePak_Encodings::Binary),
            1 => Ok(ChromePak_Encodings::Utf8),
            2 => Ok(ChromePak_Encodings::Utf16),
            _ => Ok(ChromePak_Encodings::Unknown(flag)),
        }
    }
}

impl From<&ChromePak_Encodings> for i64 {
    fn from(v: &ChromePak_Encodings) -> Self {
        match *v {
            ChromePak_Encodings::Binary => 0,
            ChromePak_Encodings::Utf8 => 1,
            ChromePak_Encodings::Utf16 => 2,
            ChromePak_Encodings::Unknown(v) => v
        }
    }
}

impl Default for ChromePak_Encodings {
    fn default() -> Self { ChromePak_Encodings::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct ChromePak_Alias {
    pub _root: SharedType<ChromePak>,
    pub _parent: SharedType<ChromePak>,
    pub _self: SharedType<Self>,
    id: RefCell<u16>,
    resource_idx: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_resource: Cell<bool>,
    resource: RefCell<OptRc<ChromePak_Resource>>,
}
impl KStruct for ChromePak_Alias {
    type Root = ChromePak;
    type Parent = ChromePak;

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
        *self_rc.id.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.resource_idx.borrow_mut() = _io.read_u2le()?.into();
        if !(((*self_rc.resource_idx() as i32) <= (((*_prc.as_ref().unwrap().num_resources()? as u32) - (1 as u32)) as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/alias/seq/1".to_string() }));
        }
        Ok(())
    }
}
impl ChromePak_Alias {
    pub fn resource(
        &self
    ) -> KResult<Ref<'_, OptRc<ChromePak_Resource>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_resource.get() {
            return Ok(self.resource.borrow());
        }
        *self.resource.borrow_mut() = _prc.as_ref().unwrap().resources()[*self.resource_idx() as usize].clone();
        Ok(self.resource.borrow())
    }
}
impl ChromePak_Alias {
    pub fn id(&self) -> Ref<'_, u16> {
        self.id.borrow()
    }
}
impl ChromePak_Alias {
    pub fn resource_idx(&self) -> Ref<'_, u16> {
        self.resource_idx.borrow()
    }
}
impl ChromePak_Alias {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct ChromePak_HeaderV5Part {
    pub _root: SharedType<ChromePak>,
    pub _parent: SharedType<ChromePak>,
    pub _self: SharedType<Self>,
    encoding_padding: RefCell<Vec<u8>>,
    num_resources: RefCell<u16>,
    num_aliases: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ChromePak_HeaderV5Part {
    type Root = ChromePak;
    type Parent = ChromePak;

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
        *self_rc.encoding_padding.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        *self_rc.num_resources.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.num_aliases.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl ChromePak_HeaderV5Part {
}
impl ChromePak_HeaderV5Part {
    pub fn encoding_padding(&self) -> Ref<'_, Vec<u8>> {
        self.encoding_padding.borrow()
    }
}
impl ChromePak_HeaderV5Part {
    pub fn num_resources(&self) -> Ref<'_, u16> {
        self.num_resources.borrow()
    }
}
impl ChromePak_HeaderV5Part {
    pub fn num_aliases(&self) -> Ref<'_, u16> {
        self.num_aliases.borrow()
    }
}
impl ChromePak_HeaderV5Part {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct ChromePak_Resource {
    pub _root: SharedType<ChromePak>,
    pub _parent: SharedType<ChromePak>,
    pub _self: SharedType<Self>,
    idx: RefCell<i32>,
    has_body: RefCell<bool>,
    id: RefCell<u16>,
    ofs_body: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Vec<u8>>,
    f_len_body: Cell<bool>,
    len_body: RefCell<i32>,
}
impl KStruct for ChromePak_Resource {
    type Root = ChromePak;
    type Parent = ChromePak;

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
        *self_rc.id.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.ofs_body.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl ChromePak_Resource {
    pub fn idx(&self) -> Ref<'_, i32> {
        self.idx.borrow()
    }
}
impl ChromePak_Resource {
    pub fn has_body(&self) -> Ref<'_, bool> {
        self.has_body.borrow()
    }
}
impl ChromePak_Resource {
    pub fn set_params(&mut self, idx: i32, has_body: bool) {
        *self.idx.borrow_mut() = idx;
        *self.has_body.borrow_mut() = has_body;
    }
}
impl ChromePak_Resource {

    /**
     * MUST NOT be accessed until the next `resource` is parsed
     */
    pub fn body(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        self.f_body.set(true);
        if *self.has_body() {
            let _pos = _io.pos();
            _io.seek(*self.ofs_body() as usize)?;
            *self.body.borrow_mut() = _io.read_bytes(*self.len_body()? as usize)?.into();
            _io.seek(_pos)?;
        }
        Ok(self.body.borrow())
    }

    /**
     * MUST NOT be accessed until the next `resource` is parsed
     */
    pub fn len_body(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_body.get() {
            return Ok(self.len_body.borrow());
        }
        self.f_len_body.set(true);
        if *self.has_body() {
            *self.len_body.borrow_mut() = (((*_prc.as_ref().unwrap().resources()[((*self.idx() as i32) + (1 as i32)) as usize].ofs_body() as u32) - (*self.ofs_body() as u32))) as i32;
        }
        Ok(self.len_body.borrow())
    }
}
impl ChromePak_Resource {
    pub fn id(&self) -> Ref<'_, u16> {
        self.id.borrow()
    }
}
impl ChromePak_Resource {
    pub fn ofs_body(&self) -> Ref<'_, u32> {
        self.ofs_body.borrow()
    }
}
impl ChromePak_Resource {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
