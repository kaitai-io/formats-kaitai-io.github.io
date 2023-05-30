// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * The Portable Image Format (PIF) is a basic, bitmap-like image format with the
 * focus on ease of use (implementation) and small size for embedded
 * applications.
 * 
 * See <https://github.com/gfcwfzkm/PIF-Image-Format> for more info.
 * @see <a href="https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf">Source</a>
 * @see <a href="https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/C%20Library/pifdec.c#L300">Source</a>
 */

type Pif_ImageType int
const (
	Pif_ImageType__Rgb332 Pif_ImageType = 7763
	Pif_ImageType__Rgb888 Pif_ImageType = 17212
	Pif_ImageType__IndexedRgb332 Pif_ImageType = 18754
	Pif_ImageType__IndexedRgb565 Pif_ImageType = 18759
	Pif_ImageType__IndexedRgb888 Pif_ImageType = 18770
	Pif_ImageType__BlackWhite Pif_ImageType = 32170
	Pif_ImageType__Rgb16c Pif_ImageType = 47253
	Pif_ImageType__Rgb565 Pif_ImageType = 58821
)

type Pif_CompressionType int
const (
	Pif_CompressionType__None Pif_CompressionType = 0
	Pif_CompressionType__Rle Pif_CompressionType = 32222
)
type Pif struct {
	FileHeader *Pif_PifHeader
	InfoHeader *Pif_InformationHeader
	ColorTable *Pif_ColorTableData
	_io *kaitai.Stream
	_root *Pif
	_parent interface{}
	_raw_ColorTable []byte
	_f_imageData bool
	imageData []byte
}
func NewPif() *Pif {
	return &Pif{
	}
}

func (this *Pif) Read(io *kaitai.Stream, parent interface{}, root *Pif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewPif_PifHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.FileHeader = tmp1
	tmp2 := NewPif_InformationHeader()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.InfoHeader = tmp2
	tmp3, err := this.InfoHeader.UsesIndexedMode()
	if err != nil {
		return err
	}
	if (tmp3) {
		tmp4, err := this._io.ReadBytes(int(this.InfoHeader.LenColorTable))
		if err != nil {
			return err
		}
		tmp4 = tmp4
		this._raw_ColorTable = tmp4
		_io__raw_ColorTable := kaitai.NewStream(bytes.NewReader(this._raw_ColorTable))
		tmp5 := NewPif_ColorTableData()
		err = tmp5.Read(_io__raw_ColorTable, this, this._root)
		if err != nil {
			return err
		}
		this.ColorTable = tmp5
	}
	return err
}
func (this *Pif) ImageData() (v []byte, err error) {
	if (this._f_imageData) {
		return this.imageData, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.FileHeader.OfsImageData), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp6, err := this._io.ReadBytes(int(this.InfoHeader.LenImageData))
	if err != nil {
		return nil, err
	}
	tmp6 = tmp6
	this.imageData = tmp6
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_imageData = true
	this._f_imageData = true
	return this.imageData, nil
}
type Pif_PifHeader struct {
	Magic []byte
	LenFile uint32
	OfsImageData uint32
	_io *kaitai.Stream
	_root *Pif
	_parent *Pif
	_f_ofsImageDataMin bool
	ofsImageDataMin int
}
func NewPif_PifHeader() *Pif_PifHeader {
	return &Pif_PifHeader{
	}
}

func (this *Pif_PifHeader) Read(io *kaitai.Stream, parent *Pif, root *Pif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Magic = tmp7
	if !(bytes.Equal(this.Magic, []uint8{80, 73, 70, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{80, 73, 70, 0}, this.Magic, this._io, "/types/pif_header/seq/0")
	}
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenFile = uint32(tmp8)
	tmp9, err := this.OfsImageDataMin()
	if err != nil {
		return err
	}
	tmp10, err := this.OfsImageDataMin()
	if err != nil {
		return err
	}
	if !(this.LenFile >= tmp10) {
		return kaitai.NewValidationLessThanError(tmp9, this.LenFile, this._io, "/types/pif_header/seq/1")
	}
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsImageData = uint32(tmp11)
	tmp12, err := this.OfsImageDataMin()
	if err != nil {
		return err
	}
	tmp13, err := this.OfsImageDataMin()
	if err != nil {
		return err
	}
	if !(this.OfsImageData >= tmp13) {
		return kaitai.NewValidationLessThanError(tmp12, this.OfsImageData, this._io, "/types/pif_header/seq/2")
	}
	if !(this.OfsImageData <= this.LenFile) {
		return kaitai.NewValidationGreaterThanError(this.LenFile, this.OfsImageData, this._io, "/types/pif_header/seq/2")
	}
	return err
}
func (this *Pif_PifHeader) OfsImageDataMin() (v int, err error) {
	if (this._f_ofsImageDataMin) {
		return this.ofsImageDataMin, nil
	}
	this.ofsImageDataMin = int((12 + 16))
	this._f_ofsImageDataMin = true
	return this.ofsImageDataMin, nil
}
type Pif_InformationHeader struct {
	ImageType Pif_ImageType
	BitsPerPixel uint16
	Width uint16
	Height uint16
	LenImageData uint32
	LenColorTable uint16
	Compression Pif_CompressionType
	_io *kaitai.Stream
	_root *Pif
	_parent *Pif
	_f_lenColorTableEntry bool
	lenColorTableEntry int8
	_f_lenColorTableFull bool
	lenColorTableFull int
	_f_lenColorTableMax bool
	lenColorTableMax int
	_f_usesIndexedMode bool
	usesIndexedMode bool
}
func NewPif_InformationHeader() *Pif_InformationHeader {
	return &Pif_InformationHeader{
	}
}

func (this *Pif_InformationHeader) Read(io *kaitai.Stream, parent *Pif, root *Pif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ImageType = Pif_ImageType(tmp14)
	if !( ((this.ImageType == Pif_ImageType__Rgb888) || (this.ImageType == Pif_ImageType__Rgb565) || (this.ImageType == Pif_ImageType__Rgb332) || (this.ImageType == Pif_ImageType__Rgb16c) || (this.ImageType == Pif_ImageType__BlackWhite) || (this.ImageType == Pif_ImageType__IndexedRgb888) || (this.ImageType == Pif_ImageType__IndexedRgb565) || (this.ImageType == Pif_ImageType__IndexedRgb332)) ) {
		return kaitai.NewValidationNotAnyOfError(this.ImageType, this._io, "/types/information_header/seq/0")
	}
	tmp15, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.BitsPerPixel = uint16(tmp15)
	{
		_it := this.BitsPerPixel
		var tmp16 bool;
		if (this.ImageType == Pif_ImageType__Rgb888) {
			tmp16 = _it == 24
		} else {
			var tmp17 bool;
			if (this.ImageType == Pif_ImageType__Rgb565) {
				tmp17 = _it == 16
			} else {
				var tmp18 bool;
				if (this.ImageType == Pif_ImageType__Rgb332) {
					tmp18 = _it == 8
				} else {
					var tmp19 bool;
					if (this.ImageType == Pif_ImageType__Rgb16c) {
						tmp19 = _it == 4
					} else {
						var tmp20 bool;
						if (this.ImageType == Pif_ImageType__BlackWhite) {
							tmp20 = _it == 1
						} else {
							var tmp21 bool;
							tmp22, err := this.UsesIndexedMode()
							if err != nil {
								return err
							}
							if (tmp22) {
								tmp21 = _it <= 8
							} else {
								tmp21 = true
							}
							tmp20 = tmp21
						}
						tmp19 = tmp20
					}
					tmp18 = tmp19
				}
				tmp17 = tmp18
			}
			tmp16 = tmp17
		}
		if !(tmp16) {
			return kaitai.NewValidationExprError(this.BitsPerPixel, this._io, "/types/information_header/seq/1")
		}
	}
	tmp23, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Width = uint16(tmp23)
	tmp24, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Height = uint16(tmp24)
	tmp25, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenImageData = uint32(tmp25)
	if !(this.LenImageData <= (this._root.FileHeader.LenFile - this._root.FileHeader.OfsImageData)) {
		return kaitai.NewValidationGreaterThanError((this._root.FileHeader.LenFile - this._root.FileHeader.OfsImageData), this.LenImageData, this._io, "/types/information_header/seq/4")
	}
	tmp26, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenColorTable = uint16(tmp26)
	var tmp27 int;
	tmp28, err := this.UsesIndexedMode()
	if err != nil {
		return err
	}
	if (tmp28) {
		tmp29, err := this.LenColorTableEntry()
		if err != nil {
			return err
		}
		tmp27 = (tmp29 * 1)
	} else {
		tmp27 = 0
	}
	var tmp30 int;
	tmp31, err := this.UsesIndexedMode()
	if err != nil {
		return err
	}
	if (tmp31) {
		tmp32, err := this.LenColorTableEntry()
		if err != nil {
			return err
		}
		tmp30 = (tmp32 * 1)
	} else {
		tmp30 = 0
	}
	if !(this.LenColorTable >= tmp30) {
		return kaitai.NewValidationLessThanError(tmp27, this.LenColorTable, this._io, "/types/information_header/seq/5")
	}
	var tmp33 int;
	tmp34, err := this.UsesIndexedMode()
	if err != nil {
		return err
	}
	if (tmp34) {
		var tmp35 int;
		tmp36, err := this.LenColorTableMax()
		if err != nil {
			return err
		}
		tmp37, err := this.LenColorTableFull()
		if err != nil {
			return err
		}
		if (tmp36 < tmp37) {
			tmp38, err := this.LenColorTableMax()
			if err != nil {
				return err
			}
			tmp35 = tmp38
		} else {
			tmp39, err := this.LenColorTableFull()
			if err != nil {
				return err
			}
			tmp35 = tmp39
		}
		tmp33 = tmp35
	} else {
		tmp33 = 0
	}
	var tmp40 int;
	tmp41, err := this.UsesIndexedMode()
	if err != nil {
		return err
	}
	if (tmp41) {
		var tmp42 int;
		tmp43, err := this.LenColorTableMax()
		if err != nil {
			return err
		}
		tmp44, err := this.LenColorTableFull()
		if err != nil {
			return err
		}
		if (tmp43 < tmp44) {
			tmp45, err := this.LenColorTableMax()
			if err != nil {
				return err
			}
			tmp42 = tmp45
		} else {
			tmp46, err := this.LenColorTableFull()
			if err != nil {
				return err
			}
			tmp42 = tmp46
		}
		tmp40 = tmp42
	} else {
		tmp40 = 0
	}
	if !(this.LenColorTable <= tmp40) {
		return kaitai.NewValidationGreaterThanError(tmp33, this.LenColorTable, this._io, "/types/information_header/seq/5")
	}
	tmp47, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Compression = Pif_CompressionType(tmp47)
	if !( ((this.Compression == Pif_CompressionType__None) || (this.Compression == Pif_CompressionType__Rle)) ) {
		return kaitai.NewValidationNotAnyOfError(this.Compression, this._io, "/types/information_header/seq/6")
	}
	return err
}
func (this *Pif_InformationHeader) LenColorTableEntry() (v int8, err error) {
	if (this._f_lenColorTableEntry) {
		return this.lenColorTableEntry, nil
	}
	var tmp48 int8;
	if (this.ImageType == Pif_ImageType__IndexedRgb888) {
		tmp48 = 3
	} else {
		var tmp49 int8;
		if (this.ImageType == Pif_ImageType__IndexedRgb565) {
			tmp49 = 2
		} else {
			var tmp50 int8;
			if (this.ImageType == Pif_ImageType__IndexedRgb332) {
				tmp50 = 1
			} else {
				tmp50 = 0
			}
			tmp49 = tmp50
		}
		tmp48 = tmp49
	}
	this.lenColorTableEntry = int8(tmp48)
	this._f_lenColorTableEntry = true
	return this.lenColorTableEntry, nil
}
func (this *Pif_InformationHeader) LenColorTableFull() (v int, err error) {
	if (this._f_lenColorTableFull) {
		return this.lenColorTableFull, nil
	}
	tmp51, err := this.LenColorTableEntry()
	if err != nil {
		return 0, err
	}
	this.lenColorTableFull = int((tmp51 * (1 << this.BitsPerPixel)))
	this._f_lenColorTableFull = true
	return this.lenColorTableFull, nil
}
func (this *Pif_InformationHeader) LenColorTableMax() (v int, err error) {
	if (this._f_lenColorTableMax) {
		return this.lenColorTableMax, nil
	}
	tmp52, err := this._root.FileHeader.OfsImageDataMin()
	if err != nil {
		return 0, err
	}
	this.lenColorTableMax = int((this._root.FileHeader.OfsImageData - tmp52))
	this._f_lenColorTableMax = true
	return this.lenColorTableMax, nil
}
func (this *Pif_InformationHeader) UsesIndexedMode() (v bool, err error) {
	if (this._f_usesIndexedMode) {
		return this.usesIndexedMode, nil
	}
	tmp53, err := this.LenColorTableEntry()
	if err != nil {
		return false, err
	}
	this.usesIndexedMode = bool(tmp53 != 0)
	this._f_usesIndexedMode = true
	return this.usesIndexedMode, nil
}

/**
 * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
 * 
 * > Bits per Pixel: Bit size that each Pixel occupies. Bit size for an
 * > Indexed Image cannot go beyond 8 bits.
 */

/**
 * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
 * 
 * > Color Table Size: (...), only used in Indexed mode, otherwise zero.
 * ---
 * > **Note**: The presence of the Color Table is mandatory when Bits per
 * > Pixel <= 8, unless Image Type states RGB332, RGB16C or B/W
 * ---
 * > **Color Table** (semi-optional)
 * >
 * > (...) The amount of Colors has to be same or less than [Bits per
 * > Pixel] allow, otherwise the image is invalid.
 */
type Pif_ColorTableData struct {
	Entries []int
	_io *kaitai.Stream
	_root *Pif
	_parent *Pif
}
func NewPif_ColorTableData() *Pif_ColorTableData {
	return &Pif_ColorTableData{
	}
}

func (this *Pif_ColorTableData) Read(io *kaitai.Stream, parent *Pif, root *Pif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp54, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp54 {
			break
		}
		switch (this._root.InfoHeader.ImageType) {
		case Pif_ImageType__IndexedRgb888:
			tmp55, err := this._io.ReadBitsIntLe(24)
			if err != nil {
				return err
			}
			this.Entries = append(this.Entries, tmp55)
		case Pif_ImageType__IndexedRgb565:
			tmp56, err := this._io.ReadBitsIntLe(16)
			if err != nil {
				return err
			}
			this.Entries = append(this.Entries, tmp56)
		case Pif_ImageType__IndexedRgb332:
			tmp57, err := this._io.ReadBitsIntLe(8)
			if err != nil {
				return err
			}
			this.Entries = append(this.Entries, tmp57)
		}
	}
	return err
}