// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * Header and a footer for stock firmwares used on some ASUS routers. trx files not necessarily contain these headers.
 * @see <a href="https://github.com/openwrt/openwrt/blob/master/tools/firmware-utils/src/trx.c">Source</a>
 */
type AsusTrx struct {
	_io *kaitai.Stream
	_root *AsusTrx
	_parent interface{}
	_f_header bool
	header *AsusTrx_Header
	_f_tail bool
	tail *AsusTrx_Tail
}
func NewAsusTrx() *AsusTrx {
	return &AsusTrx{
	}
}

func (this *AsusTrx) Read(io *kaitai.Stream, parent interface{}, root *AsusTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *AsusTrx) Header() (v *AsusTrx_Header, err error) {
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
	tmp1 := NewAsusTrx_Header()
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
func (this *AsusTrx) Tail() (v *AsusTrx_Tail, err error) {
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
	tmp3 := NewAsusTrx_Tail()
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
type AsusTrx_Revision struct {
	Major uint8
	Minor uint8
	_io *kaitai.Stream
	_root *AsusTrx
	_parent *AsusTrx_Tail_HwCompInfo
}
func NewAsusTrx_Revision() *AsusTrx_Revision {
	return &AsusTrx_Revision{
	}
}

func (this *AsusTrx_Revision) Read(io *kaitai.Stream, parent *AsusTrx_Tail_HwCompInfo, root *AsusTrx) (err error) {
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
type AsusTrx_Version struct {
	Major uint8
	Minor uint8
	Patch uint8
	Tweak uint8
	_io *kaitai.Stream
	_root *AsusTrx
	_parent *AsusTrx_Tail
}
func NewAsusTrx_Version() *AsusTrx_Version {
	return &AsusTrx_Version{
	}
}

func (this *AsusTrx_Version) Read(io *kaitai.Stream, parent *AsusTrx_Tail, root *AsusTrx) (err error) {
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
type AsusTrx_Tail struct {
	Version *AsusTrx_Version
	ProductId string
	CompHw []*AsusTrx_Tail_HwCompInfo
	Reserved []byte
	_io *kaitai.Stream
	_root *AsusTrx
	_parent *AsusTrx
}
func NewAsusTrx_Tail() *AsusTrx_Tail {
	return &AsusTrx_Tail{
	}
}

func (this *AsusTrx_Tail) Read(io *kaitai.Stream, parent *AsusTrx, root *AsusTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10 := NewAsusTrx_Version()
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
	this.CompHw = make([]*AsusTrx_Tail_HwCompInfo, 4)
	for i := range this.CompHw {
		tmp12 := NewAsusTrx_Tail_HwCompInfo()
		err = tmp12.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.CompHw[i] = tmp12
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
type AsusTrx_Tail_HwCompInfo struct {
	Min *AsusTrx_Revision
	Max *AsusTrx_Revision
	_io *kaitai.Stream
	_root *AsusTrx
	_parent *AsusTrx_Tail
}
func NewAsusTrx_Tail_HwCompInfo() *AsusTrx_Tail_HwCompInfo {
	return &AsusTrx_Tail_HwCompInfo{
	}
}

func (this *AsusTrx_Tail_HwCompInfo) Read(io *kaitai.Stream, parent *AsusTrx_Tail, root *AsusTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14 := NewAsusTrx_Revision()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Min = tmp14
	tmp15 := NewAsusTrx_Revision()
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Max = tmp15
	return err
}
type AsusTrx_Header struct {
	Signature []byte
	Len uint32
	Crc32 uint32
	Version uint16
	Flags *AsusTrx_Header_Flags
	Partitions []*AsusTrx_Header_Partition
	_io *kaitai.Stream
	_root *AsusTrx
	_parent *AsusTrx
}
func NewAsusTrx_Header() *AsusTrx_Header {
	return &AsusTrx_Header{
	}
}

func (this *AsusTrx_Header) Read(io *kaitai.Stream, parent *AsusTrx, root *AsusTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.Signature = tmp16
	if !(bytes.Equal(this.Signature, []uint8{72, 68, 82, 48})) {
		return kaitai.NewValidationNotEqualError([]uint8{72, 68, 82, 48}, this.Signature, this._io, "/types/header/seq/0")
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
	tmp20 := NewAsusTrx_Header_Flags()
	err = tmp20.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp20
	for i := 1;; i++ {
		tmp21 := NewAsusTrx_Header_Partition(i)
		err = tmp21.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp21
		this.Partitions = append(this.Partitions, _it)
		tmp22, err := _it.Present()
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
type AsusTrx_Header_Partition struct {
	Offset uint32
	Idx uint8
	_io *kaitai.Stream
	_root *AsusTrx
	_parent *AsusTrx_Header
	_f_present bool
	present bool
	_f_isLast bool
	isLast bool
	_f_size bool
	size int
	_f_partition bool
	partition []byte
}
func NewAsusTrx_Header_Partition(idx uint8) *AsusTrx_Header_Partition {
	return &AsusTrx_Header_Partition{
		Idx: idx,
	}
}

func (this *AsusTrx_Header_Partition) Read(io *kaitai.Stream, parent *AsusTrx_Header, root *AsusTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp23, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp23)
	return err
}
func (this *AsusTrx_Header_Partition) Present() (v bool, err error) {
	if (this._f_present) {
		return this.present, nil
	}
	this.present = bool(this.Offset != 0)
	this._f_present = true
	return this.present, nil
}
func (this *AsusTrx_Header_Partition) IsLast() (v bool, err error) {
	if (this._f_isLast) {
		return this.isLast, nil
	}
	tmp24, err := this.Present()
	if err != nil {
		return false, err
	}
	if (tmp24) {
		tmp25, err := this._parent.Partitions[(this.Idx + 1)].Present()
		if err != nil {
			return false, err
		}
		this.isLast = bool( ((this.Idx == (len(this._parent.Partitions) - 1)) || (!(tmp25))) )
	}
	this._f_isLast = true
	return this.isLast, nil
}
func (this *AsusTrx_Header_Partition) Size() (v int, err error) {
	if (this._f_size) {
		return this.size, nil
	}
	tmp26, err := this.Present()
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
			tmp27 = (tmp29 - this.Offset)
		} else {
			tmp27 = this._parent.Partitions[(this.Idx + 1)].Offset
		}
		this.size = int(tmp27)
	}
	this._f_size = true
	return this.size, nil
}
func (this *AsusTrx_Header_Partition) Partition() (v []byte, err error) {
	if (this._f_partition) {
		return this.partition, nil
	}
	tmp30, err := this.Present()
	if err != nil {
		return nil, err
	}
	if (tmp30) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.Offset), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp31, err := this.Size()
		if err != nil {
			return nil, err
		}
		tmp32, err := thisIo.ReadBytes(int(tmp31))
		if err != nil {
			return nil, err
		}
		tmp32 = tmp32
		this.partition = tmp32
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_partition = true
	}
	this._f_partition = true
	return this.partition, nil
}
type AsusTrx_Header_Flags struct {
	Flags []bool
	_io *kaitai.Stream
	_root *AsusTrx
	_parent *AsusTrx_Header
}
func NewAsusTrx_Header_Flags() *AsusTrx_Header_Flags {
	return &AsusTrx_Header_Flags{
	}
}

func (this *AsusTrx_Header_Flags) Read(io *kaitai.Stream, parent *AsusTrx_Header, root *AsusTrx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Flags = make([]bool, 16)
	for i := range this.Flags {
		tmp33, err := this._io.ReadBitsIntLe(1)
		if err != nil {
			return err
		}
		this.Flags[i] = tmp33 != 0
	}
	return err
}
