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
 * Windows resource file (.res) are binary bundles of
 * "resources". Resource has some sort of ID (numerical or string),
 * type (predefined or user-defined), and raw value. Resource files can
 * be seen standalone (as .res file), or embedded inside PE executable
 * (.exe, .dll) files.
 * 
 * Typical use cases include:
 * 
 * * providing information about the application (such as title, copyrights, etc)
 * * embedding icon(s) to be displayed in file managers into .exe
 * * adding non-code data into the binary, such as menus, dialog forms,
 *   cursor images, fonts, various misc bitmaps, and locale-aware
 *   strings
 * 
 * Windows provides special API to access "resources" from a binary.
 * 
 * Normally, resources files are created with `rc` compiler: it takes a
 * .rc file (so called "resource-definition script") + all the raw
 * resource binary files for input, and outputs .res file. That .res
 * file can be linked into an .exe / .dll afterwards using a linker.
 * 
 * Internally, resource file is just a sequence of individual resource
 * definitions. RC tool ensures that first resource (#0) is always
 * empty.
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsResourceFile {
    pub _root: SharedType<WindowsResourceFile>,
    pub _parent: SharedType<WindowsResourceFile>,
    pub _self: SharedType<Self>,
    resources: RefCell<Vec<OptRc<WindowsResourceFile_Resource>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsResourceFile {
    type Root = WindowsResourceFile;
    type Parent = WindowsResourceFile;

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
        *self_rc.resources.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, WindowsResourceFile_Resource>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.resources.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl WindowsResourceFile {
}
impl WindowsResourceFile {
    pub fn resources(&self) -> Ref<'_, Vec<OptRc<WindowsResourceFile_Resource>>> {
        self.resources.borrow()
    }
}
impl WindowsResourceFile {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Each resource has a `type` and a `name`, which can be used to
 * identify it, and a `value`. Both `type` and `name` can be a
 * number or a string.
 * \sa https://learn.microsoft.com/en-us/windows/win32/menurc/resourceheader Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsResourceFile_Resource {
    pub _root: SharedType<WindowsResourceFile>,
    pub _parent: SharedType<WindowsResourceFile>,
    pub _self: SharedType<Self>,
    value_size: RefCell<u32>,
    header_size: RefCell<u32>,
    type: RefCell<OptRc<WindowsResourceFile_UnicodeOrId>>,
    name: RefCell<OptRc<WindowsResourceFile_UnicodeOrId>>,
    padding1: RefCell<Vec<u8>>,
    format_version: RefCell<u32>,
    flags: RefCell<u16>,
    language: RefCell<u16>,
    value_version: RefCell<u32>,
    characteristics: RefCell<u32>,
    value: RefCell<Vec<u8>>,
    padding2: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_type_as_predef: Cell<bool>,
    type_as_predef: RefCell<WindowsResourceFile_Resource_PredefTypes>,
}
impl KStruct for WindowsResourceFile_Resource {
    type Root = WindowsResourceFile;
    type Parent = WindowsResourceFile;

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
        *self_rc.value_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.header_size.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, WindowsResourceFile_UnicodeOrId>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.type.borrow_mut() = t;
        let t = Self::read_into::<_, WindowsResourceFile_UnicodeOrId>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.name.borrow_mut() = t;
        *self_rc.padding1.borrow_mut() = _io.read_bytes(modulo(((4 as i32) - (_io.pos() as i32)) as i64, 4 as i64) as usize)?.into();
        *self_rc.format_version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.language.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.value_version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.characteristics.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.value.borrow_mut() = _io.read_bytes(*self_rc.value_size() as usize)?.into();
        *self_rc.padding2.borrow_mut() = _io.read_bytes(modulo(((4 as i32) - (_io.pos() as i32)) as i64, 4 as i64) as usize)?.into();
        Ok(())
    }
}
impl WindowsResourceFile_Resource {

    /**
     * Numeric type IDs in range of [0..0xff] are reserved for
     * system usage in Windows, and there are some predefined,
     * well-known values in that range. This instance allows to get
     * it as enum value, if applicable.
     */
    pub fn type_as_predef(
        &self
    ) -> KResult<Ref<'_, WindowsResourceFile_Resource_PredefTypes>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type_as_predef.get() {
            return Ok(self.type_as_predef.borrow());
        }
        self.f_type_as_predef.set(true);
        if  ((!(*self.type().is_string()?)) && (((*self.type().as_numeric() as u16) <= (255 as u16))))  {
            *self.type_as_predef.borrow_mut() = (*self.type().as_numeric() as i64).try_into()?;
        }
        Ok(self.type_as_predef.borrow())
    }
}

/**
 * Size of resource value that follows the header
 */
impl WindowsResourceFile_Resource {
    pub fn value_size(&self) -> Ref<'_, u32> {
        self.value_size.borrow()
    }
}

/**
 * Size of this header (i.e. every field except `value` and an
 * optional padding after it)
 */
impl WindowsResourceFile_Resource {
    pub fn header_size(&self) -> Ref<'_, u32> {
        self.header_size.borrow()
    }
}
impl WindowsResourceFile_Resource {
    pub fn type(&self) -> Ref<'_, OptRc<WindowsResourceFile_UnicodeOrId>> {
        self.type.borrow()
    }
}
impl WindowsResourceFile_Resource {
    pub fn name(&self) -> Ref<'_, OptRc<WindowsResourceFile_UnicodeOrId>> {
        self.name.borrow()
    }
}
impl WindowsResourceFile_Resource {
    pub fn padding1(&self) -> Ref<'_, Vec<u8>> {
        self.padding1.borrow()
    }
}
impl WindowsResourceFile_Resource {
    pub fn format_version(&self) -> Ref<'_, u32> {
        self.format_version.borrow()
    }
}
impl WindowsResourceFile_Resource {
    pub fn flags(&self) -> Ref<'_, u16> {
        self.flags.borrow()
    }
}
impl WindowsResourceFile_Resource {
    pub fn language(&self) -> Ref<'_, u16> {
        self.language.borrow()
    }
}

/**
 * Version for value, as specified by a user.
 */
impl WindowsResourceFile_Resource {
    pub fn value_version(&self) -> Ref<'_, u32> {
        self.value_version.borrow()
    }
}

/**
 * Extra 4 bytes that can be used by user for any purpose.
 */
impl WindowsResourceFile_Resource {
    pub fn characteristics(&self) -> Ref<'_, u32> {
        self.characteristics.borrow()
    }
}
impl WindowsResourceFile_Resource {
    pub fn value(&self) -> Ref<'_, Vec<u8>> {
        self.value.borrow()
    }
}
impl WindowsResourceFile_Resource {
    pub fn padding2(&self) -> Ref<'_, Vec<u8>> {
        self.padding2.borrow()
    }
}
impl WindowsResourceFile_Resource {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum WindowsResourceFile_Resource_PredefTypes {
    Cursor,
    Bitmap,
    Icon,
    Menu,
    Dialog,
    String,
    Fontdir,
    Font,
    Accelerator,
    Rcdata,
    Messagetable,
    GroupCursor,
    GroupIcon,
    Version,
    Dlginclude,
    Plugplay,
    Vxd,
    Anicursor,
    Aniicon,
    Html,
    Manifest,
    Unknown(i64),
}

impl TryFrom<i64> for WindowsResourceFile_Resource_PredefTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<WindowsResourceFile_Resource_PredefTypes> {
        match flag {
            1 => Ok(WindowsResourceFile_Resource_PredefTypes::Cursor),
            2 => Ok(WindowsResourceFile_Resource_PredefTypes::Bitmap),
            3 => Ok(WindowsResourceFile_Resource_PredefTypes::Icon),
            4 => Ok(WindowsResourceFile_Resource_PredefTypes::Menu),
            5 => Ok(WindowsResourceFile_Resource_PredefTypes::Dialog),
            6 => Ok(WindowsResourceFile_Resource_PredefTypes::String),
            7 => Ok(WindowsResourceFile_Resource_PredefTypes::Fontdir),
            8 => Ok(WindowsResourceFile_Resource_PredefTypes::Font),
            9 => Ok(WindowsResourceFile_Resource_PredefTypes::Accelerator),
            10 => Ok(WindowsResourceFile_Resource_PredefTypes::Rcdata),
            11 => Ok(WindowsResourceFile_Resource_PredefTypes::Messagetable),
            12 => Ok(WindowsResourceFile_Resource_PredefTypes::GroupCursor),
            14 => Ok(WindowsResourceFile_Resource_PredefTypes::GroupIcon),
            16 => Ok(WindowsResourceFile_Resource_PredefTypes::Version),
            17 => Ok(WindowsResourceFile_Resource_PredefTypes::Dlginclude),
            19 => Ok(WindowsResourceFile_Resource_PredefTypes::Plugplay),
            20 => Ok(WindowsResourceFile_Resource_PredefTypes::Vxd),
            21 => Ok(WindowsResourceFile_Resource_PredefTypes::Anicursor),
            22 => Ok(WindowsResourceFile_Resource_PredefTypes::Aniicon),
            23 => Ok(WindowsResourceFile_Resource_PredefTypes::Html),
            24 => Ok(WindowsResourceFile_Resource_PredefTypes::Manifest),
            _ => Ok(WindowsResourceFile_Resource_PredefTypes::Unknown(flag)),
        }
    }
}

impl From<&WindowsResourceFile_Resource_PredefTypes> for i64 {
    fn from(v: &WindowsResourceFile_Resource_PredefTypes) -> Self {
        match *v {
            WindowsResourceFile_Resource_PredefTypes::Cursor => 1,
            WindowsResourceFile_Resource_PredefTypes::Bitmap => 2,
            WindowsResourceFile_Resource_PredefTypes::Icon => 3,
            WindowsResourceFile_Resource_PredefTypes::Menu => 4,
            WindowsResourceFile_Resource_PredefTypes::Dialog => 5,
            WindowsResourceFile_Resource_PredefTypes::String => 6,
            WindowsResourceFile_Resource_PredefTypes::Fontdir => 7,
            WindowsResourceFile_Resource_PredefTypes::Font => 8,
            WindowsResourceFile_Resource_PredefTypes::Accelerator => 9,
            WindowsResourceFile_Resource_PredefTypes::Rcdata => 10,
            WindowsResourceFile_Resource_PredefTypes::Messagetable => 11,
            WindowsResourceFile_Resource_PredefTypes::GroupCursor => 12,
            WindowsResourceFile_Resource_PredefTypes::GroupIcon => 14,
            WindowsResourceFile_Resource_PredefTypes::Version => 16,
            WindowsResourceFile_Resource_PredefTypes::Dlginclude => 17,
            WindowsResourceFile_Resource_PredefTypes::Plugplay => 19,
            WindowsResourceFile_Resource_PredefTypes::Vxd => 20,
            WindowsResourceFile_Resource_PredefTypes::Anicursor => 21,
            WindowsResourceFile_Resource_PredefTypes::Aniicon => 22,
            WindowsResourceFile_Resource_PredefTypes::Html => 23,
            WindowsResourceFile_Resource_PredefTypes::Manifest => 24,
            WindowsResourceFile_Resource_PredefTypes::Unknown(v) => v
        }
    }
}

impl Default for WindowsResourceFile_Resource_PredefTypes {
    fn default() -> Self { WindowsResourceFile_Resource_PredefTypes::Unknown(0) }
}


/**
 * Resources use a special serialization of names and types: they
 * can be either a number or a string.
 * 
 * Use `is_string` to check which kind we've got here, and then use
 * `as_numeric` or `as_string` to get relevant value.
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsResourceFile_UnicodeOrId {
    pub _root: SharedType<WindowsResourceFile>,
    pub _parent: SharedType<WindowsResourceFile_Resource>,
    pub _self: SharedType<Self>,
    first: RefCell<u16>,
    as_numeric: RefCell<u16>,
    rest: RefCell<Vec<u16>>,
    noop: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_as_string: Cell<bool>,
    as_string: RefCell<String>,
    f_is_string: Cell<bool>,
    is_string: RefCell<bool>,
    f_save_pos1: Cell<bool>,
    save_pos1: RefCell<i32>,
    f_save_pos2: Cell<bool>,
    save_pos2: RefCell<i32>,
}
impl KStruct for WindowsResourceFile_UnicodeOrId {
    type Root = WindowsResourceFile;
    type Parent = WindowsResourceFile_Resource;

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
        if ((*self_rc.save_pos1()? as i32) >= (0 as i32)) {
            *self_rc.first.borrow_mut() = _io.read_u2le()?.into();
        }
        if !(*self_rc.is_string()?) {
            *self_rc.as_numeric.borrow_mut() = _io.read_u2le()?.into();
        }
        if *self_rc.is_string()? {
            *self_rc.rest.borrow_mut() = Vec::new();
            {
                let mut _i = 0;
                while {
                    self_rc.rest.borrow_mut().push(_io.read_u2le()?.into());
                    let _t_rest = self_rc.rest.borrow();
                    let _tmpa = *_t_rest.last().unwrap();
                    _i += 1;
                    let x = !(((_tmpa as u16) == (0 as u16)));
                    x
                } {}
            }
        }
        if  ((*self_rc.is_string()?) && (((*self_rc.save_pos2()? as i32) >= (0 as i32))))  {
            *self_rc.noop.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        Ok(())
    }
}
impl WindowsResourceFile_UnicodeOrId {
    pub fn as_string(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_string.get() {
            return Ok(self.as_string.borrow());
        }
        self.f_as_string.set(true);
        if *self.is_string()? {
            let _pos = _io.pos();
            _io.seek(*self.save_pos1()? as usize)?;
            *self.as_string.borrow_mut() = bytes_to_str(&_io.read_bytes(((((*self.save_pos2()? as i32) - (*self.save_pos1()? as i32)) as i32) - (2 as i32)) as usize)?.into(), "UTF-16LE")?;
            _io.seek(_pos)?;
        }
        Ok(self.as_string.borrow())
    }
    pub fn is_string(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_string.get() {
            return Ok(self.is_string.borrow());
        }
        self.f_is_string.set(true);
        *self.is_string.borrow_mut() = (((*self.first() as i32) != (65535 as i32))) as bool;
        Ok(self.is_string.borrow())
    }
    pub fn save_pos1(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_save_pos1.get() {
            return Ok(self.save_pos1.borrow());
        }
        self.f_save_pos1.set(true);
        *self.save_pos1.borrow_mut() = (_io.pos()) as i32;
        Ok(self.save_pos1.borrow())
    }
    pub fn save_pos2(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_save_pos2.get() {
            return Ok(self.save_pos2.borrow());
        }
        self.f_save_pos2.set(true);
        *self.save_pos2.borrow_mut() = (_io.pos()) as i32;
        Ok(self.save_pos2.borrow())
    }
}
impl WindowsResourceFile_UnicodeOrId {
    pub fn first(&self) -> Ref<'_, u16> {
        self.first.borrow()
    }
}
impl WindowsResourceFile_UnicodeOrId {
    pub fn as_numeric(&self) -> Ref<'_, u16> {
        self.as_numeric.borrow()
    }
}
impl WindowsResourceFile_UnicodeOrId {
    pub fn rest(&self) -> Ref<'_, Vec<u16>> {
        self.rest.borrow()
    }
}
impl WindowsResourceFile_UnicodeOrId {
    pub fn noop(&self) -> Ref<'_, Vec<u8>> {
        self.noop.borrow()
    }
}
impl WindowsResourceFile_UnicodeOrId {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
