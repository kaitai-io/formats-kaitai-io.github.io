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
 * Btrfs is a copy on write file system based on B-trees focusing on fault tolerance, repair and easy
 * administration. Btrfs is intended to address the lack of pooling, snapshots, checksums, and
 * integral multi-device spanning in Linux file systems.
 * Given any pair of subvolumes (or snapshots), Btrfs can generate a binary diff between them by
 * using the `btrfs send` command that can be replayed later by using `btrfs receive`, possibly on a
 * different Btrfs file system. The `btrfs send` command creates a set of data modifications required
 * for converting one subvolume into another.
 * This spec can be used to disassemble the binary diff created by the `btrfs send` command.
 * If you want a text representation you may want to checkout `btrfs receive --dump` instead.
 * \sa https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/Design_notes_on_Send/Receive.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct BtrfsStream {
    pub _root: SharedType<BtrfsStream>,
    pub _parent: SharedType<BtrfsStream>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<BtrfsStream_SendStreamHeader>>,
    commands: RefCell<Vec<OptRc<BtrfsStream_SendCommand>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BtrfsStream {
    type Root = BtrfsStream;
    type Parent = BtrfsStream;

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
        let t = Self::read_into::<_, BtrfsStream_SendStreamHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.commands.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, BtrfsStream_SendCommand>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.commands.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl BtrfsStream {
}
impl BtrfsStream {
    pub fn header(&self) -> Ref<'_, OptRc<BtrfsStream_SendStreamHeader>> {
        self.header.borrow()
    }
}
impl BtrfsStream {
    pub fn commands(&self) -> Ref<'_, Vec<OptRc<BtrfsStream_SendCommand>>> {
        self.commands.borrow()
    }
}
impl BtrfsStream {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum BtrfsStream_Attribute {
    Unspec,
    Uuid,
    Ctransid,
    Ino,
    Size,
    Mode,
    Uid,
    Gid,
    Rdev,
    Ctime,
    Mtime,
    Atime,
    Otime,
    XattrName,
    XattrData,
    Path,
    PathTo,
    PathLink,
    FileOffset,
    Data,
    CloneUuid,
    CloneCtransid,
    ClonePath,
    CloneOffset,
    CloneLen,
    Unknown(i64),
}

impl TryFrom<i64> for BtrfsStream_Attribute {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<BtrfsStream_Attribute> {
        match flag {
            0 => Ok(BtrfsStream_Attribute::Unspec),
            1 => Ok(BtrfsStream_Attribute::Uuid),
            2 => Ok(BtrfsStream_Attribute::Ctransid),
            3 => Ok(BtrfsStream_Attribute::Ino),
            4 => Ok(BtrfsStream_Attribute::Size),
            5 => Ok(BtrfsStream_Attribute::Mode),
            6 => Ok(BtrfsStream_Attribute::Uid),
            7 => Ok(BtrfsStream_Attribute::Gid),
            8 => Ok(BtrfsStream_Attribute::Rdev),
            9 => Ok(BtrfsStream_Attribute::Ctime),
            10 => Ok(BtrfsStream_Attribute::Mtime),
            11 => Ok(BtrfsStream_Attribute::Atime),
            12 => Ok(BtrfsStream_Attribute::Otime),
            13 => Ok(BtrfsStream_Attribute::XattrName),
            14 => Ok(BtrfsStream_Attribute::XattrData),
            15 => Ok(BtrfsStream_Attribute::Path),
            16 => Ok(BtrfsStream_Attribute::PathTo),
            17 => Ok(BtrfsStream_Attribute::PathLink),
            18 => Ok(BtrfsStream_Attribute::FileOffset),
            19 => Ok(BtrfsStream_Attribute::Data),
            20 => Ok(BtrfsStream_Attribute::CloneUuid),
            21 => Ok(BtrfsStream_Attribute::CloneCtransid),
            22 => Ok(BtrfsStream_Attribute::ClonePath),
            23 => Ok(BtrfsStream_Attribute::CloneOffset),
            24 => Ok(BtrfsStream_Attribute::CloneLen),
            _ => Ok(BtrfsStream_Attribute::Unknown(flag)),
        }
    }
}

impl From<&BtrfsStream_Attribute> for i64 {
    fn from(v: &BtrfsStream_Attribute) -> Self {
        match *v {
            BtrfsStream_Attribute::Unspec => 0,
            BtrfsStream_Attribute::Uuid => 1,
            BtrfsStream_Attribute::Ctransid => 2,
            BtrfsStream_Attribute::Ino => 3,
            BtrfsStream_Attribute::Size => 4,
            BtrfsStream_Attribute::Mode => 5,
            BtrfsStream_Attribute::Uid => 6,
            BtrfsStream_Attribute::Gid => 7,
            BtrfsStream_Attribute::Rdev => 8,
            BtrfsStream_Attribute::Ctime => 9,
            BtrfsStream_Attribute::Mtime => 10,
            BtrfsStream_Attribute::Atime => 11,
            BtrfsStream_Attribute::Otime => 12,
            BtrfsStream_Attribute::XattrName => 13,
            BtrfsStream_Attribute::XattrData => 14,
            BtrfsStream_Attribute::Path => 15,
            BtrfsStream_Attribute::PathTo => 16,
            BtrfsStream_Attribute::PathLink => 17,
            BtrfsStream_Attribute::FileOffset => 18,
            BtrfsStream_Attribute::Data => 19,
            BtrfsStream_Attribute::CloneUuid => 20,
            BtrfsStream_Attribute::CloneCtransid => 21,
            BtrfsStream_Attribute::ClonePath => 22,
            BtrfsStream_Attribute::CloneOffset => 23,
            BtrfsStream_Attribute::CloneLen => 24,
            BtrfsStream_Attribute::Unknown(v) => v
        }
    }
}

impl Default for BtrfsStream_Attribute {
    fn default() -> Self { BtrfsStream_Attribute::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum BtrfsStream_Command {
    Unspec,
    Subvol,
    Snapshot,
    Mkfile,
    Mkdir,
    Mknod,
    Mkfifo,
    Mksock,
    Symlink,
    Rename,
    Link,
    Unlink,
    Rmdir,
    SetXattr,
    RemoveXattr,
    Write,
    Clone,
    Truncate,
    Chmod,
    Chown,
    Utimes,
    End,
    UpdateExtent,
    Unknown(i64),
}

impl TryFrom<i64> for BtrfsStream_Command {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<BtrfsStream_Command> {
        match flag {
            0 => Ok(BtrfsStream_Command::Unspec),
            1 => Ok(BtrfsStream_Command::Subvol),
            2 => Ok(BtrfsStream_Command::Snapshot),
            3 => Ok(BtrfsStream_Command::Mkfile),
            4 => Ok(BtrfsStream_Command::Mkdir),
            5 => Ok(BtrfsStream_Command::Mknod),
            6 => Ok(BtrfsStream_Command::Mkfifo),
            7 => Ok(BtrfsStream_Command::Mksock),
            8 => Ok(BtrfsStream_Command::Symlink),
            9 => Ok(BtrfsStream_Command::Rename),
            10 => Ok(BtrfsStream_Command::Link),
            11 => Ok(BtrfsStream_Command::Unlink),
            12 => Ok(BtrfsStream_Command::Rmdir),
            13 => Ok(BtrfsStream_Command::SetXattr),
            14 => Ok(BtrfsStream_Command::RemoveXattr),
            15 => Ok(BtrfsStream_Command::Write),
            16 => Ok(BtrfsStream_Command::Clone),
            17 => Ok(BtrfsStream_Command::Truncate),
            18 => Ok(BtrfsStream_Command::Chmod),
            19 => Ok(BtrfsStream_Command::Chown),
            20 => Ok(BtrfsStream_Command::Utimes),
            21 => Ok(BtrfsStream_Command::End),
            22 => Ok(BtrfsStream_Command::UpdateExtent),
            _ => Ok(BtrfsStream_Command::Unknown(flag)),
        }
    }
}

impl From<&BtrfsStream_Command> for i64 {
    fn from(v: &BtrfsStream_Command) -> Self {
        match *v {
            BtrfsStream_Command::Unspec => 0,
            BtrfsStream_Command::Subvol => 1,
            BtrfsStream_Command::Snapshot => 2,
            BtrfsStream_Command::Mkfile => 3,
            BtrfsStream_Command::Mkdir => 4,
            BtrfsStream_Command::Mknod => 5,
            BtrfsStream_Command::Mkfifo => 6,
            BtrfsStream_Command::Mksock => 7,
            BtrfsStream_Command::Symlink => 8,
            BtrfsStream_Command::Rename => 9,
            BtrfsStream_Command::Link => 10,
            BtrfsStream_Command::Unlink => 11,
            BtrfsStream_Command::Rmdir => 12,
            BtrfsStream_Command::SetXattr => 13,
            BtrfsStream_Command::RemoveXattr => 14,
            BtrfsStream_Command::Write => 15,
            BtrfsStream_Command::Clone => 16,
            BtrfsStream_Command::Truncate => 17,
            BtrfsStream_Command::Chmod => 18,
            BtrfsStream_Command::Chown => 19,
            BtrfsStream_Command::Utimes => 20,
            BtrfsStream_Command::End => 21,
            BtrfsStream_Command::UpdateExtent => 22,
            BtrfsStream_Command::Unknown(v) => v
        }
    }
}

impl Default for BtrfsStream_Command {
    fn default() -> Self { BtrfsStream_Command::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct BtrfsStream_SendCommand {
    pub _root: SharedType<BtrfsStream>,
    pub _parent: SharedType<BtrfsStream>,
    pub _self: SharedType<Self>,
    len_data: RefCell<u32>,
    type: RefCell<BtrfsStream_Command>,
    checksum: RefCell<Vec<u8>>,
    data: RefCell<OptRc<BtrfsStream_SendCommand_Tlvs>>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
}
impl KStruct for BtrfsStream_SendCommand {
    type Root = BtrfsStream;
    type Parent = BtrfsStream;

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
        *self_rc.len_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.type.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.checksum.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.data_raw.borrow_mut() = _io.read_bytes(*self_rc.len_data() as usize)?.into();
        let data_raw = self_rc.data_raw.borrow();
        let _t_data_raw_io = BytesReader::from(data_raw.clone());
        let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_Tlvs>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.data.borrow_mut() = t;
        Ok(())
    }
}
impl BtrfsStream_SendCommand {
}
impl BtrfsStream_SendCommand {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}
impl BtrfsStream_SendCommand {
    pub fn type(&self) -> Ref<'_, BtrfsStream_Command> {
        self.type.borrow()
    }
}

/**
 * CRC32 checksum of a whole send command, including the header, with this attribute set to 0.
 */
impl BtrfsStream_SendCommand {
    pub fn checksum(&self) -> Ref<'_, Vec<u8>> {
        self.checksum.borrow()
    }
}
impl BtrfsStream_SendCommand {
    pub fn data(&self) -> Ref<'_, OptRc<BtrfsStream_SendCommand_Tlvs>> {
        self.data.borrow()
    }
}
impl BtrfsStream_SendCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl BtrfsStream_SendCommand {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BtrfsStream_SendCommand_String {
    pub _root: SharedType<BtrfsStream>,
    pub _parent: SharedType<BtrfsStream_SendCommand_Tlv>,
    pub _self: SharedType<Self>,
    string: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BtrfsStream_SendCommand_String {
    type Root = BtrfsStream;
    type Parent = BtrfsStream_SendCommand_Tlv;

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
        *self_rc.string.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl BtrfsStream_SendCommand_String {
}
impl BtrfsStream_SendCommand_String {
    pub fn string(&self) -> Ref<'_, String> {
        self.string.borrow()
    }
}
impl BtrfsStream_SendCommand_String {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BtrfsStream_SendCommand_Timespec {
    pub _root: SharedType<BtrfsStream>,
    pub _parent: SharedType<BtrfsStream_SendCommand_Tlv>,
    pub _self: SharedType<Self>,
    ts_sec: RefCell<i64>,
    ts_nsec: RefCell<i32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BtrfsStream_SendCommand_Timespec {
    type Root = BtrfsStream;
    type Parent = BtrfsStream_SendCommand_Tlv;

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
        *self_rc.ts_sec.borrow_mut() = _io.read_s8le()?.into();
        *self_rc.ts_nsec.borrow_mut() = _io.read_s4le()?.into();
        Ok(())
    }
}
impl BtrfsStream_SendCommand_Timespec {
}
impl BtrfsStream_SendCommand_Timespec {
    pub fn ts_sec(&self) -> Ref<'_, i64> {
        self.ts_sec.borrow()
    }
}
impl BtrfsStream_SendCommand_Timespec {
    pub fn ts_nsec(&self) -> Ref<'_, i32> {
        self.ts_nsec.borrow()
    }
}
impl BtrfsStream_SendCommand_Timespec {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BtrfsStream_SendCommand_Tlv {
    pub _root: SharedType<BtrfsStream>,
    pub _parent: SharedType<BtrfsStream_SendCommand_Tlvs>,
    pub _self: SharedType<Self>,
    type: RefCell<BtrfsStream_Attribute>,
    length: RefCell<u16>,
    value: RefCell<Option<BtrfsStream_SendCommand_Tlv_Value>>,
    _io: RefCell<BytesReader>,
    value_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum BtrfsStream_SendCommand_Tlv_Value {
    BtrfsStream_SendCommand_String(OptRc<BtrfsStream_SendCommand_String>),
    U8(u64),
    Bytes(Vec<u8>),
    BtrfsStream_SendCommand_Timespec(OptRc<BtrfsStream_SendCommand_Timespec>),
    BtrfsStream_SendCommand_Uuid(OptRc<BtrfsStream_SendCommand_Uuid>),
}
impl From<&BtrfsStream_SendCommand_Tlv_Value> for OptRc<BtrfsStream_SendCommand_String> {
    fn from(v: &BtrfsStream_SendCommand_Tlv_Value) -> Self {
        if let BtrfsStream_SendCommand_Tlv_Value::BtrfsStream_SendCommand_String(x) = v {
            return x.clone();
        }
        panic!("expected BtrfsStream_SendCommand_Tlv_Value::BtrfsStream_SendCommand_String, got {:?}", v)
    }
}
impl From<OptRc<BtrfsStream_SendCommand_String>> for BtrfsStream_SendCommand_Tlv_Value {
    fn from(v: OptRc<BtrfsStream_SendCommand_String>) -> Self {
        Self::BtrfsStream_SendCommand_String(v)
    }
}
impl From<&BtrfsStream_SendCommand_Tlv_Value> for u64 {
    fn from(v: &BtrfsStream_SendCommand_Tlv_Value) -> Self {
        if let BtrfsStream_SendCommand_Tlv_Value::U8(x) = v {
            return x.clone();
        }
        panic!("expected BtrfsStream_SendCommand_Tlv_Value::U8, got {:?}", v)
    }
}
impl From<u64> for BtrfsStream_SendCommand_Tlv_Value {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&BtrfsStream_SendCommand_Tlv_Value> for Vec<u8> {
    fn from(v: &BtrfsStream_SendCommand_Tlv_Value) -> Self {
        if let BtrfsStream_SendCommand_Tlv_Value::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected BtrfsStream_SendCommand_Tlv_Value::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for BtrfsStream_SendCommand_Tlv_Value {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&BtrfsStream_SendCommand_Tlv_Value> for OptRc<BtrfsStream_SendCommand_Timespec> {
    fn from(v: &BtrfsStream_SendCommand_Tlv_Value) -> Self {
        if let BtrfsStream_SendCommand_Tlv_Value::BtrfsStream_SendCommand_Timespec(x) = v {
            return x.clone();
        }
        panic!("expected BtrfsStream_SendCommand_Tlv_Value::BtrfsStream_SendCommand_Timespec, got {:?}", v)
    }
}
impl From<OptRc<BtrfsStream_SendCommand_Timespec>> for BtrfsStream_SendCommand_Tlv_Value {
    fn from(v: OptRc<BtrfsStream_SendCommand_Timespec>) -> Self {
        Self::BtrfsStream_SendCommand_Timespec(v)
    }
}
impl From<&BtrfsStream_SendCommand_Tlv_Value> for OptRc<BtrfsStream_SendCommand_Uuid> {
    fn from(v: &BtrfsStream_SendCommand_Tlv_Value) -> Self {
        if let BtrfsStream_SendCommand_Tlv_Value::BtrfsStream_SendCommand_Uuid(x) = v {
            return x.clone();
        }
        panic!("expected BtrfsStream_SendCommand_Tlv_Value::BtrfsStream_SendCommand_Uuid, got {:?}", v)
    }
}
impl From<OptRc<BtrfsStream_SendCommand_Uuid>> for BtrfsStream_SendCommand_Tlv_Value {
    fn from(v: OptRc<BtrfsStream_SendCommand_Uuid>) -> Self {
        Self::BtrfsStream_SendCommand_Uuid(v)
    }
}
impl KStruct for BtrfsStream_SendCommand_Tlv {
    type Root = BtrfsStream;
    type Parent = BtrfsStream_SendCommand_Tlvs;

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
        *self_rc.type.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.length.borrow_mut() = _io.read_u2le()?.into();
        match *self_rc.type() {
            BtrfsStream_Attribute::Atime => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_Timespec>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            BtrfsStream_Attribute::CloneCtransid => {
                *self_rc.value.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            BtrfsStream_Attribute::CloneLen => {
                *self_rc.value.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            BtrfsStream_Attribute::CloneOffset => {
                *self_rc.value.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            BtrfsStream_Attribute::ClonePath => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_String>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            BtrfsStream_Attribute::CloneUuid => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_Uuid>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            BtrfsStream_Attribute::Ctime => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_Timespec>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            BtrfsStream_Attribute::Ctransid => {
                *self_rc.value.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            BtrfsStream_Attribute::FileOffset => {
                *self_rc.value.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            BtrfsStream_Attribute::Gid => {
                *self_rc.value.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            BtrfsStream_Attribute::Mode => {
                *self_rc.value.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            BtrfsStream_Attribute::Mtime => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_Timespec>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            BtrfsStream_Attribute::Otime => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_Timespec>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            BtrfsStream_Attribute::Path => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_String>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            BtrfsStream_Attribute::PathLink => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_String>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            BtrfsStream_Attribute::PathTo => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_String>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            BtrfsStream_Attribute::Rdev => {
                *self_rc.value.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            BtrfsStream_Attribute::Size => {
                *self_rc.value.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            BtrfsStream_Attribute::Uid => {
                *self_rc.value.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            BtrfsStream_Attribute::Uuid => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_Uuid>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            BtrfsStream_Attribute::XattrName => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, BtrfsStream_SendCommand_String>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.value.borrow_mut() = Some(_io.read_bytes(*self_rc.length() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl BtrfsStream_SendCommand_Tlv {
}
impl BtrfsStream_SendCommand_Tlv {
    pub fn type(&self) -> Ref<'_, BtrfsStream_Attribute> {
        self.type.borrow()
    }
}
impl BtrfsStream_SendCommand_Tlv {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl BtrfsStream_SendCommand_Tlv {
    pub fn value(&self) -> Ref<'_, Option<BtrfsStream_SendCommand_Tlv_Value>> {
        self.value.borrow()
    }
}
impl BtrfsStream_SendCommand_Tlv {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl BtrfsStream_SendCommand_Tlv {
    pub fn value_raw(&self) -> Ref<'_, Vec<u8>> {
        self.value_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BtrfsStream_SendCommand_Tlvs {
    pub _root: SharedType<BtrfsStream>,
    pub _parent: SharedType<BtrfsStream_SendCommand>,
    pub _self: SharedType<Self>,
    tlv: RefCell<Vec<OptRc<BtrfsStream_SendCommand_Tlv>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BtrfsStream_SendCommand_Tlvs {
    type Root = BtrfsStream;
    type Parent = BtrfsStream_SendCommand;

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
        *self_rc.tlv.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, BtrfsStream_SendCommand_Tlv>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.tlv.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl BtrfsStream_SendCommand_Tlvs {
}
impl BtrfsStream_SendCommand_Tlvs {
    pub fn tlv(&self) -> Ref<'_, Vec<OptRc<BtrfsStream_SendCommand_Tlv>>> {
        self.tlv.borrow()
    }
}
impl BtrfsStream_SendCommand_Tlvs {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BtrfsStream_SendCommand_Uuid {
    pub _root: SharedType<BtrfsStream>,
    pub _parent: SharedType<BtrfsStream_SendCommand_Tlv>,
    pub _self: SharedType<Self>,
    uuid: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BtrfsStream_SendCommand_Uuid {
    type Root = BtrfsStream;
    type Parent = BtrfsStream_SendCommand_Tlv;

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
        *self_rc.uuid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        Ok(())
    }
}
impl BtrfsStream_SendCommand_Uuid {
}
impl BtrfsStream_SendCommand_Uuid {
    pub fn uuid(&self) -> Ref<'_, Vec<u8>> {
        self.uuid.borrow()
    }
}
impl BtrfsStream_SendCommand_Uuid {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BtrfsStream_SendStreamHeader {
    pub _root: SharedType<BtrfsStream>,
    pub _parent: SharedType<BtrfsStream>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BtrfsStream_SendStreamHeader {
    type Root = BtrfsStream;
    type Parent = BtrfsStream;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(13 as usize)?.into();
        if !(*self_rc.magic() == vec![0x62u8, 0x74u8, 0x72u8, 0x66u8, 0x73u8, 0x2du8, 0x73u8, 0x74u8, 0x72u8, 0x65u8, 0x61u8, 0x6du8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/send_stream_header/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl BtrfsStream_SendStreamHeader {
}
impl BtrfsStream_SendStreamHeader {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl BtrfsStream_SendStreamHeader {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}
impl BtrfsStream_SendStreamHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
