// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * GIF (Graphics Interchange Format) is an image file format, developed
 * in 1987. It became popular in 1990s as one of the main image formats
 * used in World Wide Web.
 * 
 * GIF format allows encoding of palette-based images up to 256 colors
 * (each of the colors can be chosen from a 24-bit RGB
 * colorspace). Image data stream uses LZW (Lempel–Ziv–Welch) lossless
 * compression.
 * 
 * Over the years, several version of the format were published and
 * several extensions to it were made, namely, a popular Netscape
 * extension that allows to store several images in one file, switching
 * between them, which produces crude form of animation.
 * 
 * Structurally, format consists of several mandatory headers and then
 * a stream of blocks follows. Blocks can carry additional
 * metainformation or image data.
 */

type Gif_BlockType int
const (
	Gif_BlockType__Extension Gif_BlockType = 33
	Gif_BlockType__LocalImageDescriptor Gif_BlockType = 44
	Gif_BlockType__EndOfFile Gif_BlockType = 59
)

type Gif_ExtensionLabel int
const (
	Gif_ExtensionLabel__GraphicControl Gif_ExtensionLabel = 249
	Gif_ExtensionLabel__Comment Gif_ExtensionLabel = 254
	Gif_ExtensionLabel__Application Gif_ExtensionLabel = 255
)
type Gif struct {
	Hdr *Gif_Header
	LogicalScreenDescriptor *Gif_LogicalScreenDescriptorStruct
	GlobalColorTable *Gif_ColorTable
	Blocks []*Gif_Block
	_io *kaitai.Stream
	_root *Gif
	_parent interface{}
	_raw_GlobalColorTable []byte
}
func NewGif() *Gif {
	return &Gif{
	}
}

func (this *Gif) Read(io *kaitai.Stream, parent interface{}, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewGif_Header()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Hdr = tmp1
	tmp2 := NewGif_LogicalScreenDescriptorStruct()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.LogicalScreenDescriptor = tmp2
	tmp3, err := this.LogicalScreenDescriptor.HasColorTable()
	if err != nil {
		return err
	}
	if (tmp3) {
		tmp4, err := this.LogicalScreenDescriptor.ColorTableSize()
		if err != nil {
			return err
		}
		tmp5, err := this._io.ReadBytes(int((tmp4 * 3)))
		if err != nil {
			return err
		}
		tmp5 = tmp5
		this._raw_GlobalColorTable = tmp5
		_io__raw_GlobalColorTable := kaitai.NewStream(bytes.NewReader(this._raw_GlobalColorTable))
		tmp6 := NewGif_ColorTable()
		err = tmp6.Read(_io__raw_GlobalColorTable, this, this._root)
		if err != nil {
			return err
		}
		this.GlobalColorTable = tmp6
	}
	for i := 1;; i++ {
		tmp7 := NewGif_Block()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp7
		this.Blocks = append(this.Blocks, _it)
		tmp8, err := this._io.EOF()
		if err != nil {
			return err
		}
		if  ((tmp8) || (_it.BlockType == Gif_BlockType__EndOfFile))  {
			break
		}
	}
	return err
}

/**
 * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 18</a>
 */

/**
 * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 22</a>
 */
type Gif_ImageData struct {
	LzwMinCodeSize uint8
	Subblocks *Gif_Subblocks
	_io *kaitai.Stream
	_root *Gif
	_parent *Gif_LocalImageDescriptor
}
func NewGif_ImageData() *Gif_ImageData {
	return &Gif_ImageData{
	}
}

func (this *Gif_ImageData) Read(io *kaitai.Stream, parent *Gif_LocalImageDescriptor, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LzwMinCodeSize = tmp9
	tmp10 := NewGif_Subblocks()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Subblocks = tmp10
	return err
}
type Gif_ColorTableEntry struct {
	Red uint8
	Green uint8
	Blue uint8
	_io *kaitai.Stream
	_root *Gif
	_parent *Gif_ColorTable
}
func NewGif_ColorTableEntry() *Gif_ColorTableEntry {
	return &Gif_ColorTableEntry{
	}
}

func (this *Gif_ColorTableEntry) Read(io *kaitai.Stream, parent *Gif_ColorTable, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Red = tmp11
	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Green = tmp12
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Blue = tmp13
	return err
}

/**
 * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 18</a>
 */
type Gif_LogicalScreenDescriptorStruct struct {
	ScreenWidth uint16
	ScreenHeight uint16
	Flags uint8
	BgColorIndex uint8
	PixelAspectRatio uint8
	_io *kaitai.Stream
	_root *Gif
	_parent *Gif
	_f_hasColorTable bool
	hasColorTable bool
	_f_colorTableSize bool
	colorTableSize int
}
func NewGif_LogicalScreenDescriptorStruct() *Gif_LogicalScreenDescriptorStruct {
	return &Gif_LogicalScreenDescriptorStruct{
	}
}

func (this *Gif_LogicalScreenDescriptorStruct) Read(io *kaitai.Stream, parent *Gif, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ScreenWidth = uint16(tmp14)
	tmp15, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ScreenHeight = uint16(tmp15)
	tmp16, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = tmp16
	tmp17, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BgColorIndex = tmp17
	tmp18, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PixelAspectRatio = tmp18
	return err
}
func (this *Gif_LogicalScreenDescriptorStruct) HasColorTable() (v bool, err error) {
	if (this._f_hasColorTable) {
		return this.hasColorTable, nil
	}
	this.hasColorTable = bool((this.Flags & 128) != 0)
	this._f_hasColorTable = true
	return this.hasColorTable, nil
}
func (this *Gif_LogicalScreenDescriptorStruct) ColorTableSize() (v int, err error) {
	if (this._f_colorTableSize) {
		return this.colorTableSize, nil
	}
	this.colorTableSize = int((2 << (this.Flags & 7)))
	this._f_colorTableSize = true
	return this.colorTableSize, nil
}
type Gif_LocalImageDescriptor struct {
	Left uint16
	Top uint16
	Width uint16
	Height uint16
	Flags uint8
	LocalColorTable *Gif_ColorTable
	ImageData *Gif_ImageData
	_io *kaitai.Stream
	_root *Gif
	_parent *Gif_Block
	_raw_LocalColorTable []byte
	_f_hasColorTable bool
	hasColorTable bool
	_f_hasInterlace bool
	hasInterlace bool
	_f_hasSortedColorTable bool
	hasSortedColorTable bool
	_f_colorTableSize bool
	colorTableSize int
}
func NewGif_LocalImageDescriptor() *Gif_LocalImageDescriptor {
	return &Gif_LocalImageDescriptor{
	}
}

func (this *Gif_LocalImageDescriptor) Read(io *kaitai.Stream, parent *Gif_Block, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Left = uint16(tmp19)
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Top = uint16(tmp20)
	tmp21, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Width = uint16(tmp21)
	tmp22, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Height = uint16(tmp22)
	tmp23, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = tmp23
	tmp24, err := this.HasColorTable()
	if err != nil {
		return err
	}
	if (tmp24) {
		tmp25, err := this.ColorTableSize()
		if err != nil {
			return err
		}
		tmp26, err := this._io.ReadBytes(int((tmp25 * 3)))
		if err != nil {
			return err
		}
		tmp26 = tmp26
		this._raw_LocalColorTable = tmp26
		_io__raw_LocalColorTable := kaitai.NewStream(bytes.NewReader(this._raw_LocalColorTable))
		tmp27 := NewGif_ColorTable()
		err = tmp27.Read(_io__raw_LocalColorTable, this, this._root)
		if err != nil {
			return err
		}
		this.LocalColorTable = tmp27
	}
	tmp28 := NewGif_ImageData()
	err = tmp28.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ImageData = tmp28
	return err
}
func (this *Gif_LocalImageDescriptor) HasColorTable() (v bool, err error) {
	if (this._f_hasColorTable) {
		return this.hasColorTable, nil
	}
	this.hasColorTable = bool((this.Flags & 128) != 0)
	this._f_hasColorTable = true
	return this.hasColorTable, nil
}
func (this *Gif_LocalImageDescriptor) HasInterlace() (v bool, err error) {
	if (this._f_hasInterlace) {
		return this.hasInterlace, nil
	}
	this.hasInterlace = bool((this.Flags & 64) != 0)
	this._f_hasInterlace = true
	return this.hasInterlace, nil
}
func (this *Gif_LocalImageDescriptor) HasSortedColorTable() (v bool, err error) {
	if (this._f_hasSortedColorTable) {
		return this.hasSortedColorTable, nil
	}
	this.hasSortedColorTable = bool((this.Flags & 32) != 0)
	this._f_hasSortedColorTable = true
	return this.hasSortedColorTable, nil
}
func (this *Gif_LocalImageDescriptor) ColorTableSize() (v int, err error) {
	if (this._f_colorTableSize) {
		return this.colorTableSize, nil
	}
	this.colorTableSize = int((2 << (this.Flags & 7)))
	this._f_colorTableSize = true
	return this.colorTableSize, nil
}
type Gif_Block struct {
	BlockType Gif_BlockType
	Body interface{}
	_io *kaitai.Stream
	_root *Gif
	_parent *Gif
}
func NewGif_Block() *Gif_Block {
	return &Gif_Block{
	}
}

func (this *Gif_Block) Read(io *kaitai.Stream, parent *Gif, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BlockType = Gif_BlockType(tmp29)
	switch (this.BlockType) {
	case Gif_BlockType__Extension:
		tmp30 := NewGif_Extension()
		err = tmp30.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp30
	case Gif_BlockType__LocalImageDescriptor:
		tmp31 := NewGif_LocalImageDescriptor()
		err = tmp31.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp31
	}
	return err
}

/**
 * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 19</a>
 */
type Gif_ColorTable struct {
	Entries []*Gif_ColorTableEntry
	_io *kaitai.Stream
	_root *Gif
	_parent interface{}
}
func NewGif_ColorTable() *Gif_ColorTable {
	return &Gif_ColorTable{
	}
}

func (this *Gif_ColorTable) Read(io *kaitai.Stream, parent interface{}, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp32, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp32 {
			break
		}
		tmp33 := NewGif_ColorTableEntry()
		err = tmp33.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp33)
	}
	return err
}

/**
 * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 17</a>
 */
type Gif_Header struct {
	Magic []byte
	Version string
	_io *kaitai.Stream
	_root *Gif
	_parent *Gif
}
func NewGif_Header() *Gif_Header {
	return &Gif_Header{
	}
}

func (this *Gif_Header) Read(io *kaitai.Stream, parent *Gif, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp34 = tmp34
	this.Magic = tmp34
	if !(bytes.Equal(this.Magic, []uint8{71, 73, 70})) {
		return kaitai.NewValidationNotEqualError([]uint8{71, 73, 70}, this.Magic, this._io, "/types/header/seq/0")
	}
	tmp35, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp35 = tmp35
	this.Version = string(tmp35)
	return err
}

/**
 * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 23</a>
 */
type Gif_ExtGraphicControl struct {
	BlockSize []byte
	Flags uint8
	DelayTime uint16
	TransparentIdx uint8
	Terminator []byte
	_io *kaitai.Stream
	_root *Gif
	_parent *Gif_Extension
	_f_transparentColorFlag bool
	transparentColorFlag bool
	_f_userInputFlag bool
	userInputFlag bool
}
func NewGif_ExtGraphicControl() *Gif_ExtGraphicControl {
	return &Gif_ExtGraphicControl{
	}
}

func (this *Gif_ExtGraphicControl) Read(io *kaitai.Stream, parent *Gif_Extension, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp36, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.BlockSize = tmp36
	if !(bytes.Equal(this.BlockSize, []uint8{4})) {
		return kaitai.NewValidationNotEqualError([]uint8{4}, this.BlockSize, this._io, "/types/ext_graphic_control/seq/0")
	}
	tmp37, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = tmp37
	tmp38, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DelayTime = uint16(tmp38)
	tmp39, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.TransparentIdx = tmp39
	tmp40, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp40 = tmp40
	this.Terminator = tmp40
	if !(bytes.Equal(this.Terminator, []uint8{0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0}, this.Terminator, this._io, "/types/ext_graphic_control/seq/4")
	}
	return err
}
func (this *Gif_ExtGraphicControl) TransparentColorFlag() (v bool, err error) {
	if (this._f_transparentColorFlag) {
		return this.transparentColorFlag, nil
	}
	this.transparentColorFlag = bool((this.Flags & 1) != 0)
	this._f_transparentColorFlag = true
	return this.transparentColorFlag, nil
}
func (this *Gif_ExtGraphicControl) UserInputFlag() (v bool, err error) {
	if (this._f_userInputFlag) {
		return this.userInputFlag, nil
	}
	this.userInputFlag = bool((this.Flags & 2) != 0)
	this._f_userInputFlag = true
	return this.userInputFlag, nil
}
type Gif_Subblock struct {
	LenBytes uint8
	Bytes []byte
	_io *kaitai.Stream
	_root *Gif
	_parent interface{}
}
func NewGif_Subblock() *Gif_Subblock {
	return &Gif_Subblock{
	}
}

func (this *Gif_Subblock) Read(io *kaitai.Stream, parent interface{}, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenBytes = tmp41
	tmp42, err := this._io.ReadBytes(int(this.LenBytes))
	if err != nil {
		return err
	}
	tmp42 = tmp42
	this.Bytes = tmp42
	return err
}
type Gif_ExtApplication struct {
	ApplicationId *Gif_Subblock
	Subblocks []*Gif_Subblock
	_io *kaitai.Stream
	_root *Gif
	_parent *Gif_Extension
}
func NewGif_ExtApplication() *Gif_ExtApplication {
	return &Gif_ExtApplication{
	}
}

func (this *Gif_ExtApplication) Read(io *kaitai.Stream, parent *Gif_Extension, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp43 := NewGif_Subblock()
	err = tmp43.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ApplicationId = tmp43
	for i := 1;; i++ {
		tmp44 := NewGif_Subblock()
		err = tmp44.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp44
		this.Subblocks = append(this.Subblocks, _it)
		if _it.LenBytes == 0 {
			break
		}
	}
	return err
}
type Gif_Subblocks struct {
	Entries []*Gif_Subblock
	_io *kaitai.Stream
	_root *Gif
	_parent interface{}
}
func NewGif_Subblocks() *Gif_Subblocks {
	return &Gif_Subblocks{
	}
}

func (this *Gif_Subblocks) Read(io *kaitai.Stream, parent interface{}, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp45 := NewGif_Subblock()
		err = tmp45.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp45
		this.Entries = append(this.Entries, _it)
		if _it.LenBytes == 0 {
			break
		}
	}
	return err
}
type Gif_Extension struct {
	Label Gif_ExtensionLabel
	Body interface{}
	_io *kaitai.Stream
	_root *Gif
	_parent *Gif_Block
}
func NewGif_Extension() *Gif_Extension {
	return &Gif_Extension{
	}
}

func (this *Gif_Extension) Read(io *kaitai.Stream, parent *Gif_Block, root *Gif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp46, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Label = Gif_ExtensionLabel(tmp46)
	switch (this.Label) {
	case Gif_ExtensionLabel__Application:
		tmp47 := NewGif_ExtApplication()
		err = tmp47.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp47
	case Gif_ExtensionLabel__Comment:
		tmp48 := NewGif_Subblocks()
		err = tmp48.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp48
	case Gif_ExtensionLabel__GraphicControl:
		tmp49 := NewGif_ExtGraphicControl()
		err = tmp49.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp49
	default:
		tmp50 := NewGif_Subblocks()
		err = tmp50.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp50
	}
	return err
}
