// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * The OpenPGP Message Format is a format to store encryption and signature keys for emails.
 * @see <a href="https://tools.ietf.org/html/rfc4880">Source</a>
 */

type OpenpgpMessage_PublicKeyAlgorithms int
const (
	OpenpgpMessage_PublicKeyAlgorithms__RsaEncryptOrSignHac OpenpgpMessage_PublicKeyAlgorithms = 1
	OpenpgpMessage_PublicKeyAlgorithms__RsaEncryptOnlyHac OpenpgpMessage_PublicKeyAlgorithms = 2
	OpenpgpMessage_PublicKeyAlgorithms__RsaSignOnlyHac OpenpgpMessage_PublicKeyAlgorithms = 3
	OpenpgpMessage_PublicKeyAlgorithms__ElgamalEncryptOnlyElgamalHac OpenpgpMessage_PublicKeyAlgorithms = 16
	OpenpgpMessage_PublicKeyAlgorithms__DsaDigitalSignatureAlgorithmFipsHac OpenpgpMessage_PublicKeyAlgorithms = 17
	OpenpgpMessage_PublicKeyAlgorithms__ReservedForEllipticCurve OpenpgpMessage_PublicKeyAlgorithms = 18
	OpenpgpMessage_PublicKeyAlgorithms__ReservedForEcdsa OpenpgpMessage_PublicKeyAlgorithms = 19
	OpenpgpMessage_PublicKeyAlgorithms__ReservedFormerlyElgamalEncryptOrSign OpenpgpMessage_PublicKeyAlgorithms = 20
	OpenpgpMessage_PublicKeyAlgorithms__ReservedForDiffieHellmanXAsDefinedForIetfSMime OpenpgpMessage_PublicKeyAlgorithms = 21
	OpenpgpMessage_PublicKeyAlgorithms__PrivateExperimentalAlgorithm00 OpenpgpMessage_PublicKeyAlgorithms = 100
	OpenpgpMessage_PublicKeyAlgorithms__PrivateExperimentalAlgorithm01 OpenpgpMessage_PublicKeyAlgorithms = 101
	OpenpgpMessage_PublicKeyAlgorithms__PrivateExperimentalAlgorithm02 OpenpgpMessage_PublicKeyAlgorithms = 102
	OpenpgpMessage_PublicKeyAlgorithms__PrivateExperimentalAlgorithm03 OpenpgpMessage_PublicKeyAlgorithms = 103
	OpenpgpMessage_PublicKeyAlgorithms__PrivateExperimentalAlgorithm04 OpenpgpMessage_PublicKeyAlgorithms = 104
	OpenpgpMessage_PublicKeyAlgorithms__PrivateExperimentalAlgorithm05 OpenpgpMessage_PublicKeyAlgorithms = 105
	OpenpgpMessage_PublicKeyAlgorithms__PrivateExperimentalAlgorithm06 OpenpgpMessage_PublicKeyAlgorithms = 106
	OpenpgpMessage_PublicKeyAlgorithms__PrivateExperimentalAlgorithm07 OpenpgpMessage_PublicKeyAlgorithms = 107
	OpenpgpMessage_PublicKeyAlgorithms__PrivateExperimentalAlgorithm08 OpenpgpMessage_PublicKeyAlgorithms = 108
	OpenpgpMessage_PublicKeyAlgorithms__PrivateExperimentalAlgorithm09 OpenpgpMessage_PublicKeyAlgorithms = 109
	OpenpgpMessage_PublicKeyAlgorithms__PrivateExperimentalAlgorithm10 OpenpgpMessage_PublicKeyAlgorithms = 110
)

type OpenpgpMessage_ServerFlags int
const (
	OpenpgpMessage_ServerFlags__NoModify OpenpgpMessage_ServerFlags = 128
)

type OpenpgpMessage_KeyFlags int
const (
	OpenpgpMessage_KeyFlags__ThisKeyMayBeUsedToCertifyOtherKeys OpenpgpMessage_KeyFlags = 1
	OpenpgpMessage_KeyFlags__ThisKeyMayBeUsedToSignData OpenpgpMessage_KeyFlags = 2
	OpenpgpMessage_KeyFlags__ThisKeyMayBeUsedToEncryptCommunications OpenpgpMessage_KeyFlags = 4
	OpenpgpMessage_KeyFlags__ThisKeyMayBeUsedToEncryptStorage OpenpgpMessage_KeyFlags = 8
	OpenpgpMessage_KeyFlags__ThePrivateComponentOfThisKeyMayHaveBeenSplitByASecretSharingMechanism OpenpgpMessage_KeyFlags = 16
	OpenpgpMessage_KeyFlags__ThisKeyMayBeUsedForAuthentication OpenpgpMessage_KeyFlags = 32
	OpenpgpMessage_KeyFlags__ThePrivateComponentOfThisKeyMayBeInThePossessionOfMoreThanOnePerson OpenpgpMessage_KeyFlags = 128
)

type OpenpgpMessage_CompressionAlgorithms int
const (
	OpenpgpMessage_CompressionAlgorithms__Uncompressed OpenpgpMessage_CompressionAlgorithms = 0
	OpenpgpMessage_CompressionAlgorithms__Zib OpenpgpMessage_CompressionAlgorithms = 1
	OpenpgpMessage_CompressionAlgorithms__Zlib OpenpgpMessage_CompressionAlgorithms = 2
	OpenpgpMessage_CompressionAlgorithms__Bzip OpenpgpMessage_CompressionAlgorithms = 3
	OpenpgpMessage_CompressionAlgorithms__PrivateExperimentalAlgorithm00 OpenpgpMessage_CompressionAlgorithms = 100
	OpenpgpMessage_CompressionAlgorithms__PrivateExperimentalAlgorithm01 OpenpgpMessage_CompressionAlgorithms = 101
	OpenpgpMessage_CompressionAlgorithms__PrivateExperimentalAlgorithm02 OpenpgpMessage_CompressionAlgorithms = 102
	OpenpgpMessage_CompressionAlgorithms__PrivateExperimentalAlgorithm03 OpenpgpMessage_CompressionAlgorithms = 103
	OpenpgpMessage_CompressionAlgorithms__PrivateExperimentalAlgorithm04 OpenpgpMessage_CompressionAlgorithms = 104
	OpenpgpMessage_CompressionAlgorithms__PrivateExperimentalAlgorithm05 OpenpgpMessage_CompressionAlgorithms = 105
	OpenpgpMessage_CompressionAlgorithms__PrivateExperimentalAlgorithm06 OpenpgpMessage_CompressionAlgorithms = 106
	OpenpgpMessage_CompressionAlgorithms__PrivateExperimentalAlgorithm07 OpenpgpMessage_CompressionAlgorithms = 107
	OpenpgpMessage_CompressionAlgorithms__PrivateExperimentalAlgorithm08 OpenpgpMessage_CompressionAlgorithms = 108
	OpenpgpMessage_CompressionAlgorithms__PrivateExperimentalAlgorithm09 OpenpgpMessage_CompressionAlgorithms = 109
	OpenpgpMessage_CompressionAlgorithms__PrivateExperimentalAlgorithm10 OpenpgpMessage_CompressionAlgorithms = 110
)

type OpenpgpMessage_PacketTags int
const (
	OpenpgpMessage_PacketTags__ReservedAPacketTagMustNotHaveThisValue OpenpgpMessage_PacketTags = 0
	OpenpgpMessage_PacketTags__PublicKeyEncryptedSessionKeyPacket OpenpgpMessage_PacketTags = 1
	OpenpgpMessage_PacketTags__SignaturePacket OpenpgpMessage_PacketTags = 2
	OpenpgpMessage_PacketTags__SymmetricKeyEncryptedSessionKeyPacket OpenpgpMessage_PacketTags = 3
	OpenpgpMessage_PacketTags__OnePassSignaturePacket OpenpgpMessage_PacketTags = 4
	OpenpgpMessage_PacketTags__SecretKeyPacket OpenpgpMessage_PacketTags = 5
	OpenpgpMessage_PacketTags__PublicKeyPacket OpenpgpMessage_PacketTags = 6
	OpenpgpMessage_PacketTags__SecretSubkeyPacket OpenpgpMessage_PacketTags = 7
	OpenpgpMessage_PacketTags__CompressedDataPacket OpenpgpMessage_PacketTags = 8
	OpenpgpMessage_PacketTags__SymmetricallyEncryptedDataPacket OpenpgpMessage_PacketTags = 9
	OpenpgpMessage_PacketTags__MarkerPacket OpenpgpMessage_PacketTags = 10
	OpenpgpMessage_PacketTags__LiteralDataPacket OpenpgpMessage_PacketTags = 11
	OpenpgpMessage_PacketTags__TrustPacket OpenpgpMessage_PacketTags = 12
	OpenpgpMessage_PacketTags__UserIdPacket OpenpgpMessage_PacketTags = 13
	OpenpgpMessage_PacketTags__PublicSubkeyPacket OpenpgpMessage_PacketTags = 14
	OpenpgpMessage_PacketTags__UserAttributePacket OpenpgpMessage_PacketTags = 17
	OpenpgpMessage_PacketTags__SymEncryptedAndIntegrityProtectedDataPacket OpenpgpMessage_PacketTags = 18
	OpenpgpMessage_PacketTags__ModificationDetectionCodePacket OpenpgpMessage_PacketTags = 19
	OpenpgpMessage_PacketTags__PrivateOrExperimentalValues0 OpenpgpMessage_PacketTags = 60
	OpenpgpMessage_PacketTags__PrivateOrExperimentalValues1 OpenpgpMessage_PacketTags = 61
	OpenpgpMessage_PacketTags__PrivateOrExperimentalValues2 OpenpgpMessage_PacketTags = 62
	OpenpgpMessage_PacketTags__PrivateOrExperimentalValues3 OpenpgpMessage_PacketTags = 63
)

type OpenpgpMessage_RevocationCodes int
const (
	OpenpgpMessage_RevocationCodes__NoReasonSpecifiedKeyRevocationsOrCertRevocations OpenpgpMessage_RevocationCodes = 0
	OpenpgpMessage_RevocationCodes__KeyIsSupersededKeyRevocations OpenpgpMessage_RevocationCodes = 1
	OpenpgpMessage_RevocationCodes__KeyMaterialHasBeenCompromisedKeyRevocations OpenpgpMessage_RevocationCodes = 2
	OpenpgpMessage_RevocationCodes__KeyIsRetiredAndNoLongerUsedKeyRevocations OpenpgpMessage_RevocationCodes = 3
	OpenpgpMessage_RevocationCodes__UserIdInformationIsNoLongerValidCertRevocations OpenpgpMessage_RevocationCodes = 32
	OpenpgpMessage_RevocationCodes__PrivateUse1 OpenpgpMessage_RevocationCodes = 100
	OpenpgpMessage_RevocationCodes__PrivateUse2 OpenpgpMessage_RevocationCodes = 101
	OpenpgpMessage_RevocationCodes__PrivateUse3 OpenpgpMessage_RevocationCodes = 102
	OpenpgpMessage_RevocationCodes__PrivateUse4 OpenpgpMessage_RevocationCodes = 103
	OpenpgpMessage_RevocationCodes__PrivateUse11 OpenpgpMessage_RevocationCodes = 110
)

type OpenpgpMessage_HashAlgorithms int
const (
	OpenpgpMessage_HashAlgorithms__Md5 OpenpgpMessage_HashAlgorithms = 1
	OpenpgpMessage_HashAlgorithms__Sha1 OpenpgpMessage_HashAlgorithms = 2
	OpenpgpMessage_HashAlgorithms__Ripemd160 OpenpgpMessage_HashAlgorithms = 3
	OpenpgpMessage_HashAlgorithms__Reserved4 OpenpgpMessage_HashAlgorithms = 4
	OpenpgpMessage_HashAlgorithms__Reserved5 OpenpgpMessage_HashAlgorithms = 5
	OpenpgpMessage_HashAlgorithms__Reserved6 OpenpgpMessage_HashAlgorithms = 6
	OpenpgpMessage_HashAlgorithms__Reserved7 OpenpgpMessage_HashAlgorithms = 7
	OpenpgpMessage_HashAlgorithms__Sha256 OpenpgpMessage_HashAlgorithms = 8
	OpenpgpMessage_HashAlgorithms__Sha384 OpenpgpMessage_HashAlgorithms = 9
	OpenpgpMessage_HashAlgorithms__Sha512 OpenpgpMessage_HashAlgorithms = 10
	OpenpgpMessage_HashAlgorithms__Sha224 OpenpgpMessage_HashAlgorithms = 11
	OpenpgpMessage_HashAlgorithms__PrivateExperimentalAlgorithm00 OpenpgpMessage_HashAlgorithms = 100
	OpenpgpMessage_HashAlgorithms__PrivateExperimentalAlgorithm01 OpenpgpMessage_HashAlgorithms = 101
	OpenpgpMessage_HashAlgorithms__PrivateExperimentalAlgorithm02 OpenpgpMessage_HashAlgorithms = 102
	OpenpgpMessage_HashAlgorithms__PrivateExperimentalAlgorithm03 OpenpgpMessage_HashAlgorithms = 103
	OpenpgpMessage_HashAlgorithms__PrivateExperimentalAlgorithm04 OpenpgpMessage_HashAlgorithms = 104
	OpenpgpMessage_HashAlgorithms__PrivateExperimentalAlgorithm05 OpenpgpMessage_HashAlgorithms = 105
	OpenpgpMessage_HashAlgorithms__PrivateExperimentalAlgorithm06 OpenpgpMessage_HashAlgorithms = 106
	OpenpgpMessage_HashAlgorithms__PrivateExperimentalAlgorithm07 OpenpgpMessage_HashAlgorithms = 107
	OpenpgpMessage_HashAlgorithms__PrivateExperimentalAlgorithm08 OpenpgpMessage_HashAlgorithms = 108
	OpenpgpMessage_HashAlgorithms__PrivateExperimentalAlgorithm09 OpenpgpMessage_HashAlgorithms = 109
	OpenpgpMessage_HashAlgorithms__PrivateExperimentalAlgorithm10 OpenpgpMessage_HashAlgorithms = 110
)

type OpenpgpMessage_SymmetricKeyAlgorithm int
const (
	OpenpgpMessage_SymmetricKeyAlgorithm__Plain OpenpgpMessage_SymmetricKeyAlgorithm = 0
	OpenpgpMessage_SymmetricKeyAlgorithm__Idea OpenpgpMessage_SymmetricKeyAlgorithm = 1
	OpenpgpMessage_SymmetricKeyAlgorithm__TripleDes OpenpgpMessage_SymmetricKeyAlgorithm = 2
	OpenpgpMessage_SymmetricKeyAlgorithm__Cast5 OpenpgpMessage_SymmetricKeyAlgorithm = 3
	OpenpgpMessage_SymmetricKeyAlgorithm__Blowfisch OpenpgpMessage_SymmetricKeyAlgorithm = 4
	OpenpgpMessage_SymmetricKeyAlgorithm__Reserved5 OpenpgpMessage_SymmetricKeyAlgorithm = 5
	OpenpgpMessage_SymmetricKeyAlgorithm__Reserved6 OpenpgpMessage_SymmetricKeyAlgorithm = 6
	OpenpgpMessage_SymmetricKeyAlgorithm__Aes128 OpenpgpMessage_SymmetricKeyAlgorithm = 7
	OpenpgpMessage_SymmetricKeyAlgorithm__Aes192 OpenpgpMessage_SymmetricKeyAlgorithm = 8
	OpenpgpMessage_SymmetricKeyAlgorithm__Aes256 OpenpgpMessage_SymmetricKeyAlgorithm = 9
	OpenpgpMessage_SymmetricKeyAlgorithm__Twofish256 OpenpgpMessage_SymmetricKeyAlgorithm = 10
	OpenpgpMessage_SymmetricKeyAlgorithm__PrivateExperimentalAlgorithm00 OpenpgpMessage_SymmetricKeyAlgorithm = 100
	OpenpgpMessage_SymmetricKeyAlgorithm__PrivateExperimentalAlgorithm01 OpenpgpMessage_SymmetricKeyAlgorithm = 101
	OpenpgpMessage_SymmetricKeyAlgorithm__PrivateExperimentalAlgorithm02 OpenpgpMessage_SymmetricKeyAlgorithm = 102
	OpenpgpMessage_SymmetricKeyAlgorithm__PrivateExperimentalAlgorithm03 OpenpgpMessage_SymmetricKeyAlgorithm = 103
	OpenpgpMessage_SymmetricKeyAlgorithm__PrivateExperimentalAlgorithm04 OpenpgpMessage_SymmetricKeyAlgorithm = 104
	OpenpgpMessage_SymmetricKeyAlgorithm__PrivateExperimentalAlgorithm05 OpenpgpMessage_SymmetricKeyAlgorithm = 105
	OpenpgpMessage_SymmetricKeyAlgorithm__PrivateExperimentalAlgorithm06 OpenpgpMessage_SymmetricKeyAlgorithm = 106
	OpenpgpMessage_SymmetricKeyAlgorithm__PrivateExperimentalAlgorithm07 OpenpgpMessage_SymmetricKeyAlgorithm = 107
	OpenpgpMessage_SymmetricKeyAlgorithm__PrivateExperimentalAlgorithm08 OpenpgpMessage_SymmetricKeyAlgorithm = 108
	OpenpgpMessage_SymmetricKeyAlgorithm__PrivateExperimentalAlgorithm09 OpenpgpMessage_SymmetricKeyAlgorithm = 109
	OpenpgpMessage_SymmetricKeyAlgorithm__PrivateExperimentalAlgorithm10 OpenpgpMessage_SymmetricKeyAlgorithm = 110
)

type OpenpgpMessage_SubpacketTypes int
const (
	OpenpgpMessage_SubpacketTypes__Reserved OpenpgpMessage_SubpacketTypes = 0
	OpenpgpMessage_SubpacketTypes__Reserved OpenpgpMessage_SubpacketTypes = 1
	OpenpgpMessage_SubpacketTypes__SignatureCreationTime OpenpgpMessage_SubpacketTypes = 2
	OpenpgpMessage_SubpacketTypes__SignatureExpirationTime OpenpgpMessage_SubpacketTypes = 3
	OpenpgpMessage_SubpacketTypes__ExportableCertification OpenpgpMessage_SubpacketTypes = 4
	OpenpgpMessage_SubpacketTypes__TrustSignature OpenpgpMessage_SubpacketTypes = 5
	OpenpgpMessage_SubpacketTypes__RegularExpression OpenpgpMessage_SubpacketTypes = 6
	OpenpgpMessage_SubpacketTypes__Revocable OpenpgpMessage_SubpacketTypes = 7
	OpenpgpMessage_SubpacketTypes__Reserved OpenpgpMessage_SubpacketTypes = 8
	OpenpgpMessage_SubpacketTypes__KeyExpirationTime OpenpgpMessage_SubpacketTypes = 9
	OpenpgpMessage_SubpacketTypes__PlaceholderForBackwardCompatibility OpenpgpMessage_SubpacketTypes = 10
	OpenpgpMessage_SubpacketTypes__PreferredSymmetricAlgorithms OpenpgpMessage_SubpacketTypes = 11
	OpenpgpMessage_SubpacketTypes__RevocationKey OpenpgpMessage_SubpacketTypes = 12
	OpenpgpMessage_SubpacketTypes__Reserved OpenpgpMessage_SubpacketTypes = 13
	OpenpgpMessage_SubpacketTypes__Reserved OpenpgpMessage_SubpacketTypes = 14
	OpenpgpMessage_SubpacketTypes__Reserved OpenpgpMessage_SubpacketTypes = 15
	OpenpgpMessage_SubpacketTypes__Issuer OpenpgpMessage_SubpacketTypes = 16
	OpenpgpMessage_SubpacketTypes__Reserved OpenpgpMessage_SubpacketTypes = 17
	OpenpgpMessage_SubpacketTypes__Reserved OpenpgpMessage_SubpacketTypes = 18
	OpenpgpMessage_SubpacketTypes__Reserved OpenpgpMessage_SubpacketTypes = 19
	OpenpgpMessage_SubpacketTypes__NotationData OpenpgpMessage_SubpacketTypes = 20
	OpenpgpMessage_SubpacketTypes__PreferredHashAlgorithms OpenpgpMessage_SubpacketTypes = 21
	OpenpgpMessage_SubpacketTypes__PreferredCompressionAlgorithms OpenpgpMessage_SubpacketTypes = 22
	OpenpgpMessage_SubpacketTypes__KeyServerPreferences OpenpgpMessage_SubpacketTypes = 23
	OpenpgpMessage_SubpacketTypes__PreferredKeyServer OpenpgpMessage_SubpacketTypes = 24
	OpenpgpMessage_SubpacketTypes__PrimaryUserId OpenpgpMessage_SubpacketTypes = 25
	OpenpgpMessage_SubpacketTypes__PolicyUri OpenpgpMessage_SubpacketTypes = 26
	OpenpgpMessage_SubpacketTypes__KeyFlags OpenpgpMessage_SubpacketTypes = 27
	OpenpgpMessage_SubpacketTypes__SignersUserId OpenpgpMessage_SubpacketTypes = 28
	OpenpgpMessage_SubpacketTypes__ReasonForRevocation OpenpgpMessage_SubpacketTypes = 29
	OpenpgpMessage_SubpacketTypes__Features OpenpgpMessage_SubpacketTypes = 30
	OpenpgpMessage_SubpacketTypes__SignatureTarget OpenpgpMessage_SubpacketTypes = 31
	OpenpgpMessage_SubpacketTypes__EmbeddedSignature OpenpgpMessage_SubpacketTypes = 32
)
type OpenpgpMessage struct {
	Packets []*OpenpgpMessage_Packet
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent interface{}
}
func NewOpenpgpMessage() *OpenpgpMessage {
	return &OpenpgpMessage{
	}
}

func (this *OpenpgpMessage) Read(io *kaitai.Stream, parent interface{}, root *OpenpgpMessage) (err error) {
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
		tmp2 := NewOpenpgpMessage_Packet()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Packets = append(this.Packets, tmp2)
	}
	return err
}
type OpenpgpMessage_PreferredHashAlgorithms struct {
	Algorithm []OpenpgpMessage_HashAlgorithms
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_PreferredHashAlgorithms() *OpenpgpMessage_PreferredHashAlgorithms {
	return &OpenpgpMessage_PreferredHashAlgorithms{
	}
}

func (this *OpenpgpMessage_PreferredHashAlgorithms) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp3, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp3 {
			break
		}
		tmp4, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Algorithm = append(this.Algorithm, OpenpgpMessage_HashAlgorithms(tmp4))
	}
	return err
}
type OpenpgpMessage_PreferredCompressionAlgorithms struct {
	Algorithm []OpenpgpMessage_CompressionAlgorithms
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_PreferredCompressionAlgorithms() *OpenpgpMessage_PreferredCompressionAlgorithms {
	return &OpenpgpMessage_PreferredCompressionAlgorithms{
	}
}

func (this *OpenpgpMessage_PreferredCompressionAlgorithms) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp5, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp5 {
			break
		}
		tmp6, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Algorithm = append(this.Algorithm, OpenpgpMessage_CompressionAlgorithms(tmp6))
	}
	return err
}
type OpenpgpMessage_SignersUserId struct {
	UserId string
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_SignersUserId() *OpenpgpMessage_SignersUserId {
	return &OpenpgpMessage_SignersUserId{
	}
}

func (this *OpenpgpMessage_SignersUserId) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.UserId = string(tmp7)
	return err
}
type OpenpgpMessage_SecretKeyPacket struct {
	PublicKey *OpenpgpMessage_PublicKeyPacket
	StringToKey uint8
	SymmetricEncryptionAlgorithm OpenpgpMessage_SymmetricKeyAlgorithm
	SecretKey []byte
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_OldPacket
}
func NewOpenpgpMessage_SecretKeyPacket() *OpenpgpMessage_SecretKeyPacket {
	return &OpenpgpMessage_SecretKeyPacket{
	}
}

func (this *OpenpgpMessage_SecretKeyPacket) Read(io *kaitai.Stream, parent *OpenpgpMessage_OldPacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8 := NewOpenpgpMessage_PublicKeyPacket()
	err = tmp8.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.PublicKey = tmp8
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.StringToKey = tmp9
	if (this.StringToKey >= 254) {
		tmp10, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.SymmetricEncryptionAlgorithm = OpenpgpMessage_SymmetricKeyAlgorithm(tmp10)
	}
	tmp11, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.SecretKey = tmp11
	return err
}
type OpenpgpMessage_KeyServerPreferences struct {
	Flag []OpenpgpMessage_ServerFlags
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_KeyServerPreferences() *OpenpgpMessage_KeyServerPreferences {
	return &OpenpgpMessage_KeyServerPreferences{
	}
}

func (this *OpenpgpMessage_KeyServerPreferences) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp12, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp12 {
			break
		}
		tmp13, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Flag = append(this.Flag, OpenpgpMessage_ServerFlags(tmp13))
	}
	return err
}
type OpenpgpMessage_RegularExpression struct {
	Regex string
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_RegularExpression() *OpenpgpMessage_RegularExpression {
	return &OpenpgpMessage_RegularExpression{
	}
}

func (this *OpenpgpMessage_RegularExpression) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Regex = string(tmp14)
	return err
}
type OpenpgpMessage_Subpackets struct {
	Subpacketss []*OpenpgpMessage_Subpacket
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_SignaturePacket
}
func NewOpenpgpMessage_Subpackets() *OpenpgpMessage_Subpackets {
	return &OpenpgpMessage_Subpackets{
	}
}

func (this *OpenpgpMessage_Subpackets) Read(io *kaitai.Stream, parent *OpenpgpMessage_SignaturePacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp15, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp15 {
			break
		}
		tmp16 := NewOpenpgpMessage_Subpacket()
		err = tmp16.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Subpacketss = append(this.Subpacketss, tmp16)
	}
	return err
}
type OpenpgpMessage_RevocationKey struct {
	Class uint8
	PublicKeyAlgorithm OpenpgpMessage_PublicKeyAlgorithms
	Fingerprint []byte
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_RevocationKey() *OpenpgpMessage_RevocationKey {
	return &OpenpgpMessage_RevocationKey{
	}
}

func (this *OpenpgpMessage_RevocationKey) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Class = tmp17
	tmp18, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PublicKeyAlgorithm = OpenpgpMessage_PublicKeyAlgorithms(tmp18)
	tmp19, err := this._io.ReadBytes(int(20))
	if err != nil {
		return err
	}
	tmp19 = tmp19
	this.Fingerprint = tmp19
	return err
}
type OpenpgpMessage_UserIdPacket struct {
	UserId string
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_OldPacket
}
func NewOpenpgpMessage_UserIdPacket() *OpenpgpMessage_UserIdPacket {
	return &OpenpgpMessage_UserIdPacket{
	}
}

func (this *OpenpgpMessage_UserIdPacket) Read(io *kaitai.Stream, parent *OpenpgpMessage_OldPacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.UserId = string(tmp20)
	return err
}
type OpenpgpMessage_PolicyUri struct {
	Uri string
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_PolicyUri() *OpenpgpMessage_PolicyUri {
	return &OpenpgpMessage_PolicyUri{
	}
}

func (this *OpenpgpMessage_PolicyUri) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp21, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp21 = tmp21
	this.Uri = string(tmp21)
	return err
}
type OpenpgpMessage_SignatureTarget struct {
	PublicKeyAlgorithm OpenpgpMessage_PublicKeyAlgorithms
	HashAlgorithm OpenpgpMessage_HashAlgorithms
	Hash []byte
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_SignatureTarget() *OpenpgpMessage_SignatureTarget {
	return &OpenpgpMessage_SignatureTarget{
	}
}

func (this *OpenpgpMessage_SignatureTarget) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PublicKeyAlgorithm = OpenpgpMessage_PublicKeyAlgorithms(tmp22)
	tmp23, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HashAlgorithm = OpenpgpMessage_HashAlgorithms(tmp23)
	tmp24, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp24 = tmp24
	this.Hash = tmp24
	return err
}
type OpenpgpMessage_KeyFlags struct {
	Flag []OpenpgpMessage_KeyFlags
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_KeyFlags() *OpenpgpMessage_KeyFlags {
	return &OpenpgpMessage_KeyFlags{
	}
}

func (this *OpenpgpMessage_KeyFlags) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp25, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp25 {
			break
		}
		tmp26, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Flag = append(this.Flag, OpenpgpMessage_KeyFlags(tmp26))
	}
	return err
}
type OpenpgpMessage_Features struct {
	Flags []byte
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_Features() *OpenpgpMessage_Features {
	return &OpenpgpMessage_Features{
	}
}

func (this *OpenpgpMessage_Features) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp27 = tmp27
	this.Flags = tmp27
	return err
}
type OpenpgpMessage_PrimaryUserId struct {
	UserId uint8
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_PrimaryUserId() *OpenpgpMessage_PrimaryUserId {
	return &OpenpgpMessage_PrimaryUserId{
	}
}

func (this *OpenpgpMessage_PrimaryUserId) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.UserId = tmp28
	return err
}
type OpenpgpMessage_Subpacket struct {
	Len *OpenpgpMessage_LenSubpacket
	SubpacketType OpenpgpMessage_SubpacketTypes
	Content interface{}
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpackets
	_raw_Content []byte
}
func NewOpenpgpMessage_Subpacket() *OpenpgpMessage_Subpacket {
	return &OpenpgpMessage_Subpacket{
	}
}

func (this *OpenpgpMessage_Subpacket) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpackets, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29 := NewOpenpgpMessage_LenSubpacket()
	err = tmp29.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Len = tmp29
	tmp30, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.SubpacketType = OpenpgpMessage_SubpacketTypes(tmp30)
	switch (this.SubpacketType) {
	case OpenpgpMessage_SubpacketTypes__PreferredKeyServer:
		tmp31, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp32, err := this._io.ReadBytes(int((tmp31 - 1)))
		if err != nil {
			return err
		}
		tmp32 = tmp32
		this._raw_Content = tmp32
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp33 := NewOpenpgpMessage_PreferredKeyServer()
		err = tmp33.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp33
	case OpenpgpMessage_SubpacketTypes__Issuer:
		tmp34, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp35, err := this._io.ReadBytes(int((tmp34 - 1)))
		if err != nil {
			return err
		}
		tmp35 = tmp35
		this._raw_Content = tmp35
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp36 := NewOpenpgpMessage_Issuer()
		err = tmp36.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp36
	case OpenpgpMessage_SubpacketTypes__Revocable:
		tmp37, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp38, err := this._io.ReadBytes(int((tmp37 - 1)))
		if err != nil {
			return err
		}
		tmp38 = tmp38
		this._raw_Content = tmp38
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp39 := NewOpenpgpMessage_Revocable()
		err = tmp39.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp39
	case OpenpgpMessage_SubpacketTypes__SignatureTarget:
		tmp40, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp41, err := this._io.ReadBytes(int((tmp40 - 1)))
		if err != nil {
			return err
		}
		tmp41 = tmp41
		this._raw_Content = tmp41
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp42 := NewOpenpgpMessage_SignatureTarget()
		err = tmp42.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp42
	case OpenpgpMessage_SubpacketTypes__RegularExpression:
		tmp43, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp44, err := this._io.ReadBytes(int((tmp43 - 1)))
		if err != nil {
			return err
		}
		tmp44 = tmp44
		this._raw_Content = tmp44
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp45 := NewOpenpgpMessage_RegularExpression()
		err = tmp45.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp45
	case OpenpgpMessage_SubpacketTypes__ExportableCertification:
		tmp46, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp47, err := this._io.ReadBytes(int((tmp46 - 1)))
		if err != nil {
			return err
		}
		tmp47 = tmp47
		this._raw_Content = tmp47
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp48 := NewOpenpgpMessage_ExportableCertification()
		err = tmp48.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp48
	case OpenpgpMessage_SubpacketTypes__ReasonForRevocation:
		tmp49, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp50, err := this._io.ReadBytes(int((tmp49 - 1)))
		if err != nil {
			return err
		}
		tmp50 = tmp50
		this._raw_Content = tmp50
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp51 := NewOpenpgpMessage_ReasonForRevocation()
		err = tmp51.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp51
	case OpenpgpMessage_SubpacketTypes__KeyServerPreferences:
		tmp52, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp53, err := this._io.ReadBytes(int((tmp52 - 1)))
		if err != nil {
			return err
		}
		tmp53 = tmp53
		this._raw_Content = tmp53
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp54 := NewOpenpgpMessage_KeyServerPreferences()
		err = tmp54.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp54
	case OpenpgpMessage_SubpacketTypes__SignatureCreationTime:
		tmp55, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp56, err := this._io.ReadBytes(int((tmp55 - 1)))
		if err != nil {
			return err
		}
		tmp56 = tmp56
		this._raw_Content = tmp56
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp57 := NewOpenpgpMessage_SignatureCreationTime()
		err = tmp57.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp57
	case OpenpgpMessage_SubpacketTypes__PreferredHashAlgorithms:
		tmp58, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp59, err := this._io.ReadBytes(int((tmp58 - 1)))
		if err != nil {
			return err
		}
		tmp59 = tmp59
		this._raw_Content = tmp59
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp60 := NewOpenpgpMessage_PreferredHashAlgorithms()
		err = tmp60.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp60
	case OpenpgpMessage_SubpacketTypes__TrustSignature:
		tmp61, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp62, err := this._io.ReadBytes(int((tmp61 - 1)))
		if err != nil {
			return err
		}
		tmp62 = tmp62
		this._raw_Content = tmp62
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp63 := NewOpenpgpMessage_TrustSignature()
		err = tmp63.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp63
	case OpenpgpMessage_SubpacketTypes__KeyExpirationTime:
		tmp64, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp65, err := this._io.ReadBytes(int((tmp64 - 1)))
		if err != nil {
			return err
		}
		tmp65 = tmp65
		this._raw_Content = tmp65
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp66 := NewOpenpgpMessage_KeyExpirationTime()
		err = tmp66.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp66
	case OpenpgpMessage_SubpacketTypes__KeyFlags:
		tmp67, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp68, err := this._io.ReadBytes(int((tmp67 - 1)))
		if err != nil {
			return err
		}
		tmp68 = tmp68
		this._raw_Content = tmp68
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp69 := NewOpenpgpMessage_KeyFlags()
		err = tmp69.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp69
	case OpenpgpMessage_SubpacketTypes__SignatureExpirationTime:
		tmp70, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp71, err := this._io.ReadBytes(int((tmp70 - 1)))
		if err != nil {
			return err
		}
		tmp71 = tmp71
		this._raw_Content = tmp71
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp72 := NewOpenpgpMessage_SignatureExpirationTime()
		err = tmp72.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp72
	case OpenpgpMessage_SubpacketTypes__Features:
		tmp73, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp74, err := this._io.ReadBytes(int((tmp73 - 1)))
		if err != nil {
			return err
		}
		tmp74 = tmp74
		this._raw_Content = tmp74
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp75 := NewOpenpgpMessage_Features()
		err = tmp75.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp75
	case OpenpgpMessage_SubpacketTypes__SignersUserId:
		tmp76, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp77, err := this._io.ReadBytes(int((tmp76 - 1)))
		if err != nil {
			return err
		}
		tmp77 = tmp77
		this._raw_Content = tmp77
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp78 := NewOpenpgpMessage_SignersUserId()
		err = tmp78.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp78
	case OpenpgpMessage_SubpacketTypes__NotationData:
		tmp79, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp80, err := this._io.ReadBytes(int((tmp79 - 1)))
		if err != nil {
			return err
		}
		tmp80 = tmp80
		this._raw_Content = tmp80
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp81 := NewOpenpgpMessage_NotationData()
		err = tmp81.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp81
	case OpenpgpMessage_SubpacketTypes__RevocationKey:
		tmp82, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp83, err := this._io.ReadBytes(int((tmp82 - 1)))
		if err != nil {
			return err
		}
		tmp83 = tmp83
		this._raw_Content = tmp83
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp84 := NewOpenpgpMessage_RevocationKey()
		err = tmp84.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp84
	case OpenpgpMessage_SubpacketTypes__PreferredCompressionAlgorithms:
		tmp85, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp86, err := this._io.ReadBytes(int((tmp85 - 1)))
		if err != nil {
			return err
		}
		tmp86 = tmp86
		this._raw_Content = tmp86
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp87 := NewOpenpgpMessage_PreferredCompressionAlgorithms()
		err = tmp87.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp87
	case OpenpgpMessage_SubpacketTypes__PolicyUri:
		tmp88, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp89, err := this._io.ReadBytes(int((tmp88 - 1)))
		if err != nil {
			return err
		}
		tmp89 = tmp89
		this._raw_Content = tmp89
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp90 := NewOpenpgpMessage_PolicyUri()
		err = tmp90.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp90
	case OpenpgpMessage_SubpacketTypes__PrimaryUserId:
		tmp91, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp92, err := this._io.ReadBytes(int((tmp91 - 1)))
		if err != nil {
			return err
		}
		tmp92 = tmp92
		this._raw_Content = tmp92
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp93 := NewOpenpgpMessage_PrimaryUserId()
		err = tmp93.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp93
	case OpenpgpMessage_SubpacketTypes__EmbeddedSignature:
		tmp94, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp95, err := this._io.ReadBytes(int((tmp94 - 1)))
		if err != nil {
			return err
		}
		tmp95 = tmp95
		this._raw_Content = tmp95
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp96 := NewOpenpgpMessage_EmbeddedSignature()
		err = tmp96.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp96
	default:
		tmp97, err := this.Len.Len()
		if err != nil {
			return err
		}
		tmp98, err := this._io.ReadBytes(int((tmp97 - 1)))
		if err != nil {
			return err
		}
		tmp98 = tmp98
		this._raw_Content = tmp98
	}
	return err
}
type OpenpgpMessage_OldPacket struct {
	Len uint32
	Body interface{}
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Packet
	_raw_Body []byte
}
func NewOpenpgpMessage_OldPacket() *OpenpgpMessage_OldPacket {
	return &OpenpgpMessage_OldPacket{
	}
}

func (this *OpenpgpMessage_OldPacket) Read(io *kaitai.Stream, parent *OpenpgpMessage_Packet, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	switch (this._parent.LenType) {
	case 0:
		tmp99, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Len = uint32(tmp99)
	case 1:
		tmp100, err := this._io.ReadU2be()
		if err != nil {
			return err
		}
		this.Len = uint32(tmp100)
	case 2:
		tmp101, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Len = uint32(tmp101)
	}
	switch (this._parent.PacketTypeOld) {
	case OpenpgpMessage_PacketTags__PublicKeyPacket:
		tmp102, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp102 = tmp102
		this._raw_Body = tmp102
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp103 := NewOpenpgpMessage_PublicKeyPacket()
		err = tmp103.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp103
	case OpenpgpMessage_PacketTags__PublicSubkeyPacket:
		tmp104, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp104 = tmp104
		this._raw_Body = tmp104
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp105 := NewOpenpgpMessage_PublicKeyPacket()
		err = tmp105.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp105
	case OpenpgpMessage_PacketTags__UserIdPacket:
		tmp106, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp106 = tmp106
		this._raw_Body = tmp106
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp107 := NewOpenpgpMessage_UserIdPacket()
		err = tmp107.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp107
	case OpenpgpMessage_PacketTags__SignaturePacket:
		tmp108, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp108 = tmp108
		this._raw_Body = tmp108
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp109 := NewOpenpgpMessage_SignaturePacket()
		err = tmp109.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp109
	case OpenpgpMessage_PacketTags__SecretSubkeyPacket:
		tmp110, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp110 = tmp110
		this._raw_Body = tmp110
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp111 := NewOpenpgpMessage_PublicKeyPacket()
		err = tmp111.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp111
	case OpenpgpMessage_PacketTags__SecretKeyPacket:
		tmp112, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp112 = tmp112
		this._raw_Body = tmp112
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp113 := NewOpenpgpMessage_SecretKeyPacket()
		err = tmp113.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp113
	default:
		tmp114, err := this._io.ReadBytes(int(this.Len))
		if err != nil {
			return err
		}
		tmp114 = tmp114
		this._raw_Body = tmp114
	}
	return err
}
type OpenpgpMessage_Issuer struct {
	Keyid uint64
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_Issuer() *OpenpgpMessage_Issuer {
	return &OpenpgpMessage_Issuer{
	}
}

func (this *OpenpgpMessage_Issuer) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp115, err := this._io.ReadU8be()
	if err != nil {
		return err
	}
	this.Keyid = uint64(tmp115)
	return err
}
type OpenpgpMessage_ExportableCertification struct {
	Exportable uint8
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_ExportableCertification() *OpenpgpMessage_ExportableCertification {
	return &OpenpgpMessage_ExportableCertification{
	}
}

func (this *OpenpgpMessage_ExportableCertification) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp116, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Exportable = tmp116
	return err
}
type OpenpgpMessage_SignatureExpirationTime struct {
	Time uint32
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_SignatureExpirationTime() *OpenpgpMessage_SignatureExpirationTime {
	return &OpenpgpMessage_SignatureExpirationTime{
	}
}

func (this *OpenpgpMessage_SignatureExpirationTime) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp117, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Time = uint32(tmp117)
	return err
}
type OpenpgpMessage_SignatureCreationTime struct {
	Time uint32
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_SignatureCreationTime() *OpenpgpMessage_SignatureCreationTime {
	return &OpenpgpMessage_SignatureCreationTime{
	}
}

func (this *OpenpgpMessage_SignatureCreationTime) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp118, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Time = uint32(tmp118)
	return err
}
type OpenpgpMessage_SignaturePacket struct {
	Version uint8
	SignatureType uint8
	PublicKeyAlgorithm OpenpgpMessage_PublicKeyAlgorithms
	HashAlgorithm OpenpgpMessage_HashAlgorithms
	LenHashedSubpacket uint16
	HashedSubpackets *OpenpgpMessage_Subpackets
	LenUnhashedSubpacket uint16
	UnhashedSubpackets *OpenpgpMessage_Subpackets
	LeftSignedHash uint16
	RsaN uint16
	Signature []byte
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent interface{}
	_raw_HashedSubpackets []byte
	_raw_UnhashedSubpackets []byte
}
func NewOpenpgpMessage_SignaturePacket() *OpenpgpMessage_SignaturePacket {
	return &OpenpgpMessage_SignaturePacket{
	}
}

func (this *OpenpgpMessage_SignaturePacket) Read(io *kaitai.Stream, parent interface{}, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp119, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp119
	tmp120, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.SignatureType = tmp120
	tmp121, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PublicKeyAlgorithm = OpenpgpMessage_PublicKeyAlgorithms(tmp121)
	tmp122, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HashAlgorithm = OpenpgpMessage_HashAlgorithms(tmp122)
	tmp123, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenHashedSubpacket = uint16(tmp123)
	tmp124, err := this._io.ReadBytes(int(this.LenHashedSubpacket))
	if err != nil {
		return err
	}
	tmp124 = tmp124
	this._raw_HashedSubpackets = tmp124
	_io__raw_HashedSubpackets := kaitai.NewStream(bytes.NewReader(this._raw_HashedSubpackets))
	tmp125 := NewOpenpgpMessage_Subpackets()
	err = tmp125.Read(_io__raw_HashedSubpackets, this, this._root)
	if err != nil {
		return err
	}
	this.HashedSubpackets = tmp125
	tmp126, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenUnhashedSubpacket = uint16(tmp126)
	tmp127, err := this._io.ReadBytes(int(this.LenUnhashedSubpacket))
	if err != nil {
		return err
	}
	tmp127 = tmp127
	this._raw_UnhashedSubpackets = tmp127
	_io__raw_UnhashedSubpackets := kaitai.NewStream(bytes.NewReader(this._raw_UnhashedSubpackets))
	tmp128 := NewOpenpgpMessage_Subpackets()
	err = tmp128.Read(_io__raw_UnhashedSubpackets, this, this._root)
	if err != nil {
		return err
	}
	this.UnhashedSubpackets = tmp128
	tmp129, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LeftSignedHash = uint16(tmp129)
	tmp130, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.RsaN = uint16(tmp130)
	tmp131, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp131 = tmp131
	this.Signature = tmp131
	return err
}
type OpenpgpMessage_Revocable struct {
	Revocable uint8
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_Revocable() *OpenpgpMessage_Revocable {
	return &OpenpgpMessage_Revocable{
	}
}

func (this *OpenpgpMessage_Revocable) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp132, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Revocable = tmp132
	return err
}
type OpenpgpMessage_EmbeddedSignature struct {
	SignaturePacket *OpenpgpMessage_SignaturePacket
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_EmbeddedSignature() *OpenpgpMessage_EmbeddedSignature {
	return &OpenpgpMessage_EmbeddedSignature{
	}
}

func (this *OpenpgpMessage_EmbeddedSignature) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp133 := NewOpenpgpMessage_SignaturePacket()
	err = tmp133.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.SignaturePacket = tmp133
	return err
}
type OpenpgpMessage_PreferredKeyServer struct {
	Uri string
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_PreferredKeyServer() *OpenpgpMessage_PreferredKeyServer {
	return &OpenpgpMessage_PreferredKeyServer{
	}
}

func (this *OpenpgpMessage_PreferredKeyServer) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp134, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp134 = tmp134
	this.Uri = string(tmp134)
	return err
}
type OpenpgpMessage_ReasonForRevocation struct {
	RevocationCode OpenpgpMessage_RevocationCodes
	Reason string
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_ReasonForRevocation() *OpenpgpMessage_ReasonForRevocation {
	return &OpenpgpMessage_ReasonForRevocation{
	}
}

func (this *OpenpgpMessage_ReasonForRevocation) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp135, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.RevocationCode = OpenpgpMessage_RevocationCodes(tmp135)
	tmp136, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp136 = tmp136
	this.Reason = string(tmp136)
	return err
}
type OpenpgpMessage_LenSubpacket struct {
	FirstOctet uint8
	SecondOctet uint8
	Scalar uint32
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
	_f_len bool
	len int
}
func NewOpenpgpMessage_LenSubpacket() *OpenpgpMessage_LenSubpacket {
	return &OpenpgpMessage_LenSubpacket{
	}
}

func (this *OpenpgpMessage_LenSubpacket) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp137, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FirstOctet = tmp137
	if ( ((this.FirstOctet >= 192) && (this.FirstOctet < 255)) ) {
		tmp138, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.SecondOctet = tmp138
	}
	if (this.FirstOctet == 255) {
		tmp139, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Scalar = uint32(tmp139)
	}
	return err
}
func (this *OpenpgpMessage_LenSubpacket) Len() (v int, err error) {
	if (this._f_len) {
		return this.len, nil
	}
	var tmp140 uint8;
	if (this.FirstOctet < 192) {
		tmp140 = this.FirstOctet
	} else {
		var tmp141 int;
		if ( ((this.FirstOctet >= 192) && (this.FirstOctet < 255)) ) {
			tmp141 = ((((this.FirstOctet - 192) << 8) + this.SecondOctet) + 192)
		} else {
			tmp141 = this.Scalar
		}
		tmp140 = tmp141
	}
	this.len = int(tmp140)
	this._f_len = true
	return this.len, nil
}
type OpenpgpMessage_NotationData struct {
	Flags []byte
	LenName uint16
	LenValue uint16
	Name []byte
	Value []byte
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_NotationData() *OpenpgpMessage_NotationData {
	return &OpenpgpMessage_NotationData{
	}
}

func (this *OpenpgpMessage_NotationData) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp142, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp142 = tmp142
	this.Flags = tmp142
	tmp143, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenName = uint16(tmp143)
	tmp144, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenValue = uint16(tmp144)
	tmp145, err := this._io.ReadBytes(int(this.LenName))
	if err != nil {
		return err
	}
	tmp145 = tmp145
	this.Name = tmp145
	tmp146, err := this._io.ReadBytes(int(this.LenValue))
	if err != nil {
		return err
	}
	tmp146 = tmp146
	this.Value = tmp146
	return err
}
type OpenpgpMessage_PublicKeyPacket struct {
	Version uint8
	Timestamp uint32
	PublicKeyAlgorithm OpenpgpMessage_PublicKeyAlgorithms
	LenAlg uint16
	RsaN []byte
	Padding uint16
	RsaE []byte
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent interface{}
}
func NewOpenpgpMessage_PublicKeyPacket() *OpenpgpMessage_PublicKeyPacket {
	return &OpenpgpMessage_PublicKeyPacket{
	}
}

func (this *OpenpgpMessage_PublicKeyPacket) Read(io *kaitai.Stream, parent interface{}, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp147, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp147
	tmp148, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Timestamp = uint32(tmp148)
	tmp149, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PublicKeyAlgorithm = OpenpgpMessage_PublicKeyAlgorithms(tmp149)
	tmp150, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenAlg = uint16(tmp150)
	tmp151, err := this._io.ReadBytes(int((this.LenAlg / 8)))
	if err != nil {
		return err
	}
	tmp151 = tmp151
	this.RsaN = tmp151
	tmp152, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Padding = uint16(tmp152)
	tmp153, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp153 = tmp153
	this.RsaE = tmp153
	return err
}
type OpenpgpMessage_KeyExpirationTime struct {
	Time uint32
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_KeyExpirationTime() *OpenpgpMessage_KeyExpirationTime {
	return &OpenpgpMessage_KeyExpirationTime{
	}
}

func (this *OpenpgpMessage_KeyExpirationTime) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp154, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Time = uint32(tmp154)
	return err
}
type OpenpgpMessage_Packet struct {
	One bool
	NewPacketFormat bool
	PacketTypeNew OpenpgpMessage_PacketTags
	PacketTypeOld OpenpgpMessage_PacketTags
	LenType uint64
	Body *OpenpgpMessage_OldPacket
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage
}
func NewOpenpgpMessage_Packet() *OpenpgpMessage_Packet {
	return &OpenpgpMessage_Packet{
	}
}

func (this *OpenpgpMessage_Packet) Read(io *kaitai.Stream, parent *OpenpgpMessage, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp155, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.One = tmp155 != 0
	tmp156, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.NewPacketFormat = tmp156 != 0
	if (this.NewPacketFormat) {
		tmp157, err := this._io.ReadBitsIntBe(6)
		if err != nil {
			return err
		}
		this.PacketTypeNew = OpenpgpMessage_PacketTags(tmp157)
	}
	if (!(this.NewPacketFormat)) {
		tmp158, err := this._io.ReadBitsIntBe(4)
		if err != nil {
			return err
		}
		this.PacketTypeOld = OpenpgpMessage_PacketTags(tmp158)
	}
	if (!(this.NewPacketFormat)) {
		tmp159, err := this._io.ReadBitsIntBe(2)
		if err != nil {
			return err
		}
		this.LenType = tmp159
	}
	this._io.AlignToByte()
	switch (this.NewPacketFormat) {
	case false:
		tmp160 := NewOpenpgpMessage_OldPacket()
		err = tmp160.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp160
	}
	return err
}
type OpenpgpMessage_TrustSignature struct {
	Level uint8
	Amount uint8
	_io *kaitai.Stream
	_root *OpenpgpMessage
	_parent *OpenpgpMessage_Subpacket
}
func NewOpenpgpMessage_TrustSignature() *OpenpgpMessage_TrustSignature {
	return &OpenpgpMessage_TrustSignature{
	}
}

func (this *OpenpgpMessage_TrustSignature) Read(io *kaitai.Stream, parent *OpenpgpMessage_Subpacket, root *OpenpgpMessage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp161, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Level = tmp161
	tmp162, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Amount = tmp162
	return err
}
