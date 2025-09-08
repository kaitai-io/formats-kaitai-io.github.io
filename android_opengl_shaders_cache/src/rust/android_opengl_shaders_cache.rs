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
 * Android apps using directly or indirectly OpenGL cache compiled shaders
 * into com.android.opengl.shaders_cache file.
 * \sa https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp Source
 */

#[derive(Default, Debug, Clone)]
pub struct AndroidOpenglShadersCache {
    pub _root: SharedType<AndroidOpenglShadersCache>,
    pub _parent: SharedType<AndroidOpenglShadersCache>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    crc32: RefCell<u32>,
    contents: RefCell<OptRc<AndroidOpenglShadersCache_Cache>>,
    _io: RefCell<BytesReader>,
    contents_raw: RefCell<Vec<u8>>,
}
impl KStruct for AndroidOpenglShadersCache {
    type Root = AndroidOpenglShadersCache;
    type Parent = AndroidOpenglShadersCache;

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
        if !(*self_rc.magic() == vec![0x45u8, 0x47u8, 0x4cu8, 0x24u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.crc32.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.contents_raw.borrow_mut() = _io.read_bytes_full()?.into();
        let contents_raw = self_rc.contents_raw.borrow();
        let _t_contents_raw_io = BytesReader::from(contents_raw.clone());
        let t = Self::read_into::<BytesReader, AndroidOpenglShadersCache_Cache>(&_t_contents_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.contents.borrow_mut() = t;
        Ok(())
    }
}
impl AndroidOpenglShadersCache {
}
impl AndroidOpenglShadersCache {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * crc32 of `contents`
 */
impl AndroidOpenglShadersCache {
    pub fn crc32(&self) -> Ref<'_, u32> {
        self.crc32.borrow()
    }
}
impl AndroidOpenglShadersCache {
    pub fn contents(&self) -> Ref<'_, OptRc<AndroidOpenglShadersCache_Cache>> {
        self.contents.borrow()
    }
}
impl AndroidOpenglShadersCache {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl AndroidOpenglShadersCache {
    pub fn contents_raw(&self) -> Ref<'_, Vec<u8>> {
        self.contents_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AndroidOpenglShadersCache_Alignment {
    pub _root: SharedType<AndroidOpenglShadersCache>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    alignment: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AndroidOpenglShadersCache_Alignment {
    type Root = AndroidOpenglShadersCache;
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
        *self_rc.alignment.borrow_mut() = _io.read_bytes(((((_io.pos() as i32) + (3 as i32)) as i32) & (((~3 as i32) - (_io.pos() as i32)) as i32)) as usize)?.into();
        Ok(())
    }
}
impl AndroidOpenglShadersCache_Alignment {
}

/**
 * garbage from memory
 */
impl AndroidOpenglShadersCache_Alignment {
    pub fn alignment(&self) -> Ref<'_, Vec<u8>> {
        self.alignment.borrow()
    }
}
impl AndroidOpenglShadersCache_Alignment {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp Source
 */

#[derive(Default, Debug, Clone)]
pub struct AndroidOpenglShadersCache_Cache {
    pub _root: SharedType<AndroidOpenglShadersCache>,
    pub _parent: SharedType<AndroidOpenglShadersCache>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<u32>,
    device_version: RefCell<u32>,
    num_entries: RefCell<u32>,
    build_id: RefCell<OptRc<AndroidOpenglShadersCache_PrefixedString>>,
    entries: RefCell<Vec<OptRc<AndroidOpenglShadersCache_Cache_Entry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AndroidOpenglShadersCache_Cache {
    type Root = AndroidOpenglShadersCache;
    type Parent = AndroidOpenglShadersCache;

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
        if !(*self_rc.magic() == vec![0x24u8, 0x62u8, 0x42u8, 0x5fu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/cache/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.device_version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_entries.borrow_mut() = _io.read_u4le()?.into();
        if ((*self_rc.version() as u32) >= (3 as u32)) {
            let t = Self::read_into::<_, AndroidOpenglShadersCache_PrefixedString>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.build_id.borrow_mut() = t;
        }
        *self_rc.entries.borrow_mut() = Vec::new();
        let l_entries = *self_rc.num_entries();
        for _i in 0..l_entries {
            let t = Self::read_into::<_, AndroidOpenglShadersCache_Cache_Entry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl AndroidOpenglShadersCache_Cache {
}
impl AndroidOpenglShadersCache_Cache {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl AndroidOpenglShadersCache_Cache {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}
impl AndroidOpenglShadersCache_Cache {
    pub fn device_version(&self) -> Ref<'_, u32> {
        self.device_version.borrow()
    }
}
impl AndroidOpenglShadersCache_Cache {
    pub fn num_entries(&self) -> Ref<'_, u32> {
        self.num_entries.borrow()
    }
}
impl AndroidOpenglShadersCache_Cache {
    pub fn build_id(&self) -> Ref<'_, OptRc<AndroidOpenglShadersCache_PrefixedString>> {
        self.build_id.borrow()
    }
}
impl AndroidOpenglShadersCache_Cache {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<AndroidOpenglShadersCache_Cache_Entry>>> {
        self.entries.borrow()
    }
}
impl AndroidOpenglShadersCache_Cache {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AndroidOpenglShadersCache_Cache_Entry {
    pub _root: SharedType<AndroidOpenglShadersCache>,
    pub _parent: SharedType<AndroidOpenglShadersCache_Cache>,
    pub _self: SharedType<Self>,
    len_key: RefCell<u32>,
    len_value: RefCell<u32>,
    key: RefCell<Vec<u8>>,
    value: RefCell<Vec<u8>>,
    alignment: RefCell<OptRc<AndroidOpenglShadersCache_Alignment>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AndroidOpenglShadersCache_Cache_Entry {
    type Root = AndroidOpenglShadersCache;
    type Parent = AndroidOpenglShadersCache_Cache;

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
        *self_rc.len_key.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_value.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.key.borrow_mut() = _io.read_bytes(*self_rc.len_key() as usize)?.into();
        *self_rc.value.borrow_mut() = _io.read_bytes(*self_rc.len_value() as usize)?.into();
        let t = Self::read_into::<_, AndroidOpenglShadersCache_Alignment>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.alignment.borrow_mut() = t;
        Ok(())
    }
}
impl AndroidOpenglShadersCache_Cache_Entry {
}
impl AndroidOpenglShadersCache_Cache_Entry {
    pub fn len_key(&self) -> Ref<'_, u32> {
        self.len_key.borrow()
    }
}
impl AndroidOpenglShadersCache_Cache_Entry {
    pub fn len_value(&self) -> Ref<'_, u32> {
        self.len_value.borrow()
    }
}
impl AndroidOpenglShadersCache_Cache_Entry {
    pub fn key(&self) -> Ref<'_, Vec<u8>> {
        self.key.borrow()
    }
}
impl AndroidOpenglShadersCache_Cache_Entry {
    pub fn value(&self) -> Ref<'_, Vec<u8>> {
        self.value.borrow()
    }
}
impl AndroidOpenglShadersCache_Cache_Entry {
    pub fn alignment(&self) -> Ref<'_, OptRc<AndroidOpenglShadersCache_Alignment>> {
        self.alignment.borrow()
    }
}
impl AndroidOpenglShadersCache_Cache_Entry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AndroidOpenglShadersCache_PrefixedString {
    pub _root: SharedType<AndroidOpenglShadersCache>,
    pub _parent: SharedType<AndroidOpenglShadersCache_Cache>,
    pub _self: SharedType<Self>,
    len_str: RefCell<u32>,
    str: RefCell<String>,
    alignment: RefCell<OptRc<AndroidOpenglShadersCache_Alignment>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AndroidOpenglShadersCache_PrefixedString {
    type Root = AndroidOpenglShadersCache;
    type Parent = AndroidOpenglShadersCache_Cache;

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
        *self_rc.len_str.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.str.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(*self_rc.len_str() as usize)?.into(), 0, false).into(), "ASCII")?;
        let t = Self::read_into::<_, AndroidOpenglShadersCache_Alignment>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.alignment.borrow_mut() = t;
        Ok(())
    }
}
impl AndroidOpenglShadersCache_PrefixedString {
}
impl AndroidOpenglShadersCache_PrefixedString {
    pub fn len_str(&self) -> Ref<'_, u32> {
        self.len_str.borrow()
    }
}
impl AndroidOpenglShadersCache_PrefixedString {
    pub fn str(&self) -> Ref<'_, String> {
        self.str.borrow()
    }
}
impl AndroidOpenglShadersCache_PrefixedString {
    pub fn alignment(&self) -> Ref<'_, OptRc<AndroidOpenglShadersCache_Alignment>> {
        self.alignment.borrow()
    }
}
impl AndroidOpenglShadersCache_PrefixedString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
