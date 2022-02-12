// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * Compressed resource data in `'dcmp' (0)` format,
 * as stored in compressed resources with header type `8` and decompressor ID `0`.
 * 
 * The `'dcmp' (0)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for most compressed resources in System 7.0's files.
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * 
 * This compression format supports some basic general-purpose compression schemes,
 * including backreferences to previous data,
 * run-length encoding,
 * and delta encoding.
 * It also includes some types of compression tailored specifically to Mac OS resources,
 * including a set of single-byte codes that correspond to entries in a hard-coded lookup table,
 * and a specialized kind of delta encoding for segment loader jump tables.
 * 
 * Almost all parts of this compression format operate on units of 2 or 4 bytes.
 * As a result,
 * it is nearly impossible to store data with an odd length in this format.
 * To work around this limitation,
 * odd-length resources are padded with an extra byte before compressing them with this format.
 * This extra byte is ignored after decompression,
 * as the real (odd) length of the resource is stored in the compressed resource header.
 * 
 * The `'dcmp' (1)` compression format (see dcmp_1.ksy) is very similar to this format,
 * with the main difference that it operates mostly on single bytes rather than two-byte units.
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp0.py">Source</a>
 */
type Dcmp0 struct {
	Chunks []*Dcmp0_Chunk
	_io *kaitai.Stream
	_root *Dcmp0
	_parent interface{}
}
func NewDcmp0() *Dcmp0 {
	return &Dcmp0{
	}
}

func (this *Dcmp0) Read(io *kaitai.Stream, parent interface{}, root *Dcmp0) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1 := NewDcmp0_Chunk()
		err = tmp1.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp1
		this.Chunks = append(this.Chunks, _it)
		if _it.Tag == 255 {
			break
		}
	}
	return err
}

/**
 * The sequence of chunks that make up the compressed data.
 */

/**
 * A single chunk of compressed data.
 * Each chunk in the compressed data expands to a sequence of bytes in the uncompressed data,
 * except when `tag == 0xff`,
 * which marks the end of the data and does not correspond to any bytes in the uncompressed data.
 * 
 * Most chunks are stateless and always expand to the same data,
 * regardless of where the chunk appears in the sequence.
 * However,
 * some chunks affect the behavior of future chunks,
 * or expand to different data depending on which chunks came before them.
 */

type Dcmp0_Chunk_TagKind int
const (
	Dcmp0_Chunk_TagKind__Invalid Dcmp0_Chunk_TagKind = -1
	Dcmp0_Chunk_TagKind__Literal Dcmp0_Chunk_TagKind = 0
	Dcmp0_Chunk_TagKind__Backreference Dcmp0_Chunk_TagKind = 1
	Dcmp0_Chunk_TagKind__TableLookup Dcmp0_Chunk_TagKind = 2
	Dcmp0_Chunk_TagKind__Extended Dcmp0_Chunk_TagKind = 3
	Dcmp0_Chunk_TagKind__End Dcmp0_Chunk_TagKind = 4
)
type Dcmp0_Chunk struct {
	Tag uint8
	Body interface{}
	_io *kaitai.Stream
	_root *Dcmp0
	_parent *Dcmp0
}
func NewDcmp0_Chunk() *Dcmp0_Chunk {
	return &Dcmp0_Chunk{
	}
}

func (this *Dcmp0_Chunk) Read(io *kaitai.Stream, parent *Dcmp0, root *Dcmp0) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp2, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Tag = tmp2
	var tmp3 Dcmp0_Chunk_TagKind;
	if ( ((this.Tag >= 0) && (this.Tag <= 31)) ) {
		tmp3 = Dcmp0_Chunk_TagKind__Literal
	} else {
		var tmp4 Dcmp0_Chunk_TagKind;
		if ( ((this.Tag >= 32) && (this.Tag <= 74)) ) {
			tmp4 = Dcmp0_Chunk_TagKind__Backreference
		} else {
			var tmp5 Dcmp0_Chunk_TagKind;
			if ( ((this.Tag >= 75) && (this.Tag <= 253)) ) {
				tmp5 = Dcmp0_Chunk_TagKind__TableLookup
			} else {
				var tmp6 Dcmp0_Chunk_TagKind;
				if (this.Tag == 254) {
					tmp6 = Dcmp0_Chunk_TagKind__Extended
				} else {
					var tmp7 Dcmp0_Chunk_TagKind;
					if (this.Tag == 255) {
						tmp7 = Dcmp0_Chunk_TagKind__End
					} else {
						tmp7 = Dcmp0_Chunk_TagKind__Invalid
					}
					tmp6 = tmp7
				}
				tmp5 = tmp6
			}
			tmp4 = tmp5
		}
		tmp3 = tmp4
	}
	switch (tmp3) {
	case Dcmp0_Chunk_TagKind__Extended:
		tmp8 := NewDcmp0_Chunk_ExtendedBody()
		err = tmp8.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp8
	case Dcmp0_Chunk_TagKind__Literal:
		tmp9 := NewDcmp0_Chunk_LiteralBody(this.Tag)
		err = tmp9.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp9
	case Dcmp0_Chunk_TagKind__End:
		tmp10 := NewDcmp0_Chunk_EndBody()
		err = tmp10.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp10
	case Dcmp0_Chunk_TagKind__TableLookup:
		tmp11 := NewDcmp0_Chunk_TableLookupBody(this.Tag)
		err = tmp11.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp11
	case Dcmp0_Chunk_TagKind__Backreference:
		tmp12 := NewDcmp0_Chunk_BackreferenceBody(this.Tag)
		err = tmp12.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp12
	}
	return err
}

/**
 * The chunk's tag byte.
 * This controls the structure of the body and the meaning of the chunk.
 */

/**
 * The chunk's body.
 * 
 * Certain chunks do not have any data following the tag byte.
 * In this case,
 * the body is a zero-length structure.
 */

/**
 * The body of a literal data chunk.
 * 
 * The data that this chunk expands to is stored literally in the body (`literal`).
 * Optionally,
 * the literal data may also be stored for use by future backreference chunks (`do_store`).
 * 
 * The length of the literal data is stored as a number of two-byte units.
 * This means that the literal data always has an even length in bytes.
 */
type Dcmp0_Chunk_LiteralBody struct {
	LenLiteralDiv2Separate uint8
	Literal []byte
	Tag uint8
	_io *kaitai.Stream
	_root *Dcmp0
	_parent *Dcmp0_Chunk
	_f_doStore bool
	doStore bool
	_f_lenLiteralDiv2 bool
	lenLiteralDiv2 int
	_f_lenLiteral bool
	lenLiteral int
	_f_lenLiteralDiv2InTag bool
	lenLiteralDiv2InTag int
	_f_isLenLiteralDiv2Separate bool
	isLenLiteralDiv2Separate bool
}
func NewDcmp0_Chunk_LiteralBody(tag uint8) *Dcmp0_Chunk_LiteralBody {
	return &Dcmp0_Chunk_LiteralBody{
		Tag: tag,
	}
}

func (this *Dcmp0_Chunk_LiteralBody) Read(io *kaitai.Stream, parent *Dcmp0_Chunk, root *Dcmp0) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this.IsLenLiteralDiv2Separate()
	if err != nil {
		return err
	}
	if (tmp13) {
		tmp14, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.LenLiteralDiv2Separate = tmp14
	}
	tmp15, err := this.LenLiteral()
	if err != nil {
		return err
	}
	tmp16, err := this._io.ReadBytes(int(tmp15))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.Literal = tmp16
	return err
}

/**
 * Whether this literal should be stored for use by future backreference chunks.
 * 
 * See the documentation of the `backreference_body` type for details about backreference chunks.
 */
func (this *Dcmp0_Chunk_LiteralBody) DoStore() (v bool, err error) {
	if (this._f_doStore) {
		return this.doStore, nil
	}
	this.doStore = bool((this.Tag & 16) != 0)
	this._f_doStore = true
	return this.doStore, nil
}

/**
 * The length of the literal data,
 * in two-byte units.
 * 
 * In practice,
 * this value is always greater than zero,
 * as there is no use in storing a zero-length literal.
 */
func (this *Dcmp0_Chunk_LiteralBody) LenLiteralDiv2() (v int, err error) {
	if (this._f_lenLiteralDiv2) {
		return this.lenLiteralDiv2, nil
	}
	var tmp17 uint8;
	tmp18, err := this.IsLenLiteralDiv2Separate()
	if err != nil {
		return 0, err
	}
	if (tmp18) {
		tmp17 = this.LenLiteralDiv2Separate
	} else {
		tmp19, err := this.LenLiteralDiv2InTag()
		if err != nil {
			return 0, err
		}
		tmp17 = tmp19
	}
	this.lenLiteralDiv2 = int(tmp17)
	this._f_lenLiteralDiv2 = true
	return this.lenLiteralDiv2, nil
}

/**
 * The length of the literal data,
 * in bytes.
 */
func (this *Dcmp0_Chunk_LiteralBody) LenLiteral() (v int, err error) {
	if (this._f_lenLiteral) {
		return this.lenLiteral, nil
	}
	tmp20, err := this.LenLiteralDiv2()
	if err != nil {
		return 0, err
	}
	this.lenLiteral = int((tmp20 * 2))
	this._f_lenLiteral = true
	return this.lenLiteral, nil
}

/**
 * The part of the tag byte that indicates the length of the literal data,
 * in two-byte units.
 * If this value is 0,
 * the length is stored in a separate byte after the tag byte and before the literal data.
 */
func (this *Dcmp0_Chunk_LiteralBody) LenLiteralDiv2InTag() (v int, err error) {
	if (this._f_lenLiteralDiv2InTag) {
		return this.lenLiteralDiv2InTag, nil
	}
	this.lenLiteralDiv2InTag = int((this.Tag & 15))
	this._f_lenLiteralDiv2InTag = true
	return this.lenLiteralDiv2InTag, nil
}

/**
 * Whether the length of the literal is stored separately from the tag.
 */
func (this *Dcmp0_Chunk_LiteralBody) IsLenLiteralDiv2Separate() (v bool, err error) {
	if (this._f_isLenLiteralDiv2Separate) {
		return this.isLenLiteralDiv2Separate, nil
	}
	tmp21, err := this.LenLiteralDiv2InTag()
	if err != nil {
		return false, err
	}
	this.isLenLiteralDiv2Separate = bool(tmp21 == 0)
	this._f_isLenLiteralDiv2Separate = true
	return this.isLenLiteralDiv2Separate, nil
}

/**
 * The length of the literal data,
 * in two-byte units.
 * 
 * This field is only present if the tag byte's low nibble is zero.
 * In practice,
 * this only happens if the length is 0x10 or greater,
 * because smaller lengths can be encoded into the tag byte.
 */

/**
 * The literal data.
 */

/**
 * The body of a backreference chunk.
 * 
 * This chunk expands to the data stored in a preceding literal chunk,
 * indicated by an index number (`index`).
 */
type Dcmp0_Chunk_BackreferenceBody struct {
	IndexSeparateMinus uint16
	Tag uint8
	_io *kaitai.Stream
	_root *Dcmp0
	_parent *Dcmp0_Chunk
	_f_isIndexSeparate bool
	isIndexSeparate bool
	_f_indexInTag bool
	indexInTag int
	_f_indexSeparate bool
	indexSeparate int
	_f_index bool
	index int
}
func NewDcmp0_Chunk_BackreferenceBody(tag uint8) *Dcmp0_Chunk_BackreferenceBody {
	return &Dcmp0_Chunk_BackreferenceBody{
		Tag: tag,
	}
}

func (this *Dcmp0_Chunk_BackreferenceBody) Read(io *kaitai.Stream, parent *Dcmp0_Chunk, root *Dcmp0) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this.IsIndexSeparate()
	if err != nil {
		return err
	}
	if (tmp22) {
		switch (this.Tag) {
		case 32:
			tmp23, err := this._io.ReadU1()
			if err != nil {
				return err
			}
			this.IndexSeparateMinus = uint16(tmp23)
		case 33:
			tmp24, err := this._io.ReadU1()
			if err != nil {
				return err
			}
			this.IndexSeparateMinus = uint16(tmp24)
		case 34:
			tmp25, err := this._io.ReadU2be()
			if err != nil {
				return err
			}
			this.IndexSeparateMinus = uint16(tmp25)
		}
	}
	return err
}

/**
 * Whether the index is stored separately from the tag.
 */
func (this *Dcmp0_Chunk_BackreferenceBody) IsIndexSeparate() (v bool, err error) {
	if (this._f_isIndexSeparate) {
		return this.isIndexSeparate, nil
	}
	this.isIndexSeparate = bool( ((this.Tag >= 32) && (this.Tag <= 34)) )
	this._f_isIndexSeparate = true
	return this.isIndexSeparate, nil
}

/**
 * The index of the referenced literal chunk,
 * as stored in the tag byte.
 */
func (this *Dcmp0_Chunk_BackreferenceBody) IndexInTag() (v int, err error) {
	if (this._f_indexInTag) {
		return this.indexInTag, nil
	}
	this.indexInTag = int((this.Tag - 35))
	this._f_indexInTag = true
	return this.indexInTag, nil
}

/**
 * The index of the referenced literal chunk,
 * as stored separately from the tag byte,
 * with the implicit offset corrected for.
 */
func (this *Dcmp0_Chunk_BackreferenceBody) IndexSeparate() (v int, err error) {
	if (this._f_indexSeparate) {
		return this.indexSeparate, nil
	}
	tmp26, err := this.IsIndexSeparate()
	if err != nil {
		return 0, err
	}
	if (tmp26) {
		var tmp27 int;
		if (this.Tag == 33) {
			tmp27 = 256
		} else {
			tmp27 = 0
		}
		this.indexSeparate = int(((this.IndexSeparateMinus + 40) + tmp27))
	}
	this._f_indexSeparate = true
	return this.indexSeparate, nil
}

/**
 * The index of the referenced literal chunk.
 * 
 * Stored literals are assigned index numbers in the order in which they appear in the compressed data,
 * starting at 0.
 * Non-stored literals are not counted in the numbering and cannot be referenced using backreferences.
 * Once an index is assigned to a stored literal,
 * it is never changed or unassigned for the entire length of the compressed data.
 * 
 * As the name indicates,
 * a backreference can only reference stored literal chunks found *before* the backreference,
 * not ones that come after it.
 */
func (this *Dcmp0_Chunk_BackreferenceBody) Index() (v int, err error) {
	if (this._f_index) {
		return this.index, nil
	}
	var tmp28 int;
	tmp29, err := this.IsIndexSeparate()
	if err != nil {
		return 0, err
	}
	if (tmp29) {
		tmp30, err := this.IndexSeparate()
		if err != nil {
			return 0, err
		}
		tmp28 = tmp30
	} else {
		tmp31, err := this.IndexInTag()
		if err != nil {
			return 0, err
		}
		tmp28 = tmp31
	}
	this.index = int(tmp28)
	this._f_index = true
	return this.index, nil
}

/**
 * The index of the referenced literal chunk,
 * stored separately from the tag.
 * The value in this field is stored minus 0x28.
 * If the tag byte is 0x21,
 * the value is also stored minus 0x100,
 * *on top of* the regular offset
 * (i. e. minus 0x128 in total).
 * 
 * In other words,
 * for tag bytes 0x20 and 0x21,
 * the index is actually 9 bits large,
 * with the low 8 bits stored separately and the highest bit stored in the lowest bit of the tag byte.
 * 
 * This field is only present if the tag byte is 0x20 through 0x22.
 * For higher tag bytes,
 * the index is encoded in the tag byte.
 * Values smaller than 0x28 cannot be stored in this field,
 * they must always be encoded in the tag byte.
 */

/**
 * The body of a table lookup chunk.
 * This body is always empty.
 * 
 * This chunk always expands to two bytes (`value`),
 * determined from the tag byte using a fixed lookup table (`lookup_table`).
 * This lookup table is hardcoded in the decompressor and always the same for all compressed data.
 */
type Dcmp0_Chunk_TableLookupBody struct {
	Tag uint8
	_io *kaitai.Stream
	_root *Dcmp0
	_parent *Dcmp0_Chunk
	_f_lookupTable bool
	lookupTable [][]byte
	_f_value bool
	value []byte
}
func NewDcmp0_Chunk_TableLookupBody(tag uint8) *Dcmp0_Chunk_TableLookupBody {
	return &Dcmp0_Chunk_TableLookupBody{
		Tag: tag,
	}
}

func (this *Dcmp0_Chunk_TableLookupBody) Read(io *kaitai.Stream, parent *Dcmp0_Chunk, root *Dcmp0) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}

/**
 * Fixed lookup table that maps tag byte numbers to two bytes each.
 * 
 * The entries in the lookup table are offset -
 * index 0 stands for tag 0x4b, 1 for 0x4c, etc.
 */
func (this *Dcmp0_Chunk_TableLookupBody) LookupTable() (v [][]byte, err error) {
	if (this._f_lookupTable) {
		return this.lookupTable, nil
	}
	this.lookupTable = [][]byte([][]byte{[]uint8{0, 0}, []uint8{78, 186}, []uint8{0, 8}, []uint8{78, 117}, []uint8{0, 12}, []uint8{78, 173}, []uint8{32, 83}, []uint8{47, 11}, []uint8{97, 0}, []uint8{0, 16}, []uint8{112, 0}, []uint8{47, 0}, []uint8{72, 110}, []uint8{32, 80}, []uint8{32, 110}, []uint8{47, 46}, []uint8{255, 252}, []uint8{72, 231}, []uint8{63, 60}, []uint8{0, 4}, []uint8{255, 248}, []uint8{47, 12}, []uint8{32, 6}, []uint8{78, 237}, []uint8{78, 86}, []uint8{32, 104}, []uint8{78, 94}, []uint8{0, 1}, []uint8{88, 143}, []uint8{79, 239}, []uint8{0, 2}, []uint8{0, 24}, []uint8{96, 0}, []uint8{255, 255}, []uint8{80, 143}, []uint8{78, 144}, []uint8{0, 6}, []uint8{38, 110}, []uint8{0, 20}, []uint8{255, 244}, []uint8{76, 238}, []uint8{0, 10}, []uint8{0, 14}, []uint8{65, 238}, []uint8{76, 223}, []uint8{72, 192}, []uint8{255, 240}, []uint8{45, 64}, []uint8{0, 18}, []uint8{48, 46}, []uint8{112, 1}, []uint8{47, 40}, []uint8{32, 84}, []uint8{103, 0}, []uint8{0, 32}, []uint8{0, 28}, []uint8{32, 95}, []uint8{24, 0}, []uint8{38, 111}, []uint8{72, 120}, []uint8{0, 22}, []uint8{65, 250}, []uint8{48, 60}, []uint8{40, 64}, []uint8{114, 0}, []uint8{40, 110}, []uint8{32, 12}, []uint8{102, 0}, []uint8{32, 107}, []uint8{47, 7}, []uint8{85, 143}, []uint8{0, 40}, []uint8{255, 254}, []uint8{255, 236}, []uint8{34, 216}, []uint8{32, 11}, []uint8{0, 15}, []uint8{89, 143}, []uint8{47, 60}, []uint8{255, 0}, []uint8{1, 24}, []uint8{129, 225}, []uint8{74, 0}, []uint8{78, 176}, []uint8{255, 232}, []uint8{72, 199}, []uint8{0, 3}, []uint8{0, 34}, []uint8{0, 7}, []uint8{0, 26}, []uint8{103, 6}, []uint8{103, 8}, []uint8{78, 249}, []uint8{0, 36}, []uint8{32, 120}, []uint8{8, 0}, []uint8{102, 4}, []uint8{0, 42}, []uint8{78, 208}, []uint8{48, 40}, []uint8{38, 95}, []uint8{103, 4}, []uint8{0, 48}, []uint8{67, 238}, []uint8{63, 0}, []uint8{32, 31}, []uint8{0, 30}, []uint8{255, 246}, []uint8{32, 46}, []uint8{66, 167}, []uint8{32, 7}, []uint8{255, 250}, []uint8{96, 2}, []uint8{61, 64}, []uint8{12, 64}, []uint8{102, 6}, []uint8{0, 38}, []uint8{45, 72}, []uint8{47, 1}, []uint8{112, 255}, []uint8{96, 4}, []uint8{24, 128}, []uint8{74, 64}, []uint8{0, 64}, []uint8{0, 44}, []uint8{47, 8}, []uint8{0, 17}, []uint8{255, 228}, []uint8{33, 64}, []uint8{38, 64}, []uint8{255, 242}, []uint8{66, 110}, []uint8{78, 185}, []uint8{61, 124}, []uint8{0, 56}, []uint8{0, 13}, []uint8{96, 6}, []uint8{66, 46}, []uint8{32, 60}, []uint8{103, 12}, []uint8{45, 104}, []uint8{102, 8}, []uint8{74, 46}, []uint8{74, 174}, []uint8{0, 46}, []uint8{72, 64}, []uint8{34, 95}, []uint8{34, 0}, []uint8{103, 10}, []uint8{48, 7}, []uint8{66, 103}, []uint8{0, 50}, []uint8{32, 40}, []uint8{0, 9}, []uint8{72, 122}, []uint8{2, 0}, []uint8{47, 43}, []uint8{0, 5}, []uint8{34, 110}, []uint8{102, 2}, []uint8{229, 128}, []uint8{103, 14}, []uint8{102, 10}, []uint8{0, 80}, []uint8{62, 0}, []uint8{102, 12}, []uint8{46, 0}, []uint8{255, 238}, []uint8{32, 109}, []uint8{32, 64}, []uint8{255, 224}, []uint8{83, 64}, []uint8{96, 8}, []uint8{4, 128}, []uint8{0, 104}, []uint8{11, 124}, []uint8{68, 0}, []uint8{65, 232}, []uint8{72, 65}})
	this._f_lookupTable = true
	return this.lookupTable, nil
}

/**
 * The two bytes that the tag byte expands to,
 * based on the fixed lookup table.
 */
func (this *Dcmp0_Chunk_TableLookupBody) Value() (v []byte, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	tmp32, err := this.LookupTable()
	if err != nil {
		return nil, err
	}
	this.value = []byte(tmp32[(this.Tag - 75)])
	this._f_value = true
	return this.value, nil
}

/**
 * The body of an end chunk.
 * This body is always empty.
 * 
 * The last chunk in the compressed data must always be an end chunk.
 * An end chunk cannot appear elsewhere in the compressed data.
 */
type Dcmp0_Chunk_EndBody struct {
	_io *kaitai.Stream
	_root *Dcmp0
	_parent *Dcmp0_Chunk
}
func NewDcmp0_Chunk_EndBody() *Dcmp0_Chunk_EndBody {
	return &Dcmp0_Chunk_EndBody{
	}
}

func (this *Dcmp0_Chunk_EndBody) Read(io *kaitai.Stream, parent *Dcmp0_Chunk, root *Dcmp0) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}

/**
 * The body of an extended chunk.
 * The meaning of this chunk depends on the extended tag byte stored in the chunk data.
 */
type Dcmp0_Chunk_ExtendedBody struct {
	Tag uint8
	Body interface{}
	_io *kaitai.Stream
	_root *Dcmp0
	_parent *Dcmp0_Chunk
}
func NewDcmp0_Chunk_ExtendedBody() *Dcmp0_Chunk_ExtendedBody {
	return &Dcmp0_Chunk_ExtendedBody{
	}
}

func (this *Dcmp0_Chunk_ExtendedBody) Read(io *kaitai.Stream, parent *Dcmp0_Chunk, root *Dcmp0) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Tag = tmp33
	switch (this.Tag) {
	case 0:
		tmp34 := NewDcmp0_Chunk_ExtendedBody_JumpTableBody()
		err = tmp34.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp34
	case 4:
		tmp35 := NewDcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody()
		err = tmp35.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp35
	case 6:
		tmp36 := NewDcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody()
		err = tmp36.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp36
	case 3:
		tmp37 := NewDcmp0_Chunk_ExtendedBody_RepeatBody(this.Tag)
		err = tmp37.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp37
	case 2:
		tmp38 := NewDcmp0_Chunk_ExtendedBody_RepeatBody(this.Tag)
		err = tmp38.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp38
	}
	return err
}

/**
 * The chunk's extended tag byte.
 * This controls the structure of the body and the meaning of the chunk.
 */

/**
 * The chunk's body.
 */

/**
 * The body of a jump table chunk.
 * 
 * This chunk generates parts of a segment loader jump table,
 * in the format found in `'CODE' (0)` resources.
 * It expands to the following data,
 * with all non-constant numbers encoded as unsigned 16-bit big-endian integers:
 * 
 * * `0x3f 0x3c` (push following segment number onto stack)
 * * The segment number
 * * `0xa9 0xf0` (`_LoadSeg` trap)
 * * For each address:
 *   * The address
 *   * `0x3f 0x3c` (push following segment number onto stack)
 *   * The segment number
 *   * `0xa9 0xf0` (`_LoadSeg` trap)
 * 
 * Note that this generates one jump table entry without an address before it,
 * meaning that this address needs to be generated by the preceding chunk.
 * All following jump table entries are generated with the addresses encoded in this chunk.
 */
type Dcmp0_Chunk_ExtendedBody_JumpTableBody struct {
	SegmentNumberRaw *DcmpVariableLengthInteger
	NumAddressesRaw *DcmpVariableLengthInteger
	AddressesRaw []*DcmpVariableLengthInteger
	_io *kaitai.Stream
	_root *Dcmp0
	_parent *Dcmp0_Chunk_ExtendedBody
	_f_segmentNumber bool
	segmentNumber int
	_f_numAddresses bool
	numAddresses int
}
func NewDcmp0_Chunk_ExtendedBody_JumpTableBody() *Dcmp0_Chunk_ExtendedBody_JumpTableBody {
	return &Dcmp0_Chunk_ExtendedBody_JumpTableBody{
	}
}

func (this *Dcmp0_Chunk_ExtendedBody_JumpTableBody) Read(io *kaitai.Stream, parent *Dcmp0_Chunk_ExtendedBody, root *Dcmp0) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp39 := NewDcmpVariableLengthInteger()
	err = tmp39.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.SegmentNumberRaw = tmp39
	tmp40 := NewDcmpVariableLengthInteger()
	err = tmp40.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.NumAddressesRaw = tmp40
	tmp41, err := this.NumAddresses()
	if err != nil {
		return err
	}
	this.AddressesRaw = make([]*DcmpVariableLengthInteger, tmp41)
	for i := range this.AddressesRaw {
		tmp42 := NewDcmpVariableLengthInteger()
		err = tmp42.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.AddressesRaw[i] = tmp42
	}
	return err
}

/**
 * The segment number for all of the generated jump table entries.
 * 
 * Although it is stored as a variable-length integer,
 * the segment number must be in the range `0x0 <= x <= 0xffff`,
 * i. e. an unsigned 16-bit integer.
 */
func (this *Dcmp0_Chunk_ExtendedBody_JumpTableBody) SegmentNumber() (v int, err error) {
	if (this._f_segmentNumber) {
		return this.segmentNumber, nil
	}
	tmp43, err := this.SegmentNumberRaw.Value()
	if err != nil {
		return 0, err
	}
	this.segmentNumber = int(tmp43)
	this._f_segmentNumber = true
	return this.segmentNumber, nil
}

/**
 * The number of addresses stored in this chunk.
 * 
 * This number must be greater than 0.
 */
func (this *Dcmp0_Chunk_ExtendedBody_JumpTableBody) NumAddresses() (v int, err error) {
	if (this._f_numAddresses) {
		return this.numAddresses, nil
	}
	tmp44, err := this.NumAddressesRaw.Value()
	if err != nil {
		return 0, err
	}
	this.numAddresses = int(tmp44)
	this._f_numAddresses = true
	return this.numAddresses, nil
}

/**
 * Raw variable-length integer representation of `segment_number`.
 */

/**
 * Raw variable-length integer representation of `num_addresses`.
 */

/**
 * The addresses for each generated jump table entry,
 * stored as variable-length integers.
 * 
 * The first address is stored literally and must be in the range `0x0 <= x <= 0xffff`,
 * i. e. an unsigned 16-bit integer.
 * 
 * All following addresses are stored as deltas relative to the previous address.
 * Each of these deltas is stored plus 6;
 * this value needs to be subtracted before (or after) adding it to the previous address.
 * 
 * Each delta (after subtracting 6) should be positive,
 * and adding it to the previous address should not result in a value larger than `0xffff`,
 * i. e. there should be no 16-bit unsigned integer wraparound.
 * These conditions are always met in all known jump table chunks,
 * so it is not known how the original decompressor behaves otherwise.
 */

/**
 * The body of a repeat chunk.
 * 
 * This chunk expands to a 1-byte or 2-byte value repeated a number of times,
 * i. e. it implements a form of run-length encoding.
 */
type Dcmp0_Chunk_ExtendedBody_RepeatBody struct {
	ToRepeatRaw *DcmpVariableLengthInteger
	RepeatCountM1Raw *DcmpVariableLengthInteger
	Tag uint8
	_io *kaitai.Stream
	_root *Dcmp0
	_parent *Dcmp0_Chunk_ExtendedBody
	_f_byteCount bool
	byteCount int
	_f_toRepeat bool
	toRepeat int
	_f_repeatCountM1 bool
	repeatCountM1 int
	_f_repeatCount bool
	repeatCount int
}
func NewDcmp0_Chunk_ExtendedBody_RepeatBody(tag uint8) *Dcmp0_Chunk_ExtendedBody_RepeatBody {
	return &Dcmp0_Chunk_ExtendedBody_RepeatBody{
		Tag: tag,
	}
}

func (this *Dcmp0_Chunk_ExtendedBody_RepeatBody) Read(io *kaitai.Stream, parent *Dcmp0_Chunk_ExtendedBody, root *Dcmp0) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp45 := NewDcmpVariableLengthInteger()
	err = tmp45.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.ToRepeatRaw = tmp45
	tmp46 := NewDcmpVariableLengthInteger()
	err = tmp46.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.RepeatCountM1Raw = tmp46
	return err
}

/**
 * The length in bytes of the value to be repeated.
 * Regardless of the byte count,
 * the value to be repeated is stored as a variable-length integer.
 */
func (this *Dcmp0_Chunk_ExtendedBody_RepeatBody) ByteCount() (v int, err error) {
	if (this._f_byteCount) {
		return this.byteCount, nil
	}
	var tmp47 int8;
	if (this.Tag == 2) {
		tmp47 = 1
	} else {
		var tmp48 int8;
		if (this.Tag == 3) {
			tmp48 = 2
		} else {
			tmp48 = -1
		}
		tmp47 = tmp48
	}
	this.byteCount = int(tmp47)
	this._f_byteCount = true
	return this.byteCount, nil
}

/**
 * The value to repeat.
 * 
 * Although it is stored as a variable-length integer,
 * this value must fit into an unsigned big-endian integer that is as long as `byte_count`,
 * i. e. either 8 or 16 bits.
 */
func (this *Dcmp0_Chunk_ExtendedBody_RepeatBody) ToRepeat() (v int, err error) {
	if (this._f_toRepeat) {
		return this.toRepeat, nil
	}
	tmp49, err := this.ToRepeatRaw.Value()
	if err != nil {
		return 0, err
	}
	this.toRepeat = int(tmp49)
	this._f_toRepeat = true
	return this.toRepeat, nil
}

/**
 * The number of times to repeat the value,
 * minus one.
 * 
 * This value must not be negative.
 */
func (this *Dcmp0_Chunk_ExtendedBody_RepeatBody) RepeatCountM1() (v int, err error) {
	if (this._f_repeatCountM1) {
		return this.repeatCountM1, nil
	}
	tmp50, err := this.RepeatCountM1Raw.Value()
	if err != nil {
		return 0, err
	}
	this.repeatCountM1 = int(tmp50)
	this._f_repeatCountM1 = true
	return this.repeatCountM1, nil
}

/**
 * The number of times to repeat the value.
 * 
 * This value must be positive.
 */
func (this *Dcmp0_Chunk_ExtendedBody_RepeatBody) RepeatCount() (v int, err error) {
	if (this._f_repeatCount) {
		return this.repeatCount, nil
	}
	tmp51, err := this.RepeatCountM1()
	if err != nil {
		return 0, err
	}
	this.repeatCount = int((tmp51 + 1))
	this._f_repeatCount = true
	return this.repeatCount, nil
}

/**
 * Raw variable-length integer representation of `to_repeat`.
 */

/**
 * Raw variable-length integer representation of `repeat_count_m1`.
 */

/**
 * The body of a 16-bit delta encoding chunk.
 * 
 * This chunk expands to a sequence of 16-bit big-endian integer values.
 * The first value is stored literally.
 * All following values are stored as deltas relative to the previous value.
 */
type Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody struct {
	FirstValueRaw *DcmpVariableLengthInteger
	NumDeltasRaw *DcmpVariableLengthInteger
	Deltas []int8
	_io *kaitai.Stream
	_root *Dcmp0
	_parent *Dcmp0_Chunk_ExtendedBody
	_f_firstValue bool
	firstValue int
	_f_numDeltas bool
	numDeltas int
}
func NewDcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody() *Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody {
	return &Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody{
	}
}

func (this *Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody) Read(io *kaitai.Stream, parent *Dcmp0_Chunk_ExtendedBody, root *Dcmp0) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp52 := NewDcmpVariableLengthInteger()
	err = tmp52.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.FirstValueRaw = tmp52
	tmp53 := NewDcmpVariableLengthInteger()
	err = tmp53.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.NumDeltasRaw = tmp53
	tmp54, err := this.NumDeltas()
	if err != nil {
		return err
	}
	this.Deltas = make([]int8, tmp54)
	for i := range this.Deltas {
		tmp55, err := this._io.ReadS1()
		if err != nil {
			return err
		}
		this.Deltas[i] = tmp55
	}
	return err
}

/**
 * The first value in the sequence.
 * 
 * Although it is stored as a variable-length integer,
 * this value must be in the range `-0x8000 <= x <= 0x7fff`,
 * i. e. a signed 16-bit integer.
 */
func (this *Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody) FirstValue() (v int, err error) {
	if (this._f_firstValue) {
		return this.firstValue, nil
	}
	tmp56, err := this.FirstValueRaw.Value()
	if err != nil {
		return 0, err
	}
	this.firstValue = int(tmp56)
	this._f_firstValue = true
	return this.firstValue, nil
}

/**
 * The number of deltas stored in this chunk.
 * 
 * This number must not be negative.
 */
func (this *Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody) NumDeltas() (v int, err error) {
	if (this._f_numDeltas) {
		return this.numDeltas, nil
	}
	tmp57, err := this.NumDeltasRaw.Value()
	if err != nil {
		return 0, err
	}
	this.numDeltas = int(tmp57)
	this._f_numDeltas = true
	return this.numDeltas, nil
}

/**
 * Raw variable-length integer representation of `first_value`.
 */

/**
 * Raw variable-length integer representation of `num_deltas`.
 */

/**
 * The deltas for each value relative to the previous value.
 * 
 * Each of these deltas is a signed 8-bit value.
 * When adding the delta to the previous value,
 * 16-bit integer wraparound is performed if necessary,
 * so that the resulting value always fits into a 16-bit signed integer.
 */

/**
 * The body of a 32-bit delta encoding chunk.
 * 
 * This chunk expands to a sequence of 32-bit big-endian integer values.
 * The first value is stored literally.
 * All following values are stored as deltas relative to the previous value.
 */
type Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody struct {
	FirstValueRaw *DcmpVariableLengthInteger
	NumDeltasRaw *DcmpVariableLengthInteger
	DeltasRaw []*DcmpVariableLengthInteger
	_io *kaitai.Stream
	_root *Dcmp0
	_parent *Dcmp0_Chunk_ExtendedBody
	_f_firstValue bool
	firstValue int
	_f_numDeltas bool
	numDeltas int
}
func NewDcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody() *Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody {
	return &Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody{
	}
}

func (this *Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody) Read(io *kaitai.Stream, parent *Dcmp0_Chunk_ExtendedBody, root *Dcmp0) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp58 := NewDcmpVariableLengthInteger()
	err = tmp58.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.FirstValueRaw = tmp58
	tmp59 := NewDcmpVariableLengthInteger()
	err = tmp59.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.NumDeltasRaw = tmp59
	tmp60, err := this.NumDeltas()
	if err != nil {
		return err
	}
	this.DeltasRaw = make([]*DcmpVariableLengthInteger, tmp60)
	for i := range this.DeltasRaw {
		tmp61 := NewDcmpVariableLengthInteger()
		err = tmp61.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.DeltasRaw[i] = tmp61
	}
	return err
}

/**
 * The first value in the sequence.
 */
func (this *Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody) FirstValue() (v int, err error) {
	if (this._f_firstValue) {
		return this.firstValue, nil
	}
	tmp62, err := this.FirstValueRaw.Value()
	if err != nil {
		return 0, err
	}
	this.firstValue = int(tmp62)
	this._f_firstValue = true
	return this.firstValue, nil
}

/**
 * The number of deltas stored in this chunk.
 * 
 * This number must not be negative.
 */
func (this *Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody) NumDeltas() (v int, err error) {
	if (this._f_numDeltas) {
		return this.numDeltas, nil
	}
	tmp63, err := this.NumDeltasRaw.Value()
	if err != nil {
		return 0, err
	}
	this.numDeltas = int(tmp63)
	this._f_numDeltas = true
	return this.numDeltas, nil
}

/**
 * Raw variable-length integer representation of `first_value`.
 */

/**
 * Raw variable-length integer representation of `num_deltas`.
 */

/**
 * The deltas for each value relative to the previous value,
 * stored as variable-length integers.
 * 
 * Each of these deltas is a signed value.
 * When adding the delta to the previous value,
 * 32-bit integer wraparound is performed if necessary,
 * so that the resulting value always fits into a 32-bit signed integer.
 */
