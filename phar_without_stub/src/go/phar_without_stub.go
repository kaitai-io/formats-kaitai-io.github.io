// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


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
 * @see <a href="https://www.php.net/manual/en/phar.fileformat.php">Source</a>
 * @see <a href="https://github.com/php/php-src/tree/master/ext/phar">Source</a>
 * @see <a href="https://svn.php.net/viewvc/pecl/phar/">Source</a>
 * @see <a href="https://svn.php.net/viewvc/pear/packages/PHP_Archive/">Source</a>
 */

type PharWithoutStub_SignatureType int
const (
	PharWithoutStub_SignatureType__Md5 PharWithoutStub_SignatureType = 1
	PharWithoutStub_SignatureType__Sha1 PharWithoutStub_SignatureType = 2
	PharWithoutStub_SignatureType__Sha256 PharWithoutStub_SignatureType = 4
	PharWithoutStub_SignatureType__Sha512 PharWithoutStub_SignatureType = 8
	PharWithoutStub_SignatureType__Openssl PharWithoutStub_SignatureType = 16
)
type PharWithoutStub struct {
	Manifest *PharWithoutStub_Manifest
	Files [][]byte
	Signature *PharWithoutStub_Signature
	_io *kaitai.Stream
	_root *PharWithoutStub
	_parent interface{}
	_raw_Signature []byte
}
func NewPharWithoutStub() *PharWithoutStub {
	return &PharWithoutStub{
	}
}

func (this *PharWithoutStub) Read(io *kaitai.Stream, parent interface{}, root *PharWithoutStub) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewPharWithoutStub_Manifest()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Manifest = tmp1
	this.Files = make([][]byte, this.Manifest.NumFiles)
	for i := range this.Files {
		tmp2, err := this._io.ReadBytes(int(this.Manifest.FileEntries[i].LenDataCompressed))
		if err != nil {
			return err
		}
		tmp2 = tmp2
		this.Files[i] = tmp2
	}
	tmp3, err := this.Manifest.Flags.HasSignature()
	if err != nil {
		return err
	}
	if (tmp3) {
		tmp4, err := this._io.ReadBytesFull()
		if err != nil {
			return err
		}
		tmp4 = tmp4
		this._raw_Signature = tmp4
		_io__raw_Signature := kaitai.NewStream(bytes.NewReader(this._raw_Signature))
		tmp5 := NewPharWithoutStub_Signature()
		err = tmp5.Read(_io__raw_Signature, this, this._root)
		if err != nil {
			return err
		}
		this.Signature = tmp5
	}
	return err
}

/**
 * The archive's manifest, containing general metadata about the archive
 * and its files.
 */

/**
 * The contents of each file in the archive (possibly compressed,
 * as indicated by the file's flags in the manifest). The files are stored
 * in the same order as they appear in the manifest.
 */

/**
 * The archive's signature - a digest of all archive data before
 * the signature itself.
 * 
 * Note: Almost all of the available "signature" types are actually hashes,
 * not signatures, and cannot be used to verify that the archive has not
 * been tampered with. Only the OpenSSL signature type is a true
 * cryptographic signature.
 */
type PharWithoutStub_SerializedValue struct {
	Raw []byte
	_io *kaitai.Stream
	_root *PharWithoutStub
	_parent interface{}
	_f_parsed bool
	parsed *PhpSerializedValue
}
func NewPharWithoutStub_SerializedValue() *PharWithoutStub_SerializedValue {
	return &PharWithoutStub_SerializedValue{
	}
}

func (this *PharWithoutStub_SerializedValue) Read(io *kaitai.Stream, parent interface{}, root *PharWithoutStub) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.Raw = tmp6
	return err
}

/**
 * The serialized value, parsed as a structure.
 */
func (this *PharWithoutStub_SerializedValue) Parsed() (v *PhpSerializedValue, err error) {
	if (this._f_parsed) {
		return this.parsed, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp7 := NewPhpSerializedValue()
	err = tmp7.Read(this._io, this, nil)
	if err != nil {
		return nil, err
	}
	this.parsed = tmp7
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_parsed = true
	this._f_parsed = true
	return this.parsed, nil
}

/**
 * The serialized value, as a raw byte array.
 */
type PharWithoutStub_Signature struct {
	Data []byte
	Type PharWithoutStub_SignatureType
	Magic []byte
	_io *kaitai.Stream
	_root *PharWithoutStub
	_parent *PharWithoutStub
}
func NewPharWithoutStub_Signature() *PharWithoutStub_Signature {
	return &PharWithoutStub_Signature{
	}
}

func (this *PharWithoutStub_Signature) Read(io *kaitai.Stream, parent *PharWithoutStub, root *PharWithoutStub) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.Size()
	if err != nil {
		return err
	}
	tmp9, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp10, err := this._io.ReadBytes(int(((tmp8 - tmp9) - 8)))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Data = tmp10
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Type = PharWithoutStub_SignatureType(tmp11)
	tmp12, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.Magic = tmp12
	if !(bytes.Equal(this.Magic, []uint8{71, 66, 77, 66})) {
		return kaitai.NewValidationNotEqualError([]uint8{71, 66, 77, 66}, this.Magic, this._io, "/types/signature/seq/2")
	}
	return err
}

/**
 * The signature data. The size and contents depend on the
 * signature type.
 */

/**
 * The signature type.
 */
type PharWithoutStub_FileFlags struct {
	Value uint32
	_io *kaitai.Stream
	_root *PharWithoutStub
	_parent *PharWithoutStub_FileEntry
	_f_permissions bool
	permissions int
	_f_zlibCompressed bool
	zlibCompressed bool
	_f_bzip2Compressed bool
	bzip2Compressed bool
}
func NewPharWithoutStub_FileFlags() *PharWithoutStub_FileFlags {
	return &PharWithoutStub_FileFlags{
	}
}

func (this *PharWithoutStub_FileFlags) Read(io *kaitai.Stream, parent *PharWithoutStub_FileEntry, root *PharWithoutStub) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Value = uint32(tmp13)
	return err
}

/**
 * The file's permission bits.
 */
func (this *PharWithoutStub_FileFlags) Permissions() (v int, err error) {
	if (this._f_permissions) {
		return this.permissions, nil
	}
	this.permissions = int((this.Value & 511))
	this._f_permissions = true
	return this.permissions, nil
}

/**
 * Whether this file's data is stored using zlib compression.
 */
func (this *PharWithoutStub_FileFlags) ZlibCompressed() (v bool, err error) {
	if (this._f_zlibCompressed) {
		return this.zlibCompressed, nil
	}
	this.zlibCompressed = bool((this.Value & 4096) != 0)
	this._f_zlibCompressed = true
	return this.zlibCompressed, nil
}

/**
 * Whether this file's data is stored using bzip2 compression.
 */
func (this *PharWithoutStub_FileFlags) Bzip2Compressed() (v bool, err error) {
	if (this._f_bzip2Compressed) {
		return this.bzip2Compressed, nil
	}
	this.bzip2Compressed = bool((this.Value & 8192) != 0)
	this._f_bzip2Compressed = true
	return this.bzip2Compressed, nil
}

/**
 * The unparsed flag bits.
 */

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
type PharWithoutStub_ApiVersion struct {
	Release uint64
	Major uint64
	Minor uint64
	Unused uint64
	_io *kaitai.Stream
	_root *PharWithoutStub
	_parent *PharWithoutStub_Manifest
}
func NewPharWithoutStub_ApiVersion() *PharWithoutStub_ApiVersion {
	return &PharWithoutStub_ApiVersion{
	}
}

func (this *PharWithoutStub_ApiVersion) Read(io *kaitai.Stream, parent *PharWithoutStub_Manifest, root *PharWithoutStub) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Release = tmp14
	tmp15, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Major = tmp15
	tmp16, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Minor = tmp16
	tmp17, err := this._io.ReadBitsIntBe(4)
	if err != nil {
		return err
	}
	this.Unused = tmp17
	return err
}
type PharWithoutStub_GlobalFlags struct {
	Value uint32
	_io *kaitai.Stream
	_root *PharWithoutStub
	_parent *PharWithoutStub_Manifest
	_f_anyZlibCompressed bool
	anyZlibCompressed bool
	_f_anyBzip2Compressed bool
	anyBzip2Compressed bool
	_f_hasSignature bool
	hasSignature bool
}
func NewPharWithoutStub_GlobalFlags() *PharWithoutStub_GlobalFlags {
	return &PharWithoutStub_GlobalFlags{
	}
}

func (this *PharWithoutStub_GlobalFlags) Read(io *kaitai.Stream, parent *PharWithoutStub_Manifest, root *PharWithoutStub) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Value = uint32(tmp18)
	return err
}

/**
 * Whether any of the files in this phar are stored using
 * zlib compression.
 */
func (this *PharWithoutStub_GlobalFlags) AnyZlibCompressed() (v bool, err error) {
	if (this._f_anyZlibCompressed) {
		return this.anyZlibCompressed, nil
	}
	this.anyZlibCompressed = bool((this.Value & 4096) != 0)
	this._f_anyZlibCompressed = true
	return this.anyZlibCompressed, nil
}

/**
 * Whether any of the files in this phar are stored using
 * bzip2 compression.
 */
func (this *PharWithoutStub_GlobalFlags) AnyBzip2Compressed() (v bool, err error) {
	if (this._f_anyBzip2Compressed) {
		return this.anyBzip2Compressed, nil
	}
	this.anyBzip2Compressed = bool((this.Value & 8192) != 0)
	this._f_anyBzip2Compressed = true
	return this.anyBzip2Compressed, nil
}

/**
 * Whether this phar contains a signature.
 */
func (this *PharWithoutStub_GlobalFlags) HasSignature() (v bool, err error) {
	if (this._f_hasSignature) {
		return this.hasSignature, nil
	}
	this.hasSignature = bool((this.Value & 65536) != 0)
	this._f_hasSignature = true
	return this.hasSignature, nil
}

/**
 * The unparsed flag bits.
 */
type PharWithoutStub_Manifest struct {
	LenManifest uint32
	NumFiles uint32
	ApiVersion *PharWithoutStub_ApiVersion
	Flags *PharWithoutStub_GlobalFlags
	LenAlias uint32
	Alias []byte
	LenMetadata uint32
	Metadata *PharWithoutStub_SerializedValue
	FileEntries []*PharWithoutStub_FileEntry
	_io *kaitai.Stream
	_root *PharWithoutStub
	_parent *PharWithoutStub
	_raw_Metadata []byte
}
func NewPharWithoutStub_Manifest() *PharWithoutStub_Manifest {
	return &PharWithoutStub_Manifest{
	}
}

func (this *PharWithoutStub_Manifest) Read(io *kaitai.Stream, parent *PharWithoutStub, root *PharWithoutStub) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenManifest = uint32(tmp19)
	tmp20, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumFiles = uint32(tmp20)
	tmp21 := NewPharWithoutStub_ApiVersion()
	err = tmp21.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ApiVersion = tmp21
	tmp22 := NewPharWithoutStub_GlobalFlags()
	err = tmp22.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp22
	tmp23, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenAlias = uint32(tmp23)
	tmp24, err := this._io.ReadBytes(int(this.LenAlias))
	if err != nil {
		return err
	}
	tmp24 = tmp24
	this.Alias = tmp24
	tmp25, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenMetadata = uint32(tmp25)
	if (this.LenMetadata != 0) {
		tmp26, err := this._io.ReadBytes(int(this.LenMetadata))
		if err != nil {
			return err
		}
		tmp26 = tmp26
		this._raw_Metadata = tmp26
		_io__raw_Metadata := kaitai.NewStream(bytes.NewReader(this._raw_Metadata))
		tmp27 := NewPharWithoutStub_SerializedValue()
		err = tmp27.Read(_io__raw_Metadata, this, this._root)
		if err != nil {
			return err
		}
		this.Metadata = tmp27
	}
	this.FileEntries = make([]*PharWithoutStub_FileEntry, this.NumFiles)
	for i := range this.FileEntries {
		tmp28 := NewPharWithoutStub_FileEntry()
		err = tmp28.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.FileEntries[i] = tmp28
	}
	return err
}

/**
 * The length of the manifest, in bytes.
 * 
 * Note: The phar extension does not allow reading manifests
 * larger than 100 MiB.
 */

/**
 * The number of files in this phar.
 */

/**
 * The API version used by this phar manifest.
 */

/**
 * Global flags for this phar.
 */

/**
 * The length of the alias, in bytes.
 */

/**
 * The phar's alias, i. e. the name under which it is loaded into PHP.
 */

/**
 * The size of the metadata, in bytes, or 0 if there is none.
 */

/**
 * Metadata for this phar, in the format used by PHP's
 * `serialize` function. The meaning of the serialized data is not
 * specified further, it may be used to store arbitrary custom data
 * about the archive.
 */

/**
 * Manifest entries for the files contained in this phar.
 */
type PharWithoutStub_FileEntry struct {
	LenFilename uint32
	Filename []byte
	LenDataUncompressed uint32
	Timestamp uint32
	LenDataCompressed uint32
	Crc32 uint32
	Flags *PharWithoutStub_FileFlags
	LenMetadata uint32
	Metadata *PharWithoutStub_SerializedValue
	_io *kaitai.Stream
	_root *PharWithoutStub
	_parent *PharWithoutStub_Manifest
	_raw_Metadata []byte
}
func NewPharWithoutStub_FileEntry() *PharWithoutStub_FileEntry {
	return &PharWithoutStub_FileEntry{
	}
}

func (this *PharWithoutStub_FileEntry) Read(io *kaitai.Stream, parent *PharWithoutStub_Manifest, root *PharWithoutStub) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenFilename = uint32(tmp29)
	tmp30, err := this._io.ReadBytes(int(this.LenFilename))
	if err != nil {
		return err
	}
	tmp30 = tmp30
	this.Filename = tmp30
	tmp31, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenDataUncompressed = uint32(tmp31)
	tmp32, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Timestamp = uint32(tmp32)
	tmp33, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenDataCompressed = uint32(tmp33)
	tmp34, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Crc32 = uint32(tmp34)
	tmp35 := NewPharWithoutStub_FileFlags()
	err = tmp35.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp35
	tmp36, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenMetadata = uint32(tmp36)
	if (this.LenMetadata != 0) {
		tmp37, err := this._io.ReadBytes(int(this.LenMetadata))
		if err != nil {
			return err
		}
		tmp37 = tmp37
		this._raw_Metadata = tmp37
		_io__raw_Metadata := kaitai.NewStream(bytes.NewReader(this._raw_Metadata))
		tmp38 := NewPharWithoutStub_SerializedValue()
		err = tmp38.Read(_io__raw_Metadata, this, this._root)
		if err != nil {
			return err
		}
		this.Metadata = tmp38
	}
	return err
}

/**
 * The length of the file name, in bytes.
 */

/**
 * The name of this file. If the name ends with a slash, this entry
 * represents a directory, otherwise a regular file. Directory entries
 * are supported since phar API version 1.1.1.
 * (Explicit directory entries are only needed for empty directories.
 * Non-empty directories are implied by the files located inside them.)
 */

/**
 * The length of the file's data when uncompressed, in bytes.
 */

/**
 * The time at which the file was added or last updated, as a
 * Unix timestamp.
 */

/**
 * The length of the file's data when compressed, in bytes.
 */

/**
 * The CRC32 checksum of the file's uncompressed data.
 */

/**
 * Flags for this file.
 */

/**
 * The length of the metadata, in bytes, or 0 if there is none.
 */

/**
 * Metadata for this file, in the format used by PHP's
 * `serialize` function. The meaning of the serialized data is not
 * specified further, it may be used to store arbitrary custom data
 * about the file.
 */
