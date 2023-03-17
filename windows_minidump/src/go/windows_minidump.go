// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
	"golang.org/x/text/encoding/unicode"
)


/**
 * Windows MiniDump (MDMP) file provides a concise way to store process
 * core dumps, which is useful for debugging. Given its small size,
 * modularity, some cross-platform features and native support in some
 * debuggers, it is particularly useful for crash reporting, and is
 * used for that purpose in Windows and Google Chrome projects.
 * 
 * The file itself is a container, which contains a number of typed
 * "streams", which contain some data according to its type attribute.
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_header">Source</a>
 */

type WindowsMinidump_StreamTypes int
const (
	WindowsMinidump_StreamTypes__Unused WindowsMinidump_StreamTypes = 0
	WindowsMinidump_StreamTypes__Reserved0 WindowsMinidump_StreamTypes = 1
	WindowsMinidump_StreamTypes__Reserved1 WindowsMinidump_StreamTypes = 2
	WindowsMinidump_StreamTypes__ThreadList WindowsMinidump_StreamTypes = 3
	WindowsMinidump_StreamTypes__ModuleList WindowsMinidump_StreamTypes = 4
	WindowsMinidump_StreamTypes__MemoryList WindowsMinidump_StreamTypes = 5
	WindowsMinidump_StreamTypes__Exception WindowsMinidump_StreamTypes = 6
	WindowsMinidump_StreamTypes__SystemInfo WindowsMinidump_StreamTypes = 7
	WindowsMinidump_StreamTypes__ThreadExList WindowsMinidump_StreamTypes = 8
	WindowsMinidump_StreamTypes__Memory64List WindowsMinidump_StreamTypes = 9
	WindowsMinidump_StreamTypes__CommentA WindowsMinidump_StreamTypes = 10
	WindowsMinidump_StreamTypes__CommentW WindowsMinidump_StreamTypes = 11
	WindowsMinidump_StreamTypes__HandleData WindowsMinidump_StreamTypes = 12
	WindowsMinidump_StreamTypes__FunctionTable WindowsMinidump_StreamTypes = 13
	WindowsMinidump_StreamTypes__UnloadedModuleList WindowsMinidump_StreamTypes = 14
	WindowsMinidump_StreamTypes__MiscInfo WindowsMinidump_StreamTypes = 15
	WindowsMinidump_StreamTypes__MemoryInfoList WindowsMinidump_StreamTypes = 16
	WindowsMinidump_StreamTypes__ThreadInfoList WindowsMinidump_StreamTypes = 17
	WindowsMinidump_StreamTypes__HandleOperationList WindowsMinidump_StreamTypes = 18
	WindowsMinidump_StreamTypes__Token WindowsMinidump_StreamTypes = 19
	WindowsMinidump_StreamTypes__JavaScriptData WindowsMinidump_StreamTypes = 20
	WindowsMinidump_StreamTypes__SystemMemoryInfo WindowsMinidump_StreamTypes = 21
	WindowsMinidump_StreamTypes__ProcessVmCounters WindowsMinidump_StreamTypes = 22
	WindowsMinidump_StreamTypes__IptTrace WindowsMinidump_StreamTypes = 23
	WindowsMinidump_StreamTypes__ThreadNames WindowsMinidump_StreamTypes = 24
	WindowsMinidump_StreamTypes__CeNull WindowsMinidump_StreamTypes = 32768
	WindowsMinidump_StreamTypes__CeSystemInfo WindowsMinidump_StreamTypes = 32769
	WindowsMinidump_StreamTypes__CeException WindowsMinidump_StreamTypes = 32770
	WindowsMinidump_StreamTypes__CeModuleList WindowsMinidump_StreamTypes = 32771
	WindowsMinidump_StreamTypes__CeProcessList WindowsMinidump_StreamTypes = 32772
	WindowsMinidump_StreamTypes__CeThreadList WindowsMinidump_StreamTypes = 32773
	WindowsMinidump_StreamTypes__CeThreadContextList WindowsMinidump_StreamTypes = 32774
	WindowsMinidump_StreamTypes__CeThreadCallStackList WindowsMinidump_StreamTypes = 32775
	WindowsMinidump_StreamTypes__CeMemoryVirtualList WindowsMinidump_StreamTypes = 32776
	WindowsMinidump_StreamTypes__CeMemoryPhysicalList WindowsMinidump_StreamTypes = 32777
	WindowsMinidump_StreamTypes__CeBucketParameters WindowsMinidump_StreamTypes = 32778
	WindowsMinidump_StreamTypes__CeProcessModuleMap WindowsMinidump_StreamTypes = 32779
	WindowsMinidump_StreamTypes__CeDiagnosisList WindowsMinidump_StreamTypes = 32780
	WindowsMinidump_StreamTypes__MdCrashpadInfoStream WindowsMinidump_StreamTypes = 1129316353
	WindowsMinidump_StreamTypes__MdRawBreakpadInfo WindowsMinidump_StreamTypes = 1197932545
	WindowsMinidump_StreamTypes__MdRawAssertionInfo WindowsMinidump_StreamTypes = 1197932546
	WindowsMinidump_StreamTypes__MdLinuxCpuInfo WindowsMinidump_StreamTypes = 1197932547
	WindowsMinidump_StreamTypes__MdLinuxProcStatus WindowsMinidump_StreamTypes = 1197932548
	WindowsMinidump_StreamTypes__MdLinuxLsbRelease WindowsMinidump_StreamTypes = 1197932549
	WindowsMinidump_StreamTypes__MdLinuxCmdLine WindowsMinidump_StreamTypes = 1197932550
	WindowsMinidump_StreamTypes__MdLinuxEnviron WindowsMinidump_StreamTypes = 1197932551
	WindowsMinidump_StreamTypes__MdLinuxAuxv WindowsMinidump_StreamTypes = 1197932552
	WindowsMinidump_StreamTypes__MdLinuxMaps WindowsMinidump_StreamTypes = 1197932553
	WindowsMinidump_StreamTypes__MdLinuxDsoDebug WindowsMinidump_StreamTypes = 1197932554
)
type WindowsMinidump struct {
	Magic1 []byte
	Magic2 []byte
	Version uint16
	NumStreams uint32
	OfsStreams uint32
	Checksum uint32
	Timestamp uint32
	Flags uint64
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent interface{}
	_f_streams bool
	streams []*WindowsMinidump_Dir
}
func NewWindowsMinidump() *WindowsMinidump {
	return &WindowsMinidump{
	}
}

func (this *WindowsMinidump) Read(io *kaitai.Stream, parent interface{}, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic1 = tmp1
	if !(bytes.Equal(this.Magic1, []uint8{77, 68, 77, 80})) {
		return kaitai.NewValidationNotEqualError([]uint8{77, 68, 77, 80}, this.Magic1, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.Magic2 = tmp2
	if !(bytes.Equal(this.Magic2, []uint8{147, 167})) {
		return kaitai.NewValidationNotEqualError([]uint8{147, 167}, this.Magic2, this._io, "/seq/1")
	}
	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp3)
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumStreams = uint32(tmp4)
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsStreams = uint32(tmp5)
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Checksum = uint32(tmp6)
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Timestamp = uint32(tmp7)
	tmp8, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Flags = uint64(tmp8)
	return err
}
func (this *WindowsMinidump) Streams() (v []*WindowsMinidump_Dir, err error) {
	if (this._f_streams) {
		return this.streams, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsStreams), io.SeekStart)
	if err != nil {
		return nil, err
	}
	for i := 0; i < int(this.NumStreams); i++ {
		_ = i
		tmp9 := NewWindowsMinidump_Dir()
		err = tmp9.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.streams = append(this.streams, tmp9)
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_streams = true
	this._f_streams = true
	return this.streams, nil
}

/**
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list">Source</a>
 */
type WindowsMinidump_ThreadList struct {
	NumThreads uint32
	Threads []*WindowsMinidump_Thread
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent *WindowsMinidump_Dir
}
func NewWindowsMinidump_ThreadList() *WindowsMinidump_ThreadList {
	return &WindowsMinidump_ThreadList{
	}
}

func (this *WindowsMinidump_ThreadList) Read(io *kaitai.Stream, parent *WindowsMinidump_Dir, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumThreads = uint32(tmp10)
	for i := 0; i < int(this.NumThreads); i++ {
		_ = i
		tmp11 := NewWindowsMinidump_Thread()
		err = tmp11.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Threads = append(this.Threads, tmp11)
	}
	return err
}

/**
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">Source</a>
 */
type WindowsMinidump_LocationDescriptor struct {
	LenData uint32
	OfsData uint32
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent interface{}
	_f_data bool
	data []byte
}
func NewWindowsMinidump_LocationDescriptor() *WindowsMinidump_LocationDescriptor {
	return &WindowsMinidump_LocationDescriptor{
	}
}

func (this *WindowsMinidump_LocationDescriptor) Read(io *kaitai.Stream, parent interface{}, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenData = uint32(tmp12)
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsData = uint32(tmp13)
	return err
}
func (this *WindowsMinidump_LocationDescriptor) Data() (v []byte, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsData), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp14, err := thisIo.ReadBytes(int(this.LenData))
	if err != nil {
		return nil, err
	}
	tmp14 = tmp14
	this.data = tmp14
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_data = true
	this._f_data = true
	return this.data, nil
}

/**
 * Specific string serialization scheme used in MiniDump format is
 * actually a simple 32-bit length-prefixed UTF-16 string.
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string">Source</a>
 */
type WindowsMinidump_MinidumpString struct {
	LenStr uint32
	Str string
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent *WindowsMinidump_SystemInfo
}
func NewWindowsMinidump_MinidumpString() *WindowsMinidump_MinidumpString {
	return &WindowsMinidump_MinidumpString{
	}
}

func (this *WindowsMinidump_MinidumpString) Read(io *kaitai.Stream, parent *WindowsMinidump_SystemInfo, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenStr = uint32(tmp15)
	tmp16, err := this._io.ReadBytes(int(this.LenStr))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	tmp17, err := kaitai.BytesToStr(tmp16, unicode.UTF16(unicode.LittleEndian, unicode.IgnoreBOM).NewDecoder())
	if err != nil {
		return err
	}
	this.Str = tmp17
	return err
}

/**
 * "System info" stream provides basic information about the
 * hardware and operating system which produces this dump.
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info">Source</a>
 */

type WindowsMinidump_SystemInfo_CpuArchs int
const (
	WindowsMinidump_SystemInfo_CpuArchs__Intel WindowsMinidump_SystemInfo_CpuArchs = 0
	WindowsMinidump_SystemInfo_CpuArchs__Arm WindowsMinidump_SystemInfo_CpuArchs = 5
	WindowsMinidump_SystemInfo_CpuArchs__Ia64 WindowsMinidump_SystemInfo_CpuArchs = 6
	WindowsMinidump_SystemInfo_CpuArchs__Amd64 WindowsMinidump_SystemInfo_CpuArchs = 9
	WindowsMinidump_SystemInfo_CpuArchs__Unknown WindowsMinidump_SystemInfo_CpuArchs = 65535
)
type WindowsMinidump_SystemInfo struct {
	CpuArch WindowsMinidump_SystemInfo_CpuArchs
	CpuLevel uint16
	CpuRevision uint16
	NumCpus uint8
	OsType uint8
	OsVerMajor uint32
	OsVerMinor uint32
	OsBuild uint32
	OsPlatform uint32
	OfsServicePack uint32
	OsSuiteMask uint16
	Reserved2 uint16
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent *WindowsMinidump_Dir
	_f_servicePack bool
	servicePack *WindowsMinidump_MinidumpString
}
func NewWindowsMinidump_SystemInfo() *WindowsMinidump_SystemInfo {
	return &WindowsMinidump_SystemInfo{
	}
}

func (this *WindowsMinidump_SystemInfo) Read(io *kaitai.Stream, parent *WindowsMinidump_Dir, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.CpuArch = WindowsMinidump_SystemInfo_CpuArchs(tmp18)
	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.CpuLevel = uint16(tmp19)
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.CpuRevision = uint16(tmp20)
	tmp21, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumCpus = tmp21
	tmp22, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.OsType = tmp22
	tmp23, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OsVerMajor = uint32(tmp23)
	tmp24, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OsVerMinor = uint32(tmp24)
	tmp25, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OsBuild = uint32(tmp25)
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OsPlatform = uint32(tmp26)
	tmp27, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsServicePack = uint32(tmp27)
	tmp28, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.OsSuiteMask = uint16(tmp28)
	tmp29, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Reserved2 = uint16(tmp29)
	return err
}
func (this *WindowsMinidump_SystemInfo) ServicePack() (v *WindowsMinidump_MinidumpString, err error) {
	if (this._f_servicePack) {
		return this.servicePack, nil
	}
	if (this.OfsServicePack > 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsServicePack), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp30 := NewWindowsMinidump_MinidumpString()
		err = tmp30.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.servicePack = tmp30
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_servicePack = true
	}
	this._f_servicePack = true
	return this.servicePack, nil
}

/**
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception">Source</a>
 */
type WindowsMinidump_ExceptionRecord struct {
	Code uint32
	Flags uint32
	InnerException uint64
	Addr uint64
	NumParams uint32
	Reserved uint32
	Params []uint64
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent *WindowsMinidump_ExceptionStream
}
func NewWindowsMinidump_ExceptionRecord() *WindowsMinidump_ExceptionRecord {
	return &WindowsMinidump_ExceptionRecord{
	}
}

func (this *WindowsMinidump_ExceptionRecord) Read(io *kaitai.Stream, parent *WindowsMinidump_ExceptionStream, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp31, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Code = uint32(tmp31)
	tmp32, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp32)
	tmp33, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.InnerException = uint64(tmp33)
	tmp34, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Addr = uint64(tmp34)
	tmp35, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumParams = uint32(tmp35)
	tmp36, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Reserved = uint32(tmp36)
	for i := 0; i < int(15); i++ {
		_ = i
		tmp37, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Params = append(this.Params, tmp37)
	}
	return err
}

/**
 * Memory address where exception has occurred
 */

/**
 * Additional parameters passed along with exception raise
 * function (for WinAPI, that is `RaiseException`). Meaning is
 * exception-specific. Given that this type is originally
 * defined by a C structure, it is described there as array of
 * fixed number of elements (`EXCEPTION_MAXIMUM_PARAMETERS` =
 * 15), but in reality only first `num_params` would be used.
 */

/**
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info">Source</a>
 */
type WindowsMinidump_MiscInfo struct {
	LenInfo uint32
	Flags1 uint32
	ProcessId uint32
	ProcessCreateTime uint32
	ProcessUserTime uint32
	ProcessKernelTime uint32
	CpuMaxMhz uint32
	CpuCurMhz uint32
	CpuLimitMhz uint32
	CpuMaxIdleState uint32
	CpuCurIdleState uint32
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent *WindowsMinidump_Dir
}
func NewWindowsMinidump_MiscInfo() *WindowsMinidump_MiscInfo {
	return &WindowsMinidump_MiscInfo{
	}
}

func (this *WindowsMinidump_MiscInfo) Read(io *kaitai.Stream, parent *WindowsMinidump_Dir, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp38, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenInfo = uint32(tmp38)
	tmp39, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags1 = uint32(tmp39)
	tmp40, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ProcessId = uint32(tmp40)
	tmp41, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ProcessCreateTime = uint32(tmp41)
	tmp42, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ProcessUserTime = uint32(tmp42)
	tmp43, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ProcessKernelTime = uint32(tmp43)
	tmp44, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CpuMaxMhz = uint32(tmp44)
	tmp45, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CpuCurMhz = uint32(tmp45)
	tmp46, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CpuLimitMhz = uint32(tmp46)
	tmp47, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CpuMaxIdleState = uint32(tmp47)
	tmp48, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CpuCurIdleState = uint32(tmp48)
	return err
}

/**
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_directory">Source</a>
 */
type WindowsMinidump_Dir struct {
	StreamType WindowsMinidump_StreamTypes
	LenData uint32
	OfsData uint32
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent *WindowsMinidump
	_raw_data []byte
	_f_data bool
	data interface{}
}
func NewWindowsMinidump_Dir() *WindowsMinidump_Dir {
	return &WindowsMinidump_Dir{
	}
}

func (this *WindowsMinidump_Dir) Read(io *kaitai.Stream, parent *WindowsMinidump, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp49, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.StreamType = WindowsMinidump_StreamTypes(tmp49)
	tmp50, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenData = uint32(tmp50)
	tmp51, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsData = uint32(tmp51)
	return err
}
func (this *WindowsMinidump_Dir) Data() (v interface{}, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsData), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch (this.StreamType) {
	case WindowsMinidump_StreamTypes__MemoryList:
		tmp52, err := this._io.ReadBytes(int(this.LenData))
		if err != nil {
			return nil, err
		}
		tmp52 = tmp52
		this._raw_data = tmp52
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp53 := NewWindowsMinidump_MemoryList()
		err = tmp53.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp53
	case WindowsMinidump_StreamTypes__MiscInfo:
		tmp54, err := this._io.ReadBytes(int(this.LenData))
		if err != nil {
			return nil, err
		}
		tmp54 = tmp54
		this._raw_data = tmp54
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp55 := NewWindowsMinidump_MiscInfo()
		err = tmp55.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp55
	case WindowsMinidump_StreamTypes__ThreadList:
		tmp56, err := this._io.ReadBytes(int(this.LenData))
		if err != nil {
			return nil, err
		}
		tmp56 = tmp56
		this._raw_data = tmp56
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp57 := NewWindowsMinidump_ThreadList()
		err = tmp57.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp57
	case WindowsMinidump_StreamTypes__Exception:
		tmp58, err := this._io.ReadBytes(int(this.LenData))
		if err != nil {
			return nil, err
		}
		tmp58 = tmp58
		this._raw_data = tmp58
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp59 := NewWindowsMinidump_ExceptionStream()
		err = tmp59.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp59
	case WindowsMinidump_StreamTypes__SystemInfo:
		tmp60, err := this._io.ReadBytes(int(this.LenData))
		if err != nil {
			return nil, err
		}
		tmp60 = tmp60
		this._raw_data = tmp60
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp61 := NewWindowsMinidump_SystemInfo()
		err = tmp61.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp61
	default:
		tmp62, err := this._io.ReadBytes(int(this.LenData))
		if err != nil {
			return nil, err
		}
		tmp62 = tmp62
		this._raw_data = tmp62
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_data = true
	this._f_data = true
	return this.data, nil
}

/**
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">Source</a>
 */

/**
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread">Source</a>
 */
type WindowsMinidump_Thread struct {
	ThreadId uint32
	SuspendCount uint32
	PriorityClass uint32
	Priority uint32
	Teb uint64
	Stack *WindowsMinidump_MemoryDescriptor
	ThreadContext *WindowsMinidump_LocationDescriptor
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent *WindowsMinidump_ThreadList
}
func NewWindowsMinidump_Thread() *WindowsMinidump_Thread {
	return &WindowsMinidump_Thread{
	}
}

func (this *WindowsMinidump_Thread) Read(io *kaitai.Stream, parent *WindowsMinidump_ThreadList, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp63, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ThreadId = uint32(tmp63)
	tmp64, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SuspendCount = uint32(tmp64)
	tmp65, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PriorityClass = uint32(tmp65)
	tmp66, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Priority = uint32(tmp66)
	tmp67, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Teb = uint64(tmp67)
	tmp68 := NewWindowsMinidump_MemoryDescriptor()
	err = tmp68.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Stack = tmp68
	tmp69 := NewWindowsMinidump_LocationDescriptor()
	err = tmp69.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ThreadContext = tmp69
	return err
}

/**
 * Thread Environment Block
 */

/**
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list">Source</a>
 */
type WindowsMinidump_MemoryList struct {
	NumMemRanges uint32
	MemRanges []*WindowsMinidump_MemoryDescriptor
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent *WindowsMinidump_Dir
}
func NewWindowsMinidump_MemoryList() *WindowsMinidump_MemoryList {
	return &WindowsMinidump_MemoryList{
	}
}

func (this *WindowsMinidump_MemoryList) Read(io *kaitai.Stream, parent *WindowsMinidump_Dir, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp70, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumMemRanges = uint32(tmp70)
	for i := 0; i < int(this.NumMemRanges); i++ {
		_ = i
		tmp71 := NewWindowsMinidump_MemoryDescriptor()
		err = tmp71.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.MemRanges = append(this.MemRanges, tmp71)
	}
	return err
}

/**
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor">Source</a>
 */
type WindowsMinidump_MemoryDescriptor struct {
	AddrMemoryRange uint64
	Memory *WindowsMinidump_LocationDescriptor
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent interface{}
}
func NewWindowsMinidump_MemoryDescriptor() *WindowsMinidump_MemoryDescriptor {
	return &WindowsMinidump_MemoryDescriptor{
	}
}

func (this *WindowsMinidump_MemoryDescriptor) Read(io *kaitai.Stream, parent interface{}, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp72, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.AddrMemoryRange = uint64(tmp72)
	tmp73 := NewWindowsMinidump_LocationDescriptor()
	err = tmp73.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Memory = tmp73
	return err
}

/**
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream">Source</a>
 */
type WindowsMinidump_ExceptionStream struct {
	ThreadId uint32
	Reserved uint32
	ExceptionRec *WindowsMinidump_ExceptionRecord
	ThreadContext *WindowsMinidump_LocationDescriptor
	_io *kaitai.Stream
	_root *WindowsMinidump
	_parent *WindowsMinidump_Dir
}
func NewWindowsMinidump_ExceptionStream() *WindowsMinidump_ExceptionStream {
	return &WindowsMinidump_ExceptionStream{
	}
}

func (this *WindowsMinidump_ExceptionStream) Read(io *kaitai.Stream, parent *WindowsMinidump_Dir, root *WindowsMinidump) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp74, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ThreadId = uint32(tmp74)
	tmp75, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Reserved = uint32(tmp75)
	tmp76 := NewWindowsMinidump_ExceptionRecord()
	err = tmp76.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ExceptionRec = tmp76
	tmp77 := NewWindowsMinidump_LocationDescriptor()
	err = tmp77.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ThreadContext = tmp77
	return err
}
