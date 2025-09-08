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
 * Native format of Hashcat password "recovery" utility.
 * 
 * A sample of file for testing can be downloaded from
 * <https://web.archive.org/web/20150220013635if_/http://hashcat.net:80/misc/example_hashes/hashcat.hccap>
 * \sa https://hashcat.net/wiki/doku.php?id=hccap Source
 */

#[derive(Default, Debug, Clone)]
pub struct Hccap {
    pub _root: SharedType<Hccap>,
    pub _parent: SharedType<Hccap>,
    pub _self: SharedType<Self>,
    records: RefCell<Vec<OptRc<Hccap_HccapRecord>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Hccap {
    type Root = Hccap;
    type Parent = Hccap;

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
        *self_rc.records.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Hccap_HccapRecord>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.records.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Hccap {
}
impl Hccap {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Hccap_HccapRecord>>> {
        self.records.borrow()
    }
}
impl Hccap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Hccap_EapolDummy {
    pub _root: SharedType<Hccap>,
    pub _parent: SharedType<Hccap_HccapRecord>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Hccap_EapolDummy {
    type Root = Hccap;
    type Parent = Hccap_HccapRecord;

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
        Ok(())
    }
}
impl Hccap_EapolDummy {
}
impl Hccap_EapolDummy {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Hccap_HccapRecord {
    pub _root: SharedType<Hccap>,
    pub _parent: SharedType<Hccap>,
    pub _self: SharedType<Self>,
    essid: RefCell<Vec<u8>>,
    mac_ap: RefCell<Vec<u8>>,
    mac_station: RefCell<Vec<u8>>,
    nonce_station: RefCell<Vec<u8>>,
    nonce_ap: RefCell<Vec<u8>>,
    eapol_buffer: RefCell<OptRc<Hccap_EapolDummy>>,
    len_eapol: RefCell<u32>,
    keyver: RefCell<u32>,
    keymic: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    eapol_buffer_raw: RefCell<Vec<u8>>,
    f_eapol: Cell<bool>,
    eapol: RefCell<Vec<u8>>,
}
impl KStruct for Hccap_HccapRecord {
    type Root = Hccap;
    type Parent = Hccap;

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
        *self_rc.essid.borrow_mut() = _io.read_bytes(36 as usize)?.into();
        *self_rc.mac_ap.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        *self_rc.mac_station.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        *self_rc.nonce_station.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        *self_rc.nonce_ap.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        *self_rc.eapol_buffer_raw.borrow_mut() = _io.read_bytes(256 as usize)?.into();
        let eapol_buffer_raw = self_rc.eapol_buffer_raw.borrow();
        let _t_eapol_buffer_raw_io = BytesReader::from(eapol_buffer_raw.clone());
        let t = Self::read_into::<BytesReader, Hccap_EapolDummy>(&_t_eapol_buffer_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.eapol_buffer.borrow_mut() = t;
        *self_rc.len_eapol.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.keyver.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.keymic.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        Ok(())
    }
}
impl Hccap_HccapRecord {
    pub fn eapol(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_eapol.get() {
            return Ok(self.eapol.borrow());
        }
        self.f_eapol.set(true);
        let io = Clone::clone(&*self.eapol_buffer()._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        *self.eapol.borrow_mut() = io.read_bytes(*self.len_eapol() as usize)?.into();
        io.seek(_pos)?;
        Ok(self.eapol.borrow())
    }
}
impl Hccap_HccapRecord {
    pub fn essid(&self) -> Ref<'_, Vec<u8>> {
        self.essid.borrow()
    }
}

/**
 * The BSSID (MAC address) of the access point
 */
impl Hccap_HccapRecord {
    pub fn mac_ap(&self) -> Ref<'_, Vec<u8>> {
        self.mac_ap.borrow()
    }
}

/**
 * The MAC address of a client connecting to the access point
 */
impl Hccap_HccapRecord {
    pub fn mac_station(&self) -> Ref<'_, Vec<u8>> {
        self.mac_station.borrow()
    }
}

/**
 * Nonce (random salt) generated by the client connecting to the access point.
 */
impl Hccap_HccapRecord {
    pub fn nonce_station(&self) -> Ref<'_, Vec<u8>> {
        self.nonce_station.borrow()
    }
}

/**
 * Nonce (random salt) generated by the access point.
 */
impl Hccap_HccapRecord {
    pub fn nonce_ap(&self) -> Ref<'_, Vec<u8>> {
        self.nonce_ap.borrow()
    }
}

/**
 * Buffer for EAPOL data, only first `len_eapol` bytes are used
 */
impl Hccap_HccapRecord {
    pub fn eapol_buffer(&self) -> Ref<'_, OptRc<Hccap_EapolDummy>> {
        self.eapol_buffer.borrow()
    }
}

/**
 * Size of EAPOL data
 */
impl Hccap_HccapRecord {
    pub fn len_eapol(&self) -> Ref<'_, u32> {
        self.len_eapol.borrow()
    }
}

/**
 * The flag used to distinguish WPA from WPA2 ciphers. Value of
 * 1 means WPA, other - WPA2.
 */
impl Hccap_HccapRecord {
    pub fn keyver(&self) -> Ref<'_, u32> {
        self.keyver.borrow()
    }
}

/**
 * The final hash value. MD5 for WPA and SHA-1 for WPA2
 * (truncated to 128 bit).
 */
impl Hccap_HccapRecord {
    pub fn keymic(&self) -> Ref<'_, Vec<u8>> {
        self.keymic.borrow()
    }
}
impl Hccap_HccapRecord {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Hccap_HccapRecord {
    pub fn eapol_buffer_raw(&self) -> Ref<'_, Vec<u8>> {
        self.eapol_buffer_raw.borrow()
    }
}
