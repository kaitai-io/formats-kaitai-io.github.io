// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * You can get a dump for testing by the link: https://github.com/zhovner/mfdread/raw/master/dump.mfd
 * @see <a href="https://github.com/nfc-tools/libnfc
 * https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
 * ">Source</a>
 */
type MifareClassic struct {
	Sectors []*MifareClassic_Sector
	_io *kaitai.Stream
	_root *MifareClassic
	_parent interface{}
	_raw_Sectors [][]byte
}
func NewMifareClassic() *MifareClassic {
	return &MifareClassic{
	}
}

func (this *MifareClassic) Read(io *kaitai.Stream, parent interface{}, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this._raw_Sectors = make([][]byte, 0);
	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		var tmp2 int8;
		if (i >= 32) {
			tmp2 = 4
		} else {
			tmp2 = 1
		}
		tmp3, err := this._io.ReadBytes(int(((tmp2 * 4) * 16)))
		if err != nil {
			return err
		}
		tmp3 = tmp3
		this._raw_Sectors = append(this._raw_Sectors, tmp3)
		_io__raw_Sectors := kaitai.NewStream(bytes.NewReader(this._raw_Sectors[len(this._raw_Sectors) - 1]))
		tmp4 := NewMifareClassic_Sector(i == 0)
		err = tmp4.Read(_io__raw_Sectors, this, this._root)
		if err != nil {
			return err
		}
		this.Sectors = append(this.Sectors, tmp4)
	}
	return err
}
type MifareClassic_Key struct {
	Key []byte
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Trailer
}
func NewMifareClassic_Key() *MifareClassic_Key {
	return &MifareClassic_Key{
	}
}

func (this *MifareClassic_Key) Read(io *kaitai.Stream, parent *MifareClassic_Trailer, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Key = tmp5
	return err
}
type MifareClassic_Sector struct {
	Manufacturer *MifareClassic_Manufacturer
	DataFiller *MifareClassic_Sector_Filler
	Trailer *MifareClassic_Trailer
	HasManufacturer bool
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic
	_raw_DataFiller []byte
	_f_blockSize bool
	blockSize int8
	_f_data bool
	data []byte
	_f_blocks bool
	blocks [][]byte
	_f_values bool
	values *MifareClassic_Sector_Values
}
func NewMifareClassic_Sector(hasManufacturer bool) *MifareClassic_Sector {
	return &MifareClassic_Sector{
		HasManufacturer: hasManufacturer,
	}
}

func (this *MifareClassic_Sector) Read(io *kaitai.Stream, parent *MifareClassic, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	if (this.HasManufacturer) {
		tmp6 := NewMifareClassic_Manufacturer()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Manufacturer = tmp6
	}
	tmp7, err := this._io.Size()
	if err != nil {
		return err
	}
	tmp8, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp9, err := this._io.ReadBytes(int(((tmp7 - tmp8) - 16)))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this._raw_DataFiller = tmp9
	_io__raw_DataFiller := kaitai.NewStream(bytes.NewReader(this._raw_DataFiller))
	tmp10 := NewMifareClassic_Sector_Filler()
	err = tmp10.Read(_io__raw_DataFiller, this, this._root)
	if err != nil {
		return err
	}
	this.DataFiller = tmp10
	tmp11 := NewMifareClassic_Trailer()
	err = tmp11.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Trailer = tmp11
	return err
}
func (this *MifareClassic_Sector) BlockSize() (v int8, err error) {
	if (this._f_blockSize) {
		return this.blockSize, nil
	}
	this.blockSize = int8(16)
	this._f_blockSize = true
	return this.blockSize, nil
}
func (this *MifareClassic_Sector) Data() (v []byte, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	this.data = []byte(this.DataFiller.Data)
	this._f_data = true
	return this.data, nil
}
func (this *MifareClassic_Sector) Blocks() (v [][]byte, err error) {
	if (this._f_blocks) {
		return this.blocks, nil
	}
	thisIo := this.DataFiller._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	for i := 1;; i++ {
		tmp12, err := this._io.EOF()
		if err != nil {
			return nil, err
		}
		if tmp12 {
			break
		}
		tmp13, err := this.BlockSize()
		if err != nil {
			return nil, err
		}
		tmp14, err := thisIo.ReadBytes(int(tmp13))
		if err != nil {
			return nil, err
		}
		tmp14 = tmp14
		this.blocks = append(this.blocks, tmp14)
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_blocks = true
	this._f_blocks = true
	return this.blocks, nil
}
func (this *MifareClassic_Sector) Values() (v *MifareClassic_Sector_Values, err error) {
	if (this._f_values) {
		return this.values, nil
	}
	thisIo := this.DataFiller._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp15 := NewMifareClassic_Sector_Values()
	err = tmp15.Read(thisIo, this, this._root)
	if err != nil {
		return nil, err
	}
	this.values = tmp15
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_values = true
	this._f_values = true
	return this.values, nil
}
type MifareClassic_Sector_Values struct {
	Values []*MifareClassic_Sector_Values_ValueBlock
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Sector
}
func NewMifareClassic_Sector_Values() *MifareClassic_Sector_Values {
	return &MifareClassic_Sector_Values{
	}
}

func (this *MifareClassic_Sector_Values) Read(io *kaitai.Stream, parent *MifareClassic_Sector, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp16, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp16 {
			break
		}
		tmp17 := NewMifareClassic_Sector_Values_ValueBlock()
		err = tmp17.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Values = append(this.Values, tmp17)
	}
	return err
}
type MifareClassic_Sector_Values_ValueBlock struct {
	Valuez []uint32
	Addrz []uint8
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Sector_Values
	_f_addr bool
	addr uint8
	_f_addrValid bool
	addrValid bool
	_f_valid bool
	valid bool
	_f_valueValid bool
	valueValid bool
	_f_value bool
	value uint32
}
func NewMifareClassic_Sector_Values_ValueBlock() *MifareClassic_Sector_Values_ValueBlock {
	return &MifareClassic_Sector_Values_ValueBlock{
	}
}

func (this *MifareClassic_Sector_Values_ValueBlock) Read(io *kaitai.Stream, parent *MifareClassic_Sector_Values, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Valuez = make([]uint32, 3)
	for i := range this.Valuez {
		tmp18, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Valuez[i] = tmp18
	}
	this.Addrz = make([]uint8, 4)
	for i := range this.Addrz {
		tmp19, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.Addrz[i] = tmp19
	}
	return err
}
func (this *MifareClassic_Sector_Values_ValueBlock) Addr() (v uint8, err error) {
	if (this._f_addr) {
		return this.addr, nil
	}
	tmp20, err := this.Valid()
	if err != nil {
		return 0, err
	}
	if (tmp20) {
		this.addr = uint8(this.Addrz[0])
	}
	this._f_addr = true
	return this.addr, nil
}
func (this *MifareClassic_Sector_Values_ValueBlock) AddrValid() (v bool, err error) {
	if (this._f_addrValid) {
		return this.addrValid, nil
	}
	this.addrValid = bool( ((this.Addrz[0] == ^(this.Addrz[1])) && (this.Addrz[0] == this.Addrz[2]) && (this.Addrz[1] == this.Addrz[3])) )
	this._f_addrValid = true
	return this.addrValid, nil
}
func (this *MifareClassic_Sector_Values_ValueBlock) Valid() (v bool, err error) {
	if (this._f_valid) {
		return this.valid, nil
	}
	tmp21, err := this.ValueValid()
	if err != nil {
		return false, err
	}
	tmp22, err := this.AddrValid()
	if err != nil {
		return false, err
	}
	this.valid = bool( ((tmp21) && (tmp22)) )
	this._f_valid = true
	return this.valid, nil
}
func (this *MifareClassic_Sector_Values_ValueBlock) ValueValid() (v bool, err error) {
	if (this._f_valueValid) {
		return this.valueValid, nil
	}
	this.valueValid = bool( ((this.Valuez[0] == ^(this.Valuez[1])) && (this.Valuez[0] == this.Valuez[2])) )
	this._f_valueValid = true
	return this.valueValid, nil
}
func (this *MifareClassic_Sector_Values_ValueBlock) Value() (v uint32, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	tmp23, err := this.Valid()
	if err != nil {
		return 0, err
	}
	if (tmp23) {
		this.value = uint32(this.Valuez[0])
	}
	this._f_value = true
	return this.value, nil
}

/**
 * only to create _io
 */
type MifareClassic_Sector_Filler struct {
	Data []byte
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Sector
}
func NewMifareClassic_Sector_Filler() *MifareClassic_Sector_Filler {
	return &MifareClassic_Sector_Filler{
	}
}

func (this *MifareClassic_Sector_Filler) Read(io *kaitai.Stream, parent *MifareClassic_Sector, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp24, err := this._io.Size()
	if err != nil {
		return err
	}
	tmp25, err := this._io.ReadBytes(int(tmp24))
	if err != nil {
		return err
	}
	tmp25 = tmp25
	this.Data = tmp25
	return err
}
type MifareClassic_Manufacturer struct {
	Nuid uint32
	Bcc uint8
	Sak uint8
	Atqa uint16
	Manufacturer []byte
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Sector
}
func NewMifareClassic_Manufacturer() *MifareClassic_Manufacturer {
	return &MifareClassic_Manufacturer{
	}
}

func (this *MifareClassic_Manufacturer) Read(io *kaitai.Stream, parent *MifareClassic_Sector, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Nuid = uint32(tmp26)
	tmp27, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Bcc = tmp27
	tmp28, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Sak = tmp28
	tmp29, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Atqa = uint16(tmp29)
	tmp30, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp30 = tmp30
	this.Manufacturer = tmp30
	return err
}

/**
 * beware for 7bytes UID it goes over next fields
 */

/**
 * may contain manufacture date as BCD
 */
type MifareClassic_Trailer struct {
	KeyA *MifareClassic_Key
	AccessBits *MifareClassic_Trailer_AccessConditions
	UserByte uint8
	KeyB *MifareClassic_Key
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Sector
	_raw_AccessBits []byte
	_f_acBits bool
	acBits int8
	_f_acsInSector bool
	acsInSector int8
	_f_acCountOfChunks bool
	acCountOfChunks int
}
func NewMifareClassic_Trailer() *MifareClassic_Trailer {
	return &MifareClassic_Trailer{
	}
}

func (this *MifareClassic_Trailer) Read(io *kaitai.Stream, parent *MifareClassic_Sector, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp31 := NewMifareClassic_Key()
	err = tmp31.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.KeyA = tmp31
	tmp32, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp32 = tmp32
	this._raw_AccessBits = tmp32
	_io__raw_AccessBits := kaitai.NewStream(bytes.NewReader(this._raw_AccessBits))
	tmp33 := NewMifareClassic_Trailer_AccessConditions()
	err = tmp33.Read(_io__raw_AccessBits, this, this._root)
	if err != nil {
		return err
	}
	this.AccessBits = tmp33
	tmp34, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.UserByte = tmp34
	tmp35 := NewMifareClassic_Key()
	err = tmp35.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.KeyB = tmp35
	return err
}
func (this *MifareClassic_Trailer) AcBits() (v int8, err error) {
	if (this._f_acBits) {
		return this.acBits, nil
	}
	this.acBits = int8(3)
	this._f_acBits = true
	return this.acBits, nil
}
func (this *MifareClassic_Trailer) AcsInSector() (v int8, err error) {
	if (this._f_acsInSector) {
		return this.acsInSector, nil
	}
	this.acsInSector = int8(4)
	this._f_acsInSector = true
	return this.acsInSector, nil
}
func (this *MifareClassic_Trailer) AcCountOfChunks() (v int, err error) {
	if (this._f_acCountOfChunks) {
		return this.acCountOfChunks, nil
	}
	tmp36, err := this.AcBits()
	if err != nil {
		return 0, err
	}
	this.acCountOfChunks = int((tmp36 * 2))
	this._f_acCountOfChunks = true
	return this.acCountOfChunks, nil
}
type MifareClassic_Trailer_AccessConditions struct {
	RawChunks []uint64
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Trailer
	_f_dataAcs bool
	dataAcs []*MifareClassic_Trailer_AccessConditions_DataAc
	_f_remaps bool
	remaps []*MifareClassic_Trailer_AccessConditions_ChunkBitRemap
	_f_acsRaw bool
	acsRaw []*MifareClassic_Trailer_AccessConditions_Ac
	_f_trailerAc bool
	trailerAc *MifareClassic_Trailer_AccessConditions_TrailerAc
	_f_chunks bool
	chunks []*MifareClassic_Trailer_AccessConditions_ValidChunk
}
func NewMifareClassic_Trailer_AccessConditions() *MifareClassic_Trailer_AccessConditions {
	return &MifareClassic_Trailer_AccessConditions{
	}
}

func (this *MifareClassic_Trailer_AccessConditions) Read(io *kaitai.Stream, parent *MifareClassic_Trailer, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37, err := this._parent.AcCountOfChunks()
	if err != nil {
		return err
	}
	this.RawChunks = make([]uint64, tmp37)
	for i := range this.RawChunks {
		tmp38, err := this._io.ReadBitsIntBe(4)
		if err != nil {
			return err
		}
		this.RawChunks[i] = tmp38
	}
	return err
}
func (this *MifareClassic_Trailer_AccessConditions) DataAcs() (v []*MifareClassic_Trailer_AccessConditions_DataAc, err error) {
	if (this._f_dataAcs) {
		return this.dataAcs, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp39, err := this._parent.AcsInSector()
	if err != nil {
		return nil, err
	}
	this.dataAcs = make([]*MifareClassic_Trailer_AccessConditions_DataAc, (tmp39 - 1))
	for i := range this.dataAcs {
		tmp41, err := this.AcsRaw()
		if err != nil {
			return nil, err
		}
		tmp40 := NewMifareClassic_Trailer_AccessConditions_DataAc(tmp41[i])
		err = tmp40.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.dataAcs[i] = tmp40
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_dataAcs = true
	this._f_dataAcs = true
	return this.dataAcs, nil
}
func (this *MifareClassic_Trailer_AccessConditions) Remaps() (v []*MifareClassic_Trailer_AccessConditions_ChunkBitRemap, err error) {
	if (this._f_remaps) {
		return this.remaps, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp42, err := this._parent.AcBits()
	if err != nil {
		return nil, err
	}
	this.remaps = make([]*MifareClassic_Trailer_AccessConditions_ChunkBitRemap, tmp42)
	for i := range this.remaps {
		tmp43 := NewMifareClassic_Trailer_AccessConditions_ChunkBitRemap(i)
		err = tmp43.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.remaps[i] = tmp43
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_remaps = true
	this._f_remaps = true
	return this.remaps, nil
}
func (this *MifareClassic_Trailer_AccessConditions) AcsRaw() (v []*MifareClassic_Trailer_AccessConditions_Ac, err error) {
	if (this._f_acsRaw) {
		return this.acsRaw, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp44, err := this._parent.AcsInSector()
	if err != nil {
		return nil, err
	}
	this.acsRaw = make([]*MifareClassic_Trailer_AccessConditions_Ac, tmp44)
	for i := range this.acsRaw {
		tmp45 := NewMifareClassic_Trailer_AccessConditions_Ac(i)
		err = tmp45.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.acsRaw[i] = tmp45
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_acsRaw = true
	this._f_acsRaw = true
	return this.acsRaw, nil
}
func (this *MifareClassic_Trailer_AccessConditions) TrailerAc() (v *MifareClassic_Trailer_AccessConditions_TrailerAc, err error) {
	if (this._f_trailerAc) {
		return this.trailerAc, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp47, err := this.AcsRaw()
	if err != nil {
		return nil, err
	}
	tmp48, err := this._parent.AcsInSector()
	if err != nil {
		return nil, err
	}
	tmp46 := NewMifareClassic_Trailer_AccessConditions_TrailerAc(tmp47[(tmp48 - 1)])
	err = tmp46.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.trailerAc = tmp46
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_trailerAc = true
	this._f_trailerAc = true
	return this.trailerAc, nil
}
func (this *MifareClassic_Trailer_AccessConditions) Chunks() (v []*MifareClassic_Trailer_AccessConditions_ValidChunk, err error) {
	if (this._f_chunks) {
		return this.chunks, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp49, err := this._parent.AcBits()
	if err != nil {
		return nil, err
	}
	this.chunks = make([]*MifareClassic_Trailer_AccessConditions_ValidChunk, tmp49)
	for i := range this.chunks {
		tmp51, err := this.Remaps()
		if err != nil {
			return nil, err
		}
		tmp52, err := tmp51[i].InvChunkNo()
		if err != nil {
			return nil, err
		}
		tmp53, err := this.Remaps()
		if err != nil {
			return nil, err
		}
		tmp54, err := tmp53[i].ChunkNo()
		if err != nil {
			return nil, err
		}
		tmp50 := NewMifareClassic_Trailer_AccessConditions_ValidChunk(this.RawChunks[tmp52], this.RawChunks[tmp54])
		err = tmp50.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunks[i] = tmp50
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_chunks = true
	this._f_chunks = true
	return this.chunks, nil
}
type MifareClassic_Trailer_AccessConditions_TrailerAc struct {
	Ac *MifareClassic_Trailer_AccessConditions_Ac
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Trailer_AccessConditions
	_f_canReadKeyB bool
	canReadKeyB bool
	_f_canWriteKeys bool
	canWriteKeys bool
	_f_canWriteAccessBits bool
	canWriteAccessBits bool
	_f_keyBControlsWrite bool
	keyBControlsWrite bool
}
func NewMifareClassic_Trailer_AccessConditions_TrailerAc(ac *MifareClassic_Trailer_AccessConditions_Ac) *MifareClassic_Trailer_AccessConditions_TrailerAc {
	return &MifareClassic_Trailer_AccessConditions_TrailerAc{
		Ac: ac,
	}
}

func (this *MifareClassic_Trailer_AccessConditions_TrailerAc) Read(io *kaitai.Stream, parent *MifareClassic_Trailer_AccessConditions, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}

/**
 * key A is required
 */
func (this *MifareClassic_Trailer_AccessConditions_TrailerAc) CanReadKeyB() (v bool, err error) {
	if (this._f_canReadKeyB) {
		return this.canReadKeyB, nil
	}
	tmp55, err := this.Ac.InvShiftVal()
	if err != nil {
		return false, err
	}
	this.canReadKeyB = bool(tmp55 <= 2)
	this._f_canReadKeyB = true
	return this.canReadKeyB, nil
}
func (this *MifareClassic_Trailer_AccessConditions_TrailerAc) CanWriteKeys() (v bool, err error) {
	if (this._f_canWriteKeys) {
		return this.canWriteKeys, nil
	}
	tmp57, err := this.Ac.InvShiftVal()
	if err != nil {
		return false, err
	}
	tmp56 := (tmp57 + 1) % 3
	if tmp56 < 0 {
		tmp56 += 3
	}
	tmp58, err := this.Ac.InvShiftVal()
	if err != nil {
		return false, err
	}
	this.canWriteKeys = bool( ((tmp56 != 0) && (tmp58 < 6)) )
	this._f_canWriteKeys = true
	return this.canWriteKeys, nil
}
func (this *MifareClassic_Trailer_AccessConditions_TrailerAc) CanWriteAccessBits() (v bool, err error) {
	if (this._f_canWriteAccessBits) {
		return this.canWriteAccessBits, nil
	}
	tmp59, err := this.Ac.Bits()
	if err != nil {
		return false, err
	}
	tmp60, err := tmp59[2].B()
	if err != nil {
		return false, err
	}
	this.canWriteAccessBits = bool(tmp60)
	this._f_canWriteAccessBits = true
	return this.canWriteAccessBits, nil
}
func (this *MifareClassic_Trailer_AccessConditions_TrailerAc) KeyBControlsWrite() (v bool, err error) {
	if (this._f_keyBControlsWrite) {
		return this.keyBControlsWrite, nil
	}
	tmp61, err := this.CanReadKeyB()
	if err != nil {
		return false, err
	}
	this.keyBControlsWrite = bool(!(tmp61))
	this._f_keyBControlsWrite = true
	return this.keyBControlsWrite, nil
}
type MifareClassic_Trailer_AccessConditions_ChunkBitRemap struct {
	BitNo uint8
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Trailer_AccessConditions
	_f_shiftValue bool
	shiftValue int
	_f_chunkNo bool
	chunkNo int
	_f_invChunkNo bool
	invChunkNo int
}
func NewMifareClassic_Trailer_AccessConditions_ChunkBitRemap(bitNo uint8) *MifareClassic_Trailer_AccessConditions_ChunkBitRemap {
	return &MifareClassic_Trailer_AccessConditions_ChunkBitRemap{
		BitNo: bitNo,
	}
}

func (this *MifareClassic_Trailer_AccessConditions_ChunkBitRemap) Read(io *kaitai.Stream, parent *MifareClassic_Trailer_AccessConditions, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *MifareClassic_Trailer_AccessConditions_ChunkBitRemap) ShiftValue() (v int, err error) {
	if (this._f_shiftValue) {
		return this.shiftValue, nil
	}
	var tmp62 int;
	if (this.BitNo == 1) {
		tmp62 = -1
	} else {
		tmp62 = 1
	}
	this.shiftValue = int(tmp62)
	this._f_shiftValue = true
	return this.shiftValue, nil
}
func (this *MifareClassic_Trailer_AccessConditions_ChunkBitRemap) ChunkNo() (v int, err error) {
	if (this._f_chunkNo) {
		return this.chunkNo, nil
	}
	tmp64, err := this.InvChunkNo()
	if err != nil {
		return 0, err
	}
	tmp65, err := this.ShiftValue()
	if err != nil {
		return 0, err
	}
	tmp66, err := this._parent._parent.AcCountOfChunks()
	if err != nil {
		return 0, err
	}
	tmp67, err := this._parent._parent.AcCountOfChunks()
	if err != nil {
		return 0, err
	}
	tmp63 := ((tmp64 + tmp65) + tmp66) % tmp67
	if tmp63 < 0 {
		tmp68, err := this._parent._parent.AcCountOfChunks()
		if err != nil {
			return 0, err
		}
		tmp63 += tmp68
	}
	this.chunkNo = int(tmp63)
	this._f_chunkNo = true
	return this.chunkNo, nil
}
func (this *MifareClassic_Trailer_AccessConditions_ChunkBitRemap) InvChunkNo() (v int, err error) {
	if (this._f_invChunkNo) {
		return this.invChunkNo, nil
	}
	tmp69, err := this.ShiftValue()
	if err != nil {
		return 0, err
	}
	this.invChunkNo = int((this.BitNo + tmp69))
	this._f_invChunkNo = true
	return this.invChunkNo, nil
}
type MifareClassic_Trailer_AccessConditions_DataAc struct {
	Ac *MifareClassic_Trailer_AccessConditions_Ac
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Trailer_AccessConditions
	_f_readKeyARequired bool
	readKeyARequired bool
	_f_writeKeyBRequired bool
	writeKeyBRequired bool
	_f_writeKeyARequired bool
	writeKeyARequired bool
	_f_readKeyBRequired bool
	readKeyBRequired bool
	_f_decrementAvailable bool
	decrementAvailable bool
	_f_incrementAvailable bool
	incrementAvailable bool
}
func NewMifareClassic_Trailer_AccessConditions_DataAc(ac *MifareClassic_Trailer_AccessConditions_Ac) *MifareClassic_Trailer_AccessConditions_DataAc {
	return &MifareClassic_Trailer_AccessConditions_DataAc{
		Ac: ac,
	}
}

func (this *MifareClassic_Trailer_AccessConditions_DataAc) Read(io *kaitai.Stream, parent *MifareClassic_Trailer_AccessConditions, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *MifareClassic_Trailer_AccessConditions_DataAc) ReadKeyARequired() (v bool, err error) {
	if (this._f_readKeyARequired) {
		return this.readKeyARequired, nil
	}
	tmp70, err := this.Ac.Val()
	if err != nil {
		return false, err
	}
	this.readKeyARequired = bool(tmp70 <= 4)
	this._f_readKeyARequired = true
	return this.readKeyARequired, nil
}
func (this *MifareClassic_Trailer_AccessConditions_DataAc) WriteKeyBRequired() (v bool, err error) {
	if (this._f_writeKeyBRequired) {
		return this.writeKeyBRequired, nil
	}
	tmp71, err := this.ReadKeyARequired()
	if err != nil {
		return false, err
	}
	tmp72, err := this.ReadKeyBRequired()
	if err != nil {
		return false, err
	}
	tmp73, err := this.Ac.Bits()
	if err != nil {
		return false, err
	}
	tmp74, err := tmp73[0].B()
	if err != nil {
		return false, err
	}
	this.writeKeyBRequired = bool( (( ((!(tmp71)) || (tmp72)) ) && (!(tmp74))) )
	this._f_writeKeyBRequired = true
	return this.writeKeyBRequired, nil
}
func (this *MifareClassic_Trailer_AccessConditions_DataAc) WriteKeyARequired() (v bool, err error) {
	if (this._f_writeKeyARequired) {
		return this.writeKeyARequired, nil
	}
	tmp75, err := this.Ac.Val()
	if err != nil {
		return false, err
	}
	this.writeKeyARequired = bool(tmp75 == 0)
	this._f_writeKeyARequired = true
	return this.writeKeyARequired, nil
}
func (this *MifareClassic_Trailer_AccessConditions_DataAc) ReadKeyBRequired() (v bool, err error) {
	if (this._f_readKeyBRequired) {
		return this.readKeyBRequired, nil
	}
	tmp76, err := this.Ac.Val()
	if err != nil {
		return false, err
	}
	this.readKeyBRequired = bool(tmp76 <= 6)
	this._f_readKeyBRequired = true
	return this.readKeyBRequired, nil
}
func (this *MifareClassic_Trailer_AccessConditions_DataAc) DecrementAvailable() (v bool, err error) {
	if (this._f_decrementAvailable) {
		return this.decrementAvailable, nil
	}
	tmp77, err := this.Ac.Bits()
	if err != nil {
		return false, err
	}
	tmp78, err := tmp77[1].B()
	if err != nil {
		return false, err
	}
	tmp79, err := this.Ac.Bits()
	if err != nil {
		return false, err
	}
	tmp80, err := tmp79[0].B()
	if err != nil {
		return false, err
	}
	tmp81, err := this.Ac.Bits()
	if err != nil {
		return false, err
	}
	tmp82, err := tmp81[2].B()
	if err != nil {
		return false, err
	}
	this.decrementAvailable = bool( (( ((tmp78) || (!(tmp80))) ) && (!(tmp82))) )
	this._f_decrementAvailable = true
	return this.decrementAvailable, nil
}
func (this *MifareClassic_Trailer_AccessConditions_DataAc) IncrementAvailable() (v bool, err error) {
	if (this._f_incrementAvailable) {
		return this.incrementAvailable, nil
	}
	tmp83, err := this.Ac.Bits()
	if err != nil {
		return false, err
	}
	tmp84, err := tmp83[0].B()
	if err != nil {
		return false, err
	}
	tmp85, err := this.ReadKeyARequired()
	if err != nil {
		return false, err
	}
	tmp86, err := this.ReadKeyBRequired()
	if err != nil {
		return false, err
	}
	tmp87, err := this.Ac.Bits()
	if err != nil {
		return false, err
	}
	tmp88, err := tmp87[0].B()
	if err != nil {
		return false, err
	}
	tmp89, err := this.ReadKeyARequired()
	if err != nil {
		return false, err
	}
	tmp90, err := this.ReadKeyBRequired()
	if err != nil {
		return false, err
	}
	this.incrementAvailable = bool( (( ((!(tmp84)) && (!(tmp85)) && (!(tmp86))) ) || ( ((!(tmp88)) && (tmp89) && (tmp90)) )) )
	this._f_incrementAvailable = true
	return this.incrementAvailable, nil
}
type MifareClassic_Trailer_AccessConditions_Ac struct {
	Index uint8
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Trailer_AccessConditions
	_f_bits bool
	bits []*MifareClassic_Trailer_AccessConditions_Ac_AcBit
	_f_val bool
	val int
	_f_invShiftVal bool
	invShiftVal int
}
func NewMifareClassic_Trailer_AccessConditions_Ac(index uint8) *MifareClassic_Trailer_AccessConditions_Ac {
	return &MifareClassic_Trailer_AccessConditions_Ac{
		Index: index,
	}
}

func (this *MifareClassic_Trailer_AccessConditions_Ac) Read(io *kaitai.Stream, parent *MifareClassic_Trailer_AccessConditions, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *MifareClassic_Trailer_AccessConditions_Ac) Bits() (v []*MifareClassic_Trailer_AccessConditions_Ac_AcBit, err error) {
	if (this._f_bits) {
		return this.bits, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp91, err := this._parent._parent.AcBits()
	if err != nil {
		return nil, err
	}
	this.bits = make([]*MifareClassic_Trailer_AccessConditions_Ac_AcBit, tmp91)
	for i := range this.bits {
		tmp93, err := this._parent.Chunks()
		if err != nil {
			return nil, err
		}
		tmp92 := NewMifareClassic_Trailer_AccessConditions_Ac_AcBit(this.Index, tmp93[i].Chunk)
		err = tmp92.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.bits[i] = tmp92
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_bits = true
	this._f_bits = true
	return this.bits, nil
}

/**
 * c3 c2 c1
 */
func (this *MifareClassic_Trailer_AccessConditions_Ac) Val() (v int, err error) {
	if (this._f_val) {
		return this.val, nil
	}
	tmp94, err := this.Bits()
	if err != nil {
		return 0, err
	}
	tmp95, err := tmp94[2].N()
	if err != nil {
		return 0, err
	}
	tmp96, err := this.Bits()
	if err != nil {
		return 0, err
	}
	tmp97, err := tmp96[1].N()
	if err != nil {
		return 0, err
	}
	tmp98, err := this.Bits()
	if err != nil {
		return 0, err
	}
	tmp99, err := tmp98[0].N()
	if err != nil {
		return 0, err
	}
	this.val = int((((tmp95 << 2) | (tmp97 << 1)) | tmp99))
	this._f_val = true
	return this.val, nil
}
func (this *MifareClassic_Trailer_AccessConditions_Ac) InvShiftVal() (v int, err error) {
	if (this._f_invShiftVal) {
		return this.invShiftVal, nil
	}
	tmp100, err := this.Bits()
	if err != nil {
		return 0, err
	}
	tmp101, err := tmp100[0].N()
	if err != nil {
		return 0, err
	}
	tmp102, err := this.Bits()
	if err != nil {
		return 0, err
	}
	tmp103, err := tmp102[1].N()
	if err != nil {
		return 0, err
	}
	tmp104, err := this.Bits()
	if err != nil {
		return 0, err
	}
	tmp105, err := tmp104[2].N()
	if err != nil {
		return 0, err
	}
	this.invShiftVal = int((((tmp101 << 2) | (tmp103 << 1)) | tmp105))
	this._f_invShiftVal = true
	return this.invShiftVal, nil
}
type MifareClassic_Trailer_AccessConditions_Ac_AcBit struct {
	I uint8
	Chunk uint8
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Trailer_AccessConditions_Ac
	_f_n bool
	n int
	_f_b bool
	b bool
}
func NewMifareClassic_Trailer_AccessConditions_Ac_AcBit(i uint8, chunk uint8) *MifareClassic_Trailer_AccessConditions_Ac_AcBit {
	return &MifareClassic_Trailer_AccessConditions_Ac_AcBit{
		I: i,
		Chunk: chunk,
	}
}

func (this *MifareClassic_Trailer_AccessConditions_Ac_AcBit) Read(io *kaitai.Stream, parent *MifareClassic_Trailer_AccessConditions_Ac, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *MifareClassic_Trailer_AccessConditions_Ac_AcBit) N() (v int, err error) {
	if (this._f_n) {
		return this.n, nil
	}
	this.n = int(((this.Chunk >> this.I) & 1))
	this._f_n = true
	return this.n, nil
}
func (this *MifareClassic_Trailer_AccessConditions_Ac_AcBit) B() (v bool, err error) {
	if (this._f_b) {
		return this.b, nil
	}
	tmp106, err := this.N()
	if err != nil {
		return false, err
	}
	this.b = bool(tmp106 == 1)
	this._f_b = true
	return this.b, nil
}
type MifareClassic_Trailer_AccessConditions_ValidChunk struct {
	InvChunk uint8
	Chunk uint8
	_io *kaitai.Stream
	_root *MifareClassic
	_parent *MifareClassic_Trailer_AccessConditions
	_f_valid bool
	valid bool
}
func NewMifareClassic_Trailer_AccessConditions_ValidChunk(invChunk uint8, chunk uint8) *MifareClassic_Trailer_AccessConditions_ValidChunk {
	return &MifareClassic_Trailer_AccessConditions_ValidChunk{
		InvChunk: invChunk,
		Chunk: chunk,
	}
}

func (this *MifareClassic_Trailer_AccessConditions_ValidChunk) Read(io *kaitai.Stream, parent *MifareClassic_Trailer_AccessConditions, root *MifareClassic) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *MifareClassic_Trailer_AccessConditions_ValidChunk) Valid() (v bool, err error) {
	if (this._f_valid) {
		return this.valid, nil
	}
	this.valid = bool((this.InvChunk ^ this.Chunk) == 15)
	this._f_valid = true
	return this.valid, nil
}
