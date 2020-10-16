// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)

type TlsClientHello struct {
	Version *TlsClientHello_Version
	Random *TlsClientHello_Random
	SessionId *TlsClientHello_SessionId
	CipherSuites *TlsClientHello_CipherSuites
	CompressionMethods *TlsClientHello_CompressionMethods
	Extensions *TlsClientHello_Extensions
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent interface{}
}
func NewTlsClientHello() *TlsClientHello {
	return &TlsClientHello{
	}
}

func (this *TlsClientHello) Read(io *kaitai.Stream, parent interface{}, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewTlsClientHello_Version()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Version = tmp1
	tmp2 := NewTlsClientHello_Random()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Random = tmp2
	tmp3 := NewTlsClientHello_SessionId()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.SessionId = tmp3
	tmp4 := NewTlsClientHello_CipherSuites()
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.CipherSuites = tmp4
	tmp5 := NewTlsClientHello_CompressionMethods()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.CompressionMethods = tmp5
	tmp6, err := this._io.EOF()
	if err != nil {
		return err
	}
	if (tmp6 == false) {
		tmp7 := NewTlsClientHello_Extensions()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Extensions = tmp7
	}
	return err
}
type TlsClientHello_ServerName struct {
	NameType uint8
	Length uint16
	HostName []byte
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent *TlsClientHello_Sni
}
func NewTlsClientHello_ServerName() *TlsClientHello_ServerName {
	return &TlsClientHello_ServerName{
	}
}

func (this *TlsClientHello_ServerName) Read(io *kaitai.Stream, parent *TlsClientHello_Sni, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NameType = tmp8
	tmp9, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Length = uint16(tmp9)
	tmp10, err := this._io.ReadBytes(int(this.Length))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.HostName = tmp10
	return err
}
type TlsClientHello_Random struct {
	GmtUnixTime uint32
	Random []byte
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent *TlsClientHello
}
func NewTlsClientHello_Random() *TlsClientHello_Random {
	return &TlsClientHello_Random{
	}
}

func (this *TlsClientHello_Random) Read(io *kaitai.Stream, parent *TlsClientHello, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.GmtUnixTime = uint32(tmp11)
	tmp12, err := this._io.ReadBytes(int(28))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.Random = tmp12
	return err
}
type TlsClientHello_SessionId struct {
	Len uint8
	Sid []byte
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent *TlsClientHello
}
func NewTlsClientHello_SessionId() *TlsClientHello_SessionId {
	return &TlsClientHello_SessionId{
	}
}

func (this *TlsClientHello_SessionId) Read(io *kaitai.Stream, parent *TlsClientHello, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Len = tmp13
	tmp14, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.Sid = tmp14
	return err
}
type TlsClientHello_Sni struct {
	ListLength uint16
	ServerNames []*TlsClientHello_ServerName
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent *TlsClientHello_Extension
}
func NewTlsClientHello_Sni() *TlsClientHello_Sni {
	return &TlsClientHello_Sni{
	}
}

func (this *TlsClientHello_Sni) Read(io *kaitai.Stream, parent *TlsClientHello_Extension, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.ListLength = uint16(tmp15)
	for i := 1;; i++ {
		tmp16, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp16 {
			break
		}
		tmp17 := NewTlsClientHello_ServerName()
		err = tmp17.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ServerNames = append(this.ServerNames, tmp17)
	}
	return err
}
type TlsClientHello_CipherSuites struct {
	Len uint16
	CipherSuites []uint16
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent *TlsClientHello
}
func NewTlsClientHello_CipherSuites() *TlsClientHello_CipherSuites {
	return &TlsClientHello_CipherSuites{
	}
}

func (this *TlsClientHello_CipherSuites) Read(io *kaitai.Stream, parent *TlsClientHello, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp18, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Len = uint16(tmp18)
	this.CipherSuites = make([]uint16, (this.Len / 2))
	for i := range this.CipherSuites {
		tmp19, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.CipherSuites[i] = tmp19
	}
	return err
}
type TlsClientHello_CompressionMethods struct {
	Len uint8
	CompressionMethods []byte
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent *TlsClientHello
}
func NewTlsClientHello_CompressionMethods() *TlsClientHello_CompressionMethods {
	return &TlsClientHello_CompressionMethods{
	}
}

func (this *TlsClientHello_CompressionMethods) Read(io *kaitai.Stream, parent *TlsClientHello, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Len = tmp20
	tmp21, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp21 = tmp21
	this.CompressionMethods = tmp21
	return err
}
type TlsClientHello_Alpn struct {
	ExtLen uint16
	AlpnProtocols []*TlsClientHello_Protocol
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent *TlsClientHello_Extension
}
func NewTlsClientHello_Alpn() *TlsClientHello_Alpn {
	return &TlsClientHello_Alpn{
	}
}

func (this *TlsClientHello_Alpn) Read(io *kaitai.Stream, parent *TlsClientHello_Extension, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.ExtLen = uint16(tmp22)
	for i := 1;; i++ {
		tmp23, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp23 {
			break
		}
		tmp24 := NewTlsClientHello_Protocol()
		err = tmp24.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.AlpnProtocols = append(this.AlpnProtocols, tmp24)
	}
	return err
}
type TlsClientHello_Extensions struct {
	Len uint16
	Extensions []*TlsClientHello_Extension
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent *TlsClientHello
}
func NewTlsClientHello_Extensions() *TlsClientHello_Extensions {
	return &TlsClientHello_Extensions{
	}
}

func (this *TlsClientHello_Extensions) Read(io *kaitai.Stream, parent *TlsClientHello, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Len = uint16(tmp25)
	for i := 1;; i++ {
		tmp26, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp26 {
			break
		}
		tmp27 := NewTlsClientHello_Extension()
		err = tmp27.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Extensions = append(this.Extensions, tmp27)
	}
	return err
}
type TlsClientHello_Version struct {
	Major uint8
	Minor uint8
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent *TlsClientHello
}
func NewTlsClientHello_Version() *TlsClientHello_Version {
	return &TlsClientHello_Version{
	}
}

func (this *TlsClientHello_Version) Read(io *kaitai.Stream, parent *TlsClientHello, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Major = tmp28
	tmp29, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Minor = tmp29
	return err
}
type TlsClientHello_Protocol struct {
	Strlen uint8
	Name []byte
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent *TlsClientHello_Alpn
}
func NewTlsClientHello_Protocol() *TlsClientHello_Protocol {
	return &TlsClientHello_Protocol{
	}
}

func (this *TlsClientHello_Protocol) Read(io *kaitai.Stream, parent *TlsClientHello_Alpn, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp30, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Strlen = tmp30
	tmp31, err := this._io.ReadBytes(int(this.Strlen))
	if err != nil {
		return err
	}
	tmp31 = tmp31
	this.Name = tmp31
	return err
}
type TlsClientHello_Extension struct {
	Type uint16
	Len uint16
	Body interface{}
	_io *kaitai.Stream
	_root *TlsClientHello
	_parent *TlsClientHello_Extensions
	_raw_Body []byte
}
func NewTlsClientHello_Extension() *TlsClientHello_Extension {
	return &TlsClientHello_Extension{
	}
}

func (this *TlsClientHello_Extension) Read(io *kaitai.Stream, parent *TlsClientHello_Extensions, root *TlsClientHello) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp32, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Type = uint16(tmp32)
	tmp33, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Len = uint16(tmp33)
	switch (this.Type) {
	case 0:
		tmp34, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp34 = tmp34
		this._raw_Body = tmp34
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp35 := NewTlsClientHello_Sni()
		err = tmp35.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp35
	case 16:
		tmp36, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp36 = tmp36
		this._raw_Body = tmp36
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp37 := NewTlsClientHello_Alpn()
		err = tmp37.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp37
	default:
		tmp38, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp38 = tmp38
		this._raw_Body = tmp38
	}
	return err
}
