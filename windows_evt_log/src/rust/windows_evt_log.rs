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
 * EVT files are Windows Event Log files written by older Windows
 * operating systems (2000, XP, 2003). They are used as binary log
 * files by several major Windows subsystems and
 * applications. Typically, several of them can be found in
 * `%WINDIR%\system32\config` directory:
 * 
 * * Application = `AppEvent.evt`
 * * System = `SysEvent.evt`
 * * Security = `SecEvent.evt`
 * 
 * Alternatively, one can export any system event log as distinct .evt
 * file using relevant option in Event Viewer application.
 * 
 * A Windows application can submit an entry into these logs using
 * [ReportEventA](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa)
 * function of Windows API.
 * 
 * Internally, EVT files consist of a fixed-size header and event
 * records. There are several usage scenarios (non-wrapping vs wrapping
 * log files) which result in slightly different organization of
 * records.
 * \sa https://learn.microsoft.com/en-us/windows/win32/eventlog/event-log-file-format Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsEvtLog {
    pub _root: SharedType<WindowsEvtLog>,
    pub _parent: SharedType<WindowsEvtLog>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<WindowsEvtLog_Header>>,
    records: RefCell<Vec<OptRc<WindowsEvtLog_Record>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsEvtLog {
    type Root = WindowsEvtLog;
    type Parent = WindowsEvtLog;

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
        let t = Self::read_into::<_, WindowsEvtLog_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.records.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, WindowsEvtLog_Record>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.records.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl WindowsEvtLog {
}
impl WindowsEvtLog {
    pub fn header(&self) -> Ref<'_, OptRc<WindowsEvtLog_Header>> {
        self.header.borrow()
    }
}
impl WindowsEvtLog {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<WindowsEvtLog_Record>>> {
        self.records.borrow()
    }
}
impl WindowsEvtLog {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://forensics.wiki/windows_event_log_(evt)/#cursor-record Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsEvtLog_CursorRecordBody {
    pub _root: SharedType<WindowsEvtLog>,
    pub _parent: SharedType<WindowsEvtLog_Record>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    ofs_first_record: RefCell<u32>,
    ofs_next_record: RefCell<u32>,
    idx_next_record: RefCell<u32>,
    idx_first_record: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsEvtLog_CursorRecordBody {
    type Root = WindowsEvtLog;
    type Parent = WindowsEvtLog_Record;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(12 as usize)?.into();
        if !(*self_rc.magic() == vec![0x22u8, 0x22u8, 0x22u8, 0x22u8, 0x33u8, 0x33u8, 0x33u8, 0x33u8, 0x44u8, 0x44u8, 0x44u8, 0x44u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/cursor_record_body/seq/0".to_string() }));
        }
        *self_rc.ofs_first_record.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_next_record.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.idx_next_record.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.idx_first_record.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl WindowsEvtLog_CursorRecordBody {
}
impl WindowsEvtLog_CursorRecordBody {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl WindowsEvtLog_CursorRecordBody {
    pub fn ofs_first_record(&self) -> Ref<'_, u32> {
        self.ofs_first_record.borrow()
    }
}
impl WindowsEvtLog_CursorRecordBody {
    pub fn ofs_next_record(&self) -> Ref<'_, u32> {
        self.ofs_next_record.borrow()
    }
}
impl WindowsEvtLog_CursorRecordBody {
    pub fn idx_next_record(&self) -> Ref<'_, u32> {
        self.idx_next_record.borrow()
    }
}
impl WindowsEvtLog_CursorRecordBody {
    pub fn idx_first_record(&self) -> Ref<'_, u32> {
        self.idx_first_record.borrow()
    }
}
impl WindowsEvtLog_CursorRecordBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/previous-versions/windows/desktop/legacy/bb309024(v=vs.85) Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsEvtLog_Header {
    pub _root: SharedType<WindowsEvtLog>,
    pub _parent: SharedType<WindowsEvtLog>,
    pub _self: SharedType<Self>,
    len_header: RefCell<u32>,
    magic: RefCell<Vec<u8>>,
    version_major: RefCell<u32>,
    version_minor: RefCell<u32>,
    ofs_start: RefCell<u32>,
    ofs_end: RefCell<u32>,
    cur_rec_idx: RefCell<u32>,
    oldest_rec_idx: RefCell<u32>,
    len_file_max: RefCell<u32>,
    flags: RefCell<OptRc<WindowsEvtLog_Header_Flags>>,
    retention: RefCell<u32>,
    len_header_2: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsEvtLog_Header {
    type Root = WindowsEvtLog;
    type Parent = WindowsEvtLog;

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
        *self_rc.len_header.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x4cu8, 0x66u8, 0x4cu8, 0x65u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/1".to_string() }));
        }
        *self_rc.version_major.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.version_minor.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_start.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_end.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.cur_rec_idx.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.oldest_rec_idx.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_file_max.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, WindowsEvtLog_Header_Flags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.retention.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_header_2.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl WindowsEvtLog_Header {
}

/**
 * Size of the header structure, must be 0x30.
 */
impl WindowsEvtLog_Header {
    pub fn len_header(&self) -> Ref<'_, u32> {
        self.len_header.borrow()
    }
}
impl WindowsEvtLog_Header {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl WindowsEvtLog_Header {
    pub fn version_major(&self) -> Ref<'_, u32> {
        self.version_major.borrow()
    }
}
impl WindowsEvtLog_Header {
    pub fn version_minor(&self) -> Ref<'_, u32> {
        self.version_minor.borrow()
    }
}

/**
 * Offset of oldest record kept in this log file.
 */
impl WindowsEvtLog_Header {
    pub fn ofs_start(&self) -> Ref<'_, u32> {
        self.ofs_start.borrow()
    }
}

/**
 * Offset of EOF log record, which is a placeholder for new record.
 */
impl WindowsEvtLog_Header {
    pub fn ofs_end(&self) -> Ref<'_, u32> {
        self.ofs_end.borrow()
    }
}

/**
 * Index of current record, where a new submission would be
 * written to (normally there should to EOF log record there).
 */
impl WindowsEvtLog_Header {
    pub fn cur_rec_idx(&self) -> Ref<'_, u32> {
        self.cur_rec_idx.borrow()
    }
}

/**
 * Index of oldest record in the log file
 */
impl WindowsEvtLog_Header {
    pub fn oldest_rec_idx(&self) -> Ref<'_, u32> {
        self.oldest_rec_idx.borrow()
    }
}

/**
 * Total maximum size of the log file
 */
impl WindowsEvtLog_Header {
    pub fn len_file_max(&self) -> Ref<'_, u32> {
        self.len_file_max.borrow()
    }
}
impl WindowsEvtLog_Header {
    pub fn flags(&self) -> Ref<'_, OptRc<WindowsEvtLog_Header_Flags>> {
        self.flags.borrow()
    }
}
impl WindowsEvtLog_Header {
    pub fn retention(&self) -> Ref<'_, u32> {
        self.retention.borrow()
    }
}

/**
 * Size of the header structure repeated again, and again it must be 0x30.
 */
impl WindowsEvtLog_Header {
    pub fn len_header_2(&self) -> Ref<'_, u32> {
        self.len_header_2.borrow()
    }
}
impl WindowsEvtLog_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct WindowsEvtLog_Header_Flags {
    pub _root: SharedType<WindowsEvtLog>,
    pub _parent: SharedType<WindowsEvtLog_Header>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u64>,
    archive: RefCell<bool>,
    log_full: RefCell<bool>,
    wrap: RefCell<bool>,
    dirty: RefCell<bool>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsEvtLog_Header_Flags {
    type Root = WindowsEvtLog;
    type Parent = WindowsEvtLog_Header;

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
        *self_rc.reserved.borrow_mut() = _io.read_bits_int_be(28)?;
        *self_rc.archive.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.log_full.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.wrap.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.dirty.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        Ok(())
    }
}
impl WindowsEvtLog_Header_Flags {
}
impl WindowsEvtLog_Header_Flags {
    pub fn reserved(&self) -> Ref<'_, u64> {
        self.reserved.borrow()
    }
}

/**
 * True if archive attribute has been set for this log file.
 */
impl WindowsEvtLog_Header_Flags {
    pub fn archive(&self) -> Ref<'_, bool> {
        self.archive.borrow()
    }
}

/**
 * True if last write operation failed due to log being full.
 */
impl WindowsEvtLog_Header_Flags {
    pub fn log_full(&self) -> Ref<'_, bool> {
        self.log_full.borrow()
    }
}

/**
 * True if wrapping of record has occured.
 */
impl WindowsEvtLog_Header_Flags {
    pub fn wrap(&self) -> Ref<'_, bool> {
        self.wrap.borrow()
    }
}

/**
 * True if write operation was in progress, but log file
 * wasn't properly closed.
 */
impl WindowsEvtLog_Header_Flags {
    pub fn dirty(&self) -> Ref<'_, bool> {
        self.dirty.borrow()
    }
}
impl WindowsEvtLog_Header_Flags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsEvtLog_Record {
    pub _root: SharedType<WindowsEvtLog>,
    pub _parent: SharedType<WindowsEvtLog>,
    pub _self: SharedType<Self>,
    len_record: RefCell<u32>,
    type: RefCell<u32>,
    body: RefCell<Option<WindowsEvtLog_Record_Body>>,
    len_record2: RefCell<u32>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum WindowsEvtLog_Record_Body {
    WindowsEvtLog_RecordBody(OptRc<WindowsEvtLog_RecordBody>),
    WindowsEvtLog_CursorRecordBody(OptRc<WindowsEvtLog_CursorRecordBody>),
    Bytes(Vec<u8>),
}
impl From<&WindowsEvtLog_Record_Body> for OptRc<WindowsEvtLog_RecordBody> {
    fn from(v: &WindowsEvtLog_Record_Body) -> Self {
        if let WindowsEvtLog_Record_Body::WindowsEvtLog_RecordBody(x) = v {
            return x.clone();
        }
        panic!("expected WindowsEvtLog_Record_Body::WindowsEvtLog_RecordBody, got {:?}", v)
    }
}
impl From<OptRc<WindowsEvtLog_RecordBody>> for WindowsEvtLog_Record_Body {
    fn from(v: OptRc<WindowsEvtLog_RecordBody>) -> Self {
        Self::WindowsEvtLog_RecordBody(v)
    }
}
impl From<&WindowsEvtLog_Record_Body> for OptRc<WindowsEvtLog_CursorRecordBody> {
    fn from(v: &WindowsEvtLog_Record_Body) -> Self {
        if let WindowsEvtLog_Record_Body::WindowsEvtLog_CursorRecordBody(x) = v {
            return x.clone();
        }
        panic!("expected WindowsEvtLog_Record_Body::WindowsEvtLog_CursorRecordBody, got {:?}", v)
    }
}
impl From<OptRc<WindowsEvtLog_CursorRecordBody>> for WindowsEvtLog_Record_Body {
    fn from(v: OptRc<WindowsEvtLog_CursorRecordBody>) -> Self {
        Self::WindowsEvtLog_CursorRecordBody(v)
    }
}
impl From<&WindowsEvtLog_Record_Body> for Vec<u8> {
    fn from(v: &WindowsEvtLog_Record_Body) -> Self {
        if let WindowsEvtLog_Record_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected WindowsEvtLog_Record_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for WindowsEvtLog_Record_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for WindowsEvtLog_Record {
    type Root = WindowsEvtLog;
    type Parent = WindowsEvtLog;

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
        *self_rc.len_record.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.type.borrow_mut() = _io.read_u4le()?.into();
        match *self_rc.type() {
            1699505740 => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.len_record() as u32) - (12 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, WindowsEvtLog_RecordBody>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            286331153 => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.len_record() as u32) - (12 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, WindowsEvtLog_CursorRecordBody>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(((*self_rc.len_record() as u32) - (12 as u32)) as usize)?.into());
            }
        }
        *self_rc.len_record2.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl WindowsEvtLog_Record {
}

/**
 * Size of whole record, including all headers, footers and data
 */
impl WindowsEvtLog_Record {
    pub fn len_record(&self) -> Ref<'_, u32> {
        self.len_record.borrow()
    }
}

/**
 * Type of record. Normal log records specify "LfLe"
 * (0x654c664c) in this field, cursor records use 0x11111111.
 */
impl WindowsEvtLog_Record {
    pub fn type(&self) -> Ref<'_, u32> {
        self.type.borrow()
    }
}

/**
 * Record body interpretation depends on type of record. Body
 * size is specified in a way that it won't include a 8-byte
 * "header" (`len_record` + `type`) and a "footer"
 * (`len_record2`).
 */
impl WindowsEvtLog_Record {
    pub fn body(&self) -> Ref<'_, Option<WindowsEvtLog_Record_Body>> {
        self.body.borrow()
    }
}

/**
 * Size of whole record again.
 */
impl WindowsEvtLog_Record {
    pub fn len_record2(&self) -> Ref<'_, u32> {
        self.len_record2.borrow()
    }
}
impl WindowsEvtLog_Record {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl WindowsEvtLog_Record {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsEvtLog_RecordBody {
    pub _root: SharedType<WindowsEvtLog>,
    pub _parent: SharedType<WindowsEvtLog_Record>,
    pub _self: SharedType<Self>,
    idx: RefCell<u32>,
    time_generated: RefCell<u32>,
    time_written: RefCell<u32>,
    event_id: RefCell<u32>,
    event_type: RefCell<WindowsEvtLog_RecordBody_EventTypes>,
    num_strings: RefCell<u16>,
    event_category: RefCell<u16>,
    reserved: RefCell<Vec<u8>>,
    ofs_strings: RefCell<u32>,
    len_user_sid: RefCell<u32>,
    ofs_user_sid: RefCell<u32>,
    len_data: RefCell<u32>,
    ofs_data: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
    f_user_sid: Cell<bool>,
    user_sid: RefCell<Vec<u8>>,
}
impl KStruct for WindowsEvtLog_RecordBody {
    type Root = WindowsEvtLog;
    type Parent = WindowsEvtLog_Record;

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
        *self_rc.idx.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.time_generated.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.time_written.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.event_id.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.event_type.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.num_strings.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.event_category.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        *self_rc.ofs_strings.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_user_sid.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_user_sid.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_data.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl WindowsEvtLog_RecordBody {
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
        let _pos = _io.pos();
        _io.seek(((*self.ofs_data() as u32) - (8 as u32)) as usize)?;
        *self.data.borrow_mut() = _io.read_bytes(*self.len_data() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.data.borrow())
    }
    pub fn user_sid(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_user_sid.get() {
            return Ok(self.user_sid.borrow());
        }
        self.f_user_sid.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.ofs_user_sid() as u32) - (8 as u32)) as usize)?;
        *self.user_sid.borrow_mut() = _io.read_bytes(*self.len_user_sid() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.user_sid.borrow())
    }
}

/**
 * Index of record in the file.
 */
impl WindowsEvtLog_RecordBody {
    pub fn idx(&self) -> Ref<'_, u32> {
        self.idx.borrow()
    }
}

/**
 * Time when this record was generated, POSIX timestamp format.
 */
impl WindowsEvtLog_RecordBody {
    pub fn time_generated(&self) -> Ref<'_, u32> {
        self.time_generated.borrow()
    }
}

/**
 * Time when thsi record was written into the log file, POSIX timestamp format.
 */
impl WindowsEvtLog_RecordBody {
    pub fn time_written(&self) -> Ref<'_, u32> {
        self.time_written.borrow()
    }
}

/**
 * Identifier of an event, meaning is specific to particular
 * source of events / event type.
 */
impl WindowsEvtLog_RecordBody {
    pub fn event_id(&self) -> Ref<'_, u32> {
        self.event_id.borrow()
    }
}

/**
 * Type of event.
 * \sa https://learn.microsoft.com/en-us/windows/win32/eventlog/event-types Source
 */
impl WindowsEvtLog_RecordBody {
    pub fn event_type(&self) -> Ref<'_, WindowsEvtLog_RecordBody_EventTypes> {
        self.event_type.borrow()
    }
}

/**
 * Number of strings present in the log.
 */
impl WindowsEvtLog_RecordBody {
    pub fn num_strings(&self) -> Ref<'_, u16> {
        self.num_strings.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/eventlog/event-categories Source
 */
impl WindowsEvtLog_RecordBody {
    pub fn event_category(&self) -> Ref<'_, u16> {
        self.event_category.borrow()
    }
}
impl WindowsEvtLog_RecordBody {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}

/**
 * Offset of strings present in the log
 */
impl WindowsEvtLog_RecordBody {
    pub fn ofs_strings(&self) -> Ref<'_, u32> {
        self.ofs_strings.borrow()
    }
}
impl WindowsEvtLog_RecordBody {
    pub fn len_user_sid(&self) -> Ref<'_, u32> {
        self.len_user_sid.borrow()
    }
}
impl WindowsEvtLog_RecordBody {
    pub fn ofs_user_sid(&self) -> Ref<'_, u32> {
        self.ofs_user_sid.borrow()
    }
}
impl WindowsEvtLog_RecordBody {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}
impl WindowsEvtLog_RecordBody {
    pub fn ofs_data(&self) -> Ref<'_, u32> {
        self.ofs_data.borrow()
    }
}
impl WindowsEvtLog_RecordBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum WindowsEvtLog_RecordBody_EventTypes {
    Error,
    AuditFailure,
    AuditSuccess,
    Info,
    Warning,
    Unknown(i64),
}

impl TryFrom<i64> for WindowsEvtLog_RecordBody_EventTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<WindowsEvtLog_RecordBody_EventTypes> {
        match flag {
            1 => Ok(WindowsEvtLog_RecordBody_EventTypes::Error),
            2 => Ok(WindowsEvtLog_RecordBody_EventTypes::AuditFailure),
            3 => Ok(WindowsEvtLog_RecordBody_EventTypes::AuditSuccess),
            4 => Ok(WindowsEvtLog_RecordBody_EventTypes::Info),
            5 => Ok(WindowsEvtLog_RecordBody_EventTypes::Warning),
            _ => Ok(WindowsEvtLog_RecordBody_EventTypes::Unknown(flag)),
        }
    }
}

impl From<&WindowsEvtLog_RecordBody_EventTypes> for i64 {
    fn from(v: &WindowsEvtLog_RecordBody_EventTypes) -> Self {
        match *v {
            WindowsEvtLog_RecordBody_EventTypes::Error => 1,
            WindowsEvtLog_RecordBody_EventTypes::AuditFailure => 2,
            WindowsEvtLog_RecordBody_EventTypes::AuditSuccess => 3,
            WindowsEvtLog_RecordBody_EventTypes::Info => 4,
            WindowsEvtLog_RecordBody_EventTypes::Warning => 5,
            WindowsEvtLog_RecordBody_EventTypes::Unknown(v) => v
        }
    }
}

impl Default for WindowsEvtLog_RecordBody_EventTypes {
    fn default() -> Self { WindowsEvtLog_RecordBody_EventTypes::Unknown(0) }
}

