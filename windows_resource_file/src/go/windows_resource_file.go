// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"golang.org/x/text/encoding/unicode"
)


/**
 * Windows resource file (.res) are binary bundles of
 * "resources". Resource has some sort of ID (numerical or string),
 * type (predefined or user-defined), and raw value. Resource files can
 * be seen standalone (as .res file), or embedded inside PE executable
 * (.exe, .dll) files.
 * 
 * Typical use cases include:
 * 
 * * providing information about the application (such as title, copyrights, etc)
 * * embedding icon(s) to be displayed in file managers into .exe
 * * adding non-code data into the binary, such as menus, dialog forms,
 *   cursor images, fonts, various misc bitmaps, and locale-aware
 *   strings
 * 
 * Windows provides special API to access "resources" from a binary.
 * 
 * Normally, resources files are created with `rc` compiler: it takes a
 * .rc file (so called "resource-definition script") + all the raw
 * resource binary files for input, and outputs .res file. That .res
 * file can be linked into an .exe / .dll afterwards using a linker.
 * 
 * Internally, resource file is just a sequence of individual resource
 * definitions. RC tool ensures that first resource (#0) is always
 * empty.
 */
type WindowsResourceFile struct {
	Resources []*WindowsResourceFile_Resource
	_io *kaitai.Stream
	_root *WindowsResourceFile
	_parent interface{}
}
func NewWindowsResourceFile() *WindowsResourceFile {
	return &WindowsResourceFile{
	}
}

func (this *WindowsResourceFile) Read(io *kaitai.Stream, parent interface{}, root *WindowsResourceFile) (err error) {
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
		tmp2 := NewWindowsResourceFile_Resource()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Resources = append(this.Resources, tmp2)
	}
	return err
}

/**
 * Each resource has a `type` and a `name`, which can be used to
 * identify it, and a `value`. Both `type` and `name` can be a
 * number or a string.
 * @see <a href="https://docs.microsoft.com/en-us/windows/win32/menurc/resourceheader">Source</a>
 */

type WindowsResourceFile_Resource_PredefTypes int
const (
	WindowsResourceFile_Resource_PredefTypes__Cursor WindowsResourceFile_Resource_PredefTypes = 1
	WindowsResourceFile_Resource_PredefTypes__Bitmap WindowsResourceFile_Resource_PredefTypes = 2
	WindowsResourceFile_Resource_PredefTypes__Icon WindowsResourceFile_Resource_PredefTypes = 3
	WindowsResourceFile_Resource_PredefTypes__Menu WindowsResourceFile_Resource_PredefTypes = 4
	WindowsResourceFile_Resource_PredefTypes__Dialog WindowsResourceFile_Resource_PredefTypes = 5
	WindowsResourceFile_Resource_PredefTypes__String WindowsResourceFile_Resource_PredefTypes = 6
	WindowsResourceFile_Resource_PredefTypes__Fontdir WindowsResourceFile_Resource_PredefTypes = 7
	WindowsResourceFile_Resource_PredefTypes__Font WindowsResourceFile_Resource_PredefTypes = 8
	WindowsResourceFile_Resource_PredefTypes__Accelerator WindowsResourceFile_Resource_PredefTypes = 9
	WindowsResourceFile_Resource_PredefTypes__Rcdata WindowsResourceFile_Resource_PredefTypes = 10
	WindowsResourceFile_Resource_PredefTypes__Messagetable WindowsResourceFile_Resource_PredefTypes = 11
	WindowsResourceFile_Resource_PredefTypes__GroupCursor WindowsResourceFile_Resource_PredefTypes = 12
	WindowsResourceFile_Resource_PredefTypes__GroupIcon WindowsResourceFile_Resource_PredefTypes = 14
	WindowsResourceFile_Resource_PredefTypes__Version WindowsResourceFile_Resource_PredefTypes = 16
	WindowsResourceFile_Resource_PredefTypes__Dlginclude WindowsResourceFile_Resource_PredefTypes = 17
	WindowsResourceFile_Resource_PredefTypes__Plugplay WindowsResourceFile_Resource_PredefTypes = 19
	WindowsResourceFile_Resource_PredefTypes__Vxd WindowsResourceFile_Resource_PredefTypes = 20
	WindowsResourceFile_Resource_PredefTypes__Anicursor WindowsResourceFile_Resource_PredefTypes = 21
	WindowsResourceFile_Resource_PredefTypes__Aniicon WindowsResourceFile_Resource_PredefTypes = 22
	WindowsResourceFile_Resource_PredefTypes__Html WindowsResourceFile_Resource_PredefTypes = 23
	WindowsResourceFile_Resource_PredefTypes__Manifest WindowsResourceFile_Resource_PredefTypes = 24
)
type WindowsResourceFile_Resource struct {
	ValueSize uint32
	HeaderSize uint32
	Type *WindowsResourceFile_UnicodeOrId
	Name *WindowsResourceFile_UnicodeOrId
	Padding1 []byte
	FormatVersion uint32
	Flags uint16
	Language uint16
	ValueVersion uint32
	Characteristics uint32
	Value []byte
	Padding2 []byte
	_io *kaitai.Stream
	_root *WindowsResourceFile
	_parent *WindowsResourceFile
	_f_typeAsPredef bool
	typeAsPredef WindowsResourceFile_Resource_PredefTypes
}
func NewWindowsResourceFile_Resource() *WindowsResourceFile_Resource {
	return &WindowsResourceFile_Resource{
	}
}

func (this *WindowsResourceFile_Resource) Read(io *kaitai.Stream, parent *WindowsResourceFile, root *WindowsResourceFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ValueSize = uint32(tmp3)
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HeaderSize = uint32(tmp4)
	tmp5 := NewWindowsResourceFile_UnicodeOrId()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Type = tmp5
	tmp6 := NewWindowsResourceFile_UnicodeOrId()
	err = tmp6.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp6
	tmp8, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp7 := (4 - tmp8) % 4
	if tmp7 < 0 {
		tmp7 += 4
	}
	tmp9, err := this._io.ReadBytes(int(tmp7))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Padding1 = tmp9
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FormatVersion = uint32(tmp10)
	tmp11, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Flags = uint16(tmp11)
	tmp12, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Language = uint16(tmp12)
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ValueVersion = uint32(tmp13)
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Characteristics = uint32(tmp14)
	tmp15, err := this._io.ReadBytes(int(this.ValueSize))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.Value = tmp15
	tmp17, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp16 := (4 - tmp17) % 4
	if tmp16 < 0 {
		tmp16 += 4
	}
	tmp18, err := this._io.ReadBytes(int(tmp16))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.Padding2 = tmp18
	return err
}

/**
 * Numeric type IDs in range of [0..0xff] are reserved for
 * system usage in Windows, and there are some predefined,
 * well-known values in that range. This instance allows to get
 * it as enum value, if applicable.
 */
func (this *WindowsResourceFile_Resource) TypeAsPredef() (v WindowsResourceFile_Resource_PredefTypes, err error) {
	if (this._f_typeAsPredef) {
		return this.typeAsPredef, nil
	}
	tmp19, err := this.Type.IsString()
	if err != nil {
		return nil, err
	}
	if ( ((!(tmp19)) && (this.Type.AsNumeric <= 255)) ) {
		this.typeAsPredef = WindowsResourceFile_Resource_PredefTypes(WindowsResourceFile_Resource_PredefTypes(this.Type.AsNumeric))
	}
	this._f_typeAsPredef = true
	return this.typeAsPredef, nil
}

/**
 * Size of resource value that follows the header
 */

/**
 * Size of this header (i.e. every field except `value` and an
 * optional padding after it)
 */

/**
 * Version for value, as specified by a user.
 */

/**
 * Extra 4 bytes that can be used by user for any purpose.
 */

/**
 * Resources use a special serialization of names and types: they
 * can be either a number or a string.
 * 
 * Use `is_string` to check which kind we've got here, and then use
 * `as_numeric` or `as_string` to get relevant value.
 */
type WindowsResourceFile_UnicodeOrId struct {
	First uint16
	AsNumeric uint16
	Rest []uint16
	Noop []byte
	_io *kaitai.Stream
	_root *WindowsResourceFile
	_parent *WindowsResourceFile_Resource
	_f_savePos1 bool
	savePos1 int
	_f_savePos2 bool
	savePos2 int
	_f_isString bool
	isString bool
	_f_asString bool
	asString string
}
func NewWindowsResourceFile_UnicodeOrId() *WindowsResourceFile_UnicodeOrId {
	return &WindowsResourceFile_UnicodeOrId{
	}
}

func (this *WindowsResourceFile_UnicodeOrId) Read(io *kaitai.Stream, parent *WindowsResourceFile_Resource, root *WindowsResourceFile) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this.SavePos1()
	if err != nil {
		return err
	}
	if (tmp20 >= 0) {
		tmp21, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.First = uint16(tmp21)
	}
	tmp22, err := this.IsString()
	if err != nil {
		return err
	}
	if (!(tmp22)) {
		tmp23, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.AsNumeric = uint16(tmp23)
	}
	tmp24, err := this.IsString()
	if err != nil {
		return err
	}
	if (tmp24) {
		for i := 1;; i++ {
			tmp25, err := this._io.ReadU2le()
			if err != nil {
				return err
			}
			_it := tmp25
			this.Rest = append(this.Rest, _it)
			if _it == 0 {
				break
			}
		}
	}
	tmp26, err := this.IsString()
	if err != nil {
		return err
	}
	tmp27, err := this.SavePos2()
	if err != nil {
		return err
	}
	if ( ((tmp26) && (tmp27 >= 0)) ) {
		tmp28, err := this._io.ReadBytes(int(0))
		if err != nil {
			return err
		}
		tmp28 = tmp28
		this.Noop = tmp28
	}
	return err
}
func (this *WindowsResourceFile_UnicodeOrId) SavePos1() (v int, err error) {
	if (this._f_savePos1) {
		return this.savePos1, nil
	}
	tmp29, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	this.savePos1 = int(tmp29)
	this._f_savePos1 = true
	return this.savePos1, nil
}
func (this *WindowsResourceFile_UnicodeOrId) SavePos2() (v int, err error) {
	if (this._f_savePos2) {
		return this.savePos2, nil
	}
	tmp30, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	this.savePos2 = int(tmp30)
	this._f_savePos2 = true
	return this.savePos2, nil
}
func (this *WindowsResourceFile_UnicodeOrId) IsString() (v bool, err error) {
	if (this._f_isString) {
		return this.isString, nil
	}
	this.isString = bool(this.First != 65535)
	this._f_isString = true
	return this.isString, nil
}
func (this *WindowsResourceFile_UnicodeOrId) AsString() (v string, err error) {
	if (this._f_asString) {
		return this.asString, nil
	}
	tmp31, err := this.IsString()
	if err != nil {
		return "", err
	}
	if (tmp31) {
		_pos, err := this._io.Pos()
		if err != nil {
			return "", err
		}
		tmp32, err := this.SavePos1()
		if err != nil {
			return "", err
		}
		_, err = this._io.Seek(int64(tmp32), io.SeekStart)
		if err != nil {
			return "", err
		}
		tmp33, err := this.SavePos2()
		if err != nil {
			return "", err
		}
		tmp34, err := this.SavePos1()
		if err != nil {
			return "", err
		}
		tmp35, err := this._io.ReadBytes(int(((tmp33 - tmp34) - 2)))
		if err != nil {
			return "", err
		}
		tmp35 = tmp35
		tmp36, err := kaitai.BytesToStr(tmp35, unicode.UTF16(unicode.LittleEndian, unicode.IgnoreBOM).NewDecoder())
		if err != nil {
			return "", err
		}
		this.asString = tmp36
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return "", err
		}
		this._f_asString = true
	}
	this._f_asString = true
	return this.asString, nil
}
