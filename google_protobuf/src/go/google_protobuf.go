// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * Google Protocol Buffers (AKA protobuf) is a popular data
 * serialization scheme used for communication protocols, data storage,
 * etc. There are implementations are available for almost every
 * popular language. The focus points of this scheme are brevity (data
 * is encoded in a very size-efficient manner) and extensibility (one
 * can add keys to the structure, while keeping it readable in previous
 * version of software).
 * 
 * Protobuf uses semi-self-describing encoding scheme for its
 * messages. It means that it is possible to parse overall structure of
 * the message (skipping over fields one can't understand), but to
 * fully understand the message, one needs a protocol definition file
 * (`.proto`). To be specific:
 * 
 * * "Keys" in key-value pairs provided in the message are identified
 *   only with an integer "field tag". `.proto` file provides info on
 *   which symbolic field names these field tags map to.
 * * "Keys" also provide something called "wire type". It's not a data
 *   type in its common sense (i.e. you can't, for example, distinguish
 *   `sint32` vs `uint32` vs some enum, or `string` from `bytes`), but
 *   it's enough information to determine how many bytes to
 *   parse. Interpretation of the value should be done according to the
 *   type specified in `.proto` file.
 * * There's no direct information on which fields are optional /
 *   required, which fields may be repeated or constitute a map, what
 *   restrictions are placed on fields usage in a single message, what
 *   are the fields' default values, etc, etc.
 * @see <a href="https://developers.google.com/protocol-buffers/docs/encoding">Source</a>
 */
type GoogleProtobuf struct {
	Pairs []*GoogleProtobuf_Pair
	_io *kaitai.Stream
	_root *GoogleProtobuf
	_parent interface{}
}
func NewGoogleProtobuf() *GoogleProtobuf {
	return &GoogleProtobuf{
	}
}

func (this *GoogleProtobuf) Read(io *kaitai.Stream, parent interface{}, root *GoogleProtobuf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2 := NewGoogleProtobuf_Pair()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Pairs = append(this.Pairs, tmp2)
	}
	return err
}

/**
 * Key-value pairs which constitute a message
 */

/**
 * Key-value pair
 */

type GoogleProtobuf_Pair_WireTypes int
const (
	GoogleProtobuf_Pair_WireTypes__Varint GoogleProtobuf_Pair_WireTypes = 0
	GoogleProtobuf_Pair_WireTypes__Bit64 GoogleProtobuf_Pair_WireTypes = 1
	GoogleProtobuf_Pair_WireTypes__LenDelimited GoogleProtobuf_Pair_WireTypes = 2
	GoogleProtobuf_Pair_WireTypes__GroupStart GoogleProtobuf_Pair_WireTypes = 3
	GoogleProtobuf_Pair_WireTypes__GroupEnd GoogleProtobuf_Pair_WireTypes = 4
	GoogleProtobuf_Pair_WireTypes__Bit32 GoogleProtobuf_Pair_WireTypes = 5
)
type GoogleProtobuf_Pair struct {
	Key *VlqBase128Le
	Value interface{}
	_io *kaitai.Stream
	_root *GoogleProtobuf
	_parent *GoogleProtobuf
	_f_wireType bool
	wireType GoogleProtobuf_Pair_WireTypes
	_f_fieldTag bool
	fieldTag int
}
func NewGoogleProtobuf_Pair() *GoogleProtobuf_Pair {
	return &GoogleProtobuf_Pair{
	}
}

func (this *GoogleProtobuf_Pair) Read(io *kaitai.Stream, parent *GoogleProtobuf, root *GoogleProtobuf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3 := NewVlqBase128Le()
	err = tmp3.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Key = tmp3
	tmp4, err := this.WireType()
	if err != nil {
		return err
	}
	switch (tmp4) {
	case GoogleProtobuf_Pair_WireTypes__Varint:
		tmp5 := NewVlqBase128Le()
		err = tmp5.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.Value = tmp5
	case GoogleProtobuf_Pair_WireTypes__LenDelimited:
		tmp6 := NewGoogleProtobuf_DelimitedBytes()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Value = tmp6
	case GoogleProtobuf_Pair_WireTypes__Bit64:
		tmp7, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Value = tmp7
	case GoogleProtobuf_Pair_WireTypes__Bit32:
		tmp8, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Value = tmp8
	}
	return err
}

/**
 * "Wire type" is a part of the "key" that carries enough
 * information to parse value from the wire, i.e. read correct
 * amount of bytes, but there's not enough informaton to
 * interprete in unambiguously. For example, one can't clearly
 * distinguish 64-bit fixed-sized integers from 64-bit floats,
 * signed zigzag-encoded varints from regular unsigned varints,
 * arbitrary bytes from UTF-8 encoded strings, etc.
 */
func (this *GoogleProtobuf_Pair) WireType() (v GoogleProtobuf_Pair_WireTypes, err error) {
	if (this._f_wireType) {
		return this.wireType, nil
	}
	tmp9, err := this.Key.Value()
	if err != nil {
		return nil, err
	}
	this.wireType = GoogleProtobuf_Pair_WireTypes(GoogleProtobuf_Pair_WireTypes((tmp9 & 7)))
	this._f_wireType = true
	return this.wireType, nil
}

/**
 * Identifies a field of protocol. One can look up symbolic
 * field name in a `.proto` file by this field tag.
 */
func (this *GoogleProtobuf_Pair) FieldTag() (v int, err error) {
	if (this._f_fieldTag) {
		return this.fieldTag, nil
	}
	tmp10, err := this.Key.Value()
	if err != nil {
		return 0, err
	}
	this.fieldTag = int((tmp10 >> 3))
	this._f_fieldTag = true
	return this.fieldTag, nil
}

/**
 * Key is a bit-mapped variable-length integer: lower 3 bits
 * are used for "wire type", and everything higher designates
 * an integer "field tag".
 */

/**
 * Value that corresponds to field identified by
 * `field_tag`. Type is determined approximately: there is
 * enough information to parse it unambiguously from a stream,
 * but further infromation from `.proto` file is required to
 * interprete it properly.
 */
type GoogleProtobuf_DelimitedBytes struct {
	Len *VlqBase128Le
	Body []byte
	_io *kaitai.Stream
	_root *GoogleProtobuf
	_parent *GoogleProtobuf_Pair
}
func NewGoogleProtobuf_DelimitedBytes() *GoogleProtobuf_DelimitedBytes {
	return &GoogleProtobuf_DelimitedBytes{
	}
}

func (this *GoogleProtobuf_DelimitedBytes) Read(io *kaitai.Stream, parent *GoogleProtobuf_Pair, root *GoogleProtobuf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11 := NewVlqBase128Le()
	err = tmp11.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.Len = tmp11
	tmp12, err := this.Len.Value()
	if err != nil {
		return err
	}
	tmp13, err := this._io.ReadBytes(int(tmp12))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.Body = tmp13
	return err
}
