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
use std::fmt;

/**
 * TCP is one of the core Internet protocols on transport layer (AKA
 * OSI layer 4), providing stateful connections with error checking,
 * guarantees of delivery, order of segments and avoidance of duplicate
 * delivery.
 */

#[derive(Default, Debug, Clone)]
pub struct TcpSegment {
    pub _root: SharedType<TcpSegment>,
    pub _parent: SharedType<TcpSegment>,
    pub _self: SharedType<Self>,
    src_port: RefCell<u16>,
    dst_port: RefCell<u16>,
    seq_num: RefCell<u32>,
    ack_num: RefCell<u32>,
    data_offset: RefCell<u64>,
    reserved: RefCell<u64>,
    flags: RefCell<OptRc<TcpSegment_Flags>>,
    window_size: RefCell<u16>,
    checksum: RefCell<u16>,
    urgent_pointer: RefCell<u16>,
    options: RefCell<Vec<u8>>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TcpSegment {
    type Root = TcpSegment;
    type Parent = TcpSegment;

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
        *self_rc.src_port.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.dst_port.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.seq_num.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ack_num.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.data_offset.borrow_mut() = _io.read_bits_int_be(4)?;
        *self_rc.reserved.borrow_mut() = _io.read_bits_int_be(4)?;
        _io.align_to_byte()?;
        let t = Self::read_into::<_, TcpSegment_Flags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.window_size.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.checksum.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.urgent_pointer.borrow_mut() = _io.read_u2be()?.into();
        if ((((((*self_rc.data_offset() as i32) * (4 as i32)) as i32) - (20 as i32)) as i32) != (0 as i32)) {
            *self_rc.options.borrow_mut() = _io.read_bytes(((((*self_rc.data_offset() as i32) * (4 as i32)) as i32) - (20 as i32)) as usize)?.into();
        }
        *self_rc.body.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl TcpSegment {
}

/**
 * Source port
 */
impl TcpSegment {
    pub fn src_port(&self) -> Ref<'_, u16> {
        self.src_port.borrow()
    }
}

/**
 * Destination port
 */
impl TcpSegment {
    pub fn dst_port(&self) -> Ref<'_, u16> {
        self.dst_port.borrow()
    }
}

/**
 * Sequence number
 */
impl TcpSegment {
    pub fn seq_num(&self) -> Ref<'_, u32> {
        self.seq_num.borrow()
    }
}

/**
 * Acknowledgment number
 */
impl TcpSegment {
    pub fn ack_num(&self) -> Ref<'_, u32> {
        self.ack_num.borrow()
    }
}

/**
 * Data offset (in 32-bit words from the beginning of this type, normally 32 or can be extended if there are any TCP options or padding is present)
 */
impl TcpSegment {
    pub fn data_offset(&self) -> Ref<'_, u64> {
        self.data_offset.borrow()
    }
}
impl TcpSegment {
    pub fn reserved(&self) -> Ref<'_, u64> {
        self.reserved.borrow()
    }
}
impl TcpSegment {
    pub fn flags(&self) -> Ref<'_, OptRc<TcpSegment_Flags>> {
        self.flags.borrow()
    }
}
impl TcpSegment {
    pub fn window_size(&self) -> Ref<'_, u16> {
        self.window_size.borrow()
    }
}
impl TcpSegment {
    pub fn checksum(&self) -> Ref<'_, u16> {
        self.checksum.borrow()
    }
}
impl TcpSegment {
    pub fn urgent_pointer(&self) -> Ref<'_, u16> {
        self.urgent_pointer.borrow()
    }
}
impl TcpSegment {
    pub fn options(&self) -> Ref<'_, Vec<u8>> {
        self.options.borrow()
    }
}
impl TcpSegment {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl TcpSegment {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * TCP header flags as defined "TCP Header Flags" registry.
 */

#[derive(Default, Debug, Clone)]
pub struct TcpSegment_Flags {
    pub _root: SharedType<TcpSegment>,
    pub _parent: SharedType<TcpSegment>,
    pub _self: SharedType<Self>,
    cwr: RefCell<bool>,
    ece: RefCell<bool>,
    urg: RefCell<bool>,
    ack: RefCell<bool>,
    psh: RefCell<bool>,
    rst: RefCell<bool>,
    syn: RefCell<bool>,
    fin: RefCell<bool>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TcpSegment_Flags {
    type Root = TcpSegment;
    type Parent = TcpSegment;

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
        *self_rc.cwr.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.ece.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.urg.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.ack.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.psh.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.rst.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.syn.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.fin.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        Ok(())
    }
}
impl TcpSegment_Flags {
}

/**
 * Congestion Window Reduced
 */
impl TcpSegment_Flags {
    pub fn cwr(&self) -> Ref<'_, bool> {
        self.cwr.borrow()
    }
}

/**
 * ECN-Echo
 */
impl TcpSegment_Flags {
    pub fn ece(&self) -> Ref<'_, bool> {
        self.ece.borrow()
    }
}

/**
 * Urgent pointer field is significant
 */
impl TcpSegment_Flags {
    pub fn urg(&self) -> Ref<'_, bool> {
        self.urg.borrow()
    }
}

/**
 * Acknowledgment field is significant
 */
impl TcpSegment_Flags {
    pub fn ack(&self) -> Ref<'_, bool> {
        self.ack.borrow()
    }
}

/**
 * Push function
 */
impl TcpSegment_Flags {
    pub fn psh(&self) -> Ref<'_, bool> {
        self.psh.borrow()
    }
}

/**
 * Reset the connection
 */
impl TcpSegment_Flags {
    pub fn rst(&self) -> Ref<'_, bool> {
        self.rst.borrow()
    }
}

/**
 * Synchronize sequence numbers
 */
impl TcpSegment_Flags {
    pub fn syn(&self) -> Ref<'_, bool> {
        self.syn.borrow()
    }
}

/**
 * No more data from sender
 */
impl TcpSegment_Flags {
    pub fn fin(&self) -> Ref<'_, bool> {
        self.fin.borrow()
    }
}
impl TcpSegment_Flags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl fmt::Display for TcpSegment_Flags {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}", format!("{}{}", format!("{}{}", format!("{}{}", format!("{}{}", format!("{}{}", format!("{}{}", format!("{}{}", if *self.cwr() { "|CWR".to_string() } else { "".to_string() }, if *self.ece() { "|ECE".to_string() } else { "".to_string() }), if *self.urg() { "|URG".to_string() } else { "".to_string() }), if *self.ack() { "|ACK".to_string() } else { "".to_string() }), if *self.psh() { "|PSH".to_string() } else { "".to_string() }), if *self.rst() { "|RST".to_string() } else { "".to_string() }), if *self.syn() { "|SYN".to_string() } else { "".to_string() }), if *self.fin() { "|FIN".to_string() } else { "".to_string() }))
    }
}
