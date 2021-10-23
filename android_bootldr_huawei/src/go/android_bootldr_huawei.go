// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * Format of `bootloader-*.img` files found in factory images of certain Android devices from Huawei:
 * 
 * * Nexus 6P "angler": [sample][sample-angler] ([other samples][others-angler]),
 *   [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29)
 * 
 * [sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
 * [others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
 * 
 * All image versions can be found in factory images at
 * <https://developers.google.com/android/images> for the specific device. To
 * avoid having to download an entire ZIP archive when you only need one file
 * from it, install [remotezip](https://github.com/gtsystem/python-remotezip) and
 * use its [command line
 * tool](https://github.com/gtsystem/python-remotezip#command-line-tool) to list
 * members in the archive and then to download only the file you want.
 * @see <a href="https://android.googlesource.com/device/huawei/angler/+/673cfb9/releasetools.py">Source</a>
 * @see <a href="https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_format.h?h=LA.UM.6.1.1&amp;id=a68d284aee85">Source</a>
 * @see <a href="https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&amp;id=a68d284aee85">Source</a>
 */
type AndroidBootldrHuawei struct {
	MetaHeader *AndroidBootldrHuawei_MetaHdr
	HeaderExt []byte
	ImageHeader *AndroidBootldrHuawei_ImageHdr
	_io *kaitai.Stream
	_root *AndroidBootldrHuawei
	_parent interface{}
	_raw_ImageHeader []byte
}
func NewAndroidBootldrHuawei() *AndroidBootldrHuawei {
	return &AndroidBootldrHuawei{
	}
}

func (this *AndroidBootldrHuawei) Read(io *kaitai.Stream, parent interface{}, root *AndroidBootldrHuawei) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewAndroidBootldrHuawei_MetaHdr()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.MetaHeader = tmp1
	tmp2, err := this._io.ReadBytes(int((this.MetaHeader.LenMetaHeader - 76)))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.HeaderExt = tmp2
	tmp3, err := this._io.ReadBytes(int(this.MetaHeader.LenImageHeader))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this._raw_ImageHeader = tmp3
	_io__raw_ImageHeader := kaitai.NewStream(bytes.NewReader(this._raw_ImageHeader))
	tmp4 := NewAndroidBootldrHuawei_ImageHdr()
	err = tmp4.Read(_io__raw_ImageHeader, this, this._root)
	if err != nil {
		return err
	}
	this.ImageHeader = tmp4
	return err
}
type AndroidBootldrHuawei_MetaHdr struct {
	Magic []byte
	Version *AndroidBootldrHuawei_Version
	ImageVersion string
	LenMetaHeader uint16
	LenImageHeader uint16
	_io *kaitai.Stream
	_root *AndroidBootldrHuawei
	_parent *AndroidBootldrHuawei
}
func NewAndroidBootldrHuawei_MetaHdr() *AndroidBootldrHuawei_MetaHdr {
	return &AndroidBootldrHuawei_MetaHdr{
	}
}

func (this *AndroidBootldrHuawei_MetaHdr) Read(io *kaitai.Stream, parent *AndroidBootldrHuawei, root *AndroidBootldrHuawei) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Magic = tmp5
	if !(bytes.Equal(this.Magic, []uint8{60, 214, 26, 206})) {
		return kaitai.NewValidationNotEqualError([]uint8{60, 214, 26, 206}, this.Magic, this._io, "/types/meta_hdr/seq/0")
	}
	tmp6 := NewAndroidBootldrHuawei_Version()
	err = tmp6.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Version = tmp6
	tmp7, err := this._io.ReadBytes(int(64))
	if err != nil {
		return err
	}
	tmp7 = kaitai.BytesTerminate(tmp7, 0, false)
	this.ImageVersion = string(tmp7)
	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenMetaHeader = uint16(tmp8)
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenImageHeader = uint16(tmp9)
	return err
}
type AndroidBootldrHuawei_Version struct {
	Major uint16
	Minor uint16
	_io *kaitai.Stream
	_root *AndroidBootldrHuawei
	_parent *AndroidBootldrHuawei_MetaHdr
}
func NewAndroidBootldrHuawei_Version() *AndroidBootldrHuawei_Version {
	return &AndroidBootldrHuawei_Version{
	}
}

func (this *AndroidBootldrHuawei_Version) Read(io *kaitai.Stream, parent *AndroidBootldrHuawei_MetaHdr, root *AndroidBootldrHuawei) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Major = uint16(tmp10)
	tmp11, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Minor = uint16(tmp11)
	return err
}
type AndroidBootldrHuawei_ImageHdr struct {
	Entries []*AndroidBootldrHuawei_ImageHdrEntry
	_io *kaitai.Stream
	_root *AndroidBootldrHuawei
	_parent *AndroidBootldrHuawei
}
func NewAndroidBootldrHuawei_ImageHdr() *AndroidBootldrHuawei_ImageHdr {
	return &AndroidBootldrHuawei_ImageHdr{
	}
}

func (this *AndroidBootldrHuawei_ImageHdr) Read(io *kaitai.Stream, parent *AndroidBootldrHuawei, root *AndroidBootldrHuawei) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp12, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp12 {
			break
		}
		tmp13 := NewAndroidBootldrHuawei_ImageHdrEntry()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp13)
	}
	return err
}

/**
 * The C generator program defines `img_header` as a [fixed size
 * array](https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85#n42)
 * of `img_header_entry_t` structs with length `MAX_IMAGES` (which is
 * defined as `16`).
 * 
 * This means that technically there will always be 16 `image_hdr`
 * entries, the first *n* entries being used (filled with real values)
 * and the rest left unused with all bytes zero.
 * 
 * To check if an entry is used, use the `is_used` attribute.
 */
type AndroidBootldrHuawei_ImageHdrEntry struct {
	Name string
	OfsBody uint32
	LenBody uint32
	_io *kaitai.Stream
	_root *AndroidBootldrHuawei
	_parent *AndroidBootldrHuawei_ImageHdr
	_f_isUsed bool
	isUsed bool
	_f_body bool
	body []byte
}
func NewAndroidBootldrHuawei_ImageHdrEntry() *AndroidBootldrHuawei_ImageHdrEntry {
	return &AndroidBootldrHuawei_ImageHdrEntry{
	}
}

func (this *AndroidBootldrHuawei_ImageHdrEntry) Read(io *kaitai.Stream, parent *AndroidBootldrHuawei_ImageHdr, root *AndroidBootldrHuawei) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadBytes(int(72))
	if err != nil {
		return err
	}
	tmp14 = kaitai.BytesTerminate(tmp14, 0, false)
	this.Name = string(tmp14)
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsBody = uint32(tmp15)
	tmp16, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenBody = uint32(tmp16)
	return err
}

/**
 * @see <a href="https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&amp;id=a68d284aee85#n119">Source</a>
 */
func (this *AndroidBootldrHuawei_ImageHdrEntry) IsUsed() (v bool, err error) {
	if (this._f_isUsed) {
		return this.isUsed, nil
	}
	this.isUsed = bool( ((this.OfsBody != 0) && (this.LenBody != 0)) )
	this._f_isUsed = true
	return this.isUsed, nil
}
func (this *AndroidBootldrHuawei_ImageHdrEntry) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	tmp17, err := this.IsUsed()
	if err != nil {
		return nil, err
	}
	if (tmp17) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsBody), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp18, err := thisIo.ReadBytes(int(this.LenBody))
		if err != nil {
			return nil, err
		}
		tmp18 = tmp18
		this.body = tmp18
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_body = true
	}
	this._f_body = true
	return this.body, nil
}

/**
 * partition name
 */
