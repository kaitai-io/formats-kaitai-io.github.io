// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
)


/**
 * Format mostly used by Google Chrome and various Android apps to store
 * resources such as translated strings, help messages and images.
 * @see <a href="https://web.archive.org/web/20220126211447/https://dev.chromium.org/developers/design-documents/linuxresourcesandlocalizedstrings">Source</a>
 * @see <a href="https://chromium.googlesource.com/chromium/src/tools/grit/+/3c36f27/grit/format/data_pack.py">Source</a>
 * @see <a href="https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/grit/format/data_pack.py">Source</a>
 */

type ChromePak_Encodings int
const (
	ChromePak_Encodings__Binary ChromePak_Encodings = 0
	ChromePak_Encodings__Utf8 ChromePak_Encodings = 1
	ChromePak_Encodings__Utf16 ChromePak_Encodings = 2
)
type ChromePak struct {
	Version uint32
	NumResourcesV4 uint32
	Encoding ChromePak_Encodings
	V5Part *ChromePak_HeaderV5Part
	Resources []*ChromePak_Resource
	Aliases []*ChromePak_Alias
	_io *kaitai.Stream
	_root *ChromePak
	_parent interface{}
	_f_numResources bool
	numResources uint32
	_f_numAliases bool
	numAliases uint16
}
func NewChromePak() *ChromePak {
	return &ChromePak{
	}
}

func (this *ChromePak) Read(io *kaitai.Stream, parent interface{}, root *ChromePak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp1)
	if !( ((this.Version == 4) || (this.Version == 5)) ) {
		return kaitai.NewValidationNotAnyOfError(this.Version, this._io, "/seq/0")
	}
	if (this.Version == 4) {
		tmp2, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.NumResourcesV4 = uint32(tmp2)
	}
	tmp3, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Encoding = ChromePak_Encodings(tmp3)
	if (this.Version == 5) {
		tmp4 := NewChromePak_HeaderV5Part()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.V5Part = tmp4
	}
	tmp5, err := this.NumResources()
	if err != nil {
		return err
	}
	for i := 0; i < int((tmp5 + 1)); i++ {
		_ = i
		tmp7, err := this.NumResources()
		if err != nil {
			return err
		}
		tmp6 := NewChromePak_Resource(i, i < tmp7)
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Resources = append(this.Resources, tmp6)
	}
	tmp8, err := this.NumAliases()
	if err != nil {
		return err
	}
	for i := 0; i < int(tmp8); i++ {
		_ = i
		tmp9 := NewChromePak_Alias()
		err = tmp9.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Aliases = append(this.Aliases, tmp9)
	}
	return err
}
func (this *ChromePak) NumResources() (v uint32, err error) {
	if (this._f_numResources) {
		return this.numResources, nil
	}
	var tmp10 uint16;
	if (this.Version == 5) {
		tmp10 = this.V5Part.NumResources
	} else {
		tmp10 = this.NumResourcesV4
	}
	this.numResources = uint32(tmp10)
	this._f_numResources = true
	return this.numResources, nil
}
func (this *ChromePak) NumAliases() (v uint16, err error) {
	if (this._f_numAliases) {
		return this.numAliases, nil
	}
	var tmp11 uint16;
	if (this.Version == 5) {
		tmp11 = this.V5Part.NumAliases
	} else {
		tmp11 = 0
	}
	this.numAliases = uint16(tmp11)
	this._f_numAliases = true
	return this.numAliases, nil
}

/**
 * only versions 4 and 5 are supported
 */

/**
 * Character encoding of all text resources in the PAK file. Note that
 * the file can **always** contain binary resources, this only applies to
 * those that are supposed to hold text.
 * 
 * In practice, this will probably always be `encodings::utf8` - I haven't
 * seen any organic file that would state otherwise. `UTF8` is also usually
 * hardcoded in Python scripts from the GRIT repository that generate .pak
 * files (for example
 * [`pak_util.py:79`](https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/pak_util.py#79)).
 */

/**
 * The length is calculated by looking at the offset of
 * the next item, so an extra entry is stored with id 0
 * and offset pointing to the end of the resources.
 */
type ChromePak_HeaderV5Part struct {
	EncodingPadding []byte
	NumResources uint16
	NumAliases uint16
	_io *kaitai.Stream
	_root *ChromePak
	_parent *ChromePak
}
func NewChromePak_HeaderV5Part() *ChromePak_HeaderV5Part {
	return &ChromePak_HeaderV5Part{
	}
}

func (this *ChromePak_HeaderV5Part) Read(io *kaitai.Stream, parent *ChromePak, root *ChromePak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.EncodingPadding = tmp12
	tmp13, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumResources = uint16(tmp13)
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumAliases = uint16(tmp14)
	return err
}
type ChromePak_Resource struct {
	Id uint16
	OfsBody uint32
	Idx int32
	HasBody bool
	_io *kaitai.Stream
	_root *ChromePak
	_parent *ChromePak
	_f_lenBody bool
	lenBody int
	_f_body bool
	body []byte
}
func NewChromePak_Resource(idx int32, hasBody bool) *ChromePak_Resource {
	return &ChromePak_Resource{
		Idx: idx,
		HasBody: hasBody,
	}
}

func (this *ChromePak_Resource) Read(io *kaitai.Stream, parent *ChromePak, root *ChromePak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Id = uint16(tmp15)
	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsBody = uint32(tmp16)
	return err
}

/**
 * MUST NOT be accessed until the next `resource` is parsed
 */
func (this *ChromePak_Resource) LenBody() (v int, err error) {
	if (this._f_lenBody) {
		return this.lenBody, nil
	}
	if (this.HasBody) {
		this.lenBody = int((this._parent.Resources[(this.Idx + 1)].OfsBody - this.OfsBody))
	}
	this._f_lenBody = true
	return this.lenBody, nil
}

/**
 * MUST NOT be accessed until the next `resource` is parsed
 */
func (this *ChromePak_Resource) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	if (this.HasBody) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(this.OfsBody), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp17, err := this.LenBody()
		if err != nil {
			return nil, err
		}
		tmp18, err := this._io.ReadBytes(int(tmp17))
		if err != nil {
			return nil, err
		}
		tmp18 = tmp18
		this.body = tmp18
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_body = true
	}
	this._f_body = true
	return this.body, nil
}
type ChromePak_Alias struct {
	Id uint16
	ResourceIdx uint16
	_io *kaitai.Stream
	_root *ChromePak
	_parent *ChromePak
	_f_resource bool
	resource *ChromePak_Resource
}
func NewChromePak_Alias() *ChromePak_Alias {
	return &ChromePak_Alias{
	}
}

func (this *ChromePak_Alias) Read(io *kaitai.Stream, parent *ChromePak, root *ChromePak) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Id = uint16(tmp19)
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ResourceIdx = uint16(tmp20)
	tmp21, err := this._parent.NumResources()
	if err != nil {
		return err
	}
	tmp22, err := this._parent.NumResources()
	if err != nil {
		return err
	}
	if !(this.ResourceIdx <= (tmp22 - 1)) {
		return kaitai.NewValidationGreaterThanError((tmp21 - 1), this.ResourceIdx, this._io, "/types/alias/seq/1")
	}
	return err
}
func (this *ChromePak_Alias) Resource() (v *ChromePak_Resource, err error) {
	if (this._f_resource) {
		return this.resource, nil
	}
	this.resource = this._parent.Resources[this.ResourceIdx]
	this._f_resource = true
	return this.resource, nil
}
