// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


type MachO_MagicType int
const (
	MachO_MagicType__FatLe MachO_MagicType = 3199925962
	MachO_MagicType__FatBe MachO_MagicType = 3405691582
	MachO_MagicType__MachoLeX86 MachO_MagicType = 3472551422
	MachO_MagicType__MachoLeX64 MachO_MagicType = 3489328638
	MachO_MagicType__MachoBeX86 MachO_MagicType = 4277009102
	MachO_MagicType__MachoBeX64 MachO_MagicType = 4277009103
)

type MachO_CpuType int
const (
	MachO_CpuType__Vax MachO_CpuType = 1
	MachO_CpuType__Romp MachO_CpuType = 2
	MachO_CpuType__Ns32032 MachO_CpuType = 4
	MachO_CpuType__Ns32332 MachO_CpuType = 5
	MachO_CpuType__I386 MachO_CpuType = 7
	MachO_CpuType__Mips MachO_CpuType = 8
	MachO_CpuType__Ns32532 MachO_CpuType = 9
	MachO_CpuType__Hppa MachO_CpuType = 11
	MachO_CpuType__Arm MachO_CpuType = 12
	MachO_CpuType__Mc88000 MachO_CpuType = 13
	MachO_CpuType__Sparc MachO_CpuType = 14
	MachO_CpuType__I860 MachO_CpuType = 15
	MachO_CpuType__I860Little MachO_CpuType = 16
	MachO_CpuType__Rs6000 MachO_CpuType = 17
	MachO_CpuType__Powerpc MachO_CpuType = 18
	MachO_CpuType__Abi64 MachO_CpuType = 16777216
	MachO_CpuType__X8664 MachO_CpuType = 16777223
	MachO_CpuType__Arm64 MachO_CpuType = 16777228
	MachO_CpuType__Powerpc64 MachO_CpuType = 16777234
	MachO_CpuType__Any MachO_CpuType = 4294967295
)

type MachO_FileType int
const (
	MachO_FileType__Object MachO_FileType = 1
	MachO_FileType__Execute MachO_FileType = 2
	MachO_FileType__Fvmlib MachO_FileType = 3
	MachO_FileType__Core MachO_FileType = 4
	MachO_FileType__Preload MachO_FileType = 5
	MachO_FileType__Dylib MachO_FileType = 6
	MachO_FileType__Dylinker MachO_FileType = 7
	MachO_FileType__Bundle MachO_FileType = 8
	MachO_FileType__DylibStub MachO_FileType = 9
	MachO_FileType__Dsym MachO_FileType = 10
	MachO_FileType__KextBundle MachO_FileType = 11
)

type MachO_LoadCommandType int
const (
	MachO_LoadCommandType__Segment MachO_LoadCommandType = 1
	MachO_LoadCommandType__Symtab MachO_LoadCommandType = 2
	MachO_LoadCommandType__Symseg MachO_LoadCommandType = 3
	MachO_LoadCommandType__Thread MachO_LoadCommandType = 4
	MachO_LoadCommandType__UnixThread MachO_LoadCommandType = 5
	MachO_LoadCommandType__LoadFvmLib MachO_LoadCommandType = 6
	MachO_LoadCommandType__IdFvmLib MachO_LoadCommandType = 7
	MachO_LoadCommandType__Ident MachO_LoadCommandType = 8
	MachO_LoadCommandType__FvmFile MachO_LoadCommandType = 9
	MachO_LoadCommandType__Prepage MachO_LoadCommandType = 10
	MachO_LoadCommandType__Dysymtab MachO_LoadCommandType = 11
	MachO_LoadCommandType__LoadDylib MachO_LoadCommandType = 12
	MachO_LoadCommandType__IdDylib MachO_LoadCommandType = 13
	MachO_LoadCommandType__LoadDylinker MachO_LoadCommandType = 14
	MachO_LoadCommandType__IdDylinker MachO_LoadCommandType = 15
	MachO_LoadCommandType__PreboundDylib MachO_LoadCommandType = 16
	MachO_LoadCommandType__Routines MachO_LoadCommandType = 17
	MachO_LoadCommandType__SubFramework MachO_LoadCommandType = 18
	MachO_LoadCommandType__SubUmbrella MachO_LoadCommandType = 19
	MachO_LoadCommandType__SubClient MachO_LoadCommandType = 20
	MachO_LoadCommandType__SubLibrary MachO_LoadCommandType = 21
	MachO_LoadCommandType__TwolevelHints MachO_LoadCommandType = 22
	MachO_LoadCommandType__PrebindCksum MachO_LoadCommandType = 23
	MachO_LoadCommandType__Segment64 MachO_LoadCommandType = 25
	MachO_LoadCommandType__Routines64 MachO_LoadCommandType = 26
	MachO_LoadCommandType__Uuid MachO_LoadCommandType = 27
	MachO_LoadCommandType__CodeSignature MachO_LoadCommandType = 29
	MachO_LoadCommandType__SegmentSplitInfo MachO_LoadCommandType = 30
	MachO_LoadCommandType__LazyLoadDylib MachO_LoadCommandType = 32
	MachO_LoadCommandType__EncryptionInfo MachO_LoadCommandType = 33
	MachO_LoadCommandType__DyldInfo MachO_LoadCommandType = 34
	MachO_LoadCommandType__VersionMinMacosx MachO_LoadCommandType = 36
	MachO_LoadCommandType__VersionMinIphoneos MachO_LoadCommandType = 37
	MachO_LoadCommandType__FunctionStarts MachO_LoadCommandType = 38
	MachO_LoadCommandType__DyldEnvironment MachO_LoadCommandType = 39
	MachO_LoadCommandType__DataInCode MachO_LoadCommandType = 41
	MachO_LoadCommandType__SourceVersion MachO_LoadCommandType = 42
	MachO_LoadCommandType__DylibCodeSignDrs MachO_LoadCommandType = 43
	MachO_LoadCommandType__EncryptionInfo64 MachO_LoadCommandType = 44
	MachO_LoadCommandType__LinkerOption MachO_LoadCommandType = 45
	MachO_LoadCommandType__LinkerOptimizationHint MachO_LoadCommandType = 46
	MachO_LoadCommandType__VersionMinTvos MachO_LoadCommandType = 47
	MachO_LoadCommandType__VersionMinWatchos MachO_LoadCommandType = 48
	MachO_LoadCommandType__BuildVersion MachO_LoadCommandType = 50
	MachO_LoadCommandType__ReqDyld MachO_LoadCommandType = 2147483648
	MachO_LoadCommandType__LoadWeakDylib MachO_LoadCommandType = 2147483672
	MachO_LoadCommandType__Rpath MachO_LoadCommandType = 2147483676
	MachO_LoadCommandType__ReexportDylib MachO_LoadCommandType = 2147483679
	MachO_LoadCommandType__DyldInfoOnly MachO_LoadCommandType = 2147483682
	MachO_LoadCommandType__LoadUpwardDylib MachO_LoadCommandType = 2147483683
	MachO_LoadCommandType__Main MachO_LoadCommandType = 2147483688
)
type MachO struct {
	Magic MachO_MagicType
	Header *MachO_MachHeader
	LoadCommands []*MachO_LoadCommand
	_io *kaitai.Stream
	_root *MachO
	_parent interface{}
}
func NewMachO() *MachO {
	return &MachO{
	}
}

func (this *MachO) Read(io *kaitai.Stream, parent interface{}, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Magic = MachO_MagicType(tmp1)
	tmp2 := NewMachO_MachHeader()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp2
	this.LoadCommands = make([]*MachO_LoadCommand, this.Header.Ncmds)
	for i := range this.LoadCommands {
		tmp3 := NewMachO_LoadCommand()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.LoadCommands[i] = tmp3
	}
	return err
}
type MachO_RpathCommand struct {
	PathOffset uint32
	Path string
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_RpathCommand() *MachO_RpathCommand {
	return &MachO_RpathCommand{
	}
}

func (this *MachO_RpathCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.PathOffset = uint32(tmp4)
	tmp5, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Path = string(tmp5)
	return err
}
type MachO_Uleb128 struct {
	B1 uint8
	B2 uint8
	B3 uint8
	B4 uint8
	B5 uint8
	B6 uint8
	B7 uint8
	B8 uint8
	B9 uint8
	B10 uint8
	_io *kaitai.Stream
	_root *MachO
	_parent interface{}
	_f_value bool
	value int
}
func NewMachO_Uleb128() *MachO_Uleb128 {
	return &MachO_Uleb128{
	}
}

func (this *MachO_Uleb128) Read(io *kaitai.Stream, parent interface{}, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B1 = tmp6
	if ((this.B1 & 128) != 0) {
		tmp7, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.B2 = tmp7
	}
	if ((this.B2 & 128) != 0) {
		tmp8, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.B3 = tmp8
	}
	if ((this.B3 & 128) != 0) {
		tmp9, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.B4 = tmp9
	}
	if ((this.B4 & 128) != 0) {
		tmp10, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.B5 = tmp10
	}
	if ((this.B5 & 128) != 0) {
		tmp11, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.B6 = tmp11
	}
	if ((this.B6 & 128) != 0) {
		tmp12, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.B7 = tmp12
	}
	if ((this.B7 & 128) != 0) {
		tmp13, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.B8 = tmp13
	}
	if ((this.B8 & 128) != 0) {
		tmp14, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.B9 = tmp14
	}
	if ((this.B9 & 128) != 0) {
		tmp15, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.B10 = tmp15
	}
	return err
}
func (this *MachO_Uleb128) Value() (v int, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	tmp16 := this.B1 % 128
	if tmp16 < 0 {
		tmp16 += 128
	}
	var tmp17 int8;
	if ((this.B1 & 128) == 0) {
		tmp17 = 0
	} else {
		tmp18 := this.B2 % 128
		if tmp18 < 0 {
			tmp18 += 128
		}
		var tmp19 int8;
		if ((this.B2 & 128) == 0) {
			tmp19 = 0
		} else {
			tmp20 := this.B3 % 128
			if tmp20 < 0 {
				tmp20 += 128
			}
			var tmp21 int8;
			if ((this.B3 & 128) == 0) {
				tmp21 = 0
			} else {
				tmp22 := this.B4 % 128
				if tmp22 < 0 {
					tmp22 += 128
				}
				var tmp23 int8;
				if ((this.B4 & 128) == 0) {
					tmp23 = 0
				} else {
					tmp24 := this.B5 % 128
					if tmp24 < 0 {
						tmp24 += 128
					}
					var tmp25 int8;
					if ((this.B5 & 128) == 0) {
						tmp25 = 0
					} else {
						tmp26 := this.B6 % 128
						if tmp26 < 0 {
							tmp26 += 128
						}
						var tmp27 int8;
						if ((this.B6 & 128) == 0) {
							tmp27 = 0
						} else {
							tmp28 := this.B7 % 128
							if tmp28 < 0 {
								tmp28 += 128
							}
							var tmp29 int8;
							if ((this.B7 & 128) == 0) {
								tmp29 = 0
							} else {
								tmp30 := this.B8 % 128
								if tmp30 < 0 {
									tmp30 += 128
								}
								var tmp31 int8;
								if ((this.B8 & 128) == 0) {
									tmp31 = 0
								} else {
									tmp32 := this.B9 % 128
									if tmp32 < 0 {
										tmp32 += 128
									}
									var tmp33 int8;
									if ((this.B8 & 128) == 0) {
										tmp33 = 0
									} else {
										tmp34 := this.B10 % 128
										if tmp34 < 0 {
											tmp34 += 128
										}
										tmp33 = (tmp34 << 63)
									}
									tmp31 = ((tmp32 << 56) + tmp33)
								}
								tmp29 = ((tmp30 << 49) + tmp31)
							}
							tmp27 = ((tmp28 << 42) + tmp29)
						}
						tmp25 = ((tmp26 << 35) + tmp27)
					}
					tmp23 = ((tmp24 << 28) + tmp25)
				}
				tmp21 = ((tmp22 << 21) + tmp23)
			}
			tmp19 = ((tmp20 << 14) + tmp21)
		}
		tmp17 = ((tmp18 << 7) + tmp19)
	}
	this.value = int(((tmp16 << 0) + tmp17))
	this._f_value = true
	return this.value, nil
}
type MachO_SourceVersionCommand struct {
	Version uint64
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_SourceVersionCommand() *MachO_SourceVersionCommand {
	return &MachO_SourceVersionCommand{
	}
}

func (this *MachO_SourceVersionCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp35, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Version = uint64(tmp35)
	return err
}

type MachO_CsBlob_CsMagic int
const (
	MachO_CsBlob_CsMagic__BlobWrapper MachO_CsBlob_CsMagic = 4208855809
	MachO_CsBlob_CsMagic__Requirement MachO_CsBlob_CsMagic = 4208856064
	MachO_CsBlob_CsMagic__Requirements MachO_CsBlob_CsMagic = 4208856065
	MachO_CsBlob_CsMagic__CodeDirectory MachO_CsBlob_CsMagic = 4208856066
	MachO_CsBlob_CsMagic__EmbeddedSignature MachO_CsBlob_CsMagic = 4208856256
	MachO_CsBlob_CsMagic__DetachedSignature MachO_CsBlob_CsMagic = 4208856257
	MachO_CsBlob_CsMagic__Entitlement MachO_CsBlob_CsMagic = 4208882033
)
type MachO_CsBlob struct {
	Magic MachO_CsBlob_CsMagic
	Length uint32
	Body interface{}
	_io *kaitai.Stream
	_root *MachO
	_parent interface{}
	_raw_Body []byte
}
func NewMachO_CsBlob() *MachO_CsBlob {
	return &MachO_CsBlob{
	}
}

func (this *MachO_CsBlob) Read(io *kaitai.Stream, parent interface{}, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp36, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Magic = MachO_CsBlob_CsMagic(tmp36)
	tmp37, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp37)
	switch (this.Magic) {
	case MachO_CsBlob_CsMagic__Requirement:
		tmp38, err := this._io.ReadBytes(int((this.Length - 8)))
		if err != nil {
			return err
		}
		tmp38 = tmp38
		this._raw_Body = tmp38
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp39 := NewMachO_CsBlob_Requirement()
		err = tmp39.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp39
	case MachO_CsBlob_CsMagic__CodeDirectory:
		tmp40, err := this._io.ReadBytes(int((this.Length - 8)))
		if err != nil {
			return err
		}
		tmp40 = tmp40
		this._raw_Body = tmp40
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp41 := NewMachO_CsBlob_CodeDirectory()
		err = tmp41.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp41
	case MachO_CsBlob_CsMagic__Entitlement:
		tmp42, err := this._io.ReadBytes(int((this.Length - 8)))
		if err != nil {
			return err
		}
		tmp42 = tmp42
		this._raw_Body = tmp42
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp43 := NewMachO_CsBlob_Entitlement()
		err = tmp43.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp43
	case MachO_CsBlob_CsMagic__Requirements:
		tmp44, err := this._io.ReadBytes(int((this.Length - 8)))
		if err != nil {
			return err
		}
		tmp44 = tmp44
		this._raw_Body = tmp44
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp45 := NewMachO_CsBlob_Requirements()
		err = tmp45.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp45
	case MachO_CsBlob_CsMagic__BlobWrapper:
		tmp46, err := this._io.ReadBytes(int((this.Length - 8)))
		if err != nil {
			return err
		}
		tmp46 = tmp46
		this._raw_Body = tmp46
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp47 := NewMachO_CsBlob_BlobWrapper()
		err = tmp47.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp47
	case MachO_CsBlob_CsMagic__EmbeddedSignature:
		tmp48, err := this._io.ReadBytes(int((this.Length - 8)))
		if err != nil {
			return err
		}
		tmp48 = tmp48
		this._raw_Body = tmp48
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp49 := NewMachO_CsBlob_SuperBlob()
		err = tmp49.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp49
	case MachO_CsBlob_CsMagic__DetachedSignature:
		tmp50, err := this._io.ReadBytes(int((this.Length - 8)))
		if err != nil {
			return err
		}
		tmp50 = tmp50
		this._raw_Body = tmp50
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp51 := NewMachO_CsBlob_SuperBlob()
		err = tmp51.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp51
	default:
		tmp52, err := this._io.ReadBytes(int((this.Length - 8)))
		if err != nil {
			return err
		}
		tmp52 = tmp52
		this._raw_Body = tmp52
	}
	return err
}
type MachO_CsBlob_Entitlement struct {
	Data []byte
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob
}
func NewMachO_CsBlob_Entitlement() *MachO_CsBlob_Entitlement {
	return &MachO_CsBlob_Entitlement{
	}
}

func (this *MachO_CsBlob_Entitlement) Read(io *kaitai.Stream, parent *MachO_CsBlob, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp53, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp53 = tmp53
	this.Data = tmp53
	return err
}
type MachO_CsBlob_CodeDirectory struct {
	Version uint32
	Flags uint32
	HashOffset uint32
	IdentOffset uint32
	NSpecialSlots uint32
	NCodeSlots uint32
	CodeLimit uint32
	HashSize uint8
	HashType uint8
	Spare1 uint8
	PageSize uint8
	Spare2 uint32
	ScatterOffset uint32
	TeamIdOffset uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob
	_f_ident bool
	ident string
	_f_teamId bool
	teamId string
	_f_hashes bool
	hashes [][]byte
}
func NewMachO_CsBlob_CodeDirectory() *MachO_CsBlob_CodeDirectory {
	return &MachO_CsBlob_CodeDirectory{
	}
}

func (this *MachO_CsBlob_CodeDirectory) Read(io *kaitai.Stream, parent *MachO_CsBlob, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp54, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp54)
	tmp55, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp55)
	tmp56, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.HashOffset = uint32(tmp56)
	tmp57, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.IdentOffset = uint32(tmp57)
	tmp58, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NSpecialSlots = uint32(tmp58)
	tmp59, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NCodeSlots = uint32(tmp59)
	tmp60, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.CodeLimit = uint32(tmp60)
	tmp61, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HashSize = tmp61
	tmp62, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HashType = tmp62
	tmp63, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Spare1 = tmp63
	tmp64, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.PageSize = tmp64
	tmp65, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Spare2 = uint32(tmp65)
	if (this.Version >= 131328) {
		tmp66, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.ScatterOffset = uint32(tmp66)
	}
	if (this.Version >= 131584) {
		tmp67, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.TeamIdOffset = uint32(tmp67)
	}
	return err
}
func (this *MachO_CsBlob_CodeDirectory) Ident() (v string, err error) {
	if (this._f_ident) {
		return this.ident, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return "", err
	}
	_, err = this._io.Seek(int64((this.IdentOffset - 8)), io.SeekStart)
	if err != nil {
		return "", err
	}
	tmp68, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return "", err
	}
	this.ident = string(tmp68)
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_ident = true
	this._f_ident = true
	return this.ident, nil
}
func (this *MachO_CsBlob_CodeDirectory) TeamId() (v string, err error) {
	if (this._f_teamId) {
		return this.teamId, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return "", err
	}
	_, err = this._io.Seek(int64((this.TeamIdOffset - 8)), io.SeekStart)
	if err != nil {
		return "", err
	}
	tmp69, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return "", err
	}
	this.teamId = string(tmp69)
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_teamId = true
	this._f_teamId = true
	return this.teamId, nil
}
func (this *MachO_CsBlob_CodeDirectory) Hashes() (v [][]byte, err error) {
	if (this._f_hashes) {
		return this.hashes, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(((this.HashOffset - 8) - (this.HashSize * this.NSpecialSlots))), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.hashes = make([][]byte, (this.NSpecialSlots + this.NCodeSlots))
	for i := range this.hashes {
		tmp70, err := this._io.ReadBytes(int(this.HashSize))
		if err != nil {
			return nil, err
		}
		tmp70 = tmp70
		this.hashes[i] = tmp70
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_hashes = true
	this._f_hashes = true
	return this.hashes, nil
}
type MachO_CsBlob_Data struct {
	Length uint32
	Value []byte
	Padding []byte
	_io *kaitai.Stream
	_root *MachO
	_parent interface{}
}
func NewMachO_CsBlob_Data() *MachO_CsBlob_Data {
	return &MachO_CsBlob_Data{
	}
}

func (this *MachO_CsBlob_Data) Read(io *kaitai.Stream, parent interface{}, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp71, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp71)
	tmp72, err := this._io.ReadBytes(int(this.Length))
	if err != nil {
		return err
	}
	tmp72 = tmp72
	this.Value = tmp72
	tmp73, err := this._io.ReadBytes(int((4 - (this.Length & 3))))
	if err != nil {
		return err
	}
	tmp73 = tmp73
	this.Padding = tmp73
	return err
}
type MachO_CsBlob_SuperBlob struct {
	Count uint32
	Blobs []*MachO_CsBlob_BlobIndex
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob
}
func NewMachO_CsBlob_SuperBlob() *MachO_CsBlob_SuperBlob {
	return &MachO_CsBlob_SuperBlob{
	}
}

func (this *MachO_CsBlob_SuperBlob) Read(io *kaitai.Stream, parent *MachO_CsBlob, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp74, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Count = uint32(tmp74)
	this.Blobs = make([]*MachO_CsBlob_BlobIndex, this.Count)
	for i := range this.Blobs {
		tmp75 := NewMachO_CsBlob_BlobIndex()
		err = tmp75.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Blobs[i] = tmp75
	}
	return err
}

type MachO_CsBlob_Expr_OpEnum int
const (
	MachO_CsBlob_Expr_OpEnum__False MachO_CsBlob_Expr_OpEnum = 0
	MachO_CsBlob_Expr_OpEnum__True MachO_CsBlob_Expr_OpEnum = 1
	MachO_CsBlob_Expr_OpEnum__Ident MachO_CsBlob_Expr_OpEnum = 2
	MachO_CsBlob_Expr_OpEnum__AppleAnchor MachO_CsBlob_Expr_OpEnum = 3
	MachO_CsBlob_Expr_OpEnum__AnchorHash MachO_CsBlob_Expr_OpEnum = 4
	MachO_CsBlob_Expr_OpEnum__InfoKeyValue MachO_CsBlob_Expr_OpEnum = 5
	MachO_CsBlob_Expr_OpEnum__AndOp MachO_CsBlob_Expr_OpEnum = 6
	MachO_CsBlob_Expr_OpEnum__OrOp MachO_CsBlob_Expr_OpEnum = 7
	MachO_CsBlob_Expr_OpEnum__CdHash MachO_CsBlob_Expr_OpEnum = 8
	MachO_CsBlob_Expr_OpEnum__NotOp MachO_CsBlob_Expr_OpEnum = 9
	MachO_CsBlob_Expr_OpEnum__InfoKeyField MachO_CsBlob_Expr_OpEnum = 10
	MachO_CsBlob_Expr_OpEnum__CertField MachO_CsBlob_Expr_OpEnum = 11
	MachO_CsBlob_Expr_OpEnum__TrustedCert MachO_CsBlob_Expr_OpEnum = 12
	MachO_CsBlob_Expr_OpEnum__TrustedCerts MachO_CsBlob_Expr_OpEnum = 13
	MachO_CsBlob_Expr_OpEnum__CertGeneric MachO_CsBlob_Expr_OpEnum = 14
	MachO_CsBlob_Expr_OpEnum__AppleGenericAnchor MachO_CsBlob_Expr_OpEnum = 15
	MachO_CsBlob_Expr_OpEnum__EntitlementField MachO_CsBlob_Expr_OpEnum = 16
)

type MachO_CsBlob_Expr_CertSlot int
const (
	MachO_CsBlob_Expr_CertSlot__LeftCert MachO_CsBlob_Expr_CertSlot = 0
	MachO_CsBlob_Expr_CertSlot__AnchorCert MachO_CsBlob_Expr_CertSlot = 4294967295
)
type MachO_CsBlob_Expr struct {
	Op MachO_CsBlob_Expr_OpEnum
	Data interface{}
	_io *kaitai.Stream
	_root *MachO
	_parent interface{}
}
func NewMachO_CsBlob_Expr() *MachO_CsBlob_Expr {
	return &MachO_CsBlob_Expr{
	}
}

func (this *MachO_CsBlob_Expr) Read(io *kaitai.Stream, parent interface{}, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp76, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Op = MachO_CsBlob_Expr_OpEnum(tmp76)
	switch (this.Op) {
	case MachO_CsBlob_Expr_OpEnum__Ident:
		tmp77 := NewMachO_CsBlob_Expr_IdentExpr()
		err = tmp77.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp77
	case MachO_CsBlob_Expr_OpEnum__OrOp:
		tmp78 := NewMachO_CsBlob_Expr_OrExpr()
		err = tmp78.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp78
	case MachO_CsBlob_Expr_OpEnum__InfoKeyValue:
		tmp79 := NewMachO_CsBlob_Data()
		err = tmp79.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp79
	case MachO_CsBlob_Expr_OpEnum__AnchorHash:
		tmp80 := NewMachO_CsBlob_Expr_AnchorHashExpr()
		err = tmp80.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp80
	case MachO_CsBlob_Expr_OpEnum__InfoKeyField:
		tmp81 := NewMachO_CsBlob_Expr_InfoKeyFieldExpr()
		err = tmp81.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp81
	case MachO_CsBlob_Expr_OpEnum__NotOp:
		tmp82 := NewMachO_CsBlob_Expr()
		err = tmp82.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp82
	case MachO_CsBlob_Expr_OpEnum__EntitlementField:
		tmp83 := NewMachO_CsBlob_Expr_EntitlementFieldExpr()
		err = tmp83.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp83
	case MachO_CsBlob_Expr_OpEnum__TrustedCert:
		tmp84 := NewMachO_CsBlob_Expr_CertSlotExpr()
		err = tmp84.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp84
	case MachO_CsBlob_Expr_OpEnum__AndOp:
		tmp85 := NewMachO_CsBlob_Expr_AndExpr()
		err = tmp85.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp85
	case MachO_CsBlob_Expr_OpEnum__CertGeneric:
		tmp86 := NewMachO_CsBlob_Expr_CertGenericExpr()
		err = tmp86.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp86
	case MachO_CsBlob_Expr_OpEnum__CertField:
		tmp87 := NewMachO_CsBlob_Expr_CertFieldExpr()
		err = tmp87.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp87
	case MachO_CsBlob_Expr_OpEnum__CdHash:
		tmp88 := NewMachO_CsBlob_Data()
		err = tmp88.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp88
	case MachO_CsBlob_Expr_OpEnum__AppleGenericAnchor:
		tmp89 := NewMachO_CsBlob_Expr_AppleGenericAnchorExpr()
		err = tmp89.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp89
	}
	return err
}
type MachO_CsBlob_Expr_InfoKeyFieldExpr struct {
	Data *MachO_CsBlob_Data
	Match *MachO_CsBlob_Match
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_Expr
}
func NewMachO_CsBlob_Expr_InfoKeyFieldExpr() *MachO_CsBlob_Expr_InfoKeyFieldExpr {
	return &MachO_CsBlob_Expr_InfoKeyFieldExpr{
	}
}

func (this *MachO_CsBlob_Expr_InfoKeyFieldExpr) Read(io *kaitai.Stream, parent *MachO_CsBlob_Expr, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp90 := NewMachO_CsBlob_Data()
	err = tmp90.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Data = tmp90
	tmp91 := NewMachO_CsBlob_Match()
	err = tmp91.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Match = tmp91
	return err
}
type MachO_CsBlob_Expr_CertSlotExpr struct {
	Value MachO_CsBlob_Expr_CertSlot
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_Expr
}
func NewMachO_CsBlob_Expr_CertSlotExpr() *MachO_CsBlob_Expr_CertSlotExpr {
	return &MachO_CsBlob_Expr_CertSlotExpr{
	}
}

func (this *MachO_CsBlob_Expr_CertSlotExpr) Read(io *kaitai.Stream, parent *MachO_CsBlob_Expr, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp92, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Value = MachO_CsBlob_Expr_CertSlot(tmp92)
	return err
}
type MachO_CsBlob_Expr_CertGenericExpr struct {
	CertSlot MachO_CsBlob_Expr_CertSlot
	Data *MachO_CsBlob_Data
	Match *MachO_CsBlob_Match
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_Expr
}
func NewMachO_CsBlob_Expr_CertGenericExpr() *MachO_CsBlob_Expr_CertGenericExpr {
	return &MachO_CsBlob_Expr_CertGenericExpr{
	}
}

func (this *MachO_CsBlob_Expr_CertGenericExpr) Read(io *kaitai.Stream, parent *MachO_CsBlob_Expr, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp93, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.CertSlot = MachO_CsBlob_Expr_CertSlot(tmp93)
	tmp94 := NewMachO_CsBlob_Data()
	err = tmp94.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Data = tmp94
	tmp95 := NewMachO_CsBlob_Match()
	err = tmp95.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Match = tmp95
	return err
}
type MachO_CsBlob_Expr_IdentExpr struct {
	Identifier *MachO_CsBlob_Data
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_Expr
}
func NewMachO_CsBlob_Expr_IdentExpr() *MachO_CsBlob_Expr_IdentExpr {
	return &MachO_CsBlob_Expr_IdentExpr{
	}
}

func (this *MachO_CsBlob_Expr_IdentExpr) Read(io *kaitai.Stream, parent *MachO_CsBlob_Expr, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp96 := NewMachO_CsBlob_Data()
	err = tmp96.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Identifier = tmp96
	return err
}
type MachO_CsBlob_Expr_CertFieldExpr struct {
	CertSlot MachO_CsBlob_Expr_CertSlot
	Data *MachO_CsBlob_Data
	Match *MachO_CsBlob_Match
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_Expr
}
func NewMachO_CsBlob_Expr_CertFieldExpr() *MachO_CsBlob_Expr_CertFieldExpr {
	return &MachO_CsBlob_Expr_CertFieldExpr{
	}
}

func (this *MachO_CsBlob_Expr_CertFieldExpr) Read(io *kaitai.Stream, parent *MachO_CsBlob_Expr, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp97, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.CertSlot = MachO_CsBlob_Expr_CertSlot(tmp97)
	tmp98 := NewMachO_CsBlob_Data()
	err = tmp98.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Data = tmp98
	tmp99 := NewMachO_CsBlob_Match()
	err = tmp99.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Match = tmp99
	return err
}
type MachO_CsBlob_Expr_AnchorHashExpr struct {
	CertSlot MachO_CsBlob_Expr_CertSlot
	Data *MachO_CsBlob_Data
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_Expr
}
func NewMachO_CsBlob_Expr_AnchorHashExpr() *MachO_CsBlob_Expr_AnchorHashExpr {
	return &MachO_CsBlob_Expr_AnchorHashExpr{
	}
}

func (this *MachO_CsBlob_Expr_AnchorHashExpr) Read(io *kaitai.Stream, parent *MachO_CsBlob_Expr, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp100, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.CertSlot = MachO_CsBlob_Expr_CertSlot(tmp100)
	tmp101 := NewMachO_CsBlob_Data()
	err = tmp101.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Data = tmp101
	return err
}
type MachO_CsBlob_Expr_AppleGenericAnchorExpr struct {
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_Expr
	_f_value bool
	value string
}
func NewMachO_CsBlob_Expr_AppleGenericAnchorExpr() *MachO_CsBlob_Expr_AppleGenericAnchorExpr {
	return &MachO_CsBlob_Expr_AppleGenericAnchorExpr{
	}
}

func (this *MachO_CsBlob_Expr_AppleGenericAnchorExpr) Read(io *kaitai.Stream, parent *MachO_CsBlob_Expr, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *MachO_CsBlob_Expr_AppleGenericAnchorExpr) Value() (v string, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	this.value = string("anchor apple generic")
	this._f_value = true
	return this.value, nil
}
type MachO_CsBlob_Expr_EntitlementFieldExpr struct {
	Data *MachO_CsBlob_Data
	Match *MachO_CsBlob_Match
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_Expr
}
func NewMachO_CsBlob_Expr_EntitlementFieldExpr() *MachO_CsBlob_Expr_EntitlementFieldExpr {
	return &MachO_CsBlob_Expr_EntitlementFieldExpr{
	}
}

func (this *MachO_CsBlob_Expr_EntitlementFieldExpr) Read(io *kaitai.Stream, parent *MachO_CsBlob_Expr, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp102 := NewMachO_CsBlob_Data()
	err = tmp102.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Data = tmp102
	tmp103 := NewMachO_CsBlob_Match()
	err = tmp103.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Match = tmp103
	return err
}
type MachO_CsBlob_Expr_AndExpr struct {
	Left *MachO_CsBlob_Expr
	Right *MachO_CsBlob_Expr
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_Expr
}
func NewMachO_CsBlob_Expr_AndExpr() *MachO_CsBlob_Expr_AndExpr {
	return &MachO_CsBlob_Expr_AndExpr{
	}
}

func (this *MachO_CsBlob_Expr_AndExpr) Read(io *kaitai.Stream, parent *MachO_CsBlob_Expr, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp104 := NewMachO_CsBlob_Expr()
	err = tmp104.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Left = tmp104
	tmp105 := NewMachO_CsBlob_Expr()
	err = tmp105.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Right = tmp105
	return err
}
type MachO_CsBlob_Expr_OrExpr struct {
	Left *MachO_CsBlob_Expr
	Right *MachO_CsBlob_Expr
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_Expr
}
func NewMachO_CsBlob_Expr_OrExpr() *MachO_CsBlob_Expr_OrExpr {
	return &MachO_CsBlob_Expr_OrExpr{
	}
}

func (this *MachO_CsBlob_Expr_OrExpr) Read(io *kaitai.Stream, parent *MachO_CsBlob_Expr, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp106 := NewMachO_CsBlob_Expr()
	err = tmp106.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Left = tmp106
	tmp107 := NewMachO_CsBlob_Expr()
	err = tmp107.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Right = tmp107
	return err
}

type MachO_CsBlob_BlobIndex_CsslotType int
const (
	MachO_CsBlob_BlobIndex_CsslotType__CodeDirectory MachO_CsBlob_BlobIndex_CsslotType = 0
	MachO_CsBlob_BlobIndex_CsslotType__InfoSlot MachO_CsBlob_BlobIndex_CsslotType = 1
	MachO_CsBlob_BlobIndex_CsslotType__Requirements MachO_CsBlob_BlobIndex_CsslotType = 2
	MachO_CsBlob_BlobIndex_CsslotType__ResourceDir MachO_CsBlob_BlobIndex_CsslotType = 3
	MachO_CsBlob_BlobIndex_CsslotType__Application MachO_CsBlob_BlobIndex_CsslotType = 4
	MachO_CsBlob_BlobIndex_CsslotType__Entitlements MachO_CsBlob_BlobIndex_CsslotType = 5
	MachO_CsBlob_BlobIndex_CsslotType__AlternateCodeDirectories MachO_CsBlob_BlobIndex_CsslotType = 4096
	MachO_CsBlob_BlobIndex_CsslotType__SignatureSlot MachO_CsBlob_BlobIndex_CsslotType = 65536
)
type MachO_CsBlob_BlobIndex struct {
	Type MachO_CsBlob_BlobIndex_CsslotType
	Offset uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_SuperBlob
	_raw_blob []byte
	_f_blob bool
	blob *MachO_CsBlob
}
func NewMachO_CsBlob_BlobIndex() *MachO_CsBlob_BlobIndex {
	return &MachO_CsBlob_BlobIndex{
	}
}

func (this *MachO_CsBlob_BlobIndex) Read(io *kaitai.Stream, parent *MachO_CsBlob_SuperBlob, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp108, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Type = MachO_CsBlob_BlobIndex_CsslotType(tmp108)
	tmp109, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp109)
	return err
}
func (this *MachO_CsBlob_BlobIndex) Blob() (v *MachO_CsBlob, err error) {
	if (this._f_blob) {
		return this.blob, nil
	}
	thisIo := this._parent._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64((this.Offset - 8)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp110, err := thisIo.ReadBytesFull()
	if err != nil {
		return nil, err
	}
	tmp110 = tmp110
	this._raw_blob = tmp110
	_io__raw_blob := kaitai.NewStream(bytes.NewReader(this._raw_blob))
	tmp111 := NewMachO_CsBlob()
	err = tmp111.Read(_io__raw_blob, this, this._root)
	if err != nil {
		return nil, err
	}
	this.blob = tmp111
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_blob = true
	this._f_blob = true
	return this.blob, nil
}

type MachO_CsBlob_Match_Op int
const (
	MachO_CsBlob_Match_Op__Exists MachO_CsBlob_Match_Op = 0
	MachO_CsBlob_Match_Op__Equal MachO_CsBlob_Match_Op = 1
	MachO_CsBlob_Match_Op__Contains MachO_CsBlob_Match_Op = 2
	MachO_CsBlob_Match_Op__BeginsWith MachO_CsBlob_Match_Op = 3
	MachO_CsBlob_Match_Op__EndsWith MachO_CsBlob_Match_Op = 4
	MachO_CsBlob_Match_Op__LessThan MachO_CsBlob_Match_Op = 5
	MachO_CsBlob_Match_Op__GreaterThan MachO_CsBlob_Match_Op = 6
	MachO_CsBlob_Match_Op__LessEqual MachO_CsBlob_Match_Op = 7
	MachO_CsBlob_Match_Op__GreaterEqual MachO_CsBlob_Match_Op = 8
)
type MachO_CsBlob_Match struct {
	MatchOp MachO_CsBlob_Match_Op
	Data *MachO_CsBlob_Data
	_io *kaitai.Stream
	_root *MachO
	_parent interface{}
}
func NewMachO_CsBlob_Match() *MachO_CsBlob_Match {
	return &MachO_CsBlob_Match{
	}
}

func (this *MachO_CsBlob_Match) Read(io *kaitai.Stream, parent interface{}, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp112, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.MatchOp = MachO_CsBlob_Match_Op(tmp112)
	if (this.MatchOp != MachO_CsBlob_Match_Op__Exists) {
		tmp113 := NewMachO_CsBlob_Data()
		err = tmp113.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp113
	}
	return err
}
type MachO_CsBlob_Requirement struct {
	Kind uint32
	Expr *MachO_CsBlob_Expr
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob
}
func NewMachO_CsBlob_Requirement() *MachO_CsBlob_Requirement {
	return &MachO_CsBlob_Requirement{
	}
}

func (this *MachO_CsBlob_Requirement) Read(io *kaitai.Stream, parent *MachO_CsBlob, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp114, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Kind = uint32(tmp114)
	tmp115 := NewMachO_CsBlob_Expr()
	err = tmp115.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Expr = tmp115
	return err
}
type MachO_CsBlob_Requirements struct {
	Count uint32
	Items []*MachO_CsBlob_RequirementsBlobIndex
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob
}
func NewMachO_CsBlob_Requirements() *MachO_CsBlob_Requirements {
	return &MachO_CsBlob_Requirements{
	}
}

func (this *MachO_CsBlob_Requirements) Read(io *kaitai.Stream, parent *MachO_CsBlob, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp116, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Count = uint32(tmp116)
	this.Items = make([]*MachO_CsBlob_RequirementsBlobIndex, this.Count)
	for i := range this.Items {
		tmp117 := NewMachO_CsBlob_RequirementsBlobIndex()
		err = tmp117.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items[i] = tmp117
	}
	return err
}
type MachO_CsBlob_BlobWrapper struct {
	Data []byte
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob
}
func NewMachO_CsBlob_BlobWrapper() *MachO_CsBlob_BlobWrapper {
	return &MachO_CsBlob_BlobWrapper{
	}
}

func (this *MachO_CsBlob_BlobWrapper) Read(io *kaitai.Stream, parent *MachO_CsBlob, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp118, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp118 = tmp118
	this.Data = tmp118
	return err
}

type MachO_CsBlob_RequirementsBlobIndex_RequirementType int
const (
	MachO_CsBlob_RequirementsBlobIndex_RequirementType__Host MachO_CsBlob_RequirementsBlobIndex_RequirementType = 1
	MachO_CsBlob_RequirementsBlobIndex_RequirementType__Guest MachO_CsBlob_RequirementsBlobIndex_RequirementType = 2
	MachO_CsBlob_RequirementsBlobIndex_RequirementType__Designated MachO_CsBlob_RequirementsBlobIndex_RequirementType = 3
	MachO_CsBlob_RequirementsBlobIndex_RequirementType__Library MachO_CsBlob_RequirementsBlobIndex_RequirementType = 4
)
type MachO_CsBlob_RequirementsBlobIndex struct {
	Type MachO_CsBlob_RequirementsBlobIndex_RequirementType
	Offset uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_CsBlob_Requirements
	_f_value bool
	value *MachO_CsBlob
}
func NewMachO_CsBlob_RequirementsBlobIndex() *MachO_CsBlob_RequirementsBlobIndex {
	return &MachO_CsBlob_RequirementsBlobIndex{
	}
}

func (this *MachO_CsBlob_RequirementsBlobIndex) Read(io *kaitai.Stream, parent *MachO_CsBlob_Requirements, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp119, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Type = MachO_CsBlob_RequirementsBlobIndex_RequirementType(tmp119)
	tmp120, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp120)
	return err
}
func (this *MachO_CsBlob_RequirementsBlobIndex) Value() (v *MachO_CsBlob, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.Offset - 8)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp121 := NewMachO_CsBlob()
	err = tmp121.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.value = tmp121
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_value = true
	this._f_value = true
	return this.value, nil
}
type MachO_BuildVersionCommand struct {
	Platform uint32
	Minos uint32
	Sdk uint32
	Ntools uint32
	Tools []*MachO_BuildVersionCommand_BuildToolVersion
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_BuildVersionCommand() *MachO_BuildVersionCommand {
	return &MachO_BuildVersionCommand{
	}
}

func (this *MachO_BuildVersionCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp122, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Platform = uint32(tmp122)
	tmp123, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Minos = uint32(tmp123)
	tmp124, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Sdk = uint32(tmp124)
	tmp125, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Ntools = uint32(tmp125)
	this.Tools = make([]*MachO_BuildVersionCommand_BuildToolVersion, this.Ntools)
	for i := range this.Tools {
		tmp126 := NewMachO_BuildVersionCommand_BuildToolVersion()
		err = tmp126.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Tools[i] = tmp126
	}
	return err
}
type MachO_BuildVersionCommand_BuildToolVersion struct {
	Tool uint32
	Version uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_BuildVersionCommand
}
func NewMachO_BuildVersionCommand_BuildToolVersion() *MachO_BuildVersionCommand_BuildToolVersion {
	return &MachO_BuildVersionCommand_BuildToolVersion{
	}
}

func (this *MachO_BuildVersionCommand_BuildToolVersion) Read(io *kaitai.Stream, parent *MachO_BuildVersionCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp127, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Tool = uint32(tmp127)
	tmp128, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp128)
	return err
}
type MachO_RoutinesCommand struct {
	InitAddress uint32
	InitModule uint32
	Reserved []byte
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_RoutinesCommand() *MachO_RoutinesCommand {
	return &MachO_RoutinesCommand{
	}
}

func (this *MachO_RoutinesCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp129, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InitAddress = uint32(tmp129)
	tmp130, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.InitModule = uint32(tmp130)
	tmp131, err := this._io.ReadBytes(int(24))
	if err != nil {
		return err
	}
	tmp131 = tmp131
	this.Reserved = tmp131
	return err
}
type MachO_MachoFlags struct {
	Value uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_MachHeader
	_f_subsectionsViaSymbols bool
	subsectionsViaSymbols bool
	_f_deadStrippableDylib bool
	deadStrippableDylib bool
	_f_weakDefines bool
	weakDefines bool
	_f_prebound bool
	prebound bool
	_f_allModsBound bool
	allModsBound bool
	_f_hasTlvDescriptors bool
	hasTlvDescriptors bool
	_f_forceFlat bool
	forceFlat bool
	_f_rootSafe bool
	rootSafe bool
	_f_noUndefs bool
	noUndefs bool
	_f_setuidSafe bool
	setuidSafe bool
	_f_noHeapExecution bool
	noHeapExecution bool
	_f_noReexportedDylibs bool
	noReexportedDylibs bool
	_f_noMultiDefs bool
	noMultiDefs bool
	_f_appExtensionSafe bool
	appExtensionSafe bool
	_f_prebindable bool
	prebindable bool
	_f_incrLink bool
	incrLink bool
	_f_bindAtLoad bool
	bindAtLoad bool
	_f_canonical bool
	canonical bool
	_f_twoLevel bool
	twoLevel bool
	_f_splitSegs bool
	splitSegs bool
	_f_lazyInit bool
	lazyInit bool
	_f_allowStackExecution bool
	allowStackExecution bool
	_f_bindsToWeak bool
	bindsToWeak bool
	_f_noFixPrebinding bool
	noFixPrebinding bool
	_f_dyldLink bool
	dyldLink bool
	_f_pie bool
	pie bool
}
func NewMachO_MachoFlags(value uint32) *MachO_MachoFlags {
	return &MachO_MachoFlags{
		Value: value,
	}
}

func (this *MachO_MachoFlags) Read(io *kaitai.Stream, parent *MachO_MachHeader, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}

/**
 * safe to divide up the sections into sub-sections via symbols for dead code stripping
 */
func (this *MachO_MachoFlags) SubsectionsViaSymbols() (v bool, err error) {
	if (this._f_subsectionsViaSymbols) {
		return this.subsectionsViaSymbols, nil
	}
	this.subsectionsViaSymbols = bool((this.Value & 8192) != 0)
	this._f_subsectionsViaSymbols = true
	return this.subsectionsViaSymbols, nil
}
func (this *MachO_MachoFlags) DeadStrippableDylib() (v bool, err error) {
	if (this._f_deadStrippableDylib) {
		return this.deadStrippableDylib, nil
	}
	this.deadStrippableDylib = bool((this.Value & 4194304) != 0)
	this._f_deadStrippableDylib = true
	return this.deadStrippableDylib, nil
}

/**
 * the final linked image contains external weak symbols
 */
func (this *MachO_MachoFlags) WeakDefines() (v bool, err error) {
	if (this._f_weakDefines) {
		return this.weakDefines, nil
	}
	this.weakDefines = bool((this.Value & 32768) != 0)
	this._f_weakDefines = true
	return this.weakDefines, nil
}

/**
 * the file has its dynamic undefined references prebound.
 */
func (this *MachO_MachoFlags) Prebound() (v bool, err error) {
	if (this._f_prebound) {
		return this.prebound, nil
	}
	this.prebound = bool((this.Value & 16) != 0)
	this._f_prebound = true
	return this.prebound, nil
}

/**
 * indicates that this binary binds to all two-level namespace modules of its dependent libraries. only used when MH_PREBINDABLE and MH_TWOLEVEL are both set.
 */
func (this *MachO_MachoFlags) AllModsBound() (v bool, err error) {
	if (this._f_allModsBound) {
		return this.allModsBound, nil
	}
	this.allModsBound = bool((this.Value & 4096) != 0)
	this._f_allModsBound = true
	return this.allModsBound, nil
}
func (this *MachO_MachoFlags) HasTlvDescriptors() (v bool, err error) {
	if (this._f_hasTlvDescriptors) {
		return this.hasTlvDescriptors, nil
	}
	this.hasTlvDescriptors = bool((this.Value & 8388608) != 0)
	this._f_hasTlvDescriptors = true
	return this.hasTlvDescriptors, nil
}

/**
 * the executable is forcing all images to use flat name space bindings
 */
func (this *MachO_MachoFlags) ForceFlat() (v bool, err error) {
	if (this._f_forceFlat) {
		return this.forceFlat, nil
	}
	this.forceFlat = bool((this.Value & 256) != 0)
	this._f_forceFlat = true
	return this.forceFlat, nil
}

/**
 * When this bit is set, the binary declares it is safe for use in processes with uid zero
 */
func (this *MachO_MachoFlags) RootSafe() (v bool, err error) {
	if (this._f_rootSafe) {
		return this.rootSafe, nil
	}
	this.rootSafe = bool((this.Value & 262144) != 0)
	this._f_rootSafe = true
	return this.rootSafe, nil
}

/**
 * the object file has no undefined references
 */
func (this *MachO_MachoFlags) NoUndefs() (v bool, err error) {
	if (this._f_noUndefs) {
		return this.noUndefs, nil
	}
	this.noUndefs = bool((this.Value & 1) != 0)
	this._f_noUndefs = true
	return this.noUndefs, nil
}

/**
 * When this bit is set, the binary declares it is safe for use in processes when issetugid() is true
 */
func (this *MachO_MachoFlags) SetuidSafe() (v bool, err error) {
	if (this._f_setuidSafe) {
		return this.setuidSafe, nil
	}
	this.setuidSafe = bool((this.Value & 524288) != 0)
	this._f_setuidSafe = true
	return this.setuidSafe, nil
}
func (this *MachO_MachoFlags) NoHeapExecution() (v bool, err error) {
	if (this._f_noHeapExecution) {
		return this.noHeapExecution, nil
	}
	this.noHeapExecution = bool((this.Value & 16777216) != 0)
	this._f_noHeapExecution = true
	return this.noHeapExecution, nil
}

/**
 * When this bit is set on a dylib, the static linker does not need to examine dependent dylibs to see if any are re-exported
 */
func (this *MachO_MachoFlags) NoReexportedDylibs() (v bool, err error) {
	if (this._f_noReexportedDylibs) {
		return this.noReexportedDylibs, nil
	}
	this.noReexportedDylibs = bool((this.Value & 1048576) != 0)
	this._f_noReexportedDylibs = true
	return this.noReexportedDylibs, nil
}

/**
 * this umbrella guarantees no multiple defintions of symbols in its sub-images so the two-level namespace hints can always be used.
 */
func (this *MachO_MachoFlags) NoMultiDefs() (v bool, err error) {
	if (this._f_noMultiDefs) {
		return this.noMultiDefs, nil
	}
	this.noMultiDefs = bool((this.Value & 512) != 0)
	this._f_noMultiDefs = true
	return this.noMultiDefs, nil
}
func (this *MachO_MachoFlags) AppExtensionSafe() (v bool, err error) {
	if (this._f_appExtensionSafe) {
		return this.appExtensionSafe, nil
	}
	this.appExtensionSafe = bool((this.Value & 33554432) != 0)
	this._f_appExtensionSafe = true
	return this.appExtensionSafe, nil
}

/**
 * the binary is not prebound but can have its prebinding redone. only used when MH_PREBOUND is not set.
 */
func (this *MachO_MachoFlags) Prebindable() (v bool, err error) {
	if (this._f_prebindable) {
		return this.prebindable, nil
	}
	this.prebindable = bool((this.Value & 2048) != 0)
	this._f_prebindable = true
	return this.prebindable, nil
}

/**
 * the object file is the output of an incremental link against a base file and can't be link edited again
 */
func (this *MachO_MachoFlags) IncrLink() (v bool, err error) {
	if (this._f_incrLink) {
		return this.incrLink, nil
	}
	this.incrLink = bool((this.Value & 2) != 0)
	this._f_incrLink = true
	return this.incrLink, nil
}

/**
 * the object file's undefined references are bound by the dynamic linker when loaded.
 */
func (this *MachO_MachoFlags) BindAtLoad() (v bool, err error) {
	if (this._f_bindAtLoad) {
		return this.bindAtLoad, nil
	}
	this.bindAtLoad = bool((this.Value & 8) != 0)
	this._f_bindAtLoad = true
	return this.bindAtLoad, nil
}

/**
 * the binary has been canonicalized via the unprebind operation
 */
func (this *MachO_MachoFlags) Canonical() (v bool, err error) {
	if (this._f_canonical) {
		return this.canonical, nil
	}
	this.canonical = bool((this.Value & 16384) != 0)
	this._f_canonical = true
	return this.canonical, nil
}

/**
 * the image is using two-level name space bindings
 */
func (this *MachO_MachoFlags) TwoLevel() (v bool, err error) {
	if (this._f_twoLevel) {
		return this.twoLevel, nil
	}
	this.twoLevel = bool((this.Value & 128) != 0)
	this._f_twoLevel = true
	return this.twoLevel, nil
}

/**
 * the file has its read-only and read-write segments split
 */
func (this *MachO_MachoFlags) SplitSegs() (v bool, err error) {
	if (this._f_splitSegs) {
		return this.splitSegs, nil
	}
	this.splitSegs = bool((this.Value & 32) != 0)
	this._f_splitSegs = true
	return this.splitSegs, nil
}

/**
 * the shared library init routine is to be run lazily via catching memory faults to its writeable segments (obsolete)
 */
func (this *MachO_MachoFlags) LazyInit() (v bool, err error) {
	if (this._f_lazyInit) {
		return this.lazyInit, nil
	}
	this.lazyInit = bool((this.Value & 64) != 0)
	this._f_lazyInit = true
	return this.lazyInit, nil
}

/**
 * When this bit is set, all stacks in the task will be given stack execution privilege.  Only used in MH_EXECUTE filetypes.
 */
func (this *MachO_MachoFlags) AllowStackExecution() (v bool, err error) {
	if (this._f_allowStackExecution) {
		return this.allowStackExecution, nil
	}
	this.allowStackExecution = bool((this.Value & 131072) != 0)
	this._f_allowStackExecution = true
	return this.allowStackExecution, nil
}

/**
 * the final linked image uses weak symbols
 */
func (this *MachO_MachoFlags) BindsToWeak() (v bool, err error) {
	if (this._f_bindsToWeak) {
		return this.bindsToWeak, nil
	}
	this.bindsToWeak = bool((this.Value & 65536) != 0)
	this._f_bindsToWeak = true
	return this.bindsToWeak, nil
}

/**
 * do not have dyld notify the prebinding agent about this executable
 */
func (this *MachO_MachoFlags) NoFixPrebinding() (v bool, err error) {
	if (this._f_noFixPrebinding) {
		return this.noFixPrebinding, nil
	}
	this.noFixPrebinding = bool((this.Value & 1024) != 0)
	this._f_noFixPrebinding = true
	return this.noFixPrebinding, nil
}

/**
 * the object file is input for the dynamic linker and can't be staticly link edited again
 */
func (this *MachO_MachoFlags) DyldLink() (v bool, err error) {
	if (this._f_dyldLink) {
		return this.dyldLink, nil
	}
	this.dyldLink = bool((this.Value & 4) != 0)
	this._f_dyldLink = true
	return this.dyldLink, nil
}

/**
 * When this bit is set, the OS will load the main executable at a random address. Only used in MH_EXECUTE filetypes.
 */
func (this *MachO_MachoFlags) Pie() (v bool, err error) {
	if (this._f_pie) {
		return this.pie, nil
	}
	this.pie = bool((this.Value & 2097152) != 0)
	this._f_pie = true
	return this.pie, nil
}
type MachO_RoutinesCommand64 struct {
	InitAddress uint64
	InitModule uint64
	Reserved []byte
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_RoutinesCommand64() *MachO_RoutinesCommand64 {
	return &MachO_RoutinesCommand64{
	}
}

func (this *MachO_RoutinesCommand64) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp132, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.InitAddress = uint64(tmp132)
	tmp133, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.InitModule = uint64(tmp133)
	tmp134, err := this._io.ReadBytes(int(48))
	if err != nil {
		return err
	}
	tmp134 = tmp134
	this.Reserved = tmp134
	return err
}
type MachO_LinkerOptionCommand struct {
	NumStrings uint32
	Strings []string
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_LinkerOptionCommand() *MachO_LinkerOptionCommand {
	return &MachO_LinkerOptionCommand{
	}
}

func (this *MachO_LinkerOptionCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp135, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumStrings = uint32(tmp135)
	this.Strings = make([]string, this.NumStrings)
	for i := range this.Strings {
		tmp136, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return err
		}
		this.Strings[i] = string(tmp136)
	}
	return err
}
type MachO_SegmentCommand64 struct {
	Segname string
	Vmaddr uint64
	Vmsize uint64
	Fileoff uint64
	Filesize uint64
	Maxprot *MachO_VmProt
	Initprot *MachO_VmProt
	Nsects uint32
	Flags uint32
	Sections []*MachO_SegmentCommand64_Section64
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_SegmentCommand64() *MachO_SegmentCommand64 {
	return &MachO_SegmentCommand64{
	}
}

func (this *MachO_SegmentCommand64) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp137, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp137 = kaitai.BytesStripRight(tmp137, 0)
	this.Segname = string(tmp137)
	tmp138, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Vmaddr = uint64(tmp138)
	tmp139, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Vmsize = uint64(tmp139)
	tmp140, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Fileoff = uint64(tmp140)
	tmp141, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Filesize = uint64(tmp141)
	tmp142 := NewMachO_VmProt()
	err = tmp142.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Maxprot = tmp142
	tmp143 := NewMachO_VmProt()
	err = tmp143.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Initprot = tmp143
	tmp144, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Nsects = uint32(tmp144)
	tmp145, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp145)
	this.Sections = make([]*MachO_SegmentCommand64_Section64, this.Nsects)
	for i := range this.Sections {
		tmp146 := NewMachO_SegmentCommand64_Section64()
		err = tmp146.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Sections[i] = tmp146
	}
	return err
}
type MachO_SegmentCommand64_Section64 struct {
	SectName string
	SegName string
	Addr uint64
	Size uint64
	Offset uint32
	Align uint32
	Reloff uint32
	Nreloc uint32
	Flags uint32
	Reserved1 uint32
	Reserved2 uint32
	Reserved3 uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SegmentCommand64
	_raw_data []byte
	_f_data bool
	data interface{}
}
func NewMachO_SegmentCommand64_Section64() *MachO_SegmentCommand64_Section64 {
	return &MachO_SegmentCommand64_Section64{
	}
}

func (this *MachO_SegmentCommand64_Section64) Read(io *kaitai.Stream, parent *MachO_SegmentCommand64, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp147, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp147 = kaitai.BytesStripRight(tmp147, 0)
	this.SectName = string(tmp147)
	tmp148, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp148 = kaitai.BytesStripRight(tmp148, 0)
	this.SegName = string(tmp148)
	tmp149, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Addr = uint64(tmp149)
	tmp150, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Size = uint64(tmp150)
	tmp151, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp151)
	tmp152, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Align = uint32(tmp152)
	tmp153, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Reloff = uint32(tmp153)
	tmp154, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Nreloc = uint32(tmp154)
	tmp155, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp155)
	tmp156, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Reserved1 = uint32(tmp156)
	tmp157, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Reserved2 = uint32(tmp157)
	tmp158, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Reserved3 = uint32(tmp158)
	return err
}
func (this *MachO_SegmentCommand64_Section64) Data() (v interface{}, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.Offset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch (this.SectName) {
	case "__objc_nlclslist":
		tmp159, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp159 = tmp159
		this._raw_data = tmp159
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp160 := NewMachO_SegmentCommand64_Section64_PointerList()
		err = tmp160.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp160
	case "__objc_methname":
		tmp161, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp161 = tmp161
		this._raw_data = tmp161
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp162 := NewMachO_SegmentCommand64_Section64_StringList()
		err = tmp162.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp162
	case "__nl_symbol_ptr":
		tmp163, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp163 = tmp163
		this._raw_data = tmp163
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp164 := NewMachO_SegmentCommand64_Section64_PointerList()
		err = tmp164.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp164
	case "__la_symbol_ptr":
		tmp165, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp165 = tmp165
		this._raw_data = tmp165
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp166 := NewMachO_SegmentCommand64_Section64_PointerList()
		err = tmp166.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp166
	case "__objc_selrefs":
		tmp167, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp167 = tmp167
		this._raw_data = tmp167
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp168 := NewMachO_SegmentCommand64_Section64_PointerList()
		err = tmp168.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp168
	case "__cstring":
		tmp169, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp169 = tmp169
		this._raw_data = tmp169
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp170 := NewMachO_SegmentCommand64_Section64_StringList()
		err = tmp170.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp170
	case "__objc_classlist":
		tmp171, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp171 = tmp171
		this._raw_data = tmp171
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp172 := NewMachO_SegmentCommand64_Section64_PointerList()
		err = tmp172.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp172
	case "__objc_protolist":
		tmp173, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp173 = tmp173
		this._raw_data = tmp173
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp174 := NewMachO_SegmentCommand64_Section64_PointerList()
		err = tmp174.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp174
	case "__objc_imageinfo":
		tmp175, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp175 = tmp175
		this._raw_data = tmp175
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp176 := NewMachO_SegmentCommand64_Section64_PointerList()
		err = tmp176.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp176
	case "__objc_methtype":
		tmp177, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp177 = tmp177
		this._raw_data = tmp177
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp178 := NewMachO_SegmentCommand64_Section64_StringList()
		err = tmp178.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp178
	case "__cfstring":
		tmp179, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp179 = tmp179
		this._raw_data = tmp179
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp180 := NewMachO_SegmentCommand64_Section64_CfStringList()
		err = tmp180.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp180
	case "__objc_classrefs":
		tmp181, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp181 = tmp181
		this._raw_data = tmp181
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp182 := NewMachO_SegmentCommand64_Section64_PointerList()
		err = tmp182.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp182
	case "__objc_protorefs":
		tmp183, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp183 = tmp183
		this._raw_data = tmp183
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp184 := NewMachO_SegmentCommand64_Section64_PointerList()
		err = tmp184.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp184
	case "__objc_classname":
		tmp185, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp185 = tmp185
		this._raw_data = tmp185
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp186 := NewMachO_SegmentCommand64_Section64_StringList()
		err = tmp186.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp186
	case "__got":
		tmp187, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp187 = tmp187
		this._raw_data = tmp187
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp188 := NewMachO_SegmentCommand64_Section64_PointerList()
		err = tmp188.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp188
	case "__eh_frame":
		tmp189, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp189 = tmp189
		this._raw_data = tmp189
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp190 := NewMachO_SegmentCommand64_Section64_EhFrame()
		err = tmp190.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp190
	case "__objc_superrefs":
		tmp191, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp191 = tmp191
		this._raw_data = tmp191
		_io__raw_data := kaitai.NewStream(bytes.NewReader(this._raw_data))
		tmp192 := NewMachO_SegmentCommand64_Section64_PointerList()
		err = tmp192.Read(_io__raw_data, this, this._root)
		if err != nil {
			return nil, err
		}
		this.data = tmp192
	default:
		tmp193, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp193 = tmp193
		this._raw_data = tmp193
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_data = true
	this._f_data = true
	return this.data, nil
}
type MachO_SegmentCommand64_Section64_CfStringList struct {
	Items []*MachO_SegmentCommand64_Section64_CfString
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SegmentCommand64_Section64
}
func NewMachO_SegmentCommand64_Section64_CfStringList() *MachO_SegmentCommand64_Section64_CfStringList {
	return &MachO_SegmentCommand64_Section64_CfStringList{
	}
}

func (this *MachO_SegmentCommand64_Section64_CfStringList) Read(io *kaitai.Stream, parent *MachO_SegmentCommand64_Section64, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp194, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp194 {
			break
		}
		tmp195 := NewMachO_SegmentCommand64_Section64_CfString()
		err = tmp195.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items = append(this.Items, tmp195)
	}
	return err
}
type MachO_SegmentCommand64_Section64_CfString struct {
	Isa uint64
	Info uint64
	Data uint64
	Length uint64
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SegmentCommand64_Section64_CfStringList
}
func NewMachO_SegmentCommand64_Section64_CfString() *MachO_SegmentCommand64_Section64_CfString {
	return &MachO_SegmentCommand64_Section64_CfString{
	}
}

func (this *MachO_SegmentCommand64_Section64_CfString) Read(io *kaitai.Stream, parent *MachO_SegmentCommand64_Section64_CfStringList, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp196, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Isa = uint64(tmp196)
	tmp197, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Info = uint64(tmp197)
	tmp198, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Data = uint64(tmp198)
	tmp199, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Length = uint64(tmp199)
	return err
}
type MachO_SegmentCommand64_Section64_EhFrameItem struct {
	Length uint32
	Length64 uint64
	Id uint32
	Body interface{}
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SegmentCommand64_Section64_EhFrame
	_raw_Body []byte
}
func NewMachO_SegmentCommand64_Section64_EhFrameItem() *MachO_SegmentCommand64_Section64_EhFrameItem {
	return &MachO_SegmentCommand64_Section64_EhFrameItem{
	}
}

func (this *MachO_SegmentCommand64_Section64_EhFrameItem) Read(io *kaitai.Stream, parent *MachO_SegmentCommand64_Section64_EhFrame, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp200, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp200)
	if (this.Length == uint32(4294967295)) {
		tmp201, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Length64 = uint64(tmp201)
	}
	tmp202, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Id = uint32(tmp202)
	if (this.Length > 0) {
		switch (this.Id) {
		case 0:
			tmp203, err := this._io.ReadBytes(int((this.Length - 4)))
			if err != nil {
				return err
			}
			tmp203 = tmp203
			this._raw_Body = tmp203
			_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
			tmp204 := NewMachO_SegmentCommand64_Section64_EhFrameItem_Cie()
			err = tmp204.Read(_io__raw_Body, this, this._root)
			if err != nil {
				return err
			}
			this.Body = tmp204
		default:
			tmp205, err := this._io.ReadBytes(int((this.Length - 4)))
			if err != nil {
				return err
			}
			tmp205 = tmp205
			this._raw_Body = tmp205
		}
	}
	return err
}
type MachO_SegmentCommand64_Section64_EhFrameItem_CharChain struct {
	Chr uint8
	Next *MachO_SegmentCommand64_Section64_EhFrameItem_CharChain
	_io *kaitai.Stream
	_root *MachO
	_parent interface{}
}
func NewMachO_SegmentCommand64_Section64_EhFrameItem_CharChain() *MachO_SegmentCommand64_Section64_EhFrameItem_CharChain {
	return &MachO_SegmentCommand64_Section64_EhFrameItem_CharChain{
	}
}

func (this *MachO_SegmentCommand64_Section64_EhFrameItem_CharChain) Read(io *kaitai.Stream, parent interface{}, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp206, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Chr = tmp206
	if (this.Chr != 0) {
		tmp207 := NewMachO_SegmentCommand64_Section64_EhFrameItem_CharChain()
		err = tmp207.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Next = tmp207
	}
	return err
}
type MachO_SegmentCommand64_Section64_EhFrameItem_Cie struct {
	Version uint8
	AugStr *MachO_SegmentCommand64_Section64_EhFrameItem_CharChain
	CodeAlignmentFactor *MachO_Uleb128
	DataAlignmentFactor *MachO_Uleb128
	ReturnAddressRegister uint8
	Augmentation *MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SegmentCommand64_Section64_EhFrameItem
}
func NewMachO_SegmentCommand64_Section64_EhFrameItem_Cie() *MachO_SegmentCommand64_Section64_EhFrameItem_Cie {
	return &MachO_SegmentCommand64_Section64_EhFrameItem_Cie{
	}
}

func (this *MachO_SegmentCommand64_Section64_EhFrameItem_Cie) Read(io *kaitai.Stream, parent *MachO_SegmentCommand64_Section64_EhFrameItem, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp208, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp208
	tmp209 := NewMachO_SegmentCommand64_Section64_EhFrameItem_CharChain()
	err = tmp209.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.AugStr = tmp209
	tmp210 := NewMachO_Uleb128()
	err = tmp210.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.CodeAlignmentFactor = tmp210
	tmp211 := NewMachO_Uleb128()
	err = tmp211.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.DataAlignmentFactor = tmp211
	tmp212, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ReturnAddressRegister = tmp212
	if (this.AugStr.Chr == 122) {
		tmp213 := NewMachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry()
		err = tmp213.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Augmentation = tmp213
	}
	return err
}
type MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry struct {
	Length *MachO_Uleb128
	FdePointerEncoding uint8
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SegmentCommand64_Section64_EhFrameItem_Cie
}
func NewMachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry() *MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry {
	return &MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry{
	}
}

func (this *MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry) Read(io *kaitai.Stream, parent *MachO_SegmentCommand64_Section64_EhFrameItem_Cie, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp214 := NewMachO_Uleb128()
	err = tmp214.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Length = tmp214
	if (this._parent.AugStr.Next.Chr == 82) {
		tmp215, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.FdePointerEncoding = tmp215
	}
	return err
}
type MachO_SegmentCommand64_Section64_EhFrame struct {
	Items []*MachO_SegmentCommand64_Section64_EhFrameItem
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SegmentCommand64_Section64
}
func NewMachO_SegmentCommand64_Section64_EhFrame() *MachO_SegmentCommand64_Section64_EhFrame {
	return &MachO_SegmentCommand64_Section64_EhFrame{
	}
}

func (this *MachO_SegmentCommand64_Section64_EhFrame) Read(io *kaitai.Stream, parent *MachO_SegmentCommand64_Section64, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp216, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp216 {
			break
		}
		tmp217 := NewMachO_SegmentCommand64_Section64_EhFrameItem()
		err = tmp217.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items = append(this.Items, tmp217)
	}
	return err
}
type MachO_SegmentCommand64_Section64_PointerList struct {
	Items []uint64
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SegmentCommand64_Section64
}
func NewMachO_SegmentCommand64_Section64_PointerList() *MachO_SegmentCommand64_Section64_PointerList {
	return &MachO_SegmentCommand64_Section64_PointerList{
	}
}

func (this *MachO_SegmentCommand64_Section64_PointerList) Read(io *kaitai.Stream, parent *MachO_SegmentCommand64_Section64, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp218, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp218 {
			break
		}
		tmp219, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Items = append(this.Items, tmp219)
	}
	return err
}
type MachO_SegmentCommand64_Section64_StringList struct {
	Strings []string
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SegmentCommand64_Section64
}
func NewMachO_SegmentCommand64_Section64_StringList() *MachO_SegmentCommand64_Section64_StringList {
	return &MachO_SegmentCommand64_Section64_StringList{
	}
}

func (this *MachO_SegmentCommand64_Section64_StringList) Read(io *kaitai.Stream, parent *MachO_SegmentCommand64_Section64, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp220, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp220 {
			break
		}
		tmp221, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return err
		}
		this.Strings = append(this.Strings, string(tmp221))
	}
	return err
}
type MachO_VmProt struct {
	StripRead bool
	IsMask bool
	Reserved0 bool
	Copy bool
	NoChange bool
	Execute bool
	Write bool
	Read bool
	Reserved1 uint64
	_io *kaitai.Stream
	_root *MachO
	_parent interface{}
}
func NewMachO_VmProt() *MachO_VmProt {
	return &MachO_VmProt{
	}
}

func (this *MachO_VmProt) Read(io *kaitai.Stream, parent interface{}, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp222, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.StripRead = tmp222 != 0
	tmp223, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsMask = tmp223 != 0
	tmp224, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Reserved0 = tmp224 != 0
	tmp225, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Copy = tmp225 != 0
	tmp226, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.NoChange = tmp226 != 0
	tmp227, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Execute = tmp227 != 0
	tmp228, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Write = tmp228 != 0
	tmp229, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Read = tmp229 != 0
	tmp230, err := this._io.ReadBitsIntBe(24)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp230
	return err
}

/**
 * Special marker to support execute-only protection.
 */

/**
 * Indicates to use value as a mask against the actual protection bits.
 */

/**
 * Reserved (unused) bit.
 */

/**
 * Used when write permission can not be obtained, to mark the entry as COW.
 */

/**
 * Used only by memory_object_lock_request to indicate no change to page locks.
 */

/**
 * Execute permission.
 */

/**
 * Write permission.
 */

/**
 * Read permission.
 */

/**
 * Reserved (unused) bits.
 */
type MachO_DysymtabCommand struct {
	ILocalSym uint32
	NLocalSym uint32
	IExtDefSym uint32
	NExtDefSym uint32
	IUndefSym uint32
	NUndefSym uint32
	TocOff uint32
	NToc uint32
	ModTabOff uint32
	NModTab uint32
	ExtRefSymOff uint32
	NExtRefSyms uint32
	IndirectSymOff uint32
	NIndirectSyms uint32
	ExtRelOff uint32
	NExtRel uint32
	LocRelOff uint32
	NLocRel uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
	_f_indirectSymbols bool
	indirectSymbols []uint32
}
func NewMachO_DysymtabCommand() *MachO_DysymtabCommand {
	return &MachO_DysymtabCommand{
	}
}

func (this *MachO_DysymtabCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp231, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ILocalSym = uint32(tmp231)
	tmp232, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NLocalSym = uint32(tmp232)
	tmp233, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.IExtDefSym = uint32(tmp233)
	tmp234, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NExtDefSym = uint32(tmp234)
	tmp235, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.IUndefSym = uint32(tmp235)
	tmp236, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NUndefSym = uint32(tmp236)
	tmp237, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.TocOff = uint32(tmp237)
	tmp238, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NToc = uint32(tmp238)
	tmp239, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ModTabOff = uint32(tmp239)
	tmp240, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NModTab = uint32(tmp240)
	tmp241, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ExtRefSymOff = uint32(tmp241)
	tmp242, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NExtRefSyms = uint32(tmp242)
	tmp243, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.IndirectSymOff = uint32(tmp243)
	tmp244, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NIndirectSyms = uint32(tmp244)
	tmp245, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ExtRelOff = uint32(tmp245)
	tmp246, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NExtRel = uint32(tmp246)
	tmp247, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LocRelOff = uint32(tmp247)
	tmp248, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NLocRel = uint32(tmp248)
	return err
}
func (this *MachO_DysymtabCommand) IndirectSymbols() (v []uint32, err error) {
	if (this._f_indirectSymbols) {
		return this.indirectSymbols, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.IndirectSymOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.indirectSymbols = make([]uint32, this.NIndirectSyms)
	for i := range this.indirectSymbols {
		tmp249, err := thisIo.ReadU4le()
		if err != nil {
			return nil, err
		}
		this.indirectSymbols[i] = tmp249
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_indirectSymbols = true
	this._f_indirectSymbols = true
	return this.indirectSymbols, nil
}
type MachO_MachHeader struct {
	Cputype MachO_CpuType
	Cpusubtype uint32
	Filetype MachO_FileType
	Ncmds uint32
	Sizeofcmds uint32
	Flags uint32
	Reserved uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO
	_f_flagsObj bool
	flagsObj *MachO_MachoFlags
}
func NewMachO_MachHeader() *MachO_MachHeader {
	return &MachO_MachHeader{
	}
}

func (this *MachO_MachHeader) Read(io *kaitai.Stream, parent *MachO, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp250, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Cputype = MachO_CpuType(tmp250)
	tmp251, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Cpusubtype = uint32(tmp251)
	tmp252, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Filetype = MachO_FileType(tmp252)
	tmp253, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Ncmds = uint32(tmp253)
	tmp254, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Sizeofcmds = uint32(tmp254)
	tmp255, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp255)
	if ( ((this._root.Magic == MachO_MagicType__MachoBeX64) || (this._root.Magic == MachO_MagicType__MachoLeX64)) ) {
		tmp256, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Reserved = uint32(tmp256)
	}
	return err
}
func (this *MachO_MachHeader) FlagsObj() (v *MachO_MachoFlags, err error) {
	if (this._f_flagsObj) {
		return this.flagsObj, nil
	}
	tmp257 := NewMachO_MachoFlags(this.Flags)
	err = tmp257.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.flagsObj = tmp257
	this._f_flagsObj = true
	this._f_flagsObj = true
	return this.flagsObj, nil
}
type MachO_LinkeditDataCommand struct {
	DataOff uint32
	DataSize uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_LinkeditDataCommand() *MachO_LinkeditDataCommand {
	return &MachO_LinkeditDataCommand{
	}
}

func (this *MachO_LinkeditDataCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp258, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataOff = uint32(tmp258)
	tmp259, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataSize = uint32(tmp259)
	return err
}
type MachO_SubCommand struct {
	Name *MachO_LcStr
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_SubCommand() *MachO_SubCommand {
	return &MachO_SubCommand{
	}
}

func (this *MachO_SubCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp260 := NewMachO_LcStr()
	err = tmp260.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp260
	return err
}
type MachO_TwolevelHintsCommand struct {
	Offset uint32
	NumHints uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_TwolevelHintsCommand() *MachO_TwolevelHintsCommand {
	return &MachO_TwolevelHintsCommand{
	}
}

func (this *MachO_TwolevelHintsCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp261, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp261)
	tmp262, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumHints = uint32(tmp262)
	return err
}
type MachO_Version struct {
	P1 uint8
	Minor uint8
	Major uint8
	Release uint8
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_VersionMinCommand
}
func NewMachO_Version() *MachO_Version {
	return &MachO_Version{
	}
}

func (this *MachO_Version) Read(io *kaitai.Stream, parent *MachO_VersionMinCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp263, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.P1 = tmp263
	tmp264, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Minor = tmp264
	tmp265, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Major = tmp265
	tmp266, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Release = tmp266
	return err
}
type MachO_EncryptionInfoCommand struct {
	Cryptoff uint32
	Cryptsize uint32
	Cryptid uint32
	Pad uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_EncryptionInfoCommand() *MachO_EncryptionInfoCommand {
	return &MachO_EncryptionInfoCommand{
	}
}

func (this *MachO_EncryptionInfoCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp267, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Cryptoff = uint32(tmp267)
	tmp268, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Cryptsize = uint32(tmp268)
	tmp269, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Cryptid = uint32(tmp269)
	if ( ((this._root.Magic == MachO_MagicType__MachoBeX64) || (this._root.Magic == MachO_MagicType__MachoLeX64)) ) {
		tmp270, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Pad = uint32(tmp270)
	}
	return err
}
type MachO_CodeSignatureCommand struct {
	DataOff uint32
	DataSize uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
	_raw_codeSignature []byte
	_f_codeSignature bool
	codeSignature *MachO_CsBlob
}
func NewMachO_CodeSignatureCommand() *MachO_CodeSignatureCommand {
	return &MachO_CodeSignatureCommand{
	}
}

func (this *MachO_CodeSignatureCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp271, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataOff = uint32(tmp271)
	tmp272, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataSize = uint32(tmp272)
	return err
}
func (this *MachO_CodeSignatureCommand) CodeSignature() (v *MachO_CsBlob, err error) {
	if (this._f_codeSignature) {
		return this.codeSignature, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.DataOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp273, err := thisIo.ReadBytes(int(this.DataSize))
	if err != nil {
		return nil, err
	}
	tmp273 = tmp273
	this._raw_codeSignature = tmp273
	_io__raw_codeSignature := kaitai.NewStream(bytes.NewReader(this._raw_codeSignature))
	tmp274 := NewMachO_CsBlob()
	err = tmp274.Read(_io__raw_codeSignature, this, this._root)
	if err != nil {
		return nil, err
	}
	this.codeSignature = tmp274
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_codeSignature = true
	this._f_codeSignature = true
	return this.codeSignature, nil
}

type MachO_DyldInfoCommand_BindOpcode int
const (
	MachO_DyldInfoCommand_BindOpcode__Done MachO_DyldInfoCommand_BindOpcode = 0
	MachO_DyldInfoCommand_BindOpcode__SetDylibOrdinalImmediate MachO_DyldInfoCommand_BindOpcode = 16
	MachO_DyldInfoCommand_BindOpcode__SetDylibOrdinalUleb MachO_DyldInfoCommand_BindOpcode = 32
	MachO_DyldInfoCommand_BindOpcode__SetDylibSpecialImmediate MachO_DyldInfoCommand_BindOpcode = 48
	MachO_DyldInfoCommand_BindOpcode__SetSymbolTrailingFlagsImmediate MachO_DyldInfoCommand_BindOpcode = 64
	MachO_DyldInfoCommand_BindOpcode__SetTypeImmediate MachO_DyldInfoCommand_BindOpcode = 80
	MachO_DyldInfoCommand_BindOpcode__SetAppendSleb MachO_DyldInfoCommand_BindOpcode = 96
	MachO_DyldInfoCommand_BindOpcode__SetSegmentAndOffsetUleb MachO_DyldInfoCommand_BindOpcode = 112
	MachO_DyldInfoCommand_BindOpcode__AddAddressUleb MachO_DyldInfoCommand_BindOpcode = 128
	MachO_DyldInfoCommand_BindOpcode__DoBind MachO_DyldInfoCommand_BindOpcode = 144
	MachO_DyldInfoCommand_BindOpcode__DoBindAddAddressUleb MachO_DyldInfoCommand_BindOpcode = 160
	MachO_DyldInfoCommand_BindOpcode__DoBindAddAddressImmediateScaled MachO_DyldInfoCommand_BindOpcode = 176
	MachO_DyldInfoCommand_BindOpcode__DoBindUlebTimesSkippingUleb MachO_DyldInfoCommand_BindOpcode = 192
)
type MachO_DyldInfoCommand struct {
	RebaseOff uint32
	RebaseSize uint32
	BindOff uint32
	BindSize uint32
	WeakBindOff uint32
	WeakBindSize uint32
	LazyBindOff uint32
	LazyBindSize uint32
	ExportOff uint32
	ExportSize uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
	_raw_rebase []byte
	_raw_bind []byte
	_raw_lazyBind []byte
	_raw_exports []byte
	_f_rebase bool
	rebase *MachO_DyldInfoCommand_RebaseData
	_f_bind bool
	bind *MachO_DyldInfoCommand_BindData
	_f_lazyBind bool
	lazyBind *MachO_DyldInfoCommand_LazyBindData
	_f_exports bool
	exports *MachO_DyldInfoCommand_ExportNode
}
func NewMachO_DyldInfoCommand() *MachO_DyldInfoCommand {
	return &MachO_DyldInfoCommand{
	}
}

func (this *MachO_DyldInfoCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp275, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.RebaseOff = uint32(tmp275)
	tmp276, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.RebaseSize = uint32(tmp276)
	tmp277, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BindOff = uint32(tmp277)
	tmp278, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BindSize = uint32(tmp278)
	tmp279, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.WeakBindOff = uint32(tmp279)
	tmp280, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.WeakBindSize = uint32(tmp280)
	tmp281, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LazyBindOff = uint32(tmp281)
	tmp282, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LazyBindSize = uint32(tmp282)
	tmp283, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ExportOff = uint32(tmp283)
	tmp284, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ExportSize = uint32(tmp284)
	return err
}
func (this *MachO_DyldInfoCommand) Rebase() (v *MachO_DyldInfoCommand_RebaseData, err error) {
	if (this._f_rebase) {
		return this.rebase, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.RebaseOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp285, err := thisIo.ReadBytes(int(this.RebaseSize))
	if err != nil {
		return nil, err
	}
	tmp285 = tmp285
	this._raw_rebase = tmp285
	_io__raw_rebase := kaitai.NewStream(bytes.NewReader(this._raw_rebase))
	tmp286 := NewMachO_DyldInfoCommand_RebaseData()
	err = tmp286.Read(_io__raw_rebase, this, this._root)
	if err != nil {
		return nil, err
	}
	this.rebase = tmp286
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_rebase = true
	this._f_rebase = true
	return this.rebase, nil
}
func (this *MachO_DyldInfoCommand) Bind() (v *MachO_DyldInfoCommand_BindData, err error) {
	if (this._f_bind) {
		return this.bind, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.BindOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp287, err := thisIo.ReadBytes(int(this.BindSize))
	if err != nil {
		return nil, err
	}
	tmp287 = tmp287
	this._raw_bind = tmp287
	_io__raw_bind := kaitai.NewStream(bytes.NewReader(this._raw_bind))
	tmp288 := NewMachO_DyldInfoCommand_BindData()
	err = tmp288.Read(_io__raw_bind, this, this._root)
	if err != nil {
		return nil, err
	}
	this.bind = tmp288
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_bind = true
	this._f_bind = true
	return this.bind, nil
}
func (this *MachO_DyldInfoCommand) LazyBind() (v *MachO_DyldInfoCommand_LazyBindData, err error) {
	if (this._f_lazyBind) {
		return this.lazyBind, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.LazyBindOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp289, err := thisIo.ReadBytes(int(this.LazyBindSize))
	if err != nil {
		return nil, err
	}
	tmp289 = tmp289
	this._raw_lazyBind = tmp289
	_io__raw_lazyBind := kaitai.NewStream(bytes.NewReader(this._raw_lazyBind))
	tmp290 := NewMachO_DyldInfoCommand_LazyBindData()
	err = tmp290.Read(_io__raw_lazyBind, this, this._root)
	if err != nil {
		return nil, err
	}
	this.lazyBind = tmp290
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_lazyBind = true
	this._f_lazyBind = true
	return this.lazyBind, nil
}
func (this *MachO_DyldInfoCommand) Exports() (v *MachO_DyldInfoCommand_ExportNode, err error) {
	if (this._f_exports) {
		return this.exports, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.ExportOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp291, err := thisIo.ReadBytes(int(this.ExportSize))
	if err != nil {
		return nil, err
	}
	tmp291 = tmp291
	this._raw_exports = tmp291
	_io__raw_exports := kaitai.NewStream(bytes.NewReader(this._raw_exports))
	tmp292 := NewMachO_DyldInfoCommand_ExportNode()
	err = tmp292.Read(_io__raw_exports, this, this._root)
	if err != nil {
		return nil, err
	}
	this.exports = tmp292
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_exports = true
	this._f_exports = true
	return this.exports, nil
}
type MachO_DyldInfoCommand_BindItem struct {
	OpcodeAndImmediate uint8
	Uleb *MachO_Uleb128
	Skip *MachO_Uleb128
	Symbol string
	_io *kaitai.Stream
	_root *MachO
	_parent interface{}
	_f_opcode bool
	opcode MachO_DyldInfoCommand_BindOpcode
	_f_immediate bool
	immediate int
}
func NewMachO_DyldInfoCommand_BindItem() *MachO_DyldInfoCommand_BindItem {
	return &MachO_DyldInfoCommand_BindItem{
	}
}

func (this *MachO_DyldInfoCommand_BindItem) Read(io *kaitai.Stream, parent interface{}, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp293, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.OpcodeAndImmediate = tmp293
	tmp294, err := this.Opcode()
	if err != nil {
		return err
	}
	tmp295, err := this.Opcode()
	if err != nil {
		return err
	}
	tmp296, err := this.Opcode()
	if err != nil {
		return err
	}
	tmp297, err := this.Opcode()
	if err != nil {
		return err
	}
	tmp298, err := this.Opcode()
	if err != nil {
		return err
	}
	tmp299, err := this.Opcode()
	if err != nil {
		return err
	}
	if ( ((tmp294 == MachO_DyldInfoCommand_BindOpcode__SetDylibOrdinalUleb) || (tmp295 == MachO_DyldInfoCommand_BindOpcode__SetAppendSleb) || (tmp296 == MachO_DyldInfoCommand_BindOpcode__SetSegmentAndOffsetUleb) || (tmp297 == MachO_DyldInfoCommand_BindOpcode__AddAddressUleb) || (tmp298 == MachO_DyldInfoCommand_BindOpcode__DoBindAddAddressUleb) || (tmp299 == MachO_DyldInfoCommand_BindOpcode__DoBindUlebTimesSkippingUleb)) ) {
		tmp300 := NewMachO_Uleb128()
		err = tmp300.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Uleb = tmp300
	}
	tmp301, err := this.Opcode()
	if err != nil {
		return err
	}
	if (tmp301 == MachO_DyldInfoCommand_BindOpcode__DoBindUlebTimesSkippingUleb) {
		tmp302 := NewMachO_Uleb128()
		err = tmp302.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Skip = tmp302
	}
	tmp303, err := this.Opcode()
	if err != nil {
		return err
	}
	if (tmp303 == MachO_DyldInfoCommand_BindOpcode__SetSymbolTrailingFlagsImmediate) {
		tmp304, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return err
		}
		this.Symbol = string(tmp304)
	}
	return err
}
func (this *MachO_DyldInfoCommand_BindItem) Opcode() (v MachO_DyldInfoCommand_BindOpcode, err error) {
	if (this._f_opcode) {
		return this.opcode, nil
	}
	this.opcode = MachO_DyldInfoCommand_BindOpcode(MachO_DyldInfoCommand_BindOpcode((this.OpcodeAndImmediate & 240)))
	this._f_opcode = true
	return this.opcode, nil
}
func (this *MachO_DyldInfoCommand_BindItem) Immediate() (v int, err error) {
	if (this._f_immediate) {
		return this.immediate, nil
	}
	this.immediate = int((this.OpcodeAndImmediate & 15))
	this._f_immediate = true
	return this.immediate, nil
}

type MachO_DyldInfoCommand_RebaseData_Opcode int
const (
	MachO_DyldInfoCommand_RebaseData_Opcode__Done MachO_DyldInfoCommand_RebaseData_Opcode = 0
	MachO_DyldInfoCommand_RebaseData_Opcode__SetTypeImmediate MachO_DyldInfoCommand_RebaseData_Opcode = 16
	MachO_DyldInfoCommand_RebaseData_Opcode__SetSegmentAndOffsetUleb MachO_DyldInfoCommand_RebaseData_Opcode = 32
	MachO_DyldInfoCommand_RebaseData_Opcode__AddAddressUleb MachO_DyldInfoCommand_RebaseData_Opcode = 48
	MachO_DyldInfoCommand_RebaseData_Opcode__AddAddressImmediateScaled MachO_DyldInfoCommand_RebaseData_Opcode = 64
	MachO_DyldInfoCommand_RebaseData_Opcode__DoRebaseImmediateTimes MachO_DyldInfoCommand_RebaseData_Opcode = 80
	MachO_DyldInfoCommand_RebaseData_Opcode__DoRebaseUlebTimes MachO_DyldInfoCommand_RebaseData_Opcode = 96
	MachO_DyldInfoCommand_RebaseData_Opcode__DoRebaseAddAddressUleb MachO_DyldInfoCommand_RebaseData_Opcode = 112
	MachO_DyldInfoCommand_RebaseData_Opcode__DoRebaseUlebTimesSkippingUleb MachO_DyldInfoCommand_RebaseData_Opcode = 128
)
type MachO_DyldInfoCommand_RebaseData struct {
	Items []*MachO_DyldInfoCommand_RebaseData_RebaseItem
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_DyldInfoCommand
}
func NewMachO_DyldInfoCommand_RebaseData() *MachO_DyldInfoCommand_RebaseData {
	return &MachO_DyldInfoCommand_RebaseData{
	}
}

func (this *MachO_DyldInfoCommand_RebaseData) Read(io *kaitai.Stream, parent *MachO_DyldInfoCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp305 := NewMachO_DyldInfoCommand_RebaseData_RebaseItem()
		err = tmp305.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp305
		this.Items = append(this.Items, _it)
		tmp306, err := _it.Opcode()
		if err != nil {
			return err
		}
		if tmp306 == MachO_DyldInfoCommand_RebaseData_Opcode__Done {
			break
		}
	}
	return err
}
type MachO_DyldInfoCommand_RebaseData_RebaseItem struct {
	OpcodeAndImmediate uint8
	Uleb *MachO_Uleb128
	Skip *MachO_Uleb128
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_DyldInfoCommand_RebaseData
	_f_opcode bool
	opcode MachO_DyldInfoCommand_RebaseData_Opcode
	_f_immediate bool
	immediate int
}
func NewMachO_DyldInfoCommand_RebaseData_RebaseItem() *MachO_DyldInfoCommand_RebaseData_RebaseItem {
	return &MachO_DyldInfoCommand_RebaseData_RebaseItem{
	}
}

func (this *MachO_DyldInfoCommand_RebaseData_RebaseItem) Read(io *kaitai.Stream, parent *MachO_DyldInfoCommand_RebaseData, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp307, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.OpcodeAndImmediate = tmp307
	tmp308, err := this.Opcode()
	if err != nil {
		return err
	}
	tmp309, err := this.Opcode()
	if err != nil {
		return err
	}
	tmp310, err := this.Opcode()
	if err != nil {
		return err
	}
	tmp311, err := this.Opcode()
	if err != nil {
		return err
	}
	tmp312, err := this.Opcode()
	if err != nil {
		return err
	}
	if ( ((tmp308 == MachO_DyldInfoCommand_RebaseData_Opcode__SetSegmentAndOffsetUleb) || (tmp309 == MachO_DyldInfoCommand_RebaseData_Opcode__AddAddressUleb) || (tmp310 == MachO_DyldInfoCommand_RebaseData_Opcode__DoRebaseUlebTimes) || (tmp311 == MachO_DyldInfoCommand_RebaseData_Opcode__DoRebaseAddAddressUleb) || (tmp312 == MachO_DyldInfoCommand_RebaseData_Opcode__DoRebaseUlebTimesSkippingUleb)) ) {
		tmp313 := NewMachO_Uleb128()
		err = tmp313.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Uleb = tmp313
	}
	tmp314, err := this.Opcode()
	if err != nil {
		return err
	}
	if (tmp314 == MachO_DyldInfoCommand_RebaseData_Opcode__DoRebaseUlebTimesSkippingUleb) {
		tmp315 := NewMachO_Uleb128()
		err = tmp315.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Skip = tmp315
	}
	return err
}
func (this *MachO_DyldInfoCommand_RebaseData_RebaseItem) Opcode() (v MachO_DyldInfoCommand_RebaseData_Opcode, err error) {
	if (this._f_opcode) {
		return this.opcode, nil
	}
	this.opcode = MachO_DyldInfoCommand_RebaseData_Opcode(MachO_DyldInfoCommand_RebaseData_Opcode((this.OpcodeAndImmediate & 240)))
	this._f_opcode = true
	return this.opcode, nil
}
func (this *MachO_DyldInfoCommand_RebaseData_RebaseItem) Immediate() (v int, err error) {
	if (this._f_immediate) {
		return this.immediate, nil
	}
	this.immediate = int((this.OpcodeAndImmediate & 15))
	this._f_immediate = true
	return this.immediate, nil
}
type MachO_DyldInfoCommand_ExportNode struct {
	TerminalSize *MachO_Uleb128
	ChildrenCount uint8
	Children []*MachO_DyldInfoCommand_ExportNode_Child
	Terminal []byte
	_io *kaitai.Stream
	_root *MachO
	_parent interface{}
}
func NewMachO_DyldInfoCommand_ExportNode() *MachO_DyldInfoCommand_ExportNode {
	return &MachO_DyldInfoCommand_ExportNode{
	}
}

func (this *MachO_DyldInfoCommand_ExportNode) Read(io *kaitai.Stream, parent interface{}, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp316 := NewMachO_Uleb128()
	err = tmp316.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.TerminalSize = tmp316
	tmp317, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ChildrenCount = tmp317
	this.Children = make([]*MachO_DyldInfoCommand_ExportNode_Child, this.ChildrenCount)
	for i := range this.Children {
		tmp318 := NewMachO_DyldInfoCommand_ExportNode_Child()
		err = tmp318.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Children[i] = tmp318
	}
	tmp319, err := this.TerminalSize.Value()
	if err != nil {
		return err
	}
	tmp320, err := this._io.ReadBytes(int(tmp319))
	if err != nil {
		return err
	}
	tmp320 = tmp320
	this.Terminal = tmp320
	return err
}
type MachO_DyldInfoCommand_ExportNode_Child struct {
	Name string
	NodeOffset *MachO_Uleb128
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_DyldInfoCommand_ExportNode
	_f_value bool
	value *MachO_DyldInfoCommand_ExportNode
}
func NewMachO_DyldInfoCommand_ExportNode_Child() *MachO_DyldInfoCommand_ExportNode_Child {
	return &MachO_DyldInfoCommand_ExportNode_Child{
	}
}

func (this *MachO_DyldInfoCommand_ExportNode_Child) Read(io *kaitai.Stream, parent *MachO_DyldInfoCommand_ExportNode, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp321, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Name = string(tmp321)
	tmp322 := NewMachO_Uleb128()
	err = tmp322.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.NodeOffset = tmp322
	return err
}
func (this *MachO_DyldInfoCommand_ExportNode_Child) Value() (v *MachO_DyldInfoCommand_ExportNode, err error) {
	if (this._f_value) {
		return this.value, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp323, err := this.NodeOffset.Value()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(tmp323), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp324 := NewMachO_DyldInfoCommand_ExportNode()
	err = tmp324.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.value = tmp324
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_value = true
	this._f_value = true
	return this.value, nil
}
type MachO_DyldInfoCommand_BindData struct {
	Items []*MachO_DyldInfoCommand_BindItem
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_DyldInfoCommand
}
func NewMachO_DyldInfoCommand_BindData() *MachO_DyldInfoCommand_BindData {
	return &MachO_DyldInfoCommand_BindData{
	}
}

func (this *MachO_DyldInfoCommand_BindData) Read(io *kaitai.Stream, parent *MachO_DyldInfoCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp325 := NewMachO_DyldInfoCommand_BindItem()
		err = tmp325.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp325
		this.Items = append(this.Items, _it)
		tmp326, err := _it.Opcode()
		if err != nil {
			return err
		}
		if tmp326 == MachO_DyldInfoCommand_BindOpcode__Done {
			break
		}
	}
	return err
}
type MachO_DyldInfoCommand_LazyBindData struct {
	Items []*MachO_DyldInfoCommand_BindItem
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_DyldInfoCommand
}
func NewMachO_DyldInfoCommand_LazyBindData() *MachO_DyldInfoCommand_LazyBindData {
	return &MachO_DyldInfoCommand_LazyBindData{
	}
}

func (this *MachO_DyldInfoCommand_LazyBindData) Read(io *kaitai.Stream, parent *MachO_DyldInfoCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp327, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp327 {
			break
		}
		tmp328 := NewMachO_DyldInfoCommand_BindItem()
		err = tmp328.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items = append(this.Items, tmp328)
	}
	return err
}
type MachO_DylinkerCommand struct {
	Name *MachO_LcStr
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_DylinkerCommand() *MachO_DylinkerCommand {
	return &MachO_DylinkerCommand{
	}
}

func (this *MachO_DylinkerCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp329 := NewMachO_LcStr()
	err = tmp329.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp329
	return err
}
type MachO_DylibCommand struct {
	NameOffset uint32
	Timestamp uint32
	CurrentVersion uint32
	CompatibilityVersion uint32
	Name string
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_DylibCommand() *MachO_DylibCommand {
	return &MachO_DylibCommand{
	}
}

func (this *MachO_DylibCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp330, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NameOffset = uint32(tmp330)
	tmp331, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Timestamp = uint32(tmp331)
	tmp332, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CurrentVersion = uint32(tmp332)
	tmp333, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CompatibilityVersion = uint32(tmp333)
	tmp334, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Name = string(tmp334)
	return err
}
type MachO_SegmentCommand struct {
	Segname string
	Vmaddr uint32
	Vmsize uint32
	Fileoff uint32
	Filesize uint32
	Maxprot *MachO_VmProt
	Initprot *MachO_VmProt
	Nsects uint32
	Flags uint32
	Sections []*MachO_SegmentCommand_Section
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_SegmentCommand() *MachO_SegmentCommand {
	return &MachO_SegmentCommand{
	}
}

func (this *MachO_SegmentCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp335, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp335 = kaitai.BytesStripRight(tmp335, 0)
	this.Segname = string(tmp335)
	tmp336, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Vmaddr = uint32(tmp336)
	tmp337, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Vmsize = uint32(tmp337)
	tmp338, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Fileoff = uint32(tmp338)
	tmp339, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Filesize = uint32(tmp339)
	tmp340 := NewMachO_VmProt()
	err = tmp340.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Maxprot = tmp340
	tmp341 := NewMachO_VmProt()
	err = tmp341.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Initprot = tmp341
	tmp342, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Nsects = uint32(tmp342)
	tmp343, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp343)
	this.Sections = make([]*MachO_SegmentCommand_Section, this.Nsects)
	for i := range this.Sections {
		tmp344 := NewMachO_SegmentCommand_Section()
		err = tmp344.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Sections[i] = tmp344
	}
	return err
}
type MachO_SegmentCommand_Section struct {
	SectName string
	SegName string
	Addr uint32
	Size uint32
	Offset uint32
	Align uint32
	Reloff uint32
	Nreloc uint32
	Flags uint32
	Reserved1 uint32
	Reserved2 uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SegmentCommand
	_f_data bool
	data []byte
}
func NewMachO_SegmentCommand_Section() *MachO_SegmentCommand_Section {
	return &MachO_SegmentCommand_Section{
	}
}

func (this *MachO_SegmentCommand_Section) Read(io *kaitai.Stream, parent *MachO_SegmentCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp345, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp345 = kaitai.BytesStripRight(tmp345, 0)
	this.SectName = string(tmp345)
	tmp346, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp346 = kaitai.BytesStripRight(tmp346, 0)
	this.SegName = string(tmp346)
	tmp347, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Addr = uint32(tmp347)
	tmp348, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp348)
	tmp349, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Offset = uint32(tmp349)
	tmp350, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Align = uint32(tmp350)
	tmp351, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Reloff = uint32(tmp351)
	tmp352, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Nreloc = uint32(tmp352)
	tmp353, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Flags = uint32(tmp353)
	tmp354, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Reserved1 = uint32(tmp354)
	tmp355, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Reserved2 = uint32(tmp355)
	return err
}
func (this *MachO_SegmentCommand_Section) Data() (v []byte, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.Offset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp356, err := thisIo.ReadBytes(int(this.Size))
	if err != nil {
		return nil, err
	}
	tmp356 = tmp356
	this.data = tmp356
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_data = true
	this._f_data = true
	return this.data, nil
}
type MachO_LcStr struct {
	Length uint32
	Value string
	_io *kaitai.Stream
	_root *MachO
	_parent interface{}
}
func NewMachO_LcStr() *MachO_LcStr {
	return &MachO_LcStr{
	}
}

func (this *MachO_LcStr) Read(io *kaitai.Stream, parent interface{}, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp357, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp357)
	tmp358, err := this._io.ReadBytesTerm(0, false, true, true)
	if err != nil {
		return err
	}
	this.Value = string(tmp358)
	return err
}
type MachO_LoadCommand struct {
	Type MachO_LoadCommandType
	Size uint32
	Body interface{}
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO
	_raw_Body []byte
}
func NewMachO_LoadCommand() *MachO_LoadCommand {
	return &MachO_LoadCommand{
	}
}

func (this *MachO_LoadCommand) Read(io *kaitai.Stream, parent *MachO, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp359, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Type = MachO_LoadCommandType(tmp359)
	tmp360, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp360)
	switch (this.Type) {
	case MachO_LoadCommandType__IdDylinker:
		tmp361, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp361 = tmp361
		this._raw_Body = tmp361
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp362 := NewMachO_DylinkerCommand()
		err = tmp362.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp362
	case MachO_LoadCommandType__ReexportDylib:
		tmp363, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp363 = tmp363
		this._raw_Body = tmp363
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp364 := NewMachO_DylibCommand()
		err = tmp364.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp364
	case MachO_LoadCommandType__BuildVersion:
		tmp365, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp365 = tmp365
		this._raw_Body = tmp365
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp366 := NewMachO_BuildVersionCommand()
		err = tmp366.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp366
	case MachO_LoadCommandType__SourceVersion:
		tmp367, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp367 = tmp367
		this._raw_Body = tmp367
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp368 := NewMachO_SourceVersionCommand()
		err = tmp368.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp368
	case MachO_LoadCommandType__FunctionStarts:
		tmp369, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp369 = tmp369
		this._raw_Body = tmp369
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp370 := NewMachO_LinkeditDataCommand()
		err = tmp370.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp370
	case MachO_LoadCommandType__Rpath:
		tmp371, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp371 = tmp371
		this._raw_Body = tmp371
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp372 := NewMachO_RpathCommand()
		err = tmp372.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp372
	case MachO_LoadCommandType__SubFramework:
		tmp373, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp373 = tmp373
		this._raw_Body = tmp373
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp374 := NewMachO_SubCommand()
		err = tmp374.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp374
	case MachO_LoadCommandType__Routines:
		tmp375, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp375 = tmp375
		this._raw_Body = tmp375
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp376 := NewMachO_RoutinesCommand()
		err = tmp376.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp376
	case MachO_LoadCommandType__SubLibrary:
		tmp377, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp377 = tmp377
		this._raw_Body = tmp377
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp378 := NewMachO_SubCommand()
		err = tmp378.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp378
	case MachO_LoadCommandType__DyldInfoOnly:
		tmp379, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp379 = tmp379
		this._raw_Body = tmp379
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp380 := NewMachO_DyldInfoCommand()
		err = tmp380.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp380
	case MachO_LoadCommandType__DyldEnvironment:
		tmp381, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp381 = tmp381
		this._raw_Body = tmp381
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp382 := NewMachO_DylinkerCommand()
		err = tmp382.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp382
	case MachO_LoadCommandType__LoadDylinker:
		tmp383, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp383 = tmp383
		this._raw_Body = tmp383
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp384 := NewMachO_DylinkerCommand()
		err = tmp384.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp384
	case MachO_LoadCommandType__SegmentSplitInfo:
		tmp385, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp385 = tmp385
		this._raw_Body = tmp385
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp386 := NewMachO_LinkeditDataCommand()
		err = tmp386.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp386
	case MachO_LoadCommandType__Main:
		tmp387, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp387 = tmp387
		this._raw_Body = tmp387
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp388 := NewMachO_EntryPointCommand()
		err = tmp388.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp388
	case MachO_LoadCommandType__LoadDylib:
		tmp389, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp389 = tmp389
		this._raw_Body = tmp389
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp390 := NewMachO_DylibCommand()
		err = tmp390.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp390
	case MachO_LoadCommandType__EncryptionInfo:
		tmp391, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp391 = tmp391
		this._raw_Body = tmp391
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp392 := NewMachO_EncryptionInfoCommand()
		err = tmp392.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp392
	case MachO_LoadCommandType__Dysymtab:
		tmp393, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp393 = tmp393
		this._raw_Body = tmp393
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp394 := NewMachO_DysymtabCommand()
		err = tmp394.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp394
	case MachO_LoadCommandType__TwolevelHints:
		tmp395, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp395 = tmp395
		this._raw_Body = tmp395
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp396 := NewMachO_TwolevelHintsCommand()
		err = tmp396.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp396
	case MachO_LoadCommandType__EncryptionInfo64:
		tmp397, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp397 = tmp397
		this._raw_Body = tmp397
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp398 := NewMachO_EncryptionInfoCommand()
		err = tmp398.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp398
	case MachO_LoadCommandType__LinkerOption:
		tmp399, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp399 = tmp399
		this._raw_Body = tmp399
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp400 := NewMachO_LinkerOptionCommand()
		err = tmp400.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp400
	case MachO_LoadCommandType__DyldInfo:
		tmp401, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp401 = tmp401
		this._raw_Body = tmp401
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp402 := NewMachO_DyldInfoCommand()
		err = tmp402.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp402
	case MachO_LoadCommandType__VersionMinTvos:
		tmp403, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp403 = tmp403
		this._raw_Body = tmp403
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp404 := NewMachO_VersionMinCommand()
		err = tmp404.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp404
	case MachO_LoadCommandType__LoadUpwardDylib:
		tmp405, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp405 = tmp405
		this._raw_Body = tmp405
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp406 := NewMachO_DylibCommand()
		err = tmp406.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp406
	case MachO_LoadCommandType__Segment64:
		tmp407, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp407 = tmp407
		this._raw_Body = tmp407
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp408 := NewMachO_SegmentCommand64()
		err = tmp408.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp408
	case MachO_LoadCommandType__Segment:
		tmp409, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp409 = tmp409
		this._raw_Body = tmp409
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp410 := NewMachO_SegmentCommand()
		err = tmp410.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp410
	case MachO_LoadCommandType__SubUmbrella:
		tmp411, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp411 = tmp411
		this._raw_Body = tmp411
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp412 := NewMachO_SubCommand()
		err = tmp412.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp412
	case MachO_LoadCommandType__VersionMinWatchos:
		tmp413, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp413 = tmp413
		this._raw_Body = tmp413
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp414 := NewMachO_VersionMinCommand()
		err = tmp414.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp414
	case MachO_LoadCommandType__Routines64:
		tmp415, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp415 = tmp415
		this._raw_Body = tmp415
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp416 := NewMachO_RoutinesCommand64()
		err = tmp416.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp416
	case MachO_LoadCommandType__IdDylib:
		tmp417, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp417 = tmp417
		this._raw_Body = tmp417
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp418 := NewMachO_DylibCommand()
		err = tmp418.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp418
	case MachO_LoadCommandType__SubClient:
		tmp419, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp419 = tmp419
		this._raw_Body = tmp419
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp420 := NewMachO_SubCommand()
		err = tmp420.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp420
	case MachO_LoadCommandType__DylibCodeSignDrs:
		tmp421, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp421 = tmp421
		this._raw_Body = tmp421
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp422 := NewMachO_LinkeditDataCommand()
		err = tmp422.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp422
	case MachO_LoadCommandType__Symtab:
		tmp423, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp423 = tmp423
		this._raw_Body = tmp423
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp424 := NewMachO_SymtabCommand()
		err = tmp424.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp424
	case MachO_LoadCommandType__LinkerOptimizationHint:
		tmp425, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp425 = tmp425
		this._raw_Body = tmp425
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp426 := NewMachO_LinkeditDataCommand()
		err = tmp426.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp426
	case MachO_LoadCommandType__DataInCode:
		tmp427, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp427 = tmp427
		this._raw_Body = tmp427
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp428 := NewMachO_LinkeditDataCommand()
		err = tmp428.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp428
	case MachO_LoadCommandType__CodeSignature:
		tmp429, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp429 = tmp429
		this._raw_Body = tmp429
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp430 := NewMachO_CodeSignatureCommand()
		err = tmp430.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp430
	case MachO_LoadCommandType__VersionMinIphoneos:
		tmp431, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp431 = tmp431
		this._raw_Body = tmp431
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp432 := NewMachO_VersionMinCommand()
		err = tmp432.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp432
	case MachO_LoadCommandType__LoadWeakDylib:
		tmp433, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp433 = tmp433
		this._raw_Body = tmp433
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp434 := NewMachO_DylibCommand()
		err = tmp434.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp434
	case MachO_LoadCommandType__LazyLoadDylib:
		tmp435, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp435 = tmp435
		this._raw_Body = tmp435
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp436 := NewMachO_DylibCommand()
		err = tmp436.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp436
	case MachO_LoadCommandType__Uuid:
		tmp437, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp437 = tmp437
		this._raw_Body = tmp437
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp438 := NewMachO_UuidCommand()
		err = tmp438.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp438
	case MachO_LoadCommandType__VersionMinMacosx:
		tmp439, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp439 = tmp439
		this._raw_Body = tmp439
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp440 := NewMachO_VersionMinCommand()
		err = tmp440.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp440
	default:
		tmp441, err := this._io.ReadBytes(int((this.Size - 8)))
		if err != nil {
			return err
		}
		tmp441 = tmp441
		this._raw_Body = tmp441
	}
	return err
}
type MachO_UuidCommand struct {
	Uuid []byte
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_UuidCommand() *MachO_UuidCommand {
	return &MachO_UuidCommand{
	}
}

func (this *MachO_UuidCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp442, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp442 = tmp442
	this.Uuid = tmp442
	return err
}
type MachO_SymtabCommand struct {
	SymOff uint32
	NSyms uint32
	StrOff uint32
	StrSize uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
	_raw_strs []byte
	_f_symbols bool
	symbols []interface{}
	_f_strs bool
	strs *MachO_SymtabCommand_StrTable
}
func NewMachO_SymtabCommand() *MachO_SymtabCommand {
	return &MachO_SymtabCommand{
	}
}

func (this *MachO_SymtabCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp443, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SymOff = uint32(tmp443)
	tmp444, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NSyms = uint32(tmp444)
	tmp445, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.StrOff = uint32(tmp445)
	tmp446, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.StrSize = uint32(tmp446)
	return err
}
func (this *MachO_SymtabCommand) Symbols() (v []interface{}, err error) {
	if (this._f_symbols) {
		return this.symbols, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.SymOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.symbols = make([]interface{}, this.NSyms)
	for i := range this.symbols {
		switch (this._root.Magic) {
		case MachO_MagicType__MachoLeX64:
			tmp447 := NewMachO_SymtabCommand_Nlist64()
			err = tmp447.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.symbols[i] = tmp447
		case MachO_MagicType__MachoBeX64:
			tmp448 := NewMachO_SymtabCommand_Nlist64()
			err = tmp448.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.symbols[i] = tmp448
		case MachO_MagicType__MachoLeX86:
			tmp449 := NewMachO_SymtabCommand_Nlist()
			err = tmp449.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.symbols[i] = tmp449
		case MachO_MagicType__MachoBeX86:
			tmp450 := NewMachO_SymtabCommand_Nlist()
			err = tmp450.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.symbols[i] = tmp450
		}
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_symbols = true
	this._f_symbols = true
	return this.symbols, nil
}
func (this *MachO_SymtabCommand) Strs() (v *MachO_SymtabCommand_StrTable, err error) {
	if (this._f_strs) {
		return this.strs, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.StrOff), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp451, err := thisIo.ReadBytes(int(this.StrSize))
	if err != nil {
		return nil, err
	}
	tmp451 = tmp451
	this._raw_strs = tmp451
	_io__raw_strs := kaitai.NewStream(bytes.NewReader(this._raw_strs))
	tmp452 := NewMachO_SymtabCommand_StrTable()
	err = tmp452.Read(_io__raw_strs, this, this._root)
	if err != nil {
		return nil, err
	}
	this.strs = tmp452
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_strs = true
	this._f_strs = true
	return this.strs, nil
}
type MachO_SymtabCommand_StrTable struct {
	Unknown uint32
	Items []string
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SymtabCommand
}
func NewMachO_SymtabCommand_StrTable() *MachO_SymtabCommand_StrTable {
	return &MachO_SymtabCommand_StrTable{
	}
}

func (this *MachO_SymtabCommand_StrTable) Read(io *kaitai.Stream, parent *MachO_SymtabCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp453, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Unknown = uint32(tmp453)
	for i := 1;; i++ {
		tmp454, err := this._io.ReadBytesTerm(0, false, true, false)
		if err != nil {
			return err
		}
		_it := string(tmp454)
		this.Items = append(this.Items, _it)
		if _it == "" {
			break
		}
	}
	return err
}
type MachO_SymtabCommand_Nlist64 struct {
	Un uint32
	Type uint8
	Sect uint8
	Desc uint16
	Value uint64
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SymtabCommand
	_f_name bool
	name string
}
func NewMachO_SymtabCommand_Nlist64() *MachO_SymtabCommand_Nlist64 {
	return &MachO_SymtabCommand_Nlist64{
	}
}

func (this *MachO_SymtabCommand_Nlist64) Read(io *kaitai.Stream, parent *MachO_SymtabCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp455, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Un = uint32(tmp455)
	tmp456, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = tmp456
	tmp457, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Sect = tmp457
	tmp458, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Desc = uint16(tmp458)
	tmp459, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Value = uint64(tmp459)
	return err
}
func (this *MachO_SymtabCommand_Nlist64) Name() (v string, err error) {
	if (this._f_name) {
		return this.name, nil
	}
	if (this.Un != 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return "", err
		}
		_, err = this._io.Seek(int64((this._parent.StrOff + this.Un)), io.SeekStart)
		if err != nil {
			return "", err
		}
		tmp460, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return "", err
		}
		this.name = string(tmp460)
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return "", err
		}
		this._f_name = true
	}
	this._f_name = true
	return this.name, nil
}
type MachO_SymtabCommand_Nlist struct {
	Un uint32
	Type uint8
	Sect uint8
	Desc uint16
	Value uint32
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_SymtabCommand
	_f_name bool
	name string
}
func NewMachO_SymtabCommand_Nlist() *MachO_SymtabCommand_Nlist {
	return &MachO_SymtabCommand_Nlist{
	}
}

func (this *MachO_SymtabCommand_Nlist) Read(io *kaitai.Stream, parent *MachO_SymtabCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp461, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Un = uint32(tmp461)
	tmp462, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Type = tmp462
	tmp463, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Sect = tmp463
	tmp464, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Desc = uint16(tmp464)
	tmp465, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Value = uint32(tmp465)
	return err
}
func (this *MachO_SymtabCommand_Nlist) Name() (v string, err error) {
	if (this._f_name) {
		return this.name, nil
	}
	if (this.Un != 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return "", err
		}
		_, err = this._io.Seek(int64((this._parent.StrOff + this.Un)), io.SeekStart)
		if err != nil {
			return "", err
		}
		tmp466, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return "", err
		}
		this.name = string(tmp466)
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return "", err
		}
		this._f_name = true
	}
	this._f_name = true
	return this.name, nil
}
type MachO_VersionMinCommand struct {
	Version *MachO_Version
	Sdk *MachO_Version
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_VersionMinCommand() *MachO_VersionMinCommand {
	return &MachO_VersionMinCommand{
	}
}

func (this *MachO_VersionMinCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp467 := NewMachO_Version()
	err = tmp467.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Version = tmp467
	tmp468 := NewMachO_Version()
	err = tmp468.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Sdk = tmp468
	return err
}
type MachO_EntryPointCommand struct {
	EntryOff uint64
	StackSize uint64
	_io *kaitai.Stream
	_root *MachO
	_parent *MachO_LoadCommand
}
func NewMachO_EntryPointCommand() *MachO_EntryPointCommand {
	return &MachO_EntryPointCommand{
	}
}

func (this *MachO_EntryPointCommand) Read(io *kaitai.Stream, parent *MachO_LoadCommand, root *MachO) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp469, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.EntryOff = uint64(tmp469)
	tmp470, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.StackSize = uint64(tmp470)
	return err
}
