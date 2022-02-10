// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * Compressed resource data in `'dcmp' (1)` format,
 * as stored in compressed resources with header type `8` and decompressor ID `1`.
 * 
 * The `'dcmp' (1)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the Finder Help file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (1)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format supports some basic general-purpose compression schemes,
 * including backreferences to previous data and run-length encoding.
 * It also includes some types of compression tailored specifically to Mac OS resources,
 * including a set of single-byte codes that correspond to entries in a hard-coded lookup table.
 * 
 * The `'dcmp' (0)` compression format (see dcmp_0.ksy) is very similar to this format,
 * with the main difference that it operates mostly on units of 2 or 4 bytes.
 * This makes the ``dcmp' (0)` format more suitable for word-aligned data,
 * such as executable code, bitmaps, sounds, etc.
 * The `'dcmp' (0)` format also appears to be generally preferred over `'dcmp' (1)`,
 * with the latter only being used in resource files that contain mostly unaligned data,
 * such as text.
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6ee003b094bf4fc570832f90190260d795b/src/rsrcfork/compress/dcmp1.py">Source</a>
 */
type Dcmp1 struct {
	Chunks []*Dcmp1_Chunk
	_io *kaitai.Stream
	_root *Dcmp1
	_parent interface{}
}
func NewDcmp1() *Dcmp1 {
	return &Dcmp1{
	}
}

func (this *Dcmp1) Read(io *kaitai.Stream, parent interface{}, root *Dcmp1) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1 := NewDcmp1_Chunk()
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

type Dcmp1_Chunk_TagKind int
const (
	Dcmp1_Chunk_TagKind__Invalid Dcmp1_Chunk_TagKind = -1
	Dcmp1_Chunk_TagKind__Literal Dcmp1_Chunk_TagKind = 0
	Dcmp1_Chunk_TagKind__Backreference Dcmp1_Chunk_TagKind = 1
	Dcmp1_Chunk_TagKind__TableLookup Dcmp1_Chunk_TagKind = 2
	Dcmp1_Chunk_TagKind__Extended Dcmp1_Chunk_TagKind = 3
	Dcmp1_Chunk_TagKind__End Dcmp1_Chunk_TagKind = 4
)
type Dcmp1_Chunk struct {
	Tag uint8
	Body interface{}
	_io *kaitai.Stream
	_root *Dcmp1
	_parent *Dcmp1
}
func NewDcmp1_Chunk() *Dcmp1_Chunk {
	return &Dcmp1_Chunk{
	}
}

func (this *Dcmp1_Chunk) Read(io *kaitai.Stream, parent *Dcmp1, root *Dcmp1) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp2, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Tag = tmp2
	var tmp3 Dcmp1_Chunk_TagKind;
	if ( ((this.Tag >= 0) && (this.Tag <= 31)) ) {
		tmp3 = Dcmp1_Chunk_TagKind__Literal
	} else {
		var tmp4 Dcmp1_Chunk_TagKind;
		if ( ((this.Tag >= 32) && (this.Tag <= 207)) ) {
			tmp4 = Dcmp1_Chunk_TagKind__Backreference
		} else {
			var tmp5 Dcmp1_Chunk_TagKind;
			if ( ((this.Tag >= 208) && (this.Tag <= 209)) ) {
				tmp5 = Dcmp1_Chunk_TagKind__Literal
			} else {
				var tmp6 Dcmp1_Chunk_TagKind;
				if (this.Tag == 210) {
					tmp6 = Dcmp1_Chunk_TagKind__Backreference
				} else {
					var tmp7 Dcmp1_Chunk_TagKind;
					if ( ((this.Tag >= 213) && (this.Tag <= 253)) ) {
						tmp7 = Dcmp1_Chunk_TagKind__TableLookup
					} else {
						var tmp8 Dcmp1_Chunk_TagKind;
						if (this.Tag == 254) {
							tmp8 = Dcmp1_Chunk_TagKind__Extended
						} else {
							var tmp9 Dcmp1_Chunk_TagKind;
							if (this.Tag == 255) {
								tmp9 = Dcmp1_Chunk_TagKind__End
							} else {
								tmp9 = Dcmp1_Chunk_TagKind__Invalid
							}
							tmp8 = tmp9
						}
						tmp7 = tmp8
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
	case Dcmp1_Chunk_TagKind__Extended:
		tmp10 := NewDcmp1_Chunk_ExtendedBody()
		err = tmp10.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp10
	case Dcmp1_Chunk_TagKind__Literal:
		tmp11 := NewDcmp1_Chunk_LiteralBody(this.Tag)
		err = tmp11.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp11
	case Dcmp1_Chunk_TagKind__End:
		tmp12 := NewDcmp1_Chunk_EndBody()
		err = tmp12.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp12
	case Dcmp1_Chunk_TagKind__TableLookup:
		tmp13 := NewDcmp1_Chunk_TableLookupBody(this.Tag)
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp13
	case Dcmp1_Chunk_TagKind__Backreference:
		tmp14 := NewDcmp1_Chunk_BackreferenceBody(this.Tag)
		err = tmp14.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp14
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
 */
type Dcmp1_Chunk_LiteralBody struct {
	LenLiteralSeparate uint8
	Literal []byte
	Tag uint8
	_io *kaitai.Stream
	_root *Dcmp1
	_parent *Dcmp1_Chunk
	_f_doStore bool
	doStore bool
	_f_lenLiteralM1InTag bool
	lenLiteralM1InTag int
	_f_isLenLiteralSeparate bool
	isLenLiteralSeparate bool
	_f_lenLiteral bool
	lenLiteral int
}
func NewDcmp1_Chunk_LiteralBody(tag uint8) *Dcmp1_Chunk_LiteralBody {
	return &Dcmp1_Chunk_LiteralBody{
		Tag: tag,
	}
}

func (this *Dcmp1_Chunk_LiteralBody) Read(io *kaitai.Stream, parent *Dcmp1_Chunk, root *Dcmp1) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this.IsLenLiteralSeparate()
	if err != nil {
		return err
	}
	if (tmp15) {
		tmp16, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.LenLiteralSeparate = tmp16
	}
	tmp17, err := this.LenLiteral()
	if err != nil {
		return err
	}
	tmp18, err := this._io.ReadBytes(int(tmp17))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.Literal = tmp18
	return err
}

/**
 * Whether this literal should be stored for use by future backreference chunks.
 * 
 * See the documentation of the `backreference_body` type for details about backreference chunks.
 */
func (this *Dcmp1_Chunk_LiteralBody) DoStore() (v bool, err error) {
	if (this._f_doStore) {
		return this.doStore, nil
	}
	var tmp19 bool;
	tmp20, err := this.IsLenLiteralSeparate()
	if err != nil {
		return false, err
	}
	if (tmp20) {
		tmp19 = this.Tag == 209
	} else {
		tmp19 = (this.Tag & 16) != 0
	}
	this.doStore = bool(tmp19)
	this._f_doStore = true
	return this.doStore, nil
}

/**
 * The part of the tag byte that indicates the length of the literal data,
 * in bytes,
 * minus one.
 * 
 * If the tag byte is 0xd0 or 0xd1,
 * the length is stored in a separate byte after the tag byte and before the literal data.
 */
func (this *Dcmp1_Chunk_LiteralBody) LenLiteralM1InTag() (v int, err error) {
	if (this._f_lenLiteralM1InTag) {
		return this.lenLiteralM1InTag, nil
	}
	tmp21, err := this.IsLenLiteralSeparate()
	if err != nil {
		return 0, err
	}
	if (!(tmp21)) {
		this.lenLiteralM1InTag = int((this.Tag & 15))
	}
	this._f_lenLiteralM1InTag = true
	return this.lenLiteralM1InTag, nil
}

/**
 * Whether the length of the literal is stored separately from the tag.
 */
func (this *Dcmp1_Chunk_LiteralBody) IsLenLiteralSeparate() (v bool, err error) {
	if (this._f_isLenLiteralSeparate) {
		return this.isLenLiteralSeparate, nil
	}
	this.isLenLiteralSeparate = bool(this.Tag >= 208)
	this._f_isLenLiteralSeparate = true
	return this.isLenLiteralSeparate, nil
}

/**
 * The length of the literal data,
 * in bytes.
 * 
 * In practice,
 * this value is always greater than zero,
 * as there is no use in storing a zero-length literal.
 */
func (this *Dcmp1_Chunk_LiteralBody) LenLiteral() (v int, err error) {
	if (this._f_lenLiteral) {
		return this.lenLiteral, nil
	}
	var tmp22 uint8;
	tmp23, err := this.IsLenLiteralSeparate()
	if err != nil {
		return 0, err
	}
	if (tmp23) {
		tmp22 = this.LenLiteralSeparate
	} else {
		tmp24, err := this.LenLiteralM1InTag()
		if err != nil {
			return 0, err
		}
		tmp22 = (tmp24 + 1)
	}
	this.lenLiteral = int(tmp22)
	this._f_lenLiteral = true
	return this.lenLiteral, nil
}

/**
 * The length of the literal data,
 * in bytes.
 * 
 * This field is only present if the tag byte is 0xd0 or 0xd1.
 * In practice,
 * this only happens if the length is 0x11 or greater,
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
type Dcmp1_Chunk_BackreferenceBody struct {
	IndexSeparateMinus uint8
	Tag uint8
	_io *kaitai.Stream
	_root *Dcmp1
	_parent *Dcmp1_Chunk
	_f_isIndexSeparate bool
	isIndexSeparate bool
	_f_indexInTag bool
	indexInTag int
	_f_indexSeparate bool
	indexSeparate int
	_f_index bool
	index int
}
func NewDcmp1_Chunk_BackreferenceBody(tag uint8) *Dcmp1_Chunk_BackreferenceBody {
	return &Dcmp1_Chunk_BackreferenceBody{
		Tag: tag,
	}
}

func (this *Dcmp1_Chunk_BackreferenceBody) Read(io *kaitai.Stream, parent *Dcmp1_Chunk, root *Dcmp1) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this.IsIndexSeparate()
	if err != nil {
		return err
	}
	if (tmp25) {
		tmp26, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.IndexSeparateMinus = tmp26
	}
	return err
}

/**
 * Whether the index is stored separately from the tag.
 */
func (this *Dcmp1_Chunk_BackreferenceBody) IsIndexSeparate() (v bool, err error) {
	if (this._f_isIndexSeparate) {
		return this.isIndexSeparate, nil
	}
	this.isIndexSeparate = bool(this.Tag == 210)
	this._f_isIndexSeparate = true
	return this.isIndexSeparate, nil
}

/**
 * The index of the referenced literal chunk,
 * as stored in the tag byte.
 */
func (this *Dcmp1_Chunk_BackreferenceBody) IndexInTag() (v int, err error) {
	if (this._f_indexInTag) {
		return this.indexInTag, nil
	}
	this.indexInTag = int((this.Tag - 32))
	this._f_indexInTag = true
	return this.indexInTag, nil
}

/**
 * The index of the referenced literal chunk,
 * as stored separately from the tag byte,
 * with the implicit offset corrected for.
 */
func (this *Dcmp1_Chunk_BackreferenceBody) IndexSeparate() (v int, err error) {
	if (this._f_indexSeparate) {
		return this.indexSeparate, nil
	}
	tmp27, err := this.IsIndexSeparate()
	if err != nil {
		return 0, err
	}
	if (tmp27) {
		this.indexSeparate = int((this.IndexSeparateMinus + 176))
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
func (this *Dcmp1_Chunk_BackreferenceBody) Index() (v int, err error) {
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
 * The value in this field is stored minus 0xb0.
 * 
 * This field is only present if the tag byte is 0xd2.
 * For other tag bytes,
 * the index is encoded in the tag byte.
 * Values smaller than 0xb0 cannot be stored in this field,
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
type Dcmp1_Chunk_TableLookupBody struct {
	Tag uint8
	_io *kaitai.Stream
	_root *Dcmp1
	_parent *Dcmp1_Chunk
	_f_lookupTable bool
	lookupTable [][]byte
	_f_value bool
	value []byte
}
func NewDcmp1_Chunk_TableLookupBody(tag uint8) *Dcmp1_Chunk_TableLookupBody {
	return &Dcmp1_Chunk_TableLookupBody{
		Tag: tag,
	}
}

func (this *Dcmp1_Chunk_TableLookupBody) Read(io *kaitai.Stream, parent *Dcmp1_Chunk, root *Dcmp1) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}

/**
 * Fixed lookup table that maps tag byte numbers to two bytes each.
 * 
 * The entries in the lookup table are offset -
 * index 0 stands for tag 0xd5, 1 for 0xd6, etc.
 */
func (this *Dcmp1_Chunk_TableLookupBody) LookupTable() (v [][]byte, err error) {
	if (this._f_lookupTable) {
		return this.lookupTable, nil
	}
	this.lookupTable = [][]byte([][]byte{[]uint8{0, 0}, []uint8{0, 1}, []uint8{0, 2}, []uint8{0, 3}, []uint8{46, 1}, []uint8{62, 1}, []uint8{1, 1}, []uint8{30, 1}, []uint8{255, 255}, []uint8{14, 1}, []uint8{49, 0}, []uint8{17, 18}, []uint8{1, 7}, []uint8{51, 50}, []uint8{18, 57}, []uint8{237, 16}, []uint8{1, 39}, []uint8{35, 34}, []uint8{1, 55}, []uint8{7, 6}, []uint8{1, 23}, []uint8{1, 35}, []uint8{0, 255}, []uint8{0, 47}, []uint8{7, 14}, []uint8{253, 60}, []uint8{1, 53}, []uint8{1, 21}, []uint8{1, 2}, []uint8{0, 7}, []uint8{0, 62}, []uint8{5, 213}, []uint8{2, 1}, []uint8{6, 7}, []uint8{7, 8}, []uint8{48, 1}, []uint8{1, 51}, []uint8{0, 16}, []uint8{23, 22}, []uint8{55, 62}, []uint8{54, 55}})
	this._f_lookupTable = true
	return this.lookupTable, nil
}

/**
 * The two bytes that the tag byte expands to,
 * based on the fixed lookup table.
 */
func (this *Dcmp1_Chunk_TableLookupBody) Value() (v []byte, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	tmp32, err := this.LookupTable()
	if err != nil {
		return nil, err
	}
	this.value = []byte(tmp32[(this.Tag - 213)])
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
type Dcmp1_Chunk_EndBody struct {
	_io *kaitai.Stream
	_root *Dcmp1
	_parent *Dcmp1_Chunk
}
func NewDcmp1_Chunk_EndBody() *Dcmp1_Chunk_EndBody {
	return &Dcmp1_Chunk_EndBody{
	}
}

func (this *Dcmp1_Chunk_EndBody) Read(io *kaitai.Stream, parent *Dcmp1_Chunk, root *Dcmp1) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}

/**
 * The body of an extended chunk.
 * The meaning of this chunk depends on the extended tag byte stored in the chunk data.
 */
type Dcmp1_Chunk_ExtendedBody struct {
	Tag uint8
	Body *Dcmp1_Chunk_ExtendedBody_RepeatBody
	_io *kaitai.Stream
	_root *Dcmp1
	_parent *Dcmp1_Chunk
}
func NewDcmp1_Chunk_ExtendedBody() *Dcmp1_Chunk_ExtendedBody {
	return &Dcmp1_Chunk_ExtendedBody{
	}
}

func (this *Dcmp1_Chunk_ExtendedBody) Read(io *kaitai.Stream, parent *Dcmp1_Chunk, root *Dcmp1) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Tag = tmp33
	switch (this.Tag) {
	case 2:
		tmp34 := NewDcmp1_Chunk_ExtendedBody_RepeatBody()
		err = tmp34.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp34
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
 * The body of a repeat chunk.
 * 
 * This chunk expands to the same byte repeated a number of times,
 * i. e. it implements a form of run-length encoding.
 */
type Dcmp1_Chunk_ExtendedBody_RepeatBody struct {
	ToRepeatRaw *DcmpVariableLengthInteger
	RepeatCountM1Raw *DcmpVariableLengthInteger
	_io *kaitai.Stream
	_root *Dcmp1
	_parent *Dcmp1_Chunk_ExtendedBody
	_f_toRepeat bool
	toRepeat int
	_f_repeatCountM1 bool
	repeatCountM1 int
	_f_repeatCount bool
	repeatCount int
}
func NewDcmp1_Chunk_ExtendedBody_RepeatBody() *Dcmp1_Chunk_ExtendedBody_RepeatBody {
	return &Dcmp1_Chunk_ExtendedBody_RepeatBody{
	}
}

func (this *Dcmp1_Chunk_ExtendedBody_RepeatBody) Read(io *kaitai.Stream, parent *Dcmp1_Chunk_ExtendedBody, root *Dcmp1) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp35 := NewDcmpVariableLengthInteger()
	err = tmp35.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.ToRepeatRaw = tmp35
	tmp36 := NewDcmpVariableLengthInteger()
	err = tmp36.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.RepeatCountM1Raw = tmp36
	return err
}

/**
 * The value to repeat.
 * 
 * Although it is stored as a variable-length integer,
 * this value must fit into an unsigned 8-bit integer.
 */
func (this *Dcmp1_Chunk_ExtendedBody_RepeatBody) ToRepeat() (v int, err error) {
	if (this._f_toRepeat) {
		return this.toRepeat, nil
	}
	tmp37, err := this.ToRepeatRaw.Value()
	if err != nil {
		return 0, err
	}
	this.toRepeat = int(tmp37)
	this._f_toRepeat = true
	return this.toRepeat, nil
}

/**
 * The number of times to repeat the value,
 * minus one.
 * 
 * This value must not be negative.
 */
func (this *Dcmp1_Chunk_ExtendedBody_RepeatBody) RepeatCountM1() (v int, err error) {
	if (this._f_repeatCountM1) {
		return this.repeatCountM1, nil
	}
	tmp38, err := this.RepeatCountM1Raw.Value()
	if err != nil {
		return 0, err
	}
	this.repeatCountM1 = int(tmp38)
	this._f_repeatCountM1 = true
	return this.repeatCountM1, nil
}

/**
 * The number of times to repeat the value.
 * 
 * This value must be positive.
 */
func (this *Dcmp1_Chunk_ExtendedBody_RepeatBody) RepeatCount() (v int, err error) {
	if (this._f_repeatCount) {
		return this.repeatCount, nil
	}
	tmp39, err := this.RepeatCountM1()
	if err != nil {
		return 0, err
	}
	this.repeatCount = int((tmp39 + 1))
	this._f_repeatCount = true
	return this.repeatCount, nil
}

/**
 * Raw variable-length integer representation of `to_repeat`.
 */

/**
 * Raw variable-length integer representation of `repeat_count_m1`.
 */
