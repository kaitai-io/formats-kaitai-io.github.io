// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * Compressed resource data in `'dcmp' (2)` format,
 * as stored in compressed resources with header type `9` and decompressor ID `2`.
 * 
 * The `'dcmp' (2)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the System file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (2)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format is based on simple dictionary coding,
 * where each byte in the compressed data expands to two bytes,
 * based on a lookup table
 * (either included in the compressed data or provided by the decompressor).
 * An alternative "tagged" compression format is also supported,
 * which allows using two-byte literals in addition to single-byte table references,
 * at the cost of requiring an extra "tag" byte every 16 output bytes,
 * to differentiate literals and table references.
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp2.py">Source</a>
 */
type Dcmp2 struct {
	CustomLookupTable [][]byte
	Data interface{}
	LastByte []byte
	LenDecompressed uint32
	HeaderParametersWithIo *BytesWithIo
	_io *kaitai.Stream
	_root *Dcmp2
	_parent interface{}
	_raw_Data []byte
	_f_headerParameters bool
	headerParameters *Dcmp2_HeaderParameters
	_f_isLenDecompressedOdd bool
	isLenDecompressedOdd bool
	_f_defaultLookupTable bool
	defaultLookupTable [][]byte
	_f_lookupTable bool
	lookupTable [][]byte
}
func NewDcmp2(lenDecompressed uint32, headerParametersWithIo *BytesWithIo) *Dcmp2 {
	return &Dcmp2{
		LenDecompressed: lenDecompressed,
		HeaderParametersWithIo: headerParametersWithIo,
	}
}

func (this *Dcmp2) Read(io *kaitai.Stream, parent interface{}, root *Dcmp2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this.HeaderParameters()
	if err != nil {
		return err
	}
	if (tmp1.Flags.HasCustomLookupTable) {
		tmp2, err := this.HeaderParameters()
		if err != nil {
			return err
		}
		tmp3, err := tmp2.NumCustomLookupTableEntries()
		if err != nil {
			return err
		}
		this.CustomLookupTable = make([][]byte, tmp3)
		for i := range this.CustomLookupTable {
			tmp4, err := this._io.ReadBytes(int(2))
			if err != nil {
				return err
			}
			tmp4 = tmp4
			this.CustomLookupTable[i] = tmp4
		}
	}
	tmp5, err := this.HeaderParameters()
	if err != nil {
		return err
	}
	switch (tmp5.Flags.Tagged) {
	case true:
		tmp6, err := this._io.Size()
		if err != nil {
			return err
		}
		tmp7, err := this._io.Pos()
		if err != nil {
			return err
		}
		var tmp8 int8;
		tmp9, err := this.IsLenDecompressedOdd()
		if err != nil {
			return err
		}
		if (tmp9) {
			tmp8 = 1
		} else {
			tmp8 = 0
		}
		tmp10, err := this._io.ReadBytes(int(((tmp6 - tmp7) - tmp8)))
		if err != nil {
			return err
		}
		tmp10 = tmp10
		this._raw_Data = tmp10
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp11 := NewDcmp2_TaggedData()
		err = tmp11.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp11
	default:
		tmp12, err := this._io.Size()
		if err != nil {
			return err
		}
		tmp13, err := this._io.Pos()
		if err != nil {
			return err
		}
		var tmp14 int8;
		tmp15, err := this.IsLenDecompressedOdd()
		if err != nil {
			return err
		}
		if (tmp15) {
			tmp14 = 1
		} else {
			tmp14 = 0
		}
		tmp16, err := this._io.ReadBytes(int(((tmp12 - tmp13) - tmp14)))
		if err != nil {
			return err
		}
		tmp16 = tmp16
		this._raw_Data = tmp16
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp17 := NewDcmp2_UntaggedData()
		err = tmp17.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp17
	}
	tmp18, err := this.IsLenDecompressedOdd()
	if err != nil {
		return err
	}
	if (tmp18) {
		tmp19, err := this._io.ReadBytes(int(1))
		if err != nil {
			return err
		}
		tmp19 = tmp19
		this.LastByte = tmp19
	}
	return err
}

/**
 * The parsed decompressor-specific parameters from the compressed resource header.
 */
func (this *Dcmp2) HeaderParameters() (v *Dcmp2_HeaderParameters, err error) {
	if (this._f_headerParameters) {
		return this.headerParameters, nil
	}
	thisIo := this.HeaderParametersWithIo._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp20 := NewDcmp2_HeaderParameters()
	err = tmp20.Read(thisIo, this, this._root)
	if err != nil {
		return nil, err
	}
	this.headerParameters = tmp20
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_headerParameters = true
	this._f_headerParameters = true
	return this.headerParameters, nil
}

/**
 * Whether the length of the decompressed data is odd.
 * This affects the meaning of the last byte of the compressed data.
 */
func (this *Dcmp2) IsLenDecompressedOdd() (v bool, err error) {
	if (this._f_isLenDecompressedOdd) {
		return this.isLenDecompressedOdd, nil
	}
	tmp21 := this.LenDecompressed % 2
	if tmp21 < 0 {
		tmp21 += 2
	}
	this.isLenDecompressedOdd = bool(tmp21 != 0)
	this._f_isLenDecompressedOdd = true
	return this.isLenDecompressedOdd, nil
}

/**
 * The default lookup table,
 * which is used if no custom lookup table is included with the compressed data.
 */
func (this *Dcmp2) DefaultLookupTable() (v [][]byte, err error) {
	if (this._f_defaultLookupTable) {
		return this.defaultLookupTable, nil
	}
	this.defaultLookupTable = [][]byte([][]byte{[]uint8{0, 0}, []uint8{0, 8}, []uint8{78, 186}, []uint8{32, 110}, []uint8{78, 117}, []uint8{0, 12}, []uint8{0, 4}, []uint8{112, 0}, []uint8{0, 16}, []uint8{0, 2}, []uint8{72, 110}, []uint8{255, 252}, []uint8{96, 0}, []uint8{0, 1}, []uint8{72, 231}, []uint8{47, 46}, []uint8{78, 86}, []uint8{0, 6}, []uint8{78, 94}, []uint8{47, 0}, []uint8{97, 0}, []uint8{255, 248}, []uint8{47, 11}, []uint8{255, 255}, []uint8{0, 20}, []uint8{0, 10}, []uint8{0, 24}, []uint8{32, 95}, []uint8{0, 14}, []uint8{32, 80}, []uint8{63, 60}, []uint8{255, 244}, []uint8{76, 238}, []uint8{48, 46}, []uint8{103, 0}, []uint8{76, 223}, []uint8{38, 110}, []uint8{0, 18}, []uint8{0, 28}, []uint8{66, 103}, []uint8{255, 240}, []uint8{48, 60}, []uint8{47, 12}, []uint8{0, 3}, []uint8{78, 208}, []uint8{0, 32}, []uint8{112, 1}, []uint8{0, 22}, []uint8{45, 64}, []uint8{72, 192}, []uint8{32, 120}, []uint8{114, 0}, []uint8{88, 143}, []uint8{102, 0}, []uint8{79, 239}, []uint8{66, 167}, []uint8{103, 6}, []uint8{255, 250}, []uint8{85, 143}, []uint8{40, 110}, []uint8{63, 0}, []uint8{255, 254}, []uint8{47, 60}, []uint8{103, 4}, []uint8{89, 143}, []uint8{32, 107}, []uint8{0, 36}, []uint8{32, 31}, []uint8{65, 250}, []uint8{129, 225}, []uint8{102, 4}, []uint8{103, 8}, []uint8{0, 26}, []uint8{78, 185}, []uint8{80, 143}, []uint8{32, 46}, []uint8{0, 7}, []uint8{78, 176}, []uint8{255, 242}, []uint8{61, 64}, []uint8{0, 30}, []uint8{32, 104}, []uint8{102, 6}, []uint8{255, 246}, []uint8{78, 249}, []uint8{8, 0}, []uint8{12, 64}, []uint8{61, 124}, []uint8{255, 236}, []uint8{0, 5}, []uint8{32, 60}, []uint8{255, 232}, []uint8{222, 252}, []uint8{74, 46}, []uint8{0, 48}, []uint8{0, 40}, []uint8{47, 8}, []uint8{32, 11}, []uint8{96, 2}, []uint8{66, 110}, []uint8{45, 72}, []uint8{32, 83}, []uint8{32, 64}, []uint8{24, 0}, []uint8{96, 4}, []uint8{65, 238}, []uint8{47, 40}, []uint8{47, 1}, []uint8{103, 10}, []uint8{72, 64}, []uint8{32, 7}, []uint8{102, 8}, []uint8{1, 24}, []uint8{47, 7}, []uint8{48, 40}, []uint8{63, 46}, []uint8{48, 43}, []uint8{34, 110}, []uint8{47, 43}, []uint8{0, 44}, []uint8{103, 12}, []uint8{34, 95}, []uint8{96, 6}, []uint8{0, 255}, []uint8{48, 7}, []uint8{255, 238}, []uint8{83, 64}, []uint8{0, 64}, []uint8{255, 228}, []uint8{74, 64}, []uint8{102, 10}, []uint8{0, 15}, []uint8{78, 173}, []uint8{112, 255}, []uint8{34, 216}, []uint8{72, 107}, []uint8{0, 34}, []uint8{32, 75}, []uint8{103, 14}, []uint8{74, 174}, []uint8{78, 144}, []uint8{255, 224}, []uint8{255, 192}, []uint8{0, 42}, []uint8{39, 64}, []uint8{103, 2}, []uint8{81, 200}, []uint8{2, 182}, []uint8{72, 122}, []uint8{34, 120}, []uint8{176, 110}, []uint8{255, 230}, []uint8{0, 9}, []uint8{50, 46}, []uint8{62, 0}, []uint8{72, 65}, []uint8{255, 234}, []uint8{67, 238}, []uint8{78, 113}, []uint8{116, 0}, []uint8{47, 44}, []uint8{32, 108}, []uint8{0, 60}, []uint8{0, 38}, []uint8{0, 80}, []uint8{24, 128}, []uint8{48, 31}, []uint8{34, 0}, []uint8{102, 12}, []uint8{255, 218}, []uint8{0, 56}, []uint8{102, 2}, []uint8{48, 44}, []uint8{32, 12}, []uint8{45, 110}, []uint8{66, 64}, []uint8{255, 226}, []uint8{169, 240}, []uint8{255, 0}, []uint8{55, 124}, []uint8{229, 128}, []uint8{255, 220}, []uint8{72, 104}, []uint8{89, 79}, []uint8{0, 52}, []uint8{62, 31}, []uint8{96, 8}, []uint8{47, 6}, []uint8{255, 222}, []uint8{96, 10}, []uint8{112, 2}, []uint8{0, 50}, []uint8{255, 204}, []uint8{0, 128}, []uint8{34, 81}, []uint8{16, 31}, []uint8{49, 124}, []uint8{160, 41}, []uint8{255, 216}, []uint8{82, 64}, []uint8{1, 0}, []uint8{103, 16}, []uint8{160, 35}, []uint8{255, 206}, []uint8{255, 212}, []uint8{32, 6}, []uint8{72, 120}, []uint8{0, 46}, []uint8{80, 79}, []uint8{67, 250}, []uint8{103, 18}, []uint8{118, 0}, []uint8{65, 232}, []uint8{74, 110}, []uint8{32, 217}, []uint8{0, 90}, []uint8{127, 255}, []uint8{81, 202}, []uint8{0, 92}, []uint8{46, 0}, []uint8{2, 64}, []uint8{72, 199}, []uint8{103, 20}, []uint8{12, 128}, []uint8{46, 159}, []uint8{255, 214}, []uint8{128, 0}, []uint8{16, 0}, []uint8{72, 66}, []uint8{74, 107}, []uint8{255, 210}, []uint8{0, 72}, []uint8{74, 71}, []uint8{78, 209}, []uint8{32, 111}, []uint8{0, 65}, []uint8{96, 12}, []uint8{42, 120}, []uint8{66, 46}, []uint8{50, 0}, []uint8{101, 116}, []uint8{103, 22}, []uint8{0, 68}, []uint8{72, 109}, []uint8{32, 8}, []uint8{72, 108}, []uint8{11, 124}, []uint8{38, 64}, []uint8{4, 0}, []uint8{0, 104}, []uint8{32, 109}, []uint8{0, 13}, []uint8{42, 64}, []uint8{0, 11}, []uint8{0, 62}, []uint8{2, 32}})
	this._f_defaultLookupTable = true
	return this.defaultLookupTable, nil
}

/**
 * The lookup table to be used for this compressed data.
 */
func (this *Dcmp2) LookupTable() (v [][]byte, err error) {
	if (this._f_lookupTable) {
		return this.lookupTable, nil
	}
	var tmp22 [][]byte;
	tmp23, err := this.HeaderParameters()
	if err != nil {
		return nil, err
	}
	if (tmp23.Flags.HasCustomLookupTable) {
		tmp22 = this.CustomLookupTable
	} else {
		tmp24, err := this.DefaultLookupTable()
		if err != nil {
			return nil, err
		}
		tmp22 = tmp24
	}
	this.lookupTable = [][]byte(tmp22)
	this._f_lookupTable = true
	return this.lookupTable, nil
}

/**
 * The custom lookup table to be used instead of the default lookup table.
 */

/**
 * The compressed data.
 * The structure of the data varies depending on whether the "tagged" or "untagged" variant of the compression format is used.
 */

/**
 * The last byte of the decompressed data,
 * stored literally.
 * Only present if the decompressed data has an odd length.
 * 
 * This special case is necessary because the compressed data is otherwise always stored in two-byte groups,
 * either literally or as table references,
 * so otherwise there would be no way to compress odd-length resources using this format.
 */

/**
 * Decompressor-specific parameters for this compression format,
 * as stored in the compressed resource header.
 */
type Dcmp2_HeaderParameters struct {
	Unknown uint16
	NumCustomLookupTableEntriesM1 uint8
	Flags *Dcmp2_HeaderParameters_Flags
	_io *kaitai.Stream
	_root *Dcmp2
	_parent *Dcmp2
	_f_numCustomLookupTableEntries bool
	numCustomLookupTableEntries int
}
func NewDcmp2_HeaderParameters() *Dcmp2_HeaderParameters {
	return &Dcmp2_HeaderParameters{
	}
}

func (this *Dcmp2_HeaderParameters) Read(io *kaitai.Stream, parent *Dcmp2, root *Dcmp2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Unknown = uint16(tmp25)
	tmp26, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumCustomLookupTableEntriesM1 = tmp26
	tmp27 := NewDcmp2_HeaderParameters_Flags()
	err = tmp27.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp27
	return err
}

/**
 * The number of entries in the custom lookup table.
 * Only used if a custom lookup table is present.
 */
func (this *Dcmp2_HeaderParameters) NumCustomLookupTableEntries() (v int, err error) {
	if (this._f_numCustomLookupTableEntries) {
		return this.numCustomLookupTableEntries, nil
	}
	if (this.Flags.HasCustomLookupTable) {
		this.numCustomLookupTableEntries = int((this.NumCustomLookupTableEntriesM1 + 1))
	}
	this._f_numCustomLookupTableEntries = true
	return this.numCustomLookupTableEntries, nil
}

/**
 * The meaning of this field is unknown.
 * It does not appear to have any effect on the format of the compressed data or the decompression process.
 * 
 * The value of this field is usually zero and otherwise a small integer (< 10).
 * For `'lpch'` resources,
 * the value is always nonzero,
 * and sometimes larger than usual.
 */

/**
 * The number of entries in the custom lookup table,
 * minus one.
 * 
 * If the default lookup table is used rather than a custom one,
 * this value is zero.
 */

/**
 * Various flags that affect the format of the compressed data and the decompression process.
 */

/**
 * Flags for the decompressor,
 * as stored in the decompressor-specific parameters.
 */
type Dcmp2_HeaderParameters_Flags struct {
	Reserved uint64
	Tagged bool
	HasCustomLookupTable bool
	_io *kaitai.Stream
	_root *Dcmp2
	_parent *Dcmp2_HeaderParameters
	_f_asInt bool
	asInt uint8
}
func NewDcmp2_HeaderParameters_Flags() *Dcmp2_HeaderParameters_Flags {
	return &Dcmp2_HeaderParameters_Flags{
	}
}

func (this *Dcmp2_HeaderParameters_Flags) Read(io *kaitai.Stream, parent *Dcmp2_HeaderParameters, root *Dcmp2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.Reserved = tmp28
	tmp29, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Tagged = tmp29 != 0
	tmp30, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasCustomLookupTable = tmp30 != 0
	return err
}

/**
 * The flags as a packed integer,
 * as they are stored in the data.
 */
func (this *Dcmp2_HeaderParameters_Flags) AsInt() (v uint8, err error) {
	if (this._f_asInt) {
		return this.asInt, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp31, err := this._io.ReadU1()
	if err != nil {
		return 0, err
	}
	this.asInt = tmp31
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_asInt = true
	this._f_asInt = true
	return this.asInt, nil
}

/**
 * These flags have no known usage or meaning and should always be zero.
 */

/**
 * Whether the "tagged" variant of this compression format should be used,
 * rather than the default "untagged" variant.
 */

/**
 * Whether a custom lookup table is included before the compressed data,
 * which should be used instead of the default hardcoded lookup table.
 */

/**
 * Compressed data in the "untagged" variant of the format.
 */
type Dcmp2_UntaggedData struct {
	TableReferences []uint8
	_io *kaitai.Stream
	_root *Dcmp2
	_parent *Dcmp2
}
func NewDcmp2_UntaggedData() *Dcmp2_UntaggedData {
	return &Dcmp2_UntaggedData{
	}
}

func (this *Dcmp2_UntaggedData) Read(io *kaitai.Stream, parent *Dcmp2, root *Dcmp2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp32, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp32 {
			break
		}
		tmp33, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.TableReferences = append(this.TableReferences, tmp33)
	}
	return err
}

/**
 * References into the lookup table.
 * Each reference is an integer that is expanded to two bytes by looking it up in the table.
 */

/**
 * Compressed data in the "tagged" variant of the format.
 */
type Dcmp2_TaggedData struct {
	Chunks []*Dcmp2_TaggedData_Chunk
	_io *kaitai.Stream
	_root *Dcmp2
	_parent *Dcmp2
}
func NewDcmp2_TaggedData() *Dcmp2_TaggedData {
	return &Dcmp2_TaggedData{
	}
}

func (this *Dcmp2_TaggedData) Read(io *kaitai.Stream, parent *Dcmp2, root *Dcmp2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp34, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp34 {
			break
		}
		tmp35 := NewDcmp2_TaggedData_Chunk()
		err = tmp35.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Chunks = append(this.Chunks, tmp35)
	}
	return err
}

/**
 * The tagged chunks that make up the compressed data.
 */

/**
 * A single tagged chunk of compressed data.
 * 
 * Each chunk expands to 16 bytes of decompressed data.
 * In compressed form,
 * the chunks have a variable length
 * (between 9 and 17 bytes)
 * depending on the value of the tag byte.
 */
type Dcmp2_TaggedData_Chunk struct {
	Tag []bool
	Units []interface{}
	_io *kaitai.Stream
	_root *Dcmp2
	_parent *Dcmp2_TaggedData
}
func NewDcmp2_TaggedData_Chunk() *Dcmp2_TaggedData_Chunk {
	return &Dcmp2_TaggedData_Chunk{
	}
}

func (this *Dcmp2_TaggedData_Chunk) Read(io *kaitai.Stream, parent *Dcmp2_TaggedData, root *Dcmp2) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Tag = make([]bool, 8)
	for i := range this.Tag {
		tmp36, err := this._io.ReadBitsIntBe(1)
		if err != nil {
			return err
		}
		this.Tag[i] = tmp36 != 0
	}
	this._io.AlignToByte()
	this._raw_Units = make([][]byte, 0);
	for i := 1;; i++ {
		switch (this.Tag[i]) {
		case true:
			tmp37, err := this._io.ReadU1()
			if err != nil {
				return err
			}
			_it := tmp37
			this.Units = append(this.Units, _it)
		default:
			var tmp38 int8;
			if (this.Tag[i]) {
				tmp38 = 1
			} else {
				tmp38 = 2
			}
			tmp39, err := this._io.ReadBytes(int(tmp38))
			if err != nil {
				return err
			}
			tmp39 = tmp39
			_it := tmp39
			this._raw_Units = append(this._raw_Units, _it)
		}
		tmp40, err := this._io.EOF()
		if err != nil {
			return err
		}
		if  ((i >= 7) || (tmp40))  {
			break
		}
	}
	return err
}

/**
 * The bits of the tag byte control the format and meaning of the 8 compressed data units that follow the tag byte.
 */

/**
 * The compressed data units in this chunk.
 * 
 * The format and meaning of each unit is controlled by the bit in the tag byte with the same index.
 * If the bit is 0 (false),
 * the unit is a pair of bytes,
 * which are literally copied to the decompressed data.
 * If the bit is 1 (true),
 * the unit is a reference into the lookup table,
 * an integer which is expanded to two bytes by looking it up in the table.
 */
