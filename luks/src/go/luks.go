// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * Linux Unified Key Setup (LUKS) is a format specification for storing disk
 * encryption parameters and up to 8 user keys (which can unlock the master key).
 * @see <a href="https://gitlab.com/cryptsetup/cryptsetup/wikis/LUKS-standard/on-disk-format.pdf">Source</a>
 */
type Luks struct {
	PartitionHeader *Luks_PartitionHeader
	_io *kaitai.Stream
	_root *Luks
	_parent interface{}
	_f_payload bool
	payload []byte
}
func NewLuks() *Luks {
	return &Luks{
	}
}

func (this *Luks) Read(io *kaitai.Stream, parent interface{}, root *Luks) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewLuks_PartitionHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.PartitionHeader = tmp1
	return err
}
func (this *Luks) Payload() (v []byte, err error) {
	if (this._f_payload) {
		return this.payload, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.PartitionHeader.PayloadOffset * 512)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp2, err := this._io.ReadBytesFull()
	if err != nil {
		return nil, err
	}
	tmp2 = tmp2
	this.payload = tmp2
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_payload = true
	this._f_payload = true
	return this.payload, nil
}
type Luks_PartitionHeader struct {
	Magic []byte
	Version []byte
	CipherNameSpecification string
	CipherModeSpecification string
	HashSpecification string
	PayloadOffset uint32
	NumberOfKeyBytes uint32
	MasterKeyChecksum []byte
	MasterKeySaltParameter []byte
	MasterKeyIterationsParameter uint32
	Uuid string
	KeySlots []*Luks_PartitionHeader_KeySlot
	_io *kaitai.Stream
	_root *Luks
	_parent *Luks
}
func NewLuks_PartitionHeader() *Luks_PartitionHeader {
	return &Luks_PartitionHeader{
	}
}

func (this *Luks_PartitionHeader) Read(io *kaitai.Stream, parent *Luks, root *Luks) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Magic = tmp3
	if !(bytes.Equal(this.Magic, []uint8{76, 85, 75, 83, 186, 190})) {
		return kaitai.NewValidationNotEqualError([]uint8{76, 85, 75, 83, 186, 190}, this.Magic, this._io, "/types/partition_header/seq/0")
	}
	tmp4, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp4 = tmp4
	this.Version = tmp4
	if !(bytes.Equal(this.Version, []uint8{0, 1})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 1}, this.Version, this._io, "/types/partition_header/seq/1")
	}
	tmp5, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.CipherNameSpecification = string(tmp5)
	tmp6, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp6 = tmp6
	this.CipherModeSpecification = string(tmp6)
	tmp7, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.HashSpecification = string(tmp7)
	tmp8, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PayloadOffset = uint32(tmp8)
	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NumberOfKeyBytes = uint32(tmp9)
	tmp10, err := this._io.ReadBytes(int(20))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.MasterKeyChecksum = tmp10
	tmp11, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.MasterKeySaltParameter = tmp11
	tmp12, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.MasterKeyIterationsParameter = uint32(tmp12)
	tmp13, err := this._io.ReadBytes(int(40))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.Uuid = string(tmp13)
	this.KeySlots = make([]*Luks_PartitionHeader_KeySlot, 8)
	for i := range this.KeySlots {
		tmp14 := NewLuks_PartitionHeader_KeySlot()
		err = tmp14.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.KeySlots[i] = tmp14
	}
	return err
}

type Luks_PartitionHeader_KeySlot_KeySlotStates int
const (
	Luks_PartitionHeader_KeySlot_KeySlotStates__DisabledKeySlot Luks_PartitionHeader_KeySlot_KeySlotStates = 57005
	Luks_PartitionHeader_KeySlot_KeySlotStates__EnabledKeySlot Luks_PartitionHeader_KeySlot_KeySlotStates = 11301363
)
type Luks_PartitionHeader_KeySlot struct {
	StateOfKeySlot Luks_PartitionHeader_KeySlot_KeySlotStates
	IterationParameter uint32
	SaltParameter []byte
	StartSectorOfKeyMaterial uint32
	NumberOfAntiForensicStripes uint32
	_io *kaitai.Stream
	_root *Luks
	_parent *Luks_PartitionHeader
	_f_keyMaterial bool
	keyMaterial []byte
}
func NewLuks_PartitionHeader_KeySlot() *Luks_PartitionHeader_KeySlot {
	return &Luks_PartitionHeader_KeySlot{
	}
}

func (this *Luks_PartitionHeader_KeySlot) Read(io *kaitai.Stream, parent *Luks_PartitionHeader, root *Luks) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.StateOfKeySlot = Luks_PartitionHeader_KeySlot_KeySlotStates(tmp15)
	tmp16, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.IterationParameter = uint32(tmp16)
	tmp17, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp17 = tmp17
	this.SaltParameter = tmp17
	tmp18, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.StartSectorOfKeyMaterial = uint32(tmp18)
	tmp19, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NumberOfAntiForensicStripes = uint32(tmp19)
	return err
}
func (this *Luks_PartitionHeader_KeySlot) KeyMaterial() (v []byte, err error) {
	if (this._f_keyMaterial) {
		return this.keyMaterial, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.StartSectorOfKeyMaterial * 512)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp20, err := this._io.ReadBytes(int((this._parent.NumberOfKeyBytes * this.NumberOfAntiForensicStripes)))
	if err != nil {
		return nil, err
	}
	tmp20 = tmp20
	this.keyMaterial = tmp20
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_keyMaterial = true
	this._f_keyMaterial = true
	return this.keyMaterial, nil
}
