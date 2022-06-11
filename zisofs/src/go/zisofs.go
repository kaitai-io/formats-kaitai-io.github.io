// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * zisofs is a compression format for files on ISO9660 file system. It has
 * limited support across operating systems, mainly Linux kernel. Typically a
 * directory tree is first preprocessed by mkzftree (from the zisofs-tools
 * package before being turned into an ISO9660 image by mkisofs, genisoimage
 * or similar tool. The data is zlib compressed.
 * 
 * The specification here describes the structure of a file that has been
 * preprocessed by mkzftree, not of a full ISO9660 ziso. Data is not
 * decompressed, as blocks with length 0 have a special meaning. Decompression
 * and deconstruction of this data should be done outside of Kaitai Struct.
 * @see <a href="https://web.archive.org/web/20200612093441/https://dev.lovelyhq.com/libburnia/web/-/wikis/zisofs">Source</a>
 */
type Zisofs struct {
	Header *Zisofs_Header
	BlockPointers []uint32
	_io *kaitai.Stream
	_root *Zisofs
	_parent interface{}
	_raw_Header []byte
	_f_blocks bool
	blocks []*Zisofs_Block
}
func NewZisofs() *Zisofs {
	return &Zisofs{
	}
}

func (this *Zisofs) Read(io *kaitai.Stream, parent interface{}, root *Zisofs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this._raw_Header = tmp1
	_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
	tmp2 := NewZisofs_Header()
	err = tmp2.Read(_io__raw_Header, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp2
	tmp3, err := this.Header.NumBlocks()
	if err != nil {
		return err
	}
	this.BlockPointers = make([]uint32, (tmp3 + 1))
	for i := range this.BlockPointers {
		tmp4, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.BlockPointers[i] = tmp4
	}
	return err
}
func (this *Zisofs) Blocks() (v []*Zisofs_Block, err error) {
	if (this._f_blocks) {
		return this.blocks, nil
	}
	tmp5, err := this.Header.NumBlocks()
	if err != nil {
		return nil, err
	}
	this.blocks = make([]*Zisofs_Block, tmp5)
	for i := range this.blocks {
		tmp6 := NewZisofs_Block(this.BlockPointers[i], this.BlockPointers[(i + 1)])
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.blocks[i] = tmp6
	}
	this._f_blocks = true
	this._f_blocks = true
	return this.blocks, nil
}

/**
 * The final pointer (`block_pointers[header.num_blocks]`) indicates the end
 * of the last block. Typically this is also the end of the file data.
 */
type Zisofs_Header struct {
	Magic []byte
	UncompressedSize uint32
	LenHeader uint8
	BlockSizeLog2 uint8
	Reserved []byte
	_io *kaitai.Stream
	_root *Zisofs
	_parent *Zisofs
	_f_blockSize bool
	blockSize int
	_f_numBlocks bool
	numBlocks int
}
func NewZisofs_Header() *Zisofs_Header {
	return &Zisofs_Header{
	}
}

func (this *Zisofs_Header) Read(io *kaitai.Stream, parent *Zisofs, root *Zisofs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Magic = tmp7
	if !(bytes.Equal(this.Magic, []uint8{55, 228, 83, 150, 201, 219, 214, 7})) {
		return kaitai.NewValidationNotEqualError([]uint8{55, 228, 83, 150, 201, 219, 214, 7}, this.Magic, this._io, "/types/header/seq/0")
	}
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.UncompressedSize = uint32(tmp8)
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenHeader = tmp9
	if !(this.LenHeader == 4) {
		return kaitai.NewValidationNotEqualError(4, this.LenHeader, this._io, "/types/header/seq/2")
	}
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BlockSizeLog2 = tmp10
	if !( ((this.BlockSizeLog2 == 15) || (this.BlockSizeLog2 == 16) || (this.BlockSizeLog2 == 17)) ) {
		return kaitai.NewValidationNotAnyOfError(this.BlockSizeLog2, this._io, "/types/header/seq/3")
	}
	tmp11, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Reserved = tmp11
	if !(bytes.Equal(this.Reserved, []uint8{0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 0}, this.Reserved, this._io, "/types/header/seq/4")
	}
	return err
}
func (this *Zisofs_Header) BlockSize() (v int, err error) {
	if (this._f_blockSize) {
		return this.blockSize, nil
	}
	this.blockSize = int((1 << this.BlockSizeLog2))
	this._f_blockSize = true
	return this.blockSize, nil
}

/**
 * ceil(uncompressed_size / block_size)
 */
func (this *Zisofs_Header) NumBlocks() (v int, err error) {
	if (this._f_numBlocks) {
		return this.numBlocks, nil
	}
	tmp12, err := this.BlockSize()
	if err != nil {
		return 0, err
	}
	var tmp13 int8;
	tmp15, err := this.BlockSize()
	if err != nil {
		return 0, err
	}
	tmp14 := this.UncompressedSize % tmp15
	if tmp14 < 0 {
		tmp16, err := this.BlockSize()
		if err != nil {
			return 0, err
		}
		tmp14 += tmp16
	}
	if (tmp14 != 0) {
		tmp13 = 1
	} else {
		tmp13 = 0
	}
	this.numBlocks = int(((this.UncompressedSize / tmp12) + tmp13))
	this._f_numBlocks = true
	return this.numBlocks, nil
}

/**
 * Size of the original uncompressed file
 */

/**
 * header_size >> 2 (currently 4)
 */
type Zisofs_Block struct {
	OfsStart uint32
	OfsEnd uint32
	_io *kaitai.Stream
	_root *Zisofs
	_parent *Zisofs
	_f_lenData bool
	lenData int
	_f_data bool
	data []byte
}
func NewZisofs_Block(ofsStart uint32, ofsEnd uint32) *Zisofs_Block {
	return &Zisofs_Block{
		OfsStart: ofsStart,
		OfsEnd: ofsEnd,
	}
}

func (this *Zisofs_Block) Read(io *kaitai.Stream, parent *Zisofs, root *Zisofs) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *Zisofs_Block) LenData() (v int, err error) {
	if (this._f_lenData) {
		return this.lenData, nil
	}
	this.lenData = int((this.OfsEnd - this.OfsStart))
	this._f_lenData = true
	return this.lenData, nil
}
func (this *Zisofs_Block) Data() (v []byte, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsStart), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp17, err := this.LenData()
	if err != nil {
		return nil, err
	}
	tmp18, err := thisIo.ReadBytes(int(tmp17))
	if err != nil {
		return nil, err
	}
	tmp18 = tmp18
	this.data = tmp18
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_data = true
	this._f_data = true
	return this.data, nil
}
