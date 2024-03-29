// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * @see <a href="https://bitcoin.org/en/developer-guide#transactions
 * https://en.bitcoin.it/wiki/Transaction
 * ">Source</a>
 */
type BitcoinTransaction struct {
	Version uint32
	NumVins uint8
	Vins []*BitcoinTransaction_Vin
	NumVouts uint8
	Vouts []*BitcoinTransaction_Vout
	Locktime uint32
	_io *kaitai.Stream
	_root *BitcoinTransaction
	_parent interface{}
}
func NewBitcoinTransaction() *BitcoinTransaction {
	return &BitcoinTransaction{
	}
}

func (this *BitcoinTransaction) Read(io *kaitai.Stream, parent interface{}, root *BitcoinTransaction) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp1)
	tmp2, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumVins = tmp2
	for i := 0; i < int(this.NumVins); i++ {
		_ = i
		tmp3 := NewBitcoinTransaction_Vin()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Vins = append(this.Vins, tmp3)
	}
	tmp4, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumVouts = tmp4
	for i := 0; i < int(this.NumVouts); i++ {
		_ = i
		tmp5 := NewBitcoinTransaction_Vout()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Vouts = append(this.Vouts, tmp5)
	}
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Locktime = uint32(tmp6)
	return err
}

/**
 * Version number.
 */

/**
 * Number of input transactions.
 */

/**
 * Input transactions.
 * An input refers to an output from a previous transaction.
 */

/**
 * Number of output transactions.
 */

/**
 * Output transactions.
 */
type BitcoinTransaction_Vin struct {
	Txid []byte
	OutputId uint32
	LenScript uint8
	ScriptSig *BitcoinTransaction_Vin_ScriptSignature
	EndOfVin []byte
	_io *kaitai.Stream
	_root *BitcoinTransaction
	_parent *BitcoinTransaction
	_raw_ScriptSig []byte
}
func NewBitcoinTransaction_Vin() *BitcoinTransaction_Vin {
	return &BitcoinTransaction_Vin{
	}
}

func (this *BitcoinTransaction_Vin) Read(io *kaitai.Stream, parent *BitcoinTransaction, root *BitcoinTransaction) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Txid = tmp7
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OutputId = uint32(tmp8)
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenScript = tmp9
	tmp10, err := this._io.ReadBytes(int(this.LenScript))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this._raw_ScriptSig = tmp10
	_io__raw_ScriptSig := kaitai.NewStream(bytes.NewReader(this._raw_ScriptSig))
	tmp11 := NewBitcoinTransaction_Vin_ScriptSignature()
	err = tmp11.Read(_io__raw_ScriptSig, this, this._root)
	if err != nil {
		return err
	}
	this.ScriptSig = tmp11
	tmp12, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.EndOfVin = tmp12
	if !(bytes.Equal(this.EndOfVin, []uint8{255, 255, 255, 255})) {
		return kaitai.NewValidationNotEqualError([]uint8{255, 255, 255, 255}, this.EndOfVin, this._io, "/types/vin/seq/4")
	}
	return err
}

/**
 * Previous transaction hash.
 */

/**
 * ID indexing an ouput of the transaction refered by txid.
 * This output will be used as an input in the present transaction.
 */

/**
 * ScriptSig's length.
 */

/**
 * ScriptSig.
 * @see <a href="https://en.bitcoin.it/wiki/Transaction#Input
 * https://en.bitcoin.it/wiki/Script
 * ">Source</a>
 */

/**
 * Magic number indicating the end of the current input.
 */

type BitcoinTransaction_Vin_ScriptSignature_SighashType int
const (
	BitcoinTransaction_Vin_ScriptSignature_SighashType__SighashAll BitcoinTransaction_Vin_ScriptSignature_SighashType = 1
	BitcoinTransaction_Vin_ScriptSignature_SighashType__SighashNone BitcoinTransaction_Vin_ScriptSignature_SighashType = 2
	BitcoinTransaction_Vin_ScriptSignature_SighashType__SighashSingle BitcoinTransaction_Vin_ScriptSignature_SighashType = 3
	BitcoinTransaction_Vin_ScriptSignature_SighashType__SighashAnyonecanpay BitcoinTransaction_Vin_ScriptSignature_SighashType = 80
)
type BitcoinTransaction_Vin_ScriptSignature struct {
	LenSigStack uint8
	DerSig *BitcoinTransaction_Vin_ScriptSignature_DerSignature
	SigType BitcoinTransaction_Vin_ScriptSignature_SighashType
	LenPubkeyStack uint8
	Pubkey *BitcoinTransaction_Vin_ScriptSignature_PublicKey
	_io *kaitai.Stream
	_root *BitcoinTransaction
	_parent *BitcoinTransaction_Vin
}
func NewBitcoinTransaction_Vin_ScriptSignature() *BitcoinTransaction_Vin_ScriptSignature {
	return &BitcoinTransaction_Vin_ScriptSignature{
	}
}

func (this *BitcoinTransaction_Vin_ScriptSignature) Read(io *kaitai.Stream, parent *BitcoinTransaction_Vin, root *BitcoinTransaction) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenSigStack = tmp13
	tmp14 := NewBitcoinTransaction_Vin_ScriptSignature_DerSignature()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DerSig = tmp14
	tmp15, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.SigType = BitcoinTransaction_Vin_ScriptSignature_SighashType(tmp15)
	tmp16, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenPubkeyStack = tmp16
	tmp17 := NewBitcoinTransaction_Vin_ScriptSignature_PublicKey()
	err = tmp17.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Pubkey = tmp17
	return err
}

/**
 * DER-encoded ECDSA signature.
 * @see <a href="https://en.wikipedia.org/wiki/X.690#DER_encoding
 * https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
 * ">Source</a>
 */

/**
 * Type of signature.
 */

/**
 * Public key (bitcoin address of the recipient).
 */
type BitcoinTransaction_Vin_ScriptSignature_DerSignature struct {
	Sequence []byte
	LenSig uint8
	Sep1 []byte
	LenSigR uint8
	SigR []byte
	Sep2 []byte
	LenSigS uint8
	SigS []byte
	_io *kaitai.Stream
	_root *BitcoinTransaction
	_parent *BitcoinTransaction_Vin_ScriptSignature
}
func NewBitcoinTransaction_Vin_ScriptSignature_DerSignature() *BitcoinTransaction_Vin_ScriptSignature_DerSignature {
	return &BitcoinTransaction_Vin_ScriptSignature_DerSignature{
	}
}

func (this *BitcoinTransaction_Vin_ScriptSignature_DerSignature) Read(io *kaitai.Stream, parent *BitcoinTransaction_Vin_ScriptSignature, root *BitcoinTransaction) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp18, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.Sequence = tmp18
	if !(bytes.Equal(this.Sequence, []uint8{48})) {
		return kaitai.NewValidationNotEqualError([]uint8{48}, this.Sequence, this._io, "/types/vin/types/script_signature/types/der_signature/seq/0")
	}
	tmp19, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenSig = tmp19
	tmp20, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.Sep1 = tmp20
	if !(bytes.Equal(this.Sep1, []uint8{2})) {
		return kaitai.NewValidationNotEqualError([]uint8{2}, this.Sep1, this._io, "/types/vin/types/script_signature/types/der_signature/seq/2")
	}
	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenSigR = tmp21
	tmp22, err := this._io.ReadBytes(int(this.LenSigR))
	if err != nil {
		return err
	}
	tmp22 = tmp22
	this.SigR = tmp22
	tmp23, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp23 = tmp23
	this.Sep2 = tmp23
	if !(bytes.Equal(this.Sep2, []uint8{2})) {
		return kaitai.NewValidationNotEqualError([]uint8{2}, this.Sep2, this._io, "/types/vin/types/script_signature/types/der_signature/seq/5")
	}
	tmp24, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenSigS = tmp24
	tmp25, err := this._io.ReadBytes(int(this.LenSigS))
	if err != nil {
		return err
	}
	tmp25 = tmp25
	this.SigS = tmp25
	return err
}

/**
 * 'r' value's length.
 */

/**
 * 'r' value of the ECDSA signature.
 * @see <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm">Source</a>
 */

/**
 * 's' value's length.
 */

/**
 * 's' value of the ECDSA signature.
 * @see <a href="https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm">Source</a>
 */
type BitcoinTransaction_Vin_ScriptSignature_PublicKey struct {
	Type uint8
	X []byte
	Y []byte
	_io *kaitai.Stream
	_root *BitcoinTransaction
	_parent *BitcoinTransaction_Vin_ScriptSignature
}
func NewBitcoinTransaction_Vin_ScriptSignature_PublicKey() *BitcoinTransaction_Vin_ScriptSignature_PublicKey {
	return &BitcoinTransaction_Vin_ScriptSignature_PublicKey{
	}
}

func (this *BitcoinTransaction_Vin_ScriptSignature_PublicKey) Read(io *kaitai.Stream, parent *BitcoinTransaction_Vin_ScriptSignature, root *BitcoinTransaction) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = tmp26
	tmp27, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp27 = tmp27
	this.X = tmp27
	tmp28, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	this.Y = tmp28
	return err
}

/**
 * 'x' coordinate of the public key on the elliptic curve.
 */

/**
 * 'y' coordinate of the public key on the elliptic curve.
 */
type BitcoinTransaction_Vout struct {
	Amount uint64
	LenScript uint8
	ScriptPubKey []byte
	_io *kaitai.Stream
	_root *BitcoinTransaction
	_parent *BitcoinTransaction
}
func NewBitcoinTransaction_Vout() *BitcoinTransaction_Vout {
	return &BitcoinTransaction_Vout{
	}
}

func (this *BitcoinTransaction_Vout) Read(io *kaitai.Stream, parent *BitcoinTransaction, root *BitcoinTransaction) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Amount = uint64(tmp29)
	tmp30, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenScript = tmp30
	tmp31, err := this._io.ReadBytes(int(this.LenScript))
	if err != nil {
		return err
	}
	tmp31 = tmp31
	this.ScriptPubKey = tmp31
	return err
}

/**
 * Number of Satoshis to be transfered.
 */

/**
 * ScriptPubKey's length.
 */

/**
 * ScriptPubKey.
 * @see <a href="https://en.bitcoin.it/wiki/Transaction#Output
 * https://en.bitcoin.it/wiki/Script
 * ">Source</a>
 */
