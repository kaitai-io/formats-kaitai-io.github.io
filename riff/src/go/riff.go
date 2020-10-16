// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * The Resource Interchange File Format (RIFF) is a generic file container format
 * for storing data in tagged chunks. It is primarily used to store multimedia
 * such as sound and video, though it may also be used to store any arbitrary data.
 * 
 * The Microsoft implementation is mostly known through container formats
 * like AVI, ANI and WAV, which use RIFF as their basis.
 * @see <a href="https://www.johnloomis.org/cpe102/asgn/asgn1/riff.html">Source</a>
 */

type Riff_Fourcc int
const (
	Riff_Fourcc__Riff Riff_Fourcc = 1179011410
	Riff_Fourcc__Info Riff_Fourcc = 1330007625
	Riff_Fourcc__List Riff_Fourcc = 1414744396
)
type Riff struct {
	Chunk *Riff_Chunk
	_io *kaitai.Stream
	_root *Riff
	_parent interface{}
	_f_chunkId bool
	chunkId Riff_Fourcc
	_f_isRiffChunk bool
	isRiffChunk bool
	_f_parentChunkData bool
	parentChunkData *Riff_ParentChunkData
	_f_subchunks bool
	subchunks []*Riff_ChunkType
}
func NewRiff() *Riff {
	return &Riff{
	}
}

func (this *Riff) Read(io *kaitai.Stream, parent interface{}, root *Riff) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewRiff_Chunk()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Chunk = tmp1
	return err
}
func (this *Riff) ChunkId() (v Riff_Fourcc, err error) {
	if (this._f_chunkId) {
		return this.chunkId, nil
	}
	this.chunkId = Riff_Fourcc(Riff_Fourcc(this.Chunk.Id))
	this._f_chunkId = true
	return this.chunkId, nil
}
func (this *Riff) IsRiffChunk() (v bool, err error) {
	if (this._f_isRiffChunk) {
		return this.isRiffChunk, nil
	}
	tmp2, err := this.ChunkId()
	if err != nil {
		return false, err
	}
	this.isRiffChunk = bool(tmp2 == Riff_Fourcc__Riff)
	this._f_isRiffChunk = true
	return this.isRiffChunk, nil
}
func (this *Riff) ParentChunkData() (v *Riff_ParentChunkData, err error) {
	if (this._f_parentChunkData) {
		return this.parentChunkData, nil
	}
	tmp3, err := this.IsRiffChunk()
	if err != nil {
		return nil, err
	}
	if (tmp3) {
		thisIo := this.Chunk.DataSlot._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(0), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp4 := NewRiff_ParentChunkData()
		err = tmp4.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.parentChunkData = tmp4
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_parentChunkData = true
	}
	this._f_parentChunkData = true
	return this.parentChunkData, nil
}
func (this *Riff) Subchunks() (v []*Riff_ChunkType, err error) {
	if (this._f_subchunks) {
		return this.subchunks, nil
	}
	tmp5, err := this.IsRiffChunk()
	if err != nil {
		return nil, err
	}
	if (tmp5) {
		tmp6, err := this.ParentChunkData()
		if err != nil {
			return nil, err
		}
		thisIo := tmp6.SubchunksSlot._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(0), io.SeekStart)
		if err != nil {
			return nil, err
		}
		for i := 1;; i++ {
			tmp7, err := this._io.EOF()
			if err != nil {
				return nil, err
			}
			if tmp7 {
				break
			}
			tmp8 := NewRiff_ChunkType()
			err = tmp8.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.subchunks = append(this.subchunks, tmp8)
		}
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_subchunks = true
	}
	this._f_subchunks = true
	return this.subchunks, nil
}
type Riff_ListChunkData struct {
	SaveParentChunkDataOfs []byte
	ParentChunkData *Riff_ParentChunkData
	_io *kaitai.Stream
	_root *Riff
	_parent *Riff_ChunkType
	_f_parentChunkDataOfs bool
	parentChunkDataOfs int
	_f_formType bool
	formType Riff_Fourcc
	_f_formTypeReadable bool
	formTypeReadable string
	_f_subchunks bool
	subchunks []interface{}
}
func NewRiff_ListChunkData() *Riff_ListChunkData {
	return &Riff_ListChunkData{
	}
}

func (this *Riff_ListChunkData) Read(io *kaitai.Stream, parent *Riff_ChunkType, root *Riff) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this.ParentChunkDataOfs()
	if err != nil {
		return err
	}
	if (tmp9 < 0) {
		tmp10, err := this._io.ReadBytes(int(0))
		if err != nil {
			return err
		}
		tmp10 = tmp10
		this.SaveParentChunkDataOfs = tmp10
	}
	tmp11 := NewRiff_ParentChunkData()
	err = tmp11.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ParentChunkData = tmp11
	return err
}
func (this *Riff_ListChunkData) ParentChunkDataOfs() (v int, err error) {
	if (this._f_parentChunkDataOfs) {
		return this.parentChunkDataOfs, nil
	}
	tmp12, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	this.parentChunkDataOfs = int(tmp12)
	this._f_parentChunkDataOfs = true
	return this.parentChunkDataOfs, nil
}
func (this *Riff_ListChunkData) FormType() (v Riff_Fourcc, err error) {
	if (this._f_formType) {
		return this.formType, nil
	}
	this.formType = Riff_Fourcc(Riff_Fourcc(this.ParentChunkData.FormType))
	this._f_formType = true
	return this.formType, nil
}
func (this *Riff_ListChunkData) FormTypeReadable() (v string, err error) {
	if (this._f_formTypeReadable) {
		return this.formTypeReadable, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return "", err
	}
	tmp13, err := this.ParentChunkDataOfs()
	if err != nil {
		return "", err
	}
	_, err = this._io.Seek(int64(tmp13), io.SeekStart)
	if err != nil {
		return "", err
	}
	tmp14, err := this._io.ReadBytes(int(4))
	if err != nil {
		return "", err
	}
	tmp14 = tmp14
	this.formTypeReadable = string(tmp14)
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_formTypeReadable = true
	this._f_formTypeReadable = true
	return this.formTypeReadable, nil
}
func (this *Riff_ListChunkData) Subchunks() (v []interface{}, err error) {
	if (this._f_subchunks) {
		return this.subchunks, nil
	}
	thisIo := this.ParentChunkData.SubchunksSlot._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	for i := 1;; i++ {
		tmp15, err := this._io.EOF()
		if err != nil {
			return nil, err
		}
		if tmp15 {
			break
		}
		tmp16, err := this.FormType()
		if err != nil {
			return nil, err
		}
		switch (tmp16) {
		case Riff_Fourcc__Info:
			tmp17 := NewRiff_InfoSubchunk()
			err = tmp17.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.subchunks = append(this.subchunks, tmp17)
		default:
			tmp18 := NewRiff_ChunkType()
			err = tmp18.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.subchunks = append(this.subchunks, tmp18)
		}
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_subchunks = true
	this._f_subchunks = true
	return this.subchunks, nil
}
type Riff_Chunk struct {
	Id uint32
	Len uint32
	DataSlot *Riff_Chunk_Slot
	PadByte []byte
	_io *kaitai.Stream
	_root *Riff
	_parent interface{}
	_raw_DataSlot []byte
}
func NewRiff_Chunk() *Riff_Chunk {
	return &Riff_Chunk{
	}
}

func (this *Riff_Chunk) Read(io *kaitai.Stream, parent interface{}, root *Riff) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Id = uint32(tmp19)
	tmp20, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Len = uint32(tmp20)
	tmp21, err := this._io.ReadBytes(int(this.Len))
	if err != nil {
		return err
	}
	tmp21 = tmp21
	this._raw_DataSlot = tmp21
	_io__raw_DataSlot := kaitai.NewStream(bytes.NewReader(this._raw_DataSlot))
	tmp22 := NewRiff_Chunk_Slot()
	err = tmp22.Read(_io__raw_DataSlot, this, this._root)
	if err != nil {
		return err
	}
	this.DataSlot = tmp22
	tmp23 := this.Len % 2
	if tmp23 < 0 {
		tmp23 += 2
	}
	tmp24, err := this._io.ReadBytes(int(tmp23))
	if err != nil {
		return err
	}
	tmp24 = tmp24
	this.PadByte = tmp24
	return err
}
type Riff_Chunk_Slot struct {
	_io *kaitai.Stream
	_root *Riff
	_parent *Riff_Chunk
}
func NewRiff_Chunk_Slot() *Riff_Chunk_Slot {
	return &Riff_Chunk_Slot{
	}
}

func (this *Riff_Chunk_Slot) Read(io *kaitai.Stream, parent *Riff_Chunk, root *Riff) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
type Riff_ParentChunkData struct {
	FormType uint32
	SubchunksSlot *Riff_ParentChunkData_Slot
	_io *kaitai.Stream
	_root *Riff
	_parent interface{}
	_raw_SubchunksSlot []byte
}
func NewRiff_ParentChunkData() *Riff_ParentChunkData {
	return &Riff_ParentChunkData{
	}
}

func (this *Riff_ParentChunkData) Read(io *kaitai.Stream, parent interface{}, root *Riff) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FormType = uint32(tmp25)
	tmp26, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp26 = tmp26
	this._raw_SubchunksSlot = tmp26
	_io__raw_SubchunksSlot := kaitai.NewStream(bytes.NewReader(this._raw_SubchunksSlot))
	tmp27 := NewRiff_ParentChunkData_Slot()
	err = tmp27.Read(_io__raw_SubchunksSlot, this, this._root)
	if err != nil {
		return err
	}
	this.SubchunksSlot = tmp27
	return err
}
type Riff_ParentChunkData_Slot struct {
	_io *kaitai.Stream
	_root *Riff
	_parent *Riff_ParentChunkData
}
func NewRiff_ParentChunkData_Slot() *Riff_ParentChunkData_Slot {
	return &Riff_ParentChunkData_Slot{
	}
}

func (this *Riff_ParentChunkData_Slot) Read(io *kaitai.Stream, parent *Riff_ParentChunkData, root *Riff) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}

/**
 * All registered subchunks in the INFO chunk are NULL-terminated strings,
 * but the unregistered might not be. By convention, the registered
 * chunk IDs are in uppercase and the unregistered IDs are in lowercase.
 * 
 * If the chunk ID of an INFO subchunk contains a lowercase
 * letter, this chunk is considered as unregistered and thus we can make
 * no assumptions about the type of data.
 */
type Riff_InfoSubchunk struct {
	SaveChunkOfs []byte
	Chunk *Riff_Chunk
	_io *kaitai.Stream
	_root *Riff
	_parent *Riff_ListChunkData
	_f_chunkData bool
	chunkData string
	_f_isUnregisteredTag bool
	isUnregisteredTag bool
	_f_idChars bool
	idChars []byte
	_f_chunkIdReadable bool
	chunkIdReadable string
	_f_chunkOfs bool
	chunkOfs int
}
func NewRiff_InfoSubchunk() *Riff_InfoSubchunk {
	return &Riff_InfoSubchunk{
	}
}

func (this *Riff_InfoSubchunk) Read(io *kaitai.Stream, parent *Riff_ListChunkData, root *Riff) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this.ChunkOfs()
	if err != nil {
		return err
	}
	if (tmp28 < 0) {
		tmp29, err := this._io.ReadBytes(int(0))
		if err != nil {
			return err
		}
		tmp29 = tmp29
		this.SaveChunkOfs = tmp29
	}
	tmp30 := NewRiff_Chunk()
	err = tmp30.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Chunk = tmp30
	return err
}
func (this *Riff_InfoSubchunk) ChunkData() (v string, err error) {
	if (this._f_chunkData) {
		return this.chunkData, nil
	}
	thisIo := this.Chunk.DataSlot._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp31, err := this.IsUnregisteredTag()
	if err != nil {
		return nil, err
	}
	switch (tmp31) {
	case false:
		tmp32, err := thisIo.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return nil, err
		}
		this.chunkData = string(tmp32)
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_chunkData = true
	this._f_chunkData = true
	return this.chunkData, nil
}

/**
 * Check if chunk_id contains lowercase characters ([a-z], ASCII 97 = a, ASCII 122 = z).
 */
func (this *Riff_InfoSubchunk) IsUnregisteredTag() (v bool, err error) {
	if (this._f_isUnregisteredTag) {
		return this.isUnregisteredTag, nil
	}
	tmp33, err := this.IdChars()
	if err != nil {
		return false, err
	}
	tmp34, err := this.IdChars()
	if err != nil {
		return false, err
	}
	tmp35, err := this.IdChars()
	if err != nil {
		return false, err
	}
	tmp36, err := this.IdChars()
	if err != nil {
		return false, err
	}
	tmp37, err := this.IdChars()
	if err != nil {
		return false, err
	}
	tmp38, err := this.IdChars()
	if err != nil {
		return false, err
	}
	tmp39, err := this.IdChars()
	if err != nil {
		return false, err
	}
	tmp40, err := this.IdChars()
	if err != nil {
		return false, err
	}
	this.isUnregisteredTag = bool( (( ((tmp33[0] >= 97) && (tmp34[0] <= 122)) ) || ( ((tmp35[1] >= 97) && (tmp36[1] <= 122)) ) || ( ((tmp37[2] >= 97) && (tmp38[2] <= 122)) ) || ( ((tmp39[3] >= 97) && (tmp40[3] <= 122)) )) )
	this._f_isUnregisteredTag = true
	return this.isUnregisteredTag, nil
}
func (this *Riff_InfoSubchunk) IdChars() (v []byte, err error) {
	if (this._f_idChars) {
		return this.idChars, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp41, err := this.ChunkOfs()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(tmp41), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp42, err := this._io.ReadBytes(int(4))
	if err != nil {
		return nil, err
	}
	tmp42 = tmp42
	this.idChars = tmp42
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_idChars = true
	this._f_idChars = true
	return this.idChars, nil
}
func (this *Riff_InfoSubchunk) ChunkIdReadable() (v string, err error) {
	if (this._f_chunkIdReadable) {
		return this.chunkIdReadable, nil
	}
	tmp43, err := this.IdChars()
	if err != nil {
		return "", err
	}
	this.chunkIdReadable = string(string(tmp43))
	this._f_chunkIdReadable = true
	return this.chunkIdReadable, nil
}
func (this *Riff_InfoSubchunk) ChunkOfs() (v int, err error) {
	if (this._f_chunkOfs) {
		return this.chunkOfs, nil
	}
	tmp44, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	this.chunkOfs = int(tmp44)
	this._f_chunkOfs = true
	return this.chunkOfs, nil
}
type Riff_ChunkType struct {
	SaveChunkOfs []byte
	Chunk *Riff_Chunk
	_io *kaitai.Stream
	_root *Riff
	_parent interface{}
	_f_chunkOfs bool
	chunkOfs int
	_f_chunkId bool
	chunkId Riff_Fourcc
	_f_chunkIdReadable bool
	chunkIdReadable string
	_f_chunkData bool
	chunkData *Riff_ListChunkData
}
func NewRiff_ChunkType() *Riff_ChunkType {
	return &Riff_ChunkType{
	}
}

func (this *Riff_ChunkType) Read(io *kaitai.Stream, parent interface{}, root *Riff) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp45, err := this.ChunkOfs()
	if err != nil {
		return err
	}
	if (tmp45 < 0) {
		tmp46, err := this._io.ReadBytes(int(0))
		if err != nil {
			return err
		}
		tmp46 = tmp46
		this.SaveChunkOfs = tmp46
	}
	tmp47 := NewRiff_Chunk()
	err = tmp47.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Chunk = tmp47
	return err
}
func (this *Riff_ChunkType) ChunkOfs() (v int, err error) {
	if (this._f_chunkOfs) {
		return this.chunkOfs, nil
	}
	tmp48, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	this.chunkOfs = int(tmp48)
	this._f_chunkOfs = true
	return this.chunkOfs, nil
}
func (this *Riff_ChunkType) ChunkId() (v Riff_Fourcc, err error) {
	if (this._f_chunkId) {
		return this.chunkId, nil
	}
	this.chunkId = Riff_Fourcc(Riff_Fourcc(this.Chunk.Id))
	this._f_chunkId = true
	return this.chunkId, nil
}
func (this *Riff_ChunkType) ChunkIdReadable() (v string, err error) {
	if (this._f_chunkIdReadable) {
		return this.chunkIdReadable, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return "", err
	}
	tmp49, err := this.ChunkOfs()
	if err != nil {
		return "", err
	}
	_, err = this._io.Seek(int64(tmp49), io.SeekStart)
	if err != nil {
		return "", err
	}
	tmp50, err := this._io.ReadBytes(int(4))
	if err != nil {
		return "", err
	}
	tmp50 = tmp50
	this.chunkIdReadable = string(tmp50)
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_chunkIdReadable = true
	this._f_chunkIdReadable = true
	return this.chunkIdReadable, nil
}
func (this *Riff_ChunkType) ChunkData() (v *Riff_ListChunkData, err error) {
	if (this._f_chunkData) {
		return this.chunkData, nil
	}
	thisIo := this.Chunk.DataSlot._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp51, err := this.ChunkId()
	if err != nil {
		return nil, err
	}
	switch (tmp51) {
	case Riff_Fourcc__List:
		tmp52 := NewRiff_ListChunkData()
		err = tmp52.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.chunkData = tmp52
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_chunkData = true
	this._f_chunkData = true
	return this.chunkData, nil
}
