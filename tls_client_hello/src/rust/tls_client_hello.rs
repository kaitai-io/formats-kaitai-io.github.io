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

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello>,
    pub _self: SharedType<Self>,
    version: RefCell<OptRc<TlsClientHello_Version>>,
    random: RefCell<OptRc<TlsClientHello_Random>>,
    session_id: RefCell<OptRc<TlsClientHello_SessionId>>,
    cipher_suites: RefCell<OptRc<TlsClientHello_CipherSuites>>,
    compression_methods: RefCell<OptRc<TlsClientHello_CompressionMethods>>,
    extensions: RefCell<OptRc<TlsClientHello_Extensions>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TlsClientHello {
    type Root = TlsClientHello;
    type Parent = TlsClientHello;

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
        let t = Self::read_into::<_, TlsClientHello_Version>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.version.borrow_mut() = t;
        let t = Self::read_into::<_, TlsClientHello_Random>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.random.borrow_mut() = t;
        let t = Self::read_into::<_, TlsClientHello_SessionId>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.session_id.borrow_mut() = t;
        let t = Self::read_into::<_, TlsClientHello_CipherSuites>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.cipher_suites.borrow_mut() = t;
        let t = Self::read_into::<_, TlsClientHello_CompressionMethods>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.compression_methods.borrow_mut() = t;
        if _io.is_eof() == false {
            let t = Self::read_into::<_, TlsClientHello_Extensions>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.extensions.borrow_mut() = t;
        }
        Ok(())
    }
}
impl TlsClientHello {
}
impl TlsClientHello {
    pub fn version(&self) -> Ref<'_, OptRc<TlsClientHello_Version>> {
        self.version.borrow()
    }
}
impl TlsClientHello {
    pub fn random(&self) -> Ref<'_, OptRc<TlsClientHello_Random>> {
        self.random.borrow()
    }
}
impl TlsClientHello {
    pub fn session_id(&self) -> Ref<'_, OptRc<TlsClientHello_SessionId>> {
        self.session_id.borrow()
    }
}
impl TlsClientHello {
    pub fn cipher_suites(&self) -> Ref<'_, OptRc<TlsClientHello_CipherSuites>> {
        self.cipher_suites.borrow()
    }
}
impl TlsClientHello {
    pub fn compression_methods(&self) -> Ref<'_, OptRc<TlsClientHello_CompressionMethods>> {
        self.compression_methods.borrow()
    }
}
impl TlsClientHello {
    pub fn extensions(&self) -> Ref<'_, OptRc<TlsClientHello_Extensions>> {
        self.extensions.borrow()
    }
}
impl TlsClientHello {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello_Alpn {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello_Extension>,
    pub _self: SharedType<Self>,
    ext_len: RefCell<u16>,
    alpn_protocols: RefCell<Vec<OptRc<TlsClientHello_Protocol>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TlsClientHello_Alpn {
    type Root = TlsClientHello;
    type Parent = TlsClientHello_Extension;

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
        *self_rc.ext_len.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.alpn_protocols.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, TlsClientHello_Protocol>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.alpn_protocols.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl TlsClientHello_Alpn {
}
impl TlsClientHello_Alpn {
    pub fn ext_len(&self) -> Ref<'_, u16> {
        self.ext_len.borrow()
    }
}
impl TlsClientHello_Alpn {
    pub fn alpn_protocols(&self) -> Ref<'_, Vec<OptRc<TlsClientHello_Protocol>>> {
        self.alpn_protocols.borrow()
    }
}
impl TlsClientHello_Alpn {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello_CipherSuites {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello>,
    pub _self: SharedType<Self>,
    len: RefCell<u16>,
    cipher_suites: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TlsClientHello_CipherSuites {
    type Root = TlsClientHello;
    type Parent = TlsClientHello;

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
        *self_rc.len.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.cipher_suites.borrow_mut() = Vec::new();
        let l_cipher_suites = ((*self_rc.len() as u16) / (2 as u16));
        for _i in 0..l_cipher_suites {
            self_rc.cipher_suites.borrow_mut().push(_io.read_u2be()?.into());
        }
        Ok(())
    }
}
impl TlsClientHello_CipherSuites {
}
impl TlsClientHello_CipherSuites {
    pub fn len(&self) -> Ref<'_, u16> {
        self.len.borrow()
    }
}
impl TlsClientHello_CipherSuites {
    pub fn cipher_suites(&self) -> Ref<'_, Vec<u16>> {
        self.cipher_suites.borrow()
    }
}
impl TlsClientHello_CipherSuites {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello_CompressionMethods {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello>,
    pub _self: SharedType<Self>,
    len: RefCell<u8>,
    compression_methods: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TlsClientHello_CompressionMethods {
    type Root = TlsClientHello;
    type Parent = TlsClientHello;

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
        *self_rc.len.borrow_mut() = _io.read_u1()?.into();
        *self_rc.compression_methods.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl TlsClientHello_CompressionMethods {
}
impl TlsClientHello_CompressionMethods {
    pub fn len(&self) -> Ref<'_, u8> {
        self.len.borrow()
    }
}
impl TlsClientHello_CompressionMethods {
    pub fn compression_methods(&self) -> Ref<'_, Vec<u8>> {
        self.compression_methods.borrow()
    }
}
impl TlsClientHello_CompressionMethods {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello_Extension {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello_Extensions>,
    pub _self: SharedType<Self>,
    type: RefCell<u16>,
    len: RefCell<u16>,
    body: RefCell<Option<TlsClientHello_Extension_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum TlsClientHello_Extension_Body {
    TlsClientHello_Sni(OptRc<TlsClientHello_Sni>),
    TlsClientHello_Alpn(OptRc<TlsClientHello_Alpn>),
    Bytes(Vec<u8>),
}
impl From<&TlsClientHello_Extension_Body> for OptRc<TlsClientHello_Sni> {
    fn from(v: &TlsClientHello_Extension_Body) -> Self {
        if let TlsClientHello_Extension_Body::TlsClientHello_Sni(x) = v {
            return x.clone();
        }
        panic!("expected TlsClientHello_Extension_Body::TlsClientHello_Sni, got {:?}", v)
    }
}
impl From<OptRc<TlsClientHello_Sni>> for TlsClientHello_Extension_Body {
    fn from(v: OptRc<TlsClientHello_Sni>) -> Self {
        Self::TlsClientHello_Sni(v)
    }
}
impl From<&TlsClientHello_Extension_Body> for OptRc<TlsClientHello_Alpn> {
    fn from(v: &TlsClientHello_Extension_Body) -> Self {
        if let TlsClientHello_Extension_Body::TlsClientHello_Alpn(x) = v {
            return x.clone();
        }
        panic!("expected TlsClientHello_Extension_Body::TlsClientHello_Alpn, got {:?}", v)
    }
}
impl From<OptRc<TlsClientHello_Alpn>> for TlsClientHello_Extension_Body {
    fn from(v: OptRc<TlsClientHello_Alpn>) -> Self {
        Self::TlsClientHello_Alpn(v)
    }
}
impl From<&TlsClientHello_Extension_Body> for Vec<u8> {
    fn from(v: &TlsClientHello_Extension_Body) -> Self {
        if let TlsClientHello_Extension_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected TlsClientHello_Extension_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for TlsClientHello_Extension_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for TlsClientHello_Extension {
    type Root = TlsClientHello;
    type Parent = TlsClientHello_Extensions;

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
        *self_rc.type.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.len.borrow_mut() = _io.read_u2be()?.into();
        match *self_rc.type() {
            0 => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, TlsClientHello_Sni>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            16 => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, TlsClientHello_Alpn>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.len() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl TlsClientHello_Extension {
}
impl TlsClientHello_Extension {
    pub fn type(&self) -> Ref<'_, u16> {
        self.type.borrow()
    }
}
impl TlsClientHello_Extension {
    pub fn len(&self) -> Ref<'_, u16> {
        self.len.borrow()
    }
}
impl TlsClientHello_Extension {
    pub fn body(&self) -> Ref<'_, Option<TlsClientHello_Extension_Body>> {
        self.body.borrow()
    }
}
impl TlsClientHello_Extension {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl TlsClientHello_Extension {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello_Extensions {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello>,
    pub _self: SharedType<Self>,
    len: RefCell<u16>,
    extensions: RefCell<Vec<OptRc<TlsClientHello_Extension>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TlsClientHello_Extensions {
    type Root = TlsClientHello;
    type Parent = TlsClientHello;

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
        *self_rc.len.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.extensions.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, TlsClientHello_Extension>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.extensions.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl TlsClientHello_Extensions {
}
impl TlsClientHello_Extensions {
    pub fn len(&self) -> Ref<'_, u16> {
        self.len.borrow()
    }
}
impl TlsClientHello_Extensions {
    pub fn extensions(&self) -> Ref<'_, Vec<OptRc<TlsClientHello_Extension>>> {
        self.extensions.borrow()
    }
}
impl TlsClientHello_Extensions {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello_Protocol {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello_Alpn>,
    pub _self: SharedType<Self>,
    strlen: RefCell<u8>,
    name: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TlsClientHello_Protocol {
    type Root = TlsClientHello;
    type Parent = TlsClientHello_Alpn;

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
        *self_rc.strlen.borrow_mut() = _io.read_u1()?.into();
        *self_rc.name.borrow_mut() = _io.read_bytes(*self_rc.strlen() as usize)?.into();
        Ok(())
    }
}
impl TlsClientHello_Protocol {
}
impl TlsClientHello_Protocol {
    pub fn strlen(&self) -> Ref<'_, u8> {
        self.strlen.borrow()
    }
}
impl TlsClientHello_Protocol {
    pub fn name(&self) -> Ref<'_, Vec<u8>> {
        self.name.borrow()
    }
}
impl TlsClientHello_Protocol {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello_Random {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello>,
    pub _self: SharedType<Self>,
    gmt_unix_time: RefCell<u32>,
    random: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TlsClientHello_Random {
    type Root = TlsClientHello;
    type Parent = TlsClientHello;

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
        *self_rc.gmt_unix_time.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.random.borrow_mut() = _io.read_bytes(28 as usize)?.into();
        Ok(())
    }
}
impl TlsClientHello_Random {
}
impl TlsClientHello_Random {
    pub fn gmt_unix_time(&self) -> Ref<'_, u32> {
        self.gmt_unix_time.borrow()
    }
}
impl TlsClientHello_Random {
    pub fn random(&self) -> Ref<'_, Vec<u8>> {
        self.random.borrow()
    }
}
impl TlsClientHello_Random {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello_ServerName {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello_Sni>,
    pub _self: SharedType<Self>,
    name_type: RefCell<u8>,
    length: RefCell<u16>,
    host_name: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TlsClientHello_ServerName {
    type Root = TlsClientHello;
    type Parent = TlsClientHello_Sni;

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
        *self_rc.name_type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.host_name.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
        Ok(())
    }
}
impl TlsClientHello_ServerName {
}
impl TlsClientHello_ServerName {
    pub fn name_type(&self) -> Ref<'_, u8> {
        self.name_type.borrow()
    }
}
impl TlsClientHello_ServerName {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl TlsClientHello_ServerName {
    pub fn host_name(&self) -> Ref<'_, Vec<u8>> {
        self.host_name.borrow()
    }
}
impl TlsClientHello_ServerName {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello_SessionId {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello>,
    pub _self: SharedType<Self>,
    len: RefCell<u8>,
    sid: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TlsClientHello_SessionId {
    type Root = TlsClientHello;
    type Parent = TlsClientHello;

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
        *self_rc.len.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sid.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl TlsClientHello_SessionId {
}
impl TlsClientHello_SessionId {
    pub fn len(&self) -> Ref<'_, u8> {
        self.len.borrow()
    }
}
impl TlsClientHello_SessionId {
    pub fn sid(&self) -> Ref<'_, Vec<u8>> {
        self.sid.borrow()
    }
}
impl TlsClientHello_SessionId {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello_Sni {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello_Extension>,
    pub _self: SharedType<Self>,
    list_length: RefCell<u16>,
    server_names: RefCell<Vec<OptRc<TlsClientHello_ServerName>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TlsClientHello_Sni {
    type Root = TlsClientHello;
    type Parent = TlsClientHello_Extension;

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
        *self_rc.list_length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.server_names.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, TlsClientHello_ServerName>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.server_names.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl TlsClientHello_Sni {
}
impl TlsClientHello_Sni {
    pub fn list_length(&self) -> Ref<'_, u16> {
        self.list_length.borrow()
    }
}
impl TlsClientHello_Sni {
    pub fn server_names(&self) -> Ref<'_, Vec<OptRc<TlsClientHello_ServerName>>> {
        self.server_names.borrow()
    }
}
impl TlsClientHello_Sni {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TlsClientHello_Version {
    pub _root: SharedType<TlsClientHello>,
    pub _parent: SharedType<TlsClientHello>,
    pub _self: SharedType<Self>,
    major: RefCell<u8>,
    minor: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TlsClientHello_Version {
    type Root = TlsClientHello;
    type Parent = TlsClientHello;

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
        *self_rc.major.borrow_mut() = _io.read_u1()?.into();
        *self_rc.minor.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl TlsClientHello_Version {
}
impl TlsClientHello_Version {
    pub fn major(&self) -> Ref<'_, u8> {
        self.major.borrow()
    }
}
impl TlsClientHello_Version {
    pub fn minor(&self) -> Ref<'_, u8> {
        self.minor.borrow()
    }
}
impl TlsClientHello_Version {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
