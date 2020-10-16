// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * MBR (Master Boot Record) partition table is a traditional way of
 * MS-DOS to partition larger hard disc drives into distinct
 * partitions.
 * 
 * This table is stored in the end of the boot sector (first sector) of
 * the drive, after the bootstrap code. Original DOS 2.0 specification
 * allowed only 4 partitions per disc, but DOS 3.2 introduced concept
 * of "extended partitions", which work as nested extra "boot records"
 * which are pointed to by original ("primary") partitions in MBR.
 */
type MbrPartitionTable struct {
	BootstrapCode []byte
	Partitions []*MbrPartitionTable_PartitionEntry
	BootSignature []byte
	_io *kaitai.Stream
	_root *MbrPartitionTable
	_parent interface{}
}
func NewMbrPartitionTable() *MbrPartitionTable {
	return &MbrPartitionTable{
	}
}

func (this *MbrPartitionTable) Read(io *kaitai.Stream, parent interface{}, root *MbrPartitionTable) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(446))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.BootstrapCode = tmp1
	this.Partitions = make([]*MbrPartitionTable_PartitionEntry, 4)
	for i := range this.Partitions {
		tmp2 := NewMbrPartitionTable_PartitionEntry()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Partitions[i] = tmp2
	}
	tmp3, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.BootSignature = tmp3
	if !(bytes.Equal(this.BootSignature, []uint8{85, 170})) {
		return kaitai.NewValidationNotEqualError([]uint8{85, 170}, this.BootSignature, this._io, "/seq/2")
	}
	return err
}
type MbrPartitionTable_PartitionEntry struct {
	Status uint8
	ChsStart *MbrPartitionTable_Chs
	PartitionType uint8
	ChsEnd *MbrPartitionTable_Chs
	LbaStart uint32
	NumSectors uint32
	_io *kaitai.Stream
	_root *MbrPartitionTable
	_parent *MbrPartitionTable
}
func NewMbrPartitionTable_PartitionEntry() *MbrPartitionTable_PartitionEntry {
	return &MbrPartitionTable_PartitionEntry{
	}
}

func (this *MbrPartitionTable_PartitionEntry) Read(io *kaitai.Stream, parent *MbrPartitionTable, root *MbrPartitionTable) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Status = tmp4
	tmp5 := NewMbrPartitionTable_Chs()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ChsStart = tmp5
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PartitionType = tmp6
	tmp7 := NewMbrPartitionTable_Chs()
	err = tmp7.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ChsEnd = tmp7
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LbaStart = uint32(tmp8)
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumSectors = uint32(tmp9)
	return err
}
type MbrPartitionTable_Chs struct {
	Head uint8
	B2 uint8
	B3 uint8
	_io *kaitai.Stream
	_root *MbrPartitionTable
	_parent *MbrPartitionTable_PartitionEntry
	_f_sector bool
	sector int
	_f_cylinder bool
	cylinder int
}
func NewMbrPartitionTable_Chs() *MbrPartitionTable_Chs {
	return &MbrPartitionTable_Chs{
	}
}

func (this *MbrPartitionTable_Chs) Read(io *kaitai.Stream, parent *MbrPartitionTable_PartitionEntry, root *MbrPartitionTable) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Head = tmp10
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B2 = tmp11
	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B3 = tmp12
	return err
}
func (this *MbrPartitionTable_Chs) Sector() (v int, err error) {
	if (this._f_sector) {
		return this.sector, nil
	}
	this.sector = int((this.B2 & 63))
	this._f_sector = true
	return this.sector, nil
}
func (this *MbrPartitionTable_Chs) Cylinder() (v int, err error) {
	if (this._f_cylinder) {
		return this.cylinder, nil
	}
	this.cylinder = int((this.B3 + ((this.B2 & 192) << 2)))
	this._f_cylinder = true
	return this.cylinder, nil
}
