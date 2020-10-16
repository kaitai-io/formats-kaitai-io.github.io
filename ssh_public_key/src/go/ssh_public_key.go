// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * SSH public keys are encoded in a special binary format, typically represented
 * to end users as either one-liner OpenSSH format or multi-line PEM format
 * (commerical SSH). Text wrapper carries extra information about user who
 * created the key, comment, etc, but the inner binary is always base64-encoded
 * and follows the same internal format.
 * 
 * This format spec deals with this internal binary format (called "blob" in
 * openssh sources) only. Buffer is expected to be raw binary and not base64-d.
 * Implementation closely follows code in OpenSSH.
 * @see <a href="https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L1970">Source</a>
 */
type SshPublicKey struct {
	KeyName *SshPublicKey_Cstring
	Body interface{}
	_io *kaitai.Stream
	_root *SshPublicKey
	_parent interface{}
}
func NewSshPublicKey() *SshPublicKey {
	return &SshPublicKey{
	}
}

func (this *SshPublicKey) Read(io *kaitai.Stream, parent interface{}, root *SshPublicKey) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewSshPublicKey_Cstring()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.KeyName = tmp1
	switch (this.KeyName.Value) {
	case "ssh-rsa":
		tmp2 := NewSshPublicKey_KeyRsa()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp2
	case "ecdsa-sha2-nistp256":
		tmp3 := NewSshPublicKey_KeyEcdsa()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp3
	case "ssh-ed25519":
		tmp4 := NewSshPublicKey_KeyEd25519()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp4
	case "ssh-dss":
		tmp5 := NewSshPublicKey_KeyDsa()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp5
	}
	return err
}

/**
 * @see <a href="https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2011-L2028">Source</a>
 */
type SshPublicKey_KeyRsa struct {
	RsaE *SshPublicKey_Bignum2
	RsaN *SshPublicKey_Bignum2
	_io *kaitai.Stream
	_root *SshPublicKey
	_parent *SshPublicKey
	_f_keyLength bool
	keyLength int
}
func NewSshPublicKey_KeyRsa() *SshPublicKey_KeyRsa {
	return &SshPublicKey_KeyRsa{
	}
}

func (this *SshPublicKey_KeyRsa) Read(io *kaitai.Stream, parent *SshPublicKey, root *SshPublicKey) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6 := NewSshPublicKey_Bignum2()
	err = tmp6.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.RsaE = tmp6
	tmp7 := NewSshPublicKey_Bignum2()
	err = tmp7.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.RsaN = tmp7
	return err
}

/**
 * Key length in bits
 */
func (this *SshPublicKey_KeyRsa) KeyLength() (v int, err error) {
	if (this._f_keyLength) {
		return this.keyLength, nil
	}
	tmp8, err := this.RsaN.LengthInBits()
	if err != nil {
		return 0, err
	}
	this.keyLength = int(tmp8)
	this._f_keyLength = true
	return this.keyLength, nil
}

/**
 * Public key exponent, designated `e` in RSA documentation.
 */

/**
 * Modulus of both public and private keys, designated `n` in RSA
 * documentation. Its length in bits is designated as "key length".
 */

/**
 * @see <a href="https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2111-L2124">Source</a>
 */
type SshPublicKey_KeyEd25519 struct {
	LenPk uint32
	Pk []byte
	_io *kaitai.Stream
	_root *SshPublicKey
	_parent *SshPublicKey
}
func NewSshPublicKey_KeyEd25519() *SshPublicKey_KeyEd25519 {
	return &SshPublicKey_KeyEd25519{
	}
}

func (this *SshPublicKey_KeyEd25519) Read(io *kaitai.Stream, parent *SshPublicKey, root *SshPublicKey) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenPk = uint32(tmp9)
	tmp10, err := this._io.ReadBytes(int(this.LenPk))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Pk = tmp10
	return err
}

/**
 * @see <a href="https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2060-L2103">Source</a>
 */
type SshPublicKey_KeyEcdsa struct {
	CurveName *SshPublicKey_Cstring
	Ec *SshPublicKey_EllipticCurve
	_io *kaitai.Stream
	_root *SshPublicKey
	_parent *SshPublicKey
}
func NewSshPublicKey_KeyEcdsa() *SshPublicKey_KeyEcdsa {
	return &SshPublicKey_KeyEcdsa{
	}
}

func (this *SshPublicKey_KeyEcdsa) Read(io *kaitai.Stream, parent *SshPublicKey, root *SshPublicKey) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11 := NewSshPublicKey_Cstring()
	err = tmp11.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.CurveName = tmp11
	tmp12 := NewSshPublicKey_EllipticCurve()
	err = tmp12.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Ec = tmp12
	return err
}

/**
 * A integer-prefixed string designed to be read using `sshbuf_get_cstring`
 * and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
 * obscure misnomer, as typically "C string" means a null-terminated string.
 * @see <a href="https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-basic.c#L181">Source</a>
 */
type SshPublicKey_Cstring struct {
	Len uint32
	Value string
	_io *kaitai.Stream
	_root *SshPublicKey
	_parent interface{}
}
func NewSshPublicKey_Cstring() *SshPublicKey_Cstring {
	return &SshPublicKey_Cstring{
	}
}

func (this *SshPublicKey_Cstring) Read(io *kaitai.Stream, parent interface{}, root *SshPublicKey) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Len = uint32(tmp13)
	tmp14, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.Value = string(tmp14)
	return err
}

/**
 * @see <a href="https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2036-L2051">Source</a>
 */
type SshPublicKey_KeyDsa struct {
	DsaP *SshPublicKey_Bignum2
	DsaQ *SshPublicKey_Bignum2
	DsaG *SshPublicKey_Bignum2
	DsaPubKey *SshPublicKey_Bignum2
	_io *kaitai.Stream
	_root *SshPublicKey
	_parent *SshPublicKey
}
func NewSshPublicKey_KeyDsa() *SshPublicKey_KeyDsa {
	return &SshPublicKey_KeyDsa{
	}
}

func (this *SshPublicKey_KeyDsa) Read(io *kaitai.Stream, parent *SshPublicKey, root *SshPublicKey) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15 := NewSshPublicKey_Bignum2()
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DsaP = tmp15
	tmp16 := NewSshPublicKey_Bignum2()
	err = tmp16.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DsaQ = tmp16
	tmp17 := NewSshPublicKey_Bignum2()
	err = tmp17.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DsaG = tmp17
	tmp18 := NewSshPublicKey_Bignum2()
	err = tmp18.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DsaPubKey = tmp18
	return err
}

/**
 * Elliptic curve dump format used by ssh. In OpenSSH code, the following
 * routines are used to read/write it:
 * 
 * * sshbuf_get_ec
 * * get_ec
 * @see <a href="https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-crypto.c#L90
 * https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-crypto.c#L76
 * ">Source</a>
 */
type SshPublicKey_EllipticCurve struct {
	Len uint32
	Body []byte
	_io *kaitai.Stream
	_root *SshPublicKey
	_parent *SshPublicKey_KeyEcdsa
}
func NewSshPublicKey_EllipticCurve() *SshPublicKey_EllipticCurve {
	return &SshPublicKey_EllipticCurve{
	}
}

func (this *SshPublicKey_EllipticCurve) Read(io *kaitai.Stream, parent *SshPublicKey_KeyEcdsa, root *SshPublicKey) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Len = uint32(tmp19)
	tmp20, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.Body = tmp20
	return err
}

/**
 * Big integers serialization format used by ssh, v2. In the code, the following
 * routines are used to read/write it:
 * 
 * * sshbuf_get_bignum2
 * * sshbuf_get_bignum2_bytes_direct
 * * sshbuf_put_bignum2
 * * sshbuf_get_bignum2_bytes_direct
 * @see <a href="https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-crypto.c#L35
 * https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-basic.c#L431
 * ">Source</a>
 */
type SshPublicKey_Bignum2 struct {
	Len uint32
	Body []byte
	_io *kaitai.Stream
	_root *SshPublicKey
	_parent interface{}
	_f_lengthInBits bool
	lengthInBits int
}
func NewSshPublicKey_Bignum2() *SshPublicKey_Bignum2 {
	return &SshPublicKey_Bignum2{
	}
}

func (this *SshPublicKey_Bignum2) Read(io *kaitai.Stream, parent interface{}, root *SshPublicKey) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp21, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Len = uint32(tmp21)
	tmp22, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp22 = tmp22
	this.Body = tmp22
	return err
}

/**
 * Length of big integer in bits. In OpenSSH sources, this corresponds to
 * `BN_num_bits` function.
 */
func (this *SshPublicKey_Bignum2) LengthInBits() (v int, err error) {
	if (this._f_lengthInBits) {
		return this.lengthInBits, nil
	}
	this.lengthInBits = int(((this.Len - 1) * 8))
	this._f_lengthInBits = true
	return this.lengthInBits, nil
}
