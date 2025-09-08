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
 * Windows MiniDump (MDMP) file provides a concise way to store process
 * core dumps, which is useful for debugging. Given its small size,
 * modularity, some cross-platform features and native support in some
 * debuggers, it is particularly useful for crash reporting, and is
 * used for that purpose in Windows and Google Chrome projects.
 * 
 * The file itself is a container, which contains a number of typed
 * "streams", which contain some data according to its type attribute.
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_header Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<WindowsMinidump>,
    pub _self: SharedType<Self>,
    magic1: RefCell<Vec<u8>>,
    magic2: RefCell<Vec<u8>>,
    version: RefCell<u16>,
    num_streams: RefCell<u32>,
    ofs_streams: RefCell<u32>,
    checksum: RefCell<u32>,
    timestamp: RefCell<u32>,
    flags: RefCell<u64>,
    _io: RefCell<BytesReader>,
    f_streams: Cell<bool>,
    streams: RefCell<Vec<OptRc<WindowsMinidump_Dir>>>,
}
impl KStruct for WindowsMinidump {
    type Root = WindowsMinidump;
    type Parent = WindowsMinidump;

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
        *self_rc.magic1.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic1() == vec![0x4du8, 0x44u8, 0x4du8, 0x50u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.magic2.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.magic2() == vec![0x93u8, 0xa7u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/1".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.num_streams.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_streams.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.checksum.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.timestamp.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl WindowsMinidump {
    pub fn streams(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<WindowsMinidump_Dir>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_streams.get() {
            return Ok(self.streams.borrow());
        }
        self.f_streams.set(true);
        let _pos = _io.pos();
        _io.seek(*self.ofs_streams() as usize)?;
        *self.streams.borrow_mut() = Vec::new();
        let l_streams = *self.num_streams();
        for _i in 0..l_streams {
            let t = Self::read_into::<_, WindowsMinidump_Dir>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.streams.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.streams.borrow())
    }
}
impl WindowsMinidump {
    pub fn magic1(&self) -> Ref<'_, Vec<u8>> {
        self.magic1.borrow()
    }
}
impl WindowsMinidump {
    pub fn magic2(&self) -> Ref<'_, Vec<u8>> {
        self.magic2.borrow()
    }
}
impl WindowsMinidump {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}
impl WindowsMinidump {
    pub fn num_streams(&self) -> Ref<'_, u32> {
        self.num_streams.borrow()
    }
}
impl WindowsMinidump {
    pub fn ofs_streams(&self) -> Ref<'_, u32> {
        self.ofs_streams.borrow()
    }
}
impl WindowsMinidump {
    pub fn checksum(&self) -> Ref<'_, u32> {
        self.checksum.borrow()
    }
}
impl WindowsMinidump {
    pub fn timestamp(&self) -> Ref<'_, u32> {
        self.timestamp.borrow()
    }
}
impl WindowsMinidump {
    pub fn flags(&self) -> Ref<'_, u64> {
        self.flags.borrow()
    }
}
impl WindowsMinidump {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum WindowsMinidump_StreamTypes {
    Unused,
    Reserved0,
    Reserved1,
    ThreadList,
    ModuleList,
    MemoryList,
    Exception,
    SystemInfo,
    ThreadExList,
    Memory64List,
    CommentA,
    CommentW,
    HandleData,
    FunctionTable,
    UnloadedModuleList,
    MiscInfo,
    MemoryInfoList,
    ThreadInfoList,
    HandleOperationList,
    Token,
    JavaScriptData,
    SystemMemoryInfo,
    ProcessVmCounters,
    IptTrace,
    ThreadNames,
    CeNull,
    CeSystemInfo,
    CeException,
    CeModuleList,
    CeProcessList,
    CeThreadList,
    CeThreadContextList,
    CeThreadCallStackList,
    CeMemoryVirtualList,
    CeMemoryPhysicalList,
    CeBucketParameters,
    CeProcessModuleMap,
    CeDiagnosisList,
    MdCrashpadInfoStream,
    MdRawBreakpadInfo,
    MdRawAssertionInfo,
    MdLinuxCpuInfo,
    MdLinuxProcStatus,
    MdLinuxLsbRelease,
    MdLinuxCmdLine,
    MdLinuxEnviron,
    MdLinuxAuxv,
    MdLinuxMaps,
    MdLinuxDsoDebug,
    Unknown(i64),
}

impl TryFrom<i64> for WindowsMinidump_StreamTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<WindowsMinidump_StreamTypes> {
        match flag {
            0 => Ok(WindowsMinidump_StreamTypes::Unused),
            1 => Ok(WindowsMinidump_StreamTypes::Reserved0),
            2 => Ok(WindowsMinidump_StreamTypes::Reserved1),
            3 => Ok(WindowsMinidump_StreamTypes::ThreadList),
            4 => Ok(WindowsMinidump_StreamTypes::ModuleList),
            5 => Ok(WindowsMinidump_StreamTypes::MemoryList),
            6 => Ok(WindowsMinidump_StreamTypes::Exception),
            7 => Ok(WindowsMinidump_StreamTypes::SystemInfo),
            8 => Ok(WindowsMinidump_StreamTypes::ThreadExList),
            9 => Ok(WindowsMinidump_StreamTypes::Memory64List),
            10 => Ok(WindowsMinidump_StreamTypes::CommentA),
            11 => Ok(WindowsMinidump_StreamTypes::CommentW),
            12 => Ok(WindowsMinidump_StreamTypes::HandleData),
            13 => Ok(WindowsMinidump_StreamTypes::FunctionTable),
            14 => Ok(WindowsMinidump_StreamTypes::UnloadedModuleList),
            15 => Ok(WindowsMinidump_StreamTypes::MiscInfo),
            16 => Ok(WindowsMinidump_StreamTypes::MemoryInfoList),
            17 => Ok(WindowsMinidump_StreamTypes::ThreadInfoList),
            18 => Ok(WindowsMinidump_StreamTypes::HandleOperationList),
            19 => Ok(WindowsMinidump_StreamTypes::Token),
            20 => Ok(WindowsMinidump_StreamTypes::JavaScriptData),
            21 => Ok(WindowsMinidump_StreamTypes::SystemMemoryInfo),
            22 => Ok(WindowsMinidump_StreamTypes::ProcessVmCounters),
            23 => Ok(WindowsMinidump_StreamTypes::IptTrace),
            24 => Ok(WindowsMinidump_StreamTypes::ThreadNames),
            32768 => Ok(WindowsMinidump_StreamTypes::CeNull),
            32769 => Ok(WindowsMinidump_StreamTypes::CeSystemInfo),
            32770 => Ok(WindowsMinidump_StreamTypes::CeException),
            32771 => Ok(WindowsMinidump_StreamTypes::CeModuleList),
            32772 => Ok(WindowsMinidump_StreamTypes::CeProcessList),
            32773 => Ok(WindowsMinidump_StreamTypes::CeThreadList),
            32774 => Ok(WindowsMinidump_StreamTypes::CeThreadContextList),
            32775 => Ok(WindowsMinidump_StreamTypes::CeThreadCallStackList),
            32776 => Ok(WindowsMinidump_StreamTypes::CeMemoryVirtualList),
            32777 => Ok(WindowsMinidump_StreamTypes::CeMemoryPhysicalList),
            32778 => Ok(WindowsMinidump_StreamTypes::CeBucketParameters),
            32779 => Ok(WindowsMinidump_StreamTypes::CeProcessModuleMap),
            32780 => Ok(WindowsMinidump_StreamTypes::CeDiagnosisList),
            1129316353 => Ok(WindowsMinidump_StreamTypes::MdCrashpadInfoStream),
            1197932545 => Ok(WindowsMinidump_StreamTypes::MdRawBreakpadInfo),
            1197932546 => Ok(WindowsMinidump_StreamTypes::MdRawAssertionInfo),
            1197932547 => Ok(WindowsMinidump_StreamTypes::MdLinuxCpuInfo),
            1197932548 => Ok(WindowsMinidump_StreamTypes::MdLinuxProcStatus),
            1197932549 => Ok(WindowsMinidump_StreamTypes::MdLinuxLsbRelease),
            1197932550 => Ok(WindowsMinidump_StreamTypes::MdLinuxCmdLine),
            1197932551 => Ok(WindowsMinidump_StreamTypes::MdLinuxEnviron),
            1197932552 => Ok(WindowsMinidump_StreamTypes::MdLinuxAuxv),
            1197932553 => Ok(WindowsMinidump_StreamTypes::MdLinuxMaps),
            1197932554 => Ok(WindowsMinidump_StreamTypes::MdLinuxDsoDebug),
            _ => Ok(WindowsMinidump_StreamTypes::Unknown(flag)),
        }
    }
}

impl From<&WindowsMinidump_StreamTypes> for i64 {
    fn from(v: &WindowsMinidump_StreamTypes) -> Self {
        match *v {
            WindowsMinidump_StreamTypes::Unused => 0,
            WindowsMinidump_StreamTypes::Reserved0 => 1,
            WindowsMinidump_StreamTypes::Reserved1 => 2,
            WindowsMinidump_StreamTypes::ThreadList => 3,
            WindowsMinidump_StreamTypes::ModuleList => 4,
            WindowsMinidump_StreamTypes::MemoryList => 5,
            WindowsMinidump_StreamTypes::Exception => 6,
            WindowsMinidump_StreamTypes::SystemInfo => 7,
            WindowsMinidump_StreamTypes::ThreadExList => 8,
            WindowsMinidump_StreamTypes::Memory64List => 9,
            WindowsMinidump_StreamTypes::CommentA => 10,
            WindowsMinidump_StreamTypes::CommentW => 11,
            WindowsMinidump_StreamTypes::HandleData => 12,
            WindowsMinidump_StreamTypes::FunctionTable => 13,
            WindowsMinidump_StreamTypes::UnloadedModuleList => 14,
            WindowsMinidump_StreamTypes::MiscInfo => 15,
            WindowsMinidump_StreamTypes::MemoryInfoList => 16,
            WindowsMinidump_StreamTypes::ThreadInfoList => 17,
            WindowsMinidump_StreamTypes::HandleOperationList => 18,
            WindowsMinidump_StreamTypes::Token => 19,
            WindowsMinidump_StreamTypes::JavaScriptData => 20,
            WindowsMinidump_StreamTypes::SystemMemoryInfo => 21,
            WindowsMinidump_StreamTypes::ProcessVmCounters => 22,
            WindowsMinidump_StreamTypes::IptTrace => 23,
            WindowsMinidump_StreamTypes::ThreadNames => 24,
            WindowsMinidump_StreamTypes::CeNull => 32768,
            WindowsMinidump_StreamTypes::CeSystemInfo => 32769,
            WindowsMinidump_StreamTypes::CeException => 32770,
            WindowsMinidump_StreamTypes::CeModuleList => 32771,
            WindowsMinidump_StreamTypes::CeProcessList => 32772,
            WindowsMinidump_StreamTypes::CeThreadList => 32773,
            WindowsMinidump_StreamTypes::CeThreadContextList => 32774,
            WindowsMinidump_StreamTypes::CeThreadCallStackList => 32775,
            WindowsMinidump_StreamTypes::CeMemoryVirtualList => 32776,
            WindowsMinidump_StreamTypes::CeMemoryPhysicalList => 32777,
            WindowsMinidump_StreamTypes::CeBucketParameters => 32778,
            WindowsMinidump_StreamTypes::CeProcessModuleMap => 32779,
            WindowsMinidump_StreamTypes::CeDiagnosisList => 32780,
            WindowsMinidump_StreamTypes::MdCrashpadInfoStream => 1129316353,
            WindowsMinidump_StreamTypes::MdRawBreakpadInfo => 1197932545,
            WindowsMinidump_StreamTypes::MdRawAssertionInfo => 1197932546,
            WindowsMinidump_StreamTypes::MdLinuxCpuInfo => 1197932547,
            WindowsMinidump_StreamTypes::MdLinuxProcStatus => 1197932548,
            WindowsMinidump_StreamTypes::MdLinuxLsbRelease => 1197932549,
            WindowsMinidump_StreamTypes::MdLinuxCmdLine => 1197932550,
            WindowsMinidump_StreamTypes::MdLinuxEnviron => 1197932551,
            WindowsMinidump_StreamTypes::MdLinuxAuxv => 1197932552,
            WindowsMinidump_StreamTypes::MdLinuxMaps => 1197932553,
            WindowsMinidump_StreamTypes::MdLinuxDsoDebug => 1197932554,
            WindowsMinidump_StreamTypes::Unknown(v) => v
        }
    }
}

impl Default for WindowsMinidump_StreamTypes {
    fn default() -> Self { WindowsMinidump_StreamTypes::Unknown(0) }
}


/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_directory Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump_Dir {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<WindowsMinidump>,
    pub _self: SharedType<Self>,
    stream_type: RefCell<WindowsMinidump_StreamTypes>,
    len_data: RefCell<u32>,
    ofs_data: RefCell<u32>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
    f_data: Cell<bool>,
    data: RefCell<Option<WindowsMinidump_Dir_Data>>,
}
#[derive(Debug, Clone)]
pub enum WindowsMinidump_Dir_Data {
    WindowsMinidump_ExceptionStream(OptRc<WindowsMinidump_ExceptionStream>),
    WindowsMinidump_SystemInfo(OptRc<WindowsMinidump_SystemInfo>),
    WindowsMinidump_ThreadList(OptRc<WindowsMinidump_ThreadList>),
    Bytes(Vec<u8>),
    WindowsMinidump_MemoryList(OptRc<WindowsMinidump_MemoryList>),
    WindowsMinidump_MiscInfo(OptRc<WindowsMinidump_MiscInfo>),
}
impl From<&WindowsMinidump_Dir_Data> for OptRc<WindowsMinidump_ExceptionStream> {
    fn from(v: &WindowsMinidump_Dir_Data) -> Self {
        if let WindowsMinidump_Dir_Data::WindowsMinidump_ExceptionStream(x) = v {
            return x.clone();
        }
        panic!("expected WindowsMinidump_Dir_Data::WindowsMinidump_ExceptionStream, got {:?}", v)
    }
}
impl From<OptRc<WindowsMinidump_ExceptionStream>> for WindowsMinidump_Dir_Data {
    fn from(v: OptRc<WindowsMinidump_ExceptionStream>) -> Self {
        Self::WindowsMinidump_ExceptionStream(v)
    }
}
impl From<&WindowsMinidump_Dir_Data> for OptRc<WindowsMinidump_SystemInfo> {
    fn from(v: &WindowsMinidump_Dir_Data) -> Self {
        if let WindowsMinidump_Dir_Data::WindowsMinidump_SystemInfo(x) = v {
            return x.clone();
        }
        panic!("expected WindowsMinidump_Dir_Data::WindowsMinidump_SystemInfo, got {:?}", v)
    }
}
impl From<OptRc<WindowsMinidump_SystemInfo>> for WindowsMinidump_Dir_Data {
    fn from(v: OptRc<WindowsMinidump_SystemInfo>) -> Self {
        Self::WindowsMinidump_SystemInfo(v)
    }
}
impl From<&WindowsMinidump_Dir_Data> for OptRc<WindowsMinidump_ThreadList> {
    fn from(v: &WindowsMinidump_Dir_Data) -> Self {
        if let WindowsMinidump_Dir_Data::WindowsMinidump_ThreadList(x) = v {
            return x.clone();
        }
        panic!("expected WindowsMinidump_Dir_Data::WindowsMinidump_ThreadList, got {:?}", v)
    }
}
impl From<OptRc<WindowsMinidump_ThreadList>> for WindowsMinidump_Dir_Data {
    fn from(v: OptRc<WindowsMinidump_ThreadList>) -> Self {
        Self::WindowsMinidump_ThreadList(v)
    }
}
impl From<&WindowsMinidump_Dir_Data> for Vec<u8> {
    fn from(v: &WindowsMinidump_Dir_Data) -> Self {
        if let WindowsMinidump_Dir_Data::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected WindowsMinidump_Dir_Data::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for WindowsMinidump_Dir_Data {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&WindowsMinidump_Dir_Data> for OptRc<WindowsMinidump_MemoryList> {
    fn from(v: &WindowsMinidump_Dir_Data) -> Self {
        if let WindowsMinidump_Dir_Data::WindowsMinidump_MemoryList(x) = v {
            return x.clone();
        }
        panic!("expected WindowsMinidump_Dir_Data::WindowsMinidump_MemoryList, got {:?}", v)
    }
}
impl From<OptRc<WindowsMinidump_MemoryList>> for WindowsMinidump_Dir_Data {
    fn from(v: OptRc<WindowsMinidump_MemoryList>) -> Self {
        Self::WindowsMinidump_MemoryList(v)
    }
}
impl From<&WindowsMinidump_Dir_Data> for OptRc<WindowsMinidump_MiscInfo> {
    fn from(v: &WindowsMinidump_Dir_Data) -> Self {
        if let WindowsMinidump_Dir_Data::WindowsMinidump_MiscInfo(x) = v {
            return x.clone();
        }
        panic!("expected WindowsMinidump_Dir_Data::WindowsMinidump_MiscInfo, got {:?}", v)
    }
}
impl From<OptRc<WindowsMinidump_MiscInfo>> for WindowsMinidump_Dir_Data {
    fn from(v: OptRc<WindowsMinidump_MiscInfo>) -> Self {
        Self::WindowsMinidump_MiscInfo(v)
    }
}
impl KStruct for WindowsMinidump_Dir {
    type Root = WindowsMinidump;
    type Parent = WindowsMinidump;

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
        *self_rc.stream_type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.len_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_data.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl WindowsMinidump_Dir {
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Option<WindowsMinidump_Dir_Data>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        let _pos = _io.pos();
        _io.seek(*self.ofs_data() as usize)?;
        match *self.stream_type() {
            WindowsMinidump_StreamTypes::Exception => {
                *self.data_raw.borrow_mut() = _io.read_bytes(*self.len_data() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, WindowsMinidump_ExceptionStream>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            WindowsMinidump_StreamTypes::MemoryList => {
                *self.data_raw.borrow_mut() = _io.read_bytes(*self.len_data() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, WindowsMinidump_MemoryList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            WindowsMinidump_StreamTypes::MiscInfo => {
                *self.data_raw.borrow_mut() = _io.read_bytes(*self.len_data() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, WindowsMinidump_MiscInfo>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            WindowsMinidump_StreamTypes::SystemInfo => {
                *self.data_raw.borrow_mut() = _io.read_bytes(*self.len_data() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, WindowsMinidump_SystemInfo>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            WindowsMinidump_StreamTypes::ThreadList => {
                *self.data_raw.borrow_mut() = _io.read_bytes(*self.len_data() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, WindowsMinidump_ThreadList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            _ => {
                *self.data.borrow_mut() = Some(_io.read_bytes(*self.len_data() as usize)?.into());
            }
        }
        _io.seek(_pos)?;
        Ok(self.data.borrow())
    }
}
impl WindowsMinidump_Dir {
    pub fn stream_type(&self) -> Ref<'_, WindowsMinidump_StreamTypes> {
        self.stream_type.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor Source
 */
impl WindowsMinidump_Dir {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}
impl WindowsMinidump_Dir {
    pub fn ofs_data(&self) -> Ref<'_, u32> {
        self.ofs_data.borrow()
    }
}
impl WindowsMinidump_Dir {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl WindowsMinidump_Dir {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump_ExceptionRecord {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<WindowsMinidump_ExceptionStream>,
    pub _self: SharedType<Self>,
    code: RefCell<u32>,
    flags: RefCell<u32>,
    inner_exception: RefCell<u64>,
    addr: RefCell<u64>,
    num_params: RefCell<u32>,
    reserved: RefCell<u32>,
    params: RefCell<Vec<u64>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsMinidump_ExceptionRecord {
    type Root = WindowsMinidump;
    type Parent = WindowsMinidump_ExceptionStream;

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
        *self_rc.code.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.inner_exception.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.addr.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.num_params.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.params.borrow_mut() = Vec::new();
        let l_params = 15;
        for _i in 0..l_params {
            self_rc.params.borrow_mut().push(_io.read_u8le()?.into());
        }
        Ok(())
    }
}
impl WindowsMinidump_ExceptionRecord {
}
impl WindowsMinidump_ExceptionRecord {
    pub fn code(&self) -> Ref<'_, u32> {
        self.code.borrow()
    }
}
impl WindowsMinidump_ExceptionRecord {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl WindowsMinidump_ExceptionRecord {
    pub fn inner_exception(&self) -> Ref<'_, u64> {
        self.inner_exception.borrow()
    }
}

/**
 * Memory address where exception has occurred
 */
impl WindowsMinidump_ExceptionRecord {
    pub fn addr(&self) -> Ref<'_, u64> {
        self.addr.borrow()
    }
}
impl WindowsMinidump_ExceptionRecord {
    pub fn num_params(&self) -> Ref<'_, u32> {
        self.num_params.borrow()
    }
}
impl WindowsMinidump_ExceptionRecord {
    pub fn reserved(&self) -> Ref<'_, u32> {
        self.reserved.borrow()
    }
}

/**
 * Additional parameters passed along with exception raise
 * function (for WinAPI, that is `RaiseException`). Meaning is
 * exception-specific. Given that this type is originally
 * defined by a C structure, it is described there as array of
 * fixed number of elements (`EXCEPTION_MAXIMUM_PARAMETERS` =
 * 15), but in reality only first `num_params` would be used.
 */
impl WindowsMinidump_ExceptionRecord {
    pub fn params(&self) -> Ref<'_, Vec<u64>> {
        self.params.borrow()
    }
}
impl WindowsMinidump_ExceptionRecord {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump_ExceptionStream {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<WindowsMinidump_Dir>,
    pub _self: SharedType<Self>,
    thread_id: RefCell<u32>,
    reserved: RefCell<u32>,
    exception_rec: RefCell<OptRc<WindowsMinidump_ExceptionRecord>>,
    thread_context: RefCell<OptRc<WindowsMinidump_LocationDescriptor>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsMinidump_ExceptionStream {
    type Root = WindowsMinidump;
    type Parent = WindowsMinidump_Dir;

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
        *self_rc.thread_id.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, WindowsMinidump_ExceptionRecord>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.exception_rec.borrow_mut() = t;
        let t = Self::read_into::<_, WindowsMinidump_LocationDescriptor>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.thread_context.borrow_mut() = t;
        Ok(())
    }
}
impl WindowsMinidump_ExceptionStream {
}
impl WindowsMinidump_ExceptionStream {
    pub fn thread_id(&self) -> Ref<'_, u32> {
        self.thread_id.borrow()
    }
}
impl WindowsMinidump_ExceptionStream {
    pub fn reserved(&self) -> Ref<'_, u32> {
        self.reserved.borrow()
    }
}
impl WindowsMinidump_ExceptionStream {
    pub fn exception_rec(&self) -> Ref<'_, OptRc<WindowsMinidump_ExceptionRecord>> {
        self.exception_rec.borrow()
    }
}
impl WindowsMinidump_ExceptionStream {
    pub fn thread_context(&self) -> Ref<'_, OptRc<WindowsMinidump_LocationDescriptor>> {
        self.thread_context.borrow()
    }
}
impl WindowsMinidump_ExceptionStream {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump_LocationDescriptor {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    len_data: RefCell<u32>,
    ofs_data: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
}
impl KStruct for WindowsMinidump_LocationDescriptor {
    type Root = WindowsMinidump;
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
        *self_rc.len_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_data.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl WindowsMinidump_LocationDescriptor {
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs_data() as usize)?;
        *self.data.borrow_mut() = io.read_bytes(*self.len_data() as usize)?.into();
        io.seek(_pos)?;
        Ok(self.data.borrow())
    }
}
impl WindowsMinidump_LocationDescriptor {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}
impl WindowsMinidump_LocationDescriptor {
    pub fn ofs_data(&self) -> Ref<'_, u32> {
        self.ofs_data.borrow()
    }
}
impl WindowsMinidump_LocationDescriptor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump_MemoryDescriptor {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    addr_memory_range: RefCell<u64>,
    memory: RefCell<OptRc<WindowsMinidump_LocationDescriptor>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsMinidump_MemoryDescriptor {
    type Root = WindowsMinidump;
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
        *self_rc.addr_memory_range.borrow_mut() = _io.read_u8le()?.into();
        let t = Self::read_into::<_, WindowsMinidump_LocationDescriptor>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.memory.borrow_mut() = t;
        Ok(())
    }
}
impl WindowsMinidump_MemoryDescriptor {
}
impl WindowsMinidump_MemoryDescriptor {
    pub fn addr_memory_range(&self) -> Ref<'_, u64> {
        self.addr_memory_range.borrow()
    }
}
impl WindowsMinidump_MemoryDescriptor {
    pub fn memory(&self) -> Ref<'_, OptRc<WindowsMinidump_LocationDescriptor>> {
        self.memory.borrow()
    }
}
impl WindowsMinidump_MemoryDescriptor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump_MemoryList {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<WindowsMinidump_Dir>,
    pub _self: SharedType<Self>,
    num_mem_ranges: RefCell<u32>,
    mem_ranges: RefCell<Vec<OptRc<WindowsMinidump_MemoryDescriptor>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsMinidump_MemoryList {
    type Root = WindowsMinidump;
    type Parent = WindowsMinidump_Dir;

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
        *self_rc.num_mem_ranges.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.mem_ranges.borrow_mut() = Vec::new();
        let l_mem_ranges = *self_rc.num_mem_ranges();
        for _i in 0..l_mem_ranges {
            let t = Self::read_into::<_, WindowsMinidump_MemoryDescriptor>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.mem_ranges.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl WindowsMinidump_MemoryList {
}
impl WindowsMinidump_MemoryList {
    pub fn num_mem_ranges(&self) -> Ref<'_, u32> {
        self.num_mem_ranges.borrow()
    }
}
impl WindowsMinidump_MemoryList {
    pub fn mem_ranges(&self) -> Ref<'_, Vec<OptRc<WindowsMinidump_MemoryDescriptor>>> {
        self.mem_ranges.borrow()
    }
}
impl WindowsMinidump_MemoryList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Specific string serialization scheme used in MiniDump format is
 * actually a simple 32-bit length-prefixed UTF-16 string.
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump_MinidumpString {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<WindowsMinidump_SystemInfo>,
    pub _self: SharedType<Self>,
    len_str: RefCell<u32>,
    str: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsMinidump_MinidumpString {
    type Root = WindowsMinidump;
    type Parent = WindowsMinidump_SystemInfo;

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
        *self_rc.len_str.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.str.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_str() as usize)?.into(), "UTF-16LE")?;
        Ok(())
    }
}
impl WindowsMinidump_MinidumpString {
}
impl WindowsMinidump_MinidumpString {
    pub fn len_str(&self) -> Ref<'_, u32> {
        self.len_str.borrow()
    }
}
impl WindowsMinidump_MinidumpString {
    pub fn str(&self) -> Ref<'_, String> {
        self.str.borrow()
    }
}
impl WindowsMinidump_MinidumpString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump_MiscInfo {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<WindowsMinidump_Dir>,
    pub _self: SharedType<Self>,
    len_info: RefCell<u32>,
    flags1: RefCell<u32>,
    process_id: RefCell<u32>,
    process_create_time: RefCell<u32>,
    process_user_time: RefCell<u32>,
    process_kernel_time: RefCell<u32>,
    cpu_max_mhz: RefCell<u32>,
    cpu_cur_mhz: RefCell<u32>,
    cpu_limit_mhz: RefCell<u32>,
    cpu_max_idle_state: RefCell<u32>,
    cpu_cur_idle_state: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsMinidump_MiscInfo {
    type Root = WindowsMinidump;
    type Parent = WindowsMinidump_Dir;

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
        *self_rc.len_info.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags1.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.process_id.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.process_create_time.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.process_user_time.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.process_kernel_time.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.cpu_max_mhz.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.cpu_cur_mhz.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.cpu_limit_mhz.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.cpu_max_idle_state.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.cpu_cur_idle_state.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl WindowsMinidump_MiscInfo {
}
impl WindowsMinidump_MiscInfo {
    pub fn len_info(&self) -> Ref<'_, u32> {
        self.len_info.borrow()
    }
}
impl WindowsMinidump_MiscInfo {
    pub fn flags1(&self) -> Ref<'_, u32> {
        self.flags1.borrow()
    }
}
impl WindowsMinidump_MiscInfo {
    pub fn process_id(&self) -> Ref<'_, u32> {
        self.process_id.borrow()
    }
}
impl WindowsMinidump_MiscInfo {
    pub fn process_create_time(&self) -> Ref<'_, u32> {
        self.process_create_time.borrow()
    }
}
impl WindowsMinidump_MiscInfo {
    pub fn process_user_time(&self) -> Ref<'_, u32> {
        self.process_user_time.borrow()
    }
}
impl WindowsMinidump_MiscInfo {
    pub fn process_kernel_time(&self) -> Ref<'_, u32> {
        self.process_kernel_time.borrow()
    }
}
impl WindowsMinidump_MiscInfo {
    pub fn cpu_max_mhz(&self) -> Ref<'_, u32> {
        self.cpu_max_mhz.borrow()
    }
}
impl WindowsMinidump_MiscInfo {
    pub fn cpu_cur_mhz(&self) -> Ref<'_, u32> {
        self.cpu_cur_mhz.borrow()
    }
}
impl WindowsMinidump_MiscInfo {
    pub fn cpu_limit_mhz(&self) -> Ref<'_, u32> {
        self.cpu_limit_mhz.borrow()
    }
}
impl WindowsMinidump_MiscInfo {
    pub fn cpu_max_idle_state(&self) -> Ref<'_, u32> {
        self.cpu_max_idle_state.borrow()
    }
}
impl WindowsMinidump_MiscInfo {
    pub fn cpu_cur_idle_state(&self) -> Ref<'_, u32> {
        self.cpu_cur_idle_state.borrow()
    }
}
impl WindowsMinidump_MiscInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * "System info" stream provides basic information about the
 * hardware and operating system which produces this dump.
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump_SystemInfo {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<WindowsMinidump_Dir>,
    pub _self: SharedType<Self>,
    cpu_arch: RefCell<WindowsMinidump_SystemInfo_CpuArchs>,
    cpu_level: RefCell<u16>,
    cpu_revision: RefCell<u16>,
    num_cpus: RefCell<u8>,
    os_type: RefCell<u8>,
    os_ver_major: RefCell<u32>,
    os_ver_minor: RefCell<u32>,
    os_build: RefCell<u32>,
    os_platform: RefCell<u32>,
    ofs_service_pack: RefCell<u32>,
    os_suite_mask: RefCell<u16>,
    reserved2: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_service_pack: Cell<bool>,
    service_pack: RefCell<OptRc<WindowsMinidump_MinidumpString>>,
}
impl KStruct for WindowsMinidump_SystemInfo {
    type Root = WindowsMinidump;
    type Parent = WindowsMinidump_Dir;

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
        *self_rc.cpu_arch.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.cpu_level.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.cpu_revision.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.num_cpus.borrow_mut() = _io.read_u1()?.into();
        *self_rc.os_type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.os_ver_major.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.os_ver_minor.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.os_build.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.os_platform.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_service_pack.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.os_suite_mask.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn service_pack(
        &self
    ) -> KResult<Ref<'_, OptRc<WindowsMinidump_MinidumpString>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_service_pack.get() {
            return Ok(self.service_pack.borrow());
        }
        if ((*self.ofs_service_pack() as u32) > (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.ofs_service_pack() as usize)?;
            let t = Self::read_into::<BytesReader, WindowsMinidump_MinidumpString>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.service_pack.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.service_pack.borrow())
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn cpu_arch(&self) -> Ref<'_, WindowsMinidump_SystemInfo_CpuArchs> {
        self.cpu_arch.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn cpu_level(&self) -> Ref<'_, u16> {
        self.cpu_level.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn cpu_revision(&self) -> Ref<'_, u16> {
        self.cpu_revision.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn num_cpus(&self) -> Ref<'_, u8> {
        self.num_cpus.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn os_type(&self) -> Ref<'_, u8> {
        self.os_type.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn os_ver_major(&self) -> Ref<'_, u32> {
        self.os_ver_major.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn os_ver_minor(&self) -> Ref<'_, u32> {
        self.os_ver_minor.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn os_build(&self) -> Ref<'_, u32> {
        self.os_build.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn os_platform(&self) -> Ref<'_, u32> {
        self.os_platform.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn ofs_service_pack(&self) -> Ref<'_, u32> {
        self.ofs_service_pack.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn os_suite_mask(&self) -> Ref<'_, u16> {
        self.os_suite_mask.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn reserved2(&self) -> Ref<'_, u16> {
        self.reserved2.borrow()
    }
}
impl WindowsMinidump_SystemInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum WindowsMinidump_SystemInfo_CpuArchs {
    Intel,
    Arm,
    Ia64,
    Amd64,
    Unknown,
    Unknown(i64),
}

impl TryFrom<i64> for WindowsMinidump_SystemInfo_CpuArchs {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<WindowsMinidump_SystemInfo_CpuArchs> {
        match flag {
            0 => Ok(WindowsMinidump_SystemInfo_CpuArchs::Intel),
            5 => Ok(WindowsMinidump_SystemInfo_CpuArchs::Arm),
            6 => Ok(WindowsMinidump_SystemInfo_CpuArchs::Ia64),
            9 => Ok(WindowsMinidump_SystemInfo_CpuArchs::Amd64),
            65535 => Ok(WindowsMinidump_SystemInfo_CpuArchs::Unknown),
            _ => Ok(WindowsMinidump_SystemInfo_CpuArchs::Unknown(flag)),
        }
    }
}

impl From<&WindowsMinidump_SystemInfo_CpuArchs> for i64 {
    fn from(v: &WindowsMinidump_SystemInfo_CpuArchs) -> Self {
        match *v {
            WindowsMinidump_SystemInfo_CpuArchs::Intel => 0,
            WindowsMinidump_SystemInfo_CpuArchs::Arm => 5,
            WindowsMinidump_SystemInfo_CpuArchs::Ia64 => 6,
            WindowsMinidump_SystemInfo_CpuArchs::Amd64 => 9,
            WindowsMinidump_SystemInfo_CpuArchs::Unknown => 65535,
            WindowsMinidump_SystemInfo_CpuArchs::Unknown(v) => v
        }
    }
}

impl Default for WindowsMinidump_SystemInfo_CpuArchs {
    fn default() -> Self { WindowsMinidump_SystemInfo_CpuArchs::Unknown(0) }
}


/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump_Thread {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<WindowsMinidump_ThreadList>,
    pub _self: SharedType<Self>,
    thread_id: RefCell<u32>,
    suspend_count: RefCell<u32>,
    priority_class: RefCell<u32>,
    priority: RefCell<u32>,
    teb: RefCell<u64>,
    stack: RefCell<OptRc<WindowsMinidump_MemoryDescriptor>>,
    thread_context: RefCell<OptRc<WindowsMinidump_LocationDescriptor>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsMinidump_Thread {
    type Root = WindowsMinidump;
    type Parent = WindowsMinidump_ThreadList;

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
        *self_rc.thread_id.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.suspend_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.priority_class.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.priority.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.teb.borrow_mut() = _io.read_u8le()?.into();
        let t = Self::read_into::<_, WindowsMinidump_MemoryDescriptor>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.stack.borrow_mut() = t;
        let t = Self::read_into::<_, WindowsMinidump_LocationDescriptor>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.thread_context.borrow_mut() = t;
        Ok(())
    }
}
impl WindowsMinidump_Thread {
}
impl WindowsMinidump_Thread {
    pub fn thread_id(&self) -> Ref<'_, u32> {
        self.thread_id.borrow()
    }
}
impl WindowsMinidump_Thread {
    pub fn suspend_count(&self) -> Ref<'_, u32> {
        self.suspend_count.borrow()
    }
}
impl WindowsMinidump_Thread {
    pub fn priority_class(&self) -> Ref<'_, u32> {
        self.priority_class.borrow()
    }
}
impl WindowsMinidump_Thread {
    pub fn priority(&self) -> Ref<'_, u32> {
        self.priority.borrow()
    }
}

/**
 * Thread Environment Block
 */
impl WindowsMinidump_Thread {
    pub fn teb(&self) -> Ref<'_, u64> {
        self.teb.borrow()
    }
}
impl WindowsMinidump_Thread {
    pub fn stack(&self) -> Ref<'_, OptRc<WindowsMinidump_MemoryDescriptor>> {
        self.stack.borrow()
    }
}
impl WindowsMinidump_Thread {
    pub fn thread_context(&self) -> Ref<'_, OptRc<WindowsMinidump_LocationDescriptor>> {
        self.thread_context.borrow()
    }
}
impl WindowsMinidump_Thread {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsMinidump_ThreadList {
    pub _root: SharedType<WindowsMinidump>,
    pub _parent: SharedType<WindowsMinidump_Dir>,
    pub _self: SharedType<Self>,
    num_threads: RefCell<u32>,
    threads: RefCell<Vec<OptRc<WindowsMinidump_Thread>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsMinidump_ThreadList {
    type Root = WindowsMinidump;
    type Parent = WindowsMinidump_Dir;

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
        *self_rc.num_threads.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.threads.borrow_mut() = Vec::new();
        let l_threads = *self_rc.num_threads();
        for _i in 0..l_threads {
            let t = Self::read_into::<_, WindowsMinidump_Thread>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.threads.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl WindowsMinidump_ThreadList {
}
impl WindowsMinidump_ThreadList {
    pub fn num_threads(&self) -> Ref<'_, u32> {
        self.num_threads.borrow()
    }
}
impl WindowsMinidump_ThreadList {
    pub fn threads(&self) -> Ref<'_, Vec<OptRc<WindowsMinidump_Thread>>> {
        self.threads.borrow()
    }
}
impl WindowsMinidump_ThreadList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
