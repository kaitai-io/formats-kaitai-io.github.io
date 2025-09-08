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
use super::rtp_packet::RtpPacket;

/**
 * rtpdump is a format used by rtptools to record and replay
 * rtp data from network capture.
 * \sa https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h Source
 */

#[derive(Default, Debug, Clone)]
pub struct Rtpdump {
    pub _root: SharedType<Rtpdump>,
    pub _parent: SharedType<Rtpdump>,
    pub _self: SharedType<Self>,
    file_header: RefCell<OptRc<Rtpdump_HeaderT>>,
    packets: RefCell<Vec<OptRc<Rtpdump_PacketT>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rtpdump {
    type Root = Rtpdump;
    type Parent = Rtpdump;

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
        let t = Self::read_into::<_, Rtpdump_HeaderT>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.file_header.borrow_mut() = t;
        *self_rc.packets.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Rtpdump_PacketT>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.packets.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Rtpdump {
}
impl Rtpdump {
    pub fn file_header(&self) -> Ref<'_, OptRc<Rtpdump_HeaderT>> {
        self.file_header.borrow()
    }
}
impl Rtpdump {
    pub fn packets(&self) -> Ref<'_, Vec<OptRc<Rtpdump_PacketT>>> {
        self.packets.borrow()
    }
}
impl Rtpdump {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rtpdump_HeaderT {
    pub _root: SharedType<Rtpdump>,
    pub _parent: SharedType<Rtpdump>,
    pub _self: SharedType<Self>,
    shebang: RefCell<Vec<u8>>,
    space: RefCell<Vec<u8>>,
    ip: RefCell<String>,
    port: RefCell<String>,
    start_sec: RefCell<u32>,
    start_usec: RefCell<u32>,
    ip2: RefCell<u32>,
    port2: RefCell<u16>,
    padding: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rtpdump_HeaderT {
    type Root = Rtpdump;
    type Parent = Rtpdump;

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
        *self_rc.shebang.borrow_mut() = _io.read_bytes(12 as usize)?.into();
        if !(*self_rc.shebang() == vec![0x23u8, 0x21u8, 0x72u8, 0x74u8, 0x70u8, 0x70u8, 0x6cu8, 0x61u8, 0x79u8, 0x31u8, 0x2eu8, 0x30u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header_t/seq/0".to_string() }));
        }
        *self_rc.space.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.space() == vec![0x20u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header_t/seq/1".to_string() }));
        }
        *self_rc.ip.borrow_mut() = bytes_to_str(&_io.read_bytes_term(47, false, true, true)?.into(), "ASCII")?;
        *self_rc.port.borrow_mut() = bytes_to_str(&_io.read_bytes_term(10, false, true, true)?.into(), "ASCII")?;
        *self_rc.start_sec.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.start_usec.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ip2.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.port2.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.padding.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Rtpdump_HeaderT {
}
impl Rtpdump_HeaderT {
    pub fn shebang(&self) -> Ref<'_, Vec<u8>> {
        self.shebang.borrow()
    }
}
impl Rtpdump_HeaderT {
    pub fn space(&self) -> Ref<'_, Vec<u8>> {
        self.space.borrow()
    }
}
impl Rtpdump_HeaderT {
    pub fn ip(&self) -> Ref<'_, String> {
        self.ip.borrow()
    }
}
impl Rtpdump_HeaderT {
    pub fn port(&self) -> Ref<'_, String> {
        self.port.borrow()
    }
}

/**
 * start of recording, the seconds part.
 */
impl Rtpdump_HeaderT {
    pub fn start_sec(&self) -> Ref<'_, u32> {
        self.start_sec.borrow()
    }
}

/**
 * start of recording, the microseconds part.
 */
impl Rtpdump_HeaderT {
    pub fn start_usec(&self) -> Ref<'_, u32> {
        self.start_usec.borrow()
    }
}

/**
 * network source.
 */
impl Rtpdump_HeaderT {
    pub fn ip2(&self) -> Ref<'_, u32> {
        self.ip2.borrow()
    }
}

/**
 * port.
 */
impl Rtpdump_HeaderT {
    pub fn port2(&self) -> Ref<'_, u16> {
        self.port2.borrow()
    }
}

/**
 * 2 bytes padding.
 */
impl Rtpdump_HeaderT {
    pub fn padding(&self) -> Ref<'_, u16> {
        self.padding.borrow()
    }
}
impl Rtpdump_HeaderT {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rtpdump_PacketT {
    pub _root: SharedType<Rtpdump>,
    pub _parent: SharedType<Rtpdump>,
    pub _self: SharedType<Self>,
    length: RefCell<u16>,
    len_body: RefCell<u16>,
    packet_usec: RefCell<u32>,
    body: RefCell<OptRc<RtpPacket>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
impl KStruct for Rtpdump_PacketT {
    type Root = Rtpdump;
    type Parent = Rtpdump;

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
        *self_rc.length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.len_body.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.packet_usec.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
        let body_raw = self_rc.body_raw.borrow();
        let _t_body_raw_io = BytesReader::from(body_raw.clone());
        let t = Self::read_into::<BytesReader, RtpPacket>(&_t_body_raw_io, None, None)?.into();
        *self_rc.body.borrow_mut() = t;
        Ok(())
    }
}
impl Rtpdump_PacketT {
}

/**
 * packet length (including this header).
 */
impl Rtpdump_PacketT {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}

/**
 * payload length.
 */
impl Rtpdump_PacketT {
    pub fn len_body(&self) -> Ref<'_, u16> {
        self.len_body.borrow()
    }
}

/**
 * timestamp of packet since the start.
 */
impl Rtpdump_PacketT {
    pub fn packet_usec(&self) -> Ref<'_, u32> {
        self.packet_usec.borrow()
    }
}
impl Rtpdump_PacketT {
    pub fn body(&self) -> Ref<'_, OptRc<RtpPacket>> {
        self.body.borrow()
    }
}
impl Rtpdump_PacketT {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Rtpdump_PacketT {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}
