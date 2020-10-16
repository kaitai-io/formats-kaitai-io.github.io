// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


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
 * [ReportEvent](https://msdn.microsoft.com/en-us/library/aa363679(v=vs.85).aspx)
 * function of Windows API.
 * 
 * Internally, EVT files consist of a fixed-size header and event
 * records. There are several usage scenarios (non-wrapping vs wrapping
 * log files) which result in slightly different organization of
 * records.
 * @see <a href="https://msdn.microsoft.com/en-us/library/bb309026(v=vs.85).aspx">Source</a>
 */
type WindowsEvtLog struct {
	Header *WindowsEvtLog_Header
	Records []*WindowsEvtLog_Record
	_io *kaitai.Stream
	_root *WindowsEvtLog
	_parent interface{}
}
func NewWindowsEvtLog() *WindowsEvtLog {
	return &WindowsEvtLog{
	}
}

func (this *WindowsEvtLog) Read(io *kaitai.Stream, parent interface{}, root *WindowsEvtLog) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewWindowsEvtLog_Header()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	for i := 1;; i++ {
		tmp2, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp2 {
			break
		}
		tmp3 := NewWindowsEvtLog_Record()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Records = append(this.Records, tmp3)
	}
	return err
}

/**
 * @see <a href="https://msdn.microsoft.com/en-us/library/bb309024(v=vs.85).aspx">Source</a>
 */
type WindowsEvtLog_Header struct {
	LenHeader uint32
	Magic []byte
	VersionMajor uint32
	VersionMinor uint32
	OfsStart uint32
	OfsEnd uint32
	CurRecIdx uint32
	OldestRecIdx uint32
	LenFileMax uint32
	Flags *WindowsEvtLog_Header_Flags
	Retention uint32
	LenHeader2 uint32
	_io *kaitai.Stream
	_root *WindowsEvtLog
	_parent *WindowsEvtLog
}
func NewWindowsEvtLog_Header() *WindowsEvtLog_Header {
	return &WindowsEvtLog_Header{
	}
}

func (this *WindowsEvtLog_Header) Read(io *kaitai.Stream, parent *WindowsEvtLog, root *WindowsEvtLog) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenHeader = uint32(tmp4)
	tmp5, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Magic = tmp5
	if !(bytes.Equal(this.Magic, []uint8{76, 102, 76, 101})) {
		return kaitai.NewValidationNotEqualError([]uint8{76, 102, 76, 101}, this.Magic, this._io, "/types/header/seq/1")
	}
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.VersionMajor = uint32(tmp6)
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.VersionMinor = uint32(tmp7)
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsStart = uint32(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsEnd = uint32(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CurRecIdx = uint32(tmp10)
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OldestRecIdx = uint32(tmp11)
	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenFileMax = uint32(tmp12)
	tmp13 := NewWindowsEvtLog_Header_Flags()
	err = tmp13.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp13
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Retention = uint32(tmp14)
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenHeader2 = uint32(tmp15)
	return err
}

/**
 * Size of the header structure, must be 0x30.
 */

/**
 * Offset of oldest record kept in this log file.
 */

/**
 * Offset of EOF log record, which is a placeholder for new record.
 */

/**
 * Index of current record, where a new submission would be
 * written to (normally there should to EOF log record there).
 */

/**
 * Index of oldest record in the log file
 */

/**
 * Total maximum size of the log file
 */

/**
 * Size of the header structure repeated again, and again it must be 0x30.
 */
type WindowsEvtLog_Header_Flags struct {
	Reserved uint64
	Archive bool
	LogFull bool
	Wrap bool
	Dirty bool
	_io *kaitai.Stream
	_root *WindowsEvtLog
	_parent *WindowsEvtLog_Header
}
func NewWindowsEvtLog_Header_Flags() *WindowsEvtLog_Header_Flags {
	return &WindowsEvtLog_Header_Flags{
	}
}

func (this *WindowsEvtLog_Header_Flags) Read(io *kaitai.Stream, parent *WindowsEvtLog_Header, root *WindowsEvtLog) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadBitsIntBe(28)
	if err != nil {
		return err
	}
	this.Reserved = tmp16
	tmp17, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Archive = tmp17 != 0
	tmp18, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.LogFull = tmp18 != 0
	tmp19, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Wrap = tmp19 != 0
	tmp20, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Dirty = tmp20 != 0
	return err
}

/**
 * True if archive attribute has been set for this log file.
 */

/**
 * True if last write operation failed due to log being full.
 */

/**
 * True if wrapping of record has occured.
 */

/**
 * True if write operation was in progress, but log file
 * wasn't properly closed.
 */

/**
 * @see <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/aa363646(v=vs.85).aspx">Source</a>
 */
type WindowsEvtLog_Record struct {
	LenRecord uint32
	Type uint32
	Body interface{}
	LenRecord2 uint32
	_io *kaitai.Stream
	_root *WindowsEvtLog
	_parent *WindowsEvtLog
	_raw_Body []byte
}
func NewWindowsEvtLog_Record() *WindowsEvtLog_Record {
	return &WindowsEvtLog_Record{
	}
}

func (this *WindowsEvtLog_Record) Read(io *kaitai.Stream, parent *WindowsEvtLog, root *WindowsEvtLog) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp21, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenRecord = uint32(tmp21)
	tmp22, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Type = uint32(tmp22)
	switch (this.Type) {
	case 1699505740:
		tmp23, err := this._io.ReadBytes(int((this.LenRecord - 12)))
		if err != nil {
			return err
		}
		tmp23 = tmp23
		this._raw_Body = tmp23
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp24 := NewWindowsEvtLog_RecordBody()
		err = tmp24.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp24
	case 286331153:
		tmp25, err := this._io.ReadBytes(int((this.LenRecord - 12)))
		if err != nil {
			return err
		}
		tmp25 = tmp25
		this._raw_Body = tmp25
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp26 := NewWindowsEvtLog_CursorRecordBody()
		err = tmp26.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp26
	default:
		tmp27, err := this._io.ReadBytes(int((this.LenRecord - 12)))
		if err != nil {
			return err
		}
		tmp27 = tmp27
		this._raw_Body = tmp27
	}
	tmp28, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenRecord2 = uint32(tmp28)
	return err
}

/**
 * Size of whole record, including all headers, footers and data
 */

/**
 * Type of record. Normal log records specify "LfLe"
 * (0x654c664c) in this field, cursor records use 0x11111111.
 */

/**
 * Record body interpretation depends on type of record. Body
 * size is specified in a way that it won't include a 8-byte
 * "header" (`len_record` + `type`) and a "footer"
 * (`len_record2`).
 */

/**
 * Size of whole record again.
 */

/**
 * @see <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/aa363646(v=vs.85).aspx">Source</a>
 */

type WindowsEvtLog_RecordBody_EventTypes int
const (
	WindowsEvtLog_RecordBody_EventTypes__Error WindowsEvtLog_RecordBody_EventTypes = 1
	WindowsEvtLog_RecordBody_EventTypes__AuditFailure WindowsEvtLog_RecordBody_EventTypes = 2
	WindowsEvtLog_RecordBody_EventTypes__AuditSuccess WindowsEvtLog_RecordBody_EventTypes = 3
	WindowsEvtLog_RecordBody_EventTypes__Info WindowsEvtLog_RecordBody_EventTypes = 4
	WindowsEvtLog_RecordBody_EventTypes__Warning WindowsEvtLog_RecordBody_EventTypes = 5
)
type WindowsEvtLog_RecordBody struct {
	Idx uint32
	TimeGenerated uint32
	TimeWritten uint32
	EventId uint32
	EventType WindowsEvtLog_RecordBody_EventTypes
	NumStrings uint16
	EventCategory uint16
	Reserved []byte
	OfsStrings uint32
	LenUserSid uint32
	OfsUserSid uint32
	LenData uint32
	OfsData uint32
	_io *kaitai.Stream
	_root *WindowsEvtLog
	_parent *WindowsEvtLog_Record
	_f_userSid bool
	userSid []byte
	_f_data bool
	data []byte
}
func NewWindowsEvtLog_RecordBody() *WindowsEvtLog_RecordBody {
	return &WindowsEvtLog_RecordBody{
	}
}

func (this *WindowsEvtLog_RecordBody) Read(io *kaitai.Stream, parent *WindowsEvtLog_Record, root *WindowsEvtLog) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Idx = uint32(tmp29)
	tmp30, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TimeGenerated = uint32(tmp30)
	tmp31, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TimeWritten = uint32(tmp31)
	tmp32, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.EventId = uint32(tmp32)
	tmp33, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.EventType = WindowsEvtLog_RecordBody_EventTypes(tmp33)
	tmp34, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumStrings = uint16(tmp34)
	tmp35, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.EventCategory = uint16(tmp35)
	tmp36, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.Reserved = tmp36
	tmp37, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsStrings = uint32(tmp37)
	tmp38, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenUserSid = uint32(tmp38)
	tmp39, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsUserSid = uint32(tmp39)
	tmp40, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenData = uint32(tmp40)
	tmp41, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsData = uint32(tmp41)
	return err
}
func (this *WindowsEvtLog_RecordBody) UserSid() (v []byte, err error) {
	if (this._f_userSid) {
		return this.userSid, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.OfsUserSid - 8)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp42, err := this._io.ReadBytes(int(this.LenUserSid))
	if err != nil {
		return nil, err
	}
	tmp42 = tmp42
	this.userSid = tmp42
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_userSid = true
	this._f_userSid = true
	return this.userSid, nil
}
func (this *WindowsEvtLog_RecordBody) Data() (v []byte, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.OfsData - 8)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp43, err := this._io.ReadBytes(int(this.LenData))
	if err != nil {
		return nil, err
	}
	tmp43 = tmp43
	this.data = tmp43
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_data = true
	this._f_data = true
	return this.data, nil
}

/**
 * Index of record in the file.
 */

/**
 * Time when this record was generated, POSIX timestamp format.
 */

/**
 * Time when thsi record was written into the log file, POSIX timestamp format.
 */

/**
 * Identifier of an event, meaning is specific to particular
 * source of events / event type.
 */

/**
 * Type of event.
 * @see <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/aa363662(v=vs.85).aspx">Source</a>
 */

/**
 * Number of strings present in the log.
 */

/**
 * @see <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/aa363649(v=vs.85).aspx">Source</a>
 */

/**
 * Offset of strings present in the log
 */

/**
 * @see <a href="http://www.forensicswiki.xyz/page/Windows_Event_Log_(EVT)#Cursor_Record">Source</a>
 */
type WindowsEvtLog_CursorRecordBody struct {
	Magic []byte
	OfsFirstRecord uint32
	OfsNextRecord uint32
	IdxNextRecord uint32
	IdxFirstRecord uint32
	_io *kaitai.Stream
	_root *WindowsEvtLog
	_parent *WindowsEvtLog_Record
}
func NewWindowsEvtLog_CursorRecordBody() *WindowsEvtLog_CursorRecordBody {
	return &WindowsEvtLog_CursorRecordBody{
	}
}

func (this *WindowsEvtLog_CursorRecordBody) Read(io *kaitai.Stream, parent *WindowsEvtLog_Record, root *WindowsEvtLog) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp44, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp44 = tmp44
	this.Magic = tmp44
	if !(bytes.Equal(this.Magic, []uint8{34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68})) {
		return kaitai.NewValidationNotEqualError([]uint8{34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68}, this.Magic, this._io, "/types/cursor_record_body/seq/0")
	}
	tmp45, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsFirstRecord = uint32(tmp45)
	tmp46, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsNextRecord = uint32(tmp46)
	tmp47, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.IdxNextRecord = uint32(tmp47)
	tmp48, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.IdxFirstRecord = uint32(tmp48)
	return err
}
