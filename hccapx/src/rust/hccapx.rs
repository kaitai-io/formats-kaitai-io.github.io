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
 * Native format of Hashcat password "recovery" utility
 * \sa https://hashcat.net/wiki/doku.php?id=hccapx Source
 */

#[derive(Default, Debug, Clone)]
pub struct Hccapx {
    pub _root: SharedType<Hccapx>,
    pub _parent: SharedType<Hccapx>,
    pub _self: SharedType<Self>,
    records: RefCell<Vec<OptRc<Hccapx_HccapxRecord>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Hccapx {
    type Root = Hccapx;
    type Parent = Hccapx;

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
                let t = Self::read_into::<_, Hccapx_HccapxRecord>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.records.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Hccapx {
}
impl Hccapx {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Hccapx_HccapxRecord>>> {
        self.records.borrow()
    }
}
impl Hccapx {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Hccapx_HccapxRecord {
    pub _root: SharedType<Hccapx>,
    pub _parent: SharedType<Hccapx>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<u32>,
    ignore_replay_counter: RefCell<bool>,
    message_pair: RefCell<u64>,
    len_essid: RefCell<u8>,
    essid: RefCell<Vec<u8>>,
    padding1: RefCell<Vec<u8>>,
    keyver: RefCell<u8>,
    keymic: RefCell<Vec<u8>>,
    mac_ap: RefCell<Vec<u8>>,
    nonce_ap: RefCell<Vec<u8>>,
    mac_station: RefCell<Vec<u8>>,
    nonce_station: RefCell<Vec<u8>>,
    len_eapol: RefCell<u16>,
    eapol: RefCell<Vec<u8>>,
    padding2: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Hccapx_HccapxRecord {
    type Root = Hccapx;
    type Parent = Hccapx;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x48u8, 0x43u8, 0x50u8, 0x58u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/hccapx_record/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ignore_replay_counter.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.message_pair.borrow_mut() = _io.read_bits_int_be(7)?;
        _io.align_to_byte()?;
        *self_rc.len_essid.borrow_mut() = _io.read_u1()?.into();
        *self_rc.essid.borrow_mut() = _io.read_bytes(*self_rc.len_essid() as usize)?.into();
        *self_rc.padding1.borrow_mut() = _io.read_bytes(((32 as u8) - (*self_rc.len_essid() as u8)) as usize)?.into();
        *self_rc.keyver.borrow_mut() = _io.read_u1()?.into();
        *self_rc.keymic.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.mac_ap.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        *self_rc.nonce_ap.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        *self_rc.mac_station.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        *self_rc.nonce_station.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        *self_rc.len_eapol.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.eapol.borrow_mut() = _io.read_bytes(*self_rc.len_eapol() as usize)?.into();
        *self_rc.padding2.borrow_mut() = _io.read_bytes(((256 as i32) - (*self_rc.len_eapol() as i32)) as usize)?.into();
        Ok(())
    }
}
impl Hccapx_HccapxRecord {
}
impl Hccapx_HccapxRecord {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * The version number of the .hccapx file format.
 */
impl Hccapx_HccapxRecord {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}

/**
 * Indicates if the message pair matching was done based on
 * replay counter or not.
 * 
 * Whenever it was set to 1 it means that the replay counter
 * was ignored (i.e. it was not considered at all by the
 * matching algorithm).
 * 
 * Hashcat currently does not perform any particular action
 * based on this bit, but nonetheless this information could be
 * crucial for some 3th party tools and for
 * analysis/statistics. There could be some opportunity to
 * implement some further logic based on this particular
 * information also within hashcat (in the future).
 */
impl Hccapx_HccapxRecord {
    pub fn ignore_replay_counter(&self) -> Ref<'_, bool> {
        self.ignore_replay_counter.borrow()
    }
}

/**
 * The message_pair value describes which messages of the 4-way
 * handshake were combined to form the .hccapx structure. It is
 * always a pair of 2 messages: 1 from the AP (access point)
 * and 1 from the STA (client).
 * 
 * Furthermore, the message_pair value also gives a hint from
 * which of the 2 messages the EAPOL origins. This is
 * interesting data, but not necessarily needed for hashcat to
 * be able to crack the hash.
 * 
 * On the other hand, it could be very important to know if
 * "only" message 1 and message 2 were captured or if for
 * instance message 3 and/or message 4 were captured too. If
 * message 3 and/or message 4 were captured it should be a hard
 * evidence that the connection was established and that the
 * password the client used was the correct one.
 */
impl Hccapx_HccapxRecord {
    pub fn message_pair(&self) -> Ref<'_, u64> {
        self.message_pair.borrow()
    }
}
impl Hccapx_HccapxRecord {
    pub fn len_essid(&self) -> Ref<'_, u8> {
        self.len_essid.borrow()
    }
}
impl Hccapx_HccapxRecord {
    pub fn essid(&self) -> Ref<'_, Vec<u8>> {
        self.essid.borrow()
    }
}
impl Hccapx_HccapxRecord {
    pub fn padding1(&self) -> Ref<'_, Vec<u8>> {
        self.padding1.borrow()
    }
}

/**
 * The flag used to distinguish WPA from WPA2 ciphers. Value of
 * 1 means WPA, other - WPA2.
 */
impl Hccapx_HccapxRecord {
    pub fn keyver(&self) -> Ref<'_, u8> {
        self.keyver.borrow()
    }
}

/**
 * The final hash value. MD5 for WPA and SHA-1 for WPA2
 * (truncated to 128 bit).
 */
impl Hccapx_HccapxRecord {
    pub fn keymic(&self) -> Ref<'_, Vec<u8>> {
        self.keymic.borrow()
    }
}

/**
 * The BSSID (MAC address) of the access point.
 */
impl Hccapx_HccapxRecord {
    pub fn mac_ap(&self) -> Ref<'_, Vec<u8>> {
        self.mac_ap.borrow()
    }
}

/**
 * Nonce (random salt) generated by the access point.
 */
impl Hccapx_HccapxRecord {
    pub fn nonce_ap(&self) -> Ref<'_, Vec<u8>> {
        self.nonce_ap.borrow()
    }
}

/**
 * The MAC address of the client connecting to the access point.
 */
impl Hccapx_HccapxRecord {
    pub fn mac_station(&self) -> Ref<'_, Vec<u8>> {
        self.mac_station.borrow()
    }
}

/**
 * Nonce (random salt) generated by the client connecting to the access point.
 */
impl Hccapx_HccapxRecord {
    pub fn nonce_station(&self) -> Ref<'_, Vec<u8>> {
        self.nonce_station.borrow()
    }
}

/**
 * The length of the EAPOL data.
 */
impl Hccapx_HccapxRecord {
    pub fn len_eapol(&self) -> Ref<'_, u16> {
        self.len_eapol.borrow()
    }
}
impl Hccapx_HccapxRecord {
    pub fn eapol(&self) -> Ref<'_, Vec<u8>> {
        self.eapol.borrow()
    }
}
impl Hccapx_HccapxRecord {
    pub fn padding2(&self) -> Ref<'_, Vec<u8>> {
        self.padding2.borrow()
    }
}
impl Hccapx_HccapxRecord {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
