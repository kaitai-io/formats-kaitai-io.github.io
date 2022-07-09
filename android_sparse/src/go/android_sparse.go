// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * The Android sparse format is a format to more efficiently store files
 * for for example firmware updates to save on bandwidth. Files in sparse
 * format first have to be converted back to their original format.
 * 
 * A tool to create images for testing can be found in the Android source code tree:
 * 
 * <https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse> - `img2simg.c`
 * 
 * Note: this is not the same as the Android sparse data image format.
 * @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_format.h">Source</a>
 * @see <a href="https://source.android.com/devices/bootloader/images#sparse-image-format">Source</a>
 */

type AndroidSparse_ChunkTypes int
const (
	AndroidSparse_ChunkTypes__Raw AndroidSparse_ChunkTypes = 51905
	AndroidSparse_ChunkTypes__Fill AndroidSparse_ChunkTypes = 51906
	AndroidSparse_ChunkTypes__DontCare AndroidSparse_ChunkTypes = 51907
	AndroidSparse_ChunkTypes__Crc32 AndroidSparse_ChunkTypes = 51908
)
type AndroidSparse struct {
	HeaderPrefix *AndroidSparse_FileHeaderPrefix
	Header *AndroidSparse_FileHeader
	Chunks []*AndroidSparse_Chunk
	_io *kaitai.Stream
	_root *AndroidSparse
	_parent interface{}
	_raw_Header []byte
}
func NewAndroidSparse() *AndroidSparse {
	return &AndroidSparse{
	}
}

func (this *AndroidSparse) Read(io *kaitai.Stream, parent interface{}, root *AndroidSparse) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewAndroidSparse_FileHeaderPrefix()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.HeaderPrefix = tmp1
	tmp2, err := this._io.ReadBytes(int((this.HeaderPrefix.LenHeader - 10)))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this._raw_Header = tmp2
	_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
	tmp3 := NewAndroidSparse_FileHeader()
	err = tmp3.Read(_io__raw_Header, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp3
	for i := 0; i < int(this.Header.NumChunks); i++ {
		_ = i
		tmp4 := NewAndroidSparse_Chunk()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Chunks = append(this.Chunks, tmp4)
	}
	return err
}

/**
 * internal; access `_root.header` instead
 */
type AndroidSparse_FileHeaderPrefix struct {
	Magic []byte
	Version *AndroidSparse_Version
	LenHeader uint16
	_io *kaitai.Stream
	_root *AndroidSparse
	_parent *AndroidSparse
}
func NewAndroidSparse_FileHeaderPrefix() *AndroidSparse_FileHeaderPrefix {
	return &AndroidSparse_FileHeaderPrefix{
	}
}

func (this *AndroidSparse_FileHeaderPrefix) Read(io *kaitai.Stream, parent *AndroidSparse, root *AndroidSparse) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Magic = tmp5
	if !(bytes.Equal(this.Magic, []uint8{58, 255, 38, 237})) {
		return kaitai.NewValidationNotEqualError([]uint8{58, 255, 38, 237}, this.Magic, this._io, "/types/file_header_prefix/seq/0")
	}
	tmp6 := NewAndroidSparse_Version()
	err = tmp6.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Version = tmp6
	tmp7, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenHeader = uint16(tmp7)
	return err
}

/**
 * internal; access `_root.header.version` instead
 */

/**
 * internal; access `_root.header.len_header` instead
 */
type AndroidSparse_FileHeader struct {
	LenChunkHeader uint16
	BlockSize uint32
	NumBlocks uint32
	NumChunks uint32
	Checksum uint32
	_io *kaitai.Stream
	_root *AndroidSparse
	_parent *AndroidSparse
	_f_version bool
	version *AndroidSparse_Version
	_f_lenHeader bool
	lenHeader uint16
}
func NewAndroidSparse_FileHeader() *AndroidSparse_FileHeader {
	return &AndroidSparse_FileHeader{
	}
}

func (this *AndroidSparse_FileHeader) Read(io *kaitai.Stream, parent *AndroidSparse, root *AndroidSparse) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenChunkHeader = uint16(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BlockSize = uint32(tmp9)
	{
		_it := this.BlockSize
		tmp10 := _it % 4
		if tmp10 < 0 {
			tmp10 += 4
		}
		if !(tmp10 == 0) {
			return kaitai.NewValidationExprError(this.BlockSize, this._io, "/types/file_header/seq/1")
		}
	}
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumBlocks = uint32(tmp11)
	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumChunks = uint32(tmp12)
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Checksum = uint32(tmp13)
	return err
}
func (this *AndroidSparse_FileHeader) Version() (v *AndroidSparse_Version, err error) {
	if (this._f_version) {
		return this.version, nil
	}
	this.version = this._root.HeaderPrefix.Version
	this._f_version = true
	return this.version, nil
}

/**
 * size of file header, should be 28
 */
func (this *AndroidSparse_FileHeader) LenHeader() (v uint16, err error) {
	if (this._f_lenHeader) {
		return this.lenHeader, nil
	}
	this.lenHeader = uint16(this._root.HeaderPrefix.LenHeader)
	this._f_lenHeader = true
	return this.lenHeader, nil
}

/**
 * size of chunk header, should be 12
 */

/**
 * block size in bytes, must be a multiple of 4
 */

/**
 * blocks in the original data
 */

/**
 * CRC32 checksum of the original data
 * 
 * In practice always 0; if checksum writing is requested, a CRC32 chunk is written
 * at the end of the file instead. The canonical `libsparse` implementation does this
 * and other implementations tend to follow it, see
 * <https://gitlab.com/teskje/android-sparse-rs/-/blob/57c2577/src/write.rs#L112-114>
 */
type AndroidSparse_Chunk struct {
	Header *AndroidSparse_Chunk_ChunkHeader
	Body interface{}
	_io *kaitai.Stream
	_root *AndroidSparse
	_parent *AndroidSparse
	_raw_Header []byte
}
func NewAndroidSparse_Chunk() *AndroidSparse_Chunk {
	return &AndroidSparse_Chunk{
	}
}

func (this *AndroidSparse_Chunk) Read(io *kaitai.Stream, parent *AndroidSparse, root *AndroidSparse) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadBytes(int(this._root.Header.LenChunkHeader))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this._raw_Header = tmp14
	_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
	tmp15 := NewAndroidSparse_Chunk_ChunkHeader()
	err = tmp15.Read(_io__raw_Header, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp15
	switch (this.Header.ChunkType) {
	case AndroidSparse_ChunkTypes__Crc32:
		tmp16, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Body = tmp16
	default:
		tmp17, err := this.Header.LenBody()
		if err != nil {
			return err
		}
		tmp18, err := this._io.ReadBytes(int(tmp17))
		if err != nil {
			return err
		}
		tmp18 = tmp18
		this._raw_Body = tmp18
	}
	return err
}
type AndroidSparse_Chunk_ChunkHeader struct {
	ChunkType AndroidSparse_ChunkTypes
	Reserved1 uint16
	NumBodyBlocks uint32
	LenChunk uint32
	_io *kaitai.Stream
	_root *AndroidSparse
	_parent *AndroidSparse_Chunk
	_f_lenBody bool
	lenBody int
	_f_lenBodyExpected bool
	lenBodyExpected int
}
func NewAndroidSparse_Chunk_ChunkHeader() *AndroidSparse_Chunk_ChunkHeader {
	return &AndroidSparse_Chunk_ChunkHeader{
	}
}

func (this *AndroidSparse_Chunk_ChunkHeader) Read(io *kaitai.Stream, parent *AndroidSparse_Chunk, root *AndroidSparse) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ChunkType = AndroidSparse_ChunkTypes(tmp19)
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Reserved1 = uint16(tmp20)
	tmp21, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumBodyBlocks = uint32(tmp21)
	tmp22, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenChunk = uint32(tmp22)
	var tmp23 int;
	tmp24, err := this.LenBodyExpected()
	if err != nil {
		return err
	}
	if (tmp24 != -1) {
		tmp25, err := this.LenBodyExpected()
		if err != nil {
			return err
		}
		tmp23 = (this._root.Header.LenChunkHeader + tmp25)
	} else {
		tmp23 = this.LenChunk
	}
	var tmp26 int;
	tmp27, err := this.LenBodyExpected()
	if err != nil {
		return err
	}
	if (tmp27 != -1) {
		tmp28, err := this.LenBodyExpected()
		if err != nil {
			return err
		}
		tmp26 = (this._root.Header.LenChunkHeader + tmp28)
	} else {
		tmp26 = this.LenChunk
	}
	if !(this.LenChunk == tmp26) {
		return kaitai.NewValidationNotEqualError(tmp23, this.LenChunk, this._io, "/types/chunk/types/chunk_header/seq/3")
	}
	return err
}
func (this *AndroidSparse_Chunk_ChunkHeader) LenBody() (v int, err error) {
	if (this._f_lenBody) {
		return this.lenBody, nil
	}
	this.lenBody = int((this.LenChunk - this._root.Header.LenChunkHeader))
	this._f_lenBody = true
	return this.lenBody, nil
}

/**
 * @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#184">Source</a>
 * @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#215">Source</a>
 * @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#249">Source</a>
 * @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#270">Source</a>
 */
func (this *AndroidSparse_Chunk_ChunkHeader) LenBodyExpected() (v int, err error) {
	if (this._f_lenBodyExpected) {
		return this.lenBodyExpected, nil
	}
	var tmp29 int;
	if (this.ChunkType == AndroidSparse_ChunkTypes__Raw) {
		tmp29 = (this._root.Header.BlockSize * this.NumBodyBlocks)
	} else {
		var tmp30 int8;
		if (this.ChunkType == AndroidSparse_ChunkTypes__Fill) {
			tmp30 = 4
		} else {
			var tmp31 int8;
			if (this.ChunkType == AndroidSparse_ChunkTypes__DontCare) {
				tmp31 = 0
			} else {
				var tmp32 int8;
				if (this.ChunkType == AndroidSparse_ChunkTypes__Crc32) {
					tmp32 = 4
				} else {
					tmp32 = -1
				}
				tmp31 = tmp32
			}
			tmp30 = tmp31
		}
		tmp29 = tmp30
	}
	this.lenBodyExpected = int(tmp29)
	this._f_lenBodyExpected = true
	return this.lenBodyExpected, nil
}

/**
 * size of the chunk body in blocks in output image
 */

/**
 * in bytes of chunk input file including chunk header and data
 */
type AndroidSparse_Version struct {
	Major uint16
	Minor uint16
	_io *kaitai.Stream
	_root *AndroidSparse
	_parent *AndroidSparse_FileHeaderPrefix
}
func NewAndroidSparse_Version() *AndroidSparse_Version {
	return &AndroidSparse_Version{
	}
}

func (this *AndroidSparse_Version) Read(io *kaitai.Stream, parent *AndroidSparse_FileHeaderPrefix, root *AndroidSparse) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Major = uint16(tmp33)
	if !(this.Major == 1) {
		return kaitai.NewValidationNotEqualError(1, this.Major, this._io, "/types/version/seq/0")
	}
	tmp34, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Minor = uint16(tmp34)
	return err
}
