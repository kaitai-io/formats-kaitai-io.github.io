// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]

extern crate kaitai;
use kaitai::*;
use std::convert::{TryFrom, TryInto};
use std::cell::{Ref, Cell, RefCell};
use std::rc::{Rc, Weak};

/**
 * The OpenPGP Message Format is a format to store encryption and signature keys for emails.
 * \sa https://www.rfc-editor.org/rfc/rfc4880 Source
 */

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage>,
    pub _self: SharedType<Self>,
    packets: RefCell<Vec<OptRc<OpenpgpMessage_Packet>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.packets.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, OpenpgpMessage_Packet>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.packets.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl OpenpgpMessage {
}
impl OpenpgpMessage {
    pub fn packets(&self) -> Ref<'_, Vec<OptRc<OpenpgpMessage_Packet>>> {
        self.packets.borrow()
    }
}
impl OpenpgpMessage {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum OpenpgpMessage_CompressionAlgorithms {
    Uncompressed,
    Zib,
    Zlib,
    Bzip,
    PrivateExperimentalAlgorithm00,
    PrivateExperimentalAlgorithm01,
    PrivateExperimentalAlgorithm02,
    PrivateExperimentalAlgorithm03,
    PrivateExperimentalAlgorithm04,
    PrivateExperimentalAlgorithm05,
    PrivateExperimentalAlgorithm06,
    PrivateExperimentalAlgorithm07,
    PrivateExperimentalAlgorithm08,
    PrivateExperimentalAlgorithm09,
    PrivateExperimentalAlgorithm10,
    Unknown(i64),
}

impl TryFrom<i64> for OpenpgpMessage_CompressionAlgorithms {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<OpenpgpMessage_CompressionAlgorithms> {
        match flag {
            0 => Ok(OpenpgpMessage_CompressionAlgorithms::Uncompressed),
            1 => Ok(OpenpgpMessage_CompressionAlgorithms::Zib),
            2 => Ok(OpenpgpMessage_CompressionAlgorithms::Zlib),
            3 => Ok(OpenpgpMessage_CompressionAlgorithms::Bzip),
            100 => Ok(OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm00),
            101 => Ok(OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm01),
            102 => Ok(OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm02),
            103 => Ok(OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm03),
            104 => Ok(OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm04),
            105 => Ok(OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm05),
            106 => Ok(OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm06),
            107 => Ok(OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm07),
            108 => Ok(OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm08),
            109 => Ok(OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm09),
            110 => Ok(OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm10),
            _ => Ok(OpenpgpMessage_CompressionAlgorithms::Unknown(flag)),
        }
    }
}

impl From<&OpenpgpMessage_CompressionAlgorithms> for i64 {
    fn from(v: &OpenpgpMessage_CompressionAlgorithms) -> Self {
        match *v {
            OpenpgpMessage_CompressionAlgorithms::Uncompressed => 0,
            OpenpgpMessage_CompressionAlgorithms::Zib => 1,
            OpenpgpMessage_CompressionAlgorithms::Zlib => 2,
            OpenpgpMessage_CompressionAlgorithms::Bzip => 3,
            OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm00 => 100,
            OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm01 => 101,
            OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm02 => 102,
            OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm03 => 103,
            OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm04 => 104,
            OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm05 => 105,
            OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm06 => 106,
            OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm07 => 107,
            OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm08 => 108,
            OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm09 => 109,
            OpenpgpMessage_CompressionAlgorithms::PrivateExperimentalAlgorithm10 => 110,
            OpenpgpMessage_CompressionAlgorithms::Unknown(v) => v
        }
    }
}

impl Default for OpenpgpMessage_CompressionAlgorithms {
    fn default() -> Self { OpenpgpMessage_CompressionAlgorithms::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum OpenpgpMessage_HashAlgorithms {
    Md5,
    Sha1,
    Ripemd160,
    Reserved4,
    Reserved5,
    Reserved6,
    Reserved7,
    Sha256,
    Sha384,
    Sha512,
    Sha224,
    PrivateExperimentalAlgorithm00,
    PrivateExperimentalAlgorithm01,
    PrivateExperimentalAlgorithm02,
    PrivateExperimentalAlgorithm03,
    PrivateExperimentalAlgorithm04,
    PrivateExperimentalAlgorithm05,
    PrivateExperimentalAlgorithm06,
    PrivateExperimentalAlgorithm07,
    PrivateExperimentalAlgorithm08,
    PrivateExperimentalAlgorithm09,
    PrivateExperimentalAlgorithm10,
    Unknown(i64),
}

impl TryFrom<i64> for OpenpgpMessage_HashAlgorithms {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<OpenpgpMessage_HashAlgorithms> {
        match flag {
            1 => Ok(OpenpgpMessage_HashAlgorithms::Md5),
            2 => Ok(OpenpgpMessage_HashAlgorithms::Sha1),
            3 => Ok(OpenpgpMessage_HashAlgorithms::Ripemd160),
            4 => Ok(OpenpgpMessage_HashAlgorithms::Reserved4),
            5 => Ok(OpenpgpMessage_HashAlgorithms::Reserved5),
            6 => Ok(OpenpgpMessage_HashAlgorithms::Reserved6),
            7 => Ok(OpenpgpMessage_HashAlgorithms::Reserved7),
            8 => Ok(OpenpgpMessage_HashAlgorithms::Sha256),
            9 => Ok(OpenpgpMessage_HashAlgorithms::Sha384),
            10 => Ok(OpenpgpMessage_HashAlgorithms::Sha512),
            11 => Ok(OpenpgpMessage_HashAlgorithms::Sha224),
            100 => Ok(OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm00),
            101 => Ok(OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm01),
            102 => Ok(OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm02),
            103 => Ok(OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm03),
            104 => Ok(OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm04),
            105 => Ok(OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm05),
            106 => Ok(OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm06),
            107 => Ok(OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm07),
            108 => Ok(OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm08),
            109 => Ok(OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm09),
            110 => Ok(OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm10),
            _ => Ok(OpenpgpMessage_HashAlgorithms::Unknown(flag)),
        }
    }
}

impl From<&OpenpgpMessage_HashAlgorithms> for i64 {
    fn from(v: &OpenpgpMessage_HashAlgorithms) -> Self {
        match *v {
            OpenpgpMessage_HashAlgorithms::Md5 => 1,
            OpenpgpMessage_HashAlgorithms::Sha1 => 2,
            OpenpgpMessage_HashAlgorithms::Ripemd160 => 3,
            OpenpgpMessage_HashAlgorithms::Reserved4 => 4,
            OpenpgpMessage_HashAlgorithms::Reserved5 => 5,
            OpenpgpMessage_HashAlgorithms::Reserved6 => 6,
            OpenpgpMessage_HashAlgorithms::Reserved7 => 7,
            OpenpgpMessage_HashAlgorithms::Sha256 => 8,
            OpenpgpMessage_HashAlgorithms::Sha384 => 9,
            OpenpgpMessage_HashAlgorithms::Sha512 => 10,
            OpenpgpMessage_HashAlgorithms::Sha224 => 11,
            OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm00 => 100,
            OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm01 => 101,
            OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm02 => 102,
            OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm03 => 103,
            OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm04 => 104,
            OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm05 => 105,
            OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm06 => 106,
            OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm07 => 107,
            OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm08 => 108,
            OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm09 => 109,
            OpenpgpMessage_HashAlgorithms::PrivateExperimentalAlgorithm10 => 110,
            OpenpgpMessage_HashAlgorithms::Unknown(v) => v
        }
    }
}

impl Default for OpenpgpMessage_HashAlgorithms {
    fn default() -> Self { OpenpgpMessage_HashAlgorithms::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum OpenpgpMessage_KeyFlags {
    ThisKeyMayBeUsedToCertifyOtherKeys,
    ThisKeyMayBeUsedToSignData,
    ThisKeyMayBeUsedToEncryptCommunications,
    ThisKeyMayBeUsedToEncryptStorage,
    ThePrivateComponentOfThisKeyMayHaveBeenSplitByASecretSharingMechanism,
    ThisKeyMayBeUsedForAuthentication,
    ThePrivateComponentOfThisKeyMayBeInThePossessionOfMoreThanOnePerson,
    Unknown(i64),
}

impl TryFrom<i64> for OpenpgpMessage_KeyFlags {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<OpenpgpMessage_KeyFlags> {
        match flag {
            1 => Ok(OpenpgpMessage_KeyFlags::ThisKeyMayBeUsedToCertifyOtherKeys),
            2 => Ok(OpenpgpMessage_KeyFlags::ThisKeyMayBeUsedToSignData),
            4 => Ok(OpenpgpMessage_KeyFlags::ThisKeyMayBeUsedToEncryptCommunications),
            8 => Ok(OpenpgpMessage_KeyFlags::ThisKeyMayBeUsedToEncryptStorage),
            16 => Ok(OpenpgpMessage_KeyFlags::ThePrivateComponentOfThisKeyMayHaveBeenSplitByASecretSharingMechanism),
            32 => Ok(OpenpgpMessage_KeyFlags::ThisKeyMayBeUsedForAuthentication),
            128 => Ok(OpenpgpMessage_KeyFlags::ThePrivateComponentOfThisKeyMayBeInThePossessionOfMoreThanOnePerson),
            _ => Ok(OpenpgpMessage_KeyFlags::Unknown(flag)),
        }
    }
}

impl From<&OpenpgpMessage_KeyFlags> for i64 {
    fn from(v: &OpenpgpMessage_KeyFlags) -> Self {
        match *v {
            OpenpgpMessage_KeyFlags::ThisKeyMayBeUsedToCertifyOtherKeys => 1,
            OpenpgpMessage_KeyFlags::ThisKeyMayBeUsedToSignData => 2,
            OpenpgpMessage_KeyFlags::ThisKeyMayBeUsedToEncryptCommunications => 4,
            OpenpgpMessage_KeyFlags::ThisKeyMayBeUsedToEncryptStorage => 8,
            OpenpgpMessage_KeyFlags::ThePrivateComponentOfThisKeyMayHaveBeenSplitByASecretSharingMechanism => 16,
            OpenpgpMessage_KeyFlags::ThisKeyMayBeUsedForAuthentication => 32,
            OpenpgpMessage_KeyFlags::ThePrivateComponentOfThisKeyMayBeInThePossessionOfMoreThanOnePerson => 128,
            OpenpgpMessage_KeyFlags::Unknown(v) => v
        }
    }
}

impl Default for OpenpgpMessage_KeyFlags {
    fn default() -> Self { OpenpgpMessage_KeyFlags::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum OpenpgpMessage_PacketTags {
    ReservedAPacketTagMustNotHaveThisValue,
    PublicKeyEncryptedSessionKeyPacket,
    SignaturePacket,
    SymmetricKeyEncryptedSessionKeyPacket,
    OnePassSignaturePacket,
    SecretKeyPacket,
    PublicKeyPacket,
    SecretSubkeyPacket,
    CompressedDataPacket,
    SymmetricallyEncryptedDataPacket,
    MarkerPacket,
    LiteralDataPacket,
    TrustPacket,
    UserIdPacket,
    PublicSubkeyPacket,
    UserAttributePacket,
    SymEncryptedAndIntegrityProtectedDataPacket,
    ModificationDetectionCodePacket,
    PrivateOrExperimentalValues0,
    PrivateOrExperimentalValues1,
    PrivateOrExperimentalValues2,
    PrivateOrExperimentalValues3,
    Unknown(i64),
}

impl TryFrom<i64> for OpenpgpMessage_PacketTags {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<OpenpgpMessage_PacketTags> {
        match flag {
            0 => Ok(OpenpgpMessage_PacketTags::ReservedAPacketTagMustNotHaveThisValue),
            1 => Ok(OpenpgpMessage_PacketTags::PublicKeyEncryptedSessionKeyPacket),
            2 => Ok(OpenpgpMessage_PacketTags::SignaturePacket),
            3 => Ok(OpenpgpMessage_PacketTags::SymmetricKeyEncryptedSessionKeyPacket),
            4 => Ok(OpenpgpMessage_PacketTags::OnePassSignaturePacket),
            5 => Ok(OpenpgpMessage_PacketTags::SecretKeyPacket),
            6 => Ok(OpenpgpMessage_PacketTags::PublicKeyPacket),
            7 => Ok(OpenpgpMessage_PacketTags::SecretSubkeyPacket),
            8 => Ok(OpenpgpMessage_PacketTags::CompressedDataPacket),
            9 => Ok(OpenpgpMessage_PacketTags::SymmetricallyEncryptedDataPacket),
            10 => Ok(OpenpgpMessage_PacketTags::MarkerPacket),
            11 => Ok(OpenpgpMessage_PacketTags::LiteralDataPacket),
            12 => Ok(OpenpgpMessage_PacketTags::TrustPacket),
            13 => Ok(OpenpgpMessage_PacketTags::UserIdPacket),
            14 => Ok(OpenpgpMessage_PacketTags::PublicSubkeyPacket),
            17 => Ok(OpenpgpMessage_PacketTags::UserAttributePacket),
            18 => Ok(OpenpgpMessage_PacketTags::SymEncryptedAndIntegrityProtectedDataPacket),
            19 => Ok(OpenpgpMessage_PacketTags::ModificationDetectionCodePacket),
            60 => Ok(OpenpgpMessage_PacketTags::PrivateOrExperimentalValues0),
            61 => Ok(OpenpgpMessage_PacketTags::PrivateOrExperimentalValues1),
            62 => Ok(OpenpgpMessage_PacketTags::PrivateOrExperimentalValues2),
            63 => Ok(OpenpgpMessage_PacketTags::PrivateOrExperimentalValues3),
            _ => Ok(OpenpgpMessage_PacketTags::Unknown(flag)),
        }
    }
}

impl From<&OpenpgpMessage_PacketTags> for i64 {
    fn from(v: &OpenpgpMessage_PacketTags) -> Self {
        match *v {
            OpenpgpMessage_PacketTags::ReservedAPacketTagMustNotHaveThisValue => 0,
            OpenpgpMessage_PacketTags::PublicKeyEncryptedSessionKeyPacket => 1,
            OpenpgpMessage_PacketTags::SignaturePacket => 2,
            OpenpgpMessage_PacketTags::SymmetricKeyEncryptedSessionKeyPacket => 3,
            OpenpgpMessage_PacketTags::OnePassSignaturePacket => 4,
            OpenpgpMessage_PacketTags::SecretKeyPacket => 5,
            OpenpgpMessage_PacketTags::PublicKeyPacket => 6,
            OpenpgpMessage_PacketTags::SecretSubkeyPacket => 7,
            OpenpgpMessage_PacketTags::CompressedDataPacket => 8,
            OpenpgpMessage_PacketTags::SymmetricallyEncryptedDataPacket => 9,
            OpenpgpMessage_PacketTags::MarkerPacket => 10,
            OpenpgpMessage_PacketTags::LiteralDataPacket => 11,
            OpenpgpMessage_PacketTags::TrustPacket => 12,
            OpenpgpMessage_PacketTags::UserIdPacket => 13,
            OpenpgpMessage_PacketTags::PublicSubkeyPacket => 14,
            OpenpgpMessage_PacketTags::UserAttributePacket => 17,
            OpenpgpMessage_PacketTags::SymEncryptedAndIntegrityProtectedDataPacket => 18,
            OpenpgpMessage_PacketTags::ModificationDetectionCodePacket => 19,
            OpenpgpMessage_PacketTags::PrivateOrExperimentalValues0 => 60,
            OpenpgpMessage_PacketTags::PrivateOrExperimentalValues1 => 61,
            OpenpgpMessage_PacketTags::PrivateOrExperimentalValues2 => 62,
            OpenpgpMessage_PacketTags::PrivateOrExperimentalValues3 => 63,
            OpenpgpMessage_PacketTags::Unknown(v) => v
        }
    }
}

impl Default for OpenpgpMessage_PacketTags {
    fn default() -> Self { OpenpgpMessage_PacketTags::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum OpenpgpMessage_PublicKeyAlgorithms {
    RsaEncryptOrSignHac,
    RsaEncryptOnlyHac,
    RsaSignOnlyHac,
    ElgamalEncryptOnlyElgamalHac,
    DsaDigitalSignatureAlgorithmFipsHac,
    ReservedForEllipticCurve,
    ReservedForEcdsa,
    ReservedFormerlyElgamalEncryptOrSign,
    ReservedForDiffieHellmanXAsDefinedForIetfSMime,
    PrivateExperimentalAlgorithm00,
    PrivateExperimentalAlgorithm01,
    PrivateExperimentalAlgorithm02,
    PrivateExperimentalAlgorithm03,
    PrivateExperimentalAlgorithm04,
    PrivateExperimentalAlgorithm05,
    PrivateExperimentalAlgorithm06,
    PrivateExperimentalAlgorithm07,
    PrivateExperimentalAlgorithm08,
    PrivateExperimentalAlgorithm09,
    PrivateExperimentalAlgorithm10,
    Unknown(i64),
}

impl TryFrom<i64> for OpenpgpMessage_PublicKeyAlgorithms {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<OpenpgpMessage_PublicKeyAlgorithms> {
        match flag {
            1 => Ok(OpenpgpMessage_PublicKeyAlgorithms::RsaEncryptOrSignHac),
            2 => Ok(OpenpgpMessage_PublicKeyAlgorithms::RsaEncryptOnlyHac),
            3 => Ok(OpenpgpMessage_PublicKeyAlgorithms::RsaSignOnlyHac),
            16 => Ok(OpenpgpMessage_PublicKeyAlgorithms::ElgamalEncryptOnlyElgamalHac),
            17 => Ok(OpenpgpMessage_PublicKeyAlgorithms::DsaDigitalSignatureAlgorithmFipsHac),
            18 => Ok(OpenpgpMessage_PublicKeyAlgorithms::ReservedForEllipticCurve),
            19 => Ok(OpenpgpMessage_PublicKeyAlgorithms::ReservedForEcdsa),
            20 => Ok(OpenpgpMessage_PublicKeyAlgorithms::ReservedFormerlyElgamalEncryptOrSign),
            21 => Ok(OpenpgpMessage_PublicKeyAlgorithms::ReservedForDiffieHellmanXAsDefinedForIetfSMime),
            100 => Ok(OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm00),
            101 => Ok(OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm01),
            102 => Ok(OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm02),
            103 => Ok(OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm03),
            104 => Ok(OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm04),
            105 => Ok(OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm05),
            106 => Ok(OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm06),
            107 => Ok(OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm07),
            108 => Ok(OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm08),
            109 => Ok(OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm09),
            110 => Ok(OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm10),
            _ => Ok(OpenpgpMessage_PublicKeyAlgorithms::Unknown(flag)),
        }
    }
}

impl From<&OpenpgpMessage_PublicKeyAlgorithms> for i64 {
    fn from(v: &OpenpgpMessage_PublicKeyAlgorithms) -> Self {
        match *v {
            OpenpgpMessage_PublicKeyAlgorithms::RsaEncryptOrSignHac => 1,
            OpenpgpMessage_PublicKeyAlgorithms::RsaEncryptOnlyHac => 2,
            OpenpgpMessage_PublicKeyAlgorithms::RsaSignOnlyHac => 3,
            OpenpgpMessage_PublicKeyAlgorithms::ElgamalEncryptOnlyElgamalHac => 16,
            OpenpgpMessage_PublicKeyAlgorithms::DsaDigitalSignatureAlgorithmFipsHac => 17,
            OpenpgpMessage_PublicKeyAlgorithms::ReservedForEllipticCurve => 18,
            OpenpgpMessage_PublicKeyAlgorithms::ReservedForEcdsa => 19,
            OpenpgpMessage_PublicKeyAlgorithms::ReservedFormerlyElgamalEncryptOrSign => 20,
            OpenpgpMessage_PublicKeyAlgorithms::ReservedForDiffieHellmanXAsDefinedForIetfSMime => 21,
            OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm00 => 100,
            OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm01 => 101,
            OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm02 => 102,
            OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm03 => 103,
            OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm04 => 104,
            OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm05 => 105,
            OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm06 => 106,
            OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm07 => 107,
            OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm08 => 108,
            OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm09 => 109,
            OpenpgpMessage_PublicKeyAlgorithms::PrivateExperimentalAlgorithm10 => 110,
            OpenpgpMessage_PublicKeyAlgorithms::Unknown(v) => v
        }
    }
}

impl Default for OpenpgpMessage_PublicKeyAlgorithms {
    fn default() -> Self { OpenpgpMessage_PublicKeyAlgorithms::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum OpenpgpMessage_RevocationCodes {
    NoReasonSpecifiedKeyRevocationsOrCertRevocations,
    KeyIsSupersededKeyRevocations,
    KeyMaterialHasBeenCompromisedKeyRevocations,
    KeyIsRetiredAndNoLongerUsedKeyRevocations,
    UserIdInformationIsNoLongerValidCertRevocations,
    PrivateUse1,
    PrivateUse2,
    PrivateUse3,
    PrivateUse4,
    PrivateUse11,
    Unknown(i64),
}

impl TryFrom<i64> for OpenpgpMessage_RevocationCodes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<OpenpgpMessage_RevocationCodes> {
        match flag {
            0 => Ok(OpenpgpMessage_RevocationCodes::NoReasonSpecifiedKeyRevocationsOrCertRevocations),
            1 => Ok(OpenpgpMessage_RevocationCodes::KeyIsSupersededKeyRevocations),
            2 => Ok(OpenpgpMessage_RevocationCodes::KeyMaterialHasBeenCompromisedKeyRevocations),
            3 => Ok(OpenpgpMessage_RevocationCodes::KeyIsRetiredAndNoLongerUsedKeyRevocations),
            32 => Ok(OpenpgpMessage_RevocationCodes::UserIdInformationIsNoLongerValidCertRevocations),
            100 => Ok(OpenpgpMessage_RevocationCodes::PrivateUse1),
            101 => Ok(OpenpgpMessage_RevocationCodes::PrivateUse2),
            102 => Ok(OpenpgpMessage_RevocationCodes::PrivateUse3),
            103 => Ok(OpenpgpMessage_RevocationCodes::PrivateUse4),
            110 => Ok(OpenpgpMessage_RevocationCodes::PrivateUse11),
            _ => Ok(OpenpgpMessage_RevocationCodes::Unknown(flag)),
        }
    }
}

impl From<&OpenpgpMessage_RevocationCodes> for i64 {
    fn from(v: &OpenpgpMessage_RevocationCodes) -> Self {
        match *v {
            OpenpgpMessage_RevocationCodes::NoReasonSpecifiedKeyRevocationsOrCertRevocations => 0,
            OpenpgpMessage_RevocationCodes::KeyIsSupersededKeyRevocations => 1,
            OpenpgpMessage_RevocationCodes::KeyMaterialHasBeenCompromisedKeyRevocations => 2,
            OpenpgpMessage_RevocationCodes::KeyIsRetiredAndNoLongerUsedKeyRevocations => 3,
            OpenpgpMessage_RevocationCodes::UserIdInformationIsNoLongerValidCertRevocations => 32,
            OpenpgpMessage_RevocationCodes::PrivateUse1 => 100,
            OpenpgpMessage_RevocationCodes::PrivateUse2 => 101,
            OpenpgpMessage_RevocationCodes::PrivateUse3 => 102,
            OpenpgpMessage_RevocationCodes::PrivateUse4 => 103,
            OpenpgpMessage_RevocationCodes::PrivateUse11 => 110,
            OpenpgpMessage_RevocationCodes::Unknown(v) => v
        }
    }
}

impl Default for OpenpgpMessage_RevocationCodes {
    fn default() -> Self { OpenpgpMessage_RevocationCodes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum OpenpgpMessage_ServerFlags {
    NoModify,
    Unknown(i64),
}

impl TryFrom<i64> for OpenpgpMessage_ServerFlags {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<OpenpgpMessage_ServerFlags> {
        match flag {
            128 => Ok(OpenpgpMessage_ServerFlags::NoModify),
            _ => Ok(OpenpgpMessage_ServerFlags::Unknown(flag)),
        }
    }
}

impl From<&OpenpgpMessage_ServerFlags> for i64 {
    fn from(v: &OpenpgpMessage_ServerFlags) -> Self {
        match *v {
            OpenpgpMessage_ServerFlags::NoModify => 128,
            OpenpgpMessage_ServerFlags::Unknown(v) => v
        }
    }
}

impl Default for OpenpgpMessage_ServerFlags {
    fn default() -> Self { OpenpgpMessage_ServerFlags::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum OpenpgpMessage_SubpacketTypes {
    Reserved0,
    Reserved1,
    SignatureCreationTime,
    SignatureExpirationTime,
    ExportableCertification,
    TrustSignature,
    RegularExpression,
    Revocable,
    Reserved8,
    KeyExpirationTime,
    PlaceholderForBackwardCompatibility,
    PreferredSymmetricAlgorithms,
    RevocationKey,
    Reserved13,
    Reserved14,
    Reserved15,
    Issuer,
    Reserved17,
    Reserved18,
    Reserved19,
    NotationData,
    PreferredHashAlgorithms,
    PreferredCompressionAlgorithms,
    KeyServerPreferences,
    PreferredKeyServer,
    PrimaryUserId,
    PolicyUri,
    KeyFlags,
    SignersUserId,
    ReasonForRevocation,
    Features,
    SignatureTarget,
    EmbeddedSignature,
    Unknown(i64),
}

impl TryFrom<i64> for OpenpgpMessage_SubpacketTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<OpenpgpMessage_SubpacketTypes> {
        match flag {
            0 => Ok(OpenpgpMessage_SubpacketTypes::Reserved0),
            1 => Ok(OpenpgpMessage_SubpacketTypes::Reserved1),
            2 => Ok(OpenpgpMessage_SubpacketTypes::SignatureCreationTime),
            3 => Ok(OpenpgpMessage_SubpacketTypes::SignatureExpirationTime),
            4 => Ok(OpenpgpMessage_SubpacketTypes::ExportableCertification),
            5 => Ok(OpenpgpMessage_SubpacketTypes::TrustSignature),
            6 => Ok(OpenpgpMessage_SubpacketTypes::RegularExpression),
            7 => Ok(OpenpgpMessage_SubpacketTypes::Revocable),
            8 => Ok(OpenpgpMessage_SubpacketTypes::Reserved8),
            9 => Ok(OpenpgpMessage_SubpacketTypes::KeyExpirationTime),
            10 => Ok(OpenpgpMessage_SubpacketTypes::PlaceholderForBackwardCompatibility),
            11 => Ok(OpenpgpMessage_SubpacketTypes::PreferredSymmetricAlgorithms),
            12 => Ok(OpenpgpMessage_SubpacketTypes::RevocationKey),
            13 => Ok(OpenpgpMessage_SubpacketTypes::Reserved13),
            14 => Ok(OpenpgpMessage_SubpacketTypes::Reserved14),
            15 => Ok(OpenpgpMessage_SubpacketTypes::Reserved15),
            16 => Ok(OpenpgpMessage_SubpacketTypes::Issuer),
            17 => Ok(OpenpgpMessage_SubpacketTypes::Reserved17),
            18 => Ok(OpenpgpMessage_SubpacketTypes::Reserved18),
            19 => Ok(OpenpgpMessage_SubpacketTypes::Reserved19),
            20 => Ok(OpenpgpMessage_SubpacketTypes::NotationData),
            21 => Ok(OpenpgpMessage_SubpacketTypes::PreferredHashAlgorithms),
            22 => Ok(OpenpgpMessage_SubpacketTypes::PreferredCompressionAlgorithms),
            23 => Ok(OpenpgpMessage_SubpacketTypes::KeyServerPreferences),
            24 => Ok(OpenpgpMessage_SubpacketTypes::PreferredKeyServer),
            25 => Ok(OpenpgpMessage_SubpacketTypes::PrimaryUserId),
            26 => Ok(OpenpgpMessage_SubpacketTypes::PolicyUri),
            27 => Ok(OpenpgpMessage_SubpacketTypes::KeyFlags),
            28 => Ok(OpenpgpMessage_SubpacketTypes::SignersUserId),
            29 => Ok(OpenpgpMessage_SubpacketTypes::ReasonForRevocation),
            30 => Ok(OpenpgpMessage_SubpacketTypes::Features),
            31 => Ok(OpenpgpMessage_SubpacketTypes::SignatureTarget),
            32 => Ok(OpenpgpMessage_SubpacketTypes::EmbeddedSignature),
            _ => Ok(OpenpgpMessage_SubpacketTypes::Unknown(flag)),
        }
    }
}

impl From<&OpenpgpMessage_SubpacketTypes> for i64 {
    fn from(v: &OpenpgpMessage_SubpacketTypes) -> Self {
        match *v {
            OpenpgpMessage_SubpacketTypes::Reserved0 => 0,
            OpenpgpMessage_SubpacketTypes::Reserved1 => 1,
            OpenpgpMessage_SubpacketTypes::SignatureCreationTime => 2,
            OpenpgpMessage_SubpacketTypes::SignatureExpirationTime => 3,
            OpenpgpMessage_SubpacketTypes::ExportableCertification => 4,
            OpenpgpMessage_SubpacketTypes::TrustSignature => 5,
            OpenpgpMessage_SubpacketTypes::RegularExpression => 6,
            OpenpgpMessage_SubpacketTypes::Revocable => 7,
            OpenpgpMessage_SubpacketTypes::Reserved8 => 8,
            OpenpgpMessage_SubpacketTypes::KeyExpirationTime => 9,
            OpenpgpMessage_SubpacketTypes::PlaceholderForBackwardCompatibility => 10,
            OpenpgpMessage_SubpacketTypes::PreferredSymmetricAlgorithms => 11,
            OpenpgpMessage_SubpacketTypes::RevocationKey => 12,
            OpenpgpMessage_SubpacketTypes::Reserved13 => 13,
            OpenpgpMessage_SubpacketTypes::Reserved14 => 14,
            OpenpgpMessage_SubpacketTypes::Reserved15 => 15,
            OpenpgpMessage_SubpacketTypes::Issuer => 16,
            OpenpgpMessage_SubpacketTypes::Reserved17 => 17,
            OpenpgpMessage_SubpacketTypes::Reserved18 => 18,
            OpenpgpMessage_SubpacketTypes::Reserved19 => 19,
            OpenpgpMessage_SubpacketTypes::NotationData => 20,
            OpenpgpMessage_SubpacketTypes::PreferredHashAlgorithms => 21,
            OpenpgpMessage_SubpacketTypes::PreferredCompressionAlgorithms => 22,
            OpenpgpMessage_SubpacketTypes::KeyServerPreferences => 23,
            OpenpgpMessage_SubpacketTypes::PreferredKeyServer => 24,
            OpenpgpMessage_SubpacketTypes::PrimaryUserId => 25,
            OpenpgpMessage_SubpacketTypes::PolicyUri => 26,
            OpenpgpMessage_SubpacketTypes::KeyFlags => 27,
            OpenpgpMessage_SubpacketTypes::SignersUserId => 28,
            OpenpgpMessage_SubpacketTypes::ReasonForRevocation => 29,
            OpenpgpMessage_SubpacketTypes::Features => 30,
            OpenpgpMessage_SubpacketTypes::SignatureTarget => 31,
            OpenpgpMessage_SubpacketTypes::EmbeddedSignature => 32,
            OpenpgpMessage_SubpacketTypes::Unknown(v) => v
        }
    }
}

impl Default for OpenpgpMessage_SubpacketTypes {
    fn default() -> Self { OpenpgpMessage_SubpacketTypes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum OpenpgpMessage_SymmetricKeyAlgorithm {
    Plain,
    Idea,
    TripleDes,
    Cast5,
    Blowfisch,
    Reserved5,
    Reserved6,
    Aes128,
    Aes192,
    Aes256,
    Twofish256,
    PrivateExperimentalAlgorithm00,
    PrivateExperimentalAlgorithm01,
    PrivateExperimentalAlgorithm02,
    PrivateExperimentalAlgorithm03,
    PrivateExperimentalAlgorithm04,
    PrivateExperimentalAlgorithm05,
    PrivateExperimentalAlgorithm06,
    PrivateExperimentalAlgorithm07,
    PrivateExperimentalAlgorithm08,
    PrivateExperimentalAlgorithm09,
    PrivateExperimentalAlgorithm10,
    Unknown(i64),
}

impl TryFrom<i64> for OpenpgpMessage_SymmetricKeyAlgorithm {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<OpenpgpMessage_SymmetricKeyAlgorithm> {
        match flag {
            0 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::Plain),
            1 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::Idea),
            2 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::TripleDes),
            3 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::Cast5),
            4 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::Blowfisch),
            5 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::Reserved5),
            6 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::Reserved6),
            7 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::Aes128),
            8 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::Aes192),
            9 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::Aes256),
            10 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::Twofish256),
            100 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm00),
            101 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm01),
            102 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm02),
            103 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm03),
            104 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm04),
            105 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm05),
            106 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm06),
            107 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm07),
            108 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm08),
            109 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm09),
            110 => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm10),
            _ => Ok(OpenpgpMessage_SymmetricKeyAlgorithm::Unknown(flag)),
        }
    }
}

impl From<&OpenpgpMessage_SymmetricKeyAlgorithm> for i64 {
    fn from(v: &OpenpgpMessage_SymmetricKeyAlgorithm) -> Self {
        match *v {
            OpenpgpMessage_SymmetricKeyAlgorithm::Plain => 0,
            OpenpgpMessage_SymmetricKeyAlgorithm::Idea => 1,
            OpenpgpMessage_SymmetricKeyAlgorithm::TripleDes => 2,
            OpenpgpMessage_SymmetricKeyAlgorithm::Cast5 => 3,
            OpenpgpMessage_SymmetricKeyAlgorithm::Blowfisch => 4,
            OpenpgpMessage_SymmetricKeyAlgorithm::Reserved5 => 5,
            OpenpgpMessage_SymmetricKeyAlgorithm::Reserved6 => 6,
            OpenpgpMessage_SymmetricKeyAlgorithm::Aes128 => 7,
            OpenpgpMessage_SymmetricKeyAlgorithm::Aes192 => 8,
            OpenpgpMessage_SymmetricKeyAlgorithm::Aes256 => 9,
            OpenpgpMessage_SymmetricKeyAlgorithm::Twofish256 => 10,
            OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm00 => 100,
            OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm01 => 101,
            OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm02 => 102,
            OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm03 => 103,
            OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm04 => 104,
            OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm05 => 105,
            OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm06 => 106,
            OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm07 => 107,
            OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm08 => 108,
            OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm09 => 109,
            OpenpgpMessage_SymmetricKeyAlgorithm::PrivateExperimentalAlgorithm10 => 110,
            OpenpgpMessage_SymmetricKeyAlgorithm::Unknown(v) => v
        }
    }
}

impl Default for OpenpgpMessage_SymmetricKeyAlgorithm {
    fn default() -> Self { OpenpgpMessage_SymmetricKeyAlgorithm::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_EmbeddedSignature {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    signature_packet: RefCell<OptRc<OpenpgpMessage_SignaturePacket>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_EmbeddedSignature {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, OpenpgpMessage_SignaturePacket>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.signature_packet.borrow_mut() = t;
        Ok(())
    }
}
impl OpenpgpMessage_EmbeddedSignature {
}
impl OpenpgpMessage_EmbeddedSignature {
    pub fn signature_packet(&self) -> Ref<'_, OptRc<OpenpgpMessage_SignaturePacket>> {
        self.signature_packet.borrow()
    }
}
impl OpenpgpMessage_EmbeddedSignature {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_ExportableCertification {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    exportable: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_ExportableCertification {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.exportable.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_ExportableCertification {
}
impl OpenpgpMessage_ExportableCertification {
    pub fn exportable(&self) -> Ref<'_, u8> {
        self.exportable.borrow()
    }
}
impl OpenpgpMessage_ExportableCertification {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_Features {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    flags: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_Features {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.flags.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_Features {
}
impl OpenpgpMessage_Features {
    pub fn flags(&self) -> Ref<'_, Vec<u8>> {
        self.flags.borrow()
    }
}
impl OpenpgpMessage_Features {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_Issuer {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    keyid: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_Issuer {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.keyid.borrow_mut() = _io.read_u8be()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_Issuer {
}
impl OpenpgpMessage_Issuer {
    pub fn keyid(&self) -> Ref<'_, u64> {
        self.keyid.borrow()
    }
}
impl OpenpgpMessage_Issuer {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_KeyExpirationTime {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    time: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_KeyExpirationTime {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.time.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_KeyExpirationTime {
}
impl OpenpgpMessage_KeyExpirationTime {
    pub fn time(&self) -> Ref<'_, u32> {
        self.time.borrow()
    }
}
impl OpenpgpMessage_KeyExpirationTime {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_KeyFlags {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    flag: RefCell<Vec<OpenpgpMessage_KeyFlags>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_KeyFlags {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.flag.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.flag.borrow_mut().push((_io.read_u1()? as i64).try_into()?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl OpenpgpMessage_KeyFlags {
}
impl OpenpgpMessage_KeyFlags {
    pub fn flag(&self) -> Ref<'_, Vec<OpenpgpMessage_KeyFlags>> {
        self.flag.borrow()
    }
}
impl OpenpgpMessage_KeyFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_KeyServerPreferences {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    flag: RefCell<Vec<OpenpgpMessage_ServerFlags>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_KeyServerPreferences {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.flag.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.flag.borrow_mut().push((_io.read_u1()? as i64).try_into()?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl OpenpgpMessage_KeyServerPreferences {
}
impl OpenpgpMessage_KeyServerPreferences {
    pub fn flag(&self) -> Ref<'_, Vec<OpenpgpMessage_ServerFlags>> {
        self.flag.borrow()
    }
}
impl OpenpgpMessage_KeyServerPreferences {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_LenSubpacket {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    first_octet: RefCell<u8>,
    second_octet: RefCell<u8>,
    scalar: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_len: Cell<bool>,
    len: RefCell<i32>,
}
impl KStruct for OpenpgpMessage_LenSubpacket {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.first_octet.borrow_mut() = _io.read_u1()?.into();
        if  ((*self_rc.first_octet() >= 192) && (*self_rc.first_octet() < 255))  {
            *self_rc.second_octet.borrow_mut() = _io.read_u1()?.into();
        }
        if *self_rc.first_octet() == 255 {
            *self_rc.scalar.borrow_mut() = _io.read_u4be()?.into();
        }
        Ok(())
    }
}
impl OpenpgpMessage_LenSubpacket {
    pub fn len(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len.get() {
            return Ok(self.len.borrow());
        }
        self.f_len.set(true);
        *self.len.borrow_mut() = (if *self.first_octet() < 192 { *self.first_octet() } else { if  ((*self.first_octet() >= 192) && (*self.first_octet() < 255))  { ((((((((*self.first_octet() as u8) - (192 as u8)) as i32) << (8 as i32)) as i32) + (*self.second_octet() as i32)) as i32) + (192 as i32)) } else { *self.scalar() } }) as i32;
        Ok(self.len.borrow())
    }
}
impl OpenpgpMessage_LenSubpacket {
    pub fn first_octet(&self) -> Ref<'_, u8> {
        self.first_octet.borrow()
    }
}
impl OpenpgpMessage_LenSubpacket {
    pub fn second_octet(&self) -> Ref<'_, u8> {
        self.second_octet.borrow()
    }
}
impl OpenpgpMessage_LenSubpacket {
    pub fn scalar(&self) -> Ref<'_, u32> {
        self.scalar.borrow()
    }
}
impl OpenpgpMessage_LenSubpacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_NotationData {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    flags: RefCell<Vec<u8>>,
    len_name: RefCell<u16>,
    len_value: RefCell<u16>,
    name: RefCell<Vec<u8>>,
    value: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_NotationData {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.flags.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.len_name.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.len_value.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.name.borrow_mut() = _io.read_bytes(*self_rc.len_name() as usize)?.into();
        *self_rc.value.borrow_mut() = _io.read_bytes(*self_rc.len_value() as usize)?.into();
        Ok(())
    }
}
impl OpenpgpMessage_NotationData {
}
impl OpenpgpMessage_NotationData {
    pub fn flags(&self) -> Ref<'_, Vec<u8>> {
        self.flags.borrow()
    }
}
impl OpenpgpMessage_NotationData {
    pub fn len_name(&self) -> Ref<'_, u16> {
        self.len_name.borrow()
    }
}
impl OpenpgpMessage_NotationData {
    pub fn len_value(&self) -> Ref<'_, u16> {
        self.len_value.borrow()
    }
}
impl OpenpgpMessage_NotationData {
    pub fn name(&self) -> Ref<'_, Vec<u8>> {
        self.name.borrow()
    }
}
impl OpenpgpMessage_NotationData {
    pub fn value(&self) -> Ref<'_, Vec<u8>> {
        self.value.borrow()
    }
}
impl OpenpgpMessage_NotationData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_OldPacket {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Packet>,
    pub _self: SharedType<Self>,
    len: RefCell<Option<OpenpgpMessage_OldPacket_Len>>,
    body: RefCell<Option<OpenpgpMessage_OldPacket_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum OpenpgpMessage_OldPacket_Len {
    U1(u8),
    U2(u16),
    U4(u32),
}
impl From<u8> for OpenpgpMessage_OldPacket_Len {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&OpenpgpMessage_OldPacket_Len> for u8 {
    fn from(e: &OpenpgpMessage_OldPacket_Len) -> Self {
        if let OpenpgpMessage_OldPacket_Len::U1(v) = e {
            return *v
        }
        panic!("trying to convert from enum OpenpgpMessage_OldPacket_Len::U1 to u8, enum value {:?}", e)
    }
}
impl From<u16> for OpenpgpMessage_OldPacket_Len {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&OpenpgpMessage_OldPacket_Len> for u16 {
    fn from(e: &OpenpgpMessage_OldPacket_Len) -> Self {
        if let OpenpgpMessage_OldPacket_Len::U2(v) = e {
            return *v
        }
        panic!("trying to convert from enum OpenpgpMessage_OldPacket_Len::U2 to u16, enum value {:?}", e)
    }
}
impl From<u32> for OpenpgpMessage_OldPacket_Len {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&OpenpgpMessage_OldPacket_Len> for u32 {
    fn from(e: &OpenpgpMessage_OldPacket_Len) -> Self {
        if let OpenpgpMessage_OldPacket_Len::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum OpenpgpMessage_OldPacket_Len::U4 to u32, enum value {:?}", e)
    }
}
impl From<&OpenpgpMessage_OldPacket_Len> for usize {
    fn from(e: &OpenpgpMessage_OldPacket_Len) -> Self {
        match e {
            OpenpgpMessage_OldPacket_Len::U1(v) => *v as usize,
            OpenpgpMessage_OldPacket_Len::U2(v) => *v as usize,
            OpenpgpMessage_OldPacket_Len::U4(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum OpenpgpMessage_OldPacket_Body {
    OpenpgpMessage_PublicKeyPacket(OptRc<OpenpgpMessage_PublicKeyPacket>),
    OpenpgpMessage_SignaturePacket(OptRc<OpenpgpMessage_SignaturePacket>),
    Bytes(Vec<u8>),
    OpenpgpMessage_UserIdPacket(OptRc<OpenpgpMessage_UserIdPacket>),
    OpenpgpMessage_SecretKeyPacket(OptRc<OpenpgpMessage_SecretKeyPacket>),
}
impl From<&OpenpgpMessage_OldPacket_Body> for OptRc<OpenpgpMessage_PublicKeyPacket> {
    fn from(v: &OpenpgpMessage_OldPacket_Body) -> Self {
        if let OpenpgpMessage_OldPacket_Body::OpenpgpMessage_PublicKeyPacket(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_OldPacket_Body::OpenpgpMessage_PublicKeyPacket, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_PublicKeyPacket>> for OpenpgpMessage_OldPacket_Body {
    fn from(v: OptRc<OpenpgpMessage_PublicKeyPacket>) -> Self {
        Self::OpenpgpMessage_PublicKeyPacket(v)
    }
}
impl From<&OpenpgpMessage_OldPacket_Body> for OptRc<OpenpgpMessage_SignaturePacket> {
    fn from(v: &OpenpgpMessage_OldPacket_Body) -> Self {
        if let OpenpgpMessage_OldPacket_Body::OpenpgpMessage_SignaturePacket(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_OldPacket_Body::OpenpgpMessage_SignaturePacket, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_SignaturePacket>> for OpenpgpMessage_OldPacket_Body {
    fn from(v: OptRc<OpenpgpMessage_SignaturePacket>) -> Self {
        Self::OpenpgpMessage_SignaturePacket(v)
    }
}
impl From<&OpenpgpMessage_OldPacket_Body> for Vec<u8> {
    fn from(v: &OpenpgpMessage_OldPacket_Body) -> Self {
        if let OpenpgpMessage_OldPacket_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_OldPacket_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for OpenpgpMessage_OldPacket_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&OpenpgpMessage_OldPacket_Body> for OptRc<OpenpgpMessage_UserIdPacket> {
    fn from(v: &OpenpgpMessage_OldPacket_Body) -> Self {
        if let OpenpgpMessage_OldPacket_Body::OpenpgpMessage_UserIdPacket(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_OldPacket_Body::OpenpgpMessage_UserIdPacket, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_UserIdPacket>> for OpenpgpMessage_OldPacket_Body {
    fn from(v: OptRc<OpenpgpMessage_UserIdPacket>) -> Self {
        Self::OpenpgpMessage_UserIdPacket(v)
    }
}
impl From<&OpenpgpMessage_OldPacket_Body> for OptRc<OpenpgpMessage_SecretKeyPacket> {
    fn from(v: &OpenpgpMessage_OldPacket_Body) -> Self {
        if let OpenpgpMessage_OldPacket_Body::OpenpgpMessage_SecretKeyPacket(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_OldPacket_Body::OpenpgpMessage_SecretKeyPacket, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_SecretKeyPacket>> for OpenpgpMessage_OldPacket_Body {
    fn from(v: OptRc<OpenpgpMessage_SecretKeyPacket>) -> Self {
        Self::OpenpgpMessage_SecretKeyPacket(v)
    }
}
impl KStruct for OpenpgpMessage_OldPacket {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Packet;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        match *_prc.as_ref().unwrap().len_type() {
            0 => {
                *self_rc.len.borrow_mut() = Some(_io.read_u1()?.into());
            }
            1 => {
                *self_rc.len.borrow_mut() = Some(_io.read_u2be()?.into());
            }
            2 => {
                *self_rc.len.borrow_mut() = Some(_io.read_u4be()?.into());
            }
            _ => {}
        }
        match *_prc.as_ref().unwrap().packet_type_old() {
            OpenpgpMessage_PacketTags::PublicKeyPacket => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_PublicKeyPacket>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            OpenpgpMessage_PacketTags::PublicSubkeyPacket => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_PublicKeyPacket>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            OpenpgpMessage_PacketTags::SecretKeyPacket => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_SecretKeyPacket>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            OpenpgpMessage_PacketTags::SecretSubkeyPacket => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_PublicKeyPacket>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            OpenpgpMessage_PacketTags::SignaturePacket => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_SignaturePacket>(&_t_body_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            OpenpgpMessage_PacketTags::UserIdPacket => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_UserIdPacket>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(self_rc.len() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl OpenpgpMessage_OldPacket {
}
impl OpenpgpMessage_OldPacket {
    pub fn len(&self) -> usize {
        self.len.borrow().as_ref().unwrap().into()
    }
    pub fn len_enum(&self) -> Ref<'_, Option<OpenpgpMessage_OldPacket_Len>> {
        self.len.borrow()
    }
}
impl OpenpgpMessage_OldPacket {
    pub fn body(&self) -> Ref<'_, Option<OpenpgpMessage_OldPacket_Body>> {
        self.body.borrow()
    }
}
impl OpenpgpMessage_OldPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl OpenpgpMessage_OldPacket {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_Packet {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage>,
    pub _self: SharedType<Self>,
    one: RefCell<bool>,
    new_packet_format: RefCell<bool>,
    packet_type_new: RefCell<OpenpgpMessage_PacketTags>,
    packet_type_old: RefCell<OpenpgpMessage_PacketTags>,
    len_type: RefCell<u64>,
    body: RefCell<Option<OpenpgpMessage_Packet_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum OpenpgpMessage_Packet_Body {
    OpenpgpMessage_OldPacket(OptRc<OpenpgpMessage_OldPacket>),
}
impl From<&OpenpgpMessage_Packet_Body> for OptRc<OpenpgpMessage_OldPacket> {
    fn from(v: &OpenpgpMessage_Packet_Body) -> Self {
        if let OpenpgpMessage_Packet_Body::OpenpgpMessage_OldPacket(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Packet_Body::OpenpgpMessage_OldPacket, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_OldPacket>> for OpenpgpMessage_Packet_Body {
    fn from(v: OptRc<OpenpgpMessage_OldPacket>) -> Self {
        Self::OpenpgpMessage_OldPacket(v)
    }
}
impl OpenpgpMessage_Packet_Body {
    pub fn len(&self) -> Ref<'_, Option<OpenpgpMessage_Packet_Len>> {
        match self {
            OpenpgpMessage_Packet_Body::OpenpgpMessage_OldPacket(x) => x.len.borrow(),
        }
    }
}
impl OpenpgpMessage_Packet_Body {
    pub fn body(&self) -> Ref<'_, Option<OpenpgpMessage_Packet_Body>> {
        match self {
            OpenpgpMessage_Packet_Body::OpenpgpMessage_OldPacket(x) => x.body.borrow(),
        }
    }
}
impl KStruct for OpenpgpMessage_Packet {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.one.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.new_packet_format.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        if *self_rc.new_packet_format() {
            *self_rc.packet_type_new.borrow_mut() = (_io.read_bits_int_be(6)? as i64).try_into()?;
        }
        if !(*self_rc.new_packet_format()) {
            *self_rc.packet_type_old.borrow_mut() = (_io.read_bits_int_be(4)? as i64).try_into()?;
        }
        if !(*self_rc.new_packet_format()) {
            *self_rc.len_type.borrow_mut() = _io.read_bits_int_be(2)?;
        }
        _io.align_to_byte()?;
        {
            let on = self_rc.new_packet_format();
            if *on == false {
                let t = Self::read_into::<_, OpenpgpMessage_OldPacket>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
        }
        Ok(())
    }
}
impl OpenpgpMessage_Packet {
}
impl OpenpgpMessage_Packet {
    pub fn one(&self) -> Ref<'_, bool> {
        self.one.borrow()
    }
}
impl OpenpgpMessage_Packet {
    pub fn new_packet_format(&self) -> Ref<'_, bool> {
        self.new_packet_format.borrow()
    }
}
impl OpenpgpMessage_Packet {
    pub fn packet_type_new(&self) -> Ref<'_, OpenpgpMessage_PacketTags> {
        self.packet_type_new.borrow()
    }
}
impl OpenpgpMessage_Packet {
    pub fn packet_type_old(&self) -> Ref<'_, OpenpgpMessage_PacketTags> {
        self.packet_type_old.borrow()
    }
}
impl OpenpgpMessage_Packet {
    pub fn len_type(&self) -> Ref<'_, u64> {
        self.len_type.borrow()
    }
}
impl OpenpgpMessage_Packet {
    pub fn body(&self) -> Ref<'_, Option<OpenpgpMessage_Packet_Body>> {
        self.body.borrow()
    }
}
impl OpenpgpMessage_Packet {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_PolicyUri {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    uri: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_PolicyUri {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.uri.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl OpenpgpMessage_PolicyUri {
}
impl OpenpgpMessage_PolicyUri {
    pub fn uri(&self) -> Ref<'_, String> {
        self.uri.borrow()
    }
}
impl OpenpgpMessage_PolicyUri {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_PreferredCompressionAlgorithms {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    algorithm: RefCell<Vec<OpenpgpMessage_CompressionAlgorithms>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_PreferredCompressionAlgorithms {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.algorithm.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.algorithm.borrow_mut().push((_io.read_u1()? as i64).try_into()?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl OpenpgpMessage_PreferredCompressionAlgorithms {
}
impl OpenpgpMessage_PreferredCompressionAlgorithms {
    pub fn algorithm(&self) -> Ref<'_, Vec<OpenpgpMessage_CompressionAlgorithms>> {
        self.algorithm.borrow()
    }
}
impl OpenpgpMessage_PreferredCompressionAlgorithms {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_PreferredHashAlgorithms {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    algorithm: RefCell<Vec<OpenpgpMessage_HashAlgorithms>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_PreferredHashAlgorithms {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.algorithm.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.algorithm.borrow_mut().push((_io.read_u1()? as i64).try_into()?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl OpenpgpMessage_PreferredHashAlgorithms {
}
impl OpenpgpMessage_PreferredHashAlgorithms {
    pub fn algorithm(&self) -> Ref<'_, Vec<OpenpgpMessage_HashAlgorithms>> {
        self.algorithm.borrow()
    }
}
impl OpenpgpMessage_PreferredHashAlgorithms {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_PreferredKeyServer {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    uri: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_PreferredKeyServer {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.uri.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl OpenpgpMessage_PreferredKeyServer {
}
impl OpenpgpMessage_PreferredKeyServer {
    pub fn uri(&self) -> Ref<'_, String> {
        self.uri.borrow()
    }
}
impl OpenpgpMessage_PreferredKeyServer {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_PrimaryUserId {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    user_id: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_PrimaryUserId {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.user_id.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_PrimaryUserId {
}
impl OpenpgpMessage_PrimaryUserId {
    pub fn user_id(&self) -> Ref<'_, u8> {
        self.user_id.borrow()
    }
}
impl OpenpgpMessage_PrimaryUserId {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_PublicKeyPacket {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    version: RefCell<u8>,
    timestamp: RefCell<u32>,
    public_key_algorithm: RefCell<OpenpgpMessage_PublicKeyAlgorithms>,
    len_alg: RefCell<u16>,
    rsa_n: RefCell<Vec<u8>>,
    padding: RefCell<u16>,
    rsa_e: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_PublicKeyPacket {
    type Root = OpenpgpMessage;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.timestamp.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.public_key_algorithm.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.len_alg.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.rsa_n.borrow_mut() = _io.read_bytes(((*self_rc.len_alg() as u16) / (8 as u16)) as usize)?.into();
        *self_rc.padding.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.rsa_e.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        Ok(())
    }
}
impl OpenpgpMessage_PublicKeyPacket {
}
impl OpenpgpMessage_PublicKeyPacket {
    pub fn version(&self) -> Ref<'_, u8> {
        self.version.borrow()
    }
}
impl OpenpgpMessage_PublicKeyPacket {
    pub fn timestamp(&self) -> Ref<'_, u32> {
        self.timestamp.borrow()
    }
}
impl OpenpgpMessage_PublicKeyPacket {
    pub fn public_key_algorithm(&self) -> Ref<'_, OpenpgpMessage_PublicKeyAlgorithms> {
        self.public_key_algorithm.borrow()
    }
}
impl OpenpgpMessage_PublicKeyPacket {
    pub fn len_alg(&self) -> Ref<'_, u16> {
        self.len_alg.borrow()
    }
}
impl OpenpgpMessage_PublicKeyPacket {
    pub fn rsa_n(&self) -> Ref<'_, Vec<u8>> {
        self.rsa_n.borrow()
    }
}
impl OpenpgpMessage_PublicKeyPacket {
    pub fn padding(&self) -> Ref<'_, u16> {
        self.padding.borrow()
    }
}
impl OpenpgpMessage_PublicKeyPacket {
    pub fn rsa_e(&self) -> Ref<'_, Vec<u8>> {
        self.rsa_e.borrow()
    }
}
impl OpenpgpMessage_PublicKeyPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_ReasonForRevocation {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    revocation_code: RefCell<OpenpgpMessage_RevocationCodes>,
    reason: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_ReasonForRevocation {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.revocation_code.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.reason.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl OpenpgpMessage_ReasonForRevocation {
}
impl OpenpgpMessage_ReasonForRevocation {
    pub fn revocation_code(&self) -> Ref<'_, OpenpgpMessage_RevocationCodes> {
        self.revocation_code.borrow()
    }
}
impl OpenpgpMessage_ReasonForRevocation {
    pub fn reason(&self) -> Ref<'_, String> {
        self.reason.borrow()
    }
}
impl OpenpgpMessage_ReasonForRevocation {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_RegularExpression {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    regex: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_RegularExpression {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.regex.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl OpenpgpMessage_RegularExpression {
}
impl OpenpgpMessage_RegularExpression {
    pub fn regex(&self) -> Ref<'_, String> {
        self.regex.borrow()
    }
}
impl OpenpgpMessage_RegularExpression {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_Revocable {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    revocable: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_Revocable {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.revocable.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_Revocable {
}
impl OpenpgpMessage_Revocable {
    pub fn revocable(&self) -> Ref<'_, u8> {
        self.revocable.borrow()
    }
}
impl OpenpgpMessage_Revocable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_RevocationKey {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    class: RefCell<u8>,
    public_key_algorithm: RefCell<OpenpgpMessage_PublicKeyAlgorithms>,
    fingerprint: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_RevocationKey {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.class.borrow_mut() = _io.read_u1()?.into();
        *self_rc.public_key_algorithm.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.fingerprint.borrow_mut() = _io.read_bytes(20 as usize)?.into();
        Ok(())
    }
}
impl OpenpgpMessage_RevocationKey {
}
impl OpenpgpMessage_RevocationKey {
    pub fn class(&self) -> Ref<'_, u8> {
        self.class.borrow()
    }
}
impl OpenpgpMessage_RevocationKey {
    pub fn public_key_algorithm(&self) -> Ref<'_, OpenpgpMessage_PublicKeyAlgorithms> {
        self.public_key_algorithm.borrow()
    }
}
impl OpenpgpMessage_RevocationKey {
    pub fn fingerprint(&self) -> Ref<'_, Vec<u8>> {
        self.fingerprint.borrow()
    }
}
impl OpenpgpMessage_RevocationKey {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_SecretKeyPacket {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_OldPacket>,
    pub _self: SharedType<Self>,
    public_key: RefCell<OptRc<OpenpgpMessage_PublicKeyPacket>>,
    string_to_key: RefCell<u8>,
    symmetric_encryption_algorithm: RefCell<OpenpgpMessage_SymmetricKeyAlgorithm>,
    secret_key: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_SecretKeyPacket {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_OldPacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, OpenpgpMessage_PublicKeyPacket>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.public_key.borrow_mut() = t;
        *self_rc.string_to_key.borrow_mut() = _io.read_u1()?.into();
        if *self_rc.string_to_key() >= 254 {
            *self_rc.symmetric_encryption_algorithm.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        }
        *self_rc.secret_key.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_SecretKeyPacket {
}
impl OpenpgpMessage_SecretKeyPacket {
    pub fn public_key(&self) -> Ref<'_, OptRc<OpenpgpMessage_PublicKeyPacket>> {
        self.public_key.borrow()
    }
}
impl OpenpgpMessage_SecretKeyPacket {
    pub fn string_to_key(&self) -> Ref<'_, u8> {
        self.string_to_key.borrow()
    }
}
impl OpenpgpMessage_SecretKeyPacket {
    pub fn symmetric_encryption_algorithm(&self) -> Ref<'_, OpenpgpMessage_SymmetricKeyAlgorithm> {
        self.symmetric_encryption_algorithm.borrow()
    }
}
impl OpenpgpMessage_SecretKeyPacket {
    pub fn secret_key(&self) -> Ref<'_, Vec<u8>> {
        self.secret_key.borrow()
    }
}
impl OpenpgpMessage_SecretKeyPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_SignatureCreationTime {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    time: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_SignatureCreationTime {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.time.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_SignatureCreationTime {
}
impl OpenpgpMessage_SignatureCreationTime {
    pub fn time(&self) -> Ref<'_, u32> {
        self.time.borrow()
    }
}
impl OpenpgpMessage_SignatureCreationTime {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_SignatureExpirationTime {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    time: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_SignatureExpirationTime {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.time.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_SignatureExpirationTime {
}
impl OpenpgpMessage_SignatureExpirationTime {
    pub fn time(&self) -> Ref<'_, u32> {
        self.time.borrow()
    }
}
impl OpenpgpMessage_SignatureExpirationTime {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_SignaturePacket {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    version: RefCell<u8>,
    signature_type: RefCell<u8>,
    public_key_algorithm: RefCell<OpenpgpMessage_PublicKeyAlgorithms>,
    hash_algorithm: RefCell<OpenpgpMessage_HashAlgorithms>,
    len_hashed_subpacket: RefCell<u16>,
    hashed_subpackets: RefCell<OptRc<OpenpgpMessage_Subpackets>>,
    len_unhashed_subpacket: RefCell<u16>,
    unhashed_subpackets: RefCell<OptRc<OpenpgpMessage_Subpackets>>,
    left_signed_hash: RefCell<u16>,
    rsa_n: RefCell<u16>,
    signature: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    hashed_subpackets_raw: RefCell<Vec<u8>>,
    unhashed_subpackets_raw: RefCell<Vec<u8>>,
}
impl KStruct for OpenpgpMessage_SignaturePacket {
    type Root = OpenpgpMessage;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.signature_type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.public_key_algorithm.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.hash_algorithm.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.len_hashed_subpacket.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.hashed_subpackets_raw.borrow_mut() = _io.read_bytes(*self_rc.len_hashed_subpacket() as usize)?.into();
        let hashed_subpackets_raw = self_rc.hashed_subpackets_raw.borrow();
        let _t_hashed_subpackets_raw_io = BytesReader::from(hashed_subpackets_raw.clone());
        let t = Self::read_into::<BytesReader, OpenpgpMessage_Subpackets>(&_t_hashed_subpackets_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.hashed_subpackets.borrow_mut() = t;
        *self_rc.len_unhashed_subpacket.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.unhashed_subpackets_raw.borrow_mut() = _io.read_bytes(*self_rc.len_unhashed_subpacket() as usize)?.into();
        let unhashed_subpackets_raw = self_rc.unhashed_subpackets_raw.borrow();
        let _t_unhashed_subpackets_raw_io = BytesReader::from(unhashed_subpackets_raw.clone());
        let t = Self::read_into::<BytesReader, OpenpgpMessage_Subpackets>(&_t_unhashed_subpackets_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.unhashed_subpackets.borrow_mut() = t;
        *self_rc.left_signed_hash.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.rsa_n.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.signature.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_SignaturePacket {
}
impl OpenpgpMessage_SignaturePacket {
    pub fn version(&self) -> Ref<'_, u8> {
        self.version.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn signature_type(&self) -> Ref<'_, u8> {
        self.signature_type.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn public_key_algorithm(&self) -> Ref<'_, OpenpgpMessage_PublicKeyAlgorithms> {
        self.public_key_algorithm.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn hash_algorithm(&self) -> Ref<'_, OpenpgpMessage_HashAlgorithms> {
        self.hash_algorithm.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn len_hashed_subpacket(&self) -> Ref<'_, u16> {
        self.len_hashed_subpacket.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn hashed_subpackets(&self) -> Ref<'_, OptRc<OpenpgpMessage_Subpackets>> {
        self.hashed_subpackets.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn len_unhashed_subpacket(&self) -> Ref<'_, u16> {
        self.len_unhashed_subpacket.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn unhashed_subpackets(&self) -> Ref<'_, OptRc<OpenpgpMessage_Subpackets>> {
        self.unhashed_subpackets.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn left_signed_hash(&self) -> Ref<'_, u16> {
        self.left_signed_hash.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn rsa_n(&self) -> Ref<'_, u16> {
        self.rsa_n.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn hashed_subpackets_raw(&self) -> Ref<'_, Vec<u8>> {
        self.hashed_subpackets_raw.borrow()
    }
}
impl OpenpgpMessage_SignaturePacket {
    pub fn unhashed_subpackets_raw(&self) -> Ref<'_, Vec<u8>> {
        self.unhashed_subpackets_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_SignatureTarget {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    public_key_algorithm: RefCell<OpenpgpMessage_PublicKeyAlgorithms>,
    hash_algorithm: RefCell<OpenpgpMessage_HashAlgorithms>,
    hash: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_SignatureTarget {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.public_key_algorithm.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.hash_algorithm.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.hash.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_SignatureTarget {
}
impl OpenpgpMessage_SignatureTarget {
    pub fn public_key_algorithm(&self) -> Ref<'_, OpenpgpMessage_PublicKeyAlgorithms> {
        self.public_key_algorithm.borrow()
    }
}
impl OpenpgpMessage_SignatureTarget {
    pub fn hash_algorithm(&self) -> Ref<'_, OpenpgpMessage_HashAlgorithms> {
        self.hash_algorithm.borrow()
    }
}
impl OpenpgpMessage_SignatureTarget {
    pub fn hash(&self) -> Ref<'_, Vec<u8>> {
        self.hash.borrow()
    }
}
impl OpenpgpMessage_SignatureTarget {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_SignersUserId {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    user_id: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_SignersUserId {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.user_id.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl OpenpgpMessage_SignersUserId {
}
impl OpenpgpMessage_SignersUserId {
    pub fn user_id(&self) -> Ref<'_, String> {
        self.user_id.borrow()
    }
}
impl OpenpgpMessage_SignersUserId {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_Subpacket {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpackets>,
    pub _self: SharedType<Self>,
    len: RefCell<OptRc<OpenpgpMessage_LenSubpacket>>,
    subpacket_type: RefCell<OpenpgpMessage_SubpacketTypes>,
    content: RefCell<Option<OpenpgpMessage_Subpacket_Content>>,
    _io: RefCell<BytesReader>,
    content_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum OpenpgpMessage_Subpacket_Content {
    OpenpgpMessage_RegularExpression(OptRc<OpenpgpMessage_RegularExpression>),
    OpenpgpMessage_PreferredHashAlgorithms(OptRc<OpenpgpMessage_PreferredHashAlgorithms>),
    OpenpgpMessage_SignatureExpirationTime(OptRc<OpenpgpMessage_SignatureExpirationTime>),
    OpenpgpMessage_SignersUserId(OptRc<OpenpgpMessage_SignersUserId>),
    OpenpgpMessage_KeyServerPreferences(OptRc<OpenpgpMessage_KeyServerPreferences>),
    Bytes(Vec<u8>),
    OpenpgpMessage_NotationData(OptRc<OpenpgpMessage_NotationData>),
    OpenpgpMessage_PrimaryUserId(OptRc<OpenpgpMessage_PrimaryUserId>),
    OpenpgpMessage_PreferredCompressionAlgorithms(OptRc<OpenpgpMessage_PreferredCompressionAlgorithms>),
    OpenpgpMessage_RevocationKey(OptRc<OpenpgpMessage_RevocationKey>),
    OpenpgpMessage_SignatureTarget(OptRc<OpenpgpMessage_SignatureTarget>),
    OpenpgpMessage_Issuer(OptRc<OpenpgpMessage_Issuer>),
    OpenpgpMessage_KeyFlags(OptRc<OpenpgpMessage_KeyFlags>),
    OpenpgpMessage_TrustSignature(OptRc<OpenpgpMessage_TrustSignature>),
    OpenpgpMessage_PolicyUri(OptRc<OpenpgpMessage_PolicyUri>),
    OpenpgpMessage_PreferredKeyServer(OptRc<OpenpgpMessage_PreferredKeyServer>),
    OpenpgpMessage_EmbeddedSignature(OptRc<OpenpgpMessage_EmbeddedSignature>),
    OpenpgpMessage_ReasonForRevocation(OptRc<OpenpgpMessage_ReasonForRevocation>),
    OpenpgpMessage_KeyExpirationTime(OptRc<OpenpgpMessage_KeyExpirationTime>),
    OpenpgpMessage_ExportableCertification(OptRc<OpenpgpMessage_ExportableCertification>),
    OpenpgpMessage_Revocable(OptRc<OpenpgpMessage_Revocable>),
    OpenpgpMessage_SignatureCreationTime(OptRc<OpenpgpMessage_SignatureCreationTime>),
    OpenpgpMessage_Features(OptRc<OpenpgpMessage_Features>),
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_RegularExpression> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_RegularExpression(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_RegularExpression, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_RegularExpression>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_RegularExpression>) -> Self {
        Self::OpenpgpMessage_RegularExpression(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_PreferredHashAlgorithms> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_PreferredHashAlgorithms(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_PreferredHashAlgorithms, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_PreferredHashAlgorithms>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_PreferredHashAlgorithms>) -> Self {
        Self::OpenpgpMessage_PreferredHashAlgorithms(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_SignatureExpirationTime> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_SignatureExpirationTime(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_SignatureExpirationTime, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_SignatureExpirationTime>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_SignatureExpirationTime>) -> Self {
        Self::OpenpgpMessage_SignatureExpirationTime(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_SignersUserId> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_SignersUserId(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_SignersUserId, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_SignersUserId>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_SignersUserId>) -> Self {
        Self::OpenpgpMessage_SignersUserId(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_KeyServerPreferences> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_KeyServerPreferences(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_KeyServerPreferences, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_KeyServerPreferences>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_KeyServerPreferences>) -> Self {
        Self::OpenpgpMessage_KeyServerPreferences(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for Vec<u8> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_NotationData> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_NotationData(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_NotationData, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_NotationData>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_NotationData>) -> Self {
        Self::OpenpgpMessage_NotationData(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_PrimaryUserId> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_PrimaryUserId(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_PrimaryUserId, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_PrimaryUserId>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_PrimaryUserId>) -> Self {
        Self::OpenpgpMessage_PrimaryUserId(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_PreferredCompressionAlgorithms> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_PreferredCompressionAlgorithms(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_PreferredCompressionAlgorithms, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_PreferredCompressionAlgorithms>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_PreferredCompressionAlgorithms>) -> Self {
        Self::OpenpgpMessage_PreferredCompressionAlgorithms(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_RevocationKey> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_RevocationKey(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_RevocationKey, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_RevocationKey>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_RevocationKey>) -> Self {
        Self::OpenpgpMessage_RevocationKey(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_SignatureTarget> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_SignatureTarget(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_SignatureTarget, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_SignatureTarget>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_SignatureTarget>) -> Self {
        Self::OpenpgpMessage_SignatureTarget(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_Issuer> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_Issuer(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_Issuer, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_Issuer>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_Issuer>) -> Self {
        Self::OpenpgpMessage_Issuer(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_KeyFlags> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_KeyFlags(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_KeyFlags, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_KeyFlags>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_KeyFlags>) -> Self {
        Self::OpenpgpMessage_KeyFlags(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_TrustSignature> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_TrustSignature(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_TrustSignature, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_TrustSignature>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_TrustSignature>) -> Self {
        Self::OpenpgpMessage_TrustSignature(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_PolicyUri> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_PolicyUri(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_PolicyUri, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_PolicyUri>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_PolicyUri>) -> Self {
        Self::OpenpgpMessage_PolicyUri(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_PreferredKeyServer> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_PreferredKeyServer(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_PreferredKeyServer, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_PreferredKeyServer>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_PreferredKeyServer>) -> Self {
        Self::OpenpgpMessage_PreferredKeyServer(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_EmbeddedSignature> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_EmbeddedSignature(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_EmbeddedSignature, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_EmbeddedSignature>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_EmbeddedSignature>) -> Self {
        Self::OpenpgpMessage_EmbeddedSignature(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_ReasonForRevocation> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_ReasonForRevocation(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_ReasonForRevocation, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_ReasonForRevocation>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_ReasonForRevocation>) -> Self {
        Self::OpenpgpMessage_ReasonForRevocation(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_KeyExpirationTime> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_KeyExpirationTime(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_KeyExpirationTime, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_KeyExpirationTime>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_KeyExpirationTime>) -> Self {
        Self::OpenpgpMessage_KeyExpirationTime(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_ExportableCertification> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_ExportableCertification(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_ExportableCertification, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_ExportableCertification>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_ExportableCertification>) -> Self {
        Self::OpenpgpMessage_ExportableCertification(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_Revocable> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_Revocable(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_Revocable, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_Revocable>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_Revocable>) -> Self {
        Self::OpenpgpMessage_Revocable(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_SignatureCreationTime> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_SignatureCreationTime(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_SignatureCreationTime, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_SignatureCreationTime>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_SignatureCreationTime>) -> Self {
        Self::OpenpgpMessage_SignatureCreationTime(v)
    }
}
impl From<&OpenpgpMessage_Subpacket_Content> for OptRc<OpenpgpMessage_Features> {
    fn from(v: &OpenpgpMessage_Subpacket_Content) -> Self {
        if let OpenpgpMessage_Subpacket_Content::OpenpgpMessage_Features(x) = v {
            return x.clone();
        }
        panic!("expected OpenpgpMessage_Subpacket_Content::OpenpgpMessage_Features, got {:?}", v)
    }
}
impl From<OptRc<OpenpgpMessage_Features>> for OpenpgpMessage_Subpacket_Content {
    fn from(v: OptRc<OpenpgpMessage_Features>) -> Self {
        Self::OpenpgpMessage_Features(v)
    }
}
impl KStruct for OpenpgpMessage_Subpacket {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpackets;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, OpenpgpMessage_LenSubpacket>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.len.borrow_mut() = t;
        *self_rc.subpacket_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        match *self_rc.subpacket_type() {
            OpenpgpMessage_SubpacketTypes::EmbeddedSignature => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_EmbeddedSignature>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::ExportableCertification => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_ExportableCertification>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::Features => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_Features>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::Issuer => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_Issuer>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::KeyExpirationTime => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_KeyExpirationTime>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::KeyFlags => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_KeyFlags>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::KeyServerPreferences => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_KeyServerPreferences>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::NotationData => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_NotationData>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::PolicyUri => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_PolicyUri>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::PreferredCompressionAlgorithms => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_PreferredCompressionAlgorithms>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::PreferredHashAlgorithms => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_PreferredHashAlgorithms>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::PreferredKeyServer => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_PreferredKeyServer>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::PrimaryUserId => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_PrimaryUserId>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::ReasonForRevocation => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_ReasonForRevocation>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::RegularExpression => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_RegularExpression>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::Revocable => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_Revocable>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::RevocationKey => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_RevocationKey>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::SignatureCreationTime => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_SignatureCreationTime>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::SignatureExpirationTime => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_SignatureExpirationTime>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::SignatureTarget => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_SignatureTarget>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::SignersUserId => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_SignersUserId>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            OpenpgpMessage_SubpacketTypes::TrustSignature => {
                *self_rc.content_raw.borrow_mut() = _io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, OpenpgpMessage_TrustSignature>(&_t_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.content.borrow_mut() = Some(_io.read_bytes(((*self_rc.len().len()? as i32) - (1 as i32)) as usize)?.into());
            }
        }
        Ok(())
    }
}
impl OpenpgpMessage_Subpacket {
}
impl OpenpgpMessage_Subpacket {
    pub fn len(&self) -> Ref<'_, OptRc<OpenpgpMessage_LenSubpacket>> {
        self.len.borrow()
    }
}
impl OpenpgpMessage_Subpacket {
    pub fn subpacket_type(&self) -> Ref<'_, OpenpgpMessage_SubpacketTypes> {
        self.subpacket_type.borrow()
    }
}
impl OpenpgpMessage_Subpacket {
    pub fn content(&self) -> Ref<'_, Option<OpenpgpMessage_Subpacket_Content>> {
        self.content.borrow()
    }
}
impl OpenpgpMessage_Subpacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl OpenpgpMessage_Subpacket {
    pub fn content_raw(&self) -> Ref<'_, Vec<u8>> {
        self.content_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_Subpackets {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_SignaturePacket>,
    pub _self: SharedType<Self>,
    subpacketss: RefCell<Vec<OptRc<OpenpgpMessage_Subpacket>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_Subpackets {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_SignaturePacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.subpacketss.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, OpenpgpMessage_Subpacket>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.subpacketss.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl OpenpgpMessage_Subpackets {
}
impl OpenpgpMessage_Subpackets {
    pub fn subpacketss(&self) -> Ref<'_, Vec<OptRc<OpenpgpMessage_Subpacket>>> {
        self.subpacketss.borrow()
    }
}
impl OpenpgpMessage_Subpackets {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_TrustSignature {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_Subpacket>,
    pub _self: SharedType<Self>,
    level: RefCell<u8>,
    amount: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_TrustSignature {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_Subpacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.level.borrow_mut() = _io.read_u1()?.into();
        *self_rc.amount.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl OpenpgpMessage_TrustSignature {
}
impl OpenpgpMessage_TrustSignature {
    pub fn level(&self) -> Ref<'_, u8> {
        self.level.borrow()
    }
}
impl OpenpgpMessage_TrustSignature {
    pub fn amount(&self) -> Ref<'_, u8> {
        self.amount.borrow()
    }
}
impl OpenpgpMessage_TrustSignature {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct OpenpgpMessage_UserIdPacket {
    pub _root: SharedType<OpenpgpMessage>,
    pub _parent: SharedType<OpenpgpMessage_OldPacket>,
    pub _self: SharedType<Self>,
    user_id: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for OpenpgpMessage_UserIdPacket {
    type Root = OpenpgpMessage;
    type Parent = OpenpgpMessage_OldPacket;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.user_id.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl OpenpgpMessage_UserIdPacket {
}
impl OpenpgpMessage_UserIdPacket {
    pub fn user_id(&self) -> Ref<'_, String> {
        self.user_id.borrow()
    }
}
impl OpenpgpMessage_UserIdPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
