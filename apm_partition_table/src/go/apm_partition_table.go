// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * @see "Specification taken from https://en.wikipedia.org/wiki/Apple_Partition_Map"
 */
type ApmPartitionTable struct {
	_io *kaitai.Stream
	_root *ApmPartitionTable
	_parent interface{}
	_raw_partitionLookup []byte
	_raw_partitionEntries [][]byte
	_f_sectorSize bool
	sectorSize int
	_f_partitionLookup bool
	partitionLookup *ApmPartitionTable_PartitionEntry
	_f_partitionEntries bool
	partitionEntries []*ApmPartitionTable_PartitionEntry
}
func NewApmPartitionTable() *ApmPartitionTable {
	return &ApmPartitionTable{
	}
}

func (this *ApmPartitionTable) Read(io *kaitai.Stream, parent interface{}, root *ApmPartitionTable) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}

/**
 * 0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
 * 0x800 (2048) bytes for CDROM
 */
func (this *ApmPartitionTable) SectorSize() (v int, err error) {
	if (this._f_sectorSize) {
		return this.sectorSize, nil
	}
	this.sectorSize = int(512)
	this._f_sectorSize = true
	return this.sectorSize, nil
}

/**
 * Every partition entry contains the number of partition entries.
 * We parse the first entry, to know how many to parse, including the first one.
 * No logic is given what to do if other entries have a different number.
 */
func (this *ApmPartitionTable) PartitionLookup() (v *ApmPartitionTable_PartitionEntry, err error) {
	if (this._f_partitionLookup) {
		return this.partitionLookup, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	tmp1, err := this._root.SectorSize()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(tmp1), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp2, err := this.SectorSize()
	if err != nil {
		return nil, err
	}
	tmp3, err := thisIo.ReadBytes(int(tmp2))
	if err != nil {
		return nil, err
	}
	tmp3 = tmp3
	this._raw_partitionLookup = tmp3
	_io__raw_partitionLookup := kaitai.NewStream(bytes.NewReader(this._raw_partitionLookup))
	tmp4 := NewApmPartitionTable_PartitionEntry()
	err = tmp4.Read(_io__raw_partitionLookup, this, this._root)
	if err != nil {
		return nil, err
	}
	this.partitionLookup = tmp4
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_partitionLookup = true
	this._f_partitionLookup = true
	return this.partitionLookup, nil
}
func (this *ApmPartitionTable) PartitionEntries() (v []*ApmPartitionTable_PartitionEntry, err error) {
	if (this._f_partitionEntries) {
		return this.partitionEntries, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	tmp5, err := this._root.SectorSize()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(tmp5), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp6, err := this._root.PartitionLookup()
	if err != nil {
		return nil, err
	}
	this._raw_partitionEntries = make([][]byte, tmp6.NumberOfPartitions)
	tmp7, err := this._root.PartitionLookup()
	if err != nil {
		return nil, err
	}
	this.partitionEntries = make([]*ApmPartitionTable_PartitionEntry, tmp7.NumberOfPartitions)
	for i := range this.partitionEntries {
		tmp8, err := this.SectorSize()
		if err != nil {
			return nil, err
		}
		tmp9, err := thisIo.ReadBytes(int(tmp8))
		if err != nil {
			return nil, err
		}
		tmp9 = tmp9
		this._raw_partitionEntries[i] = tmp9
		_io__raw_partitionEntries := kaitai.NewStream(bytes.NewReader(this._raw_partitionEntries[i]))
		tmp10 := NewApmPartitionTable_PartitionEntry()
		err = tmp10.Read(_io__raw_partitionEntries, this, this._root)
		if err != nil {
			return nil, err
		}
		this.partitionEntries[i] = tmp10
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_partitionEntries = true
	this._f_partitionEntries = true
	return this.partitionEntries, nil
}
type ApmPartitionTable_PartitionEntry struct {
	Magic []byte
	Reserved1 []byte
	NumberOfPartitions uint32
	PartitionStart uint32
	PartitionSize uint32
	PartitionName string
	PartitionType string
	DataStart uint32
	DataSize uint32
	PartitionStatus uint32
	BootCodeStart uint32
	BootCodeSize uint32
	BootLoaderAddress uint32
	Reserved2 []byte
	BootCodeEntry uint32
	Reserved3 []byte
	BootCodeCksum uint32
	ProcessorType string
	_io *kaitai.Stream
	_root *ApmPartitionTable
	_parent *ApmPartitionTable
	_f_partition bool
	partition []byte
	_f_data bool
	data []byte
	_f_bootCode bool
	bootCode []byte
}
func NewApmPartitionTable_PartitionEntry() *ApmPartitionTable_PartitionEntry {
	return &ApmPartitionTable_PartitionEntry{
	}
}

func (this *ApmPartitionTable_PartitionEntry) Read(io *kaitai.Stream, parent *ApmPartitionTable, root *ApmPartitionTable) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Magic = tmp11
	if !(bytes.Equal(this.Magic, []uint8{80, 77})) {
		return kaitai.NewValidationNotEqualError([]uint8{80, 77}, this.Magic, this._io, "/types/partition_entry/seq/0")
	}
	tmp12, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.Reserved1 = tmp12
	tmp13, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NumberOfPartitions = uint32(tmp13)
	tmp14, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PartitionStart = uint32(tmp14)
	tmp15, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PartitionSize = uint32(tmp15)
	tmp16, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp16 = kaitai.BytesTerminate(tmp16, 0, false)
	this.PartitionName = string(tmp16)
	tmp17, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp17 = kaitai.BytesTerminate(tmp17, 0, false)
	this.PartitionType = string(tmp17)
	tmp18, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.DataStart = uint32(tmp18)
	tmp19, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.DataSize = uint32(tmp19)
	tmp20, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PartitionStatus = uint32(tmp20)
	tmp21, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BootCodeStart = uint32(tmp21)
	tmp22, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BootCodeSize = uint32(tmp22)
	tmp23, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BootLoaderAddress = uint32(tmp23)
	tmp24, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp24 = tmp24
	this.Reserved2 = tmp24
	tmp25, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BootCodeEntry = uint32(tmp25)
	tmp26, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp26 = tmp26
	this.Reserved3 = tmp26
	tmp27, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.BootCodeCksum = uint32(tmp27)
	tmp28, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp28 = kaitai.BytesTerminate(tmp28, 0, false)
	this.ProcessorType = string(tmp28)
	return err
}
func (this *ApmPartitionTable_PartitionEntry) Partition() (v []byte, err error) {
	if (this._f_partition) {
		return this.partition, nil
	}
	if ((this.PartitionStatus & 1) != 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		tmp29, err := this._root.SectorSize()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64((this.PartitionStart * tmp29)), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp30, err := this._root.SectorSize()
		if err != nil {
			return nil, err
		}
		tmp31, err := thisIo.ReadBytes(int((this.PartitionSize * tmp30)))
		if err != nil {
			return nil, err
		}
		tmp31 = tmp31
		this.partition = tmp31
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_partition = true
	}
	this._f_partition = true
	return this.partition, nil
}
func (this *ApmPartitionTable_PartitionEntry) Data() (v []byte, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	tmp32, err := this._root.SectorSize()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64((this.DataStart * tmp32)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp33, err := this._root.SectorSize()
	if err != nil {
		return nil, err
	}
	tmp34, err := thisIo.ReadBytes(int((this.DataSize * tmp33)))
	if err != nil {
		return nil, err
	}
	tmp34 = tmp34
	this.data = tmp34
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_data = true
	this._f_data = true
	return this.data, nil
}
func (this *ApmPartitionTable_PartitionEntry) BootCode() (v []byte, err error) {
	if (this._f_bootCode) {
		return this.bootCode, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	tmp35, err := this._root.SectorSize()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64((this.BootCodeStart * tmp35)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp36, err := thisIo.ReadBytes(int(this.BootCodeSize))
	if err != nil {
		return nil, err
	}
	tmp36 = tmp36
	this.bootCode = tmp36
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_bootCode = true
	this._f_bootCode = true
	return this.bootCode, nil
}

/**
 * First sector
 */

/**
 * Number of sectors
 */

/**
 * First sector
 */

/**
 * Number of sectors
 */

/**
 * First sector
 */

/**
 * Number of bytes
 */

/**
 * Address of bootloader code
 */

/**
 * Boot code entry point
 */

/**
 * Boot code checksum
 */
