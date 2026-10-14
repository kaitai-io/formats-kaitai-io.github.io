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
 * UBIFS is a file system for raw flash memory devices. It works on top of
 * UBI (Unsorted Block Images), which works as an abstraction layer so UBIFS
 * does not need to care about low level details. This specification only covers
 * UBIFS, not UBI.
 * 
 * A UBIFS image is divided into several Logical Erase Blocks (LEB). The first
 * LEB (LEB0) contains the superblock node, which includes information about LEB
 * size, amongst others. The next two LEBs (LEB1 and LEB2) comprise the so called
 * "master area" and both contain a copy of the master node, which includes
 * information about where to find the root index node, which is then used to
 * access all the files on the file system.
 * 
 * **Limitations of this Kaitai Struct implementation:**
 * 
 * 1. It only supports UBIFS images created by `mkfs.ubifs` (such as those in
 *    firmware images built by OpenWrt), not file systems modified after
 *    creation, e.g. by writing files to them on a running Linux system. The
 *    Linux kernel appends a new copy of the master node to LEB1 and LEB2
 *    whenever it mounts the file system read-write, unmounts it, or commits
 *    changes (updates the index on flash to include them). When mounting, Linux
 *    uses the
 *    [last copy](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L84-L165),
 *    whereas this implementation reads the first one (`master_1`), which still
 *    describes the file system as it was created. Changes made since then are
 *    therefore not visible via `index_root`.
 * 2. Changes that have not been committed yet are not in the index at all, so
 *    they are not visible via `index_root` either. Until they are committed,
 *    UBIFS keeps them only in the journal. This only matters for file systems
 *    that were not unmounted cleanly, because unmounting
 *    [commits](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/super.c#L486-L493)
 *    all changes.
 * 3. Parsing doesn't advance the stream position. This implementation reads
 *    the image only through instances, so that parsing doesn't copy the
 *    whole image into memory. To find where the image ends, e.g. when
 *    carving it out of a larger file, use `len_image`. For the same reason,
 *    parsing doesn't fail if the image is truncated. To detect that, check
 *    that the stream is at least `len_image` bytes long
 *    (`_io.size >= len_image`).
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h Git tag "v7.2"
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h Git tag "v7.2"
 * \sa http://www.linux-mtd.infradead.org/doc/ubifs.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
    index_raw: RefCell<Vec<u8>>,
    master_1_raw: RefCell<Vec<u8>>,
    master_2_raw: RefCell<Vec<u8>>,
    f_index: Cell<bool>,
    index: RefCell<OptRc<Ubifs_Dummy>>,
    f_index_root: Cell<bool>,
    index_root: RefCell<OptRc<Ubifs_IndexBlock>>,
    f_lebs: Cell<bool>,
    lebs: RefCell<Vec<Vec<u8>>>,
    f_len_image: Cell<bool>,
    len_image: RefCell<i32>,
    f_master_1: Cell<bool>,
    master_1: RefCell<OptRc<Ubifs_MasterblockNode>>,
    f_master_2: Cell<bool>,
    master_2: RefCell<OptRc<Ubifs_MasterblockNode>>,
    f_superblock: Cell<bool>,
    superblock: RefCell<OptRc<Ubifs_SuperblockNode>>,
}
impl KStruct for Ubifs {
    type Root = Ubifs;
    type Parent = Ubifs;

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
impl Ubifs {

    /**
     * The LEB containing the root index node, as given by `leb_root` in
     * `master_1`.
     * 
     * This instance only provides the substream for `index_root`, which can then
     * use `ofs_root` (an offset within the LEB) as its `pos` directly.
     */
    pub fn index(
        &self
    ) -> KResult<Ref<'_, OptRc<Ubifs_Dummy>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_index.get() {
            return Ok(self.index.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*self.superblock()?.node_header().leb_size() as u32) * (*self.master_1()?.node_header().leb_root() as u32)) as usize)?;
        *self.index_raw.borrow_mut() = _io.read_bytes(*self.superblock()?.node_header().leb_size() as usize)?.into();
        let index_raw = self.index_raw.borrow();
        let _t_index_raw_io = BytesReader::from(index_raw.clone());
        let t = Self::read_into::<BytesReader, Ubifs_Dummy>(&_t_index_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.index.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.index.borrow())
    }

    /**
     * The root index node, in the `index` LEB at the offset given by
     * `ofs_root` in `master_1`. All other index nodes, and through them all
     * the files, are reached from it by recursively following the `target` of
     * each of the `branches`.
     */
    pub fn index_root(
        &self
    ) -> KResult<Ref<'_, OptRc<Ubifs_IndexBlock>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_index_root.get() {
            return Ok(self.index_root.borrow());
        }
        let io = Clone::clone(&*self.index()?._io());
        let _pos = io.pos();
        io.seek(*self.master_1()?.node_header().ofs_root() as usize)?;
        let t = Self::read_into::<BytesReader, Ubifs_IndexBlock>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.index_root.borrow_mut() = t;
        let _tmpa = *self.index_root()?;
        if !(*_tmpa.header().len_full_node() == *self.master_1()?.node_header().len_root()) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/instances/index_root".to_string() }));
        }
        io.seek(_pos)?;
        Ok(self.index_root.borrow())
    }

    /**
     * All LEBs of the file system: `lebs[n]` is LEB number `n`, which starts
     * at offset `n * <superblock_header>.leb_size`.
     * 
     * Accessing this instance reads the whole image into memory. To get a
     * single LEB, it's cheaper to read `<superblock_header>.leb_size` bytes
     * at the offset of that LEB.
     */
    pub fn lebs(
        &self
    ) -> KResult<Ref<'_, Vec<Vec<u8>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_lebs.get() {
            return Ok(self.lebs.borrow());
        }
        self.f_lebs.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.lebs.borrow_mut() = Vec::new();
        let l_lebs = *self.superblock()?.node_header().num_lebs();
        for _i in 0..l_lebs {
            self.lebs.borrow_mut().push(_io.read_bytes(*self.superblock()?.node_header().leb_size() as usize)?.into());
        }
        _io.seek(_pos)?;
        Ok(self.lebs.borrow())
    }

    /**
     * Length of the file system image in bytes:
     * `<superblock_header>.num_lebs` LEBs of `<superblock_header>.leb_size`
     * bytes each. Use it to find where the image ends and to detect a
     * truncated image (see the top-level `doc`).
     */
    pub fn len_image(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_image.get() {
            return Ok(self.len_image.borrow());
        }
        self.f_len_image.set(true);
        *self.len_image.borrow_mut() = (((*self.superblock()?.node_header().leb_size() as u32) * (*self.superblock()?.node_header().num_lebs() as u32))) as i32;
        Ok(self.len_image.borrow())
    }

    /**
     * The first copy of the master node in LEB1. This Kaitai Struct
     * implementation uses it to locate `index_root`. In an image created by
     * `mkfs.ubifs`, it is the only copy in LEB1.
     * \sa https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633 Git tag "v2.3.1"
     */
    pub fn master_1(
        &self
    ) -> KResult<Ref<'_, OptRc<Ubifs_MasterblockNode>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_master_1.get() {
            return Ok(self.master_1.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.superblock()?.node_header().leb_size() as usize)?;
        *self.master_1_raw.borrow_mut() = _io.read_bytes(*self.superblock()?.node_header().leb_size() as usize)?.into();
        let master_1_raw = self.master_1_raw.borrow();
        let _t_master_1_raw_io = BytesReader::from(master_1_raw.clone());
        let t = Self::read_into::<BytesReader, Ubifs_MasterblockNode>(&_t_master_1_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.master_1.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.master_1.borrow())
    }

    /**
     * The first copy of the master node in LEB2. In an image created by
     * `mkfs.ubifs`, it is the same as `master_1` except for the sequence
     * number and CRC in the common header. Linux keeps the master node in both
     * LEB1 and LEB2 for redundancy, and when mounting, it checks that the
     * copies in both match.
     * \sa https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633 Git tag "v2.3.1"
     * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L115-L130 Git tag "v7.2"
     */
    pub fn master_2(
        &self
    ) -> KResult<Ref<'_, OptRc<Ubifs_MasterblockNode>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_master_2.get() {
            return Ok(self.master_2.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*self.superblock()?.node_header().leb_size() as u32) * (2 as u32)) as usize)?;
        *self.master_2_raw.borrow_mut() = _io.read_bytes(*self.superblock()?.node_header().leb_size() as usize)?.into();
        let master_2_raw = self.master_2_raw.borrow();
        let _t_master_2_raw_io = BytesReader::from(master_2_raw.clone());
        let t = Self::read_into::<BytesReader, Ubifs_MasterblockNode>(&_t_master_2_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.master_2.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.master_2.borrow())
    }

    /**
     * The superblock node will always be at the start of
     * the first LEB.
     */
    pub fn superblock(
        &self
    ) -> KResult<Ref<'_, OptRc<Ubifs_SuperblockNode>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_superblock.get() {
            return Ok(self.superblock.borrow());
        }
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        let t = Self::read_into::<_, Ubifs_SuperblockNode>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.superblock.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.superblock.borrow())
    }
}
impl Ubifs {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ubifs {
    pub fn index_raw(&self) -> Ref<'_, Vec<u8>> {
        self.index_raw.borrow()
    }
}
impl Ubifs {
    pub fn master_1_raw(&self) -> Ref<'_, Vec<u8>> {
        self.master_1_raw.borrow()
    }
}
impl Ubifs {
    pub fn master_2_raw(&self) -> Ref<'_, Vec<u8>> {
        self.master_2_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Ubifs_Compression {

    /**
     * no compression
     */
    NoCompression,

    /**
     * LZO compression
     */
    Lzo,

    /**
     * zlib compression, stored as
     * [raw deflate](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/crypto/deflate.c#L125-L127)
     * data, i.e. without the zlib header and checksum
     */
    Zlib,

    /**
     * zstd compression
     */
    Zstd,
    Unknown(i64),
}

impl TryFrom<i64> for Ubifs_Compression {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ubifs_Compression> {
        match flag {
            0 => Ok(Ubifs_Compression::NoCompression),
            1 => Ok(Ubifs_Compression::Lzo),
            2 => Ok(Ubifs_Compression::Zlib),
            3 => Ok(Ubifs_Compression::Zstd),
            _ => Ok(Ubifs_Compression::Unknown(flag)),
        }
    }
}

impl From<&Ubifs_Compression> for i64 {
    fn from(v: &Ubifs_Compression) -> Self {
        match *v {
            Ubifs_Compression::NoCompression => 0,
            Ubifs_Compression::Lzo => 1,
            Ubifs_Compression::Zlib => 2,
            Ubifs_Compression::Zstd => 3,
            Ubifs_Compression::Unknown(v) => v
        }
    }
}

impl Default for Ubifs_Compression {
    fn default() -> Self { Ubifs_Compression::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ubifs_HashAlgos {
    Md4,
    Md5,
    Sha1,
    RipeMd160,
    Sha256,
    Sha384,
    Sha512,
    Sha224,
    RipeMd128,
    RipeMd256,
    RipeMd320,
    Wp256,
    Wp384,
    Wp512,
    Tgr128,
    Tgr160,
    Tgr192,
    Sm3256,
    Streebog256,
    Streebog512,
    Sha3256,
    Sha3384,
    Sha3512,
    Unknown(i64),
}

impl TryFrom<i64> for Ubifs_HashAlgos {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ubifs_HashAlgos> {
        match flag {
            0 => Ok(Ubifs_HashAlgos::Md4),
            1 => Ok(Ubifs_HashAlgos::Md5),
            2 => Ok(Ubifs_HashAlgos::Sha1),
            3 => Ok(Ubifs_HashAlgos::RipeMd160),
            4 => Ok(Ubifs_HashAlgos::Sha256),
            5 => Ok(Ubifs_HashAlgos::Sha384),
            6 => Ok(Ubifs_HashAlgos::Sha512),
            7 => Ok(Ubifs_HashAlgos::Sha224),
            8 => Ok(Ubifs_HashAlgos::RipeMd128),
            9 => Ok(Ubifs_HashAlgos::RipeMd256),
            10 => Ok(Ubifs_HashAlgos::RipeMd320),
            11 => Ok(Ubifs_HashAlgos::Wp256),
            12 => Ok(Ubifs_HashAlgos::Wp384),
            13 => Ok(Ubifs_HashAlgos::Wp512),
            14 => Ok(Ubifs_HashAlgos::Tgr128),
            15 => Ok(Ubifs_HashAlgos::Tgr160),
            16 => Ok(Ubifs_HashAlgos::Tgr192),
            17 => Ok(Ubifs_HashAlgos::Sm3256),
            18 => Ok(Ubifs_HashAlgos::Streebog256),
            19 => Ok(Ubifs_HashAlgos::Streebog512),
            20 => Ok(Ubifs_HashAlgos::Sha3256),
            21 => Ok(Ubifs_HashAlgos::Sha3384),
            22 => Ok(Ubifs_HashAlgos::Sha3512),
            _ => Ok(Ubifs_HashAlgos::Unknown(flag)),
        }
    }
}

impl From<&Ubifs_HashAlgos> for i64 {
    fn from(v: &Ubifs_HashAlgos) -> Self {
        match *v {
            Ubifs_HashAlgos::Md4 => 0,
            Ubifs_HashAlgos::Md5 => 1,
            Ubifs_HashAlgos::Sha1 => 2,
            Ubifs_HashAlgos::RipeMd160 => 3,
            Ubifs_HashAlgos::Sha256 => 4,
            Ubifs_HashAlgos::Sha384 => 5,
            Ubifs_HashAlgos::Sha512 => 6,
            Ubifs_HashAlgos::Sha224 => 7,
            Ubifs_HashAlgos::RipeMd128 => 8,
            Ubifs_HashAlgos::RipeMd256 => 9,
            Ubifs_HashAlgos::RipeMd320 => 10,
            Ubifs_HashAlgos::Wp256 => 11,
            Ubifs_HashAlgos::Wp384 => 12,
            Ubifs_HashAlgos::Wp512 => 13,
            Ubifs_HashAlgos::Tgr128 => 14,
            Ubifs_HashAlgos::Tgr160 => 15,
            Ubifs_HashAlgos::Tgr192 => 16,
            Ubifs_HashAlgos::Sm3256 => 17,
            Ubifs_HashAlgos::Streebog256 => 18,
            Ubifs_HashAlgos::Streebog512 => 19,
            Ubifs_HashAlgos::Sha3256 => 20,
            Ubifs_HashAlgos::Sha3384 => 21,
            Ubifs_HashAlgos::Sha3512 => 22,
            Ubifs_HashAlgos::Unknown(v) => v
        }
    }
}

impl Default for Ubifs_HashAlgos {
    fn default() -> Self { Ubifs_HashAlgos::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ubifs_Hashes {

    /**
     * R5 hash
     */
    R5,

    /**
     * test hash which just returns first 4 bytes of the name
     */
    TestHash,
    Unknown(i64),
}

impl TryFrom<i64> for Ubifs_Hashes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ubifs_Hashes> {
        match flag {
            0 => Ok(Ubifs_Hashes::R5),
            1 => Ok(Ubifs_Hashes::TestHash),
            _ => Ok(Ubifs_Hashes::Unknown(flag)),
        }
    }
}

impl From<&Ubifs_Hashes> for i64 {
    fn from(v: &Ubifs_Hashes) -> Self {
        match *v {
            Ubifs_Hashes::R5 => 0,
            Ubifs_Hashes::TestHash => 1,
            Ubifs_Hashes::Unknown(v) => v
        }
    }
}

impl Default for Ubifs_Hashes {
    fn default() -> Self { Ubifs_Hashes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ubifs_InodeTypes {

    /**
     * regular file
     */
    Regular,

    /**
     * directory
     */
    Directory,

    /**
     * soft link
     */
    Link,

    /**
     * block device node
     */
    BlockDevice,

    /**
     * character device node
     */
    CharacterDevice,

    /**
     * fifo
     */
    Fifo,

    /**
     * socket
     */
    Socket,
    Unknown(i64),
}

impl TryFrom<i64> for Ubifs_InodeTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ubifs_InodeTypes> {
        match flag {
            0 => Ok(Ubifs_InodeTypes::Regular),
            1 => Ok(Ubifs_InodeTypes::Directory),
            2 => Ok(Ubifs_InodeTypes::Link),
            3 => Ok(Ubifs_InodeTypes::BlockDevice),
            4 => Ok(Ubifs_InodeTypes::CharacterDevice),
            5 => Ok(Ubifs_InodeTypes::Fifo),
            6 => Ok(Ubifs_InodeTypes::Socket),
            _ => Ok(Ubifs_InodeTypes::Unknown(flag)),
        }
    }
}

impl From<&Ubifs_InodeTypes> for i64 {
    fn from(v: &Ubifs_InodeTypes) -> Self {
        match *v {
            Ubifs_InodeTypes::Regular => 0,
            Ubifs_InodeTypes::Directory => 1,
            Ubifs_InodeTypes::Link => 2,
            Ubifs_InodeTypes::BlockDevice => 3,
            Ubifs_InodeTypes::CharacterDevice => 4,
            Ubifs_InodeTypes::Fifo => 5,
            Ubifs_InodeTypes::Socket => 6,
            Ubifs_InodeTypes::Unknown(v) => v
        }
    }
}

impl Default for Ubifs_InodeTypes {
    fn default() -> Self { Ubifs_InodeTypes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ubifs_KeyFormats {

    /**
     * The simple key format uses 29 bits for storing UBIFS
     * block number and hash value.
     */
    Simple,
    Unknown(i64),
}

impl TryFrom<i64> for Ubifs_KeyFormats {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ubifs_KeyFormats> {
        match flag {
            0 => Ok(Ubifs_KeyFormats::Simple),
            _ => Ok(Ubifs_KeyFormats::Unknown(flag)),
        }
    }
}

impl From<&Ubifs_KeyFormats> for i64 {
    fn from(v: &Ubifs_KeyFormats) -> Self {
        match *v {
            Ubifs_KeyFormats::Simple => 0,
            Ubifs_KeyFormats::Unknown(v) => v
        }
    }
}

impl Default for Ubifs_KeyFormats {
    fn default() -> Self { Ubifs_KeyFormats::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ubifs_KeyTypes {

    /**
     * inode node key
     */
    Inode,

    /**
     * data node key
     */
    Data,

    /**
     * directory entry node key
     */
    Directory,

    /**
     * extended attribute node key
     */
    ExtendedAttribute,
    Unknown(i64),
}

impl TryFrom<i64> for Ubifs_KeyTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ubifs_KeyTypes> {
        match flag {
            0 => Ok(Ubifs_KeyTypes::Inode),
            1 => Ok(Ubifs_KeyTypes::Data),
            2 => Ok(Ubifs_KeyTypes::Directory),
            3 => Ok(Ubifs_KeyTypes::ExtendedAttribute),
            _ => Ok(Ubifs_KeyTypes::Unknown(flag)),
        }
    }
}

impl From<&Ubifs_KeyTypes> for i64 {
    fn from(v: &Ubifs_KeyTypes) -> Self {
        match *v {
            Ubifs_KeyTypes::Inode => 0,
            Ubifs_KeyTypes::Data => 1,
            Ubifs_KeyTypes::Directory => 2,
            Ubifs_KeyTypes::ExtendedAttribute => 3,
            Ubifs_KeyTypes::Unknown(v) => v
        }
    }
}

impl Default for Ubifs_KeyTypes {
    fn default() -> Self { Ubifs_KeyTypes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ubifs_NodeGroupTypes {

    /**
     * this node is not part of a group
     */
    NoNodeGroup,

    /**
     * this node is a part of a group
     */
    InNodeGroup,

    /**
     * this node is the last in a group
     */
    LastOfNodeGroup,
    Unknown(i64),
}

impl TryFrom<i64> for Ubifs_NodeGroupTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ubifs_NodeGroupTypes> {
        match flag {
            0 => Ok(Ubifs_NodeGroupTypes::NoNodeGroup),
            1 => Ok(Ubifs_NodeGroupTypes::InNodeGroup),
            2 => Ok(Ubifs_NodeGroupTypes::LastOfNodeGroup),
            _ => Ok(Ubifs_NodeGroupTypes::Unknown(flag)),
        }
    }
}

impl From<&Ubifs_NodeGroupTypes> for i64 {
    fn from(v: &Ubifs_NodeGroupTypes) -> Self {
        match *v {
            Ubifs_NodeGroupTypes::NoNodeGroup => 0,
            Ubifs_NodeGroupTypes::InNodeGroup => 1,
            Ubifs_NodeGroupTypes::LastOfNodeGroup => 2,
            Ubifs_NodeGroupTypes::Unknown(v) => v
        }
    }
}

impl Default for Ubifs_NodeGroupTypes {
    fn default() -> Self { Ubifs_NodeGroupTypes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ubifs_NodeTypes {

    /**
     * inode node
     */
    Inode,

    /**
     * data node
     */
    Data,

    /**
     * directory entry node
     */
    Directory,

    /**
     * extended attribute node
     */
    ExtendedAttribute,

    /**
     * truncation node
     */
    Truncation,

    /**
     * padding node
     */
    Padding,

    /**
     * superblock node
     */
    Superblock,

    /**
     * master node
     */
    Master,

    /**
     * LEB reference node
     */
    Reference,

    /**
     * index node
     */
    Index,

    /**
     * commit start node
     */
    CommitStart,

    /**
     * orphan node
     */
    Orphan,

    /**
     * authentication node
     */
    Authentication,

    /**
     * signature node
     */
    Signature,
    Unknown(i64),
}

impl TryFrom<i64> for Ubifs_NodeTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ubifs_NodeTypes> {
        match flag {
            0 => Ok(Ubifs_NodeTypes::Inode),
            1 => Ok(Ubifs_NodeTypes::Data),
            2 => Ok(Ubifs_NodeTypes::Directory),
            3 => Ok(Ubifs_NodeTypes::ExtendedAttribute),
            4 => Ok(Ubifs_NodeTypes::Truncation),
            5 => Ok(Ubifs_NodeTypes::Padding),
            6 => Ok(Ubifs_NodeTypes::Superblock),
            7 => Ok(Ubifs_NodeTypes::Master),
            8 => Ok(Ubifs_NodeTypes::Reference),
            9 => Ok(Ubifs_NodeTypes::Index),
            10 => Ok(Ubifs_NodeTypes::CommitStart),
            11 => Ok(Ubifs_NodeTypes::Orphan),
            12 => Ok(Ubifs_NodeTypes::Authentication),
            13 => Ok(Ubifs_NodeTypes::Signature),
            _ => Ok(Ubifs_NodeTypes::Unknown(flag)),
        }
    }
}

impl From<&Ubifs_NodeTypes> for i64 {
    fn from(v: &Ubifs_NodeTypes) -> Self {
        match *v {
            Ubifs_NodeTypes::Inode => 0,
            Ubifs_NodeTypes::Data => 1,
            Ubifs_NodeTypes::Directory => 2,
            Ubifs_NodeTypes::ExtendedAttribute => 3,
            Ubifs_NodeTypes::Truncation => 4,
            Ubifs_NodeTypes::Padding => 5,
            Ubifs_NodeTypes::Superblock => 6,
            Ubifs_NodeTypes::Master => 7,
            Ubifs_NodeTypes::Reference => 8,
            Ubifs_NodeTypes::Index => 9,
            Ubifs_NodeTypes::CommitStart => 10,
            Ubifs_NodeTypes::Orphan => 11,
            Ubifs_NodeTypes::Authentication => 12,
            Ubifs_NodeTypes::Signature => 13,
            Ubifs_NodeTypes::Unknown(v) => v
        }
    }
}

impl Default for Ubifs_NodeTypes {
    fn default() -> Self { Ubifs_NodeTypes::Unknown(0) }
}


/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L774-L782 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_AuthenticationHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_Block>,
    pub _self: SharedType<Self>,
    hmac: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ubifs_AuthenticationHeader {
    type Root = Ubifs;
    type Parent = Ubifs_Block;

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
        *self_rc.hmac.borrow_mut() = _io.read_bytes(*_r.superblock()?.node_header().len_hash()? as usize)?.into();
        Ok(())
    }
}
impl Ubifs_AuthenticationHeader {
}

/**
 * HMAC authenticating the journal before this node, keyed with the
 * file system's authentication key (which is not stored on flash).
 * The kernel [uses](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L275-L276)
 * HMAC with the hash algorithm in `<superblock_header>.hash_algo`
 * ([checked when mounting](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L575-L580)),
 * so `hmac` is as long as its digest, e.g. 32 bytes for SHA-256.
 */
impl Ubifs_AuthenticationHeader {
    pub fn hmac(&self) -> Ref<'_, Vec<u8>> {
        self.hmac.borrow()
    }
}
impl Ubifs_AuthenticationHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ubifs_Block {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_Branch>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Ubifs_CommonHeader>>,
    node_header: RefCell<Option<Ubifs_Block_NodeHeader>>,
    _io: RefCell<BytesReader>,
    node_header_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Ubifs_Block_NodeHeader {
    Ubifs_OrphanHeader(OptRc<Ubifs_OrphanHeader>),
    Ubifs_AuthenticationHeader(OptRc<Ubifs_AuthenticationHeader>),
    Ubifs_CommitStartHeader(OptRc<Ubifs_CommitStartHeader>),
    Ubifs_SuperblockHeader(OptRc<Ubifs_SuperblockHeader>),
    Ubifs_IndexHeader(OptRc<Ubifs_IndexHeader>),
    Ubifs_PaddingHeader(OptRc<Ubifs_PaddingHeader>),
    Ubifs_SignatureHeader(OptRc<Ubifs_SignatureHeader>),
    Ubifs_MasterHeader(OptRc<Ubifs_MasterHeader>),
    Ubifs_TruncationHeader(OptRc<Ubifs_TruncationHeader>),
    Ubifs_DirectoryHeader(OptRc<Ubifs_DirectoryHeader>),
    Ubifs_InodeHeader(OptRc<Ubifs_InodeHeader>),
    Ubifs_ReferenceHeader(OptRc<Ubifs_ReferenceHeader>),
    Ubifs_DataHeader(OptRc<Ubifs_DataHeader>),
    Bytes(Vec<u8>),
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_OrphanHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_OrphanHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_OrphanHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_OrphanHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_OrphanHeader>) -> Self {
        Self::Ubifs_OrphanHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_AuthenticationHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_AuthenticationHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_AuthenticationHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_AuthenticationHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_AuthenticationHeader>) -> Self {
        Self::Ubifs_AuthenticationHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_CommitStartHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_CommitStartHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_CommitStartHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_CommitStartHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_CommitStartHeader>) -> Self {
        Self::Ubifs_CommitStartHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_SuperblockHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_SuperblockHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_SuperblockHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_SuperblockHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_SuperblockHeader>) -> Self {
        Self::Ubifs_SuperblockHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_IndexHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_IndexHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_IndexHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_IndexHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_IndexHeader>) -> Self {
        Self::Ubifs_IndexHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_PaddingHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_PaddingHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_PaddingHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_PaddingHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_PaddingHeader>) -> Self {
        Self::Ubifs_PaddingHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_SignatureHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_SignatureHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_SignatureHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_SignatureHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_SignatureHeader>) -> Self {
        Self::Ubifs_SignatureHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_MasterHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_MasterHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_MasterHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_MasterHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_MasterHeader>) -> Self {
        Self::Ubifs_MasterHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_TruncationHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_TruncationHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_TruncationHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_TruncationHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_TruncationHeader>) -> Self {
        Self::Ubifs_TruncationHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_DirectoryHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_DirectoryHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_DirectoryHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_DirectoryHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_DirectoryHeader>) -> Self {
        Self::Ubifs_DirectoryHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_InodeHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_InodeHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_InodeHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_InodeHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_InodeHeader>) -> Self {
        Self::Ubifs_InodeHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_ReferenceHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_ReferenceHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_ReferenceHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_ReferenceHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_ReferenceHeader>) -> Self {
        Self::Ubifs_ReferenceHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for OptRc<Ubifs_DataHeader> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Ubifs_DataHeader(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Ubifs_DataHeader, got {:?}", v)
    }
}
impl From<OptRc<Ubifs_DataHeader>> for Ubifs_Block_NodeHeader {
    fn from(v: OptRc<Ubifs_DataHeader>) -> Self {
        Self::Ubifs_DataHeader(v)
    }
}
impl From<&Ubifs_Block_NodeHeader> for Vec<u8> {
    fn from(v: &Ubifs_Block_NodeHeader) -> Self {
        if let Ubifs_Block_NodeHeader::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Ubifs_Block_NodeHeader::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Ubifs_Block_NodeHeader {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for Ubifs_Block {
    type Root = Ubifs;
    type Parent = Ubifs_Branch;

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
        let t = Self::read_into::<_, Ubifs_CommonHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.header.borrow_mut() = t;
        match *self_rc.header().node_type() {
            Ubifs_NodeTypes::Authentication => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_AuthenticationHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::CommitStart => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_CommitStartHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::Data => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_DataHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::Directory => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_DirectoryHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::ExtendedAttribute => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_DirectoryHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::Index => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_IndexHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::Inode => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_InodeHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::Master => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_MasterHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::Orphan => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_OrphanHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::Padding => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_PaddingHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::Reference => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_ReferenceHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::Signature => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_SignatureHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::Superblock => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_SuperblockHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            Ubifs_NodeTypes::Truncation => {
                *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
                let node_header_raw = self_rc.node_header_raw.borrow();
                let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
                let t = Self::read_into::<BytesReader, Ubifs_TruncationHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.node_header.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.node_header.borrow_mut() = Some(_io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Ubifs_Block {
}
impl Ubifs_Block {
    pub fn header(&self) -> Ref<'_, OptRc<Ubifs_CommonHeader>> {
        self.header.borrow()
    }
}
impl Ubifs_Block {
    pub fn node_header(&self) -> Ref<'_, Option<Ubifs_Block_NodeHeader>> {
        self.node_header.borrow()
    }
}
impl Ubifs_Block {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ubifs_Block {
    pub fn node_header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.node_header_raw.borrow()
    }
}

/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L801-L817 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_Branch {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_IndexHeader>,
    pub _self: SharedType<Self>,
    target_leb: RefCell<u32>,
    ofs_target: RefCell<u32>,
    len_target: RefCell<u32>,
    key: RefCell<OptRc<Ubifs_Key>>,
    hash: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    key_raw: RefCell<Vec<u8>>,
    target_raw: RefCell<Vec<u8>>,
    f_target: Cell<bool>,
    target: RefCell<OptRc<Ubifs_Block>>,
}
impl KStruct for Ubifs_Branch {
    type Root = Ubifs;
    type Parent = Ubifs_IndexHeader;

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
        *self_rc.target_leb.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_target.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_target.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.key_raw.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        let key_raw = self_rc.key_raw.borrow();
        let _t_key_raw_io = BytesReader::from(key_raw.clone());
        let t = Self::read_into::<BytesReader, Ubifs_Key>(&_t_key_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.key.borrow_mut() = t;
        *self_rc.hash.borrow_mut() = _io.read_bytes(*_r.superblock()?.node_header().len_hash()? as usize)?.into();
        Ok(())
    }
}
impl Ubifs_Branch {
    pub fn target(
        &self
    ) -> KResult<Ref<'_, OptRc<Ubifs_Block>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_target.get() {
            return Ok(self.target.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(((((*_r.superblock()?.node_header().leb_size() as u32) * (*self.target_leb() as u32)) as i32) + (*self.ofs_target() as i32)) as usize)?;
        *self.target_raw.borrow_mut() = io.read_bytes(*self.len_target() as usize)?.into();
        let target_raw = self.target_raw.borrow();
        let _t_target_raw_io = BytesReader::from(target_raw.clone());
        let t = Self::read_into::<BytesReader, Ubifs_Block>(&_t_target_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.target.borrow_mut() = t;
        let _tmpa = *self.target()?;
        if !( ((*_tmpa.header().len_full_node() == *self.len_target()) && (if ((*_prc.as_ref().unwrap().level() as u16) != (0 as u16)) { *_tmpa.header().node_type() == Ubifs_NodeTypes::Index } else { i64::from(&*_tmpa.header().node_type()) == i64::from(&*self.key().type()) })) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/branch/instances/target".to_string() }));
        }
        io.seek(_pos)?;
        Ok(self.target.borrow())
    }
}

/**
 * LEB number of the target node
 */
impl Ubifs_Branch {
    pub fn target_leb(&self) -> Ref<'_, u32> {
        self.target_leb.borrow()
    }
}

/**
 * offset within the LEB `target_leb`
 */
impl Ubifs_Branch {
    pub fn ofs_target(&self) -> Ref<'_, u32> {
        self.ofs_target.borrow()
    }
}

/**
 * target node length
 */
impl Ubifs_Branch {
    pub fn len_target(&self) -> Ref<'_, u32> {
        self.len_target.borrow()
    }
}
impl Ubifs_Branch {
    pub fn key(&self) -> Ref<'_, OptRc<Ubifs_Key>> {
        self.key.borrow()
    }
}

/**
 * Hash of the target node. It is empty in a file system without
 * authentication (see `<superblock_header>.len_hash`).
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1642-L1654 Git tag "v7.2"
 */
impl Ubifs_Branch {
    pub fn hash(&self) -> Ref<'_, Vec<u8>> {
        self.hash.borrow()
    }
}
impl Ubifs_Branch {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ubifs_Branch {
    pub fn key_raw(&self) -> Ref<'_, Vec<u8>> {
        self.key_raw.borrow()
    }
}
impl Ubifs_Branch {
    pub fn target_raw(&self) -> Ref<'_, Vec<u8>> {
        self.target_raw.borrow()
    }
}

/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L833-L841 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_CommitStartHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_Block>,
    pub _self: SharedType<Self>,
    commit_number: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ubifs_CommitStartHeader {
    type Root = Ubifs;
    type Parent = Ubifs_Block;

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
        *self_rc.commit_number.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl Ubifs_CommitStartHeader {
}

/**
 * commit number
 */
impl Ubifs_CommitStartHeader {
    pub fn commit_number(&self) -> Ref<'_, u64> {
        self.commit_number.borrow()
    }
}
impl Ubifs_CommitStartHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L443-L464 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_CommonHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    magic: RefCell<u32>,
    crc: RefCell<u32>,
    sequence_number: RefCell<u64>,
    len_full_node: RefCell<u32>,
    node_type: RefCell<Ubifs_NodeTypes>,
    group_type: RefCell<Ubifs_NodeGroupTypes>,
    padding: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ubifs_CommonHeader {
    type Root = Ubifs;
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
        *self_rc.magic.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.magic() as i32) == (101718065 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/common_header/seq/0".to_string() }));
        }
        *self_rc.crc.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.sequence_number.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_full_node.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.node_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.group_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.padding.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.padding() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/common_header/seq/6".to_string() }));
        }
        Ok(())
    }
}
impl Ubifs_CommonHeader {
}

/**
 * UBIFS node magic number (`UBIFS_NODE_MAGIC`)
 */
impl Ubifs_CommonHeader {
    pub fn magic(&self) -> Ref<'_, u32> {
        self.magic.borrow()
    }
}

/**
 * CRC-32 checksum of the whole node except `magic` and `crc` (i.e.
 * starting at offset 8). It is computed with an initial register value
 * of 0xFFFFFFFF and no final XOR, so it is the bitwise NOT of a standard
 * CRC-32 (e.g.
 * [`zlib.crc32()`](https://docs.python.org/3/library/zlib.html#zlib.crc32)
 * in Python).
 */
impl Ubifs_CommonHeader {
    pub fn crc(&self) -> Ref<'_, u32> {
        self.crc.borrow()
    }
}

/**
 * sequence number
 */
impl Ubifs_CommonHeader {
    pub fn sequence_number(&self) -> Ref<'_, u64> {
        self.sequence_number.borrow()
    }
}

/**
 * full node length
 */
impl Ubifs_CommonHeader {
    pub fn len_full_node(&self) -> Ref<'_, u32> {
        self.len_full_node.borrow()
    }
}

/**
 * node type
 */
impl Ubifs_CommonHeader {
    pub fn node_type(&self) -> Ref<'_, Ubifs_NodeTypes> {
        self.node_type.borrow()
    }
}

/**
 * node group type
 */
impl Ubifs_CommonHeader {
    pub fn group_type(&self) -> Ref<'_, Ubifs_NodeGroupTypes> {
        self.group_type.borrow()
    }
}

/**
 * reserved for future, zeroes
 */
impl Ubifs_CommonHeader {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl Ubifs_CommonHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L567-L584 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_DataHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_Block>,
    pub _self: SharedType<Self>,
    key: RefCell<OptRc<Ubifs_Key>>,
    len_uncompressed: RefCell<u32>,
    compression: RefCell<Ubifs_Compression>,
    len_compressed_data: RefCell<u16>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    key_raw: RefCell<Vec<u8>>,
}
impl KStruct for Ubifs_DataHeader {
    type Root = Ubifs;
    type Parent = Ubifs_Block;

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
        *self_rc.key_raw.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        let key_raw = self_rc.key_raw.borrow();
        let _t_key_raw_io = BytesReader::from(key_raw.clone());
        let t = Self::read_into::<BytesReader, Ubifs_Key>(&_t_key_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.key.borrow_mut() = t;
        *self_rc.len_uncompressed.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.len_uncompressed() as u32) >= (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/data_header/seq/1".to_string() }));
        }
        if !(((*self_rc.len_uncompressed() as i32) <= (4096 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/data_header/seq/1".to_string() }));
        }
        *self_rc.compression.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.len_compressed_data.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Ubifs_DataHeader {
}

/**
 * node key
 */
impl Ubifs_DataHeader {
    pub fn key(&self) -> Ref<'_, OptRc<Ubifs_Key>> {
        self.key.borrow()
    }
}

/**
 * uncompressed data size in bytes
 */
impl Ubifs_DataHeader {
    pub fn len_uncompressed(&self) -> Ref<'_, u32> {
        self.len_uncompressed.borrow()
    }
}

/**
 * compression type (`compression::no_compression`, `compression::lzo`,
 * etc.)
 */
impl Ubifs_DataHeader {
    pub fn compression(&self) -> Ref<'_, Ubifs_Compression> {
        self.compression.borrow()
    }
}

/**
 * compressed data size in bytes, only valid when data is encrypted
 */
impl Ubifs_DataHeader {
    pub fn len_compressed_data(&self) -> Ref<'_, u16> {
        self.len_compressed_data.borrow()
    }
}

/**
 * One block (up to 4096 bytes) of the file, block number `key.value`,
 * compressed as given by `compression`. Blocks missing from the index
 * are holes (zeros). In an encrypted inode, the compressed data is
 * padded
 * and [encrypted](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/crypto.c#L38-L59),
 * and `len_compressed_data` is the length of the compressed data
 * before padding.
 */
impl Ubifs_DataHeader {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Ubifs_DataHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ubifs_DataHeader {
    pub fn key_raw(&self) -> Ref<'_, Vec<u8>> {
        self.key_raw.borrow()
    }
}

/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L541-L565 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_DirectoryHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_Block>,
    pub _self: SharedType<Self>,
    key: RefCell<OptRc<Ubifs_Key>>,
    inode_number: RefCell<u64>,
    padding1: RefCell<Vec<u8>>,
    inode_type: RefCell<Ubifs_InodeTypes>,
    len_name: RefCell<u16>,
    cookie: RefCell<u32>,
    name: RefCell<Vec<u8>>,
    name_terminator: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    key_raw: RefCell<Vec<u8>>,
}
impl KStruct for Ubifs_DirectoryHeader {
    type Root = Ubifs;
    type Parent = Ubifs_Block;

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
        *self_rc.key_raw.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        let key_raw = self_rc.key_raw.borrow();
        let _t_key_raw_io = BytesReader::from(key_raw.clone());
        let t = Self::read_into::<BytesReader, Ubifs_Key>(&_t_key_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.key.borrow_mut() = t;
        let _tmpa = *self_rc.key();
        if !( ((*_tmpa.type() == Ubifs_KeyTypes::Directory) || (*_tmpa.type() == Ubifs_KeyTypes::ExtendedAttribute)) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/directory_header/seq/0".to_string() }));
        }
        *self_rc.inode_number.borrow_mut() = _io.read_u8le()?.into();
        if !(((*self_rc.inode_number() as i32) <= (4294967295 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/directory_header/seq/1".to_string() }));
        }
        *self_rc.padding1.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.padding1() == vec![0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/directory_header/seq/2".to_string() }));
        }
        *self_rc.inode_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.len_name.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.cookie.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.name.borrow_mut() = _io.read_bytes(*self_rc.len_name() as usize)?.into();
        *self_rc.name_terminator.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.name_terminator() == vec![0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/directory_header/seq/7".to_string() }));
        }
        Ok(())
    }
}
impl Ubifs_DirectoryHeader {
}

/**
 * node key
 */
impl Ubifs_DirectoryHeader {
    pub fn key(&self) -> Ref<'_, OptRc<Ubifs_Key>> {
        self.key.borrow()
    }
}

/**
 * target inode number
 */
impl Ubifs_DirectoryHeader {
    pub fn inode_number(&self) -> Ref<'_, u64> {
        self.inode_number.borrow()
    }
}

/**
 * reserved for future, zeroes
 */
impl Ubifs_DirectoryHeader {
    pub fn padding1(&self) -> Ref<'_, Vec<u8>> {
        self.padding1.borrow()
    }
}

/**
 * type of the target inode (`inode_types::regular`,
 * `inode_types::directory`, etc.)
 */
impl Ubifs_DirectoryHeader {
    pub fn inode_type(&self) -> Ref<'_, Ubifs_InodeTypes> {
        self.inode_type.borrow()
    }
}

/**
 * name length
 */
impl Ubifs_DirectoryHeader {
    pub fn len_name(&self) -> Ref<'_, u16> {
        self.len_name.borrow()
    }
}

/**
 * A 32bits random number, used to construct a 64bits identifier.
 */
impl Ubifs_DirectoryHeader {
    pub fn cookie(&self) -> Ref<'_, u32> {
        self.cookie.borrow()
    }
}

/**
 * Name of the entry.
 * 
 * It is kept as bytes rather than decoded as a string: names in a
 * directory whose inode has `<inode_header>.encrypted` set are
 * ciphertext, which may contain any bytes, including zeros.
 * 
 * Unencrypted names, including all names of extended attributes, contain
 * no zero bytes, because Linux can't create such names. They aren't
 * necessarily valid UTF-8, though, as UBIFS doesn't enforce any encoding
 * of file names. A zero byte in such a name means that the image was
 * crafted, since an accidental corruption would most likely fail the
 * node's
 * [CRC check](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/io.c#L287-L293).
 */
impl Ubifs_DirectoryHeader {
    pub fn name(&self) -> Ref<'_, Vec<u8>> {
        self.name.borrow()
    }
}

/**
 * Zero byte after `name`, [not counted in
 * `len_name`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/replay.c#L487-L489).
 */
impl Ubifs_DirectoryHeader {
    pub fn name_terminator(&self) -> Ref<'_, Vec<u8>> {
        self.name_terminator.borrow()
    }
}
impl Ubifs_DirectoryHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ubifs_DirectoryHeader {
    pub fn key_raw(&self) -> Ref<'_, Vec<u8>> {
        self.key_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ubifs_Dummy {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ubifs_Dummy {
    type Root = Ubifs;
    type Parent = Ubifs;

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
impl Ubifs_Dummy {
}
impl Ubifs_Dummy {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ubifs_IndexBlock {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Ubifs_CommonHeader>>,
    node_header: RefCell<OptRc<Ubifs_IndexHeader>>,
    _io: RefCell<BytesReader>,
    node_header_raw: RefCell<Vec<u8>>,
}
impl KStruct for Ubifs_IndexBlock {
    type Root = Ubifs;
    type Parent = Ubifs;

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
        let t = Self::read_into::<_, Ubifs_CommonHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.header.borrow_mut() = t;
        let _tmpa = *self_rc.header();
        if !(*_tmpa.node_type() == Ubifs_NodeTypes::Index) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/index_block/seq/0".to_string() }));
        }
        *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
        let node_header_raw = self_rc.node_header_raw.borrow();
        let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
        let t = Self::read_into::<BytesReader, Ubifs_IndexHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.node_header.borrow_mut() = Some(t);
        Ok(())
    }
}
impl Ubifs_IndexBlock {
}
impl Ubifs_IndexBlock {
    pub fn header(&self) -> Ref<'_, OptRc<Ubifs_CommonHeader>> {
        self.header.borrow()
    }
}
impl Ubifs_IndexBlock {
    pub fn node_header(&self) -> Ref<'_, OptRc<Ubifs_IndexHeader>> {
        self.node_header.borrow()
    }
}
impl Ubifs_IndexBlock {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ubifs_IndexBlock {
    pub fn node_header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.node_header_raw.borrow()
    }
}

/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L819-L831 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_IndexHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    num_branches: RefCell<u16>,
    level: RefCell<u16>,
    branches: RefCell<Vec<OptRc<Ubifs_Branch>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ubifs_IndexHeader {
    type Root = Ubifs;
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
        *self_rc.num_branches.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.level.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.branches.borrow_mut() = Vec::new();
        let l_branches = *self_rc.num_branches();
        for _i in 0..l_branches {
            let t = Self::read_into::<_, Ubifs_Branch>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.branches.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Ubifs_IndexHeader {
}

/**
 * number of child index nodes
 */
impl Ubifs_IndexHeader {
    pub fn num_branches(&self) -> Ref<'_, u16> {
        self.num_branches.borrow()
    }
}

/**
 * tree level
 */
impl Ubifs_IndexHeader {
    pub fn level(&self) -> Ref<'_, u16> {
        self.level.borrow()
    }
}

/**
 * LEB number / offset / length / key branches
 * 
 * All branches have the same size, which is 20 bytes (with the simple
 * key format) plus the hash length in an authenticated file system.
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/misc.h#L186-L205 Git tag "v7.2"
 */
impl Ubifs_IndexHeader {
    pub fn branches(&self) -> Ref<'_, Vec<OptRc<Ubifs_Branch>>> {
        self.branches.borrow()
    }
}
impl Ubifs_IndexHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L480-L539 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_InodeHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_Block>,
    pub _self: SharedType<Self>,
    key: RefCell<OptRc<Ubifs_Key>>,
    creation_sequence_number: RefCell<u64>,
    len_uncompressed: RefCell<u64>,
    atime_sec: RefCell<u64>,
    ctime_sec: RefCell<u64>,
    mtime_sec: RefCell<u64>,
    atime_nsec: RefCell<u32>,
    ctime_nsec: RefCell<u32>,
    mtime_nsec: RefCell<u32>,
    num_links: RefCell<u32>,
    uid: RefCell<u32>,
    gid: RefCell<u32>,
    mode: RefCell<u32>,
    flags: RefCell<u32>,
    len_data: RefCell<u32>,
    num_xattrs: RefCell<u32>,
    xattr_size: RefCell<u32>,
    padding1: RefCell<Vec<u8>>,
    xattr_names: RefCell<u32>,
    compression: RefCell<Ubifs_Compression>,
    padding2: RefCell<Vec<u8>>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    key_raw: RefCell<Vec<u8>>,
    f_append: Cell<bool>,
    append: RefCell<bool>,
    f_compressed: Cell<bool>,
    compressed: RefCell<bool>,
    f_dirsync: Cell<bool>,
    dirsync: RefCell<bool>,
    f_encrypted: Cell<bool>,
    encrypted: RefCell<bool>,
    f_immutable: Cell<bool>,
    immutable: RefCell<bool>,
    f_is_block_device: Cell<bool>,
    is_block_device: RefCell<bool>,
    f_is_character_device: Cell<bool>,
    is_character_device: RefCell<bool>,
    f_is_dir: Cell<bool>,
    is_dir: RefCell<bool>,
    f_is_fifo: Cell<bool>,
    is_fifo: RefCell<bool>,
    f_is_link: Cell<bool>,
    is_link: RefCell<bool>,
    f_is_regular: Cell<bool>,
    is_regular: RefCell<bool>,
    f_is_socket: Cell<bool>,
    is_socket: RefCell<bool>,
    f_synchronous: Cell<bool>,
    synchronous: RefCell<bool>,
    f_xattr: Cell<bool>,
    xattr: RefCell<bool>,
}
impl KStruct for Ubifs_InodeHeader {
    type Root = Ubifs;
    type Parent = Ubifs_Block;

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
        *self_rc.key_raw.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        let key_raw = self_rc.key_raw.borrow();
        let _t_key_raw_io = BytesReader::from(key_raw.clone());
        let t = Self::read_into::<BytesReader, Ubifs_Key>(&_t_key_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.key.borrow_mut() = t;
        *self_rc.creation_sequence_number.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_uncompressed.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.atime_sec.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ctime_sec.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.mtime_sec.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.atime_nsec.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ctime_nsec.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.mtime_nsec.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_links.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.uid.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.gid.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.mode.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_xattrs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.xattr_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.padding1.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.padding1() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/inode_header/seq/17".to_string() }));
        }
        *self_rc.xattr_names.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.compression.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.padding2.borrow_mut() = _io.read_bytes(26 as usize)?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.len_data() as usize)?.into();
        Ok(())
    }
}
impl Ubifs_InodeHeader {

    /**
     * writes to the inode may only append data
     */
    pub fn append(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_append.get() {
            return Ok(self.append.borrow());
        }
        self.f_append.set(true);
        *self.append.borrow_mut() = (((((*self.flags() as u32) & (8 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.append.borrow())
    }

    /**
     * use compression for this inode
     */
    pub fn compressed(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_compressed.get() {
            return Ok(self.compressed.borrow());
        }
        self.f_compressed.set(true);
        *self.compressed.borrow_mut() = (((((*self.flags() as u32) & (1 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.compressed.borrow())
    }

    /**
     * I/O on this directory inode has to be synchronous
     */
    pub fn dirsync(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_dirsync.get() {
            return Ok(self.dirsync.borrow());
        }
        self.f_dirsync.set(true);
        *self.dirsync.borrow_mut() = (((((*self.flags() as u32) & (16 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.dirsync.borrow())
    }

    /**
     * use encryption for this inode
     */
    pub fn encrypted(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_encrypted.get() {
            return Ok(self.encrypted.borrow());
        }
        self.f_encrypted.set(true);
        *self.encrypted.borrow_mut() = (((((*self.flags() as u32) & (64 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.encrypted.borrow())
    }

    /**
     * inode is immutable
     */
    pub fn immutable(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_immutable.get() {
            return Ok(self.immutable.borrow());
        }
        self.f_immutable.set(true);
        *self.immutable.borrow_mut() = (((((*self.flags() as u32) & (4 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.immutable.borrow())
    }
    pub fn is_block_device(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_block_device.get() {
            return Ok(self.is_block_device.borrow());
        }
        self.f_is_block_device.set(true);
        *self.is_block_device.borrow_mut() = (((*self.mode() as i32) & (61440 as i32)) == 24576) as bool;
        Ok(self.is_block_device.borrow())
    }
    pub fn is_character_device(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_character_device.get() {
            return Ok(self.is_character_device.borrow());
        }
        self.f_is_character_device.set(true);
        *self.is_character_device.borrow_mut() = (((*self.mode() as i32) & (61440 as i32)) == 8192) as bool;
        Ok(self.is_character_device.borrow())
    }
    pub fn is_dir(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_dir.get() {
            return Ok(self.is_dir.borrow());
        }
        self.f_is_dir.set(true);
        *self.is_dir.borrow_mut() = (((*self.mode() as i32) & (61440 as i32)) == 16384) as bool;
        Ok(self.is_dir.borrow())
    }
    pub fn is_fifo(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_fifo.get() {
            return Ok(self.is_fifo.borrow());
        }
        self.f_is_fifo.set(true);
        *self.is_fifo.borrow_mut() = (((*self.mode() as i32) & (61440 as i32)) == 4096) as bool;
        Ok(self.is_fifo.borrow())
    }
    pub fn is_link(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_link.get() {
            return Ok(self.is_link.borrow());
        }
        self.f_is_link.set(true);
        *self.is_link.borrow_mut() = (((*self.mode() as i32) & (61440 as i32)) == 40960) as bool;
        Ok(self.is_link.borrow())
    }
    pub fn is_regular(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_regular.get() {
            return Ok(self.is_regular.borrow());
        }
        self.f_is_regular.set(true);
        *self.is_regular.borrow_mut() = (((*self.mode() as i32) & (61440 as i32)) == 32768) as bool;
        Ok(self.is_regular.borrow())
    }
    pub fn is_socket(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_socket.get() {
            return Ok(self.is_socket.borrow());
        }
        self.f_is_socket.set(true);
        *self.is_socket.borrow_mut() = (((*self.mode() as i32) & (61440 as i32)) == 49152) as bool;
        Ok(self.is_socket.borrow())
    }

    /**
     * I/O on this inode has to be synchronous
     */
    pub fn synchronous(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_synchronous.get() {
            return Ok(self.synchronous.borrow());
        }
        self.f_synchronous.set(true);
        *self.synchronous.borrow_mut() = (((((*self.flags() as u32) & (2 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.synchronous.borrow())
    }

    /**
     * this inode is the inode for an extended attribute value
     */
    pub fn xattr(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_xattr.get() {
            return Ok(self.xattr.borrow());
        }
        self.f_xattr.set(true);
        *self.xattr.borrow_mut() = (((((*self.flags() as u32) & (32 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.xattr.borrow())
    }
}

/**
 * node key
 */
impl Ubifs_InodeHeader {
    pub fn key(&self) -> Ref<'_, OptRc<Ubifs_Key>> {
        self.key.borrow()
    }
}

/**
 * sequence number at time of creation
 */
impl Ubifs_InodeHeader {
    pub fn creation_sequence_number(&self) -> Ref<'_, u64> {
        self.creation_sequence_number.borrow()
    }
}

/**
 * inode size in bytes (amount of uncompressed data)
 */
impl Ubifs_InodeHeader {
    pub fn len_uncompressed(&self) -> Ref<'_, u64> {
        self.len_uncompressed.borrow()
    }
}

/**
 * access time seconds
 */
impl Ubifs_InodeHeader {
    pub fn atime_sec(&self) -> Ref<'_, u64> {
        self.atime_sec.borrow()
    }
}

/**
 * status change time seconds
 */
impl Ubifs_InodeHeader {
    pub fn ctime_sec(&self) -> Ref<'_, u64> {
        self.ctime_sec.borrow()
    }
}

/**
 * modification time seconds
 */
impl Ubifs_InodeHeader {
    pub fn mtime_sec(&self) -> Ref<'_, u64> {
        self.mtime_sec.borrow()
    }
}

/**
 * access time nanoseconds
 */
impl Ubifs_InodeHeader {
    pub fn atime_nsec(&self) -> Ref<'_, u32> {
        self.atime_nsec.borrow()
    }
}

/**
 * status change time nanoseconds
 */
impl Ubifs_InodeHeader {
    pub fn ctime_nsec(&self) -> Ref<'_, u32> {
        self.ctime_nsec.borrow()
    }
}

/**
 * modification time nanoseconds
 */
impl Ubifs_InodeHeader {
    pub fn mtime_nsec(&self) -> Ref<'_, u32> {
        self.mtime_nsec.borrow()
    }
}

/**
 * number of hard links
 */
impl Ubifs_InodeHeader {
    pub fn num_links(&self) -> Ref<'_, u32> {
        self.num_links.borrow()
    }
}

/**
 * owner ID
 */
impl Ubifs_InodeHeader {
    pub fn uid(&self) -> Ref<'_, u32> {
        self.uid.borrow()
    }
}

/**
 * group ID
 */
impl Ubifs_InodeHeader {
    pub fn gid(&self) -> Ref<'_, u32> {
        self.gid.borrow()
    }
}

/**
 * file type and permissions, as in `st_mode` (see the `is_*`
 * instances for the file type)
 */
impl Ubifs_InodeHeader {
    pub fn mode(&self) -> Ref<'_, u32> {
        self.mode.borrow()
    }
}

/**
 * per-inode flags (see the instances `compressed`, `synchronous`,
 * etc.)
 */
impl Ubifs_InodeHeader {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}

/**
 * inode data length
 */
impl Ubifs_InodeHeader {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}

/**
 * count of extended attributes this inode has
 */
impl Ubifs_InodeHeader {
    pub fn num_xattrs(&self) -> Ref<'_, u32> {
        self.num_xattrs.borrow()
    }
}

/**
 * summarized size of all extended attributes in bytes
 */
impl Ubifs_InodeHeader {
    pub fn xattr_size(&self) -> Ref<'_, u32> {
        self.xattr_size.borrow()
    }
}
impl Ubifs_InodeHeader {
    pub fn padding1(&self) -> Ref<'_, Vec<u8>> {
        self.padding1.borrow()
    }
}

/**
 * sum of lengths of all extended attribute names belonging
 * to this inode
 */
impl Ubifs_InodeHeader {
    pub fn xattr_names(&self) -> Ref<'_, u32> {
        self.xattr_names.borrow()
    }
}

/**
 * compression type used for this inode
 */
impl Ubifs_InodeHeader {
    pub fn compression(&self) -> Ref<'_, Ubifs_Compression> {
        self.compression.borrow()
    }
}

/**
 * reserved for future, zeroes
 */
impl Ubifs_InodeHeader {
    pub fn padding2(&self) -> Ref<'_, Vec<u8>> {
        self.padding2.borrow()
    }
}

/**
 * Target of a [symbolic link](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/dir.c#L1220-L1241),
 * (encrypted if the inode is encrypted), device number of a device node
 * ([`union ubifs_dev_desc`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L466-L478):
 * 4 bytes from Linux, 8 from `mkfs.ubifs`), or value of an
 * [extended attribute](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/xattr.c#L115-L121)
 * (in its own inode, see `xattr`). Empty otherwise.
 */
impl Ubifs_InodeHeader {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Ubifs_InodeHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ubifs_InodeHeader {
    pub fn key_raw(&self) -> Ref<'_, Vec<u8>> {
        self.key_raw.borrow()
    }
}

/**
 * Inode nodes (`inode_header`), directory and extended attribute entry
 * nodes (`directory_header`) and data nodes (`data_header`) store keys in a
 * 16-byte field (`UBIFS_MAX_KEY_LEN`). The simple key format, the only one
 * there is (see `<superblock_header>.key_fmt`), uses only the first 8
 * bytes, and Linux (v7.2)
 * [zeroes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L432-L440)
 * the rest. Branches of index nodes (`branch`)
 * [store only these 8 bytes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L448-L455).
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L16-L22 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_Key {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    inode_number: RefCell<u32>,
    value: RefCell<u64>,
    type: RefCell<Ubifs_KeyTypes>,
    unused: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ubifs_Key {
    type Root = Ubifs;
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
        *self_rc.inode_number.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.value.borrow_mut() = _io.read_bits_int_le(29)?;
        *self_rc.type.borrow_mut() = (_io.read_bits_int_le(3)? as i64).try_into()?;
        _io.align_to_byte()?;
        *self_rc.unused.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Ubifs_Key {
}

/**
 * Number of the inode that the node belongs to: the parent directory
 * for a directory entry, the inode that the attribute belongs to for an
 * extended attribute entry.
 */
impl Ubifs_Key {
    pub fn inode_number(&self) -> Ref<'_, u32> {
        self.inode_number.borrow()
    }
}

/**
 * Block number for a data node, hash of the name (see
 * `<superblock_header>.key_hash`) for a directory or extended
 * attribute entry, 0 for an inode node.
 */
impl Ubifs_Key {
    pub fn value(&self) -> Ref<'_, u64> {
        self.value.borrow()
    }
}

/**
 * Type of the key, which matches the type of the node.
 */
impl Ubifs_Key {
    pub fn type(&self) -> Ref<'_, Ubifs_KeyTypes> {
        self.type.borrow()
    }
}

/**
 * Rest of the field holding the key: 8 zero bytes in `inode_header`,
 * `directory_header` and `data_header`, empty in `branch`.
 */
impl Ubifs_Key {
    pub fn unused(&self) -> Ref<'_, Vec<u8>> {
        self.unused.borrow()
    }
}
impl Ubifs_Key {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L685-L756 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_MasterHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    highest_inum: RefCell<u64>,
    commit_number: RefCell<u64>,
    flags: RefCell<u32>,
    leb_log: RefCell<u32>,
    leb_root: RefCell<u32>,
    ofs_root: RefCell<u32>,
    len_root: RefCell<u32>,
    leb_garbage_collect: RefCell<u32>,
    leb_index_head: RefCell<u32>,
    ofs_index_head: RefCell<u32>,
    len_index: RefCell<u64>,
    total_free: RefCell<u64>,
    total_dirty: RefCell<u64>,
    total_used: RefCell<u64>,
    total_dead: RefCell<u64>,
    total_dark: RefCell<u64>,
    leb_lpt: RefCell<u32>,
    ofs_lpt: RefCell<u32>,
    leb_nhead: RefCell<u32>,
    ofs_nhead: RefCell<u32>,
    leb_lprops_table: RefCell<u32>,
    ofs_lprops_table: RefCell<u32>,
    leb_save_table: RefCell<u32>,
    ofs_save_table: RefCell<u32>,
    leb_last_lpt_scan: RefCell<u32>,
    num_empty_lebs: RefCell<u32>,
    num_index_lebs: RefCell<u32>,
    num_lebs: RefCell<u32>,
    hash_root_index: RefCell<Vec<u8>>,
    hash_lpt: RefCell<Vec<u8>>,
    hmac: RefCell<Vec<u8>>,
    padding: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_dirty: Cell<bool>,
    dirty: RefCell<bool>,
    f_no_orphans: Cell<bool>,
    no_orphans: RefCell<bool>,
    f_recovery: Cell<bool>,
    recovery: RefCell<bool>,
}
impl KStruct for Ubifs_MasterHeader {
    type Root = Ubifs;
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
        *self_rc.highest_inum.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.commit_number.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.leb_log.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.leb_root.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_root.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_root.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.leb_garbage_collect.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.leb_index_head.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_index_head.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_index.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.total_free.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.total_dirty.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.total_used.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.total_dead.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.total_dark.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.leb_lpt.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_lpt.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.leb_nhead.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_nhead.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.leb_lprops_table.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_lprops_table.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.leb_save_table.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_save_table.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.leb_last_lpt_scan.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_empty_lebs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_index_lebs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_lebs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.hash_root_index.borrow_mut() = _io.read_bytes(64 as usize)?.into();
        *self_rc.hash_lpt.borrow_mut() = _io.read_bytes(64 as usize)?.into();
        *self_rc.hmac.borrow_mut() = _io.read_bytes(64 as usize)?.into();
        *self_rc.padding.borrow_mut() = _io.read_bytes(152 as usize)?.into();
        Ok(())
    }
}
impl Ubifs_MasterHeader {

    /**
     * master node is dirty
     */
    pub fn dirty(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_dirty.get() {
            return Ok(self.dirty.borrow());
        }
        self.f_dirty.set(true);
        *self.dirty.borrow_mut() = (((((*self.flags() as u32) & (1 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.dirty.borrow())
    }

    /**
     * no orphan inodes present
     */
    pub fn no_orphans(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_orphans.get() {
            return Ok(self.no_orphans.borrow());
        }
        self.f_no_orphans.set(true);
        *self.no_orphans.borrow_mut() = (((((*self.flags() as u32) & (2 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_orphans.borrow())
    }

    /**
     * written by recovery
     */
    pub fn recovery(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_recovery.get() {
            return Ok(self.recovery.borrow());
        }
        self.f_recovery.set(true);
        *self.recovery.borrow_mut() = (((((*self.flags() as u32) & (4 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.recovery.borrow())
    }
}

/**
 * highest inode number in the committed index
 */
impl Ubifs_MasterHeader {
    pub fn highest_inum(&self) -> Ref<'_, u64> {
        self.highest_inum.borrow()
    }
}

/**
 * commit number
 */
impl Ubifs_MasterHeader {
    pub fn commit_number(&self) -> Ref<'_, u64> {
        self.commit_number.borrow()
    }
}

/**
 * various flags (see the instances `dirty`, `no_orphans` and
 * `recovery`)
 */
impl Ubifs_MasterHeader {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}

/**
 * start of the log
 */
impl Ubifs_MasterHeader {
    pub fn leb_log(&self) -> Ref<'_, u32> {
        self.leb_log.borrow()
    }
}

/**
 * LEB number of the root indexing node
 */
impl Ubifs_MasterHeader {
    pub fn leb_root(&self) -> Ref<'_, u32> {
        self.leb_root.borrow()
    }
}

/**
 * offset within the LEB `leb_root`
 */
impl Ubifs_MasterHeader {
    pub fn ofs_root(&self) -> Ref<'_, u32> {
        self.ofs_root.borrow()
    }
}

/**
 * root indexing node length
 */
impl Ubifs_MasterHeader {
    pub fn len_root(&self) -> Ref<'_, u32> {
        self.len_root.borrow()
    }
}

/**
 * LEB reserved for garbage collection, which must be in the main area.
 * 
 * The [comment above `struct ubifs_mst_node`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L695-L696)
 * says that -1 (`0xffff_ffff`) means the LEB was not reserved and should
 * be reserved on mount. However, Linux refuses to mount a file system
 * with -1. Linux
 * [stores](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L362)
 * the field in an
 * [`int`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1424),
 * so `0xffff_ffff` becomes -1. Then -1 is rejected by the condition
 * `c->gc_lnum < c->main_first`, because the main area
 * [starts](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L775-L777)
 * after the superblock, master, log, LPT and orphan areas.
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L214-L217 Git tag "v7.2"
 */
impl Ubifs_MasterHeader {
    pub fn leb_garbage_collect(&self) -> Ref<'_, u32> {
        self.leb_garbage_collect.borrow()
    }
}

/**
 * LEB number of index head
 */
impl Ubifs_MasterHeader {
    pub fn leb_index_head(&self) -> Ref<'_, u32> {
        self.leb_index_head.borrow()
    }
}

/**
 * offset of index head
 */
impl Ubifs_MasterHeader {
    pub fn ofs_index_head(&self) -> Ref<'_, u32> {
        self.ofs_index_head.borrow()
    }
}

/**
 * size of index on flash
 */
impl Ubifs_MasterHeader {
    pub fn len_index(&self) -> Ref<'_, u64> {
        self.len_index.borrow()
    }
}

/**
 * total free space in bytes
 */
impl Ubifs_MasterHeader {
    pub fn total_free(&self) -> Ref<'_, u64> {
        self.total_free.borrow()
    }
}

/**
 * total dirty space in bytes
 */
impl Ubifs_MasterHeader {
    pub fn total_dirty(&self) -> Ref<'_, u64> {
        self.total_dirty.borrow()
    }
}

/**
 * total used space in bytes (includes only data LEBs)
 */
impl Ubifs_MasterHeader {
    pub fn total_used(&self) -> Ref<'_, u64> {
        self.total_used.borrow()
    }
}

/**
 * total dead space in bytes (includes only data LEBs)
 */
impl Ubifs_MasterHeader {
    pub fn total_dead(&self) -> Ref<'_, u64> {
        self.total_dead.borrow()
    }
}

/**
 * total dark space in bytes (includes only data LEBs)
 */
impl Ubifs_MasterHeader {
    pub fn total_dark(&self) -> Ref<'_, u64> {
        self.total_dark.borrow()
    }
}

/**
 * LEB number of LPT root nnode
 */
impl Ubifs_MasterHeader {
    pub fn leb_lpt(&self) -> Ref<'_, u32> {
        self.leb_lpt.borrow()
    }
}

/**
 * offset of LPT root nnode
 */
impl Ubifs_MasterHeader {
    pub fn ofs_lpt(&self) -> Ref<'_, u32> {
        self.ofs_lpt.borrow()
    }
}

/**
 * LEB number of LPT head
 */
impl Ubifs_MasterHeader {
    pub fn leb_nhead(&self) -> Ref<'_, u32> {
        self.leb_nhead.borrow()
    }
}

/**
 * offset of LPT head
 */
impl Ubifs_MasterHeader {
    pub fn ofs_nhead(&self) -> Ref<'_, u32> {
        self.ofs_nhead.borrow()
    }
}

/**
 * LEB number of LPT's own lprops table
 */
impl Ubifs_MasterHeader {
    pub fn leb_lprops_table(&self) -> Ref<'_, u32> {
        self.leb_lprops_table.borrow()
    }
}

/**
 * offset of LPT's own lprops table
 */
impl Ubifs_MasterHeader {
    pub fn ofs_lprops_table(&self) -> Ref<'_, u32> {
        self.ofs_lprops_table.borrow()
    }
}

/**
 * LEB number of LPT's save table. Present in every master node, but
 * only meaningful if `<superblock_header>.biglpt` is set: only then
 * does Linux [check the location of the save table](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L252-L256).
 */
impl Ubifs_MasterHeader {
    pub fn leb_save_table(&self) -> Ref<'_, u32> {
        self.leb_save_table.borrow()
    }
}

/**
 * offset of LPT's save table (only meaningful if
 * `<superblock_header>.biglpt` is set, see `leb_save_table`)
 */
impl Ubifs_MasterHeader {
    pub fn ofs_save_table(&self) -> Ref<'_, u32> {
        self.ofs_save_table.borrow()
    }
}

/**
 * LEB number of last LPT scan
 */
impl Ubifs_MasterHeader {
    pub fn leb_last_lpt_scan(&self) -> Ref<'_, u32> {
        self.leb_last_lpt_scan.borrow()
    }
}

/**
 * number of empty logical eraseblocks
 */
impl Ubifs_MasterHeader {
    pub fn num_empty_lebs(&self) -> Ref<'_, u32> {
        self.num_empty_lebs.borrow()
    }
}

/**
 * number of indexing logical eraseblocks
 */
impl Ubifs_MasterHeader {
    pub fn num_index_lebs(&self) -> Ref<'_, u32> {
        self.num_index_lebs.borrow()
    }
}

/**
 * count of LEBs used by file-system
 */
impl Ubifs_MasterHeader {
    pub fn num_lebs(&self) -> Ref<'_, u32> {
        self.num_lebs.borrow()
    }
}

/**
 * the hash of the root index node
 */
impl Ubifs_MasterHeader {
    pub fn hash_root_index(&self) -> Ref<'_, Vec<u8>> {
        self.hash_root_index.borrow()
    }
}

/**
 * the hash of the LPT
 */
impl Ubifs_MasterHeader {
    pub fn hash_lpt(&self) -> Ref<'_, Vec<u8>> {
        self.hash_lpt.borrow()
    }
}

/**
 * HMAC to authenticate the master node
 */
impl Ubifs_MasterHeader {
    pub fn hmac(&self) -> Ref<'_, Vec<u8>> {
        self.hmac.borrow()
    }
}

/**
 * reserved for future, zeroes
 */
impl Ubifs_MasterHeader {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl Ubifs_MasterHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ubifs_MasterblockNode {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Ubifs_CommonHeader>>,
    node_header: RefCell<OptRc<Ubifs_MasterHeader>>,
    _io: RefCell<BytesReader>,
    node_header_raw: RefCell<Vec<u8>>,
}
impl KStruct for Ubifs_MasterblockNode {
    type Root = Ubifs;
    type Parent = Ubifs;

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
        let t = Self::read_into::<_, Ubifs_CommonHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.header.borrow_mut() = t;
        let _tmpa = *self_rc.header();
        if !(*_tmpa.node_type() == Ubifs_NodeTypes::Master) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/masterblock_node/seq/0".to_string() }));
        }
        *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
        let node_header_raw = self_rc.node_header_raw.borrow();
        let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
        let t = Self::read_into::<BytesReader, Ubifs_MasterHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.node_header.borrow_mut() = Some(t);
        Ok(())
    }
}
impl Ubifs_MasterblockNode {
}
impl Ubifs_MasterblockNode {
    pub fn header(&self) -> Ref<'_, OptRc<Ubifs_CommonHeader>> {
        self.header.borrow()
    }
}
impl Ubifs_MasterblockNode {
    pub fn node_header(&self) -> Ref<'_, OptRc<Ubifs_MasterHeader>> {
        self.node_header.borrow()
    }
}
impl Ubifs_MasterblockNode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ubifs_MasterblockNode {
    pub fn node_header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.node_header_raw.borrow()
    }
}

/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L843-L853 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_OrphanHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_Block>,
    pub _self: SharedType<Self>,
    commit_number: RefCell<u64>,
    inode_numbers: RefCell<Vec<u64>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ubifs_OrphanHeader {
    type Root = Ubifs;
    type Parent = Ubifs_Block;

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
        *self_rc.commit_number.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.inode_numbers.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.inode_numbers.borrow_mut().push(_io.read_u8le()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Ubifs_OrphanHeader {
}

/**
 * commit number (also top bit is set on the last node of the commit)
 */
impl Ubifs_OrphanHeader {
    pub fn commit_number(&self) -> Ref<'_, u64> {
        self.commit_number.borrow()
    }
}

/**
 * inode numbers of orphans
 */
impl Ubifs_OrphanHeader {
    pub fn inode_numbers(&self) -> Ref<'_, Vec<u64>> {
        self.inode_numbers.borrow()
    }
}
impl Ubifs_OrphanHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L606-L615 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_PaddingHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_Block>,
    pub _self: SharedType<Self>,
    len_padding: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ubifs_PaddingHeader {
    type Root = Ubifs;
    type Parent = Ubifs_Block;

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
        *self_rc.len_padding.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Ubifs_PaddingHeader {
}

/**
 * how many bytes after this node are unused (because padded)
 */
impl Ubifs_PaddingHeader {
    pub fn len_padding(&self) -> Ref<'_, u32> {
        self.len_padding.borrow()
    }
}
impl Ubifs_PaddingHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * logical eraseblock reference node.
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L758-L772 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_ReferenceHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_Block>,
    pub _self: SharedType<Self>,
    leb_number: RefCell<u32>,
    ofs_leb: RefCell<u32>,
    journal_head_number: RefCell<u32>,
    padding: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ubifs_ReferenceHeader {
    type Root = Ubifs;
    type Parent = Ubifs_Block;

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
        *self_rc.leb_number.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_leb.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.journal_head_number.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.padding.borrow_mut() = _io.read_bytes(28 as usize)?.into();
        Ok(())
    }
}
impl Ubifs_ReferenceHeader {
}

/**
 * the referred logical eraseblock number
 */
impl Ubifs_ReferenceHeader {
    pub fn leb_number(&self) -> Ref<'_, u32> {
        self.leb_number.borrow()
    }
}

/**
 * start offset in the referred LEB
 */
impl Ubifs_ReferenceHeader {
    pub fn ofs_leb(&self) -> Ref<'_, u32> {
        self.ofs_leb.borrow()
    }
}

/**
 * journal head number
 */
impl Ubifs_ReferenceHeader {
    pub fn journal_head_number(&self) -> Ref<'_, u32> {
        self.journal_head_number.borrow()
    }
}

/**
 * reserved for future, zeroes
 */
impl Ubifs_ReferenceHeader {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl Ubifs_ReferenceHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Signature of the superblock node of a file system signed when it was
 * created (`mkfs.ubifs` with a key). Linux
 * [expects it](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L198-L216)
 * as the first node after the superblock node in LEB0.
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L784-L799 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_SignatureHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_Block>,
    pub _self: SharedType<Self>,
    type: RefCell<u32>,
    len_signature: RefCell<u32>,
    padding: RefCell<Vec<u8>>,
    signature: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ubifs_SignatureHeader {
    type Root = Ubifs;
    type Parent = Ubifs_Block;

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
        *self_rc.type.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.type() as u32) == (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/signature_header/seq/0".to_string() }));
        }
        *self_rc.len_signature.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.padding.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        *self_rc.signature.borrow_mut() = _io.read_bytes(*self_rc.len_signature() as usize)?.into();
        Ok(())
    }
}
impl Ubifs_SignatureHeader {
}

/**
 * type of the signature
 */
impl Ubifs_SignatureHeader {
    pub fn type(&self) -> Ref<'_, u32> {
        self.type.borrow()
    }
}

/**
 * length of `signature` in bytes
 */
impl Ubifs_SignatureHeader {
    pub fn len_signature(&self) -> Ref<'_, u32> {
        self.len_signature.borrow()
    }
}

/**
 * reserved for future, zeroes
 */
impl Ubifs_SignatureHeader {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}

/**
 * [PKCS #7 signature](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L233-L236)
 * of the whole superblock node (4096 bytes, including the common
 * header)
 */
impl Ubifs_SignatureHeader {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}
impl Ubifs_SignatureHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L617-L683 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_SuperblockHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    padding0: RefCell<Vec<u8>>,
    key_hash: RefCell<Ubifs_Hashes>,
    key_fmt: RefCell<Ubifs_KeyFormats>,
    flags: RefCell<u32>,
    min_io_size: RefCell<u32>,
    leb_size: RefCell<u32>,
    num_lebs: RefCell<u32>,
    max_num_lebs: RefCell<u32>,
    max_bud_bytes: RefCell<u64>,
    num_log_lebs: RefCell<u32>,
    num_lpt_lebs: RefCell<u32>,
    num_orphan_lebs: RefCell<u32>,
    num_journal_heads: RefCell<u32>,
    fanout: RefCell<u32>,
    num_save_table_entries: RefCell<u32>,
    fmt_version: RefCell<u32>,
    default_compression: RefCell<Ubifs_Compression>,
    padding1: RefCell<Vec<u8>>,
    reserve_pool_uid: RefCell<u32>,
    reserve_pool_gid: RefCell<u32>,
    reserve_pool_size: RefCell<u64>,
    time_granularity: RefCell<u32>,
    uuid: RefCell<Vec<u8>>,
    ro_compat_version: RefCell<u32>,
    hmac: RefCell<Vec<u8>>,
    hmac_wkm: RefCell<Vec<u8>>,
    hash_algo: RefCell<Ubifs_HashAlgos>,
    hash_algo_unused: RefCell<u16>,
    hash_mst: RefCell<Vec<u8>>,
    padding2: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_authenticated: Cell<bool>,
    authenticated: RefCell<bool>,
    f_biglpt: Cell<bool>,
    biglpt: RefCell<bool>,
    f_double_hash: Cell<bool>,
    double_hash: RefCell<bool>,
    f_encrypted: Cell<bool>,
    encrypted: RefCell<bool>,
    f_len_hash: Cell<bool>,
    len_hash: RefCell<i32>,
    f_space_fixup: Cell<bool>,
    space_fixup: RefCell<bool>,
}
impl KStruct for Ubifs_SuperblockHeader {
    type Root = Ubifs;
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
        *self_rc.padding0.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.padding0() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/superblock_header/seq/0".to_string() }));
        }
        *self_rc.key_hash.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.key_fmt.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if !(*self_rc.key_fmt() == Ubifs_KeyFormats::Simple) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/superblock_header/seq/2".to_string() }));
        }
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.min_io_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.leb_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_lebs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.max_num_lebs.borrow_mut() = _io.read_u4le()?.into();
        if !(*self_rc.max_num_lebs() >= *self_rc.num_lebs()) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/superblock_header/seq/7".to_string() }));
        }
        *self_rc.max_bud_bytes.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.num_log_lebs.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.num_log_lebs() as u32) >= (2 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/superblock_header/seq/9".to_string() }));
        }
        *self_rc.num_lpt_lebs.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.num_lpt_lebs() as u32) >= (2 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/superblock_header/seq/10".to_string() }));
        }
        *self_rc.num_orphan_lebs.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.num_orphan_lebs() as u32) >= (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/superblock_header/seq/11".to_string() }));
        }
        *self_rc.num_journal_heads.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.fanout.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_save_table_entries.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.fmt_version.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.fmt_version() as u32) >= (4 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/superblock_header/seq/15".to_string() }));
        }
        *self_rc.default_compression.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.padding1.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.padding1() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/superblock_header/seq/17".to_string() }));
        }
        *self_rc.reserve_pool_uid.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserve_pool_gid.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserve_pool_size.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.time_granularity.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.time_granularity() as u32) >= (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/superblock_header/seq/21".to_string() }));
        }
        if !(((*self_rc.time_granularity() as i32) <= (1000000000 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/superblock_header/seq/21".to_string() }));
        }
        *self_rc.uuid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.ro_compat_version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.hmac.borrow_mut() = _io.read_bytes(64 as usize)?.into();
        *self_rc.hmac_wkm.borrow_mut() = _io.read_bytes(64 as usize)?.into();
        if *self_rc.authenticated()? {
            *self_rc.hash_algo.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        }
        if !(*self_rc.authenticated()?) {
            *self_rc.hash_algo_unused.borrow_mut() = _io.read_u2le()?.into();
        }
        *self_rc.hash_mst.borrow_mut() = _io.read_bytes(64 as usize)?.into();
        *self_rc.padding2.borrow_mut() = _io.read_bytes(3774 as usize)?.into();
        Ok(())
    }
}
impl Ubifs_SuperblockHeader {

    /**
     * this filesystem contains hashes for authentication
     */
    pub fn authenticated(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_authenticated.get() {
            return Ok(self.authenticated.borrow());
        }
        self.f_authenticated.set(true);
        *self.authenticated.borrow_mut() = (((((*self.flags() as u32) & (32 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.authenticated.borrow())
    }

    /**
     * if "big" LPT model is used if set
     */
    pub fn biglpt(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_biglpt.get() {
            return Ok(self.biglpt.borrow());
        }
        self.f_biglpt.set(true);
        *self.biglpt.borrow_mut() = (((((*self.flags() as u32) & (2 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.biglpt.borrow())
    }

    /**
     * store a 32bit cookie in directory entry nodes to
     * support 64bit cookies for lookups by hash
     */
    pub fn double_hash(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_double_hash.get() {
            return Ok(self.double_hash.borrow());
        }
        self.f_double_hash.set(true);
        *self.double_hash.borrow_mut() = (((((*self.flags() as u32) & (8 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.double_hash.borrow())
    }

    /**
     * filesystem contains encrypted files
     */
    pub fn encrypted(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_encrypted.get() {
            return Ok(self.encrypted.borrow());
        }
        self.f_encrypted.set(true);
        *self.encrypted.borrow_mut() = (((((*self.flags() as u32) & (16 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.encrypted.borrow())
    }

    /**
     * Length in bytes of the hash of a node (`c->hash_len` in Linux), e.g.
     * in each branch of an index node. In an authenticated file system, it
     * is determined by `hash_algo`. Otherwise, it is 0.
     */
    pub fn len_hash(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_hash.get() {
            return Ok(self.len_hash.borrow());
        }
        self.f_len_hash.set(true);
        *self.len_hash.borrow_mut() = (if !(*self.authenticated()?) { 0 } else { if  ((*self.hash_algo() == Ubifs_HashAlgos::Md4) || (*self.hash_algo() == Ubifs_HashAlgos::Md5) || (*self.hash_algo() == Ubifs_HashAlgos::RipeMd128) || (*self.hash_algo() == Ubifs_HashAlgos::Tgr128))  { 16 } else { if  ((*self.hash_algo() == Ubifs_HashAlgos::Sha1) || (*self.hash_algo() == Ubifs_HashAlgos::RipeMd160) || (*self.hash_algo() == Ubifs_HashAlgos::Tgr160))  { 20 } else { if *self.hash_algo() == Ubifs_HashAlgos::Tgr192 { 24 } else { if *self.hash_algo() == Ubifs_HashAlgos::Sha224 { 28 } else { if  ((*self.hash_algo() == Ubifs_HashAlgos::Sha256) || (*self.hash_algo() == Ubifs_HashAlgos::RipeMd256) || (*self.hash_algo() == Ubifs_HashAlgos::Wp256) || (*self.hash_algo() == Ubifs_HashAlgos::Sm3256) || (*self.hash_algo() == Ubifs_HashAlgos::Streebog256) || (*self.hash_algo() == Ubifs_HashAlgos::Sha3256))  { 32 } else { if *self.hash_algo() == Ubifs_HashAlgos::RipeMd320 { 40 } else { if  ((*self.hash_algo() == Ubifs_HashAlgos::Sha384) || (*self.hash_algo() == Ubifs_HashAlgos::Wp384) || (*self.hash_algo() == Ubifs_HashAlgos::Sha3384))  { 48 } else { if  ((*self.hash_algo() == Ubifs_HashAlgos::Sha512) || (*self.hash_algo() == Ubifs_HashAlgos::Wp512) || (*self.hash_algo() == Ubifs_HashAlgos::Streebog512) || (*self.hash_algo() == Ubifs_HashAlgos::Sha3512))  { 64 } else { -1 } } } } } } } } }) as i32;
        Ok(self.len_hash.borrow())
    }

    /**
     * first-mount "fixup" of free space within LEBs needed
     */
    pub fn space_fixup(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_space_fixup.get() {
            return Ok(self.space_fixup.borrow());
        }
        self.f_space_fixup.set(true);
        *self.space_fixup.borrow_mut() = (((((*self.flags() as u32) & (4 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.space_fixup.borrow())
    }
}

/**
 * reserved for future, zeroes
 */
impl Ubifs_SuperblockHeader {
    pub fn padding0(&self) -> Ref<'_, Vec<u8>> {
        self.padding0.borrow()
    }
}

/**
 * type of hash function used in keys
 */
impl Ubifs_SuperblockHeader {
    pub fn key_hash(&self) -> Ref<'_, Ubifs_Hashes> {
        self.key_hash.borrow()
    }
}

/**
 * format of the key
 */
impl Ubifs_SuperblockHeader {
    pub fn key_fmt(&self) -> Ref<'_, Ubifs_KeyFormats> {
        self.key_fmt.borrow()
    }
}

/**
 * file-system flags (see the instances `biglpt`, `space_fixup`, etc.)
 */
impl Ubifs_SuperblockHeader {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}

/**
 * minimal input/output unit size
 */
impl Ubifs_SuperblockHeader {
    pub fn min_io_size(&self) -> Ref<'_, u32> {
        self.min_io_size.borrow()
    }
}

/**
 * logical eraseblock size in bytes
 */
impl Ubifs_SuperblockHeader {
    pub fn leb_size(&self) -> Ref<'_, u32> {
        self.leb_size.borrow()
    }
}

/**
 * count of LEBs used by file-system
 */
impl Ubifs_SuperblockHeader {
    pub fn num_lebs(&self) -> Ref<'_, u32> {
        self.num_lebs.borrow()
    }
}

/**
 * maximum count of LEBs used by file-system
 */
impl Ubifs_SuperblockHeader {
    pub fn max_num_lebs(&self) -> Ref<'_, u32> {
        self.max_num_lebs.borrow()
    }
}

/**
 * maximum amount of data stored in buds
 */
impl Ubifs_SuperblockHeader {
    pub fn max_bud_bytes(&self) -> Ref<'_, u64> {
        self.max_bud_bytes.borrow()
    }
}

/**
 * log size in logical eraseblocks
 */
impl Ubifs_SuperblockHeader {
    pub fn num_log_lebs(&self) -> Ref<'_, u32> {
        self.num_log_lebs.borrow()
    }
}

/**
 * number of LEBs used for lprops table
 */
impl Ubifs_SuperblockHeader {
    pub fn num_lpt_lebs(&self) -> Ref<'_, u32> {
        self.num_lpt_lebs.borrow()
    }
}

/**
 * number of LEBs used for recording orphans
 */
impl Ubifs_SuperblockHeader {
    pub fn num_orphan_lebs(&self) -> Ref<'_, u32> {
        self.num_orphan_lebs.borrow()
    }
}

/**
 * count of journal heads
 */
impl Ubifs_SuperblockHeader {
    pub fn num_journal_heads(&self) -> Ref<'_, u32> {
        self.num_journal_heads.borrow()
    }
}

/**
 * tree fanout (max. number of links per indexing node)
 */
impl Ubifs_SuperblockHeader {
    pub fn fanout(&self) -> Ref<'_, u32> {
        self.fanout.borrow()
    }
}

/**
 * number of LEB numbers in LPT's save table
 */
impl Ubifs_SuperblockHeader {
    pub fn num_save_table_entries(&self) -> Ref<'_, u32> {
        self.num_save_table_entries.borrow()
    }
}

/**
 * UBIFS on-flash format version
 */
impl Ubifs_SuperblockHeader {
    pub fn fmt_version(&self) -> Ref<'_, u32> {
        self.fmt_version.borrow()
    }
}

/**
 * default compression algorithm (`compression::lzo`, etc.)
 */
impl Ubifs_SuperblockHeader {
    pub fn default_compression(&self) -> Ref<'_, Ubifs_Compression> {
        self.default_compression.borrow()
    }
}

/**
 * reserved for future, zeroes
 */
impl Ubifs_SuperblockHeader {
    pub fn padding1(&self) -> Ref<'_, Vec<u8>> {
        self.padding1.borrow()
    }
}

/**
 * reserve pool UID
 */
impl Ubifs_SuperblockHeader {
    pub fn reserve_pool_uid(&self) -> Ref<'_, u32> {
        self.reserve_pool_uid.borrow()
    }
}

/**
 * reserve pool GID
 */
impl Ubifs_SuperblockHeader {
    pub fn reserve_pool_gid(&self) -> Ref<'_, u32> {
        self.reserve_pool_gid.borrow()
    }
}

/**
 * size of the reserved pool in bytes
 */
impl Ubifs_SuperblockHeader {
    pub fn reserve_pool_size(&self) -> Ref<'_, u64> {
        self.reserve_pool_size.borrow()
    }
}

/**
 * time granularity in nanoseconds
 */
impl Ubifs_SuperblockHeader {
    pub fn time_granularity(&self) -> Ref<'_, u32> {
        self.time_granularity.borrow()
    }
}

/**
 * UUID generated when the file system image was created
 */
impl Ubifs_SuperblockHeader {
    pub fn uuid(&self) -> Ref<'_, Vec<u8>> {
        self.uuid.borrow()
    }
}

/**
 * UBIFS R/O compatibility version
 */
impl Ubifs_SuperblockHeader {
    pub fn ro_compat_version(&self) -> Ref<'_, u32> {
        self.ro_compat_version.borrow()
    }
}

/**
 * HMAC to authenticate the superblock node
 */
impl Ubifs_SuperblockHeader {
    pub fn hmac(&self) -> Ref<'_, Vec<u8>> {
        self.hmac.borrow()
    }
}

/**
 * HMAC of a well known message (the string "UBIFS") as a convenience
 * to the user to check if the correct key is passed
 */
impl Ubifs_SuperblockHeader {
    pub fn hmac_wkm(&self) -> Ref<'_, Vec<u8>> {
        self.hmac_wkm.borrow()
    }
}

/**
 * The hash algo used for this filesystem
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L549-L573 Git tag "v7.2"
 */
impl Ubifs_SuperblockHeader {
    pub fn hash_algo(&self) -> Ref<'_, Ubifs_HashAlgos> {
        self.hash_algo.borrow()
    }
}

/**
 * Unused field (would only be meaningful in an authenticated file
 * system, see `hash_algo`). The kernel writes it as 0xffff, `mkfs.ubifs`
 * writes it as 0.
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L183-L191 Git tag "v7.2"
 */
impl Ubifs_SuperblockHeader {
    pub fn hash_algo_unused(&self) -> Ref<'_, u16> {
        self.hash_algo_unused.borrow()
    }
}

/**
 * hash of the master node, only valid for signed images in which the
 * master node does not contain a hmac
 */
impl Ubifs_SuperblockHeader {
    pub fn hash_mst(&self) -> Ref<'_, Vec<u8>> {
        self.hash_mst.borrow()
    }
}

/**
 * reserved for future, zeroes
 */
impl Ubifs_SuperblockHeader {
    pub fn padding2(&self) -> Ref<'_, Vec<u8>> {
        self.padding2.borrow()
    }
}
impl Ubifs_SuperblockHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ubifs_SuperblockNode {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Ubifs_CommonHeader>>,
    node_header: RefCell<OptRc<Ubifs_SuperblockHeader>>,
    _io: RefCell<BytesReader>,
    node_header_raw: RefCell<Vec<u8>>,
}
impl KStruct for Ubifs_SuperblockNode {
    type Root = Ubifs;
    type Parent = Ubifs;

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
        let t = Self::read_into::<_, Ubifs_CommonHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.header.borrow_mut() = t;
        let _tmpa = *self_rc.header();
        if !(*_tmpa.node_type() == Ubifs_NodeTypes::Superblock) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/superblock_node/seq/0".to_string() }));
        }
        *self_rc.node_header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header().len_full_node() as i32) - (24 as i32)) as usize)?.into();
        let node_header_raw = self_rc.node_header_raw.borrow();
        let _t_node_header_raw_io = BytesReader::from(node_header_raw.clone());
        let t = Self::read_into::<BytesReader, Ubifs_SuperblockHeader>(&_t_node_header_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.node_header.borrow_mut() = Some(t);
        Ok(())
    }
}
impl Ubifs_SuperblockNode {
}
impl Ubifs_SuperblockNode {
    pub fn header(&self) -> Ref<'_, OptRc<Ubifs_CommonHeader>> {
        self.header.borrow()
    }
}
impl Ubifs_SuperblockNode {
    pub fn node_header(&self) -> Ref<'_, OptRc<Ubifs_SuperblockHeader>> {
        self.node_header.borrow()
    }
}
impl Ubifs_SuperblockNode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ubifs_SuperblockNode {
    pub fn node_header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.node_header_raw.borrow()
    }
}

/**
 * This node exists only in the journal and never goes to the main area.
 * \sa https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L586-L604 Git tag "v7.2"
 */

#[derive(Default, Debug, Clone)]
pub struct Ubifs_TruncationHeader {
    pub _root: SharedType<Ubifs>,
    pub _parent: SharedType<Ubifs_Block>,
    pub _self: SharedType<Self>,
    inode_number: RefCell<u32>,
    padding: RefCell<Vec<u8>>,
    old_size: RefCell<u64>,
    new_size: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ubifs_TruncationHeader {
    type Root = Ubifs;
    type Parent = Ubifs_Block;

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
        *self_rc.inode_number.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.padding.borrow_mut() = _io.read_bytes(12 as usize)?.into();
        *self_rc.old_size.borrow_mut() = _io.read_u8le()?.into();
        if !(((*self_rc.old_size() as u64) >= (1 as u64))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/truncation_header/seq/2".to_string() }));
        }
        *self_rc.new_size.borrow_mut() = _io.read_u8le()?.into();
        if !(((*self_rc.new_size() as i32) <= (((*self_rc.old_size() as u64) - (1 as u64)) as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/truncation_header/seq/3".to_string() }));
        }
        Ok(())
    }
}
impl Ubifs_TruncationHeader {
}

/**
 * truncated inode number
 */
impl Ubifs_TruncationHeader {
    pub fn inode_number(&self) -> Ref<'_, u32> {
        self.inode_number.borrow()
    }
}

/**
 * reserved for future, zeroes
 */
impl Ubifs_TruncationHeader {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}

/**
 * size before truncation
 */
impl Ubifs_TruncationHeader {
    pub fn old_size(&self) -> Ref<'_, u64> {
        self.old_size.borrow()
    }
}

/**
 * size after truncation
 */
impl Ubifs_TruncationHeader {
    pub fn new_size(&self) -> Ref<'_, u64> {
        self.new_size.borrow()
    }
}
impl Ubifs_TruncationHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
