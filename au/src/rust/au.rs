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
 * The NeXT/Sun audio file format.
 * 
 * Sample files:
 * 
 * * <https://github.com/python/cpython/tree/b8a7daf077da/Lib/test/sndhdrdata>
 * * <ftp://ftp-ccrma.stanford.edu/pub/Lisp/sf.tar.gz>
 * * <https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/Samples.html>
 * \sa https://www.mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/AU.html Source
 * \sa http://soundfile.sapp.org/doc/NextFormat/ Source
 * \sa http://soundfile.sapp.org/doc/NextFormat/soundstruct.h Source
 * \sa https://github.com/andreiw/polaris/blob/deb47cb/usr/src/head/audio/au.h#L87-L112 Source
 * \sa https://github.com/libsndfile/libsndfile/blob/86c9f9eb/src/au.c#L39-L74 Source
 * \sa https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L34-L49 Source
 * \sa https://github.com/mpruett/audiofile/blob/b62c902/libaudiofile/NeXT.cpp#L65-L96 Source
 */

#[derive(Default, Debug, Clone)]
pub struct Au {
    pub _root: SharedType<Au>,
    pub _parent: SharedType<Au>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    ofs_data: RefCell<u32>,
    header: RefCell<OptRc<Au_Header>>,
    _io: RefCell<BytesReader>,
    header_raw: RefCell<Vec<u8>>,
    f_len_data: Cell<bool>,
    len_data: RefCell<i32>,
}
impl KStruct for Au {
    type Root = Au;
    type Parent = Au;

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
        if !(*self_rc.magic() == vec![0x2eu8, 0x73u8, 0x6eu8, 0x64u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.ofs_data.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.header_raw.borrow_mut() = _io.read_bytes(((((*self_rc.ofs_data() as i32) - (4 as i32)) as i32) - (4 as i32)) as usize)?.into();
        let header_raw = self_rc.header_raw.borrow();
        let _t_header_raw_io = BytesReader::from(header_raw.clone());
        let t = Self::read_into::<BytesReader, Au_Header>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl Au {
    pub fn len_data(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_data.get() {
            return Ok(self.len_data.borrow());
        }
        self.f_len_data.set(true);
        *self.len_data.borrow_mut() = (if ((*self.header().data_size() as i32) == (4294967295 as i32)) { ((_io.size() as i32) - (*self.ofs_data() as i32)) } else { *self.header().data_size() }) as i32;
        Ok(self.len_data.borrow())
    }
}
impl Au {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Au {
    pub fn ofs_data(&self) -> Ref<'_, u32> {
        self.ofs_data.borrow()
    }
}
impl Au {
    pub fn header(&self) -> Ref<'_, OptRc<Au_Header>> {
        self.header.borrow()
    }
}
impl Au {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Au {
    pub fn header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Au_Encodings {

    /**
     * 8-bit G.711 mu-law
     */
    Mulaw8,

    /**
     * 8-bit signed linear PCM
     */
    Linear8,

    /**
     * 16-bit signed linear PCM
     */
    Linear16,

    /**
     * 24-bit signed linear PCM
     */
    Linear24,

    /**
     * 32-bit signed linear PCM
     */
    Linear32,

    /**
     * 32-bit IEEE floating point
     */
    Float,

    /**
     * 64-bit IEEE double-precision floating point
     */
    Double,

    /**
     * sampled data which has become fragmented due to editing
     */
    Fragmented,

    /**
     * multiple sound structures
     */
    Nested,

    /**
     * a loadable DSP core program
     */
    DspCore,
    FixedPoint8,
    FixedPoint16,
    FixedPoint24,
    FixedPoint32,

    /**
     * non-audio display data used by the Sound Kit's `SoundView` class, can't be played
     */
    Display,

    /**
     * 8-bit mu-law with run-length encoding of silence
     */
    MulawSquelch,

    /**
     * 16-bit linear with emphasis
     */
    Emphasized,

    /**
     * 16-bit linear with NeXT compression
     */
    Compressed,

    /**
     * 16-bit linear with emphasis and NeXT compression
     */
    CompressedEmphasized,

    /**
     * Music Kit DSP commands
     */
    DspCommands,

    /**
     * Music Kit DSP samples
     */
    DspCommandsSamples,

    /**
     * 4-bit G.721 ADPCM (32 kb/s)
     */
    AdpcmG721,

    /**
     * G.722 ADPCM
     */
    AdpcmG722,

    /**
     * 3-bit G.723 ADPCM (24 kb/s)
     */
    AdpcmG7233,

    /**
     * 5-bit G.723 ADPCM (40 kb/s)
     */
    AdpcmG7235,

    /**
     * 8-bit G.711 A-law
     */
    Alaw8,
    Aes,
    DeltaMulaw8,
    Unknown(i64),
}

impl TryFrom<i64> for Au_Encodings {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Au_Encodings> {
        match flag {
            1 => Ok(Au_Encodings::Mulaw8),
            2 => Ok(Au_Encodings::Linear8),
            3 => Ok(Au_Encodings::Linear16),
            4 => Ok(Au_Encodings::Linear24),
            5 => Ok(Au_Encodings::Linear32),
            6 => Ok(Au_Encodings::Float),
            7 => Ok(Au_Encodings::Double),
            8 => Ok(Au_Encodings::Fragmented),
            9 => Ok(Au_Encodings::Nested),
            10 => Ok(Au_Encodings::DspCore),
            11 => Ok(Au_Encodings::FixedPoint8),
            12 => Ok(Au_Encodings::FixedPoint16),
            13 => Ok(Au_Encodings::FixedPoint24),
            14 => Ok(Au_Encodings::FixedPoint32),
            16 => Ok(Au_Encodings::Display),
            17 => Ok(Au_Encodings::MulawSquelch),
            18 => Ok(Au_Encodings::Emphasized),
            19 => Ok(Au_Encodings::Compressed),
            20 => Ok(Au_Encodings::CompressedEmphasized),
            21 => Ok(Au_Encodings::DspCommands),
            22 => Ok(Au_Encodings::DspCommandsSamples),
            23 => Ok(Au_Encodings::AdpcmG721),
            24 => Ok(Au_Encodings::AdpcmG722),
            25 => Ok(Au_Encodings::AdpcmG7233),
            26 => Ok(Au_Encodings::AdpcmG7235),
            27 => Ok(Au_Encodings::Alaw8),
            28 => Ok(Au_Encodings::Aes),
            29 => Ok(Au_Encodings::DeltaMulaw8),
            _ => Ok(Au_Encodings::Unknown(flag)),
        }
    }
}

impl From<&Au_Encodings> for i64 {
    fn from(v: &Au_Encodings) -> Self {
        match *v {
            Au_Encodings::Mulaw8 => 1,
            Au_Encodings::Linear8 => 2,
            Au_Encodings::Linear16 => 3,
            Au_Encodings::Linear24 => 4,
            Au_Encodings::Linear32 => 5,
            Au_Encodings::Float => 6,
            Au_Encodings::Double => 7,
            Au_Encodings::Fragmented => 8,
            Au_Encodings::Nested => 9,
            Au_Encodings::DspCore => 10,
            Au_Encodings::FixedPoint8 => 11,
            Au_Encodings::FixedPoint16 => 12,
            Au_Encodings::FixedPoint24 => 13,
            Au_Encodings::FixedPoint32 => 14,
            Au_Encodings::Display => 16,
            Au_Encodings::MulawSquelch => 17,
            Au_Encodings::Emphasized => 18,
            Au_Encodings::Compressed => 19,
            Au_Encodings::CompressedEmphasized => 20,
            Au_Encodings::DspCommands => 21,
            Au_Encodings::DspCommandsSamples => 22,
            Au_Encodings::AdpcmG721 => 23,
            Au_Encodings::AdpcmG722 => 24,
            Au_Encodings::AdpcmG7233 => 25,
            Au_Encodings::AdpcmG7235 => 26,
            Au_Encodings::Alaw8 => 27,
            Au_Encodings::Aes => 28,
            Au_Encodings::DeltaMulaw8 => 29,
            Au_Encodings::Unknown(v) => v
        }
    }
}

impl Default for Au_Encodings {
    fn default() -> Self { Au_Encodings::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Au_Header {
    pub _root: SharedType<Au>,
    pub _parent: SharedType<Au>,
    pub _self: SharedType<Self>,
    data_size: RefCell<u32>,
    encoding: RefCell<Au_Encodings>,
    sample_rate: RefCell<u32>,
    num_channels: RefCell<u32>,
    comment: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Au_Header {
    type Root = Au;
    type Parent = Au;

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
        *self_rc.data_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.encoding.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.sample_rate.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.num_channels.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.num_channels() as u32) >= (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/header/seq/3".to_string() }));
        }
        *self_rc.comment.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes_full()?.into(), 0, false).into(), "ASCII")?;
        Ok(())
    }
}
impl Au_Header {
}

/**
 * don't read this field, access `_root.len_data` instead
 * 
 * value `0xffff_ffff` means unspecified size
 */
impl Au_Header {
    pub fn data_size(&self) -> Ref<'_, u32> {
        self.data_size.borrow()
    }
}
impl Au_Header {
    pub fn encoding(&self) -> Ref<'_, Au_Encodings> {
        self.encoding.borrow()
    }
}
impl Au_Header {
    pub fn sample_rate(&self) -> Ref<'_, u32> {
        self.sample_rate.borrow()
    }
}

/**
 * number of interleaved channels
 */
impl Au_Header {
    pub fn num_channels(&self) -> Ref<'_, u32> {
        self.num_channels.borrow()
    }
}

/**
 * Most resources claim that this field must be at least 4 bytes long.
 * However, most programs don't enforce it, and [Audacity](
 * https://www.audacityteam.org/) even generates .au files with this field
 * being 0-byte long. According to <https://nixdoc.net/man-pages/IRIX/man4/dmedia/next.4.html>,
 * "NeXT files require that this chunk be at least 4 bytes (chars) long,
 * whereas this chunk may be zerolength in a Sun .au file."
 * 
 * By convention, size should be a multiple of 4 -
 * see <https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L132-L133>.
 * Page <http://soundfile.sapp.org/doc/NextFormat/> also mentions that for some
 * sound playing programs, this field must have an even byte size. So a multiple
 * of 4 is probably best for compatibility.
 * 
 * Must be null-terminated. It is usually an ASCII text string, but this space
 * might be also used to store application-specific binary (i.e. non-ASCII) data.
 */
impl Au_Header {
    pub fn comment(&self) -> Ref<'_, String> {
        self.comment.borrow()
    }
}
impl Au_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
