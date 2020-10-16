// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
 * @see <a href="https://www.ibm.com/support/knowledgecenter/en/ssw_aix_71/com.ibm.aix.files/utmp.h.htm">Source</a>
 */

type AixUtmp_EntryType int
const (
	AixUtmp_EntryType__Empty AixUtmp_EntryType = 0
	AixUtmp_EntryType__RunLvl AixUtmp_EntryType = 1
	AixUtmp_EntryType__BootTime AixUtmp_EntryType = 2
	AixUtmp_EntryType__OldTime AixUtmp_EntryType = 3
	AixUtmp_EntryType__NewTime AixUtmp_EntryType = 4
	AixUtmp_EntryType__InitProcess AixUtmp_EntryType = 5
	AixUtmp_EntryType__LoginProcess AixUtmp_EntryType = 6
	AixUtmp_EntryType__UserProcess AixUtmp_EntryType = 7
	AixUtmp_EntryType__DeadProcess AixUtmp_EntryType = 8
	AixUtmp_EntryType__Accounting AixUtmp_EntryType = 9
)
type AixUtmp struct {
	Records []*AixUtmp_Record
	_io *kaitai.Stream
	_root *AixUtmp
	_parent interface{}
}
func NewAixUtmp() *AixUtmp {
	return &AixUtmp{
	}
}

func (this *AixUtmp) Read(io *kaitai.Stream, parent interface{}, root *AixUtmp) (err error) {
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
		tmp2 := NewAixUtmp_Record()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Records = append(this.Records, tmp2)
	}
	return err
}
type AixUtmp_Record struct {
	User string
	InittabId string
	Device string
	Pid uint64
	Type AixUtmp_EntryType
	Timestamp int64
	ExitStatus *AixUtmp_ExitStatus
	Hostname string
	DblWordPad int32
	ReservedA []byte
	ReservedV []byte
	_io *kaitai.Stream
	_root *AixUtmp
	_parent *AixUtmp
}
func NewAixUtmp_Record() *AixUtmp_Record {
	return &AixUtmp_Record{
	}
}

func (this *AixUtmp_Record) Read(io *kaitai.Stream, parent *AixUtmp, root *AixUtmp) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBytes(int(256))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.User = string(tmp3)
	tmp4, err := this._io.ReadBytes(int(14))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.InittabId = string(tmp4)
	tmp5, err := this._io.ReadBytes(int(64))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Device = string(tmp5)
	tmp6, err := this._io.ReadU8be()
	if err != nil {
		return err
	}
	this.Pid = uint64(tmp6)
	tmp7, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.Type = AixUtmp_EntryType(tmp7)
	tmp8, err := this._io.ReadS8be()
	if err != nil {
		return err
	}
	this.Timestamp = int64(tmp8)
	tmp9 := NewAixUtmp_ExitStatus()
	err = tmp9.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ExitStatus = tmp9
	tmp10, err := this._io.ReadBytes(int(256))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Hostname = string(tmp10)
	tmp11, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.DblWordPad = int32(tmp11)
	tmp12, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.ReservedA = tmp12
	tmp13, err := this._io.ReadBytes(int(24))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.ReservedV = tmp13
	return err
}

/**
 * User login name
 */

/**
 * /etc/inittab id
 */

/**
 * device name (console, lnxx)
 */

/**
 * process id
 */

/**
 * Type of login
 */

/**
 * time entry was made
 */

/**
 * the exit status of a process marked as DEAD PROCESS
 */

/**
 * host name
 */
type AixUtmp_ExitStatus struct {
	TerminationCode int16
	ExitCode int16
	_io *kaitai.Stream
	_root *AixUtmp
	_parent *AixUtmp_Record
}
func NewAixUtmp_ExitStatus() *AixUtmp_ExitStatus {
	return &AixUtmp_ExitStatus{
	}
}

func (this *AixUtmp_ExitStatus) Read(io *kaitai.Stream, parent *AixUtmp_Record, root *AixUtmp) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.TerminationCode = int16(tmp14)
	tmp15, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.ExitCode = int16(tmp15)
	return err
}

/**
 * process termination status
 */

/**
 * process exit status
 */
