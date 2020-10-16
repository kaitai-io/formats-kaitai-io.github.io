// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * Helper type to work around Kaitai Struct not providing an `_io` member for plain byte arrays.
 */
type BytesWithIo struct {
	Data []byte
	_io *kaitai.Stream
	_root *BytesWithIo
	_parent interface{}
}
func NewBytesWithIo() *BytesWithIo {
	return &BytesWithIo{
	}
}

func (this *BytesWithIo) Read(io *kaitai.Stream, parent interface{}, root *BytesWithIo) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Data = tmp1
	return err
}

/**
 * The actual data.
 */
