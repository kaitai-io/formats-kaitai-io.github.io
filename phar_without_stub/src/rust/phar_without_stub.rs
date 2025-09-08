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
use super::php_serialized_value::PhpSerializedValue;

/**
 * A phar (PHP archive) file. The phar format is a custom archive format
 * from the PHP ecosystem that is used to package a complete PHP library
 * or application into a single self-contained archive.
 * All phar archives start with an executable PHP stub, which can be used to
 * allow executing or including phar files as if they were regular PHP scripts.
 * PHP 5.3 and later include the phar extension, which adds native support for
 * reading and manipulating phar files.
 * 
 * The phar format was originally developed as part of the PEAR library
 * PHP_Archive, first released in 2005. Later, a native PHP extension
 * named "phar" was developed, which was first released on PECL in 2007,
 * and is included with PHP 5.3 and later. The phar extension has effectively
 * superseded the PHP_Archive library, which has not been updated since 2010.
 * The phar extension is also no longer released independently on PECL;
 * it is now developed and released as part of PHP itself.
 * 
 * Because of current limitations in Kaitai Struct
 * (seekaitai-io/kaitai_struct#158 and kaitai-io/kaitai_struct#538),
 * the executable PHP stub that precedes the rest of the archive is not handled
 * by this spec. Before parsing a phar using this spec, the stub must be
 * removed manually.
 * 
 * A phar's stub is terminated by the special token `__HALT_COMPILER();`
 * (which may be followed by at most one space, the PHP tag end `?>`,
 * and an optional line terminator). The stub termination sequence is
 * immediately followed by the remaining parts of the phar format,
 * as described in this spec.
 * 
 * The phar stub usually contains code that loads the phar and runs
 * a contained PHP file, but this is not required. A minimal valid phar stub
 * is `<?php __HALT_COMPILER();` - such a stub makes it impossible to execute
 * the phar directly, but still allows loading or manipulating it using the
 * phar extension.
 * 
 * Note: The phar format does not specify any encoding for text fields
 * (stub, alias name, and all file names), so these fields may contain arbitrary
 * binary data. The actual text encoding used in a specific phar file usually
 * depends on the application that created the phar, and on the
 * standard encoding of the system on which the phar was created.
 * \sa https://www.php.net/manual/en/phar.fileformat.php Source
 * \sa https://github.com/php/php-src/tree/master/ext/phar Source
 * \sa https://svn.php.net/viewvc/pecl/phar/ Source
 * \sa https://svn.php.net/viewvc/pear/packages/PHP_Archive/ Source
 */

#[derive(Default, Debug, Clone)]
pub struct PharWithoutStub {
    pub _root: SharedType<PharWithoutStub>,
    pub _parent: SharedType<PharWithoutStub>,
    pub _self: SharedType<Self>,
    manifest: RefCell<OptRc<PharWithoutStub_Manifest>>,
    files: RefCell<Vec<Vec<u8>>>,
    signature: RefCell<OptRc<PharWithoutStub_Signature>>,
    _io: RefCell<BytesReader>,
    signature_raw: RefCell<Vec<u8>>,
}
impl KStruct for PharWithoutStub {
    type Root = PharWithoutStub;
    type Parent = PharWithoutStub;

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
        let t = Self::read_into::<_, PharWithoutStub_Manifest>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.manifest.borrow_mut() = t;
        *self_rc.files.borrow_mut() = Vec::new();
        let l_files = *self_rc.manifest().num_files();
        for _i in 0..l_files {
            self_rc.files.borrow_mut().push(_io.read_bytes(*self_rc.manifest().file_entries()[_i as usize].len_data_compressed() as usize)?.into());
        }
        if *self_rc.manifest().flags().has_signature()? {
            *self_rc.signature_raw.borrow_mut() = _io.read_bytes_full()?.into();
            let signature_raw = self_rc.signature_raw.borrow();
            let _t_signature_raw_io = BytesReader::from(signature_raw.clone());
            let t = Self::read_into::<BytesReader, PharWithoutStub_Signature>(&_t_signature_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.signature.borrow_mut() = t;
        }
        Ok(())
    }
}
impl PharWithoutStub {
}

/**
 * The archive's manifest, containing general metadata about the archive
 * and its files.
 */
impl PharWithoutStub {
    pub fn manifest(&self) -> Ref<'_, OptRc<PharWithoutStub_Manifest>> {
        self.manifest.borrow()
    }
}

/**
 * The contents of each file in the archive (possibly compressed,
 * as indicated by the file's flags in the manifest). The files are stored
 * in the same order as they appear in the manifest.
 */
impl PharWithoutStub {
    pub fn files(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.files.borrow()
    }
}

/**
 * The archive's signature - a digest of all archive data before
 * the signature itself.
 * 
 * Note: Almost all of the available "signature" types are actually hashes,
 * not signatures, and cannot be used to verify that the archive has not
 * been tampered with. Only the OpenSSL signature type is a true
 * cryptographic signature.
 */
impl PharWithoutStub {
    pub fn signature(&self) -> Ref<'_, OptRc<PharWithoutStub_Signature>> {
        self.signature.borrow()
    }
}
impl PharWithoutStub {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl PharWithoutStub {
    pub fn signature_raw(&self) -> Ref<'_, Vec<u8>> {
        self.signature_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum PharWithoutStub_SignatureType {

    /**
     * Indicates an MD5 hash.
     */
    Md5,

    /**
     * Indicates a SHA-1 hash.
     */
    Sha1,

    /**
     * Indicates a SHA-256 hash. Available since API version 1.1.0,
     * PHP_Archive 0.12.0 and phar extension 1.1.0.
     */
    Sha256,

    /**
     * Indicates a SHA-512 hash. Available since API version 1.1.0,
     * PHP_Archive 0.12.0 and phar extension 1.1.0.
     */
    Sha512,

    /**
     * Indicates an OpenSSL signature. Available since API version 1.1.1,
     * PHP_Archive 0.12.0 (even though it claims to only support
     * API version 1.1.0) and phar extension 1.3.0. This type is not
     * documented in the phar extension's documentation of the phar format.
     * 
     * Note: In older versions of the phar extension, this value was used
     * for an undocumented and unimplemented "PGP" signature type
     * (`PHAR_SIG_PGP`).
     */
    Openssl,
    Unknown(i64),
}

impl TryFrom<i64> for PharWithoutStub_SignatureType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PharWithoutStub_SignatureType> {
        match flag {
            1 => Ok(PharWithoutStub_SignatureType::Md5),
            2 => Ok(PharWithoutStub_SignatureType::Sha1),
            4 => Ok(PharWithoutStub_SignatureType::Sha256),
            8 => Ok(PharWithoutStub_SignatureType::Sha512),
            16 => Ok(PharWithoutStub_SignatureType::Openssl),
            _ => Ok(PharWithoutStub_SignatureType::Unknown(flag)),
        }
    }
}

impl From<&PharWithoutStub_SignatureType> for i64 {
    fn from(v: &PharWithoutStub_SignatureType) -> Self {
        match *v {
            PharWithoutStub_SignatureType::Md5 => 1,
            PharWithoutStub_SignatureType::Sha1 => 2,
            PharWithoutStub_SignatureType::Sha256 => 4,
            PharWithoutStub_SignatureType::Sha512 => 8,
            PharWithoutStub_SignatureType::Openssl => 16,
            PharWithoutStub_SignatureType::Unknown(v) => v
        }
    }
}

impl Default for PharWithoutStub_SignatureType {
    fn default() -> Self { PharWithoutStub_SignatureType::Unknown(0) }
}


/**
 * A phar API version number. This version number is meant to indicate
 * which features are used in a specific phar, so that tools reading
 * the phar can easily check that they support all necessary features.
 * 
 * The following API versions exist so far:
 * 
 * * 0.5, 0.6, 0.7, 0.7.1: The first official API versions. At this point,
 *   the phar format was only used by the PHP_Archive library, and the
 *   API version numbers were identical to the PHP_Archive versions that
 *   supported them. Development of the native phar extension started around
 *   API version 0.7. These API versions could only be queried using the
 *   `PHP_Archive::APIversion()` method, but were not stored physically
 *   in archives. These API versions are not supported by this spec.
 * * 0.8.0: Used by PHP_Archive 0.8.0 (released 2006-07-18) and
 *   later development versions of the phar extension. This is the first
 *   version number to be physically stored in archives. This API version
 *   is not supported by this spec.
 * * 0.9.0: Used by later development/early beta versions of the
 *   phar extension. Also temporarily used by PHP_Archive 0.9.0
 *   (released 2006-12-15), but reverted back to API version 0.8.0 in
 *   PHP_Archive 0.9.1 (released 2007-01-05).
 * * 1.0.0: Supported since PHP_Archive 0.10.0 (released 2007-05-29)
 *   and phar extension 1.0.0 (released 2007-03-28). This is the first
 *   stable, forwards-compatible and documented version of the format.
 * * 1.1.0: Supported since PHP_Archive 0.12.0 (released 2015-07-06)
 *   and phar extension 1.1.0 (released 2007-04-12). Adds SHA-256 and
 *   SHA-512 signature types.
 * * 1.1.1: Supported since phar extension 2.0.0 (released 2009-07-29 and
 *   included with PHP 5.3 and later). (PHP_Archive 0.12.0 also supports
 *   all features from API verison 1.1.1, but it reports API version 1.1.0.)
 *   Adds the OpenSSL signature type and support for storing
 *   empty directories.
 */

#[derive(Default, Debug, Clone)]
pub struct PharWithoutStub_ApiVersion {
    pub _root: SharedType<PharWithoutStub>,
    pub _parent: SharedType<PharWithoutStub_Manifest>,
    pub _self: SharedType<Self>,
    release: RefCell<u64>,
    major: RefCell<u64>,
    minor: RefCell<u64>,
    unused: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PharWithoutStub_ApiVersion {
    type Root = PharWithoutStub;
    type Parent = PharWithoutStub_Manifest;

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
        *self_rc.release.borrow_mut() = _io.read_bits_int_be(4)?;
        *self_rc.major.borrow_mut() = _io.read_bits_int_be(4)?;
        *self_rc.minor.borrow_mut() = _io.read_bits_int_be(4)?;
        *self_rc.unused.borrow_mut() = _io.read_bits_int_be(4)?;
        Ok(())
    }
}
impl PharWithoutStub_ApiVersion {
}
impl PharWithoutStub_ApiVersion {
    pub fn release(&self) -> Ref<'_, u64> {
        self.release.borrow()
    }
}
impl PharWithoutStub_ApiVersion {
    pub fn major(&self) -> Ref<'_, u64> {
        self.major.borrow()
    }
}
impl PharWithoutStub_ApiVersion {
    pub fn minor(&self) -> Ref<'_, u64> {
        self.minor.borrow()
    }
}
impl PharWithoutStub_ApiVersion {
    pub fn unused(&self) -> Ref<'_, u64> {
        self.unused.borrow()
    }
}
impl PharWithoutStub_ApiVersion {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PharWithoutStub_FileEntry {
    pub _root: SharedType<PharWithoutStub>,
    pub _parent: SharedType<PharWithoutStub_Manifest>,
    pub _self: SharedType<Self>,
    len_filename: RefCell<u32>,
    filename: RefCell<Vec<u8>>,
    len_data_uncompressed: RefCell<u32>,
    timestamp: RefCell<u32>,
    len_data_compressed: RefCell<u32>,
    crc32: RefCell<u32>,
    flags: RefCell<OptRc<PharWithoutStub_FileFlags>>,
    len_metadata: RefCell<u32>,
    metadata: RefCell<OptRc<PharWithoutStub_SerializedValue>>,
    _io: RefCell<BytesReader>,
    metadata_raw: RefCell<Vec<u8>>,
}
impl KStruct for PharWithoutStub_FileEntry {
    type Root = PharWithoutStub;
    type Parent = PharWithoutStub_Manifest;

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
        *self_rc.len_filename.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.filename.borrow_mut() = _io.read_bytes(*self_rc.len_filename() as usize)?.into();
        *self_rc.len_data_uncompressed.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.timestamp.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_data_compressed.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.crc32.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, PharWithoutStub_FileFlags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.len_metadata.borrow_mut() = _io.read_u4le()?.into();
        if ((*self_rc.len_metadata() as u32) != (0 as u32)) {
            *self_rc.metadata_raw.borrow_mut() = _io.read_bytes(*self_rc.len_metadata() as usize)?.into();
            let metadata_raw = self_rc.metadata_raw.borrow();
            let _t_metadata_raw_io = BytesReader::from(metadata_raw.clone());
            let t = Self::read_into::<BytesReader, PharWithoutStub_SerializedValue>(&_t_metadata_raw_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.metadata.borrow_mut() = t;
        }
        Ok(())
    }
}
impl PharWithoutStub_FileEntry {
}

/**
 * The length of the file name, in bytes.
 */
impl PharWithoutStub_FileEntry {
    pub fn len_filename(&self) -> Ref<'_, u32> {
        self.len_filename.borrow()
    }
}

/**
 * The name of this file. If the name ends with a slash, this entry
 * represents a directory, otherwise a regular file. Directory entries
 * are supported since phar API version 1.1.1.
 * (Explicit directory entries are only needed for empty directories.
 * Non-empty directories are implied by the files located inside them.)
 */
impl PharWithoutStub_FileEntry {
    pub fn filename(&self) -> Ref<'_, Vec<u8>> {
        self.filename.borrow()
    }
}

/**
 * The length of the file's data when uncompressed, in bytes.
 */
impl PharWithoutStub_FileEntry {
    pub fn len_data_uncompressed(&self) -> Ref<'_, u32> {
        self.len_data_uncompressed.borrow()
    }
}

/**
 * The time at which the file was added or last updated, as a
 * Unix timestamp.
 */
impl PharWithoutStub_FileEntry {
    pub fn timestamp(&self) -> Ref<'_, u32> {
        self.timestamp.borrow()
    }
}

/**
 * The length of the file's data when compressed, in bytes.
 */
impl PharWithoutStub_FileEntry {
    pub fn len_data_compressed(&self) -> Ref<'_, u32> {
        self.len_data_compressed.borrow()
    }
}

/**
 * The CRC32 checksum of the file's uncompressed data.
 */
impl PharWithoutStub_FileEntry {
    pub fn crc32(&self) -> Ref<'_, u32> {
        self.crc32.borrow()
    }
}

/**
 * Flags for this file.
 */
impl PharWithoutStub_FileEntry {
    pub fn flags(&self) -> Ref<'_, OptRc<PharWithoutStub_FileFlags>> {
        self.flags.borrow()
    }
}

/**
 * The length of the metadata, in bytes, or 0 if there is none.
 */
impl PharWithoutStub_FileEntry {
    pub fn len_metadata(&self) -> Ref<'_, u32> {
        self.len_metadata.borrow()
    }
}

/**
 * Metadata for this file, in the format used by PHP's
 * `serialize` function. The meaning of the serialized data is not
 * specified further, it may be used to store arbitrary custom data
 * about the file.
 */
impl PharWithoutStub_FileEntry {
    pub fn metadata(&self) -> Ref<'_, OptRc<PharWithoutStub_SerializedValue>> {
        self.metadata.borrow()
    }
}
impl PharWithoutStub_FileEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl PharWithoutStub_FileEntry {
    pub fn metadata_raw(&self) -> Ref<'_, Vec<u8>> {
        self.metadata_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PharWithoutStub_FileFlags {
    pub _root: SharedType<PharWithoutStub>,
    pub _parent: SharedType<PharWithoutStub_FileEntry>,
    pub _self: SharedType<Self>,
    value: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_bzip2_compressed: Cell<bool>,
    bzip2_compressed: RefCell<bool>,
    f_permissions: Cell<bool>,
    permissions: RefCell<i32>,
    f_zlib_compressed: Cell<bool>,
    zlib_compressed: RefCell<bool>,
}
impl KStruct for PharWithoutStub_FileFlags {
    type Root = PharWithoutStub;
    type Parent = PharWithoutStub_FileEntry;

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
        *self_rc.value.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl PharWithoutStub_FileFlags {

    /**
     * Whether this file's data is stored using bzip2 compression.
     */
    pub fn bzip2_compressed(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bzip2_compressed.get() {
            return Ok(self.bzip2_compressed.borrow());
        }
        self.f_bzip2_compressed.set(true);
        *self.bzip2_compressed.borrow_mut() = (((((*self.value() as i32) & (8192 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.bzip2_compressed.borrow())
    }

    /**
     * The file's permission bits.
     */
    pub fn permissions(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_permissions.get() {
            return Ok(self.permissions.borrow());
        }
        self.f_permissions.set(true);
        *self.permissions.borrow_mut() = (((*self.value() as i32) & (511 as i32))) as i32;
        Ok(self.permissions.borrow())
    }

    /**
     * Whether this file's data is stored using zlib compression.
     */
    pub fn zlib_compressed(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_zlib_compressed.get() {
            return Ok(self.zlib_compressed.borrow());
        }
        self.f_zlib_compressed.set(true);
        *self.zlib_compressed.borrow_mut() = (((((*self.value() as i32) & (4096 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.zlib_compressed.borrow())
    }
}

/**
 * The unparsed flag bits.
 */
impl PharWithoutStub_FileFlags {
    pub fn value(&self) -> Ref<'_, u32> {
        self.value.borrow()
    }
}
impl PharWithoutStub_FileFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PharWithoutStub_GlobalFlags {
    pub _root: SharedType<PharWithoutStub>,
    pub _parent: SharedType<PharWithoutStub_Manifest>,
    pub _self: SharedType<Self>,
    value: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_any_bzip2_compressed: Cell<bool>,
    any_bzip2_compressed: RefCell<bool>,
    f_any_zlib_compressed: Cell<bool>,
    any_zlib_compressed: RefCell<bool>,
    f_has_signature: Cell<bool>,
    has_signature: RefCell<bool>,
}
impl KStruct for PharWithoutStub_GlobalFlags {
    type Root = PharWithoutStub;
    type Parent = PharWithoutStub_Manifest;

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
        *self_rc.value.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl PharWithoutStub_GlobalFlags {

    /**
     * Whether any of the files in this phar are stored using
     * bzip2 compression.
     */
    pub fn any_bzip2_compressed(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_any_bzip2_compressed.get() {
            return Ok(self.any_bzip2_compressed.borrow());
        }
        self.f_any_bzip2_compressed.set(true);
        *self.any_bzip2_compressed.borrow_mut() = (((((*self.value() as i32) & (8192 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.any_bzip2_compressed.borrow())
    }

    /**
     * Whether any of the files in this phar are stored using
     * zlib compression.
     */
    pub fn any_zlib_compressed(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_any_zlib_compressed.get() {
            return Ok(self.any_zlib_compressed.borrow());
        }
        self.f_any_zlib_compressed.set(true);
        *self.any_zlib_compressed.borrow_mut() = (((((*self.value() as i32) & (4096 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.any_zlib_compressed.borrow())
    }

    /**
     * Whether this phar contains a signature.
     */
    pub fn has_signature(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_signature.get() {
            return Ok(self.has_signature.borrow());
        }
        self.f_has_signature.set(true);
        *self.has_signature.borrow_mut() = (((((*self.value() as i32) & (65536 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_signature.borrow())
    }
}

/**
 * The unparsed flag bits.
 */
impl PharWithoutStub_GlobalFlags {
    pub fn value(&self) -> Ref<'_, u32> {
        self.value.borrow()
    }
}
impl PharWithoutStub_GlobalFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PharWithoutStub_Manifest {
    pub _root: SharedType<PharWithoutStub>,
    pub _parent: SharedType<PharWithoutStub>,
    pub _self: SharedType<Self>,
    len_manifest: RefCell<u32>,
    num_files: RefCell<u32>,
    api_version: RefCell<OptRc<PharWithoutStub_ApiVersion>>,
    flags: RefCell<OptRc<PharWithoutStub_GlobalFlags>>,
    len_alias: RefCell<u32>,
    alias: RefCell<Vec<u8>>,
    len_metadata: RefCell<u32>,
    metadata: RefCell<OptRc<PharWithoutStub_SerializedValue>>,
    file_entries: RefCell<Vec<OptRc<PharWithoutStub_FileEntry>>>,
    _io: RefCell<BytesReader>,
    metadata_raw: RefCell<Vec<u8>>,
}
impl KStruct for PharWithoutStub_Manifest {
    type Root = PharWithoutStub;
    type Parent = PharWithoutStub;

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
        *self_rc.len_manifest.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_files.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, PharWithoutStub_ApiVersion>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.api_version.borrow_mut() = t;
        let t = Self::read_into::<_, PharWithoutStub_GlobalFlags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.len_alias.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.alias.borrow_mut() = _io.read_bytes(*self_rc.len_alias() as usize)?.into();
        *self_rc.len_metadata.borrow_mut() = _io.read_u4le()?.into();
        if ((*self_rc.len_metadata() as u32) != (0 as u32)) {
            *self_rc.metadata_raw.borrow_mut() = _io.read_bytes(*self_rc.len_metadata() as usize)?.into();
            let metadata_raw = self_rc.metadata_raw.borrow();
            let _t_metadata_raw_io = BytesReader::from(metadata_raw.clone());
            let t = Self::read_into::<BytesReader, PharWithoutStub_SerializedValue>(&_t_metadata_raw_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.metadata.borrow_mut() = t;
        }
        *self_rc.file_entries.borrow_mut() = Vec::new();
        let l_file_entries = *self_rc.num_files();
        for _i in 0..l_file_entries {
            let t = Self::read_into::<_, PharWithoutStub_FileEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.file_entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl PharWithoutStub_Manifest {
}

/**
 * The length of the manifest, in bytes.
 * 
 * Note: The phar extension does not allow reading manifests
 * larger than 100 MiB.
 */
impl PharWithoutStub_Manifest {
    pub fn len_manifest(&self) -> Ref<'_, u32> {
        self.len_manifest.borrow()
    }
}

/**
 * The number of files in this phar.
 */
impl PharWithoutStub_Manifest {
    pub fn num_files(&self) -> Ref<'_, u32> {
        self.num_files.borrow()
    }
}

/**
 * The API version used by this phar manifest.
 */
impl PharWithoutStub_Manifest {
    pub fn api_version(&self) -> Ref<'_, OptRc<PharWithoutStub_ApiVersion>> {
        self.api_version.borrow()
    }
}

/**
 * Global flags for this phar.
 */
impl PharWithoutStub_Manifest {
    pub fn flags(&self) -> Ref<'_, OptRc<PharWithoutStub_GlobalFlags>> {
        self.flags.borrow()
    }
}

/**
 * The length of the alias, in bytes.
 */
impl PharWithoutStub_Manifest {
    pub fn len_alias(&self) -> Ref<'_, u32> {
        self.len_alias.borrow()
    }
}

/**
 * The phar's alias, i. e. the name under which it is loaded into PHP.
 */
impl PharWithoutStub_Manifest {
    pub fn alias(&self) -> Ref<'_, Vec<u8>> {
        self.alias.borrow()
    }
}

/**
 * The size of the metadata, in bytes, or 0 if there is none.
 */
impl PharWithoutStub_Manifest {
    pub fn len_metadata(&self) -> Ref<'_, u32> {
        self.len_metadata.borrow()
    }
}

/**
 * Metadata for this phar, in the format used by PHP's
 * `serialize` function. The meaning of the serialized data is not
 * specified further, it may be used to store arbitrary custom data
 * about the archive.
 */
impl PharWithoutStub_Manifest {
    pub fn metadata(&self) -> Ref<'_, OptRc<PharWithoutStub_SerializedValue>> {
        self.metadata.borrow()
    }
}

/**
 * Manifest entries for the files contained in this phar.
 */
impl PharWithoutStub_Manifest {
    pub fn file_entries(&self) -> Ref<'_, Vec<OptRc<PharWithoutStub_FileEntry>>> {
        self.file_entries.borrow()
    }
}
impl PharWithoutStub_Manifest {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl PharWithoutStub_Manifest {
    pub fn metadata_raw(&self) -> Ref<'_, Vec<u8>> {
        self.metadata_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PharWithoutStub_SerializedValue {
    pub _root: SharedType<PharWithoutStub>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    raw: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_parsed: Cell<bool>,
    parsed: RefCell<OptRc<PhpSerializedValue>>,
}
impl KStruct for PharWithoutStub_SerializedValue {
    type Root = PharWithoutStub;
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
        *self_rc.raw.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl PharWithoutStub_SerializedValue {

    /**
     * The serialized value, parsed as a structure.
     */
    pub fn parsed(
        &self
    ) -> KResult<Ref<'_, OptRc<PhpSerializedValue>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_parsed.get() {
            return Ok(self.parsed.borrow());
        }
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        let t = Self::read_into::<_, PhpSerializedValue>(&*_io, None, None)?.into();
        *self.parsed.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.parsed.borrow())
    }
}

/**
 * The serialized value, as a raw byte array.
 */
impl PharWithoutStub_SerializedValue {
    pub fn raw(&self) -> Ref<'_, Vec<u8>> {
        self.raw.borrow()
    }
}
impl PharWithoutStub_SerializedValue {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PharWithoutStub_Signature {
    pub _root: SharedType<PharWithoutStub>,
    pub _parent: SharedType<PharWithoutStub>,
    pub _self: SharedType<Self>,
    data: RefCell<Vec<u8>>,
    type: RefCell<PharWithoutStub_SignatureType>,
    magic: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PharWithoutStub_Signature {
    type Root = PharWithoutStub;
    type Parent = PharWithoutStub;

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
        *self_rc.data.borrow_mut() = _io.read_bytes(((((_io.size() as i32) - (_io.pos() as i32)) as i32) - (8 as i32)) as usize)?.into();
        *self_rc.type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x47u8, 0x42u8, 0x4du8, 0x42u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/signature/seq/2".to_string() }));
        }
        Ok(())
    }
}
impl PharWithoutStub_Signature {
}

/**
 * The signature data. The size and contents depend on the
 * signature type.
 */
impl PharWithoutStub_Signature {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}

/**
 * The signature type.
 */
impl PharWithoutStub_Signature {
    pub fn type(&self) -> Ref<'_, PharWithoutStub_SignatureType> {
        self.type.borrow()
    }
}
impl PharWithoutStub_Signature {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl PharWithoutStub_Signature {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
