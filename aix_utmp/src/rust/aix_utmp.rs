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
 * This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
 * \sa https://www.ibm.com/docs/en/aix/7.1?topic=files-utmph-file Source
 */

#[derive(Default, Debug, Clone)]
pub struct AixUtmp {
    pub _root: SharedType<AixUtmp>,
    pub _parent: SharedType<AixUtmp>,
    pub _self: SharedType<Self>,
    records: RefCell<Vec<OptRc<AixUtmp_Record>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AixUtmp {
    type Root = AixUtmp;
    type Parent = AixUtmp;

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
                let t = Self::read_into::<_, AixUtmp_Record>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.records.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl AixUtmp {
}
impl AixUtmp {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<AixUtmp_Record>>> {
        self.records.borrow()
    }
}
impl AixUtmp {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum AixUtmp_EntryType {
    Empty,
    RunLvl,
    BootTime,
    OldTime,
    NewTime,
    InitProcess,
    LoginProcess,
    UserProcess,
    DeadProcess,
    Accounting,
    Unknown(i64),
}

impl TryFrom<i64> for AixUtmp_EntryType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<AixUtmp_EntryType> {
        match flag {
            0 => Ok(AixUtmp_EntryType::Empty),
            1 => Ok(AixUtmp_EntryType::RunLvl),
            2 => Ok(AixUtmp_EntryType::BootTime),
            3 => Ok(AixUtmp_EntryType::OldTime),
            4 => Ok(AixUtmp_EntryType::NewTime),
            5 => Ok(AixUtmp_EntryType::InitProcess),
            6 => Ok(AixUtmp_EntryType::LoginProcess),
            7 => Ok(AixUtmp_EntryType::UserProcess),
            8 => Ok(AixUtmp_EntryType::DeadProcess),
            9 => Ok(AixUtmp_EntryType::Accounting),
            _ => Ok(AixUtmp_EntryType::Unknown(flag)),
        }
    }
}

impl From<&AixUtmp_EntryType> for i64 {
    fn from(v: &AixUtmp_EntryType) -> Self {
        match *v {
            AixUtmp_EntryType::Empty => 0,
            AixUtmp_EntryType::RunLvl => 1,
            AixUtmp_EntryType::BootTime => 2,
            AixUtmp_EntryType::OldTime => 3,
            AixUtmp_EntryType::NewTime => 4,
            AixUtmp_EntryType::InitProcess => 5,
            AixUtmp_EntryType::LoginProcess => 6,
            AixUtmp_EntryType::UserProcess => 7,
            AixUtmp_EntryType::DeadProcess => 8,
            AixUtmp_EntryType::Accounting => 9,
            AixUtmp_EntryType::Unknown(v) => v
        }
    }
}

impl Default for AixUtmp_EntryType {
    fn default() -> Self { AixUtmp_EntryType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct AixUtmp_ExitStatus {
    pub _root: SharedType<AixUtmp>,
    pub _parent: SharedType<AixUtmp_Record>,
    pub _self: SharedType<Self>,
    termination_code: RefCell<i16>,
    exit_code: RefCell<i16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AixUtmp_ExitStatus {
    type Root = AixUtmp;
    type Parent = AixUtmp_Record;

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
        *self_rc.termination_code.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.exit_code.borrow_mut() = _io.read_s2be()?.into();
        Ok(())
    }
}
impl AixUtmp_ExitStatus {
}

/**
 * process termination status
 */
impl AixUtmp_ExitStatus {
    pub fn termination_code(&self) -> Ref<'_, i16> {
        self.termination_code.borrow()
    }
}

/**
 * process exit status
 */
impl AixUtmp_ExitStatus {
    pub fn exit_code(&self) -> Ref<'_, i16> {
        self.exit_code.borrow()
    }
}
impl AixUtmp_ExitStatus {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AixUtmp_Record {
    pub _root: SharedType<AixUtmp>,
    pub _parent: SharedType<AixUtmp>,
    pub _self: SharedType<Self>,
    user: RefCell<String>,
    inittab_id: RefCell<String>,
    device: RefCell<String>,
    pid: RefCell<u64>,
    type: RefCell<AixUtmp_EntryType>,
    timestamp: RefCell<i64>,
    exit_status: RefCell<OptRc<AixUtmp_ExitStatus>>,
    hostname: RefCell<String>,
    dbl_word_pad: RefCell<i32>,
    reserved_a: RefCell<Vec<u8>>,
    reserved_v: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AixUtmp_Record {
    type Root = AixUtmp;
    type Parent = AixUtmp;

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
        *self_rc.user.borrow_mut() = bytes_to_str(&_io.read_bytes(256 as usize)?.into(), "ASCII")?;
        *self_rc.inittab_id.borrow_mut() = bytes_to_str(&_io.read_bytes(14 as usize)?.into(), "ASCII")?;
        *self_rc.device.borrow_mut() = bytes_to_str(&_io.read_bytes(64 as usize)?.into(), "ASCII")?;
        *self_rc.pid.borrow_mut() = _io.read_u8be()?.into();
        *self_rc.type.borrow_mut() = (_io.read_s2be()? as i64).try_into()?;
        *self_rc.timestamp.borrow_mut() = _io.read_s8be()?.into();
        let t = Self::read_into::<_, AixUtmp_ExitStatus>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.exit_status.borrow_mut() = t;
        *self_rc.hostname.borrow_mut() = bytes_to_str(&_io.read_bytes(256 as usize)?.into(), "ASCII")?;
        *self_rc.dbl_word_pad.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.reserved_a.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        *self_rc.reserved_v.borrow_mut() = _io.read_bytes(24 as usize)?.into();
        Ok(())
    }
}
impl AixUtmp_Record {
}

/**
 * User login name
 */
impl AixUtmp_Record {
    pub fn user(&self) -> Ref<'_, String> {
        self.user.borrow()
    }
}

/**
 * /etc/inittab id
 */
impl AixUtmp_Record {
    pub fn inittab_id(&self) -> Ref<'_, String> {
        self.inittab_id.borrow()
    }
}

/**
 * device name (console, lnxx)
 */
impl AixUtmp_Record {
    pub fn device(&self) -> Ref<'_, String> {
        self.device.borrow()
    }
}

/**
 * process id
 */
impl AixUtmp_Record {
    pub fn pid(&self) -> Ref<'_, u64> {
        self.pid.borrow()
    }
}

/**
 * Type of login
 */
impl AixUtmp_Record {
    pub fn type(&self) -> Ref<'_, AixUtmp_EntryType> {
        self.type.borrow()
    }
}

/**
 * time entry was made
 */
impl AixUtmp_Record {
    pub fn timestamp(&self) -> Ref<'_, i64> {
        self.timestamp.borrow()
    }
}

/**
 * the exit status of a process marked as DEAD PROCESS
 */
impl AixUtmp_Record {
    pub fn exit_status(&self) -> Ref<'_, OptRc<AixUtmp_ExitStatus>> {
        self.exit_status.borrow()
    }
}

/**
 * host name
 */
impl AixUtmp_Record {
    pub fn hostname(&self) -> Ref<'_, String> {
        self.hostname.borrow()
    }
}
impl AixUtmp_Record {
    pub fn dbl_word_pad(&self) -> Ref<'_, i32> {
        self.dbl_word_pad.borrow()
    }
}
impl AixUtmp_Record {
    pub fn reserved_a(&self) -> Ref<'_, Vec<u8>> {
        self.reserved_a.borrow()
    }
}
impl AixUtmp_Record {
    pub fn reserved_v(&self) -> Ref<'_, Vec<u8>> {
        self.reserved_v.borrow()
    }
}
impl AixUtmp_Record {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
