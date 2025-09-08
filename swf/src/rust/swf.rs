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
 * SWF files are used by Adobe Flash (AKA Shockwave Flash, Macromedia
 * Flash) to encode rich interactive multimedia content and are,
 * essentially, a container for special bytecode instructions to play
 * back that content. In early 2000s, it was dominant rich multimedia
 * web format (.swf files were integrated into web pages and played
 * back with a browser plugin), but its usage largely declined in
 * 2010s, as HTML5 and performant browser-native solutions
 * (i.e. JavaScript engines and graphical approaches, such as WebGL)
 * emerged.
 * 
 * There are a lot of versions of SWF (~36), format is somewhat
 * documented by Adobe.
 * \sa https://open-flash.github.io/mirrors/swf-spec-19.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct Swf {
    pub _root: SharedType<Swf>,
    pub _parent: SharedType<Swf>,
    pub _self: SharedType<Self>,
    compression: RefCell<Swf_Compressions>,
    signature: RefCell<Vec<u8>>,
    version: RefCell<u8>,
    len_file: RefCell<u32>,
    plain_body: RefCell<OptRc<Swf_SwfBody>>,
    zlib_body: RefCell<OptRc<Swf_SwfBody>>,
    _io: RefCell<BytesReader>,
    plain_body_raw: RefCell<Vec<u8>>,
    zlib_body_raw: RefCell<Vec<u8>>,
    zlib_body_raw_raw: RefCell<Vec<u8>>,
}
impl KStruct for Swf {
    type Root = Swf;
    type Parent = Swf;

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
        *self_rc.compression.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.signature.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.signature() == vec![0x57u8, 0x53u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/1".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.len_file.borrow_mut() = _io.read_u4le()?.into();
        if *self_rc.compression() == Swf_Compressions::None {
            *self_rc.plain_body_raw.borrow_mut() = _io.read_bytes_full()?.into();
            let plain_body_raw = self_rc.plain_body_raw.borrow();
            let _t_plain_body_raw_io = BytesReader::from(plain_body_raw.clone());
            let t = Self::read_into::<BytesReader, Swf_SwfBody>(&_t_plain_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.plain_body.borrow_mut() = t;
        }
        if *self_rc.compression() == Swf_Compressions::Zlib {
            *self_rc.zlib_body_raw_raw.borrow_mut() = _io.read_bytes_full()?.into();
            *self_rc.zlib_body_raw.borrow_mut() = process_zlib(&self_rc.zlib_body_raw_raw.borrow()).map_err(|msg| KError::BytesDecodingError { msg })?;
            let zlib_body_raw = self_rc.zlib_body_raw.borrow();
            let _t_zlib_body_raw_io = BytesReader::from(zlib_body_raw.clone());
            let t = Self::read_into::<BytesReader, Swf_SwfBody>(&_t_zlib_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.zlib_body.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Swf {
}
impl Swf {
    pub fn compression(&self) -> Ref<'_, Swf_Compressions> {
        self.compression.borrow()
    }
}
impl Swf {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}
impl Swf {
    pub fn version(&self) -> Ref<'_, u8> {
        self.version.borrow()
    }
}
impl Swf {
    pub fn len_file(&self) -> Ref<'_, u32> {
        self.len_file.borrow()
    }
}
impl Swf {
    pub fn plain_body(&self) -> Ref<'_, OptRc<Swf_SwfBody>> {
        self.plain_body.borrow()
    }
}
impl Swf {
    pub fn zlib_body(&self) -> Ref<'_, OptRc<Swf_SwfBody>> {
        self.zlib_body.borrow()
    }
}
impl Swf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Swf {
    pub fn plain_body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.plain_body_raw.borrow()
    }
}
impl Swf {
    pub fn zlib_body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.zlib_body_raw.borrow()
    }
}
impl Swf {
    pub fn zlib_body_raw_raw(&self) -> Ref<'_, Vec<u8>> {
        self.zlib_body_raw_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Swf_Compressions {
    Zlib,
    None,
    Lzma,
    Unknown(i64),
}

impl TryFrom<i64> for Swf_Compressions {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Swf_Compressions> {
        match flag {
            67 => Ok(Swf_Compressions::Zlib),
            70 => Ok(Swf_Compressions::None),
            90 => Ok(Swf_Compressions::Lzma),
            _ => Ok(Swf_Compressions::Unknown(flag)),
        }
    }
}

impl From<&Swf_Compressions> for i64 {
    fn from(v: &Swf_Compressions) -> Self {
        match *v {
            Swf_Compressions::Zlib => 67,
            Swf_Compressions::None => 70,
            Swf_Compressions::Lzma => 90,
            Swf_Compressions::Unknown(v) => v
        }
    }
}

impl Default for Swf_Compressions {
    fn default() -> Self { Swf_Compressions::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Swf_TagType {
    EndOfFile,
    PlaceObject,
    RemoveObject,
    SetBackgroundColor,
    DefineSound,
    PlaceObject2,
    RemoveObject2,
    FrameLabel,
    ExportAssets,
    ScriptLimits,
    FileAttributes,
    PlaceObject3,
    SymbolClass,
    Metadata,
    DefineScalingGrid,
    DoAbc,
    DefineSceneAndFrameLabelData,
    Unknown(i64),
}

impl TryFrom<i64> for Swf_TagType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Swf_TagType> {
        match flag {
            0 => Ok(Swf_TagType::EndOfFile),
            4 => Ok(Swf_TagType::PlaceObject),
            5 => Ok(Swf_TagType::RemoveObject),
            9 => Ok(Swf_TagType::SetBackgroundColor),
            14 => Ok(Swf_TagType::DefineSound),
            26 => Ok(Swf_TagType::PlaceObject2),
            28 => Ok(Swf_TagType::RemoveObject2),
            43 => Ok(Swf_TagType::FrameLabel),
            56 => Ok(Swf_TagType::ExportAssets),
            65 => Ok(Swf_TagType::ScriptLimits),
            69 => Ok(Swf_TagType::FileAttributes),
            70 => Ok(Swf_TagType::PlaceObject3),
            76 => Ok(Swf_TagType::SymbolClass),
            77 => Ok(Swf_TagType::Metadata),
            78 => Ok(Swf_TagType::DefineScalingGrid),
            82 => Ok(Swf_TagType::DoAbc),
            86 => Ok(Swf_TagType::DefineSceneAndFrameLabelData),
            _ => Ok(Swf_TagType::Unknown(flag)),
        }
    }
}

impl From<&Swf_TagType> for i64 {
    fn from(v: &Swf_TagType) -> Self {
        match *v {
            Swf_TagType::EndOfFile => 0,
            Swf_TagType::PlaceObject => 4,
            Swf_TagType::RemoveObject => 5,
            Swf_TagType::SetBackgroundColor => 9,
            Swf_TagType::DefineSound => 14,
            Swf_TagType::PlaceObject2 => 26,
            Swf_TagType::RemoveObject2 => 28,
            Swf_TagType::FrameLabel => 43,
            Swf_TagType::ExportAssets => 56,
            Swf_TagType::ScriptLimits => 65,
            Swf_TagType::FileAttributes => 69,
            Swf_TagType::PlaceObject3 => 70,
            Swf_TagType::SymbolClass => 76,
            Swf_TagType::Metadata => 77,
            Swf_TagType::DefineScalingGrid => 78,
            Swf_TagType::DoAbc => 82,
            Swf_TagType::DefineSceneAndFrameLabelData => 86,
            Swf_TagType::Unknown(v) => v
        }
    }
}

impl Default for Swf_TagType {
    fn default() -> Self { Swf_TagType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Swf_DefineSoundBody {
    pub _root: SharedType<Swf>,
    pub _parent: SharedType<Swf_Tag>,
    pub _self: SharedType<Self>,
    id: RefCell<u16>,
    format: RefCell<u64>,
    sampling_rate: RefCell<Swf_DefineSoundBody_SamplingRates>,
    bits_per_sample: RefCell<Swf_DefineSoundBody_Bps>,
    num_channels: RefCell<Swf_DefineSoundBody_Channels>,
    num_samples: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Swf_DefineSoundBody {
    type Root = Swf;
    type Parent = Swf_Tag;

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
        *self_rc.format.borrow_mut() = _io.read_bits_int_be(4)?;
        *self_rc.sampling_rate.borrow_mut() = (_io.read_bits_int_be(2)? as i64).try_into()?;
        *self_rc.bits_per_sample.borrow_mut() = (_io.read_bits_int_be(1)? as i64).try_into()?;
        *self_rc.num_channels.borrow_mut() = (_io.read_bits_int_be(1)? as i64).try_into()?;
        _io.align_to_byte()?;
        *self_rc.num_samples.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Swf_DefineSoundBody {
}
impl Swf_DefineSoundBody {
    pub fn id(&self) -> Ref<'_, u16> {
        self.id.borrow()
    }
}
impl Swf_DefineSoundBody {
    pub fn format(&self) -> Ref<'_, u64> {
        self.format.borrow()
    }
}

/**
 * Sound sampling rate, as per enum. Ignored for Nellymoser and Speex codecs.
 */
impl Swf_DefineSoundBody {
    pub fn sampling_rate(&self) -> Ref<'_, Swf_DefineSoundBody_SamplingRates> {
        self.sampling_rate.borrow()
    }
}
impl Swf_DefineSoundBody {
    pub fn bits_per_sample(&self) -> Ref<'_, Swf_DefineSoundBody_Bps> {
        self.bits_per_sample.borrow()
    }
}
impl Swf_DefineSoundBody {
    pub fn num_channels(&self) -> Ref<'_, Swf_DefineSoundBody_Channels> {
        self.num_channels.borrow()
    }
}
impl Swf_DefineSoundBody {
    pub fn num_samples(&self) -> Ref<'_, u32> {
        self.num_samples.borrow()
    }
}
impl Swf_DefineSoundBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Swf_DefineSoundBody_Bps {
    Sound8Bit,
    Sound16Bit,
    Unknown(i64),
}

impl TryFrom<i64> for Swf_DefineSoundBody_Bps {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Swf_DefineSoundBody_Bps> {
        match flag {
            0 => Ok(Swf_DefineSoundBody_Bps::Sound8Bit),
            1 => Ok(Swf_DefineSoundBody_Bps::Sound16Bit),
            _ => Ok(Swf_DefineSoundBody_Bps::Unknown(flag)),
        }
    }
}

impl From<&Swf_DefineSoundBody_Bps> for i64 {
    fn from(v: &Swf_DefineSoundBody_Bps) -> Self {
        match *v {
            Swf_DefineSoundBody_Bps::Sound8Bit => 0,
            Swf_DefineSoundBody_Bps::Sound16Bit => 1,
            Swf_DefineSoundBody_Bps::Unknown(v) => v
        }
    }
}

impl Default for Swf_DefineSoundBody_Bps {
    fn default() -> Self { Swf_DefineSoundBody_Bps::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Swf_DefineSoundBody_Channels {
    Mono,
    Stereo,
    Unknown(i64),
}

impl TryFrom<i64> for Swf_DefineSoundBody_Channels {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Swf_DefineSoundBody_Channels> {
        match flag {
            0 => Ok(Swf_DefineSoundBody_Channels::Mono),
            1 => Ok(Swf_DefineSoundBody_Channels::Stereo),
            _ => Ok(Swf_DefineSoundBody_Channels::Unknown(flag)),
        }
    }
}

impl From<&Swf_DefineSoundBody_Channels> for i64 {
    fn from(v: &Swf_DefineSoundBody_Channels) -> Self {
        match *v {
            Swf_DefineSoundBody_Channels::Mono => 0,
            Swf_DefineSoundBody_Channels::Stereo => 1,
            Swf_DefineSoundBody_Channels::Unknown(v) => v
        }
    }
}

impl Default for Swf_DefineSoundBody_Channels {
    fn default() -> Self { Swf_DefineSoundBody_Channels::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Swf_DefineSoundBody_SamplingRates {
    Rate55Khz,
    Rate11Khz,
    Rate22Khz,
    Rate44Khz,
    Unknown(i64),
}

impl TryFrom<i64> for Swf_DefineSoundBody_SamplingRates {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Swf_DefineSoundBody_SamplingRates> {
        match flag {
            0 => Ok(Swf_DefineSoundBody_SamplingRates::Rate55Khz),
            1 => Ok(Swf_DefineSoundBody_SamplingRates::Rate11Khz),
            2 => Ok(Swf_DefineSoundBody_SamplingRates::Rate22Khz),
            3 => Ok(Swf_DefineSoundBody_SamplingRates::Rate44Khz),
            _ => Ok(Swf_DefineSoundBody_SamplingRates::Unknown(flag)),
        }
    }
}

impl From<&Swf_DefineSoundBody_SamplingRates> for i64 {
    fn from(v: &Swf_DefineSoundBody_SamplingRates) -> Self {
        match *v {
            Swf_DefineSoundBody_SamplingRates::Rate55Khz => 0,
            Swf_DefineSoundBody_SamplingRates::Rate11Khz => 1,
            Swf_DefineSoundBody_SamplingRates::Rate22Khz => 2,
            Swf_DefineSoundBody_SamplingRates::Rate44Khz => 3,
            Swf_DefineSoundBody_SamplingRates::Unknown(v) => v
        }
    }
}

impl Default for Swf_DefineSoundBody_SamplingRates {
    fn default() -> Self { Swf_DefineSoundBody_SamplingRates::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Swf_DoAbcBody {
    pub _root: SharedType<Swf>,
    pub _parent: SharedType<Swf_Tag>,
    pub _self: SharedType<Self>,
    flags: RefCell<u32>,
    name: RefCell<String>,
    abcdata: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Swf_DoAbcBody {
    type Root = Swf;
    type Parent = Swf_Tag;

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
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        *self_rc.abcdata.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Swf_DoAbcBody {
}
impl Swf_DoAbcBody {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl Swf_DoAbcBody {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Swf_DoAbcBody {
    pub fn abcdata(&self) -> Ref<'_, Vec<u8>> {
        self.abcdata.borrow()
    }
}
impl Swf_DoAbcBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Swf_RecordHeader {
    pub _root: SharedType<Swf>,
    pub _parent: SharedType<Swf_Tag>,
    pub _self: SharedType<Self>,
    tag_code_and_length: RefCell<u16>,
    big_len: RefCell<i32>,
    _io: RefCell<BytesReader>,
    f_len: Cell<bool>,
    len: RefCell<i32>,
    f_small_len: Cell<bool>,
    small_len: RefCell<i32>,
    f_tag_type: Cell<bool>,
    tag_type: RefCell<Swf_TagType>,
}
impl KStruct for Swf_RecordHeader {
    type Root = Swf;
    type Parent = Swf_Tag;

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
        *self_rc.tag_code_and_length.borrow_mut() = _io.read_u2le()?.into();
        if ((*self_rc.small_len()? as i32) == (63 as i32)) {
            *self_rc.big_len.borrow_mut() = _io.read_s4le()?.into();
        }
        Ok(())
    }
}
impl Swf_RecordHeader {
    pub fn len(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len.get() {
            return Ok(self.len.borrow());
        }
        self.f_len.set(true);
        *self.len.borrow_mut() = (if ((*self.small_len()? as i32) == (63 as i32)) { *self.big_len() } else { *self.small_len()? }) as i32;
        Ok(self.len.borrow())
    }
    pub fn small_len(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_small_len.get() {
            return Ok(self.small_len.borrow());
        }
        self.f_small_len.set(true);
        *self.small_len.borrow_mut() = (((*self.tag_code_and_length() as u16) & (63 as u16))) as i32;
        Ok(self.small_len.borrow())
    }
    pub fn tag_type(
        &self
    ) -> KResult<Ref<'_, Swf_TagType>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tag_type.get() {
            return Ok(self.tag_type.borrow());
        }
        self.f_tag_type.set(true);
        *self.tag_type.borrow_mut() = (((*self.tag_code_and_length() as u16) >> (6 as u16)) as i64).try_into()?;
        Ok(self.tag_type.borrow())
    }
}
impl Swf_RecordHeader {
    pub fn tag_code_and_length(&self) -> Ref<'_, u16> {
        self.tag_code_and_length.borrow()
    }
}
impl Swf_RecordHeader {
    pub fn big_len(&self) -> Ref<'_, i32> {
        self.big_len.borrow()
    }
}
impl Swf_RecordHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Swf_Rect {
    pub _root: SharedType<Swf>,
    pub _parent: SharedType<Swf_SwfBody>,
    pub _self: SharedType<Self>,
    b1: RefCell<u8>,
    skip: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_num_bits: Cell<bool>,
    num_bits: RefCell<i32>,
    f_num_bytes: Cell<bool>,
    num_bytes: RefCell<i32>,
}
impl KStruct for Swf_Rect {
    type Root = Swf;
    type Parent = Swf_SwfBody;

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
        *self_rc.b1.borrow_mut() = _io.read_u1()?.into();
        *self_rc.skip.borrow_mut() = _io.read_bytes(*self_rc.num_bytes()? as usize)?.into();
        Ok(())
    }
}
impl Swf_Rect {
    pub fn num_bits(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_bits.get() {
            return Ok(self.num_bits.borrow());
        }
        self.f_num_bits.set(true);
        *self.num_bits.borrow_mut() = (((*self.b1() as u8) >> (3 as u8))) as i32;
        Ok(self.num_bits.borrow())
    }
    pub fn num_bytes(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_bytes.get() {
            return Ok(self.num_bytes.borrow());
        }
        self.f_num_bytes.set(true);
        *self.num_bytes.borrow_mut() = (((((((((*self.num_bits()? as i32) * (4 as i32)) as i32) - (3 as i32)) as i32) + (7 as i32)) as i32) / (8 as i32))) as i32;
        Ok(self.num_bytes.borrow())
    }
}
impl Swf_Rect {
    pub fn b1(&self) -> Ref<'_, u8> {
        self.b1.borrow()
    }
}
impl Swf_Rect {
    pub fn skip(&self) -> Ref<'_, Vec<u8>> {
        self.skip.borrow()
    }
}
impl Swf_Rect {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Swf_Rgb {
    pub _root: SharedType<Swf>,
    pub _parent: SharedType<Swf_Tag>,
    pub _self: SharedType<Self>,
    r: RefCell<u8>,
    g: RefCell<u8>,
    b: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Swf_Rgb {
    type Root = Swf;
    type Parent = Swf_Tag;

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
        *self_rc.r.borrow_mut() = _io.read_u1()?.into();
        *self_rc.g.borrow_mut() = _io.read_u1()?.into();
        *self_rc.b.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Swf_Rgb {
}
impl Swf_Rgb {
    pub fn r(&self) -> Ref<'_, u8> {
        self.r.borrow()
    }
}
impl Swf_Rgb {
    pub fn g(&self) -> Ref<'_, u8> {
        self.g.borrow()
    }
}
impl Swf_Rgb {
    pub fn b(&self) -> Ref<'_, u8> {
        self.b.borrow()
    }
}
impl Swf_Rgb {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Swf_ScriptLimitsBody {
    pub _root: SharedType<Swf>,
    pub _parent: SharedType<Swf_Tag>,
    pub _self: SharedType<Self>,
    max_recursion_depth: RefCell<u16>,
    script_timeout_seconds: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Swf_ScriptLimitsBody {
    type Root = Swf;
    type Parent = Swf_Tag;

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
        *self_rc.max_recursion_depth.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.script_timeout_seconds.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Swf_ScriptLimitsBody {
}
impl Swf_ScriptLimitsBody {
    pub fn max_recursion_depth(&self) -> Ref<'_, u16> {
        self.max_recursion_depth.borrow()
    }
}
impl Swf_ScriptLimitsBody {
    pub fn script_timeout_seconds(&self) -> Ref<'_, u16> {
        self.script_timeout_seconds.borrow()
    }
}
impl Swf_ScriptLimitsBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Swf_SwfBody {
    pub _root: SharedType<Swf>,
    pub _parent: SharedType<Swf>,
    pub _self: SharedType<Self>,
    rect: RefCell<OptRc<Swf_Rect>>,
    frame_rate: RefCell<u16>,
    frame_count: RefCell<u16>,
    file_attributes_tag: RefCell<OptRc<Swf_Tag>>,
    tags: RefCell<Vec<OptRc<Swf_Tag>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Swf_SwfBody {
    type Root = Swf;
    type Parent = Swf;

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
        let t = Self::read_into::<_, Swf_Rect>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.rect.borrow_mut() = t;
        *self_rc.frame_rate.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.frame_count.borrow_mut() = _io.read_u2le()?.into();
        if ((*_r.version() as u8) >= (8 as u8)) {
            let t = Self::read_into::<_, Swf_Tag>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.file_attributes_tag.borrow_mut() = t;
        }
        *self_rc.tags.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Swf_Tag>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.tags.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Swf_SwfBody {
}
impl Swf_SwfBody {
    pub fn rect(&self) -> Ref<'_, OptRc<Swf_Rect>> {
        self.rect.borrow()
    }
}
impl Swf_SwfBody {
    pub fn frame_rate(&self) -> Ref<'_, u16> {
        self.frame_rate.borrow()
    }
}
impl Swf_SwfBody {
    pub fn frame_count(&self) -> Ref<'_, u16> {
        self.frame_count.borrow()
    }
}
impl Swf_SwfBody {
    pub fn file_attributes_tag(&self) -> Ref<'_, OptRc<Swf_Tag>> {
        self.file_attributes_tag.borrow()
    }
}
impl Swf_SwfBody {
    pub fn tags(&self) -> Ref<'_, Vec<OptRc<Swf_Tag>>> {
        self.tags.borrow()
    }
}
impl Swf_SwfBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Swf_SymbolClassBody {
    pub _root: SharedType<Swf>,
    pub _parent: SharedType<Swf_Tag>,
    pub _self: SharedType<Self>,
    num_symbols: RefCell<u16>,
    symbols: RefCell<Vec<OptRc<Swf_SymbolClassBody_Symbol>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Swf_SymbolClassBody {
    type Root = Swf;
    type Parent = Swf_Tag;

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
        *self_rc.num_symbols.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.symbols.borrow_mut() = Vec::new();
        let l_symbols = *self_rc.num_symbols();
        for _i in 0..l_symbols {
            let t = Self::read_into::<_, Swf_SymbolClassBody_Symbol>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.symbols.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Swf_SymbolClassBody {
}
impl Swf_SymbolClassBody {
    pub fn num_symbols(&self) -> Ref<'_, u16> {
        self.num_symbols.borrow()
    }
}
impl Swf_SymbolClassBody {
    pub fn symbols(&self) -> Ref<'_, Vec<OptRc<Swf_SymbolClassBody_Symbol>>> {
        self.symbols.borrow()
    }
}
impl Swf_SymbolClassBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Swf_SymbolClassBody_Symbol {
    pub _root: SharedType<Swf>,
    pub _parent: SharedType<Swf_SymbolClassBody>,
    pub _self: SharedType<Self>,
    tag: RefCell<u16>,
    name: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Swf_SymbolClassBody_Symbol {
    type Root = Swf;
    type Parent = Swf_SymbolClassBody;

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
        *self_rc.tag.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl Swf_SymbolClassBody_Symbol {
}
impl Swf_SymbolClassBody_Symbol {
    pub fn tag(&self) -> Ref<'_, u16> {
        self.tag.borrow()
    }
}
impl Swf_SymbolClassBody_Symbol {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Swf_SymbolClassBody_Symbol {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Swf_Tag {
    pub _root: SharedType<Swf>,
    pub _parent: SharedType<Swf_SwfBody>,
    pub _self: SharedType<Self>,
    record_header: RefCell<OptRc<Swf_RecordHeader>>,
    tag_body: RefCell<Option<Swf_Tag_TagBody>>,
    _io: RefCell<BytesReader>,
    tag_body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Swf_Tag_TagBody {
    Swf_DefineSoundBody(OptRc<Swf_DefineSoundBody>),
    Swf_SymbolClassBody(OptRc<Swf_SymbolClassBody>),
    Bytes(Vec<u8>),
    Swf_DoAbcBody(OptRc<Swf_DoAbcBody>),
    Swf_Rgb(OptRc<Swf_Rgb>),
    Swf_ScriptLimitsBody(OptRc<Swf_ScriptLimitsBody>),
}
impl From<&Swf_Tag_TagBody> for OptRc<Swf_DefineSoundBody> {
    fn from(v: &Swf_Tag_TagBody) -> Self {
        if let Swf_Tag_TagBody::Swf_DefineSoundBody(x) = v {
            return x.clone();
        }
        panic!("expected Swf_Tag_TagBody::Swf_DefineSoundBody, got {:?}", v)
    }
}
impl From<OptRc<Swf_DefineSoundBody>> for Swf_Tag_TagBody {
    fn from(v: OptRc<Swf_DefineSoundBody>) -> Self {
        Self::Swf_DefineSoundBody(v)
    }
}
impl From<&Swf_Tag_TagBody> for OptRc<Swf_SymbolClassBody> {
    fn from(v: &Swf_Tag_TagBody) -> Self {
        if let Swf_Tag_TagBody::Swf_SymbolClassBody(x) = v {
            return x.clone();
        }
        panic!("expected Swf_Tag_TagBody::Swf_SymbolClassBody, got {:?}", v)
    }
}
impl From<OptRc<Swf_SymbolClassBody>> for Swf_Tag_TagBody {
    fn from(v: OptRc<Swf_SymbolClassBody>) -> Self {
        Self::Swf_SymbolClassBody(v)
    }
}
impl From<&Swf_Tag_TagBody> for Vec<u8> {
    fn from(v: &Swf_Tag_TagBody) -> Self {
        if let Swf_Tag_TagBody::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Swf_Tag_TagBody::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Swf_Tag_TagBody {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Swf_Tag_TagBody> for OptRc<Swf_DoAbcBody> {
    fn from(v: &Swf_Tag_TagBody) -> Self {
        if let Swf_Tag_TagBody::Swf_DoAbcBody(x) = v {
            return x.clone();
        }
        panic!("expected Swf_Tag_TagBody::Swf_DoAbcBody, got {:?}", v)
    }
}
impl From<OptRc<Swf_DoAbcBody>> for Swf_Tag_TagBody {
    fn from(v: OptRc<Swf_DoAbcBody>) -> Self {
        Self::Swf_DoAbcBody(v)
    }
}
impl From<&Swf_Tag_TagBody> for OptRc<Swf_Rgb> {
    fn from(v: &Swf_Tag_TagBody) -> Self {
        if let Swf_Tag_TagBody::Swf_Rgb(x) = v {
            return x.clone();
        }
        panic!("expected Swf_Tag_TagBody::Swf_Rgb, got {:?}", v)
    }
}
impl From<OptRc<Swf_Rgb>> for Swf_Tag_TagBody {
    fn from(v: OptRc<Swf_Rgb>) -> Self {
        Self::Swf_Rgb(v)
    }
}
impl From<&Swf_Tag_TagBody> for OptRc<Swf_ScriptLimitsBody> {
    fn from(v: &Swf_Tag_TagBody) -> Self {
        if let Swf_Tag_TagBody::Swf_ScriptLimitsBody(x) = v {
            return x.clone();
        }
        panic!("expected Swf_Tag_TagBody::Swf_ScriptLimitsBody, got {:?}", v)
    }
}
impl From<OptRc<Swf_ScriptLimitsBody>> for Swf_Tag_TagBody {
    fn from(v: OptRc<Swf_ScriptLimitsBody>) -> Self {
        Self::Swf_ScriptLimitsBody(v)
    }
}
impl KStruct for Swf_Tag {
    type Root = Swf;
    type Parent = Swf_SwfBody;

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
        let t = Self::read_into::<_, Swf_RecordHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.record_header.borrow_mut() = t;
        match *self_rc.record_header().tag_type()? {
            Swf_TagType::DefineSound => {
                *self_rc.tag_body_raw.borrow_mut() = _io.read_bytes(*self_rc.record_header().len()? as usize)?.into();
                let tag_body_raw = self_rc.tag_body_raw.borrow();
                let _t_tag_body_raw_io = BytesReader::from(tag_body_raw.clone());
                let t = Self::read_into::<BytesReader, Swf_DefineSoundBody>(&_t_tag_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_body.borrow_mut() = Some(t);
            }
            Swf_TagType::DoAbc => {
                *self_rc.tag_body_raw.borrow_mut() = _io.read_bytes(*self_rc.record_header().len()? as usize)?.into();
                let tag_body_raw = self_rc.tag_body_raw.borrow();
                let _t_tag_body_raw_io = BytesReader::from(tag_body_raw.clone());
                let t = Self::read_into::<BytesReader, Swf_DoAbcBody>(&_t_tag_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_body.borrow_mut() = Some(t);
            }
            Swf_TagType::ExportAssets => {
                *self_rc.tag_body_raw.borrow_mut() = _io.read_bytes(*self_rc.record_header().len()? as usize)?.into();
                let tag_body_raw = self_rc.tag_body_raw.borrow();
                let _t_tag_body_raw_io = BytesReader::from(tag_body_raw.clone());
                let t = Self::read_into::<BytesReader, Swf_SymbolClassBody>(&_t_tag_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_body.borrow_mut() = Some(t);
            }
            Swf_TagType::ScriptLimits => {
                *self_rc.tag_body_raw.borrow_mut() = _io.read_bytes(*self_rc.record_header().len()? as usize)?.into();
                let tag_body_raw = self_rc.tag_body_raw.borrow();
                let _t_tag_body_raw_io = BytesReader::from(tag_body_raw.clone());
                let t = Self::read_into::<BytesReader, Swf_ScriptLimitsBody>(&_t_tag_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_body.borrow_mut() = Some(t);
            }
            Swf_TagType::SetBackgroundColor => {
                *self_rc.tag_body_raw.borrow_mut() = _io.read_bytes(*self_rc.record_header().len()? as usize)?.into();
                let tag_body_raw = self_rc.tag_body_raw.borrow();
                let _t_tag_body_raw_io = BytesReader::from(tag_body_raw.clone());
                let t = Self::read_into::<BytesReader, Swf_Rgb>(&_t_tag_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_body.borrow_mut() = Some(t);
            }
            Swf_TagType::SymbolClass => {
                *self_rc.tag_body_raw.borrow_mut() = _io.read_bytes(*self_rc.record_header().len()? as usize)?.into();
                let tag_body_raw = self_rc.tag_body_raw.borrow();
                let _t_tag_body_raw_io = BytesReader::from(tag_body_raw.clone());
                let t = Self::read_into::<BytesReader, Swf_SymbolClassBody>(&_t_tag_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.tag_body.borrow_mut() = Some(_io.read_bytes(*self_rc.record_header().len()? as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Swf_Tag {
}
impl Swf_Tag {
    pub fn record_header(&self) -> Ref<'_, OptRc<Swf_RecordHeader>> {
        self.record_header.borrow()
    }
}
impl Swf_Tag {
    pub fn tag_body(&self) -> Ref<'_, Option<Swf_Tag_TagBody>> {
        self.tag_body.borrow()
    }
}
impl Swf_Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Swf_Tag {
    pub fn tag_body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.tag_body_raw.borrow()
    }
}
