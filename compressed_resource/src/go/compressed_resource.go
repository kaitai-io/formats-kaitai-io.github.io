// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * Compressed Macintosh resource data,
 * as stored in resources with the "compressed" attribute.
 * 
 * Resource decompression is not documented by Apple.
 * It is mostly used internally in System 7,
 * some of Apple's own applications (such as ResEdit),
 * and also by some third-party applications.
 * Later versions of Classic Mac OS make less use of resource compression,
 * but still support it fully for backwards compatibility.
 * Carbon in Mac OS X no longer supports resource compression in any way.
 * 
 * The data of all compressed resources starts with a common header,
 * followed by the compressed data.
 * The data is decompressed using code in a `'dcmp'` resource.
 * Some decompressors used by Apple are included in the System file,
 * but applications can also include custom decompressors.
 * The header of the compressed data indicates the ID of the `'dcmp'` resource used to decompress the data,
 * along with some parameters for the decompressor.
 * @see <a href="http://www.alysis.us/arctechnology.htm">Source</a>
 * @see <a href="http://preserve.mactech.com/articles/mactech/Vol.09/09.01/ResCompression/index.html">Source</a>
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/tree/f891a6e/src/rsrcfork/compress">Source</a>
 */
type CompressedResource struct {
	Header *CompressedResource_Header
	CompressedData []byte
	_io *kaitai.Stream
	_root *CompressedResource
	_parent interface{}
}
func NewCompressedResource() *CompressedResource {
	return &CompressedResource{
	}
}

func (this *CompressedResource) Read(io *kaitai.Stream, parent interface{}, root *CompressedResource) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewCompressedResource_Header()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	tmp2, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.CompressedData = tmp2
	return err
}

/**
 * The header of the compressed data.
 */

/**
 * The compressed resource data.
 * 
 * The format of this data is completely dependent on the decompressor and its parameters,
 * as specified in the header.
 * For details about the compressed data formats implemented by Apple's decompressors,
 * see the specs in the resource_compression subdirectory.
 */

/**
 * Compressed resource data header,
 * as stored at the start of all compressed resources.
 */
type CompressedResource_Header struct {
	CommonPart *CompressedResource_Header_CommonPart
	TypeSpecificPartRawWithIo *BytesWithIo
	_io *kaitai.Stream
	_root *CompressedResource
	_parent *CompressedResource
	_raw_TypeSpecificPartRawWithIo []byte
	_f_typeSpecificPartRaw bool
	typeSpecificPartRaw []byte
	_f_typeSpecificPart bool
	typeSpecificPart interface{}
}
func NewCompressedResource_Header() *CompressedResource_Header {
	return &CompressedResource_Header{
	}
}

func (this *CompressedResource_Header) Read(io *kaitai.Stream, parent *CompressedResource, root *CompressedResource) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3 := NewCompressedResource_Header_CommonPart()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.CommonPart = tmp3
	tmp4, err := this._io.ReadBytes(int((this.CommonPart.LenHeader - 12)))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this._raw_TypeSpecificPartRawWithIo = tmp4
	_io__raw_TypeSpecificPartRawWithIo := kaitai.NewStream(bytes.NewReader(this._raw_TypeSpecificPartRawWithIo))
	tmp5 := NewBytesWithIo()
	err = tmp5.Read(_io__raw_TypeSpecificPartRawWithIo, this, nil)
	if err != nil {
		return err
	}
	this.TypeSpecificPartRawWithIo = tmp5
	return err
}

/**
 * The type-specific part of the header,
 * as a raw byte array.
 */
func (this *CompressedResource_Header) TypeSpecificPartRaw() (v []byte, err error) {
	if (this._f_typeSpecificPartRaw) {
		return this.typeSpecificPartRaw, nil
	}
	this.typeSpecificPartRaw = []byte(this.TypeSpecificPartRawWithIo.Data)
	this._f_typeSpecificPartRaw = true
	return this.typeSpecificPartRaw, nil
}

/**
 * The type-specific part of the header,
 * parsed according to the type from the common part.
 */
func (this *CompressedResource_Header) TypeSpecificPart() (v interface{}, err error) {
	if (this._f_typeSpecificPart) {
		return this.typeSpecificPart, nil
	}
	thisIo := this.TypeSpecificPartRawWithIo._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch (this.CommonPart.HeaderType) {
	case 8:
		tmp6 := NewCompressedResource_Header_TypeSpecificPartType8()
		err = tmp6.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.typeSpecificPart = tmp6
	case 9:
		tmp7 := NewCompressedResource_Header_TypeSpecificPartType9()
		err = tmp7.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.typeSpecificPart = tmp7
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_typeSpecificPart = true
	this._f_typeSpecificPart = true
	return this.typeSpecificPart, nil
}

/**
 * The common part of the header.
 * Among other things,
 * this part contains the header type,
 * which determines the format of the data in the type-specific part of the header.
 */

/**
 * Use `type_specific_part_raw` instead,
 * unless you need access to this field's `_io`.
 */

/**
 * The common part of a compressed resource data header.
 * The format of this part is the same for all compressed resources.
 */
type CompressedResource_Header_CommonPart struct {
	Magic []byte
	LenHeader uint16
	HeaderType uint8
	Unknown uint8
	LenDecompressed uint32
	_io *kaitai.Stream
	_root *CompressedResource
	_parent *CompressedResource_Header
}
func NewCompressedResource_Header_CommonPart() *CompressedResource_Header_CommonPart {
	return &CompressedResource_Header_CommonPart{
	}
}

func (this *CompressedResource_Header_CommonPart) Read(io *kaitai.Stream, parent *CompressedResource_Header, root *CompressedResource) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Magic = tmp8
	if !(bytes.Equal(this.Magic, []uint8{168, 159, 101, 114})) {
		return kaitai.NewValidationNotEqualError([]uint8{168, 159, 101, 114}, this.Magic, this._io, "/types/header/types/common_part/seq/0")
	}
	tmp9, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenHeader = uint16(tmp9)
	if !(this.LenHeader == 18) {
		return kaitai.NewValidationNotEqualError(18, this.LenHeader, this._io, "/types/header/types/common_part/seq/1")
	}
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HeaderType = tmp10
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Unknown = tmp11
	if !(this.Unknown == 1) {
		return kaitai.NewValidationNotEqualError(1, this.Unknown, this._io, "/types/header/types/common_part/seq/3")
	}
	tmp12, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenDecompressed = uint32(tmp12)
	return err
}

/**
 * The signature of all compressed resource data.
 * 
 * When interpreted as MacRoman, this byte sequence decodes to `®üer`.
 */

/**
 * The byte length of the entire header (common and type-specific parts).
 * 
 * The meaning of this field is mostly a guess,
 * as all known header types result in a total length of `0x12`.
 */

/**
 * Type of the header.
 * This determines the format of the data in the type-specific part of the header.
 * 
 * The only known header type values are `8` and `9`.
 * 
 * Every known decompressor is only compatible with one of the header types
 * (but every header type is used by more than one decompressor).
 * Apple's decompressors with IDs 0 and 1 use header type 8,
 * and those with IDs 2 and 3 use header type 9.
 */

/**
 * The meaning of this field is not known.
 * It has the value `0x01` in all known compressed resources.
 */

/**
 * The byte length of the data after decompression.
 */

/**
 * The type-specific part of a compressed resource header with header type `8`.
 */
type CompressedResource_Header_TypeSpecificPartType8 struct {
	WorkingBufferFractionalSize uint8
	ExpansionBufferSize uint8
	DecompressorId int16
	Reserved uint16
	_io *kaitai.Stream
	_root *CompressedResource
	_parent *CompressedResource_Header
}
func NewCompressedResource_Header_TypeSpecificPartType8() *CompressedResource_Header_TypeSpecificPartType8 {
	return &CompressedResource_Header_TypeSpecificPartType8{
	}
}

func (this *CompressedResource_Header_TypeSpecificPartType8) Read(io *kaitai.Stream, parent *CompressedResource_Header, root *CompressedResource) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.WorkingBufferFractionalSize = tmp13
	tmp14, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ExpansionBufferSize = tmp14
	tmp15, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.DecompressorId = int16(tmp15)
	tmp16, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Reserved = uint16(tmp16)
	if !(this.Reserved == 0) {
		return kaitai.NewValidationNotEqualError(0, this.Reserved, this._io, "/types/header/types/type_specific_part_type_8/seq/3")
	}
	return err
}

/**
 * The ratio of the compressed data size to the uncompressed data size,
 * times 256.
 * 
 * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
 * but does not have a direct effect on the decompressor
 * (except that it will misbehave if insufficient memory is provided).
 * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
 */

/**
 * The maximum number of bytes that the compressed data might "grow" during decompression.
 * 
 * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
 * but does not have a direct effect on the decompressor
 * (except that it will misbehave if insufficient memory is provided).
 * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
 */

/**
 * The ID of the `'dcmp'` resource that should be used to decompress this resource.
 */

/**
 * The meaning of this field is not known.
 * It has the value `0` in all known compressed resources,
 * so it is most likely reserved.
 */

/**
 * The type-specific part of a compressed resource header with header type `9`.
 */
type CompressedResource_Header_TypeSpecificPartType9 struct {
	DecompressorId int16
	DecompressorSpecificParametersWithIo *BytesWithIo
	_io *kaitai.Stream
	_root *CompressedResource
	_parent *CompressedResource_Header
	_raw_DecompressorSpecificParametersWithIo []byte
	_f_decompressorSpecificParameters bool
	decompressorSpecificParameters []byte
}
func NewCompressedResource_Header_TypeSpecificPartType9() *CompressedResource_Header_TypeSpecificPartType9 {
	return &CompressedResource_Header_TypeSpecificPartType9{
	}
}

func (this *CompressedResource_Header_TypeSpecificPartType9) Read(io *kaitai.Stream, parent *CompressedResource_Header, root *CompressedResource) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.DecompressorId = int16(tmp17)
	tmp18, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this._raw_DecompressorSpecificParametersWithIo = tmp18
	_io__raw_DecompressorSpecificParametersWithIo := kaitai.NewStream(bytes.NewReader(this._raw_DecompressorSpecificParametersWithIo))
	tmp19 := NewBytesWithIo()
	err = tmp19.Read(_io__raw_DecompressorSpecificParametersWithIo, this, nil)
	if err != nil {
		return err
	}
	this.DecompressorSpecificParametersWithIo = tmp19
	return err
}

/**
 * Decompressor-specific parameters.
 * The exact structure and meaning of this field is different for each decompressor.
 * 
 * This field always has the same length,
 * but decompressors don't always use the entirety of the field,
 * so depending on the decompressor some parts of this field may be meaningless.
 */
func (this *CompressedResource_Header_TypeSpecificPartType9) DecompressorSpecificParameters() (v []byte, err error) {
	if (this._f_decompressorSpecificParameters) {
		return this.decompressorSpecificParameters, nil
	}
	this.decompressorSpecificParameters = []byte(this.DecompressorSpecificParametersWithIo.Data)
	this._f_decompressorSpecificParameters = true
	return this.decompressorSpecificParameters, nil
}

/**
 * The ID of the `'dcmp'` resource that should be used to decompress this resource.
 */

/**
 * Use `decompressor_specific_parameters` instead,
 * unless you need access to this field's `_io`.
 */
