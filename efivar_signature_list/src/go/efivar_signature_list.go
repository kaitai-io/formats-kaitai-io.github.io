// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Parse UEFI variables db and dbx that contain signatures, certificates and
 * hashes. On a Linux system using UEFI, these variables are readable from
 * /sys/firmware/efi/efivars/db-d719b2cb-3d3a-4596-a3bc-dad00e67656f,
 * /sys/firmware/efi/efivars/dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c,
 * /sys/firmware/efi/efivars/dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f and
 * /sys/firmware/efi/efivars/dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c.
 * ("d719b2cb-3d3a-4596-a3bc-dad00e67656f" is defined as
 * EFI_IMAGE_SECURITY_DATABASE_GUID and "8be4df61-93ca-11d2-aa0d-00e098032b8c"
 * as EFI_GLOBAL_VARIABLE).
 * Each file contains an EFI attribute (32-bit integer) followed by a list of
 * EFI_SIGNATURE_LIST structures.
 * @see <a href="https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf">Source</a>
 */
type EfivarSignatureList struct {
	VarAttributes *EfivarSignatureList_EfiVarAttr
	Signatures []*EfivarSignatureList_SignatureList
	_io *kaitai.Stream
	_root *EfivarSignatureList
	_parent interface{}
}
func NewEfivarSignatureList() *EfivarSignatureList {
	return &EfivarSignatureList{
	}
}

func (this *EfivarSignatureList) Read(io *kaitai.Stream, parent interface{}, root *EfivarSignatureList) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewEfivarSignatureList_EfiVarAttr()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.VarAttributes = tmp1
	for i := 1;; i++ {
		tmp2, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp2 {
			break
		}
		tmp3 := NewEfivarSignatureList_SignatureList()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Signatures = append(this.Signatures, tmp3)
	}
	return err
}

/**
 * Attributes of the UEFI variable
 */

/**
 * @see "EFI_SIGNATURE_LIST"
 */
type EfivarSignatureList_SignatureList struct {
	SignatureType []byte
	LenSignatureList uint32
	LenSignatureHeader uint32
	LenSignature uint32
	Header []byte
	Signatures []*EfivarSignatureList_SignatureData
	_io *kaitai.Stream
	_root *EfivarSignatureList
	_parent *EfivarSignatureList
	_raw_Signatures [][]byte
	_f_isCertSha512X509 bool
	isCertSha512X509 bool
	_f_isCertSha224 bool
	isCertSha224 bool
	_f_isCertX509 bool
	isCertX509 bool
	_f_isCertSha256X509 bool
	isCertSha256X509 bool
	_f_isCertRsa2048Key bool
	isCertRsa2048Key bool
	_f_isCertSha512 bool
	isCertSha512 bool
	_f_isCertSha384 bool
	isCertSha384 bool
	_f_isCertSha1 bool
	isCertSha1 bool
	_f_isCertRsa2048Sha1 bool
	isCertRsa2048Sha1 bool
	_f_isCertSha256 bool
	isCertSha256 bool
	_f_isCertSha384X509 bool
	isCertSha384X509 bool
	_f_isCertRsa2048Sha256 bool
	isCertRsa2048Sha256 bool
	_f_isCertDerPkcs7 bool
	isCertDerPkcs7 bool
}
func NewEfivarSignatureList_SignatureList() *EfivarSignatureList_SignatureList {
	return &EfivarSignatureList_SignatureList{
	}
}

func (this *EfivarSignatureList_SignatureList) Read(io *kaitai.Stream, parent *EfivarSignatureList, root *EfivarSignatureList) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.SignatureType = tmp4
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenSignatureList = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenSignatureHeader = uint32(tmp6)
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenSignature = uint32(tmp7)
	tmp8, err := this._io.ReadBytes(int(this.LenSignatureHeader))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Header = tmp8
	if (this.LenSignature > 0) {
		this._raw_Signatures = make([][]byte, (((this.LenSignatureList - this.LenSignatureHeader) - 28) / this.LenSignature))
		this.Signatures = make([]*EfivarSignatureList_SignatureData, (((this.LenSignatureList - this.LenSignatureHeader) - 28) / this.LenSignature))
		for i := range this.Signatures {
			tmp9, err := this._io.ReadBytes(int(this.LenSignature))
			if err != nil {
				return err
			}
			tmp9 = tmp9
			this._raw_Signatures[i] = tmp9
			_io__raw_Signatures := kaitai.NewStream(bytes.NewReader(this._raw_Signatures[i]))
			tmp10 := NewEfivarSignatureList_SignatureData()
			err = tmp10.Read(_io__raw_Signatures, this, this._root)
			if err != nil {
				return err
			}
			this.Signatures[i] = tmp10
		}
	}
	return err
}

/**
 * SHA512 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
 * @see "EFI_CERT_X509_SHA512_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertSha512X509() (v bool, err error) {
	if (this._f_isCertSha512X509) {
		return this.isCertSha512X509, nil
	}
	this.isCertSha512X509 = bool(bytes.Equal(this.SignatureType, []uint8{99, 191, 109, 68, 2, 37, 218, 76, 188, 250, 36, 101, 210, 176, 254, 157}))
	this._f_isCertSha512X509 = true
	return this.isCertSha512X509, nil
}

/**
 * SHA-224 hash
 * @see "EFI_CERT_SHA224_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertSha224() (v bool, err error) {
	if (this._f_isCertSha224) {
		return this.isCertSha224, nil
	}
	this.isCertSha224 = bool(bytes.Equal(this.SignatureType, []uint8{51, 82, 110, 11, 92, 166, 201, 68, 148, 7, 217, 171, 131, 191, 200, 189}))
	this._f_isCertSha224 = true
	return this.isCertSha224, nil
}

/**
 * X.509 certificate
 * @see "EFI_CERT_X509_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertX509() (v bool, err error) {
	if (this._f_isCertX509) {
		return this.isCertX509, nil
	}
	this.isCertX509 = bool(bytes.Equal(this.SignatureType, []uint8{161, 89, 192, 165, 228, 148, 167, 74, 135, 181, 171, 21, 92, 43, 240, 114}))
	this._f_isCertX509 = true
	return this.isCertX509, nil
}

/**
 * SHA256 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
 * @see "EFI_CERT_X509_SHA256_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertSha256X509() (v bool, err error) {
	if (this._f_isCertSha256X509) {
		return this.isCertSha256X509, nil
	}
	this.isCertSha256X509 = bool(bytes.Equal(this.SignatureType, []uint8{146, 164, 210, 59, 192, 150, 121, 64, 180, 32, 252, 249, 142, 241, 3, 237}))
	this._f_isCertSha256X509 = true
	return this.isCertSha256X509, nil
}

/**
 * RSA-2048 key (only the modulus since the public key exponent is known to be 0x10001)
 * @see "EFI_CERT_RSA2048_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertRsa2048Key() (v bool, err error) {
	if (this._f_isCertRsa2048Key) {
		return this.isCertRsa2048Key, nil
	}
	this.isCertRsa2048Key = bool(bytes.Equal(this.SignatureType, []uint8{232, 102, 87, 60, 156, 38, 52, 78, 170, 20, 237, 119, 110, 133, 179, 182}))
	this._f_isCertRsa2048Key = true
	return this.isCertRsa2048Key, nil
}

/**
 * SHA-512 hash
 * @see "EFI_CERT_SHA512_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertSha512() (v bool, err error) {
	if (this._f_isCertSha512) {
		return this.isCertSha512, nil
	}
	this.isCertSha512 = bool(bytes.Equal(this.SignatureType, []uint8{174, 15, 62, 9, 196, 166, 80, 79, 159, 27, 212, 30, 43, 137, 193, 154}))
	this._f_isCertSha512 = true
	return this.isCertSha512, nil
}

/**
 * SHA-384 hash
 * @see "EFI_CERT_SHA384_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertSha384() (v bool, err error) {
	if (this._f_isCertSha384) {
		return this.isCertSha384, nil
	}
	this.isCertSha384 = bool(bytes.Equal(this.SignatureType, []uint8{7, 83, 62, 255, 208, 159, 201, 72, 133, 241, 138, 213, 108, 112, 30, 1}))
	this._f_isCertSha384 = true
	return this.isCertSha384, nil
}

/**
 * SHA-1 hash
 * @see "EFI_CERT_SHA1_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertSha1() (v bool, err error) {
	if (this._f_isCertSha1) {
		return this.isCertSha1, nil
	}
	this.isCertSha1 = bool(bytes.Equal(this.SignatureType, []uint8{18, 165, 108, 130, 16, 207, 201, 74, 177, 135, 190, 1, 73, 102, 49, 189}))
	this._f_isCertSha1 = true
	return this.isCertSha1, nil
}

/**
 * RSA-2048 signature of a SHA-1 hash
 * @see "EFI_CERT_RSA2048_SHA1_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertRsa2048Sha1() (v bool, err error) {
	if (this._f_isCertRsa2048Sha1) {
		return this.isCertRsa2048Sha1, nil
	}
	this.isCertRsa2048Sha1 = bool(bytes.Equal(this.SignatureType, []uint8{79, 68, 248, 103, 67, 135, 241, 72, 163, 40, 30, 170, 184, 115, 96, 128}))
	this._f_isCertRsa2048Sha1 = true
	return this.isCertRsa2048Sha1, nil
}

/**
 * SHA-256 hash
 * @see "EFI_CERT_SHA256_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertSha256() (v bool, err error) {
	if (this._f_isCertSha256) {
		return this.isCertSha256, nil
	}
	this.isCertSha256 = bool(bytes.Equal(this.SignatureType, []uint8{38, 22, 196, 193, 76, 80, 146, 64, 172, 169, 65, 249, 54, 147, 67, 40}))
	this._f_isCertSha256 = true
	return this.isCertSha256, nil
}

/**
 * SHA384 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
 * @see "EFI_CERT_X509_SHA384_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertSha384X509() (v bool, err error) {
	if (this._f_isCertSha384X509) {
		return this.isCertSha384X509, nil
	}
	this.isCertSha384X509 = bool(bytes.Equal(this.SignatureType, []uint8{110, 135, 118, 112, 194, 128, 230, 78, 170, 210, 40, 179, 73, 166, 134, 91}))
	this._f_isCertSha384X509 = true
	return this.isCertSha384X509, nil
}

/**
 * RSA-2048 signature of a SHA-256 hash
 * @see "EFI_CERT_RSA2048_SHA256_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertRsa2048Sha256() (v bool, err error) {
	if (this._f_isCertRsa2048Sha256) {
		return this.isCertRsa2048Sha256, nil
	}
	this.isCertRsa2048Sha256 = bool(bytes.Equal(this.SignatureType, []uint8{144, 97, 179, 226, 155, 135, 61, 74, 173, 141, 242, 231, 187, 163, 39, 132}))
	this._f_isCertRsa2048Sha256 = true
	return this.isCertRsa2048Sha256, nil
}

/**
 * DER-encoded PKCS #7 version 1.5 [RFC2315]
 * @see "EFI_CERT_TYPE_PKCS7_GUID"
 */
func (this *EfivarSignatureList_SignatureList) IsCertDerPkcs7() (v bool, err error) {
	if (this._f_isCertDerPkcs7) {
		return this.isCertDerPkcs7, nil
	}
	this.isCertDerPkcs7 = bool(bytes.Equal(this.SignatureType, []uint8{157, 210, 175, 74, 223, 104, 238, 73, 138, 169, 52, 125, 55, 86, 101, 167}))
	this._f_isCertDerPkcs7 = true
	return this.isCertDerPkcs7, nil
}

/**
 * Type of the signature as a GUID
 */

/**
 * Total size of the signature list, including this header
 */

/**
 * Size of the signature header which precedes the array of signatures
 */

/**
 * Size of each signature
 */

/**
 * Header before the array of signatures
 */

/**
 * An array of signatures
 */

/**
 * @see "EFI_SIGNATURE_DATA"
 */
type EfivarSignatureList_SignatureData struct {
	Owner []byte
	Data []byte
	_io *kaitai.Stream
	_root *EfivarSignatureList
	_parent *EfivarSignatureList_SignatureList
}
func NewEfivarSignatureList_SignatureData() *EfivarSignatureList_SignatureData {
	return &EfivarSignatureList_SignatureData{
	}
}

func (this *EfivarSignatureList_SignatureData) Read(io *kaitai.Stream, parent *EfivarSignatureList_SignatureList, root *EfivarSignatureList) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Owner = tmp11
	tmp12, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.Data = tmp12
	return err
}

/**
 * An identifier which identifies the agent which added the signature to the list
 */

/**
 * The format of the signature is defined by the SignatureType.
 */

/**
 * Attributes of a UEFI variable
 */
type EfivarSignatureList_EfiVarAttr struct {
	EnhancedAuthenticatedAccess bool
	AppendWrite bool
	TimeBasedAuthenticatedWriteAccess bool
	AuthenticatedWriteAccess bool
	HardwareErrorRecord bool
	RuntimeAccess bool
	BootserviceAccess bool
	NonVolatile bool
	Reserved1 uint64
	_io *kaitai.Stream
	_root *EfivarSignatureList
	_parent *EfivarSignatureList
}
func NewEfivarSignatureList_EfiVarAttr() *EfivarSignatureList_EfiVarAttr {
	return &EfivarSignatureList_EfiVarAttr{
	}
}

func (this *EfivarSignatureList_EfiVarAttr) Read(io *kaitai.Stream, parent *EfivarSignatureList, root *EfivarSignatureList) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.EnhancedAuthenticatedAccess = tmp13 != 0
	tmp14, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.AppendWrite = tmp14 != 0
	tmp15, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.TimeBasedAuthenticatedWriteAccess = tmp15 != 0
	tmp16, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.AuthenticatedWriteAccess = tmp16 != 0
	tmp17, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HardwareErrorRecord = tmp17 != 0
	tmp18, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.RuntimeAccess = tmp18 != 0
	tmp19, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.BootserviceAccess = tmp19 != 0
	tmp20, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.NonVolatile = tmp20 != 0
	tmp21, err := this._io.ReadBitsIntBe(24)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp21
	return err
}

/**
 * Reserved (unused) bits
 */