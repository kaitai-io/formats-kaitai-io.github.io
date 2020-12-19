// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Android apps using directly or indirectly OpenGL cache compiled shaders
 * into com.android.opengl.shaders_cache file.
 * @see <a href="https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp">Source</a>
 */
type AndroidOpenglShadersCache struct {
	Magic []byte
	Crc32 uint32
	Contents *AndroidOpenglShadersCache_Cache
	_io *kaitai.Stream
	_root *AndroidOpenglShadersCache
	_parent interface{}
	_raw_Contents []byte
}
func NewAndroidOpenglShadersCache() *AndroidOpenglShadersCache {
	return &AndroidOpenglShadersCache{
	}
}

func (this *AndroidOpenglShadersCache) Read(io *kaitai.Stream, parent interface{}, root *AndroidOpenglShadersCache) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{69, 71, 76, 36})) {
		return kaitai.NewValidationNotEqualError([]uint8{69, 71, 76, 36}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Crc32 = uint32(tmp2)
	tmp3, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this._raw_Contents = tmp3
	_io__raw_Contents := kaitai.NewStream(bytes.NewReader(this._raw_Contents))
	tmp4 := NewAndroidOpenglShadersCache_Cache()
	err = tmp4.Read(_io__raw_Contents, this, this._root)
	if err != nil {
		return err
	}
	this.Contents = tmp4
	return err
}

/**
 * crc32 of `contents`
 */
type AndroidOpenglShadersCache_Alignment struct {
	Alignment []byte
	_io *kaitai.Stream
	_root *AndroidOpenglShadersCache
	_parent interface{}
}
func NewAndroidOpenglShadersCache_Alignment() *AndroidOpenglShadersCache_Alignment {
	return &AndroidOpenglShadersCache_Alignment{
	}
}

func (this *AndroidOpenglShadersCache_Alignment) Read(io *kaitai.Stream, parent interface{}, root *AndroidOpenglShadersCache) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp6, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp7, err := this._io.ReadBytes(int(((tmp5 + 3) & (^3 - tmp6))))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Alignment = tmp7
	return err
}

/**
 * garbage from memory
 */
type AndroidOpenglShadersCache_PrefixedString struct {
	LenStr uint32
	Str string
	Alignment *AndroidOpenglShadersCache_Alignment
	_io *kaitai.Stream
	_root *AndroidOpenglShadersCache
	_parent *AndroidOpenglShadersCache_Cache
}
func NewAndroidOpenglShadersCache_PrefixedString() *AndroidOpenglShadersCache_PrefixedString {
	return &AndroidOpenglShadersCache_PrefixedString{
	}
}

func (this *AndroidOpenglShadersCache_PrefixedString) Read(io *kaitai.Stream, parent *AndroidOpenglShadersCache_Cache, root *AndroidOpenglShadersCache) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenStr = uint32(tmp8)
	tmp9, err := this._io.ReadBytes(int(this.LenStr))
	if err != nil {
		return err
	}
	tmp9 = kaitai.BytesTerminate(tmp9, 0, false)
	this.Str = string(tmp9)
	tmp10 := NewAndroidOpenglShadersCache_Alignment()
	err = tmp10.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Alignment = tmp10
	return err
}

/**
 * @see <a href="https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp">Source</a>
 */
type AndroidOpenglShadersCache_Cache struct {
	Magic []byte
	Version uint32
	DeviceVersion uint32
	NumEntries uint32
	BuildId *AndroidOpenglShadersCache_PrefixedString
	Entries []*AndroidOpenglShadersCache_Cache_Entry
	_io *kaitai.Stream
	_root *AndroidOpenglShadersCache
	_parent *AndroidOpenglShadersCache
}
func NewAndroidOpenglShadersCache_Cache() *AndroidOpenglShadersCache_Cache {
	return &AndroidOpenglShadersCache_Cache{
	}
}

func (this *AndroidOpenglShadersCache_Cache) Read(io *kaitai.Stream, parent *AndroidOpenglShadersCache, root *AndroidOpenglShadersCache) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Magic = tmp11
	if !(bytes.Equal(this.Magic, []uint8{36, 98, 66, 95})) {
		return kaitai.NewValidationNotEqualError([]uint8{36, 98, 66, 95}, this.Magic, this._io, "/types/cache/seq/0")
	}
	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp12)
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DeviceVersion = uint32(tmp13)
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumEntries = uint32(tmp14)
	if (this.Version >= 3) {
		tmp15 := NewAndroidOpenglShadersCache_PrefixedString()
		err = tmp15.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.BuildId = tmp15
	}
	this.Entries = make([]*AndroidOpenglShadersCache_Cache_Entry, this.NumEntries)
	for i := range this.Entries {
		tmp16 := NewAndroidOpenglShadersCache_Cache_Entry()
		err = tmp16.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries[i] = tmp16
	}
	return err
}
type AndroidOpenglShadersCache_Cache_Entry struct {
	LenKey uint32
	LenValue uint32
	Key []byte
	Value []byte
	Alignment *AndroidOpenglShadersCache_Alignment
	_io *kaitai.Stream
	_root *AndroidOpenglShadersCache
	_parent *AndroidOpenglShadersCache_Cache
}
func NewAndroidOpenglShadersCache_Cache_Entry() *AndroidOpenglShadersCache_Cache_Entry {
	return &AndroidOpenglShadersCache_Cache_Entry{
	}
}

func (this *AndroidOpenglShadersCache_Cache_Entry) Read(io *kaitai.Stream, parent *AndroidOpenglShadersCache_Cache, root *AndroidOpenglShadersCache) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenKey = uint32(tmp17)
	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenValue = uint32(tmp18)
	tmp19, err := this._io.ReadBytes(int(this.LenKey))
	if err != nil {
		return err
	}
	tmp19 = tmp19
	this.Key = tmp19
	tmp20, err := this._io.ReadBytes(int(this.LenValue))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.Value = tmp20
	tmp21 := NewAndroidOpenglShadersCache_Alignment()
	err = tmp21.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Alignment = tmp21
	return err
}