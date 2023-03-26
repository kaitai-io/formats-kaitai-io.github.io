// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * .trx file format is widely used for distribution of firmware
 * updates for Broadcom devices. The most well-known are ASUS routers.
 * 
 * Fundamentally, it includes a footer which acts as a safeguard
 * against installing a firmware package on a wrong hardware model or
 * version, and a header which list numerous partitions packaged inside
 * a single .trx file.
 * 
 * trx files not necessarily contain all these headers.
 * @see <a href="https://github.com/openwrt/firmware-utils/blob/a2c80c5/src/trx.c">Source</a>
 * @see <a href="https://web.archive.org/web/20190127154419/https://openwrt.org/docs/techref/header">Source</a>
 * @see <a href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt">Source</a>
 */
type BroadcomTrx struct {
	_io *kaitai.Stream
	_root *BroadcomTrx
	_parent interface{}
	_f_header bool
	header *BroadcomTrx_Header
	_f_tail bool
	tail *BroadcomTrx_Tail
}
func NewBroadcomTrx() *BroadcomTrx {
	return &BroadcomTrx{
	}
}

func (this *BroadcomTrx) Read(io *kaitai.Stream, parent interface{}, root *BroadcomTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *BroadcomTrx) Header() (v *BroadcomTrx_Header, err error) {
	if (this._f_header) {
		return this.header, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp1 := NewBroadcomTrx_Header()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.header = tmp1
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_header = true
	this._f_header = true
	return this.header, nil
}
func (this *BroadcomTrx) Tail() (v *BroadcomTrx_Tail, err error) {
	if (this._f_tail) {
		return this.tail, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp2, err := this._io.Size()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((tmp2 - 64)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp3 := NewBroadcomTrx_Tail()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.tail = tmp3
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_tail = true
	this._f_tail = true
	return this.tail, nil
}
type BroadcomTrx_Revision struct {
	Major uint8
	Minor uint8
	_io *kaitai.Stream
	_root *BroadcomTrx
	_parent *BroadcomTrx_Tail_HwCompInfo
}
func NewBroadcomTrx_Revision() *BroadcomTrx_Revision {
	return &BroadcomTrx_Revision{
	}
}

func (this *BroadcomTrx_Revision) Read(io *kaitai.Stream, parent *BroadcomTrx_Tail_HwCompInfo, root *BroadcomTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Major = tmp4
	tmp5, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Minor = tmp5
	return err
}
type BroadcomTrx_Version struct {
	Major uint8
	Minor uint8
	Patch uint8
	Tweak uint8
	_io *kaitai.Stream
	_root *BroadcomTrx
	_parent *BroadcomTrx_Tail
}
func NewBroadcomTrx_Version() *BroadcomTrx_Version {
	return &BroadcomTrx_Version{
	}
}

func (this *BroadcomTrx_Version) Read(io *kaitai.Stream, parent *BroadcomTrx_Tail, root *BroadcomTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Major = tmp6
	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Minor = tmp7
	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Patch = tmp8
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Tweak = tmp9
	return err
}

/**
 * A safeguard against installation of firmware to an incompatible device
 */
type BroadcomTrx_Tail struct {
	Version *BroadcomTrx_Version
	ProductId string
	CompHw []*BroadcomTrx_Tail_HwCompInfo
	Reserved []byte
	_io *kaitai.Stream
	_root *BroadcomTrx
	_parent *BroadcomTrx
}
func NewBroadcomTrx_Tail() *BroadcomTrx_Tail {
	return &BroadcomTrx_Tail{
	}
}

func (this *BroadcomTrx_Tail) Read(io *kaitai.Stream, parent *BroadcomTrx, root *BroadcomTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10 := NewBroadcomTrx_Version()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Version = tmp10
	tmp11, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp11 = kaitai.BytesTerminate(tmp11, 0, false)
	this.ProductId = string(tmp11)
	for i := 0; i < int(4); i++ {
		_ = i
		tmp12 := NewBroadcomTrx_Tail_HwCompInfo()
		err = tmp12.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.CompHw = append(this.CompHw, tmp12)
	}
	tmp13, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.Reserved = tmp13
	return err
}

/**
 * 1.9.2.7 by default
 */

/**
 * 0.02 - 2.99
 */
type BroadcomTrx_Tail_HwCompInfo struct {
	Min *BroadcomTrx_Revision
	Max *BroadcomTrx_Revision
	_io *kaitai.Stream
	_root *BroadcomTrx
	_parent *BroadcomTrx_Tail
}
func NewBroadcomTrx_Tail_HwCompInfo() *BroadcomTrx_Tail_HwCompInfo {
	return &BroadcomTrx_Tail_HwCompInfo{
	}
}

func (this *BroadcomTrx_Tail_HwCompInfo) Read(io *kaitai.Stream, parent *BroadcomTrx_Tail, root *BroadcomTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14 := NewBroadcomTrx_Revision()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Min = tmp14
	tmp15 := NewBroadcomTrx_Revision()
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Max = tmp15
	return err
}
type BroadcomTrx_Header struct {
	Magic []byte
	Len uint32
	Crc32 uint32
	Version uint16
	Flags *BroadcomTrx_Header_Flags
	Partitions []*BroadcomTrx_Header_Partition
	_io *kaitai.Stream
	_root *BroadcomTrx
	_parent *BroadcomTrx
}
func NewBroadcomTrx_Header() *BroadcomTrx_Header {
	return &BroadcomTrx_Header{
	}
}

func (this *BroadcomTrx_Header) Read(io *kaitai.Stream, parent *BroadcomTrx, root *BroadcomTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.Magic = tmp16
	if !(bytes.Equal(this.Magic, []uint8{72, 68, 82, 48})) {
		return kaitai.NewValidationNotEqualError([]uint8{72, 68, 82, 48}, this.Magic, this._io, "/types/header/seq/0")
	}
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Len = uint32(tmp17)
	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Crc32 = uint32(tmp18)
	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp19)
	tmp20 := NewBroadcomTrx_Header_Flags()
	err = tmp20.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp20
	for i := 1;; i++ {
		tmp21 := NewBroadcomTrx_Header_Partition(i)
		err = tmp21.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp21
		this.Partitions = append(this.Partitions, _it)
		tmp22, err := _it.IsPresent()
		if err != nil {
			return err
		}
		if  ((i >= 4) || (!(tmp22)))  {
			break
		}
	}
	return err
}

/**
 * Length of file including header
 */

/**
 * CRC from `version` (??? todo: see the original and disambiguate) to end of file
 */

/**
 * Offsets of partitions from start of header
 */
type BroadcomTrx_Header_Partition struct {
	OfsBody uint32
	Idx uint8
	_io *kaitai.Stream
	_root *BroadcomTrx
	_parent *BroadcomTrx_Header
	_f_isPresent bool
	isPresent bool
	_f_isLast bool
	isLast bool
	_f_lenBody bool
	lenBody int
	_f_body bool
	body []byte
}
func NewBroadcomTrx_Header_Partition(idx uint8) *BroadcomTrx_Header_Partition {
	return &BroadcomTrx_Header_Partition{
		Idx: idx,
	}
}

func (this *BroadcomTrx_Header_Partition) Read(io *kaitai.Stream, parent *BroadcomTrx_Header, root *BroadcomTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp23, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsBody = uint32(tmp23)
	return err
}
func (this *BroadcomTrx_Header_Partition) IsPresent() (v bool, err error) {
	if (this._f_isPresent) {
		return this.isPresent, nil
	}
	this.isPresent = bool(this.OfsBody != 0)
	this._f_isPresent = true
	return this.isPresent, nil
}
func (this *BroadcomTrx_Header_Partition) IsLast() (v bool, err error) {
	if (this._f_isLast) {
		return this.isLast, nil
	}
	tmp24, err := this.IsPresent()
	if err != nil {
		return false, err
	}
	if (tmp24) {
		tmp25, err := this._parent.Partitions[(this.Idx + 1)].IsPresent()
		if err != nil {
			return false, err
		}
		this.isLast = bool( ((this.Idx == (len(this._parent.Partitions) - 1)) || (!(tmp25))) )
	}
	this._f_isLast = true
	return this.isLast, nil
}
func (this *BroadcomTrx_Header_Partition) LenBody() (v int, err error) {
	if (this._f_lenBody) {
		return this.lenBody, nil
	}
	tmp26, err := this.IsPresent()
	if err != nil {
		return 0, err
	}
	if (tmp26) {
		var tmp27 int;
		tmp28, err := this.IsLast()
		if err != nil {
			return 0, err
		}
		if (tmp28) {
			tmp29, err := this._root._io.Size()
			if err != nil {
				return 0, err
			}
			tmp27 = (tmp29 - this.OfsBody)
		} else {
			tmp27 = this._parent.Partitions[(this.Idx + 1)].OfsBody
		}
		this.lenBody = int(tmp27)
	}
	this._f_lenBody = true
	return this.lenBody, nil
}
func (this *BroadcomTrx_Header_Partition) Body() (v []byte, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	tmp30, err := this.IsPresent()
	if err != nil {
		return nil, err
	}
	if (tmp30) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsBody), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp31, err := this.LenBody()
		if err != nil {
			return nil, err
		}
		tmp32, err := thisIo.ReadBytes(int(tmp31))
		if err != nil {
			return nil, err
		}
		tmp32 = tmp32
		this.body = tmp32
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_body = true
	}
	this._f_body = true
	return this.body, nil
}
type BroadcomTrx_Header_Flags struct {
	Flags []bool
	_io *kaitai.Stream
	_root *BroadcomTrx
	_parent *BroadcomTrx_Header
}
func NewBroadcomTrx_Header_Flags() *BroadcomTrx_Header_Flags {
	return &BroadcomTrx_Header_Flags{
	}
}

func (this *BroadcomTrx_Header_Flags) Read(io *kaitai.Stream, parent *BroadcomTrx_Header, root *BroadcomTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 0; i < int(16); i++ {
		_ = i
		tmp33, err := this._io.ReadBitsIntLe(1)
		if err != nil {
			return err
		}
		this.Flags = append(this.Flags, tmp33 != 0)
	}
	return err
}
