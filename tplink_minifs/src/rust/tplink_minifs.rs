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
 * MINIFS is a file system found in certain firmware files from TP-Link
 * (including its Mercusys brand) and Mercury. Such firmware contains an RTOS
 * kernel, e.g. VxWorks in
 * [`RE450(V4)_210531.zip`](https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip)
 * ([archived](https://web.archive.org/web/20261105175157/https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip))
 * or TPOS, TP-Link's RTOS, in
 * [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
 * ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
 * 
 * According to a TP-Link manager quoted in a
 * [2021 article](https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)
 * ([archived](https://web.archive.org/web/20230513175833/https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)),
 * Mercusys has been sold in China as Mercury since 2001. All Mercury images
 * examined contain a certificate with `O=tplink` in its issuer and subject.
 * 
 * All versions share the same header, and its `version` field determines the
 * layout of the rest of the image.
 * 
 * In version 3, the header is followed by a table of directory paths and file
 * names, followed by meta information for each file, meta information about
 * the LZMA compressed blobs including length, offset and uncompressed length,
 * and then a number of LZMA compressed blobs.
 * 
 * The LZMA blobs can contain the concatenated contents of multiple files.
 * The meta information of a file contains the offsets of its directory path
 * and file name, the LZMA blob (numbering starts at 0), the offset of the file
 * in the uncompressed data and the size of the uncompressed file.
 * 
 * Some version 3 images have no uncompressed length in the meta information
 * about the blobs (see `has_8_byte_lzma_metas` in `body_v3`).
 * 
 * In version 2, the header is followed by the length of the files area and a
 * meta information record for each file, each followed directly by the file's
 * data. Unlike versions 1 and 3, version 2 stores no paths or file names at
 * all, only the MD5 hash of each file's path.
 * 
 * In version 1, the header is followed by a record with the path, the compressed
 * length and the offset of each file, and then one LZMA blob per file.
 * 
 * This Kaitai Struct implementation was written independently of the paper
 * [Reverse Engineered MiniFS File System](https://arxiv.org/abs/2407.05064v1).
 * It was started in the firmware analysis project
 * [BANG](https://github.com/armijnhemel/binaryanalysis-ng) (Binary Analysis
 * Next Generation) in
 * [2021](https://github.com/armijnhemel/binaryanalysis-ng/commit/531203a076e3761116320b77b2b9c64a9dca6186)
 * and submitted to the Kaitai Struct format gallery in
 * [September 2023](https://github.com/kaitai-io/kaitai_struct_formats/pull/682),
 * whereas the paper was published in July 2024.
 * \sa https://arxiv.org/html/2407.05064v1#S4 The paper, section 4 (version 3)
 * \sa https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py tp_research's `Minifs.py` (version 2)
 * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py unblob's MiniFS handler (version 3)
 */

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<TplinkMinifs>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<TplinkMinifs_MinifsHeader>>,
    body: RefCell<Option<TplinkMinifs_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum TplinkMinifs_Body {
    TplinkMinifs_BodyV1(OptRc<TplinkMinifs_BodyV1>),
    TplinkMinifs_BodyV2(OptRc<TplinkMinifs_BodyV2>),
    TplinkMinifs_BodyV3(OptRc<TplinkMinifs_BodyV3>),
}
impl From<&TplinkMinifs_Body> for OptRc<TplinkMinifs_BodyV1> {
    fn from(v: &TplinkMinifs_Body) -> Self {
        if let TplinkMinifs_Body::TplinkMinifs_BodyV1(x) = v {
            return x.clone();
        }
        panic!("expected TplinkMinifs_Body::TplinkMinifs_BodyV1, got {:?}", v)
    }
}
impl From<OptRc<TplinkMinifs_BodyV1>> for TplinkMinifs_Body {
    fn from(v: OptRc<TplinkMinifs_BodyV1>) -> Self {
        Self::TplinkMinifs_BodyV1(v)
    }
}
impl From<&TplinkMinifs_Body> for OptRc<TplinkMinifs_BodyV2> {
    fn from(v: &TplinkMinifs_Body) -> Self {
        if let TplinkMinifs_Body::TplinkMinifs_BodyV2(x) = v {
            return x.clone();
        }
        panic!("expected TplinkMinifs_Body::TplinkMinifs_BodyV2, got {:?}", v)
    }
}
impl From<OptRc<TplinkMinifs_BodyV2>> for TplinkMinifs_Body {
    fn from(v: OptRc<TplinkMinifs_BodyV2>) -> Self {
        Self::TplinkMinifs_BodyV2(v)
    }
}
impl From<&TplinkMinifs_Body> for OptRc<TplinkMinifs_BodyV3> {
    fn from(v: &TplinkMinifs_Body) -> Self {
        if let TplinkMinifs_Body::TplinkMinifs_BodyV3(x) = v {
            return x.clone();
        }
        panic!("expected TplinkMinifs_Body::TplinkMinifs_BodyV3, got {:?}", v)
    }
}
impl From<OptRc<TplinkMinifs_BodyV3>> for TplinkMinifs_Body {
    fn from(v: OptRc<TplinkMinifs_BodyV3>) -> Self {
        Self::TplinkMinifs_BodyV3(v)
    }
}
impl KStruct for TplinkMinifs {
    type Root = TplinkMinifs;
    type Parent = TplinkMinifs;

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
        let t = Self::read_into::<_, TplinkMinifs_MinifsHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        match *self_rc.header().version() {
            1 => {
                let t = Self::read_into::<_, TplinkMinifs_BodyV1>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            2 => {
                let t = Self::read_into::<_, TplinkMinifs_BodyV2>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            3 => {
                let t = Self::read_into::<_, TplinkMinifs_BodyV3>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl TplinkMinifs {
}
impl TplinkMinifs {
    pub fn header(&self) -> Ref<'_, OptRc<TplinkMinifs_MinifsHeader>> {
        self.header.borrow()
    }
}
impl TplinkMinifs {
    pub fn body(&self) -> Ref<'_, Option<TplinkMinifs_Body>> {
        self.body.borrow()
    }
}
impl TplinkMinifs {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum TplinkMinifs_CompressionType {

    /**
     * The only value in all images examined.
     */
    Lzma,
    Raw,
    Lzma2014,
    Unknown(i64),
}

impl TryFrom<i64> for TplinkMinifs_CompressionType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<TplinkMinifs_CompressionType> {
        match flag {
            0 => Ok(TplinkMinifs_CompressionType::Lzma),
            2 => Ok(TplinkMinifs_CompressionType::Raw),
            4 => Ok(TplinkMinifs_CompressionType::Lzma2014),
            _ => Ok(TplinkMinifs_CompressionType::Unknown(flag)),
        }
    }
}

impl From<&TplinkMinifs_CompressionType> for i64 {
    fn from(v: &TplinkMinifs_CompressionType) -> Self {
        match *v {
            TplinkMinifs_CompressionType::Lzma => 0,
            TplinkMinifs_CompressionType::Raw => 2,
            TplinkMinifs_CompressionType::Lzma2014 => 4,
            TplinkMinifs_CompressionType::Unknown(v) => v
        }
    }
}

impl Default for TplinkMinifs_CompressionType {
    fn default() -> Self { TplinkMinifs_CompressionType::Unknown(0) }
}


/**
 * \sa https://arxiv.org/html/2407.05064v1#S2.SS2 Source
 */

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs_BodyV1 {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<TplinkMinifs>,
    pub _self: SharedType<Self>,
    inodes: RefCell<Vec<OptRc<TplinkMinifs_InodeV1>>>,
    blobs_area: RefCell<OptRc<TplinkMinifs_Dummy>>,
    _io: RefCell<BytesReader>,
    blobs_area_raw: RefCell<Vec<u8>>,
}
impl KStruct for TplinkMinifs_BodyV1 {
    type Root = TplinkMinifs;
    type Parent = TplinkMinifs;

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
        *self_rc.inodes.borrow_mut() = Vec::new();
        let l_inodes = *_r.header().num_files();
        for _i in 0..l_inodes {
            let f = |t : &mut TplinkMinifs_InodeV1| Ok(t.set_params(((if ((_i as i32) != (0 as i32)) { *self_rc.inodes()[((_i as i32) - (1 as i32)) as usize].ofs_end()? } else { 0 } as u32)).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, TplinkMinifs_InodeV1>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.inodes.borrow_mut().push(t);
        }
        *self_rc.blobs_area_raw.borrow_mut() = _io.read_bytes(*self_rc.inodes().last().ok_or(KError::EmptyIterator)?.ofs_end()? as usize)?.into();
        let blobs_area_raw = self_rc.blobs_area_raw.borrow();
        let _t_blobs_area_raw_io = BytesReader::from(blobs_area_raw.clone());
        let t = Self::read_into::<BytesReader, TplinkMinifs_Dummy>(&_t_blobs_area_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.blobs_area.borrow_mut() = t;
        Ok(())
    }
}
impl TplinkMinifs_BodyV1 {
}
impl TplinkMinifs_BodyV1 {
    pub fn inodes(&self) -> Ref<'_, Vec<OptRc<TplinkMinifs_InodeV1>>> {
        self.inodes.borrow()
    }
}
impl TplinkMinifs_BodyV1 {
    pub fn blobs_area(&self) -> Ref<'_, OptRc<TplinkMinifs_Dummy>> {
        self.blobs_area.borrow()
    }
}
impl TplinkMinifs_BodyV1 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl TplinkMinifs_BodyV1 {
    pub fn blobs_area_raw(&self) -> Ref<'_, Vec<u8>> {
        self.blobs_area_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs_BodyV2 {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<TplinkMinifs>,
    pub _self: SharedType<Self>,
    len_files_area: RefCell<u32>,
    files_area: RefCell<OptRc<TplinkMinifs_FilesAreaV2>>,
    _io: RefCell<BytesReader>,
    files_area_raw: RefCell<Vec<u8>>,
}
impl KStruct for TplinkMinifs_BodyV2 {
    type Root = TplinkMinifs;
    type Parent = TplinkMinifs;

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
        *self_rc.len_files_area.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.files_area_raw.borrow_mut() = _io.read_bytes(*self_rc.len_files_area() as usize)?.into();
        let files_area_raw = self_rc.files_area_raw.borrow();
        let _t_files_area_raw_io = BytesReader::from(files_area_raw.clone());
        let t = Self::read_into::<BytesReader, TplinkMinifs_FilesAreaV2>(&_t_files_area_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.files_area.borrow_mut() = t;
        Ok(())
    }
}
impl TplinkMinifs_BodyV2 {
}
impl TplinkMinifs_BodyV2 {
    pub fn len_files_area(&self) -> Ref<'_, u32> {
        self.len_files_area.borrow()
    }
}
impl TplinkMinifs_BodyV2 {
    pub fn files_area(&self) -> Ref<'_, OptRc<TplinkMinifs_FilesAreaV2>> {
        self.files_area.borrow()
    }
}
impl TplinkMinifs_BodyV2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl TplinkMinifs_BodyV2 {
    pub fn files_area_raw(&self) -> Ref<'_, Vec<u8>> {
        self.files_area_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs_BodyV3 {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<TplinkMinifs>,
    pub _self: SharedType<Self>,
    len_name_table: RefCell<u32>,
    name_table: RefCell<OptRc<TplinkMinifs_NameTable>>,
    inodes: RefCell<Vec<OptRc<TplinkMinifs_Inode>>>,
    unnamed3: RefCell<Vec<u8>>,
    lzma_metas: RefCell<Vec<OptRc<TplinkMinifs_LzmaMeta>>>,
    lzma_blobs_area: RefCell<OptRc<TplinkMinifs_Dummy>>,
    _io: RefCell<BytesReader>,
    name_table_raw: RefCell<Vec<u8>>,
    lzma_blobs_area_raw: RefCell<Vec<u8>>,
    f_has_8_byte_lzma_metas: Cell<bool>,
    has_8_byte_lzma_metas: RefCell<bool>,
    f_len_first_blob_uncompressed_if_8_byte_metas: Cell<bool>,
    len_first_blob_uncompressed_if_8_byte_metas: RefCell<u64>,
    f_len_lzma_meta: Cell<bool>,
    len_lzma_meta: RefCell<i8>,
    f_num_lzma_blobs: Cell<bool>,
    num_lzma_blobs: RefCell<i32>,
    f_ofs_lzma_metas: Cell<bool>,
    ofs_lzma_metas: RefCell<i32>,
}
impl KStruct for TplinkMinifs_BodyV3 {
    type Root = TplinkMinifs;
    type Parent = TplinkMinifs;

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
        *self_rc.len_name_table.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.name_table_raw.borrow_mut() = _io.read_bytes(*self_rc.len_name_table() as usize)?.into();
        let name_table_raw = self_rc.name_table_raw.borrow();
        let _t_name_table_raw_io = BytesReader::from(name_table_raw.clone());
        let t = Self::read_into::<BytesReader, TplinkMinifs_NameTable>(&_t_name_table_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.name_table.borrow_mut() = t;
        *self_rc.inodes.borrow_mut() = Vec::new();
        let l_inodes = *_r.header().num_files();
        for _i in 0..l_inodes {
            let f = |t : &mut TplinkMinifs_Inode| Ok(t.set_params(((if ((_i as i32) != (0 as i32)) { *self_rc.inodes()[((_i as i32) - (1 as i32)) as usize].cur_max_lzma_blob()? } else { 0 } as u32)).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, TplinkMinifs_Inode>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.inodes.borrow_mut().push(t);
        }
        if ((*self_rc.ofs_lzma_metas()? as i32) < (0 as i32)) {
            *self_rc.unnamed3.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        *self_rc.lzma_metas.borrow_mut() = Vec::new();
        let l_lzma_metas = *self_rc.num_lzma_blobs()?;
        for _i in 0..l_lzma_metas {
            let f = |t : &mut TplinkMinifs_LzmaMeta| Ok(t.set_params(((if ((_i as i32) != (0 as i32)) { *self_rc.lzma_metas()[((_i as i32) - (1 as i32)) as usize].ofs_end()? } else { 0 } as u32)).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, TplinkMinifs_LzmaMeta>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.lzma_metas.borrow_mut().push(t);
        }
        *self_rc.lzma_blobs_area_raw.borrow_mut() = _io.read_bytes(*self_rc.lzma_metas().last().ok_or(KError::EmptyIterator)?.ofs_end()? as usize)?.into();
        let lzma_blobs_area_raw = self_rc.lzma_blobs_area_raw.borrow();
        let _t_lzma_blobs_area_raw_io = BytesReader::from(lzma_blobs_area_raw.clone());
        let t = Self::read_into::<BytesReader, TplinkMinifs_Dummy>(&_t_lzma_blobs_area_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.lzma_blobs_area.borrow_mut() = t;
        Ok(())
    }
}
impl TplinkMinifs_BodyV3 {

    /**
     * Whether each record in `lzma_metas` lacks `len_blob_uncompressed` and
     * is therefore 8 bytes in size instead of 12.
     * 
     * The MINIFS header doesn't say which size is used (both use version 3),
     * so this Kaitai Struct implementation infers it using a heuristic based
     * on the `.lzma` header of the first blob. Bytes 5 to 12 of that header
     * are the uncompressed size, which was unknown (all bits set) for all
     * blobs in all version 3 images examined. So with 8-byte records,
     * `len_first_blob_uncompressed_if_8_byte_metas` has all bits set. With
     * 12-byte records, the same 8 bytes aren't the uncompressed size. With 3
     * or more blobs, they include a whole offset or length in `lzma_metas`,
     * which would have to be 4 GiB. With 1 or 2 blobs, they include the
     * first blob's dictionary size, which is 8 MiB in all images examined.
     * 
     * An image with 8-byte records and a known uncompressed size would be
     * rejected, or misparsed if it has a single blob and other data follows it.
     * 
     * In the images examined, 8-byte records occur in firmware files with
     * modification times from 2018 to 2022 (as stored in their ZIPs), e.g. in
     * [`MW301R(EU)_V2_180821.zip`](https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)
     * ([archived](https://web.archive.org/web/20261105093950/https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)),
     * listed on <https://www.mercusys.com/en/download/mw301r/v2/>
     * ([archived](https://web.archive.org/web/20261105142659/https://www.mercusys.com/en/download/mw301r/v2/)).
     * 
     * As far as we know, this implementation is the first description of
     * 8-byte records. The other descriptions and tools found either assume
     * 12 bytes or don't read `lzma_metas` at all. So there is no reference
     * to compare it with, and the evidence comes from the images. In all 49
     * distinct images examined with 8-byte records, the bytes at each
     * record's offset and length are exactly one complete LZMA stream. Each
     * such stream decompresses to exactly the length that the files packed
     * into it need. The file that ends last in it ends exactly where the
     * decompressed data ends. In addition:
     * 
     * * 2614 of the 7230 files in these 49 images have the same path and
     *   contents as a file in an image with 12-byte records. For example,
     *   49 files are the same in the image with 8-byte records in
     *   [`TL-WA850RE(EU)_V7_201029.zip`](https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip)
     *   ([archived](https://web.archive.org/web/20220326032207/https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip))
     *   and the image with 12-byte records in
     *   [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
     *   ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
     * * The repository
     *   [NurMohammadDuari/mw325r-hack-lab](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45)
     *   has the [files](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45/extracted-minifs)
     *   of the image with 8-byte records in
     *   [`MW325R(EU)_V2_20111620201211065426.zip`](https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)
     *   ([archived](https://web.archive.org/web/20261105093427/https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)).
     *   They match the files parsed by this implementation in all 92 files
     *   that can be compared. Its
     *   [extractor](https://github.com/NurMohammadDuari/mw325r-hack-lab/blob/024da680dbf4f9ca287d562622f02d7d8875bd45/analysis/minifs_extract.py)
     *   finds the blobs by searching for LZMA headers instead of reading
     *   `lzma_metas`.
     */
    pub fn has_8_byte_lzma_metas(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_8_byte_lzma_metas.get() {
            return Ok(self.has_8_byte_lzma_metas.borrow());
        }
        self.f_has_8_byte_lzma_metas.set(true);
        *self.has_8_byte_lzma_metas.borrow_mut() = (((*self.len_first_blob_uncompressed_if_8_byte_metas()? as i32) == (18446744073709551615 as i32))) as bool;
        Ok(self.has_8_byte_lzma_metas.borrow())
    }

    /**
     * The uncompressed size in the `.lzma` header of the first blob, if
     * `lzma_metas` have 8-byte records. It follows the properties byte and the
     * 4-byte dictionary size.
     */
    pub fn len_first_blob_uncompressed_if_8_byte_metas(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_first_blob_uncompressed_if_8_byte_metas.get() {
            return Ok(self.len_first_blob_uncompressed_if_8_byte_metas.borrow());
        }
        self.f_len_first_blob_uncompressed_if_8_byte_metas.set(true);
        let _pos = _io.pos();
        _io.seek(((((*self.ofs_lzma_metas()? as i32) + (((8 as i32) * (*self.num_lzma_blobs()? as i32)) as i32)) as i32) + (5 as i32)) as usize)?;
        *self.len_first_blob_uncompressed_if_8_byte_metas.borrow_mut() = _io.read_u8le()?.into();
        _io.seek(_pos)?;
        Ok(self.len_first_blob_uncompressed_if_8_byte_metas.borrow())
    }

    /**
     * The size of each record in `lzma_metas` (8 or 12 bytes).
     */
    pub fn len_lzma_meta(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_lzma_meta.get() {
            return Ok(self.len_lzma_meta.borrow());
        }
        self.f_len_lzma_meta.set(true);
        *self.len_lzma_meta.borrow_mut() = (if *self.has_8_byte_lzma_metas()? { 8 } else { 12 }) as i8;
        Ok(self.len_lzma_meta.borrow())
    }

    /**
     * Count starts at 0, so there is one more blob than the highest blob number
     * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L129-L130 Source
     */
    pub fn num_lzma_blobs(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_lzma_blobs.get() {
            return Ok(self.num_lzma_blobs.borrow());
        }
        self.f_num_lzma_blobs.set(true);
        *self.num_lzma_blobs.borrow_mut() = (((*self.inodes().last().ok_or(KError::EmptyIterator)?.cur_max_lzma_blob()? as i32) + (1 as i32))) as i32;
        Ok(self.num_lzma_blobs.borrow())
    }
    pub fn ofs_lzma_metas(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_lzma_metas.get() {
            return Ok(self.ofs_lzma_metas.borrow());
        }
        self.f_ofs_lzma_metas.set(true);
        *self.ofs_lzma_metas.borrow_mut() = (_io.pos()) as i32;
        Ok(self.ofs_lzma_metas.borrow())
    }
}
impl TplinkMinifs_BodyV3 {
    pub fn len_name_table(&self) -> Ref<'_, u32> {
        self.len_name_table.borrow()
    }
}
impl TplinkMinifs_BodyV3 {
    pub fn name_table(&self) -> Ref<'_, OptRc<TplinkMinifs_NameTable>> {
        self.name_table.borrow()
    }
}
impl TplinkMinifs_BodyV3 {
    pub fn inodes(&self) -> Ref<'_, Vec<OptRc<TplinkMinifs_Inode>>> {
        self.inodes.borrow()
    }
}
impl TplinkMinifs_BodyV3 {
    pub fn unnamed3(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed3.borrow()
    }
}
impl TplinkMinifs_BodyV3 {
    pub fn lzma_metas(&self) -> Ref<'_, Vec<OptRc<TplinkMinifs_LzmaMeta>>> {
        self.lzma_metas.borrow()
    }
}
impl TplinkMinifs_BodyV3 {
    pub fn lzma_blobs_area(&self) -> Ref<'_, OptRc<TplinkMinifs_Dummy>> {
        self.lzma_blobs_area.borrow()
    }
}
impl TplinkMinifs_BodyV3 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl TplinkMinifs_BodyV3 {
    pub fn name_table_raw(&self) -> Ref<'_, Vec<u8>> {
        self.name_table_raw.borrow()
    }
}
impl TplinkMinifs_BodyV3 {
    pub fn lzma_blobs_area_raw(&self) -> Ref<'_, Vec<u8>> {
        self.lzma_blobs_area_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs_Dummy {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TplinkMinifs_Dummy {
    type Root = TplinkMinifs;
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
        Ok(())
    }
}
impl TplinkMinifs_Dummy {
}
impl TplinkMinifs_Dummy {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L41-L52 Source
 */

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs_FileV2 {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<TplinkMinifs_FilesAreaV2>,
    pub _self: SharedType<Self>,
    path_md5: RefCell<Vec<u8>>,
    len_data: RefCell<u32>,
    ofs_data: RefCell<u32>,
    len_data_uncompressed: RefCell<u32>,
    compression: RefCell<TplinkMinifs_CompressionType>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TplinkMinifs_FileV2 {
    type Root = TplinkMinifs;
    type Parent = TplinkMinifs_FilesAreaV2;

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
        *self_rc.path_md5.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.len_data.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ofs_data.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.ofs_data() as i32) == (((_io.pos() as i32) + (8 as i32)) as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_v2/seq/2".to_string() }));
        }
        *self_rc.len_data_uncompressed.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.compression.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.len_data() as usize)?.into();
        Ok(())
    }
}
impl TplinkMinifs_FileV2 {
}

/**
 * The MD5 hash of the absolute path of the file, e.g. of
 * `/conf/priv-key.pem`.
 * 
 * Version 2 images store only these hashes, not the paths, so a path can
 * only be found by hashing candidate paths and comparing.
 * [`Minifs.py`](https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L181-L209)
 * takes the candidates from path-like strings in the files' contents.
 */
impl TplinkMinifs_FileV2 {
    pub fn path_md5(&self) -> Ref<'_, Vec<u8>> {
        self.path_md5.borrow()
    }
}
impl TplinkMinifs_FileV2 {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}

/**
 * Offset of `data` relative to the start of `<body_v2>.files_area`.
 */
impl TplinkMinifs_FileV2 {
    pub fn ofs_data(&self) -> Ref<'_, u32> {
        self.ofs_data.borrow()
    }
}
impl TplinkMinifs_FileV2 {
    pub fn len_data_uncompressed(&self) -> Ref<'_, u32> {
        self.len_data_uncompressed.borrow()
    }
}
impl TplinkMinifs_FileV2 {
    pub fn compression(&self) -> Ref<'_, TplinkMinifs_CompressionType> {
        self.compression.borrow()
    }
}

/**
 * With `compression_type::lzma`, an LZMA stream in the `.lzma` format
 * (also known as LZMA_Alone). Decompress it in the same way as
 * `<lzma_meta>.blob`.
 * 
 * In all images examined, the `.lzma` header specifies the properties
 * lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
 * bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
 * stream, and there is no end-of-payload marker.
 */
impl TplinkMinifs_FileV2 {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl TplinkMinifs_FileV2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs_FilesAreaV2 {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<TplinkMinifs_BodyV2>,
    pub _self: SharedType<Self>,
    files: RefCell<Vec<OptRc<TplinkMinifs_FileV2>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TplinkMinifs_FilesAreaV2 {
    type Root = TplinkMinifs;
    type Parent = TplinkMinifs_BodyV2;

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
        *self_rc.files.borrow_mut() = Vec::new();
        let l_files = *_r.header().num_files();
        for _i in 0..l_files {
            let t = Self::read_into::<_, TplinkMinifs_FileV2>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.files.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl TplinkMinifs_FilesAreaV2 {
}
impl TplinkMinifs_FilesAreaV2 {
    pub fn files(&self) -> Ref<'_, Vec<OptRc<TplinkMinifs_FileV2>>> {
        self.files.borrow()
    }
}
impl TplinkMinifs_FilesAreaV2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://arxiv.org/html/2407.05064v1#S4.SS3 Source
 * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L36-L42 Source
 */

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs_Inode {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<TplinkMinifs_BodyV3>,
    pub _self: SharedType<Self>,
    prev_max_lzma_blob: RefCell<u32>,
    ofs_directory_path: RefCell<u32>,
    ofs_file_name: RefCell<u32>,
    lzma_blob: RefCell<u32>,
    ofs_file: RefCell<u32>,
    len_file: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_cur_max_lzma_blob: Cell<bool>,
    cur_max_lzma_blob: RefCell<i32>,
    f_directory_path: Cell<bool>,
    directory_path: RefCell<String>,
    f_file_name: Cell<bool>,
    file_name: RefCell<String>,
}
impl KStruct for TplinkMinifs_Inode {
    type Root = TplinkMinifs;
    type Parent = TplinkMinifs_BodyV3;

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
        *self_rc.ofs_directory_path.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ofs_file_name.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.lzma_blob.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ofs_file.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.len_file.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl TplinkMinifs_Inode {
    pub fn prev_max_lzma_blob(&self) -> Ref<'_, u32> {
        self.prev_max_lzma_blob.borrow()
    }
}
impl TplinkMinifs_Inode {
    pub fn set_params(&mut self, prev_max_lzma_blob: u32) {
        *self.prev_max_lzma_blob.borrow_mut() = prev_max_lzma_blob;
    }
}
impl TplinkMinifs_Inode {
    pub fn cur_max_lzma_blob(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_cur_max_lzma_blob.get() {
            return Ok(self.cur_max_lzma_blob.borrow());
        }
        self.f_cur_max_lzma_blob.set(true);
        *self.cur_max_lzma_blob.borrow_mut() = (if ((*self.lzma_blob() as i32) > (*self.prev_max_lzma_blob() as i32)) { *self.lzma_blob() } else { *self.prev_max_lzma_blob() }) as i32;
        Ok(self.cur_max_lzma_blob.borrow())
    }
    pub fn directory_path(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_directory_path.get() {
            return Ok(self.directory_path.borrow());
        }
        self.f_directory_path.set(true);
        let io = Clone::clone(&*_prc.as_ref().unwrap().name_table()._io());
        let _pos = io.pos();
        io.seek(*self.ofs_directory_path() as usize)?;
        *self.directory_path.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        io.seek(_pos)?;
        Ok(self.directory_path.borrow())
    }
    pub fn file_name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_file_name.get() {
            return Ok(self.file_name.borrow());
        }
        self.f_file_name.set(true);
        let io = Clone::clone(&*_prc.as_ref().unwrap().name_table()._io());
        let _pos = io.pos();
        io.seek(*self.ofs_file_name() as usize)?;
        *self.file_name.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        io.seek(_pos)?;
        Ok(self.file_name.borrow())
    }
}
impl TplinkMinifs_Inode {
    pub fn ofs_directory_path(&self) -> Ref<'_, u32> {
        self.ofs_directory_path.borrow()
    }
}
impl TplinkMinifs_Inode {
    pub fn ofs_file_name(&self) -> Ref<'_, u32> {
        self.ofs_file_name.borrow()
    }
}
impl TplinkMinifs_Inode {
    pub fn lzma_blob(&self) -> Ref<'_, u32> {
        self.lzma_blob.borrow()
    }
}
impl TplinkMinifs_Inode {
    pub fn ofs_file(&self) -> Ref<'_, u32> {
        self.ofs_file.borrow()
    }
}
impl TplinkMinifs_Inode {
    pub fn len_file(&self) -> Ref<'_, u32> {
        self.len_file.borrow()
    }
}
impl TplinkMinifs_Inode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs_InodeV1 {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<TplinkMinifs_BodyV1>,
    pub _self: SharedType<Self>,
    prev_ofs_end: RefCell<u32>,
    path: RefCell<String>,
    len_blob: RefCell<u32>,
    ofs_blob: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_blob: Cell<bool>,
    blob: RefCell<Vec<u8>>,
    f_ofs_end: Cell<bool>,
    ofs_end: RefCell<i32>,
}
impl KStruct for TplinkMinifs_InodeV1 {
    type Root = TplinkMinifs;
    type Parent = TplinkMinifs_BodyV1;

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
        *self_rc.path.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(80 as usize)?.into(), 0, false).into(), "ASCII")?;
        *self_rc.len_blob.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ofs_blob.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.ofs_blob() as i32) == (*self_rc.prev_ofs_end() as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/inode_v1/seq/2".to_string() }));
        }
        Ok(())
    }
}
impl TplinkMinifs_InodeV1 {
    pub fn prev_ofs_end(&self) -> Ref<'_, u32> {
        self.prev_ofs_end.borrow()
    }
}
impl TplinkMinifs_InodeV1 {
    pub fn set_params(&mut self, prev_ofs_end: u32) {
        *self.prev_ofs_end.borrow_mut() = prev_ofs_end;
    }
}
impl TplinkMinifs_InodeV1 {

    /**
     * An LZMA stream in the `.lzma` format (also known as LZMA_Alone) with
     * the contents of the file. Decompress it in the same way as
     * `<lzma_meta>.blob`.
     * 
     * In all images examined, the `.lzma` header specifies the properties
     * lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
     * bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
     * stream, and there is no end-of-payload marker.
     */
    pub fn blob(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blob.get() {
            return Ok(self.blob.borrow());
        }
        self.f_blob.set(true);
        let io = Clone::clone(&*_prc.as_ref().unwrap().blobs_area()._io());
        let _pos = io.pos();
        io.seek(*self.ofs_blob() as usize)?;
        *self.blob.borrow_mut() = io.read_bytes(*self.len_blob() as usize)?.into();
        io.seek(_pos)?;
        Ok(self.blob.borrow())
    }
    pub fn ofs_end(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_end.get() {
            return Ok(self.ofs_end.borrow());
        }
        self.f_ofs_end.set(true);
        *self.ofs_end.borrow_mut() = (((*self.ofs_blob() as u32) + (*self.len_blob() as u32))) as i32;
        Ok(self.ofs_end.borrow())
    }
}
impl TplinkMinifs_InodeV1 {
    pub fn path(&self) -> Ref<'_, String> {
        self.path.borrow()
    }
}
impl TplinkMinifs_InodeV1 {
    pub fn len_blob(&self) -> Ref<'_, u32> {
        self.len_blob.borrow()
    }
}

/**
 * Relative to the start of `<body_v1>.blobs_area`.
 */
impl TplinkMinifs_InodeV1 {
    pub fn ofs_blob(&self) -> Ref<'_, u32> {
        self.ofs_blob.borrow()
    }
}
impl TplinkMinifs_InodeV1 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://arxiv.org/html/2407.05064v1#S4.SS4 Source
 * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L44-L48 Source
 */

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs_LzmaMeta {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<TplinkMinifs_BodyV3>,
    pub _self: SharedType<Self>,
    prev_ofs_end: RefCell<u32>,
    ofs_blob: RefCell<u32>,
    len_blob: RefCell<u32>,
    len_blob_uncompressed: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_blob: Cell<bool>,
    blob: RefCell<Vec<u8>>,
    f_ofs_end: Cell<bool>,
    ofs_end: RefCell<i32>,
}
impl KStruct for TplinkMinifs_LzmaMeta {
    type Root = TplinkMinifs;
    type Parent = TplinkMinifs_BodyV3;

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
        *self_rc.ofs_blob.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.ofs_blob() as i32) == (*self_rc.prev_ofs_end() as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/lzma_meta/seq/0".to_string() }));
        }
        *self_rc.len_blob.borrow_mut() = _io.read_u4be()?.into();
        if !(*_prc.as_ref().unwrap().has_8_byte_lzma_metas()?) {
            *self_rc.len_blob_uncompressed.borrow_mut() = _io.read_u4be()?.into();
        }
        Ok(())
    }
}
impl TplinkMinifs_LzmaMeta {
    pub fn prev_ofs_end(&self) -> Ref<'_, u32> {
        self.prev_ofs_end.borrow()
    }
}
impl TplinkMinifs_LzmaMeta {
    pub fn set_params(&mut self, prev_ofs_end: u32) {
        *self.prev_ofs_end.borrow_mut() = prev_ofs_end;
    }
}
impl TplinkMinifs_LzmaMeta {

    /**
     * An LZMA stream in the `.lzma` format (also known as LZMA_Alone):
     * a 13-byte header followed by the compressed data. Decompress it
     * with a ready-made LZMA decoder that reads this header, e.g. in
     * Python with `lzma.decompress(blob, format=lzma.FORMAT_ALONE)`. The
     * size of the decompressed data is `len_blob_uncompressed`, if present.
     * 
     * In all images examined with `header.version` = 3, the `.lzma` header
     * specifies the properties lc = 3, lp = 0, pb = 2 and an 8 MiB
     * dictionary, so it starts with the bytes `5D 00 00 80 00`. The
     * uncompressed size in the header is unknown (`0xFFFF_FFFF_FFFF_FFFF`),
     * so the stream ends with an end-of-payload marker.
     * \sa https://arxiv.org/html/2407.05064v1#S4.SS5 Source
     * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L175-L187 Source
     */
    pub fn blob(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blob.get() {
            return Ok(self.blob.borrow());
        }
        self.f_blob.set(true);
        let io = Clone::clone(&*_prc.as_ref().unwrap().lzma_blobs_area()._io());
        let _pos = io.pos();
        io.seek(*self.ofs_blob() as usize)?;
        *self.blob.borrow_mut() = io.read_bytes(*self.len_blob() as usize)?.into();
        io.seek(_pos)?;
        Ok(self.blob.borrow())
    }
    pub fn ofs_end(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_end.get() {
            return Ok(self.ofs_end.borrow());
        }
        self.f_ofs_end.set(true);
        *self.ofs_end.borrow_mut() = (((*self.ofs_blob() as u32) + (*self.len_blob() as u32))) as i32;
        Ok(self.ofs_end.borrow())
    }
}
impl TplinkMinifs_LzmaMeta {
    pub fn ofs_blob(&self) -> Ref<'_, u32> {
        self.ofs_blob.borrow()
    }
}
impl TplinkMinifs_LzmaMeta {
    pub fn len_blob(&self) -> Ref<'_, u32> {
        self.len_blob.borrow()
    }
}
impl TplinkMinifs_LzmaMeta {
    pub fn len_blob_uncompressed(&self) -> Ref<'_, u32> {
        self.len_blob_uncompressed.borrow()
    }
}
impl TplinkMinifs_LzmaMeta {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://arxiv.org/html/2407.05064v1#S4.SS1 Source
 * \sa https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L27-L34 Source
 */

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs_MinifsHeader {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<TplinkMinifs>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<u32>,
    num_files: RefCell<u32>,
    len_largest_file: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TplinkMinifs_MinifsHeader {
    type Root = TplinkMinifs;
    type Parent = TplinkMinifs;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        if !(*self_rc.magic() == vec![0x4du8, 0x49u8, 0x4eu8, 0x49u8, 0x46u8, 0x53u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/minifs_header/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u4be()?.into();
        if !( ((((*self_rc.version() as u32) == (1 as u32))) || (((*self_rc.version() as u32) == (2 as u32))) || (((*self_rc.version() as u32) == (3 as u32)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/types/minifs_header/seq/1".to_string() }));
        }
        *self_rc.num_files.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.len_largest_file.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl TplinkMinifs_MinifsHeader {
}
impl TplinkMinifs_MinifsHeader {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl TplinkMinifs_MinifsHeader {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}
impl TplinkMinifs_MinifsHeader {
    pub fn num_files(&self) -> Ref<'_, u32> {
        self.num_files.borrow()
    }
}

/**
 * The uncompressed size of the largest file. In all images examined with
 * version 3, the inodes are sorted by size in descending order, so it is
 * also the size of the first file. In all images examined with versions
 * 1 and 2, the value is rounded up to a multiple of 4.
 */
impl TplinkMinifs_MinifsHeader {
    pub fn len_largest_file(&self) -> Ref<'_, u32> {
        self.len_largest_file.borrow()
    }
}
impl TplinkMinifs_MinifsHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Table of null-terminated directory paths and file names, referenced by
 * `<inode>.ofs_directory_path` and `<inode>.ofs_file_name`. In all images
 * examined, each non-empty string occurs only once, which saves space in
 * flash memory, as many files share a directory or a name.
 * 
 * In all images examined, the table is padded with null bytes to a multiple
 * of 4 bytes, so `names` can end with up to 3 empty strings (one for each
 * padding byte).
 * \sa https://arxiv.org/html/2407.05064v1#S4.SS2 Source
 */

#[derive(Default, Debug, Clone)]
pub struct TplinkMinifs_NameTable {
    pub _root: SharedType<TplinkMinifs>,
    pub _parent: SharedType<TplinkMinifs_BodyV3>,
    pub _self: SharedType<Self>,
    names: RefCell<Vec<String>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TplinkMinifs_NameTable {
    type Root = TplinkMinifs;
    type Parent = TplinkMinifs_BodyV3;

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
        *self_rc.names.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.names.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl TplinkMinifs_NameTable {
}
impl TplinkMinifs_NameTable {
    pub fn names(&self) -> Ref<'_, Vec<String>> {
        self.names.borrow()
    }
}
impl TplinkMinifs_NameTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
