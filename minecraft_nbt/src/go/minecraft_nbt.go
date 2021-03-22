// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
)


/**
 * A structured binary format native to Minecraft for saving game data and transferring
 * it over the network (in multiplayer), such as player data
 * ([`<player>.dat`](https://minecraft.gamepedia.com/Player.dat_format); contains
 * e.g. player's inventory and location), saved worlds
 * ([`level.dat`](
 *   https://minecraft.gamepedia.com/Java_Edition_level_format#level.dat_format
 * ) and [Chunk format](https://minecraft.gamepedia.com/Chunk_format#NBT_structure)),
 * list of saved multiplayer servers
 * ([`servers.dat`](https://minecraft.gamepedia.com/Servers.dat_format)) and so on -
 * see <https://minecraft.gamepedia.com/NBT_format#Uses>.
 * 
 * The entire file should be _gzip_-compressed (in accordance with the original
 * specification [NBT.txt](
 *   https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt
 * ) by Notch), but can also be compressed with _zlib_ or uncompressed.
 * 
 * This spec can only handle uncompressed NBT data, so be sure to first detect
 * what type of data you are dealing with. You can use the Unix `file` command
 * to do this (`file-5.20` or later is required; older versions do not recognize
 * _zlib_-compressed data and return `application/octet-stream` instead):
 * 
 * ```shell
 * file --brief --mime-type input-unknown.nbt
 * ```
 * 
 * If it says:
 * 
 *   * `application/x-gzip` or `application/gzip` (since `file-5.37`), you can decompress it by
 *     * `gunzip -c input-gzip.nbt > output.nbt` or
 *     * `python3 -c "import sys, gzip; sys.stdout.buffer.write(
 *       gzip.decompress(sys.stdin.buffer.read()) )" < input-gzip.nbt > output.nbt`
 *   * `application/zlib`, you can use
 *     * `openssl zlib -d -in input-zlib.nbt -out output.nbt` (does not work on most systems)
 *     * `python3 -c "import sys, zlib; sys.stdout.buffer.write(
 *       zlib.decompress(sys.stdin.buffer.read()) )" < input-zlib.nbt > output.nbt`
 *   * something else (especially `image/x-pcx` and `application/octet-stream`),
 *     it is most likely already uncompressed.
 * 
 * The file `output.nbt` generated by one of the above commands can already be
 * processed with this Kaitai Struct specification.
 * 
 * This spec **only** implements the Java edition format. There is also
 * a [Bedrock edition](https://wiki.vg/NBT#Bedrock_edition) NBT format,
 * which uses little-endian encoding and has a few other differences, but it isn't
 * as popular as the Java edition format.
 * 
 * **Implementation note:** strings in `TAG_String` are incorrectly decoded with
 * standard UTF-8, while they are encoded in [**Modified UTF-8**](
 *   https://docs.oracle.com/javase/8/docs/api/java/io/DataInput.html#modified-utf-8
 * ) (MUTF-8). That's because MUTF-8 is not supported natively by most target
 * languages, and thus one must use external libraries to achieve a fully-compliant
 * decoder. But decoding in standard UTF-8 is still better than nothing, and
 * it usually works fine.
 * 
 * All Unicode code points with incompatible representations in MUTF-8 and UTF-8 are
 * U+0000 (_NUL_), U+D800-U+DFFF (_High_ and _Low Surrogates_) and U+10000-U+10FFFF
 * (all _Supplementary_ Planes; includes e.g. emoticons, pictograms).
 * A _MUTF-8_-encoded string containing these code points cannot be successfully
 * decoded as UTF-8. The behavior in this case depends on the target language -
 * usually an exception is thrown, or the bytes that are not valid UTF-8
 * are replaced or ignored.
 * 
 * **Sample files:**
 * 
 *   * <https://wiki.vg/NBT#Download>
 *   * <https://github.com/twoolie/NBT/blob/f9e892e/tests/world_test/data/scoreboard.dat>
 *   * <https://github.com/chmod222/cNBT/tree/3f74b69/testdata>
 *   * <https://github.com/PistonDevelopers/hematite_nbt/tree/0b85f89/tests>
 * @see <a href="https://wiki.vg/NBT">Source</a>
 * @see <a href="https://web.archive.org/web/20110723210920/https://www.minecraft.net/docs/NBT.txt">Source</a>
 * @see <a href="https://minecraft.gamepedia.com/NBT_format">Source</a>
 */

type MinecraftNbt_Tag int
const (
	MinecraftNbt_Tag__End MinecraftNbt_Tag = 0
	MinecraftNbt_Tag__Byte MinecraftNbt_Tag = 1
	MinecraftNbt_Tag__Short MinecraftNbt_Tag = 2
	MinecraftNbt_Tag__Int MinecraftNbt_Tag = 3
	MinecraftNbt_Tag__Long MinecraftNbt_Tag = 4
	MinecraftNbt_Tag__Float MinecraftNbt_Tag = 5
	MinecraftNbt_Tag__Double MinecraftNbt_Tag = 6
	MinecraftNbt_Tag__ByteArray MinecraftNbt_Tag = 7
	MinecraftNbt_Tag__String MinecraftNbt_Tag = 8
	MinecraftNbt_Tag__List MinecraftNbt_Tag = 9
	MinecraftNbt_Tag__Compound MinecraftNbt_Tag = 10
	MinecraftNbt_Tag__IntArray MinecraftNbt_Tag = 11
	MinecraftNbt_Tag__LongArray MinecraftNbt_Tag = 12
)
type MinecraftNbt struct {
	RootCheck []byte
	Root *MinecraftNbt_NamedTag
	_io *kaitai.Stream
	_root *MinecraftNbt
	_parent interface{}
	_f_rootType bool
	rootType MinecraftNbt_Tag
}
func NewMinecraftNbt() *MinecraftNbt {
	return &MinecraftNbt{
	}
}

func (this *MinecraftNbt) Read(io *kaitai.Stream, parent interface{}, root *MinecraftNbt) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this.RootType()
	if err != nil {
		return err
	}
	if ( ((tmp1 == MinecraftNbt_Tag__End) && (false)) ) {
		tmp2, err := this._io.ReadBytes(int(0))
		if err != nil {
			return err
		}
		tmp2 = tmp2
		this.RootCheck = tmp2
	}
	tmp3 := NewMinecraftNbt_NamedTag()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Root = tmp3
	return err
}
func (this *MinecraftNbt) RootType() (v MinecraftNbt_Tag, err error) {
	if (this._f_rootType) {
		return this.rootType, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp4, err := this._io.ReadU1()
	if err != nil {
		return nil, err
	}
	this.rootType = MinecraftNbt_Tag(tmp4)
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_rootType = true
	tmp5, err := this.RootType()
	if err != nil {
		return nil, err
	}
	tmp6, err := this.RootType()
	if err != nil {
		return nil, err
	}
	if !(tmp6 == MinecraftNbt_Tag__Compound) {
		return nil, kaitai.NewValidationNotEqualError(MinecraftNbt_Tag__Compound, tmp5, this._io, "/instances/root_type")
	}
	this._f_rootType = true
	return this.rootType, nil
}
type MinecraftNbt_TagLongArray struct {
	NumTags int32
	Tags []int64
	_io *kaitai.Stream
	_root *MinecraftNbt
	_parent interface{}
	_f_tagsType bool
	tagsType MinecraftNbt_Tag
}
func NewMinecraftNbt_TagLongArray() *MinecraftNbt_TagLongArray {
	return &MinecraftNbt_TagLongArray{
	}
}

func (this *MinecraftNbt_TagLongArray) Read(io *kaitai.Stream, parent interface{}, root *MinecraftNbt) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.NumTags = int32(tmp7)
	this.Tags = make([]int64, this.NumTags)
	for i := range this.Tags {
		tmp8, err := this._io.ReadS8be()
		if err != nil {
			return err
		}
		this.Tags[i] = tmp8
	}
	return err
}
func (this *MinecraftNbt_TagLongArray) TagsType() (v MinecraftNbt_Tag, err error) {
	if (this._f_tagsType) {
		return this.tagsType, nil
	}
	this.tagsType = MinecraftNbt_Tag(MinecraftNbt_Tag__Long)
	this._f_tagsType = true
	return this.tagsType, nil
}
type MinecraftNbt_TagByteArray struct {
	LenData int32
	Data []byte
	_io *kaitai.Stream
	_root *MinecraftNbt
	_parent interface{}
}
func NewMinecraftNbt_TagByteArray() *MinecraftNbt_TagByteArray {
	return &MinecraftNbt_TagByteArray{
	}
}

func (this *MinecraftNbt_TagByteArray) Read(io *kaitai.Stream, parent interface{}, root *MinecraftNbt) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.LenData = int32(tmp9)
	tmp10, err := this._io.ReadBytes(int(this.LenData))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Data = tmp10
	return err
}
type MinecraftNbt_TagIntArray struct {
	NumTags int32
	Tags []int32
	_io *kaitai.Stream
	_root *MinecraftNbt
	_parent interface{}
	_f_tagsType bool
	tagsType MinecraftNbt_Tag
}
func NewMinecraftNbt_TagIntArray() *MinecraftNbt_TagIntArray {
	return &MinecraftNbt_TagIntArray{
	}
}

func (this *MinecraftNbt_TagIntArray) Read(io *kaitai.Stream, parent interface{}, root *MinecraftNbt) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.NumTags = int32(tmp11)
	this.Tags = make([]int32, this.NumTags)
	for i := range this.Tags {
		tmp12, err := this._io.ReadS4be()
		if err != nil {
			return err
		}
		this.Tags[i] = tmp12
	}
	return err
}
func (this *MinecraftNbt_TagIntArray) TagsType() (v MinecraftNbt_Tag, err error) {
	if (this._f_tagsType) {
		return this.tagsType, nil
	}
	this.tagsType = MinecraftNbt_Tag(MinecraftNbt_Tag__Int)
	this._f_tagsType = true
	return this.tagsType, nil
}
type MinecraftNbt_TagList struct {
	TagsType MinecraftNbt_Tag
	NumTags int32
	Tags []interface{}
	_io *kaitai.Stream
	_root *MinecraftNbt
	_parent interface{}
}
func NewMinecraftNbt_TagList() *MinecraftNbt_TagList {
	return &MinecraftNbt_TagList{
	}
}

func (this *MinecraftNbt_TagList) Read(io *kaitai.Stream, parent interface{}, root *MinecraftNbt) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.TagsType = MinecraftNbt_Tag(tmp13)
	tmp14, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.NumTags = int32(tmp14)
	this.Tags = make([]interface{}, this.NumTags)
	for i := range this.Tags {
		switch (this.TagsType) {
		case MinecraftNbt_Tag__LongArray:
			tmp15 := NewMinecraftNbt_TagLongArray()
			err = tmp15.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Tags[i] = tmp15
		case MinecraftNbt_Tag__Compound:
			tmp16 := NewMinecraftNbt_TagCompound()
			err = tmp16.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Tags[i] = tmp16
		case MinecraftNbt_Tag__Double:
			tmp17, err := this._io.ReadF8be()
			if err != nil {
				return err
			}
			this.Tags[i] = tmp17
		case MinecraftNbt_Tag__List:
			tmp18 := NewMinecraftNbt_TagList()
			err = tmp18.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Tags[i] = tmp18
		case MinecraftNbt_Tag__Float:
			tmp19, err := this._io.ReadF4be()
			if err != nil {
				return err
			}
			this.Tags[i] = tmp19
		case MinecraftNbt_Tag__Short:
			tmp20, err := this._io.ReadS2be()
			if err != nil {
				return err
			}
			this.Tags[i] = tmp20
		case MinecraftNbt_Tag__Int:
			tmp21, err := this._io.ReadS4be()
			if err != nil {
				return err
			}
			this.Tags[i] = tmp21
		case MinecraftNbt_Tag__ByteArray:
			tmp22 := NewMinecraftNbt_TagByteArray()
			err = tmp22.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Tags[i] = tmp22
		case MinecraftNbt_Tag__Byte:
			tmp23, err := this._io.ReadS1()
			if err != nil {
				return err
			}
			this.Tags[i] = tmp23
		case MinecraftNbt_Tag__IntArray:
			tmp24 := NewMinecraftNbt_TagIntArray()
			err = tmp24.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Tags[i] = tmp24
		case MinecraftNbt_Tag__String:
			tmp25 := NewMinecraftNbt_TagString()
			err = tmp25.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Tags[i] = tmp25
		case MinecraftNbt_Tag__Long:
			tmp26, err := this._io.ReadS8be()
			if err != nil {
				return err
			}
			this.Tags[i] = tmp26
		}
	}
	return err
}
type MinecraftNbt_TagString struct {
	LenData uint16
	Data string
	_io *kaitai.Stream
	_root *MinecraftNbt
	_parent interface{}
}
func NewMinecraftNbt_TagString() *MinecraftNbt_TagString {
	return &MinecraftNbt_TagString{
	}
}

func (this *MinecraftNbt_TagString) Read(io *kaitai.Stream, parent interface{}, root *MinecraftNbt) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.LenData = uint16(tmp27)
	tmp28, err := this._io.ReadBytes(int(this.LenData))
	if err != nil {
		return err
	}
	tmp28 = tmp28
	this.Data = string(tmp28)
	return err
}

/**
 * unsigned according to https://wiki.vg/NBT#Specification
 */
type MinecraftNbt_TagCompound struct {
	Tags []*MinecraftNbt_NamedTag
	_io *kaitai.Stream
	_root *MinecraftNbt
	_parent interface{}
	_f_dumpNumTags bool
	dumpNumTags int
}
func NewMinecraftNbt_TagCompound() *MinecraftNbt_TagCompound {
	return &MinecraftNbt_TagCompound{
	}
}

func (this *MinecraftNbt_TagCompound) Read(io *kaitai.Stream, parent interface{}, root *MinecraftNbt) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp29 := NewMinecraftNbt_NamedTag()
		err = tmp29.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp29
		this.Tags = append(this.Tags, _it)
		tmp30, err := _it.IsTagEnd()
		if err != nil {
			return err
		}
		if tmp30 {
			break
		}
	}
	return err
}
func (this *MinecraftNbt_TagCompound) DumpNumTags() (v int, err error) {
	if (this._f_dumpNumTags) {
		return this.dumpNumTags, nil
	}
	var tmp31 int8;
	tmp32 := this.Tags
	tmp33, err := tmp32[len(tmp32) - 1].IsTagEnd()
	if err != nil {
		return 0, err
	}
	if ( ((len(this.Tags) >= 1) && (tmp33)) ) {
		tmp31 = 1
	} else {
		tmp31 = 0
	}
	this.dumpNumTags = int((len(this.Tags) - tmp31))
	this._f_dumpNumTags = true
	return this.dumpNumTags, nil
}
type MinecraftNbt_NamedTag struct {
	Type MinecraftNbt_Tag
	Name *MinecraftNbt_TagString
	Payload interface{}
	_io *kaitai.Stream
	_root *MinecraftNbt
	_parent interface{}
	_f_isTagEnd bool
	isTagEnd bool
}
func NewMinecraftNbt_NamedTag() *MinecraftNbt_NamedTag {
	return &MinecraftNbt_NamedTag{
	}
}

func (this *MinecraftNbt_NamedTag) Read(io *kaitai.Stream, parent interface{}, root *MinecraftNbt) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = MinecraftNbt_Tag(tmp34)
	tmp35, err := this.IsTagEnd()
	if err != nil {
		return err
	}
	if (!(tmp35)) {
		tmp36 := NewMinecraftNbt_TagString()
		err = tmp36.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Name = tmp36
	}
	tmp37, err := this.IsTagEnd()
	if err != nil {
		return err
	}
	if (!(tmp37)) {
		switch (this.Type) {
		case MinecraftNbt_Tag__LongArray:
			tmp38 := NewMinecraftNbt_TagLongArray()
			err = tmp38.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Payload = tmp38
		case MinecraftNbt_Tag__Compound:
			tmp39 := NewMinecraftNbt_TagCompound()
			err = tmp39.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Payload = tmp39
		case MinecraftNbt_Tag__Double:
			tmp40, err := this._io.ReadF8be()
			if err != nil {
				return err
			}
			this.Payload = tmp40
		case MinecraftNbt_Tag__List:
			tmp41 := NewMinecraftNbt_TagList()
			err = tmp41.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Payload = tmp41
		case MinecraftNbt_Tag__Float:
			tmp42, err := this._io.ReadF4be()
			if err != nil {
				return err
			}
			this.Payload = tmp42
		case MinecraftNbt_Tag__Short:
			tmp43, err := this._io.ReadS2be()
			if err != nil {
				return err
			}
			this.Payload = tmp43
		case MinecraftNbt_Tag__Int:
			tmp44, err := this._io.ReadS4be()
			if err != nil {
				return err
			}
			this.Payload = tmp44
		case MinecraftNbt_Tag__ByteArray:
			tmp45 := NewMinecraftNbt_TagByteArray()
			err = tmp45.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Payload = tmp45
		case MinecraftNbt_Tag__Byte:
			tmp46, err := this._io.ReadS1()
			if err != nil {
				return err
			}
			this.Payload = tmp46
		case MinecraftNbt_Tag__IntArray:
			tmp47 := NewMinecraftNbt_TagIntArray()
			err = tmp47.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Payload = tmp47
		case MinecraftNbt_Tag__String:
			tmp48 := NewMinecraftNbt_TagString()
			err = tmp48.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Payload = tmp48
		case MinecraftNbt_Tag__Long:
			tmp49, err := this._io.ReadS8be()
			if err != nil {
				return err
			}
			this.Payload = tmp49
		}
	}
	return err
}
func (this *MinecraftNbt_NamedTag) IsTagEnd() (v bool, err error) {
	if (this._f_isTagEnd) {
		return this.isTagEnd, nil
	}
	this.isTagEnd = bool(this.Type == MinecraftNbt_Tag__End)
	this._f_isTagEnd = true
	return this.isTagEnd, nil
}