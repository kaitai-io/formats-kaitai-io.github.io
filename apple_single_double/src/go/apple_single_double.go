// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * AppleSingle and AppleDouble files are used by certain Mac
 * applications (e.g. Finder) to store Mac-specific file attributes on
 * filesystems that do not support that.
 * 
 * Syntactically, both formats are the same, the only difference is how
 * they are being used:
 * 
 * * AppleSingle means that only one file will be created on external
 *   filesystem that will hold both the data (AKA "data fork" in Apple
 *   terminology), and the attributes (AKA "resource fork").
 * * AppleDouble means that two files will be created: a normal file
 *   that keeps the data ("data fork") is kept separately from an
 *   auxiliary file that contains attributes ("resource fork"), which
 *   is kept with the same name, but starting with an extra dot and
 *   underscore `._` to keep it hidden.
 * 
 * In modern practice (Mac OS X), Finder only uses AppleDouble to keep
 * compatibility with other OSes, as virtually nobody outside of Mac
 * understands how to access data in AppleSingle container.
 * @see <a href="http://kaiser-edv.de/documents/AppleSingle_AppleDouble.pdf">Source</a>
 */

type AppleSingleDouble_FileType int
const (
	AppleSingleDouble_FileType__AppleSingle AppleSingleDouble_FileType = 333312
	AppleSingleDouble_FileType__AppleDouble AppleSingleDouble_FileType = 333319
)
type AppleSingleDouble struct {
	Magic AppleSingleDouble_FileType
	Version uint32
	Reserved []byte
	NumEntries uint16
	Entries []*AppleSingleDouble_Entry
	_io *kaitai.Stream
	_root *AppleSingleDouble
	_parent interface{}
}
func NewAppleSingleDouble() *AppleSingleDouble {
	return &AppleSingleDouble{
	}
}

func (this *AppleSingleDouble) Read(io *kaitai.Stream, parent interface{}, root *AppleSingleDouble) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Magic = AppleSingleDouble_FileType(tmp1)
	tmp2, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp2)
	tmp3, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Reserved = tmp3
	tmp4, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.NumEntries = uint16(tmp4)
	this.Entries = make([]*AppleSingleDouble_Entry, this.NumEntries)
	for i := range this.Entries {
		tmp5 := NewAppleSingleDouble_Entry()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries[i] = tmp5
	}
	return err
}

/**
 * Must be all 0.
 */

type AppleSingleDouble_Entry_Types int
const (
	AppleSingleDouble_Entry_Types__DataFork AppleSingleDouble_Entry_Types = 1
	AppleSingleDouble_Entry_Types__ResourceFork AppleSingleDouble_Entry_Types = 2
	AppleSingleDouble_Entry_Types__RealName AppleSingleDouble_Entry_Types = 3
	AppleSingleDouble_Entry_Types__Comment AppleSingleDouble_Entry_Types = 4
	AppleSingleDouble_Entry_Types__IconBw AppleSingleDouble_Entry_Types = 5
	AppleSingleDouble_Entry_Types__IconColor AppleSingleDouble_Entry_Types = 6
	AppleSingleDouble_Entry_Types__FileDatesInfo AppleSingleDouble_Entry_Types = 8
	AppleSingleDouble_Entry_Types__FinderInfo AppleSingleDouble_Entry_Types = 9
	AppleSingleDouble_Entry_Types__MacintoshFileInfo AppleSingleDouble_Entry_Types = 10
	AppleSingleDouble_Entry_Types__ProdosFileInfo AppleSingleDouble_Entry_Types = 11
	AppleSingleDouble_Entry_Types__MsdosFileInfo AppleSingleDouble_Entry_Types = 12
	AppleSingleDouble_Entry_Types__AfpShortName AppleSingleDouble_Entry_Types = 13
	AppleSingleDouble_Entry_Types__AfpFileInfo AppleSingleDouble_Entry_Types = 14
	AppleSingleDouble_Entry_Types__AfpDirectoryId AppleSingleDouble_Entry_Types = 15
)
type AppleSingleDouble_Entry struct {
	Type AppleSingleDouble_Entry_Types
	OfsBody uint32
	LenBody uint32
	_io *kaitai.Stream
	_root *AppleSingleDouble
	_parent *AppleSingleDouble
	_raw_body []byte
	_f_body bool
	body interface{}
}
func NewAppleSingleDouble_Entry() *AppleSingleDouble_Entry {
	return &AppleSingleDouble_Entry{
	}
}

func (this *AppleSingleDouble_Entry) Read(io *kaitai.Stream, parent *AppleSingleDouble, root *AppleSingleDouble) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Type = AppleSingleDouble_Entry_Types(tmp6)
	tmp7, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsBody = uint32(tmp7)
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenBody = uint32(tmp8)
	return err
}
func (this *AppleSingleDouble_Entry) Body() (v interface{}, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsBody), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch (this.Type) {
	case AppleSingleDouble_Entry_Types__FinderInfo:
		tmp9, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return nil, err
		}
		tmp9 = tmp9
		this._raw_body = tmp9
		_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
		tmp10 := NewAppleSingleDouble_FinderInfo()
		err = tmp10.Read(_io__raw_body, this, this._root)
		if err != nil {
			return nil, err
		}
		this.body = tmp10
	default:
		tmp11, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return nil, err
		}
		tmp11 = tmp11
		this._raw_body = tmp11
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}

/**
 * Information specific to Finder
 * @see "older Inside Macintosh, Volume II page 84 or Volume IV page 104."
 */
type AppleSingleDouble_FinderInfo struct {
	FileType []byte
	FileCreator []byte
	Flags uint16
	Location *AppleSingleDouble_Point
	FolderId uint16
	_io *kaitai.Stream
	_root *AppleSingleDouble
	_parent *AppleSingleDouble_Entry
}
func NewAppleSingleDouble_FinderInfo() *AppleSingleDouble_FinderInfo {
	return &AppleSingleDouble_FinderInfo{
	}
}

func (this *AppleSingleDouble_FinderInfo) Read(io *kaitai.Stream, parent *AppleSingleDouble_Entry, root *AppleSingleDouble) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.FileType = tmp12
	tmp13, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.FileCreator = tmp13
	tmp14, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Flags = uint16(tmp14)
	tmp15 := NewAppleSingleDouble_Point()
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Location = tmp15
	tmp16, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.FolderId = uint16(tmp16)
	return err
}

/**
 * File icon's coordinates when displaying this folder.
 */

/**
 * File folder ID (=window).
 */

/**
 * Specifies 2D coordinate in QuickDraw grid.
 */
type AppleSingleDouble_Point struct {
	X uint16
	Y uint16
	_io *kaitai.Stream
	_root *AppleSingleDouble
	_parent *AppleSingleDouble_FinderInfo
}
func NewAppleSingleDouble_Point() *AppleSingleDouble_Point {
	return &AppleSingleDouble_Point{
	}
}

func (this *AppleSingleDouble_Point) Read(io *kaitai.Stream, parent *AppleSingleDouble_FinderInfo, root *AppleSingleDouble) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.X = uint16(tmp17)
	tmp18, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Y = uint16(tmp18)
	return err
}
