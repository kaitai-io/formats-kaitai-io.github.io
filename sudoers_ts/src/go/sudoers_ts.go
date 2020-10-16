// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * This spec can be used to parse sudo time stamp files located in directories
 * such as /run/sudo/ts/$USER or /var/lib/sudo/ts/$USER.
 * @see <a href="https://www.sudo.ws/man/1.8.27/sudoers_timestamp.man.html">Source</a>
 */

type SudoersTs_TsType int
const (
	SudoersTs_TsType__Global SudoersTs_TsType = 1
	SudoersTs_TsType__Tty SudoersTs_TsType = 2
	SudoersTs_TsType__Ppid SudoersTs_TsType = 3
	SudoersTs_TsType__Lockexcl SudoersTs_TsType = 4
)
type SudoersTs struct {
	Records []*SudoersTs_Record
	_io *kaitai.Stream
	_root *SudoersTs
	_parent interface{}
}
func NewSudoersTs() *SudoersTs {
	return &SudoersTs{
	}
}

func (this *SudoersTs) Read(io *kaitai.Stream, parent interface{}, root *SudoersTs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2 := NewSudoersTs_Record()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Records = append(this.Records, tmp2)
	}
	return err
}
type SudoersTs_RecordV2 struct {
	Type SudoersTs_TsType
	Flags *SudoersTs_TsFlag
	AuthUid uint32
	Sid uint32
	StartTime *SudoersTs_Timespec
	Ts *SudoersTs_Timespec
	Ttydev uint32
	Ppid uint32
	_io *kaitai.Stream
	_root *SudoersTs
	_parent *SudoersTs_Record
}
func NewSudoersTs_RecordV2() *SudoersTs_RecordV2 {
	return &SudoersTs_RecordV2{
	}
}

func (this *SudoersTs_RecordV2) Read(io *kaitai.Stream, parent *SudoersTs_Record, root *SudoersTs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Type = SudoersTs_TsType(tmp3)
	tmp4 := NewSudoersTs_TsFlag()
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp4
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.AuthUid = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Sid = uint32(tmp6)
	tmp7 := NewSudoersTs_Timespec()
	err = tmp7.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.StartTime = tmp7
	tmp8 := NewSudoersTs_Timespec()
	err = tmp8.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Ts = tmp8
	if (this.Type == SudoersTs_TsType__Tty) {
		tmp9, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Ttydev = uint32(tmp9)
	}
	if (this.Type == SudoersTs_TsType__Ppid) {
		tmp10, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Ppid = uint32(tmp10)
	}
	return err
}

/**
 * record type
 */

/**
 * record flags
 */

/**
 * user ID that was used for authentication
 */

/**
 * ID of the user's terminal session, if present (when type is TS_TTY)
 */

/**
 * start time of the session leader for records of type TS_TTY or of the parent process for records of type TS_PPID
 */

/**
 * actual time stamp, from a monotonic time source
 */

/**
 * device number of the terminal associated with the session
 */

/**
 * ID of the parent process
 */
type SudoersTs_TsFlag struct {
	Reserved0 uint64
	Anyuid bool
	Disabled bool
	Reserved1 uint64
	_io *kaitai.Stream
	_root *SudoersTs
	_parent interface{}
}
func NewSudoersTs_TsFlag() *SudoersTs_TsFlag {
	return &SudoersTs_TsFlag{
	}
}

func (this *SudoersTs_TsFlag) Read(io *kaitai.Stream, parent interface{}, root *SudoersTs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.Reserved0 = tmp11
	tmp12, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Anyuid = tmp12 != 0
	tmp13, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Disabled = tmp13 != 0
	tmp14, err := this._io.ReadBitsIntBe(8)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp14
	return err
}

/**
 * Reserved (unused) bits
 */

/**
 * ignore uid
 */

/**
 * entry disabled
 */

/**
 * Reserved (unused) bits
 */
type SudoersTs_RecordV1 struct {
	Type SudoersTs_TsType
	Flags *SudoersTs_TsFlag
	AuthUid uint32
	Sid uint32
	Ts *SudoersTs_Timespec
	Ttydev uint32
	Ppid uint32
	_io *kaitai.Stream
	_root *SudoersTs
	_parent *SudoersTs_Record
}
func NewSudoersTs_RecordV1() *SudoersTs_RecordV1 {
	return &SudoersTs_RecordV1{
	}
}

func (this *SudoersTs_RecordV1) Read(io *kaitai.Stream, parent *SudoersTs_Record, root *SudoersTs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Type = SudoersTs_TsType(tmp15)
	tmp16 := NewSudoersTs_TsFlag()
	err = tmp16.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp16
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.AuthUid = uint32(tmp17)
	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Sid = uint32(tmp18)
	tmp19 := NewSudoersTs_Timespec()
	err = tmp19.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Ts = tmp19
	if (this.Type == SudoersTs_TsType__Tty) {
		tmp20, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Ttydev = uint32(tmp20)
	}
	if (this.Type == SudoersTs_TsType__Ppid) {
		tmp21, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Ppid = uint32(tmp21)
	}
	return err
}

/**
 * record type
 */

/**
 * record flags
 */

/**
 * user ID that was used for authentication
 */

/**
 * session ID associated with tty/ppid
 */

/**
 * time stamp, from a monotonic time source
 */

/**
 * device number of the terminal associated with the session
 */

/**
 * ID of the parent process
 */
type SudoersTs_Timespec struct {
	Sec int64
	Nsec int64
	_io *kaitai.Stream
	_root *SudoersTs
	_parent interface{}
}
func NewSudoersTs_Timespec() *SudoersTs_Timespec {
	return &SudoersTs_Timespec{
	}
}

func (this *SudoersTs_Timespec) Read(io *kaitai.Stream, parent interface{}, root *SudoersTs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadS8le()
	if err != nil {
		return err
	}
	this.Sec = int64(tmp22)
	tmp23, err := this._io.ReadS8le()
	if err != nil {
		return err
	}
	this.Nsec = int64(tmp23)
	return err
}

/**
 * seconds
 */

/**
 * nanoseconds
 */
type SudoersTs_Record struct {
	Version uint16
	LenRecord uint16
	Payload interface{}
	_io *kaitai.Stream
	_root *SudoersTs
	_parent *SudoersTs
	_raw_Payload []byte
}
func NewSudoersTs_Record() *SudoersTs_Record {
	return &SudoersTs_Record{
	}
}

func (this *SudoersTs_Record) Read(io *kaitai.Stream, parent *SudoersTs, root *SudoersTs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp24)
	tmp25, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenRecord = uint16(tmp25)
	switch (this.Version) {
	case 1:
		tmp26, err := this._io.ReadBytes(int((this.LenRecord - 4)))
		if err != nil {
			return err
		}
		tmp26 = tmp26
		this._raw_Payload = tmp26
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp27 := NewSudoersTs_RecordV1()
		err = tmp27.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp27
	case 2:
		tmp28, err := this._io.ReadBytes(int((this.LenRecord - 4)))
		if err != nil {
			return err
		}
		tmp28 = tmp28
		this._raw_Payload = tmp28
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp29 := NewSudoersTs_RecordV2()
		err = tmp29.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp29
	default:
		tmp30, err := this._io.ReadBytes(int((this.LenRecord - 4)))
		if err != nil {
			return err
		}
		tmp30 = tmp30
		this._raw_Payload = tmp30
	}
	return err
}

/**
 * version number of the timestamp_entry struct
 */

/**
 * size of the record in bytes
 */
