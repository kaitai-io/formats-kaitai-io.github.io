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
 * GIF (Graphics Interchange Format) is an image file format, developed
 * in 1987. It became popular in 1990s as one of the main image formats
 * used in World Wide Web.
 * 
 * GIF format allows encoding of palette-based images up to 256 colors
 * (each of the colors can be chosen from a 24-bit RGB
 * colorspace). Image data stream uses LZW (Lempel-Ziv-Welch) lossless
 * compression.
 * 
 * Over the years, several version of the format were published and
 * several extensions to it were made, namely, a popular Netscape
 * extension that allows to store several images in one file, switching
 * between them, which produces crude form of animation.
 * 
 * Structurally, format consists of several mandatory headers and then
 * a stream of blocks follows. Blocks can carry additional
 * metainformation or image data.
 */

#[derive(Default, Debug, Clone)]
pub struct Gif {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<Gif>,
    pub _self: SharedType<Self>,
    hdr: RefCell<OptRc<Gif_Header>>,
    logical_screen_descriptor: RefCell<OptRc<Gif_LogicalScreenDescriptorStruct>>,
    global_color_table: RefCell<OptRc<Gif_ColorTable>>,
    blocks: RefCell<Vec<OptRc<Gif_Block>>>,
    _io: RefCell<BytesReader>,
    global_color_table_raw: RefCell<Vec<u8>>,
}
impl KStruct for Gif {
    type Root = Gif;
    type Parent = Gif;

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
        let t = Self::read_into::<_, Gif_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.hdr.borrow_mut() = t;
        let t = Self::read_into::<_, Gif_LogicalScreenDescriptorStruct>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.logical_screen_descriptor.borrow_mut() = t;
        if *self_rc.logical_screen_descriptor().has_color_table()? {
            *self_rc.global_color_table_raw.borrow_mut() = _io.read_bytes(((*self_rc.logical_screen_descriptor().color_table_size()? as i32) * (3 as i32)) as usize)?.into();
            let global_color_table_raw = self_rc.global_color_table_raw.borrow();
            let _t_global_color_table_raw_io = BytesReader::from(global_color_table_raw.clone());
            let t = Self::read_into::<BytesReader, Gif_ColorTable>(&_t_global_color_table_raw_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.global_color_table.borrow_mut() = t;
        }
        *self_rc.blocks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Gif_Block>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.blocks.borrow_mut().push(t);
                let _t_blocks = self_rc.blocks.borrow();
                let _tmpa = _t_blocks.last().unwrap();
                _i += 1;
                let x = !( ((_io.is_eof()) || (*_tmpa.block_type() == Gif_BlockType::EndOfFile)) );
                x
            } {}
        }
        Ok(())
    }
}
impl Gif {
}
impl Gif {
    pub fn hdr(&self) -> Ref<'_, OptRc<Gif_Header>> {
        self.hdr.borrow()
    }
}
impl Gif {
    pub fn logical_screen_descriptor(&self) -> Ref<'_, OptRc<Gif_LogicalScreenDescriptorStruct>> {
        self.logical_screen_descriptor.borrow()
    }
}

/**
 * \sa https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 18
 */
impl Gif {
    pub fn global_color_table(&self) -> Ref<'_, OptRc<Gif_ColorTable>> {
        self.global_color_table.borrow()
    }
}
impl Gif {
    pub fn blocks(&self) -> Ref<'_, Vec<OptRc<Gif_Block>>> {
        self.blocks.borrow()
    }
}
impl Gif {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Gif {
    pub fn global_color_table_raw(&self) -> Ref<'_, Vec<u8>> {
        self.global_color_table_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Gif_BlockType {
    Extension,
    LocalImageDescriptor,
    EndOfFile,
    Unknown(i64),
}

impl TryFrom<i64> for Gif_BlockType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Gif_BlockType> {
        match flag {
            33 => Ok(Gif_BlockType::Extension),
            44 => Ok(Gif_BlockType::LocalImageDescriptor),
            59 => Ok(Gif_BlockType::EndOfFile),
            _ => Ok(Gif_BlockType::Unknown(flag)),
        }
    }
}

impl From<&Gif_BlockType> for i64 {
    fn from(v: &Gif_BlockType) -> Self {
        match *v {
            Gif_BlockType::Extension => 33,
            Gif_BlockType::LocalImageDescriptor => 44,
            Gif_BlockType::EndOfFile => 59,
            Gif_BlockType::Unknown(v) => v
        }
    }
}

impl Default for Gif_BlockType {
    fn default() -> Self { Gif_BlockType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Gif_ExtensionLabel {
    GraphicControl,
    Comment,
    Application,
    Unknown(i64),
}

impl TryFrom<i64> for Gif_ExtensionLabel {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Gif_ExtensionLabel> {
        match flag {
            249 => Ok(Gif_ExtensionLabel::GraphicControl),
            254 => Ok(Gif_ExtensionLabel::Comment),
            255 => Ok(Gif_ExtensionLabel::Application),
            _ => Ok(Gif_ExtensionLabel::Unknown(flag)),
        }
    }
}

impl From<&Gif_ExtensionLabel> for i64 {
    fn from(v: &Gif_ExtensionLabel) -> Self {
        match *v {
            Gif_ExtensionLabel::GraphicControl => 249,
            Gif_ExtensionLabel::Comment => 254,
            Gif_ExtensionLabel::Application => 255,
            Gif_ExtensionLabel::Unknown(v) => v
        }
    }
}

impl Default for Gif_ExtensionLabel {
    fn default() -> Self { Gif_ExtensionLabel::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Gif_ApplicationId {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<Gif_ExtApplication>,
    pub _self: SharedType<Self>,
    len_bytes: RefCell<u8>,
    application_identifier: RefCell<String>,
    application_auth_code: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gif_ApplicationId {
    type Root = Gif;
    type Parent = Gif_ExtApplication;

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
        *self_rc.len_bytes.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.len_bytes() as u8) == (11 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/application_id/seq/0".to_string() }));
        }
        *self_rc.application_identifier.borrow_mut() = bytes_to_str(&_io.read_bytes(8 as usize)?.into(), "ASCII")?;
        *self_rc.application_auth_code.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        Ok(())
    }
}
impl Gif_ApplicationId {
}
impl Gif_ApplicationId {
    pub fn len_bytes(&self) -> Ref<'_, u8> {
        self.len_bytes.borrow()
    }
}
impl Gif_ApplicationId {
    pub fn application_identifier(&self) -> Ref<'_, String> {
        self.application_identifier.borrow()
    }
}
impl Gif_ApplicationId {
    pub fn application_auth_code(&self) -> Ref<'_, Vec<u8>> {
        self.application_auth_code.borrow()
    }
}
impl Gif_ApplicationId {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gif_Block {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<Gif>,
    pub _self: SharedType<Self>,
    block_type: RefCell<Gif_BlockType>,
    body: RefCell<Option<Gif_Block_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Gif_Block_Body {
    Gif_Extension(OptRc<Gif_Extension>),
    Gif_LocalImageDescriptor(OptRc<Gif_LocalImageDescriptor>),
}
impl From<&Gif_Block_Body> for OptRc<Gif_Extension> {
    fn from(v: &Gif_Block_Body) -> Self {
        if let Gif_Block_Body::Gif_Extension(x) = v {
            return x.clone();
        }
        panic!("expected Gif_Block_Body::Gif_Extension, got {:?}", v)
    }
}
impl From<OptRc<Gif_Extension>> for Gif_Block_Body {
    fn from(v: OptRc<Gif_Extension>) -> Self {
        Self::Gif_Extension(v)
    }
}
impl From<&Gif_Block_Body> for OptRc<Gif_LocalImageDescriptor> {
    fn from(v: &Gif_Block_Body) -> Self {
        if let Gif_Block_Body::Gif_LocalImageDescriptor(x) = v {
            return x.clone();
        }
        panic!("expected Gif_Block_Body::Gif_LocalImageDescriptor, got {:?}", v)
    }
}
impl From<OptRc<Gif_LocalImageDescriptor>> for Gif_Block_Body {
    fn from(v: OptRc<Gif_LocalImageDescriptor>) -> Self {
        Self::Gif_LocalImageDescriptor(v)
    }
}
impl KStruct for Gif_Block {
    type Root = Gif;
    type Parent = Gif;

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
        *self_rc.block_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        match *self_rc.block_type() {
            Gif_BlockType::Extension => {
                let t = Self::read_into::<_, Gif_Extension>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Gif_BlockType::LocalImageDescriptor => {
                let t = Self::read_into::<_, Gif_LocalImageDescriptor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Gif_Block {
}
impl Gif_Block {
    pub fn block_type(&self) -> Ref<'_, Gif_BlockType> {
        self.block_type.borrow()
    }
}
impl Gif_Block {
    pub fn body(&self) -> Ref<'_, Option<Gif_Block_Body>> {
        self.body.borrow()
    }
}
impl Gif_Block {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 19
 */

#[derive(Default, Debug, Clone)]
pub struct Gif_ColorTable {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Gif_ColorTableEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gif_ColorTable {
    type Root = Gif;
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
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Gif_ColorTableEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Gif_ColorTable {
}
impl Gif_ColorTable {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Gif_ColorTableEntry>>> {
        self.entries.borrow()
    }
}
impl Gif_ColorTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gif_ColorTableEntry {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<Gif_ColorTable>,
    pub _self: SharedType<Self>,
    red: RefCell<u8>,
    green: RefCell<u8>,
    blue: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gif_ColorTableEntry {
    type Root = Gif;
    type Parent = Gif_ColorTable;

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
        *self_rc.red.borrow_mut() = _io.read_u1()?.into();
        *self_rc.green.borrow_mut() = _io.read_u1()?.into();
        *self_rc.blue.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Gif_ColorTableEntry {
}
impl Gif_ColorTableEntry {
    pub fn red(&self) -> Ref<'_, u8> {
        self.red.borrow()
    }
}
impl Gif_ColorTableEntry {
    pub fn green(&self) -> Ref<'_, u8> {
        self.green.borrow()
    }
}
impl Gif_ColorTableEntry {
    pub fn blue(&self) -> Ref<'_, u8> {
        self.blue.borrow()
    }
}
impl Gif_ColorTableEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gif_ExtApplication {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<Gif_Extension>,
    pub _self: SharedType<Self>,
    application_id: RefCell<OptRc<Gif_ApplicationId>>,
    subblocks: RefCell<Vec<OptRc<Gif_Subblock>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gif_ExtApplication {
    type Root = Gif;
    type Parent = Gif_Extension;

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
        let t = Self::read_into::<_, Gif_ApplicationId>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.application_id.borrow_mut() = t;
        *self_rc.subblocks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Gif_Subblock>(&*_io, Some(self_rc._root.clone()), None)?.into();
                self_rc.subblocks.borrow_mut().push(t);
                let _t_subblocks = self_rc.subblocks.borrow();
                let _tmpa = _t_subblocks.last().unwrap();
                _i += 1;
                let x = !(((*_tmpa.len_bytes() as u8) == (0 as u8)));
                x
            } {}
        }
        Ok(())
    }
}
impl Gif_ExtApplication {
}
impl Gif_ExtApplication {
    pub fn application_id(&self) -> Ref<'_, OptRc<Gif_ApplicationId>> {
        self.application_id.borrow()
    }
}
impl Gif_ExtApplication {
    pub fn subblocks(&self) -> Ref<'_, Vec<OptRc<Gif_Subblock>>> {
        self.subblocks.borrow()
    }
}
impl Gif_ExtApplication {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 23
 */

#[derive(Default, Debug, Clone)]
pub struct Gif_ExtGraphicControl {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<Gif_Extension>,
    pub _self: SharedType<Self>,
    block_size: RefCell<Vec<u8>>,
    flags: RefCell<u8>,
    delay_time: RefCell<u16>,
    transparent_idx: RefCell<u8>,
    terminator: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_transparent_color_flag: Cell<bool>,
    transparent_color_flag: RefCell<bool>,
    f_user_input_flag: Cell<bool>,
    user_input_flag: RefCell<bool>,
}
impl KStruct for Gif_ExtGraphicControl {
    type Root = Gif;
    type Parent = Gif_Extension;

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
        *self_rc.block_size.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.block_size() == vec![0x4u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/ext_graphic_control/seq/0".to_string() }));
        }
        *self_rc.flags.borrow_mut() = _io.read_u1()?.into();
        *self_rc.delay_time.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.transparent_idx.borrow_mut() = _io.read_u1()?.into();
        *self_rc.terminator.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.terminator() == vec![0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/ext_graphic_control/seq/4".to_string() }));
        }
        Ok(())
    }
}
impl Gif_ExtGraphicControl {
    pub fn transparent_color_flag(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_transparent_color_flag.get() {
            return Ok(self.transparent_color_flag.borrow());
        }
        self.f_transparent_color_flag.set(true);
        *self.transparent_color_flag.borrow_mut() = (((((*self.flags() as u8) & (1 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.transparent_color_flag.borrow())
    }
    pub fn user_input_flag(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_user_input_flag.get() {
            return Ok(self.user_input_flag.borrow());
        }
        self.f_user_input_flag.set(true);
        *self.user_input_flag.borrow_mut() = (((((*self.flags() as u8) & (2 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.user_input_flag.borrow())
    }
}
impl Gif_ExtGraphicControl {
    pub fn block_size(&self) -> Ref<'_, Vec<u8>> {
        self.block_size.borrow()
    }
}
impl Gif_ExtGraphicControl {
    pub fn flags(&self) -> Ref<'_, u8> {
        self.flags.borrow()
    }
}
impl Gif_ExtGraphicControl {
    pub fn delay_time(&self) -> Ref<'_, u16> {
        self.delay_time.borrow()
    }
}
impl Gif_ExtGraphicControl {
    pub fn transparent_idx(&self) -> Ref<'_, u8> {
        self.transparent_idx.borrow()
    }
}
impl Gif_ExtGraphicControl {
    pub fn terminator(&self) -> Ref<'_, Vec<u8>> {
        self.terminator.borrow()
    }
}
impl Gif_ExtGraphicControl {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gif_Extension {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<Gif_Block>,
    pub _self: SharedType<Self>,
    label: RefCell<Gif_ExtensionLabel>,
    body: RefCell<Option<Gif_Extension_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Gif_Extension_Body {
    Gif_ExtApplication(OptRc<Gif_ExtApplication>),
    Gif_Subblocks(OptRc<Gif_Subblocks>),
    Gif_ExtGraphicControl(OptRc<Gif_ExtGraphicControl>),
}
impl From<&Gif_Extension_Body> for OptRc<Gif_ExtApplication> {
    fn from(v: &Gif_Extension_Body) -> Self {
        if let Gif_Extension_Body::Gif_ExtApplication(x) = v {
            return x.clone();
        }
        panic!("expected Gif_Extension_Body::Gif_ExtApplication, got {:?}", v)
    }
}
impl From<OptRc<Gif_ExtApplication>> for Gif_Extension_Body {
    fn from(v: OptRc<Gif_ExtApplication>) -> Self {
        Self::Gif_ExtApplication(v)
    }
}
impl From<&Gif_Extension_Body> for OptRc<Gif_Subblocks> {
    fn from(v: &Gif_Extension_Body) -> Self {
        if let Gif_Extension_Body::Gif_Subblocks(x) = v {
            return x.clone();
        }
        panic!("expected Gif_Extension_Body::Gif_Subblocks, got {:?}", v)
    }
}
impl From<OptRc<Gif_Subblocks>> for Gif_Extension_Body {
    fn from(v: OptRc<Gif_Subblocks>) -> Self {
        Self::Gif_Subblocks(v)
    }
}
impl From<&Gif_Extension_Body> for OptRc<Gif_ExtGraphicControl> {
    fn from(v: &Gif_Extension_Body) -> Self {
        if let Gif_Extension_Body::Gif_ExtGraphicControl(x) = v {
            return x.clone();
        }
        panic!("expected Gif_Extension_Body::Gif_ExtGraphicControl, got {:?}", v)
    }
}
impl From<OptRc<Gif_ExtGraphicControl>> for Gif_Extension_Body {
    fn from(v: OptRc<Gif_ExtGraphicControl>) -> Self {
        Self::Gif_ExtGraphicControl(v)
    }
}
impl KStruct for Gif_Extension {
    type Root = Gif;
    type Parent = Gif_Block;

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
        *self_rc.label.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        match *self_rc.label() {
            Gif_ExtensionLabel::Application => {
                let t = Self::read_into::<_, Gif_ExtApplication>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Gif_ExtensionLabel::Comment => {
                let t = Self::read_into::<_, Gif_Subblocks>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Gif_ExtensionLabel::GraphicControl => {
                let t = Self::read_into::<_, Gif_ExtGraphicControl>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                let t = Self::read_into::<_, Gif_Subblocks>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
        }
        Ok(())
    }
}
impl Gif_Extension {
}
impl Gif_Extension {
    pub fn label(&self) -> Ref<'_, Gif_ExtensionLabel> {
        self.label.borrow()
    }
}
impl Gif_Extension {
    pub fn body(&self) -> Ref<'_, Option<Gif_Extension_Body>> {
        self.body.borrow()
    }
}
impl Gif_Extension {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 17
 */

#[derive(Default, Debug, Clone)]
pub struct Gif_Header {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<Gif>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gif_Header {
    type Root = Gif;
    type Parent = Gif;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        if !(*self_rc.magic() == vec![0x47u8, 0x49u8, 0x46u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "ASCII")?;
        Ok(())
    }
}
impl Gif_Header {
}
impl Gif_Header {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Gif_Header {
    pub fn version(&self) -> Ref<'_, String> {
        self.version.borrow()
    }
}
impl Gif_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 22
 */

#[derive(Default, Debug, Clone)]
pub struct Gif_ImageData {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<Gif_LocalImageDescriptor>,
    pub _self: SharedType<Self>,
    lzw_min_code_size: RefCell<u8>,
    subblocks: RefCell<OptRc<Gif_Subblocks>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gif_ImageData {
    type Root = Gif;
    type Parent = Gif_LocalImageDescriptor;

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
        *self_rc.lzw_min_code_size.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, Gif_Subblocks>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.subblocks.borrow_mut() = t;
        Ok(())
    }
}
impl Gif_ImageData {
}
impl Gif_ImageData {
    pub fn lzw_min_code_size(&self) -> Ref<'_, u8> {
        self.lzw_min_code_size.borrow()
    }
}
impl Gif_ImageData {
    pub fn subblocks(&self) -> Ref<'_, OptRc<Gif_Subblocks>> {
        self.subblocks.borrow()
    }
}
impl Gif_ImageData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gif_LocalImageDescriptor {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<Gif_Block>,
    pub _self: SharedType<Self>,
    left: RefCell<u16>,
    top: RefCell<u16>,
    width: RefCell<u16>,
    height: RefCell<u16>,
    flags: RefCell<u8>,
    local_color_table: RefCell<OptRc<Gif_ColorTable>>,
    image_data: RefCell<OptRc<Gif_ImageData>>,
    _io: RefCell<BytesReader>,
    local_color_table_raw: RefCell<Vec<u8>>,
    f_color_table_size: Cell<bool>,
    color_table_size: RefCell<i32>,
    f_has_color_table: Cell<bool>,
    has_color_table: RefCell<bool>,
    f_has_interlace: Cell<bool>,
    has_interlace: RefCell<bool>,
    f_has_sorted_color_table: Cell<bool>,
    has_sorted_color_table: RefCell<bool>,
}
impl KStruct for Gif_LocalImageDescriptor {
    type Root = Gif;
    type Parent = Gif_Block;

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
        *self_rc.left.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.top.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.width.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.height.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u1()?.into();
        if *self_rc.has_color_table()? {
            *self_rc.local_color_table_raw.borrow_mut() = _io.read_bytes(((*self_rc.color_table_size()? as i32) * (3 as i32)) as usize)?.into();
            let local_color_table_raw = self_rc.local_color_table_raw.borrow();
            let _t_local_color_table_raw_io = BytesReader::from(local_color_table_raw.clone());
            let t = Self::read_into::<BytesReader, Gif_ColorTable>(&_t_local_color_table_raw_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.local_color_table.borrow_mut() = t;
        }
        let t = Self::read_into::<_, Gif_ImageData>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.image_data.borrow_mut() = t;
        Ok(())
    }
}
impl Gif_LocalImageDescriptor {
    pub fn color_table_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_color_table_size.get() {
            return Ok(self.color_table_size.borrow());
        }
        self.f_color_table_size.set(true);
        *self.color_table_size.borrow_mut() = (((2 as i32) << (((*self.flags() as u8) & (7 as u8)) as i32))) as i32;
        Ok(self.color_table_size.borrow())
    }
    pub fn has_color_table(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_color_table.get() {
            return Ok(self.has_color_table.borrow());
        }
        self.f_has_color_table.set(true);
        *self.has_color_table.borrow_mut() = (((((*self.flags() as u8) & (128 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.has_color_table.borrow())
    }
    pub fn has_interlace(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_interlace.get() {
            return Ok(self.has_interlace.borrow());
        }
        self.f_has_interlace.set(true);
        *self.has_interlace.borrow_mut() = (((((*self.flags() as u8) & (64 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.has_interlace.borrow())
    }
    pub fn has_sorted_color_table(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_sorted_color_table.get() {
            return Ok(self.has_sorted_color_table.borrow());
        }
        self.f_has_sorted_color_table.set(true);
        *self.has_sorted_color_table.borrow_mut() = (((((*self.flags() as u8) & (32 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.has_sorted_color_table.borrow())
    }
}
impl Gif_LocalImageDescriptor {
    pub fn left(&self) -> Ref<'_, u16> {
        self.left.borrow()
    }
}
impl Gif_LocalImageDescriptor {
    pub fn top(&self) -> Ref<'_, u16> {
        self.top.borrow()
    }
}
impl Gif_LocalImageDescriptor {
    pub fn width(&self) -> Ref<'_, u16> {
        self.width.borrow()
    }
}
impl Gif_LocalImageDescriptor {
    pub fn height(&self) -> Ref<'_, u16> {
        self.height.borrow()
    }
}
impl Gif_LocalImageDescriptor {
    pub fn flags(&self) -> Ref<'_, u8> {
        self.flags.borrow()
    }
}
impl Gif_LocalImageDescriptor {
    pub fn local_color_table(&self) -> Ref<'_, OptRc<Gif_ColorTable>> {
        self.local_color_table.borrow()
    }
}
impl Gif_LocalImageDescriptor {
    pub fn image_data(&self) -> Ref<'_, OptRc<Gif_ImageData>> {
        self.image_data.borrow()
    }
}
impl Gif_LocalImageDescriptor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Gif_LocalImageDescriptor {
    pub fn local_color_table_raw(&self) -> Ref<'_, Vec<u8>> {
        self.local_color_table_raw.borrow()
    }
}

/**
 * \sa https://www.w3.org/Graphics/GIF/spec-gif89a.txt - section 18
 */

#[derive(Default, Debug, Clone)]
pub struct Gif_LogicalScreenDescriptorStruct {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<Gif>,
    pub _self: SharedType<Self>,
    screen_width: RefCell<u16>,
    screen_height: RefCell<u16>,
    flags: RefCell<u8>,
    bg_color_index: RefCell<u8>,
    pixel_aspect_ratio: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_color_table_size: Cell<bool>,
    color_table_size: RefCell<i32>,
    f_has_color_table: Cell<bool>,
    has_color_table: RefCell<bool>,
}
impl KStruct for Gif_LogicalScreenDescriptorStruct {
    type Root = Gif;
    type Parent = Gif;

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
        *self_rc.screen_width.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.screen_height.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u1()?.into();
        *self_rc.bg_color_index.borrow_mut() = _io.read_u1()?.into();
        *self_rc.pixel_aspect_ratio.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Gif_LogicalScreenDescriptorStruct {
    pub fn color_table_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_color_table_size.get() {
            return Ok(self.color_table_size.borrow());
        }
        self.f_color_table_size.set(true);
        *self.color_table_size.borrow_mut() = (((2 as i32) << (((*self.flags() as u8) & (7 as u8)) as i32))) as i32;
        Ok(self.color_table_size.borrow())
    }
    pub fn has_color_table(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_color_table.get() {
            return Ok(self.has_color_table.borrow());
        }
        self.f_has_color_table.set(true);
        *self.has_color_table.borrow_mut() = (((((*self.flags() as u8) & (128 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.has_color_table.borrow())
    }
}
impl Gif_LogicalScreenDescriptorStruct {
    pub fn screen_width(&self) -> Ref<'_, u16> {
        self.screen_width.borrow()
    }
}
impl Gif_LogicalScreenDescriptorStruct {
    pub fn screen_height(&self) -> Ref<'_, u16> {
        self.screen_height.borrow()
    }
}
impl Gif_LogicalScreenDescriptorStruct {
    pub fn flags(&self) -> Ref<'_, u8> {
        self.flags.borrow()
    }
}
impl Gif_LogicalScreenDescriptorStruct {
    pub fn bg_color_index(&self) -> Ref<'_, u8> {
        self.bg_color_index.borrow()
    }
}
impl Gif_LogicalScreenDescriptorStruct {
    pub fn pixel_aspect_ratio(&self) -> Ref<'_, u8> {
        self.pixel_aspect_ratio.borrow()
    }
}
impl Gif_LogicalScreenDescriptorStruct {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gif_Subblock {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    len_bytes: RefCell<u8>,
    bytes: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gif_Subblock {
    type Root = Gif;
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
        *self_rc.len_bytes.borrow_mut() = _io.read_u1()?.into();
        *self_rc.bytes.borrow_mut() = _io.read_bytes(*self_rc.len_bytes() as usize)?.into();
        Ok(())
    }
}
impl Gif_Subblock {
}
impl Gif_Subblock {
    pub fn len_bytes(&self) -> Ref<'_, u8> {
        self.len_bytes.borrow()
    }
}
impl Gif_Subblock {
    pub fn bytes(&self) -> Ref<'_, Vec<u8>> {
        self.bytes.borrow()
    }
}
impl Gif_Subblock {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gif_Subblocks {
    pub _root: SharedType<Gif>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Gif_Subblock>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Gif_Subblocks {
    type Root = Gif;
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
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Gif_Subblock>(&*_io, Some(self_rc._root.clone()), None)?.into();
                self_rc.entries.borrow_mut().push(t);
                let _t_entries = self_rc.entries.borrow();
                let _tmpa = _t_entries.last().unwrap();
                _i += 1;
                let x = !(((*_tmpa.len_bytes() as u8) == (0 as u8)));
                x
            } {}
        }
        Ok(())
    }
}
impl Gif_Subblocks {
}
impl Gif_Subblocks {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Gif_Subblock>>> {
        self.entries.borrow()
    }
}
impl Gif_Subblocks {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
