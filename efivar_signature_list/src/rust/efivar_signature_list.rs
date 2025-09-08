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
 * Parse UEFI variables db and dbx that contain signatures, certificates and
 * hashes. On a Linux system using UEFI, these variables are readable from:
 * 
 * ```
 * /sys/firmware/efi/efivars/db-d719b2cb-3d3a-4596-a3bc-dad00e67656f
 * /sys/firmware/efi/efivars/dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c
 * /sys/firmware/efi/efivars/dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f
 * /sys/firmware/efi/efivars/dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c
 * ```
 * 
 * Note:
 * 
 * * `d719b2cb-3d3a-4596-a3bc-dad00e67656f` is defined as `EFI_IMAGE_SECURITY_DATABASE_GUID`
 * * `8be4df61-93ca-11d2-aa0d-00e098032b8c` is defined as `EFI_GLOBAL_VARIABLE`
 * 
 * Each file contains an EFI attribute (32-bit integer) followed by a list of
 * `EFI_SIGNATURE_LIST` structures.
 * \sa https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct EfivarSignatureList {
    pub _root: SharedType<EfivarSignatureList>,
    pub _parent: SharedType<EfivarSignatureList>,
    pub _self: SharedType<Self>,
    var_attributes: RefCell<OptRc<EfivarSignatureList_EfiVarAttr>>,
    signatures: RefCell<Vec<OptRc<EfivarSignatureList_SignatureList>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for EfivarSignatureList {
    type Root = EfivarSignatureList;
    type Parent = EfivarSignatureList;

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
        let t = Self::read_into::<_, EfivarSignatureList_EfiVarAttr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.var_attributes.borrow_mut() = t;
        *self_rc.signatures.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, EfivarSignatureList_SignatureList>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.signatures.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl EfivarSignatureList {
}

/**
 * Attributes of the UEFI variable
 */
impl EfivarSignatureList {
    pub fn var_attributes(&self) -> Ref<'_, OptRc<EfivarSignatureList_EfiVarAttr>> {
        self.var_attributes.borrow()
    }
}
impl EfivarSignatureList {
    pub fn signatures(&self) -> Ref<'_, Vec<OptRc<EfivarSignatureList_SignatureList>>> {
        self.signatures.borrow()
    }
}
impl EfivarSignatureList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Attributes of a UEFI variable
 */

#[derive(Default, Debug, Clone)]
pub struct EfivarSignatureList_EfiVarAttr {
    pub _root: SharedType<EfivarSignatureList>,
    pub _parent: SharedType<EfivarSignatureList>,
    pub _self: SharedType<Self>,
    enhanced_authenticated_access: RefCell<bool>,
    append_write: RefCell<bool>,
    time_based_authenticated_write_access: RefCell<bool>,
    authenticated_write_access: RefCell<bool>,
    hardware_error_record: RefCell<bool>,
    runtime_access: RefCell<bool>,
    bootservice_access: RefCell<bool>,
    non_volatile: RefCell<bool>,
    reserved1: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for EfivarSignatureList_EfiVarAttr {
    type Root = EfivarSignatureList;
    type Parent = EfivarSignatureList;

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
        *self_rc.enhanced_authenticated_access.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.append_write.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.time_based_authenticated_write_access.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.authenticated_write_access.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.hardware_error_record.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.runtime_access.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.bootservice_access.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.non_volatile.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved1.borrow_mut() = _io.read_bits_int_be(24)?;
        Ok(())
    }
}
impl EfivarSignatureList_EfiVarAttr {
}
impl EfivarSignatureList_EfiVarAttr {
    pub fn enhanced_authenticated_access(&self) -> Ref<'_, bool> {
        self.enhanced_authenticated_access.borrow()
    }
}
impl EfivarSignatureList_EfiVarAttr {
    pub fn append_write(&self) -> Ref<'_, bool> {
        self.append_write.borrow()
    }
}
impl EfivarSignatureList_EfiVarAttr {
    pub fn time_based_authenticated_write_access(&self) -> Ref<'_, bool> {
        self.time_based_authenticated_write_access.borrow()
    }
}
impl EfivarSignatureList_EfiVarAttr {
    pub fn authenticated_write_access(&self) -> Ref<'_, bool> {
        self.authenticated_write_access.borrow()
    }
}
impl EfivarSignatureList_EfiVarAttr {
    pub fn hardware_error_record(&self) -> Ref<'_, bool> {
        self.hardware_error_record.borrow()
    }
}
impl EfivarSignatureList_EfiVarAttr {
    pub fn runtime_access(&self) -> Ref<'_, bool> {
        self.runtime_access.borrow()
    }
}
impl EfivarSignatureList_EfiVarAttr {
    pub fn bootservice_access(&self) -> Ref<'_, bool> {
        self.bootservice_access.borrow()
    }
}
impl EfivarSignatureList_EfiVarAttr {
    pub fn non_volatile(&self) -> Ref<'_, bool> {
        self.non_volatile.borrow()
    }
}

/**
 * Reserved (unused) bits
 */
impl EfivarSignatureList_EfiVarAttr {
    pub fn reserved1(&self) -> Ref<'_, u64> {
        self.reserved1.borrow()
    }
}
impl EfivarSignatureList_EfiVarAttr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa EFI_SIGNATURE_DATA
 */

#[derive(Default, Debug, Clone)]
pub struct EfivarSignatureList_SignatureData {
    pub _root: SharedType<EfivarSignatureList>,
    pub _parent: SharedType<EfivarSignatureList_SignatureList>,
    pub _self: SharedType<Self>,
    owner: RefCell<Vec<u8>>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for EfivarSignatureList_SignatureData {
    type Root = EfivarSignatureList;
    type Parent = EfivarSignatureList_SignatureList;

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
        *self_rc.owner.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl EfivarSignatureList_SignatureData {
}

/**
 * An identifier which identifies the agent which added the signature to the list
 */
impl EfivarSignatureList_SignatureData {
    pub fn owner(&self) -> Ref<'_, Vec<u8>> {
        self.owner.borrow()
    }
}

/**
 * The format of the signature is defined by the SignatureType.
 */
impl EfivarSignatureList_SignatureData {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl EfivarSignatureList_SignatureData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa EFI_SIGNATURE_LIST
 */

#[derive(Default, Debug, Clone)]
pub struct EfivarSignatureList_SignatureList {
    pub _root: SharedType<EfivarSignatureList>,
    pub _parent: SharedType<EfivarSignatureList>,
    pub _self: SharedType<Self>,
    signature_type: RefCell<Vec<u8>>,
    len_signature_list: RefCell<u32>,
    len_signature_header: RefCell<u32>,
    len_signature: RefCell<u32>,
    header: RefCell<Vec<u8>>,
    signatures: RefCell<Vec<OptRc<EfivarSignatureList_SignatureData>>>,
    _io: RefCell<BytesReader>,
    signatures_raw: RefCell<Vec<Vec<u8>>>,
    f_is_cert_der_pkcs7: Cell<bool>,
    is_cert_der_pkcs7: RefCell<bool>,
    f_is_cert_rsa2048_key: Cell<bool>,
    is_cert_rsa2048_key: RefCell<bool>,
    f_is_cert_rsa2048_sha1: Cell<bool>,
    is_cert_rsa2048_sha1: RefCell<bool>,
    f_is_cert_rsa2048_sha256: Cell<bool>,
    is_cert_rsa2048_sha256: RefCell<bool>,
    f_is_cert_sha1: Cell<bool>,
    is_cert_sha1: RefCell<bool>,
    f_is_cert_sha224: Cell<bool>,
    is_cert_sha224: RefCell<bool>,
    f_is_cert_sha256: Cell<bool>,
    is_cert_sha256: RefCell<bool>,
    f_is_cert_sha256_x509: Cell<bool>,
    is_cert_sha256_x509: RefCell<bool>,
    f_is_cert_sha384: Cell<bool>,
    is_cert_sha384: RefCell<bool>,
    f_is_cert_sha384_x509: Cell<bool>,
    is_cert_sha384_x509: RefCell<bool>,
    f_is_cert_sha512: Cell<bool>,
    is_cert_sha512: RefCell<bool>,
    f_is_cert_sha512_x509: Cell<bool>,
    is_cert_sha512_x509: RefCell<bool>,
    f_is_cert_x509: Cell<bool>,
    is_cert_x509: RefCell<bool>,
}
impl KStruct for EfivarSignatureList_SignatureList {
    type Root = EfivarSignatureList;
    type Parent = EfivarSignatureList;

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
        *self_rc.signature_type.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.len_signature_list.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_signature_header.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_signature.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.header.borrow_mut() = _io.read_bytes(*self_rc.len_signature_header() as usize)?.into();
        if ((*self_rc.len_signature() as u32) > (0 as u32)) {
            *self_rc.signatures_raw.borrow_mut() = Vec::new();
            *self_rc.signatures.borrow_mut() = Vec::new();
            let l_signatures = ((((((*self_rc.len_signature_list() as u32) - (*self_rc.len_signature_header() as u32)) as i32) - (28 as i32)) as i32) / (*self_rc.len_signature() as i32));
            for _i in 0..l_signatures {
                self_rc.signatures_raw.borrow_mut().push(_io.read_bytes(*self_rc.len_signature() as usize)?.into());
                let signatures_raw = self_rc.signatures_raw.borrow();
                let io_signatures_raw = BytesReader::from(signatures_raw.last().unwrap().clone());
                let t = Self::read_into::<BytesReader, EfivarSignatureList_SignatureData>(&io_signatures_raw, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.signatures.borrow_mut().push(t);
            }
        }
        Ok(())
    }
}
impl EfivarSignatureList_SignatureList {

    /**
     * DER-encoded PKCS #7 version 1.5 [RFC2315]
     * \sa EFI_CERT_TYPE_PKCS7_GUID
     */
    pub fn is_cert_der_pkcs7(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_der_pkcs7.get() {
            return Ok(self.is_cert_der_pkcs7.borrow());
        }
        self.f_is_cert_der_pkcs7.set(true);
        *self.is_cert_der_pkcs7.borrow_mut() = (*self.signature_type() == vec![0x9du8, 0xd2u8, 0xafu8, 0x4au8, 0xdfu8, 0x68u8, 0xeeu8, 0x49u8, 0x8au8, 0xa9u8, 0x34u8, 0x7du8, 0x37u8, 0x56u8, 0x65u8, 0xa7u8]) as bool;
        Ok(self.is_cert_der_pkcs7.borrow())
    }

    /**
     * RSA-2048 key (only the modulus since the public key exponent is known to be 0x10001)
     * \sa EFI_CERT_RSA2048_GUID
     */
    pub fn is_cert_rsa2048_key(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_rsa2048_key.get() {
            return Ok(self.is_cert_rsa2048_key.borrow());
        }
        self.f_is_cert_rsa2048_key.set(true);
        *self.is_cert_rsa2048_key.borrow_mut() = (*self.signature_type() == vec![0xe8u8, 0x66u8, 0x57u8, 0x3cu8, 0x9cu8, 0x26u8, 0x34u8, 0x4eu8, 0xaau8, 0x14u8, 0xedu8, 0x77u8, 0x6eu8, 0x85u8, 0xb3u8, 0xb6u8]) as bool;
        Ok(self.is_cert_rsa2048_key.borrow())
    }

    /**
     * RSA-2048 signature of a SHA-1 hash
     * \sa EFI_CERT_RSA2048_SHA1_GUID
     */
    pub fn is_cert_rsa2048_sha1(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_rsa2048_sha1.get() {
            return Ok(self.is_cert_rsa2048_sha1.borrow());
        }
        self.f_is_cert_rsa2048_sha1.set(true);
        *self.is_cert_rsa2048_sha1.borrow_mut() = (*self.signature_type() == vec![0x4fu8, 0x44u8, 0xf8u8, 0x67u8, 0x43u8, 0x87u8, 0xf1u8, 0x48u8, 0xa3u8, 0x28u8, 0x1eu8, 0xaau8, 0xb8u8, 0x73u8, 0x60u8, 0x80u8]) as bool;
        Ok(self.is_cert_rsa2048_sha1.borrow())
    }

    /**
     * RSA-2048 signature of a SHA-256 hash
     * \sa EFI_CERT_RSA2048_SHA256_GUID
     */
    pub fn is_cert_rsa2048_sha256(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_rsa2048_sha256.get() {
            return Ok(self.is_cert_rsa2048_sha256.borrow());
        }
        self.f_is_cert_rsa2048_sha256.set(true);
        *self.is_cert_rsa2048_sha256.borrow_mut() = (*self.signature_type() == vec![0x90u8, 0x61u8, 0xb3u8, 0xe2u8, 0x9bu8, 0x87u8, 0x3du8, 0x4au8, 0xadu8, 0x8du8, 0xf2u8, 0xe7u8, 0xbbu8, 0xa3u8, 0x27u8, 0x84u8]) as bool;
        Ok(self.is_cert_rsa2048_sha256.borrow())
    }

    /**
     * SHA-1 hash
     * \sa EFI_CERT_SHA1_GUID
     */
    pub fn is_cert_sha1(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_sha1.get() {
            return Ok(self.is_cert_sha1.borrow());
        }
        self.f_is_cert_sha1.set(true);
        *self.is_cert_sha1.borrow_mut() = (*self.signature_type() == vec![0x12u8, 0xa5u8, 0x6cu8, 0x82u8, 0x10u8, 0xcfu8, 0xc9u8, 0x4au8, 0xb1u8, 0x87u8, 0xbeu8, 0x1u8, 0x49u8, 0x66u8, 0x31u8, 0xbdu8]) as bool;
        Ok(self.is_cert_sha1.borrow())
    }

    /**
     * SHA-224 hash
     * \sa EFI_CERT_SHA224_GUID
     */
    pub fn is_cert_sha224(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_sha224.get() {
            return Ok(self.is_cert_sha224.borrow());
        }
        self.f_is_cert_sha224.set(true);
        *self.is_cert_sha224.borrow_mut() = (*self.signature_type() == vec![0x33u8, 0x52u8, 0x6eu8, 0xbu8, 0x5cu8, 0xa6u8, 0xc9u8, 0x44u8, 0x94u8, 0x7u8, 0xd9u8, 0xabu8, 0x83u8, 0xbfu8, 0xc8u8, 0xbdu8]) as bool;
        Ok(self.is_cert_sha224.borrow())
    }

    /**
     * SHA-256 hash
     * \sa EFI_CERT_SHA256_GUID
     */
    pub fn is_cert_sha256(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_sha256.get() {
            return Ok(self.is_cert_sha256.borrow());
        }
        self.f_is_cert_sha256.set(true);
        *self.is_cert_sha256.borrow_mut() = (*self.signature_type() == vec![0x26u8, 0x16u8, 0xc4u8, 0xc1u8, 0x4cu8, 0x50u8, 0x92u8, 0x40u8, 0xacu8, 0xa9u8, 0x41u8, 0xf9u8, 0x36u8, 0x93u8, 0x43u8, 0x28u8]) as bool;
        Ok(self.is_cert_sha256.borrow())
    }

    /**
     * SHA256 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
     * \sa EFI_CERT_X509_SHA256_GUID
     */
    pub fn is_cert_sha256_x509(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_sha256_x509.get() {
            return Ok(self.is_cert_sha256_x509.borrow());
        }
        self.f_is_cert_sha256_x509.set(true);
        *self.is_cert_sha256_x509.borrow_mut() = (*self.signature_type() == vec![0x92u8, 0xa4u8, 0xd2u8, 0x3bu8, 0xc0u8, 0x96u8, 0x79u8, 0x40u8, 0xb4u8, 0x20u8, 0xfcu8, 0xf9u8, 0x8eu8, 0xf1u8, 0x3u8, 0xedu8]) as bool;
        Ok(self.is_cert_sha256_x509.borrow())
    }

    /**
     * SHA-384 hash
     * \sa EFI_CERT_SHA384_GUID
     */
    pub fn is_cert_sha384(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_sha384.get() {
            return Ok(self.is_cert_sha384.borrow());
        }
        self.f_is_cert_sha384.set(true);
        *self.is_cert_sha384.borrow_mut() = (*self.signature_type() == vec![0x7u8, 0x53u8, 0x3eu8, 0xffu8, 0xd0u8, 0x9fu8, 0xc9u8, 0x48u8, 0x85u8, 0xf1u8, 0x8au8, 0xd5u8, 0x6cu8, 0x70u8, 0x1eu8, 0x1u8]) as bool;
        Ok(self.is_cert_sha384.borrow())
    }

    /**
     * SHA384 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
     * \sa EFI_CERT_X509_SHA384_GUID
     */
    pub fn is_cert_sha384_x509(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_sha384_x509.get() {
            return Ok(self.is_cert_sha384_x509.borrow());
        }
        self.f_is_cert_sha384_x509.set(true);
        *self.is_cert_sha384_x509.borrow_mut() = (*self.signature_type() == vec![0x6eu8, 0x87u8, 0x76u8, 0x70u8, 0xc2u8, 0x80u8, 0xe6u8, 0x4eu8, 0xaau8, 0xd2u8, 0x28u8, 0xb3u8, 0x49u8, 0xa6u8, 0x86u8, 0x5bu8]) as bool;
        Ok(self.is_cert_sha384_x509.borrow())
    }

    /**
     * SHA-512 hash
     * \sa EFI_CERT_SHA512_GUID
     */
    pub fn is_cert_sha512(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_sha512.get() {
            return Ok(self.is_cert_sha512.borrow());
        }
        self.f_is_cert_sha512.set(true);
        *self.is_cert_sha512.borrow_mut() = (*self.signature_type() == vec![0xaeu8, 0xfu8, 0x3eu8, 0x9u8, 0xc4u8, 0xa6u8, 0x50u8, 0x4fu8, 0x9fu8, 0x1bu8, 0xd4u8, 0x1eu8, 0x2bu8, 0x89u8, 0xc1u8, 0x9au8]) as bool;
        Ok(self.is_cert_sha512.borrow())
    }

    /**
     * SHA512 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation
     * \sa EFI_CERT_X509_SHA512_GUID
     */
    pub fn is_cert_sha512_x509(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_sha512_x509.get() {
            return Ok(self.is_cert_sha512_x509.borrow());
        }
        self.f_is_cert_sha512_x509.set(true);
        *self.is_cert_sha512_x509.borrow_mut() = (*self.signature_type() == vec![0x63u8, 0xbfu8, 0x6du8, 0x44u8, 0x2u8, 0x25u8, 0xdau8, 0x4cu8, 0xbcu8, 0xfau8, 0x24u8, 0x65u8, 0xd2u8, 0xb0u8, 0xfeu8, 0x9du8]) as bool;
        Ok(self.is_cert_sha512_x509.borrow())
    }

    /**
     * X.509 certificate
     * \sa EFI_CERT_X509_GUID
     */
    pub fn is_cert_x509(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_cert_x509.get() {
            return Ok(self.is_cert_x509.borrow());
        }
        self.f_is_cert_x509.set(true);
        *self.is_cert_x509.borrow_mut() = (*self.signature_type() == vec![0xa1u8, 0x59u8, 0xc0u8, 0xa5u8, 0xe4u8, 0x94u8, 0xa7u8, 0x4au8, 0x87u8, 0xb5u8, 0xabu8, 0x15u8, 0x5cu8, 0x2bu8, 0xf0u8, 0x72u8]) as bool;
        Ok(self.is_cert_x509.borrow())
    }
}

/**
 * Type of the signature as a GUID
 */
impl EfivarSignatureList_SignatureList {
    pub fn signature_type(&self) -> Ref<'_, Vec<u8>> {
        self.signature_type.borrow()
    }
}

/**
 * Total size of the signature list, including this header
 */
impl EfivarSignatureList_SignatureList {
    pub fn len_signature_list(&self) -> Ref<'_, u32> {
        self.len_signature_list.borrow()
    }
}

/**
 * Size of the signature header which precedes the array of signatures
 */
impl EfivarSignatureList_SignatureList {
    pub fn len_signature_header(&self) -> Ref<'_, u32> {
        self.len_signature_header.borrow()
    }
}

/**
 * Size of each signature
 */
impl EfivarSignatureList_SignatureList {
    pub fn len_signature(&self) -> Ref<'_, u32> {
        self.len_signature.borrow()
    }
}

/**
 * Header before the array of signatures
 */
impl EfivarSignatureList_SignatureList {
    pub fn header(&self) -> Ref<'_, Vec<u8>> {
        self.header.borrow()
    }
}

/**
 * An array of signatures
 */
impl EfivarSignatureList_SignatureList {
    pub fn signatures(&self) -> Ref<'_, Vec<OptRc<EfivarSignatureList_SignatureData>>> {
        self.signatures.borrow()
    }
}
impl EfivarSignatureList_SignatureList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl EfivarSignatureList_SignatureList {
    pub fn signatures_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.signatures_raw.borrow()
    }
}
