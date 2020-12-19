// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * @see <a href="https://hashcat.net/wiki/doku.php?id=restore">Source</a>
 */
type HashcatRestore struct {
	Version uint32
	Cwd string
	DictsPos uint32
	MasksPos uint32
	Padding []byte
	CurrentRestorePoint uint64
	Argc uint32
	Padding2 []byte
	Argv []string
	_io *kaitai.Stream
	_root *HashcatRestore
	_parent interface{}
}
func NewHashcatRestore() *HashcatRestore {
	return &HashcatRestore{
	}
}

func (this *HashcatRestore) Read(io *kaitai.Stream, parent interface{}, root *HashcatRestore) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp1)
	tmp2, err := this._io.ReadBytes(int(256))
	if err != nil {
		return err
	}
	tmp2 = kaitai.BytesTerminate(tmp2, 0, false)
	this.Cwd = string(tmp2)
	tmp3, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DictsPos = uint32(tmp3)
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MasksPos = uint32(tmp4)
	tmp5, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp5 = tmp5
	this.Padding = tmp5
	tmp6, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.CurrentRestorePoint = uint64(tmp6)
	tmp7, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Argc = uint32(tmp7)
	tmp8, err := this._io.ReadBytes(int(12))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Padding2 = tmp8
	this.Argv = make([]string, this.Argc)
	for i := range this.Argv {
		tmp9, err := this._io.ReadBytesTerm(10, false, true, true)
		if err != nil {
			return err
		}
		this.Argv[i] = string(tmp9)
	}
	return err
}