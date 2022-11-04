// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * A bootloader image which only seems to have been used on a few ASUS
 * devices. The encoding is ASCII, because the `releasetools.py` script
 * is written using Python 2, where the default encoding is ASCII.
 * 
 * A test file can be found in the firmware files for the "fugu" device,
 * which can be downloaded from <https://developers.google.com/android/images>
 * @see <a href="https://android.googlesource.com/device/asus/fugu/+/android-8.1.0_r5/releasetools.py">Source</a>
 */
type AndroidBootldrAsus struct {
	Magic []byte
	Revision uint16
	Reserved1 uint16
	Reserved2 uint32
	Images []*AndroidBootldrAsus_Image
	_io *kaitai.Stream
	_root *AndroidBootldrAsus
	_parent interface{}
}
func NewAndroidBootldrAsus() *AndroidBootldrAsus {
	return &AndroidBootldrAsus{
	}
}

func (this *AndroidBootldrAsus) Read(io *kaitai.Stream, parent interface{}, root *AndroidBootldrAsus) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{66, 79, 79, 84, 76, 68, 82, 33})) {
		return kaitai.NewValidationNotEqualError([]uint8{66, 79, 79, 84, 76, 68, 82, 33}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Revision = uint16(tmp2)
	if !(this.Revision >= 2) {
		return kaitai.NewValidationLessThanError(2, this.Revision, this._io, "/seq/1")
	}
	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Reserved1 = uint16(tmp3)
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Reserved2 = uint32(tmp4)
	for i := 0; i < int(3); i++ {
		_ = i
		tmp5 := NewAndroidBootldrAsus_Image()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Images = append(this.Images, tmp5)
	}
	return err
}

/**
 * Only three images are included: `ifwi.bin`, `droidboot.img`
 * and `splashscreen.img`
 */
type AndroidBootldrAsus_Image struct {
	ChunkId string
	LenBody uint32
	Flags uint8
	Reserved1 uint8
	Reserved2 uint8
	Reserved3 uint8
	Body []byte
	_io *kaitai.Stream
	_root *AndroidBootldrAsus
	_parent *AndroidBootldrAsus
	_f_fileName bool
	fileName string
}
func NewAndroidBootldrAsus_Image() *AndroidBootldrAsus_Image {
	return &AndroidBootldrAsus_Image{
	}
}

func (this *AndroidBootldrAsus_Image) Read(io *kaitai.Stream, parent *AndroidBootldrAsus, root *AndroidBootldrAsus) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.ChunkId = string(tmp6)
	if !( ((this.ChunkId == "IFWI!!!!") || (this.ChunkId == "DROIDBT!") || (this.ChunkId == "SPLASHS!")) ) {
		return kaitai.NewValidationNotAnyOfError(this.ChunkId, this._io, "/types/image/seq/0")
	}
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenBody = uint32(tmp7)
	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = tmp8
	{
		_it := this.Flags
		if !((_it & 1) != 0) {
			return kaitai.NewValidationExprError(this.Flags, this._io, "/types/image/seq/2")
		}
	}
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved1 = tmp9
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved2 = tmp10
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved3 = tmp11
	tmp12, err := this._io.ReadBytes(int(this.LenBody))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.Body = tmp12
	return err
}
func (this *AndroidBootldrAsus_Image) FileName() (v string, err error) {
	if (this._f_fileName) {
		return this.fileName, nil
	}
	var tmp13 string;
	if (this.ChunkId == "IFWI!!!!") {
		tmp13 = "ifwi.bin"
	} else {
		var tmp14 string;
		if (this.ChunkId == "DROIDBT!") {
			tmp14 = "droidboot.img"
		} else {
			var tmp15 string;
			if (this.ChunkId == "SPLASHS!") {
				tmp15 = "splashscreen.img"
			} else {
				tmp15 = ""
			}
			tmp14 = tmp15
		}
		tmp13 = tmp14
	}
	this.fileName = string(tmp13)
	this._f_fileName = true
	return this.fileName, nil
}