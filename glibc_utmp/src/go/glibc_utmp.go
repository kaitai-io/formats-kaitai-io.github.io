// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


type GlibcUtmp_EntryType int
const (
	GlibcUtmp_EntryType__Empty GlibcUtmp_EntryType = 0
	GlibcUtmp_EntryType__RunLvl GlibcUtmp_EntryType = 1
	GlibcUtmp_EntryType__BootTime GlibcUtmp_EntryType = 2
	GlibcUtmp_EntryType__NewTime GlibcUtmp_EntryType = 3
	GlibcUtmp_EntryType__OldTime GlibcUtmp_EntryType = 4
	GlibcUtmp_EntryType__InitProcess GlibcUtmp_EntryType = 5
	GlibcUtmp_EntryType__LoginProcess GlibcUtmp_EntryType = 6
	GlibcUtmp_EntryType__UserProcess GlibcUtmp_EntryType = 7
	GlibcUtmp_EntryType__DeadProcess GlibcUtmp_EntryType = 8
	GlibcUtmp_EntryType__Accounting GlibcUtmp_EntryType = 9
)
type GlibcUtmp struct {
	Records []*GlibcUtmp_Record
	_io *kaitai.Stream
	_root *GlibcUtmp
	_parent interface{}
	_raw_Records [][]byte
}
func NewGlibcUtmp() *GlibcUtmp {
	return &GlibcUtmp{
	}
}

func (this *GlibcUtmp) Read(io *kaitai.Stream, parent interface{}, root *GlibcUtmp) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this._raw_Records = make([][]byte, 0);
	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2, err := this._io.ReadBytes(int(384))
		if err != nil {
			return err
		}
		tmp2 = tmp2
		this._raw_Records = append(this._raw_Records, tmp2)
		_io__raw_Records := kaitai.NewStream(bytes.NewReader(this._raw_Records[len(this._raw_Records) - 1]))
		tmp3 := NewGlibcUtmp_Record()
		err = tmp3.Read(_io__raw_Records, this, this._root)
		if err != nil {
			return err
		}
		this.Records = append(this.Records, tmp3)
	}
	return err
}
type GlibcUtmp_Record struct {
	UtType GlibcUtmp_EntryType
	Pid uint32
	Line string
	Id string
	User string
	Host string
	Exit uint32
	Session int32
	Tv *GlibcUtmp_Timeval
	AddrV6 []byte
	Reserved []byte
	_io *kaitai.Stream
	_root *GlibcUtmp
	_parent *GlibcUtmp
}
func NewGlibcUtmp_Record() *GlibcUtmp_Record {
	return &GlibcUtmp_Record{
	}
}

func (this *GlibcUtmp_Record) Read(io *kaitai.Stream, parent *GlibcUtmp, root *GlibcUtmp) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.UtType = GlibcUtmp_EntryType(tmp4)
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Pid = uint32(tmp5)
	tmp6, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.Line = string(tmp6)
	tmp7, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Id = string(tmp7)
	tmp8, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.User = string(tmp8)
	tmp9, err := this._io.ReadBytes(int(256))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Host = string(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Exit = uint32(tmp10)
	tmp11, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Session = int32(tmp11)
	tmp12 := NewGlibcUtmp_Timeval()
	err = tmp12.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Tv = tmp12
	tmp13, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.AddrV6 = tmp13
	tmp14, err := this._io.ReadBytes(int(20))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.Reserved = tmp14
	return err
}

/**
 * Type of login
 */

/**
 * Process ID of login process
 */

/**
 * Devicename
 */

/**
 * Inittab ID
 */

/**
 * Username
 */

/**
 * Hostname for remote login
 */

/**
 * Exit status of a process marked as DEAD_PROCESS
 */

/**
 * Session ID, used for windowing
 */

/**
 * Time entry was made
 */

/**
 * Internet address of remote host
 */
type GlibcUtmp_Timeval struct {
	Sec int32
	Usec int32
	_io *kaitai.Stream
	_root *GlibcUtmp
	_parent *GlibcUtmp_Record
}
func NewGlibcUtmp_Timeval() *GlibcUtmp_Timeval {
	return &GlibcUtmp_Timeval{
	}
}

func (this *GlibcUtmp_Timeval) Read(io *kaitai.Stream, parent *GlibcUtmp_Record, root *GlibcUtmp) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Sec = int32(tmp15)
	tmp16, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Usec = int32(tmp16)
	return err
}

/**
 * Seconds
 */

/**
 * Microseconds
 */