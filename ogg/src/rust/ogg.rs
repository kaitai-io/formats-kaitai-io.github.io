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
 * Ogg is a popular media container format, which provides basic
 * streaming / buffering mechanisms and is content-agnostic. Most
 * popular codecs that are used within Ogg streams are Vorbis (thus
 * making Ogg/Vorbis streams) and Theora (Ogg/Theora).
 * 
 * Ogg stream is a sequence Ogg pages. They can be read sequentially,
 * or one can jump into arbitrary stream location and scan for "OggS"
 * sync code to find the beginning of a new Ogg page and continue
 * decoding the stream contents from that one.
 */

#[derive(Default, Debug, Clone)]
pub struct Ogg {
    pub _root: SharedType<Ogg>,
    pub _parent: SharedType<Ogg>,
    pub _self: SharedType<Self>,
    pages: RefCell<Vec<OptRc<Ogg_Page>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ogg {
    type Root = Ogg;
    type Parent = Ogg;

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
        *self_rc.pages.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Ogg_Page>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.pages.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Ogg {
}
impl Ogg {
    pub fn pages(&self) -> Ref<'_, Vec<OptRc<Ogg_Page>>> {
        self.pages.borrow()
    }
}
impl Ogg {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Ogg page is a basic unit of data in an Ogg bitstream, usually
 * it's around 4-8 KB, with a maximum size of 65307 bytes.
 */

#[derive(Default, Debug, Clone)]
pub struct Ogg_Page {
    pub _root: SharedType<Ogg>,
    pub _parent: SharedType<Ogg>,
    pub _self: SharedType<Self>,
    sync_code: RefCell<Vec<u8>>,
    version: RefCell<Vec<u8>>,
    reserved1: RefCell<u64>,
    is_end_of_stream: RefCell<bool>,
    is_beginning_of_stream: RefCell<bool>,
    is_continuation: RefCell<bool>,
    granule_pos: RefCell<u64>,
    bitstream_serial: RefCell<u32>,
    page_seq_num: RefCell<u32>,
    crc32: RefCell<u32>,
    num_segments: RefCell<u8>,
    len_segments: RefCell<Vec<u8>>,
    segments: RefCell<Vec<Vec<u8>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ogg_Page {
    type Root = Ogg;
    type Parent = Ogg;

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
        *self_rc.sync_code.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.sync_code() == vec![0x4fu8, 0x67u8, 0x67u8, 0x53u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/page/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.version() == vec![0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/page/seq/1".to_string() }));
        }
        *self_rc.reserved1.borrow_mut() = _io.read_bits_int_be(5)?;
        *self_rc.is_end_of_stream.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.is_beginning_of_stream.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.is_continuation.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        _io.align_to_byte()?;
        *self_rc.granule_pos.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.bitstream_serial.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.page_seq_num.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.crc32.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_segments.borrow_mut() = _io.read_u1()?.into();
        *self_rc.len_segments.borrow_mut() = Vec::new();
        let l_len_segments = *self_rc.num_segments();
        for _i in 0..l_len_segments {
            self_rc.len_segments.borrow_mut().push(_io.read_u1()?.into());
        }
        *self_rc.segments.borrow_mut() = Vec::new();
        let l_segments = *self_rc.num_segments();
        for _i in 0..l_segments {
            self_rc.segments.borrow_mut().push(_io.read_bytes(self_rc.len_segments()[_i as usize] as usize)?.into());
        }
        Ok(())
    }
}
impl Ogg_Page {
}
impl Ogg_Page {
    pub fn sync_code(&self) -> Ref<'_, Vec<u8>> {
        self.sync_code.borrow()
    }
}

/**
 * Version of the Ogg bitstream format. Currently must be 0.
 */
impl Ogg_Page {
    pub fn version(&self) -> Ref<'_, Vec<u8>> {
        self.version.borrow()
    }
}
impl Ogg_Page {
    pub fn reserved1(&self) -> Ref<'_, u64> {
        self.reserved1.borrow()
    }
}

/**
 * EOS (End Of Stream) mark. This page is the last page in the
 * logical bitstream. The EOS flag must be set on the final page of
 * every logical bitstream, and must not be set on any other page.
 */
impl Ogg_Page {
    pub fn is_end_of_stream(&self) -> Ref<'_, bool> {
        self.is_end_of_stream.borrow()
    }
}

/**
 * BOS (Beginning Of Stream) mark. This page is the first page in
 * the logical bitstream. The BOS flag must be set on the first
 * page of every logical bitstream, and must not be set on any
 * other page.
 */
impl Ogg_Page {
    pub fn is_beginning_of_stream(&self) -> Ref<'_, bool> {
        self.is_beginning_of_stream.borrow()
    }
}

/**
 * The first packet on this page is a continuation of the previous
 * packet in the logical bitstream.
 */
impl Ogg_Page {
    pub fn is_continuation(&self) -> Ref<'_, bool> {
        self.is_continuation.borrow()
    }
}

/**
 * "Granule position" is the time marker in Ogg files. It is an
 * abstract value, whose meaning is determined by the codec. It
 * may, for example, be a count of the number of samples, the
 * number of frames or a more complex scheme.
 */
impl Ogg_Page {
    pub fn granule_pos(&self) -> Ref<'_, u64> {
        self.granule_pos.borrow()
    }
}

/**
 * Serial number that identifies a page as belonging to a
 * particular logical bitstream. Each logical bitstream in a file
 * has a unique value, and this field allows implementations to
 * deliver the pages to the appropriate decoder. In a typical
 * Vorbis and Theora file, one stream is the audio (Vorbis), and
 * the other is the video (Theora).
 */
impl Ogg_Page {
    pub fn bitstream_serial(&self) -> Ref<'_, u32> {
        self.bitstream_serial.borrow()
    }
}

/**
 * Sequential number of page, guaranteed to be monotonically
 * increasing for each logical bitstream. The first page is 0, the
 * second 1, etc. This allows implementations to detect when data
 * has been lost.
 */
impl Ogg_Page {
    pub fn page_seq_num(&self) -> Ref<'_, u32> {
        self.page_seq_num.borrow()
    }
}

/**
 * This field provides a CRC32 checksum of the data in the entire
 * page (including the page header, calculated with the checksum
 * field set to 0). This allows verification that the data has not
 * been corrupted since it was created. Pages that fail the
 * checksum should be discarded. The checksum is generated using a
 * polynomial value of 0x04C11DB7.
 */
impl Ogg_Page {
    pub fn crc32(&self) -> Ref<'_, u32> {
        self.crc32.borrow()
    }
}

/**
 * The number of segments that exist in this page. There can be a
 * maximum of 255 segments in any one page.
 */
impl Ogg_Page {
    pub fn num_segments(&self) -> Ref<'_, u8> {
        self.num_segments.borrow()
    }
}

/**
 * Table of lengths of segments.
 */
impl Ogg_Page {
    pub fn len_segments(&self) -> Ref<'_, Vec<u8>> {
        self.len_segments.borrow()
    }
}

/**
 * Segment content bytes make up the rest of the Ogg page.
 */
impl Ogg_Page {
    pub fn segments(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.segments.borrow()
    }
}
impl Ogg_Page {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
