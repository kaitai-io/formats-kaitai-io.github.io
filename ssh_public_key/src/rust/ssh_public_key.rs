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
 * SSH public keys are encoded in a special binary format, typically represented
 * to end users as either one-liner OpenSSH format or multi-line PEM format
 * (commerical SSH). Text wrapper carries extra information about user who
 * created the key, comment, etc, but the inner binary is always base64-encoded
 * and follows the same internal format.
 * 
 * This format spec deals with this internal binary format (called "blob" in
 * openssh sources) only. Buffer is expected to be raw binary and not base64-d.
 * Implementation closely follows code in OpenSSH.
 * \sa https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L1970 Source
 */

#[derive(Default, Debug, Clone)]
pub struct SshPublicKey {
    pub _root: SharedType<SshPublicKey>,
    pub _parent: SharedType<SshPublicKey>,
    pub _self: SharedType<Self>,
    key_name: RefCell<OptRc<SshPublicKey_Cstring>>,
    body: RefCell<Option<SshPublicKey_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum SshPublicKey_Body {
    SshPublicKey_KeyEcdsa(OptRc<SshPublicKey_KeyEcdsa>),
    SshPublicKey_KeyDsa(OptRc<SshPublicKey_KeyDsa>),
    SshPublicKey_KeyEd25519(OptRc<SshPublicKey_KeyEd25519>),
    SshPublicKey_KeyRsa(OptRc<SshPublicKey_KeyRsa>),
}
impl From<&SshPublicKey_Body> for OptRc<SshPublicKey_KeyEcdsa> {
    fn from(v: &SshPublicKey_Body) -> Self {
        if let SshPublicKey_Body::SshPublicKey_KeyEcdsa(x) = v {
            return x.clone();
        }
        panic!("expected SshPublicKey_Body::SshPublicKey_KeyEcdsa, got {:?}", v)
    }
}
impl From<OptRc<SshPublicKey_KeyEcdsa>> for SshPublicKey_Body {
    fn from(v: OptRc<SshPublicKey_KeyEcdsa>) -> Self {
        Self::SshPublicKey_KeyEcdsa(v)
    }
}
impl From<&SshPublicKey_Body> for OptRc<SshPublicKey_KeyDsa> {
    fn from(v: &SshPublicKey_Body) -> Self {
        if let SshPublicKey_Body::SshPublicKey_KeyDsa(x) = v {
            return x.clone();
        }
        panic!("expected SshPublicKey_Body::SshPublicKey_KeyDsa, got {:?}", v)
    }
}
impl From<OptRc<SshPublicKey_KeyDsa>> for SshPublicKey_Body {
    fn from(v: OptRc<SshPublicKey_KeyDsa>) -> Self {
        Self::SshPublicKey_KeyDsa(v)
    }
}
impl From<&SshPublicKey_Body> for OptRc<SshPublicKey_KeyEd25519> {
    fn from(v: &SshPublicKey_Body) -> Self {
        if let SshPublicKey_Body::SshPublicKey_KeyEd25519(x) = v {
            return x.clone();
        }
        panic!("expected SshPublicKey_Body::SshPublicKey_KeyEd25519, got {:?}", v)
    }
}
impl From<OptRc<SshPublicKey_KeyEd25519>> for SshPublicKey_Body {
    fn from(v: OptRc<SshPublicKey_KeyEd25519>) -> Self {
        Self::SshPublicKey_KeyEd25519(v)
    }
}
impl From<&SshPublicKey_Body> for OptRc<SshPublicKey_KeyRsa> {
    fn from(v: &SshPublicKey_Body) -> Self {
        if let SshPublicKey_Body::SshPublicKey_KeyRsa(x) = v {
            return x.clone();
        }
        panic!("expected SshPublicKey_Body::SshPublicKey_KeyRsa, got {:?}", v)
    }
}
impl From<OptRc<SshPublicKey_KeyRsa>> for SshPublicKey_Body {
    fn from(v: OptRc<SshPublicKey_KeyRsa>) -> Self {
        Self::SshPublicKey_KeyRsa(v)
    }
}
impl KStruct for SshPublicKey {
    type Root = SshPublicKey;
    type Parent = SshPublicKey;

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
        let t = Self::read_into::<_, SshPublicKey_Cstring>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.key_name.borrow_mut() = t;
        {
            let on = self_rc.key_name().value();
            if *on == "ecdsa-sha2-nistp256" {
                let t = Self::read_into::<_, SshPublicKey_KeyEcdsa>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "ssh-dss" {
                let t = Self::read_into::<_, SshPublicKey_KeyDsa>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "ssh-ed25519" {
                let t = Self::read_into::<_, SshPublicKey_KeyEd25519>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "ssh-rsa" {
                let t = Self::read_into::<_, SshPublicKey_KeyRsa>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
        }
        Ok(())
    }
}
impl SshPublicKey {
}
impl SshPublicKey {
    pub fn key_name(&self) -> Ref<'_, OptRc<SshPublicKey_Cstring>> {
        self.key_name.borrow()
    }
}
impl SshPublicKey {
    pub fn body(&self) -> Ref<'_, Option<SshPublicKey_Body>> {
        self.body.borrow()
    }
}
impl SshPublicKey {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Big integers serialization format used by ssh, v2. In the code, the following
 * routines are used to read/write it:
 * 
 * * sshbuf_get_bignum2
 * * sshbuf_get_bignum2_bytes_direct
 * * sshbuf_put_bignum2
 * * sshbuf_get_bignum2_bytes_direct
 * \sa https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L35
 * https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L431
 *  Source
 */

#[derive(Default, Debug, Clone)]
pub struct SshPublicKey_Bignum2 {
    pub _root: SharedType<SshPublicKey>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    len: RefCell<u32>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_length_in_bits: Cell<bool>,
    length_in_bits: RefCell<i32>,
}
impl KStruct for SshPublicKey_Bignum2 {
    type Root = SshPublicKey;
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
        *self_rc.len.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.body.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl SshPublicKey_Bignum2 {

    /**
     * Length of big integer in bits. In OpenSSH sources, this corresponds to
     * `BN_num_bits` function.
     */
    pub fn length_in_bits(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_length_in_bits.get() {
            return Ok(self.length_in_bits.borrow());
        }
        self.f_length_in_bits.set(true);
        *self.length_in_bits.borrow_mut() = (((((*self.len() as u32) - (1 as u32)) as i32) * (8 as i32))) as i32;
        Ok(self.length_in_bits.borrow())
    }
}
impl SshPublicKey_Bignum2 {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}
impl SshPublicKey_Bignum2 {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl SshPublicKey_Bignum2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A integer-prefixed string designed to be read using `sshbuf_get_cstring`
 * and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
 * obscure misnomer, as typically "C string" means a null-terminated string.
 * \sa https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-basic.c#L181 Source
 */

#[derive(Default, Debug, Clone)]
pub struct SshPublicKey_Cstring {
    pub _root: SharedType<SshPublicKey>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    len: RefCell<u32>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SshPublicKey_Cstring {
    type Root = SshPublicKey;
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
        *self_rc.len.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.value.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len() as usize)?.into(), "ASCII")?;
        Ok(())
    }
}
impl SshPublicKey_Cstring {
}
impl SshPublicKey_Cstring {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}
impl SshPublicKey_Cstring {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl SshPublicKey_Cstring {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Elliptic curve dump format used by ssh. In OpenSSH code, the following
 * routines are used to read/write it:
 * 
 * * sshbuf_get_ec
 * * get_ec
 * \sa https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L90
 * https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshbuf-getput-crypto.c#L76
 *  Source
 */

#[derive(Default, Debug, Clone)]
pub struct SshPublicKey_EllipticCurve {
    pub _root: SharedType<SshPublicKey>,
    pub _parent: SharedType<SshPublicKey_KeyEcdsa>,
    pub _self: SharedType<Self>,
    len: RefCell<u32>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SshPublicKey_EllipticCurve {
    type Root = SshPublicKey;
    type Parent = SshPublicKey_KeyEcdsa;

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
        *self_rc.len.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.body.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl SshPublicKey_EllipticCurve {
}
impl SshPublicKey_EllipticCurve {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}
impl SshPublicKey_EllipticCurve {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl SshPublicKey_EllipticCurve {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2036-L2051 Source
 */

#[derive(Default, Debug, Clone)]
pub struct SshPublicKey_KeyDsa {
    pub _root: SharedType<SshPublicKey>,
    pub _parent: SharedType<SshPublicKey>,
    pub _self: SharedType<Self>,
    dsa_p: RefCell<OptRc<SshPublicKey_Bignum2>>,
    dsa_q: RefCell<OptRc<SshPublicKey_Bignum2>>,
    dsa_g: RefCell<OptRc<SshPublicKey_Bignum2>>,
    dsa_pub_key: RefCell<OptRc<SshPublicKey_Bignum2>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SshPublicKey_KeyDsa {
    type Root = SshPublicKey;
    type Parent = SshPublicKey;

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
        let t = Self::read_into::<_, SshPublicKey_Bignum2>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.dsa_p.borrow_mut() = t;
        let t = Self::read_into::<_, SshPublicKey_Bignum2>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.dsa_q.borrow_mut() = t;
        let t = Self::read_into::<_, SshPublicKey_Bignum2>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.dsa_g.borrow_mut() = t;
        let t = Self::read_into::<_, SshPublicKey_Bignum2>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.dsa_pub_key.borrow_mut() = t;
        Ok(())
    }
}
impl SshPublicKey_KeyDsa {
}
impl SshPublicKey_KeyDsa {
    pub fn dsa_p(&self) -> Ref<'_, OptRc<SshPublicKey_Bignum2>> {
        self.dsa_p.borrow()
    }
}
impl SshPublicKey_KeyDsa {
    pub fn dsa_q(&self) -> Ref<'_, OptRc<SshPublicKey_Bignum2>> {
        self.dsa_q.borrow()
    }
}
impl SshPublicKey_KeyDsa {
    pub fn dsa_g(&self) -> Ref<'_, OptRc<SshPublicKey_Bignum2>> {
        self.dsa_g.borrow()
    }
}
impl SshPublicKey_KeyDsa {
    pub fn dsa_pub_key(&self) -> Ref<'_, OptRc<SshPublicKey_Bignum2>> {
        self.dsa_pub_key.borrow()
    }
}
impl SshPublicKey_KeyDsa {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2060-L2103 Source
 */

#[derive(Default, Debug, Clone)]
pub struct SshPublicKey_KeyEcdsa {
    pub _root: SharedType<SshPublicKey>,
    pub _parent: SharedType<SshPublicKey>,
    pub _self: SharedType<Self>,
    curve_name: RefCell<OptRc<SshPublicKey_Cstring>>,
    ec: RefCell<OptRc<SshPublicKey_EllipticCurve>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SshPublicKey_KeyEcdsa {
    type Root = SshPublicKey;
    type Parent = SshPublicKey;

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
        let t = Self::read_into::<_, SshPublicKey_Cstring>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.curve_name.borrow_mut() = t;
        let t = Self::read_into::<_, SshPublicKey_EllipticCurve>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.ec.borrow_mut() = t;
        Ok(())
    }
}
impl SshPublicKey_KeyEcdsa {
}
impl SshPublicKey_KeyEcdsa {
    pub fn curve_name(&self) -> Ref<'_, OptRc<SshPublicKey_Cstring>> {
        self.curve_name.borrow()
    }
}
impl SshPublicKey_KeyEcdsa {
    pub fn ec(&self) -> Ref<'_, OptRc<SshPublicKey_EllipticCurve>> {
        self.ec.borrow()
    }
}
impl SshPublicKey_KeyEcdsa {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2111-L2124 Source
 */

#[derive(Default, Debug, Clone)]
pub struct SshPublicKey_KeyEd25519 {
    pub _root: SharedType<SshPublicKey>,
    pub _parent: SharedType<SshPublicKey>,
    pub _self: SharedType<Self>,
    len_pk: RefCell<u32>,
    pk: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SshPublicKey_KeyEd25519 {
    type Root = SshPublicKey;
    type Parent = SshPublicKey;

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
        *self_rc.len_pk.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.pk.borrow_mut() = _io.read_bytes(*self_rc.len_pk() as usize)?.into();
        Ok(())
    }
}
impl SshPublicKey_KeyEd25519 {
}
impl SshPublicKey_KeyEd25519 {
    pub fn len_pk(&self) -> Ref<'_, u32> {
        self.len_pk.borrow()
    }
}
impl SshPublicKey_KeyEd25519 {
    pub fn pk(&self) -> Ref<'_, Vec<u8>> {
        self.pk.borrow()
    }
}
impl SshPublicKey_KeyEd25519 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/openssh/openssh-portable/blob/b4d4eda6/sshkey.c#L2011-L2028 Source
 */

#[derive(Default, Debug, Clone)]
pub struct SshPublicKey_KeyRsa {
    pub _root: SharedType<SshPublicKey>,
    pub _parent: SharedType<SshPublicKey>,
    pub _self: SharedType<Self>,
    rsa_e: RefCell<OptRc<SshPublicKey_Bignum2>>,
    rsa_n: RefCell<OptRc<SshPublicKey_Bignum2>>,
    _io: RefCell<BytesReader>,
    f_key_length: Cell<bool>,
    key_length: RefCell<i32>,
}
impl KStruct for SshPublicKey_KeyRsa {
    type Root = SshPublicKey;
    type Parent = SshPublicKey;

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
        let t = Self::read_into::<_, SshPublicKey_Bignum2>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.rsa_e.borrow_mut() = t;
        let t = Self::read_into::<_, SshPublicKey_Bignum2>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.rsa_n.borrow_mut() = t;
        Ok(())
    }
}
impl SshPublicKey_KeyRsa {

    /**
     * Key length in bits
     */
    pub fn key_length(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_key_length.get() {
            return Ok(self.key_length.borrow());
        }
        self.f_key_length.set(true);
        *self.key_length.borrow_mut() = (*self.rsa_n().length_in_bits()?) as i32;
        Ok(self.key_length.borrow())
    }
}

/**
 * Public key exponent, designated `e` in RSA documentation.
 */
impl SshPublicKey_KeyRsa {
    pub fn rsa_e(&self) -> Ref<'_, OptRc<SshPublicKey_Bignum2>> {
        self.rsa_e.borrow()
    }
}

/**
 * Modulus of both public and private keys, designated `n` in RSA
 * documentation. Its length in bits is designated as "key length".
 */
impl SshPublicKey_KeyRsa {
    pub fn rsa_n(&self) -> Ref<'_, OptRc<SshPublicKey_Bignum2>> {
        self.rsa_n.borrow()
    }
}
impl SshPublicKey_KeyRsa {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
