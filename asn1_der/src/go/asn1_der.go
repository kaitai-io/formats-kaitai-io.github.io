// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * ASN.1 (Abstract Syntax Notation One) DER (Distinguished Encoding
 * Rules) is a standard-backed serialization scheme used in many
 * different use-cases. Particularly popular usage scenarios are X.509
 * certificates and some telecommunication / networking protocols.
 * 
 * DER is self-describing encoding scheme which allows representation
 * of simple, atomic data elements, such as strings and numbers, and
 * complex objects, such as sequences of other elements.
 * 
 * DER is a subset of BER (Basic Encoding Rules), with an emphasis on
 * being non-ambiguous: there's always exactly one canonical way to
 * encode a data structure defined in terms of ASN.1 using DER.
 * 
 * This spec allows full parsing of format syntax, but to understand
 * the semantics, one would typically require a dictionary of Object
 * Identifiers (OIDs), to match OID bodies against some human-readable
 * list of constants. OIDs are covered by many different standards,
 * so typically it's simpler to use a pre-compiled list of them, such
 * as:
 * 
 * * https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg
 * * http://oid-info.com/
 * * https://www.alvestrand.no/objectid/top.html
 * @see <a href="https://www.itu.int/itu-t/recommendations/rec.aspx?rec=12483&amp;lang=en">Source</a>
 */

type Asn1Der_TypeTag int
const (
	Asn1Der_TypeTag__EndOfContent Asn1Der_TypeTag = 0
	Asn1Der_TypeTag__Boolean Asn1Der_TypeTag = 1
	Asn1Der_TypeTag__Integer Asn1Der_TypeTag = 2
	Asn1Der_TypeTag__BitString Asn1Der_TypeTag = 3
	Asn1Der_TypeTag__OctetString Asn1Der_TypeTag = 4
	Asn1Der_TypeTag__NullValue Asn1Der_TypeTag = 5
	Asn1Der_TypeTag__ObjectId Asn1Der_TypeTag = 6
	Asn1Der_TypeTag__ObjectDescriptor Asn1Der_TypeTag = 7
	Asn1Der_TypeTag__External Asn1Der_TypeTag = 8
	Asn1Der_TypeTag__Real Asn1Der_TypeTag = 9
	Asn1Der_TypeTag__Enumerated Asn1Der_TypeTag = 10
	Asn1Der_TypeTag__EmbeddedPdv Asn1Der_TypeTag = 11
	Asn1Der_TypeTag__Utf8string Asn1Der_TypeTag = 12
	Asn1Der_TypeTag__RelativeOid Asn1Der_TypeTag = 13
	Asn1Der_TypeTag__Sequence10 Asn1Der_TypeTag = 16
	Asn1Der_TypeTag__PrintableString Asn1Der_TypeTag = 19
	Asn1Der_TypeTag__Ia5string Asn1Der_TypeTag = 22
	Asn1Der_TypeTag__Sequence30 Asn1Der_TypeTag = 48
	Asn1Der_TypeTag__Set Asn1Der_TypeTag = 49
)
type Asn1Der struct {
	TypeTag Asn1Der_TypeTag
	Len *Asn1Der_LenEncoded
	Body interface{}
	_io *kaitai.Stream
	_root *Asn1Der
	_parent interface{}
	_raw_Body []byte
}
func NewAsn1Der() *Asn1Der {
	return &Asn1Der{
	}
}

func (this *Asn1Der) Read(io *kaitai.Stream, parent interface{}, root *Asn1Der) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.TypeTag = Asn1Der_TypeTag(tmp1)
	tmp2 := NewAsn1Der_LenEncoded()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Len = tmp2
	switch (this.TypeTag) {
	case Asn1Der_TypeTag__PrintableString:
		tmp3, err := this.Len.Result()
		if err != nil {
			return err
		}
		tmp4, err := this._io.ReadBytes(int(tmp3))
		if err != nil {
			return err
		}
		tmp4 = tmp4
		this._raw_Body = tmp4
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp5 := NewAsn1Der_BodyPrintableString()
		err = tmp5.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp5
	case Asn1Der_TypeTag__Sequence10:
		tmp6, err := this.Len.Result()
		if err != nil {
			return err
		}
		tmp7, err := this._io.ReadBytes(int(tmp6))
		if err != nil {
			return err
		}
		tmp7 = tmp7
		this._raw_Body = tmp7
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp8 := NewAsn1Der_BodySequence()
		err = tmp8.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp8
	case Asn1Der_TypeTag__Set:
		tmp9, err := this.Len.Result()
		if err != nil {
			return err
		}
		tmp10, err := this._io.ReadBytes(int(tmp9))
		if err != nil {
			return err
		}
		tmp10 = tmp10
		this._raw_Body = tmp10
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp11 := NewAsn1Der_BodySequence()
		err = tmp11.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp11
	case Asn1Der_TypeTag__Sequence30:
		tmp12, err := this.Len.Result()
		if err != nil {
			return err
		}
		tmp13, err := this._io.ReadBytes(int(tmp12))
		if err != nil {
			return err
		}
		tmp13 = tmp13
		this._raw_Body = tmp13
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp14 := NewAsn1Der_BodySequence()
		err = tmp14.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp14
	case Asn1Der_TypeTag__Utf8string:
		tmp15, err := this.Len.Result()
		if err != nil {
			return err
		}
		tmp16, err := this._io.ReadBytes(int(tmp15))
		if err != nil {
			return err
		}
		tmp16 = tmp16
		this._raw_Body = tmp16
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp17 := NewAsn1Der_BodyUtf8string()
		err = tmp17.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp17
	case Asn1Der_TypeTag__ObjectId:
		tmp18, err := this.Len.Result()
		if err != nil {
			return err
		}
		tmp19, err := this._io.ReadBytes(int(tmp18))
		if err != nil {
			return err
		}
		tmp19 = tmp19
		this._raw_Body = tmp19
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp20 := NewAsn1Der_BodyObjectId()
		err = tmp20.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp20
	default:
		tmp21, err := this.Len.Result()
		if err != nil {
			return err
		}
		tmp22, err := this._io.ReadBytes(int(tmp21))
		if err != nil {
			return err
		}
		tmp22 = tmp22
		this._raw_Body = tmp22
	}
	return err
}
type Asn1Der_BodySequence struct {
	Entries []*Asn1Der
	_io *kaitai.Stream
	_root *Asn1Der
	_parent *Asn1Der
}
func NewAsn1Der_BodySequence() *Asn1Der_BodySequence {
	return &Asn1Der_BodySequence{
	}
}

func (this *Asn1Der_BodySequence) Read(io *kaitai.Stream, parent *Asn1Der, root *Asn1Der) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp23, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp23 {
			break
		}
		tmp24 := NewAsn1Der()
		err = tmp24.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp24)
	}
	return err
}
type Asn1Der_BodyUtf8string struct {
	Str string
	_io *kaitai.Stream
	_root *Asn1Der
	_parent *Asn1Der
}
func NewAsn1Der_BodyUtf8string() *Asn1Der_BodyUtf8string {
	return &Asn1Der_BodyUtf8string{
	}
}

func (this *Asn1Der_BodyUtf8string) Read(io *kaitai.Stream, parent *Asn1Der, root *Asn1Der) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp25 = tmp25
	this.Str = string(tmp25)
	return err
}

/**
 * @see <a href="https://docs.microsoft.com/en-us/windows/desktop/SecCertEnroll/about-object-identifier">Source</a>
 */
type Asn1Der_BodyObjectId struct {
	FirstAndSecond uint8
	Rest []byte
	_io *kaitai.Stream
	_root *Asn1Der
	_parent *Asn1Der
	_f_first bool
	first int
	_f_second bool
	second int
}
func NewAsn1Der_BodyObjectId() *Asn1Der_BodyObjectId {
	return &Asn1Der_BodyObjectId{
	}
}

func (this *Asn1Der_BodyObjectId) Read(io *kaitai.Stream, parent *Asn1Der, root *Asn1Der) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FirstAndSecond = tmp26
	tmp27, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp27 = tmp27
	this.Rest = tmp27
	return err
}
func (this *Asn1Der_BodyObjectId) First() (v int, err error) {
	if (this._f_first) {
		return this.first, nil
	}
	this.first = int((this.FirstAndSecond / 40))
	this._f_first = true
	return this.first, nil
}
func (this *Asn1Der_BodyObjectId) Second() (v int, err error) {
	if (this._f_second) {
		return this.second, nil
	}
	tmp28 := this.FirstAndSecond % 40
	if tmp28 < 0 {
		tmp28 += 40
	}
	this.second = int(tmp28)
	this._f_second = true
	return this.second, nil
}
type Asn1Der_LenEncoded struct {
	B1 uint8
	Int2 uint16
	Int1 uint8
	_io *kaitai.Stream
	_root *Asn1Der
	_parent *Asn1Der
	_f_result bool
	result uint16
}
func NewAsn1Der_LenEncoded() *Asn1Der_LenEncoded {
	return &Asn1Der_LenEncoded{
	}
}

func (this *Asn1Der_LenEncoded) Read(io *kaitai.Stream, parent *Asn1Der, root *Asn1Der) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B1 = tmp29
	if (this.B1 == 130) {
		tmp30, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.Int2 = uint16(tmp30)
	}
	if (this.B1 == 129) {
		tmp31, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Int1 = tmp31
	}
	return err
}
func (this *Asn1Der_LenEncoded) Result() (v uint16, err error) {
	if (this._f_result) {
		return this.result, nil
	}
	var tmp32 uint8;
	if (this.B1 == 129) {
		tmp32 = this.Int1
	} else {
		var tmp33 uint16;
		if (this.B1 == 130) {
			tmp33 = this.Int2
		} else {
			tmp33 = this.B1
		}
		tmp32 = tmp33
	}
	this.result = uint16(tmp32)
	this._f_result = true
	return this.result, nil
}
type Asn1Der_BodyPrintableString struct {
	Str string
	_io *kaitai.Stream
	_root *Asn1Der
	_parent *Asn1Der
}
func NewAsn1Der_BodyPrintableString() *Asn1Der_BodyPrintableString {
	return &Asn1Der_BodyPrintableString{
	}
}

func (this *Asn1Der_BodyPrintableString) Read(io *kaitai.Stream, parent *Asn1Der, root *Asn1Der) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp34 = tmp34
	this.Str = string(tmp34)
	return err
}
