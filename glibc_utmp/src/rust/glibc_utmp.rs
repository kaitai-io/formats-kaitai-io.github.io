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
pub struct GlibcUtmp {
    pub _root: SharedType<GlibcUtmp>,
    pub _parent: SharedType<GlibcUtmp>,
    pub _self: SharedType<Self>,
    records: RefCell<Vec<OptRc<GlibcUtmp_Record>>>,
    _io: RefCell<BytesReader>,
    records_raw: RefCell<Vec<Vec<u8>>>,
}
impl KStruct for GlibcUtmp {
    type Root = GlibcUtmp;
    type Parent = GlibcUtmp;

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
        *self_rc.records_raw.borrow_mut() = Vec::new();
        *self_rc.records.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.records_raw.borrow_mut().push(_io.read_bytes(384 as usize)?.into());
                let records_raw = self_rc.records_raw.borrow();
                let io_records_raw = BytesReader::from(records_raw.last().unwrap().clone());
                let t = Self::read_into::<BytesReader, GlibcUtmp_Record>(&io_records_raw, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.records.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl GlibcUtmp {
}
impl GlibcUtmp {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<GlibcUtmp_Record>>> {
        self.records.borrow()
    }
}
impl GlibcUtmp {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl GlibcUtmp {
    pub fn records_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.records_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum GlibcUtmp_EntryType {
    Empty,
    RunLvl,
    BootTime,
    NewTime,
    OldTime,
    InitProcess,
    LoginProcess,
    UserProcess,
    DeadProcess,
    Accounting,
    Unknown(i64),
}

impl TryFrom<i64> for GlibcUtmp_EntryType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<GlibcUtmp_EntryType> {
        match flag {
            0 => Ok(GlibcUtmp_EntryType::Empty),
            1 => Ok(GlibcUtmp_EntryType::RunLvl),
            2 => Ok(GlibcUtmp_EntryType::BootTime),
            3 => Ok(GlibcUtmp_EntryType::NewTime),
            4 => Ok(GlibcUtmp_EntryType::OldTime),
            5 => Ok(GlibcUtmp_EntryType::InitProcess),
            6 => Ok(GlibcUtmp_EntryType::LoginProcess),
            7 => Ok(GlibcUtmp_EntryType::UserProcess),
            8 => Ok(GlibcUtmp_EntryType::DeadProcess),
            9 => Ok(GlibcUtmp_EntryType::Accounting),
            _ => Ok(GlibcUtmp_EntryType::Unknown(flag)),
        }
    }
}

impl From<&GlibcUtmp_EntryType> for i64 {
    fn from(v: &GlibcUtmp_EntryType) -> Self {
        match *v {
            GlibcUtmp_EntryType::Empty => 0,
            GlibcUtmp_EntryType::RunLvl => 1,
            GlibcUtmp_EntryType::BootTime => 2,
            GlibcUtmp_EntryType::NewTime => 3,
            GlibcUtmp_EntryType::OldTime => 4,
            GlibcUtmp_EntryType::InitProcess => 5,
            GlibcUtmp_EntryType::LoginProcess => 6,
            GlibcUtmp_EntryType::UserProcess => 7,
            GlibcUtmp_EntryType::DeadProcess => 8,
            GlibcUtmp_EntryType::Accounting => 9,
            GlibcUtmp_EntryType::Unknown(v) => v
        }
    }
}

impl Default for GlibcUtmp_EntryType {
    fn default() -> Self { GlibcUtmp_EntryType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct GlibcUtmp_Record {
    pub _root: SharedType<GlibcUtmp>,
    pub _parent: SharedType<GlibcUtmp>,
    pub _self: SharedType<Self>,
    ut_type: RefCell<GlibcUtmp_EntryType>,
    pid: RefCell<i32>,
    line: RefCell<String>,
    id: RefCell<String>,
    user: RefCell<String>,
    host: RefCell<String>,
    exit: RefCell<u32>,
    session: RefCell<i32>,
    tv: RefCell<OptRc<GlibcUtmp_Timeval>>,
    addr_v6: RefCell<Vec<u8>>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GlibcUtmp_Record {
    type Root = GlibcUtmp;
    type Parent = GlibcUtmp;

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
        *self_rc.ut_type.borrow_mut() = (_io.read_s4le()? as i64).try_into()?;
        *self_rc.pid.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.line.borrow_mut() = bytes_to_str(&_io.read_bytes(32 as usize)?.into(), "UTF-8")?;
        *self_rc.id.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.user.borrow_mut() = bytes_to_str(&_io.read_bytes(32 as usize)?.into(), "UTF-8")?;
        *self_rc.host.borrow_mut() = bytes_to_str(&_io.read_bytes(256 as usize)?.into(), "UTF-8")?;
        *self_rc.exit.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.session.borrow_mut() = _io.read_s4le()?.into();
        let t = Self::read_into::<_, GlibcUtmp_Timeval>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.tv.borrow_mut() = t;
        *self_rc.addr_v6.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(20 as usize)?.into();
        Ok(())
    }
}
impl GlibcUtmp_Record {
}

/**
 * Type of login
 */
impl GlibcUtmp_Record {
    pub fn ut_type(&self) -> Ref<'_, GlibcUtmp_EntryType> {
        self.ut_type.borrow()
    }
}

/**
 * Process ID of login process
 */
impl GlibcUtmp_Record {
    pub fn pid(&self) -> Ref<'_, i32> {
        self.pid.borrow()
    }
}

/**
 * Devicename
 */
impl GlibcUtmp_Record {
    pub fn line(&self) -> Ref<'_, String> {
        self.line.borrow()
    }
}

/**
 * Inittab ID
 */
impl GlibcUtmp_Record {
    pub fn id(&self) -> Ref<'_, String> {
        self.id.borrow()
    }
}

/**
 * Username
 */
impl GlibcUtmp_Record {
    pub fn user(&self) -> Ref<'_, String> {
        self.user.borrow()
    }
}

/**
 * Hostname for remote login
 */
impl GlibcUtmp_Record {
    pub fn host(&self) -> Ref<'_, String> {
        self.host.borrow()
    }
}

/**
 * Exit status of a process marked as DEAD_PROCESS
 */
impl GlibcUtmp_Record {
    pub fn exit(&self) -> Ref<'_, u32> {
        self.exit.borrow()
    }
}

/**
 * Session ID, used for windowing
 */
impl GlibcUtmp_Record {
    pub fn session(&self) -> Ref<'_, i32> {
        self.session.borrow()
    }
}

/**
 * Time entry was made
 */
impl GlibcUtmp_Record {
    pub fn tv(&self) -> Ref<'_, OptRc<GlibcUtmp_Timeval>> {
        self.tv.borrow()
    }
}

/**
 * Internet address of remote host
 */
impl GlibcUtmp_Record {
    pub fn addr_v6(&self) -> Ref<'_, Vec<u8>> {
        self.addr_v6.borrow()
    }
}
impl GlibcUtmp_Record {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl GlibcUtmp_Record {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GlibcUtmp_Timeval {
    pub _root: SharedType<GlibcUtmp>,
    pub _parent: SharedType<GlibcUtmp_Record>,
    pub _self: SharedType<Self>,
    sec: RefCell<u32>,
    usec: RefCell<i32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GlibcUtmp_Timeval {
    type Root = GlibcUtmp;
    type Parent = GlibcUtmp_Record;

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
        *self_rc.sec.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.usec.borrow_mut() = _io.read_s4le()?.into();
        Ok(())
    }
}
impl GlibcUtmp_Timeval {
}

/**
 * Seconds
 */
impl GlibcUtmp_Timeval {
    pub fn sec(&self) -> Ref<'_, u32> {
        self.sec.borrow()
    }
}

/**
 * Microseconds
 */
impl GlibcUtmp_Timeval {
    pub fn usec(&self) -> Ref<'_, i32> {
        self.usec.borrow()
    }
}
impl GlibcUtmp_Timeval {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
