// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * .trd file is a raw dump of TR-DOS (ZX-Spectrum) floppy. .trd files are
 * headerless and contain consequent "logical tracks", each logical track
 * consists of 16 256-byte sectors.
 * 
 * Logical tracks are defined the same way as used by TR-DOS: for single-side
 * floppies it's just a physical track number, for two-side floppies sides are
 * interleaved, i.e. logical_track_num = (physical_track_num << 1) | side
 * 
 * So, this format definition is more for TR-DOS filesystem than for .trd files,
 * which are formatless.
 * 
 * Strings (file names, disk label, disk password) are padded with spaces and use
 * ZX Spectrum character set, including UDGs, block drawing chars and Basic
 * tokens. ASCII range is mostly standard ASCII, with few characters (^, `, DEL)
 * replaced with (up arrow, pound, copyright symbol).
 * 
 * .trd file can be smaller than actual floppy disk, if last logical tracks are
 * empty (contain no file data) they can be omitted.
 */

type TrDosImage_DiskType int
const (
	TrDosImage_DiskType__Type80TracksDoubleSide TrDosImage_DiskType = 22
	TrDosImage_DiskType__Type40TracksDoubleSide TrDosImage_DiskType = 23
	TrDosImage_DiskType__Type80TracksSingleSide TrDosImage_DiskType = 24
	TrDosImage_DiskType__Type40TracksSingleSide TrDosImage_DiskType = 25
)
type TrDosImage struct {
	Files []*TrDosImage_File
	_io *kaitai.Stream
	_root *TrDosImage
	_parent interface{}
	_f_volumeInfo bool
	volumeInfo *TrDosImage_VolumeInfo
}
func NewTrDosImage() *TrDosImage {
	return &TrDosImage{
	}
}

func (this *TrDosImage) Read(io *kaitai.Stream, parent interface{}, root *TrDosImage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1 := NewTrDosImage_File()
		err = tmp1.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp1
		this.Files = append(this.Files, _it)
		tmp2, err := _it.IsTerminator()
		if err != nil {
			return err
		}
		if tmp2 {
			break
		}
	}
	return err
}
func (this *TrDosImage) VolumeInfo() (v *TrDosImage_VolumeInfo, err error) {
	if (this._f_volumeInfo) {
		return this.volumeInfo, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(2048), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp3 := NewTrDosImage_VolumeInfo()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.volumeInfo = tmp3
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_volumeInfo = true
	this._f_volumeInfo = true
	return this.volumeInfo, nil
}
type TrDosImage_VolumeInfo struct {
	CatalogEnd []byte
	Unused []byte
	FirstFreeSectorSector uint8
	FirstFreeSectorTrack uint8
	DiskType TrDosImage_DiskType
	NumFiles uint8
	NumFreeSectors uint16
	TrDosId []byte
	Unused2 []byte
	Password []byte
	Unused3 []byte
	NumDeletedFiles uint8
	Label []byte
	Unused4 []byte
	_io *kaitai.Stream
	_root *TrDosImage
	_parent *TrDosImage
	_f_numTracks bool
	numTracks int8
	_f_numSides bool
	numSides int8
}
func NewTrDosImage_VolumeInfo() *TrDosImage_VolumeInfo {
	return &TrDosImage_VolumeInfo{
	}
}

func (this *TrDosImage_VolumeInfo) Read(io *kaitai.Stream, parent *TrDosImage, root *TrDosImage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.CatalogEnd = tmp4
	if !(bytes.Equal(this.CatalogEnd, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.CatalogEnd, this._io, "/types/volume_info/seq/0")
	}
	tmp5, err := this._io.ReadBytes(int(224))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Unused = tmp5
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FirstFreeSectorSector = tmp6
	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FirstFreeSectorTrack = tmp7
	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.DiskType = TrDosImage_DiskType(tmp8)
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumFiles = tmp9
	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumFreeSectors = uint16(tmp10)
	tmp11, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.TrDosId = tmp11
	if !(bytes.Equal(this.TrDosId, []uint8{16})) {
		return kaitai.NewValidationNotEqualError([]uint8{16}, this.TrDosId, this._io, "/types/volume_info/seq/7")
	}
	tmp12, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.Unused2 = tmp12
	tmp13, err := this._io.ReadBytes(int(9))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.Password = tmp13
	tmp14, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.Unused3 = tmp14
	tmp15, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NumDeletedFiles = tmp15
	tmp16, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.Label = tmp16
	tmp17, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp17 = tmp17
	this.Unused4 = tmp17
	return err
}
func (this *TrDosImage_VolumeInfo) NumTracks() (v int8, err error) {
	if (this._f_numTracks) {
		return this.numTracks, nil
	}
	var tmp18 int8;
	if ((this.DiskType & 1) != 0) {
		tmp18 = 40
	} else {
		tmp18 = 80
	}
	this.numTracks = int8(tmp18)
	this._f_numTracks = true
	return this.numTracks, nil
}
func (this *TrDosImage_VolumeInfo) NumSides() (v int8, err error) {
	if (this._f_numSides) {
		return this.numSides, nil
	}
	var tmp19 int8;
	if ((this.DiskType & 8) != 0) {
		tmp19 = 1
	} else {
		tmp19 = 2
	}
	this.numSides = int8(tmp19)
	this._f_numSides = true
	return this.numSides, nil
}

/**
 * track number is logical, for double-sided disks it's
 * (physical_track << 1) | side, the same way that tracks are stored
 * sequentially in .trd file
 */

/**
 * Number of non-deleted files. Directory can have more than
 * number_of_files entries due to deleted files
 */
type TrDosImage_PositionAndLengthCode struct {
	StartAddress uint16
	Length uint16
	_io *kaitai.Stream
	_root *TrDosImage
	_parent *TrDosImage_File
}
func NewTrDosImage_PositionAndLengthCode() *TrDosImage_PositionAndLengthCode {
	return &TrDosImage_PositionAndLengthCode{
	}
}

func (this *TrDosImage_PositionAndLengthCode) Read(io *kaitai.Stream, parent *TrDosImage_File, root *TrDosImage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.StartAddress = uint16(tmp20)
	tmp21, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Length = uint16(tmp21)
	return err
}

/**
 * Default memory address to load this byte array into
 */
type TrDosImage_Filename struct {
	Name []byte
	_io *kaitai.Stream
	_root *TrDosImage
	_parent *TrDosImage_File
	_f_firstByte bool
	firstByte uint8
}
func NewTrDosImage_Filename() *TrDosImage_Filename {
	return &TrDosImage_Filename{
	}
}

func (this *TrDosImage_Filename) Read(io *kaitai.Stream, parent *TrDosImage_File, root *TrDosImage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp22 = tmp22
	this.Name = tmp22
	return err
}
func (this *TrDosImage_Filename) FirstByte() (v uint8, err error) {
	if (this._f_firstByte) {
		return this.firstByte, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp23, err := this._io.ReadU1()
	if err != nil {
		return 0, err
	}
	this.firstByte = tmp23
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_firstByte = true
	this._f_firstByte = true
	return this.firstByte, nil
}
type TrDosImage_PositionAndLengthPrint struct {
	ExtentNo uint8
	Reserved uint8
	Length uint16
	_io *kaitai.Stream
	_root *TrDosImage
	_parent *TrDosImage_File
}
func NewTrDosImage_PositionAndLengthPrint() *TrDosImage_PositionAndLengthPrint {
	return &TrDosImage_PositionAndLengthPrint{
	}
}

func (this *TrDosImage_PositionAndLengthPrint) Read(io *kaitai.Stream, parent *TrDosImage_File, root *TrDosImage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ExtentNo = tmp24
	tmp25, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Reserved = tmp25
	tmp26, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Length = uint16(tmp26)
	return err
}
type TrDosImage_PositionAndLengthGeneric struct {
	Reserved uint16
	Length uint16
	_io *kaitai.Stream
	_root *TrDosImage
	_parent *TrDosImage_File
}
func NewTrDosImage_PositionAndLengthGeneric() *TrDosImage_PositionAndLengthGeneric {
	return &TrDosImage_PositionAndLengthGeneric{
	}
}

func (this *TrDosImage_PositionAndLengthGeneric) Read(io *kaitai.Stream, parent *TrDosImage_File, root *TrDosImage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Reserved = uint16(tmp27)
	tmp28, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Length = uint16(tmp28)
	return err
}
type TrDosImage_PositionAndLengthBasic struct {
	ProgramAndDataLength uint16
	ProgramLength uint16
	_io *kaitai.Stream
	_root *TrDosImage
	_parent *TrDosImage_File
}
func NewTrDosImage_PositionAndLengthBasic() *TrDosImage_PositionAndLengthBasic {
	return &TrDosImage_PositionAndLengthBasic{
	}
}

func (this *TrDosImage_PositionAndLengthBasic) Read(io *kaitai.Stream, parent *TrDosImage_File, root *TrDosImage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ProgramAndDataLength = uint16(tmp29)
	tmp30, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ProgramLength = uint16(tmp30)
	return err
}
type TrDosImage_File struct {
	Name *TrDosImage_Filename
	Extension uint8
	PositionAndLength interface{}
	LengthSectors uint8
	StartingSector uint8
	StartingTrack uint8
	_io *kaitai.Stream
	_root *TrDosImage
	_parent *TrDosImage
	_raw_Name []byte
	_f_isDeleted bool
	isDeleted bool
	_f_isTerminator bool
	isTerminator bool
	_f_contents bool
	contents []byte
}
func NewTrDosImage_File() *TrDosImage_File {
	return &TrDosImage_File{
	}
}

func (this *TrDosImage_File) Read(io *kaitai.Stream, parent *TrDosImage, root *TrDosImage) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp31, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp31 = tmp31
	this._raw_Name = tmp31
	_io__raw_Name := kaitai.NewStream(bytes.NewReader(this._raw_Name))
	tmp32 := NewTrDosImage_Filename()
	err = tmp32.Read(_io__raw_Name, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp32
	tmp33, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Extension = tmp33
	switch (this.Extension) {
	case 66:
		tmp34 := NewTrDosImage_PositionAndLengthBasic()
		err = tmp34.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.PositionAndLength = tmp34
	case 67:
		tmp35 := NewTrDosImage_PositionAndLengthCode()
		err = tmp35.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.PositionAndLength = tmp35
	case 35:
		tmp36 := NewTrDosImage_PositionAndLengthPrint()
		err = tmp36.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.PositionAndLength = tmp36
	default:
		tmp37 := NewTrDosImage_PositionAndLengthGeneric()
		err = tmp37.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.PositionAndLength = tmp37
	}
	tmp38, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LengthSectors = tmp38
	tmp39, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.StartingSector = tmp39
	tmp40, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.StartingTrack = tmp40
	return err
}
func (this *TrDosImage_File) IsDeleted() (v bool, err error) {
	if (this._f_isDeleted) {
		return this.isDeleted, nil
	}
	tmp41, err := this.Name.FirstByte()
	if err != nil {
		return false, err
	}
	this.isDeleted = bool(tmp41 == 1)
	this._f_isDeleted = true
	return this.isDeleted, nil
}
func (this *TrDosImage_File) IsTerminator() (v bool, err error) {
	if (this._f_isTerminator) {
		return this.isTerminator, nil
	}
	tmp42, err := this.Name.FirstByte()
	if err != nil {
		return false, err
	}
	this.isTerminator = bool(tmp42 == 0)
	this._f_isTerminator = true
	return this.isTerminator, nil
}
func (this *TrDosImage_File) Contents() (v []byte, err error) {
	if (this._f_contents) {
		return this.contents, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((((this.StartingTrack * 256) * 16) + (this.StartingSector * 256))), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp43, err := this._io.ReadBytes(int((this.LengthSectors * 256)))
	if err != nil {
		return nil, err
	}
	tmp43 = tmp43
	this.contents = tmp43
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_contents = true
	this._f_contents = true
	return this.contents, nil
}
