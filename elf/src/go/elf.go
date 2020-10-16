// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * @see <a href="https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=HEAD">Source</a>
 */

type Elf_Endian int
const (
	Elf_Endian__Le Elf_Endian = 1
	Elf_Endian__Be Elf_Endian = 2
)

type Elf_ShType int
const (
	Elf_ShType__NullType Elf_ShType = 0
	Elf_ShType__Progbits Elf_ShType = 1
	Elf_ShType__Symtab Elf_ShType = 2
	Elf_ShType__Strtab Elf_ShType = 3
	Elf_ShType__Rela Elf_ShType = 4
	Elf_ShType__Hash Elf_ShType = 5
	Elf_ShType__Dynamic Elf_ShType = 6
	Elf_ShType__Note Elf_ShType = 7
	Elf_ShType__Nobits Elf_ShType = 8
	Elf_ShType__Rel Elf_ShType = 9
	Elf_ShType__Shlib Elf_ShType = 10
	Elf_ShType__Dynsym Elf_ShType = 11
	Elf_ShType__InitArray Elf_ShType = 14
	Elf_ShType__FiniArray Elf_ShType = 15
	Elf_ShType__PreinitArray Elf_ShType = 16
	Elf_ShType__Group Elf_ShType = 17
	Elf_ShType__SymtabShndx Elf_ShType = 18
	Elf_ShType__SunwCapchain Elf_ShType = 1879048175
	Elf_ShType__SunwCapinfo Elf_ShType = 1879048176
	Elf_ShType__SunwSymsort Elf_ShType = 1879048177
	Elf_ShType__SunwTlssort Elf_ShType = 1879048178
	Elf_ShType__SunwLdynsym Elf_ShType = 1879048179
	Elf_ShType__SunwDof Elf_ShType = 1879048180
	Elf_ShType__SunwCap Elf_ShType = 1879048181
	Elf_ShType__SunwSignature Elf_ShType = 1879048182
	Elf_ShType__SunwAnnotate Elf_ShType = 1879048183
	Elf_ShType__SunwDebugstr Elf_ShType = 1879048184
	Elf_ShType__SunwDebug Elf_ShType = 1879048185
	Elf_ShType__SunwMove Elf_ShType = 1879048186
	Elf_ShType__SunwComdat Elf_ShType = 1879048187
	Elf_ShType__SunwSyminfo Elf_ShType = 1879048188
	Elf_ShType__SunwVerdef Elf_ShType = 1879048189
	Elf_ShType__SunwVerneed Elf_ShType = 1879048190
	Elf_ShType__SunwVersym Elf_ShType = 1879048191
	Elf_ShType__SparcGotdata Elf_ShType = 1879048192
	Elf_ShType__Amd64Unwind Elf_ShType = 1879048193
	Elf_ShType__ArmPreemptmap Elf_ShType = 1879048194
	Elf_ShType__ArmAttributes Elf_ShType = 1879048195
)

type Elf_OsAbi int
const (
	Elf_OsAbi__SystemV Elf_OsAbi = 0
	Elf_OsAbi__HpUx Elf_OsAbi = 1
	Elf_OsAbi__Netbsd Elf_OsAbi = 2
	Elf_OsAbi__Gnu Elf_OsAbi = 3
	Elf_OsAbi__Solaris Elf_OsAbi = 6
	Elf_OsAbi__Aix Elf_OsAbi = 7
	Elf_OsAbi__Irix Elf_OsAbi = 8
	Elf_OsAbi__Freebsd Elf_OsAbi = 9
	Elf_OsAbi__Tru64 Elf_OsAbi = 10
	Elf_OsAbi__Modesto Elf_OsAbi = 11
	Elf_OsAbi__Openbsd Elf_OsAbi = 12
	Elf_OsAbi__Openvms Elf_OsAbi = 13
	Elf_OsAbi__Nsk Elf_OsAbi = 14
	Elf_OsAbi__Aros Elf_OsAbi = 15
	Elf_OsAbi__Fenixos Elf_OsAbi = 16
	Elf_OsAbi__Cloudabi Elf_OsAbi = 17
	Elf_OsAbi__Openvos Elf_OsAbi = 18
)

type Elf_Machine int
const (
	Elf_Machine__NotSet Elf_Machine = 0
	Elf_Machine__Sparc Elf_Machine = 2
	Elf_Machine__X86 Elf_Machine = 3
	Elf_Machine__Mips Elf_Machine = 8
	Elf_Machine__Powerpc Elf_Machine = 20
	Elf_Machine__Arm Elf_Machine = 40
	Elf_Machine__Superh Elf_Machine = 42
	Elf_Machine__Ia64 Elf_Machine = 50
	Elf_Machine__X8664 Elf_Machine = 62
	Elf_Machine__Aarch64 Elf_Machine = 183
	Elf_Machine__Riscv Elf_Machine = 243
	Elf_Machine__Bpf Elf_Machine = 247
)

type Elf_DynamicArrayTags int
const (
	Elf_DynamicArrayTags__Null Elf_DynamicArrayTags = 0
	Elf_DynamicArrayTags__Needed Elf_DynamicArrayTags = 1
	Elf_DynamicArrayTags__Pltrelsz Elf_DynamicArrayTags = 2
	Elf_DynamicArrayTags__Pltgot Elf_DynamicArrayTags = 3
	Elf_DynamicArrayTags__Hash Elf_DynamicArrayTags = 4
	Elf_DynamicArrayTags__Strtab Elf_DynamicArrayTags = 5
	Elf_DynamicArrayTags__Symtab Elf_DynamicArrayTags = 6
	Elf_DynamicArrayTags__Rela Elf_DynamicArrayTags = 7
	Elf_DynamicArrayTags__Relasz Elf_DynamicArrayTags = 8
	Elf_DynamicArrayTags__Relaent Elf_DynamicArrayTags = 9
	Elf_DynamicArrayTags__Strsz Elf_DynamicArrayTags = 10
	Elf_DynamicArrayTags__Syment Elf_DynamicArrayTags = 11
	Elf_DynamicArrayTags__Init Elf_DynamicArrayTags = 12
	Elf_DynamicArrayTags__Fini Elf_DynamicArrayTags = 13
	Elf_DynamicArrayTags__Soname Elf_DynamicArrayTags = 14
	Elf_DynamicArrayTags__Rpath Elf_DynamicArrayTags = 15
	Elf_DynamicArrayTags__Symbolic Elf_DynamicArrayTags = 16
	Elf_DynamicArrayTags__Rel Elf_DynamicArrayTags = 17
	Elf_DynamicArrayTags__Relsz Elf_DynamicArrayTags = 18
	Elf_DynamicArrayTags__Relent Elf_DynamicArrayTags = 19
	Elf_DynamicArrayTags__Pltrel Elf_DynamicArrayTags = 20
	Elf_DynamicArrayTags__Debug Elf_DynamicArrayTags = 21
	Elf_DynamicArrayTags__Textrel Elf_DynamicArrayTags = 22
	Elf_DynamicArrayTags__Jmprel Elf_DynamicArrayTags = 23
	Elf_DynamicArrayTags__BindNow Elf_DynamicArrayTags = 24
	Elf_DynamicArrayTags__InitArray Elf_DynamicArrayTags = 25
	Elf_DynamicArrayTags__FiniArray Elf_DynamicArrayTags = 26
	Elf_DynamicArrayTags__InitArraysz Elf_DynamicArrayTags = 27
	Elf_DynamicArrayTags__FiniArraysz Elf_DynamicArrayTags = 28
	Elf_DynamicArrayTags__Runpath Elf_DynamicArrayTags = 29
	Elf_DynamicArrayTags__Flags Elf_DynamicArrayTags = 30
	Elf_DynamicArrayTags__PreinitArray Elf_DynamicArrayTags = 32
	Elf_DynamicArrayTags__PreinitArraysz Elf_DynamicArrayTags = 33
	Elf_DynamicArrayTags__Maxpostags Elf_DynamicArrayTags = 34
	Elf_DynamicArrayTags__SunwAuxiliary Elf_DynamicArrayTags = 1610612749
	Elf_DynamicArrayTags__SunwFilter Elf_DynamicArrayTags = 1610612750
	Elf_DynamicArrayTags__SunwCap Elf_DynamicArrayTags = 1610612752
	Elf_DynamicArrayTags__SunwSymtab Elf_DynamicArrayTags = 1610612753
	Elf_DynamicArrayTags__SunwSymsz Elf_DynamicArrayTags = 1610612754
	Elf_DynamicArrayTags__SunwSortent Elf_DynamicArrayTags = 1610612755
	Elf_DynamicArrayTags__SunwSymsort Elf_DynamicArrayTags = 1610612756
	Elf_DynamicArrayTags__SunwSymsortsz Elf_DynamicArrayTags = 1610612757
	Elf_DynamicArrayTags__SunwTlssort Elf_DynamicArrayTags = 1610612758
	Elf_DynamicArrayTags__SunwTlssortsz Elf_DynamicArrayTags = 1610612759
	Elf_DynamicArrayTags__SunwCapinfo Elf_DynamicArrayTags = 1610612760
	Elf_DynamicArrayTags__SunwStrpad Elf_DynamicArrayTags = 1610612761
	Elf_DynamicArrayTags__SunwCapchain Elf_DynamicArrayTags = 1610612762
	Elf_DynamicArrayTags__SunwLdmach Elf_DynamicArrayTags = 1610612763
	Elf_DynamicArrayTags__SunwCapchainent Elf_DynamicArrayTags = 1610612765
	Elf_DynamicArrayTags__SunwCapchainsz Elf_DynamicArrayTags = 1610612767
	Elf_DynamicArrayTags__GnuPrelinked Elf_DynamicArrayTags = 1879047669
	Elf_DynamicArrayTags__GnuConflictsz Elf_DynamicArrayTags = 1879047670
	Elf_DynamicArrayTags__GnuLiblistsz Elf_DynamicArrayTags = 1879047671
	Elf_DynamicArrayTags__Checksum Elf_DynamicArrayTags = 1879047672
	Elf_DynamicArrayTags__Pltpadsz Elf_DynamicArrayTags = 1879047673
	Elf_DynamicArrayTags__Moveent Elf_DynamicArrayTags = 1879047674
	Elf_DynamicArrayTags__Movesz Elf_DynamicArrayTags = 1879047675
	Elf_DynamicArrayTags__Feature1 Elf_DynamicArrayTags = 1879047676
	Elf_DynamicArrayTags__Posflag1 Elf_DynamicArrayTags = 1879047677
	Elf_DynamicArrayTags__Syminsz Elf_DynamicArrayTags = 1879047678
	Elf_DynamicArrayTags__Syminent Elf_DynamicArrayTags = 1879047679
	Elf_DynamicArrayTags__GnuHash Elf_DynamicArrayTags = 1879047925
	Elf_DynamicArrayTags__TlsdescPlt Elf_DynamicArrayTags = 1879047926
	Elf_DynamicArrayTags__TlsdescGot Elf_DynamicArrayTags = 1879047927
	Elf_DynamicArrayTags__GnuConflict Elf_DynamicArrayTags = 1879047928
	Elf_DynamicArrayTags__GnuLiblist Elf_DynamicArrayTags = 1879047929
	Elf_DynamicArrayTags__Config Elf_DynamicArrayTags = 1879047930
	Elf_DynamicArrayTags__Depaudit Elf_DynamicArrayTags = 1879047931
	Elf_DynamicArrayTags__Audit Elf_DynamicArrayTags = 1879047932
	Elf_DynamicArrayTags__Pltpad Elf_DynamicArrayTags = 1879047933
	Elf_DynamicArrayTags__Movetab Elf_DynamicArrayTags = 1879047934
	Elf_DynamicArrayTags__Syminfo Elf_DynamicArrayTags = 1879047935
	Elf_DynamicArrayTags__Versym Elf_DynamicArrayTags = 1879048176
	Elf_DynamicArrayTags__Relacount Elf_DynamicArrayTags = 1879048185
	Elf_DynamicArrayTags__Relcount Elf_DynamicArrayTags = 1879048186
	Elf_DynamicArrayTags__Flags1 Elf_DynamicArrayTags = 1879048187
	Elf_DynamicArrayTags__Verdef Elf_DynamicArrayTags = 1879048188
	Elf_DynamicArrayTags__Verdefnum Elf_DynamicArrayTags = 1879048189
	Elf_DynamicArrayTags__Verneed Elf_DynamicArrayTags = 1879048190
	Elf_DynamicArrayTags__Verneednum Elf_DynamicArrayTags = 1879048191
	Elf_DynamicArrayTags__SparcRegister Elf_DynamicArrayTags = 1879048193
	Elf_DynamicArrayTags__Auxiliary Elf_DynamicArrayTags = 2147483645
	Elf_DynamicArrayTags__Used Elf_DynamicArrayTags = 2147483646
	Elf_DynamicArrayTags__Filter Elf_DynamicArrayTags = 2147483647
)

type Elf_Bits int
const (
	Elf_Bits__B32 Elf_Bits = 1
	Elf_Bits__B64 Elf_Bits = 2
)

type Elf_PhType int
const (
	Elf_PhType__NullType Elf_PhType = 0
	Elf_PhType__Load Elf_PhType = 1
	Elf_PhType__Dynamic Elf_PhType = 2
	Elf_PhType__Interp Elf_PhType = 3
	Elf_PhType__Note Elf_PhType = 4
	Elf_PhType__Shlib Elf_PhType = 5
	Elf_PhType__Phdr Elf_PhType = 6
	Elf_PhType__Tls Elf_PhType = 7
	Elf_PhType__GnuEhFrame Elf_PhType = 1685382480
	Elf_PhType__GnuStack Elf_PhType = 1685382481
	Elf_PhType__GnuRelro Elf_PhType = 1685382482
	Elf_PhType__PaxFlags Elf_PhType = 1694766464
	Elf_PhType__Hios Elf_PhType = 1879048191
	Elf_PhType__ArmExidx Elf_PhType = 1879048193
)

type Elf_ObjType int
const (
	Elf_ObjType__Relocatable Elf_ObjType = 1
	Elf_ObjType__Executable Elf_ObjType = 2
	Elf_ObjType__Shared Elf_ObjType = 3
	Elf_ObjType__Core Elf_ObjType = 4
)
type Elf struct {
	Magic []byte
	Bits Elf_Bits
	Endian Elf_Endian
	EiVersion uint8
	Abi Elf_OsAbi
	AbiVersion uint8
	Pad []byte
	Header *Elf_EndianElf
	_io *kaitai.Stream
	_root *Elf
	_parent interface{}
}
func NewElf() *Elf {
	return &Elf{
	}
}

func (this *Elf) Read(io *kaitai.Stream, parent interface{}, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{127, 69, 76, 70})) {
		return kaitai.NewValidationNotEqualError([]uint8{127, 69, 76, 70}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Bits = Elf_Bits(tmp2)
	tmp3, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Endian = Elf_Endian(tmp3)
	tmp4, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.EiVersion = tmp4
	tmp5, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Abi = Elf_OsAbi(tmp5)
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.AbiVersion = tmp6
	tmp7, err := this._io.ReadBytes(int(7))
	if err != nil {
		return err
	}
	tmp7 = tmp7
	this.Pad = tmp7
	tmp8 := NewElf_EndianElf()
	err = tmp8.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp8
	return err
}

/**
 * File identification, must be 0x7f + "ELF".
 */

/**
 * File class: designates target machine word size (32 or 64
 * bits). The size of many integer fields in this format will
 * depend on this setting.
 */

/**
 * Endianness used for all integers.
 */

/**
 * ELF header version.
 */

/**
 * Specifies which OS- and ABI-related extensions will be used
 * in this ELF file.
 */

/**
 * Version of ABI targeted by this ELF file. Interpretation
 * depends on `abi` attribute.
 */
type Elf_PhdrTypeFlags struct {
	Value uint32
	_io *kaitai.Stream
	_root *Elf
	_parent *Elf_EndianElf_ProgramHeader
	_f_read bool
	read bool
	_f_write bool
	write bool
	_f_execute bool
	execute bool
	_f_maskProc bool
	maskProc bool
}
func NewElf_PhdrTypeFlags(value uint32) *Elf_PhdrTypeFlags {
	return &Elf_PhdrTypeFlags{
		Value: value,
	}
}

func (this *Elf_PhdrTypeFlags) Read(io *kaitai.Stream, parent *Elf_EndianElf_ProgramHeader, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *Elf_PhdrTypeFlags) Read() (v bool, err error) {
	if (this._f_read) {
		return this.read, nil
	}
	this.read = bool((this.Value & 4) != 0)
	this._f_read = true
	return this.read, nil
}
func (this *Elf_PhdrTypeFlags) Write() (v bool, err error) {
	if (this._f_write) {
		return this.write, nil
	}
	this.write = bool((this.Value & 2) != 0)
	this._f_write = true
	return this.write, nil
}
func (this *Elf_PhdrTypeFlags) Execute() (v bool, err error) {
	if (this._f_execute) {
		return this.execute, nil
	}
	this.execute = bool((this.Value & 1) != 0)
	this._f_execute = true
	return this.execute, nil
}
func (this *Elf_PhdrTypeFlags) MaskProc() (v bool, err error) {
	if (this._f_maskProc) {
		return this.maskProc, nil
	}
	this.maskProc = bool((this.Value & uint32(4026531840)) != 0)
	this._f_maskProc = true
	return this.maskProc, nil
}
type Elf_SectionHeaderFlags struct {
	Value uint32
	_io *kaitai.Stream
	_root *Elf
	_parent *Elf_EndianElf_SectionHeader
	_f_merge bool
	merge bool
	_f_maskOs bool
	maskOs bool
	_f_exclude bool
	exclude bool
	_f_maskProc bool
	maskProc bool
	_f_strings bool
	strings bool
	_f_osNonConforming bool
	osNonConforming bool
	_f_alloc bool
	alloc bool
	_f_execInstr bool
	execInstr bool
	_f_infoLink bool
	infoLink bool
	_f_write bool
	write bool
	_f_linkOrder bool
	linkOrder bool
	_f_ordered bool
	ordered bool
	_f_tls bool
	tls bool
	_f_group bool
	group bool
}
func NewElf_SectionHeaderFlags(value uint32) *Elf_SectionHeaderFlags {
	return &Elf_SectionHeaderFlags{
		Value: value,
	}
}

func (this *Elf_SectionHeaderFlags) Read(io *kaitai.Stream, parent *Elf_EndianElf_SectionHeader, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}

/**
 * might be merged
 */
func (this *Elf_SectionHeaderFlags) Merge() (v bool, err error) {
	if (this._f_merge) {
		return this.merge, nil
	}
	this.merge = bool((this.Value & 16) != 0)
	this._f_merge = true
	return this.merge, nil
}

/**
 * OS-specific
 */
func (this *Elf_SectionHeaderFlags) MaskOs() (v bool, err error) {
	if (this._f_maskOs) {
		return this.maskOs, nil
	}
	this.maskOs = bool((this.Value & 267386880) != 0)
	this._f_maskOs = true
	return this.maskOs, nil
}

/**
 * section is excluded unless referenced or allocated (Solaris)
 */
func (this *Elf_SectionHeaderFlags) Exclude() (v bool, err error) {
	if (this._f_exclude) {
		return this.exclude, nil
	}
	this.exclude = bool((this.Value & 134217728) != 0)
	this._f_exclude = true
	return this.exclude, nil
}

/**
 * Processor-specific
 */
func (this *Elf_SectionHeaderFlags) MaskProc() (v bool, err error) {
	if (this._f_maskProc) {
		return this.maskProc, nil
	}
	this.maskProc = bool((this.Value & uint32(4026531840)) != 0)
	this._f_maskProc = true
	return this.maskProc, nil
}

/**
 * contains nul-terminated strings
 */
func (this *Elf_SectionHeaderFlags) Strings() (v bool, err error) {
	if (this._f_strings) {
		return this.strings, nil
	}
	this.strings = bool((this.Value & 32) != 0)
	this._f_strings = true
	return this.strings, nil
}

/**
 * non-standard OS specific handling required
 */
func (this *Elf_SectionHeaderFlags) OsNonConforming() (v bool, err error) {
	if (this._f_osNonConforming) {
		return this.osNonConforming, nil
	}
	this.osNonConforming = bool((this.Value & 256) != 0)
	this._f_osNonConforming = true
	return this.osNonConforming, nil
}

/**
 * occupies memory during execution
 */
func (this *Elf_SectionHeaderFlags) Alloc() (v bool, err error) {
	if (this._f_alloc) {
		return this.alloc, nil
	}
	this.alloc = bool((this.Value & 2) != 0)
	this._f_alloc = true
	return this.alloc, nil
}

/**
 * executable
 */
func (this *Elf_SectionHeaderFlags) ExecInstr() (v bool, err error) {
	if (this._f_execInstr) {
		return this.execInstr, nil
	}
	this.execInstr = bool((this.Value & 4) != 0)
	this._f_execInstr = true
	return this.execInstr, nil
}

/**
 * 'sh_info' contains SHT index
 */
func (this *Elf_SectionHeaderFlags) InfoLink() (v bool, err error) {
	if (this._f_infoLink) {
		return this.infoLink, nil
	}
	this.infoLink = bool((this.Value & 64) != 0)
	this._f_infoLink = true
	return this.infoLink, nil
}

/**
 * writable
 */
func (this *Elf_SectionHeaderFlags) Write() (v bool, err error) {
	if (this._f_write) {
		return this.write, nil
	}
	this.write = bool((this.Value & 1) != 0)
	this._f_write = true
	return this.write, nil
}

/**
 * preserve order after combining
 */
func (this *Elf_SectionHeaderFlags) LinkOrder() (v bool, err error) {
	if (this._f_linkOrder) {
		return this.linkOrder, nil
	}
	this.linkOrder = bool((this.Value & 128) != 0)
	this._f_linkOrder = true
	return this.linkOrder, nil
}

/**
 * special ordering requirement (Solaris)
 */
func (this *Elf_SectionHeaderFlags) Ordered() (v bool, err error) {
	if (this._f_ordered) {
		return this.ordered, nil
	}
	this.ordered = bool((this.Value & 67108864) != 0)
	this._f_ordered = true
	return this.ordered, nil
}

/**
 * section hold thread-local data
 */
func (this *Elf_SectionHeaderFlags) Tls() (v bool, err error) {
	if (this._f_tls) {
		return this.tls, nil
	}
	this.tls = bool((this.Value & 1024) != 0)
	this._f_tls = true
	return this.tls, nil
}

/**
 * section is member of a group
 */
func (this *Elf_SectionHeaderFlags) Group() (v bool, err error) {
	if (this._f_group) {
		return this.group, nil
	}
	this.group = bool((this.Value & 512) != 0)
	this._f_group = true
	return this.group, nil
}
type Elf_DtFlag1Values struct {
	Value uint32
	_io *kaitai.Stream
	_root *Elf
	_parent *Elf_EndianElf_DynamicSectionEntry
	_f_singleton bool
	singleton bool
	_f_ignmuldef bool
	ignmuldef bool
	_f_loadfltr bool
	loadfltr bool
	_f_initfirst bool
	initfirst bool
	_f_symintpose bool
	symintpose bool
	_f_noreloc bool
	noreloc bool
	_f_confalt bool
	confalt bool
	_f_dispreldne bool
	dispreldne bool
	_f_rtldGlobal bool
	rtldGlobal bool
	_f_nodelete bool
	nodelete bool
	_f_trans bool
	trans bool
	_f_origin bool
	origin bool
	_f_now bool
	now bool
	_f_nohdr bool
	nohdr bool
	_f_endfiltee bool
	endfiltee bool
	_f_nodirect bool
	nodirect bool
	_f_globaudit bool
	globaudit bool
	_f_noksyms bool
	noksyms bool
	_f_interpose bool
	interpose bool
	_f_nodump bool
	nodump bool
	_f_disprelpnd bool
	disprelpnd bool
	_f_noopen bool
	noopen bool
	_f_stub bool
	stub bool
	_f_direct bool
	direct bool
	_f_edited bool
	edited bool
	_f_group bool
	group bool
	_f_pie bool
	pie bool
	_f_nodeflib bool
	nodeflib bool
}
func NewElf_DtFlag1Values(value uint32) *Elf_DtFlag1Values {
	return &Elf_DtFlag1Values{
		Value: value,
	}
}

func (this *Elf_DtFlag1Values) Read(io *kaitai.Stream, parent *Elf_EndianElf_DynamicSectionEntry, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}

/**
 * Singleton symbols are used.
 */
func (this *Elf_DtFlag1Values) Singleton() (v bool, err error) {
	if (this._f_singleton) {
		return this.singleton, nil
	}
	this.singleton = bool((this.Value & 33554432) != 0)
	this._f_singleton = true
	return this.singleton, nil
}
func (this *Elf_DtFlag1Values) Ignmuldef() (v bool, err error) {
	if (this._f_ignmuldef) {
		return this.ignmuldef, nil
	}
	this.ignmuldef = bool((this.Value & 262144) != 0)
	this._f_ignmuldef = true
	return this.ignmuldef, nil
}

/**
 * Trigger filtee loading at runtime.
 */
func (this *Elf_DtFlag1Values) Loadfltr() (v bool, err error) {
	if (this._f_loadfltr) {
		return this.loadfltr, nil
	}
	this.loadfltr = bool((this.Value & 16) != 0)
	this._f_loadfltr = true
	return this.loadfltr, nil
}

/**
 * Set RTLD_INITFIRST for this object
 */
func (this *Elf_DtFlag1Values) Initfirst() (v bool, err error) {
	if (this._f_initfirst) {
		return this.initfirst, nil
	}
	this.initfirst = bool((this.Value & 32) != 0)
	this._f_initfirst = true
	return this.initfirst, nil
}

/**
 * Object has individual interposers.
 */
func (this *Elf_DtFlag1Values) Symintpose() (v bool, err error) {
	if (this._f_symintpose) {
		return this.symintpose, nil
	}
	this.symintpose = bool((this.Value & 8388608) != 0)
	this._f_symintpose = true
	return this.symintpose, nil
}
func (this *Elf_DtFlag1Values) Noreloc() (v bool, err error) {
	if (this._f_noreloc) {
		return this.noreloc, nil
	}
	this.noreloc = bool((this.Value & 4194304) != 0)
	this._f_noreloc = true
	return this.noreloc, nil
}

/**
 * Configuration alternative created.
 */
func (this *Elf_DtFlag1Values) Confalt() (v bool, err error) {
	if (this._f_confalt) {
		return this.confalt, nil
	}
	this.confalt = bool((this.Value & 8192) != 0)
	this._f_confalt = true
	return this.confalt, nil
}

/**
 * Disp reloc applied at build time.
 */
func (this *Elf_DtFlag1Values) Dispreldne() (v bool, err error) {
	if (this._f_dispreldne) {
		return this.dispreldne, nil
	}
	this.dispreldne = bool((this.Value & 32768) != 0)
	this._f_dispreldne = true
	return this.dispreldne, nil
}

/**
 * Set RTLD_GLOBAL for this object.
 */
func (this *Elf_DtFlag1Values) RtldGlobal() (v bool, err error) {
	if (this._f_rtldGlobal) {
		return this.rtldGlobal, nil
	}
	this.rtldGlobal = bool((this.Value & 2) != 0)
	this._f_rtldGlobal = true
	return this.rtldGlobal, nil
}

/**
 * Set RTLD_NODELETE for this object.
 */
func (this *Elf_DtFlag1Values) Nodelete() (v bool, err error) {
	if (this._f_nodelete) {
		return this.nodelete, nil
	}
	this.nodelete = bool((this.Value & 8) != 0)
	this._f_nodelete = true
	return this.nodelete, nil
}
func (this *Elf_DtFlag1Values) Trans() (v bool, err error) {
	if (this._f_trans) {
		return this.trans, nil
	}
	this.trans = bool((this.Value & 512) != 0)
	this._f_trans = true
	return this.trans, nil
}

/**
 * $ORIGIN must be handled.
 */
func (this *Elf_DtFlag1Values) Origin() (v bool, err error) {
	if (this._f_origin) {
		return this.origin, nil
	}
	this.origin = bool((this.Value & 128) != 0)
	this._f_origin = true
	return this.origin, nil
}

/**
 * Set RTLD_NOW for this object.
 */
func (this *Elf_DtFlag1Values) Now() (v bool, err error) {
	if (this._f_now) {
		return this.now, nil
	}
	this.now = bool((this.Value & 1) != 0)
	this._f_now = true
	return this.now, nil
}
func (this *Elf_DtFlag1Values) Nohdr() (v bool, err error) {
	if (this._f_nohdr) {
		return this.nohdr, nil
	}
	this.nohdr = bool((this.Value & 1048576) != 0)
	this._f_nohdr = true
	return this.nohdr, nil
}

/**
 * Filtee terminates filters search.
 */
func (this *Elf_DtFlag1Values) Endfiltee() (v bool, err error) {
	if (this._f_endfiltee) {
		return this.endfiltee, nil
	}
	this.endfiltee = bool((this.Value & 16384) != 0)
	this._f_endfiltee = true
	return this.endfiltee, nil
}

/**
 * Object has no-direct binding.
 */
func (this *Elf_DtFlag1Values) Nodirect() (v bool, err error) {
	if (this._f_nodirect) {
		return this.nodirect, nil
	}
	this.nodirect = bool((this.Value & 131072) != 0)
	this._f_nodirect = true
	return this.nodirect, nil
}

/**
 * Global auditing required.
 */
func (this *Elf_DtFlag1Values) Globaudit() (v bool, err error) {
	if (this._f_globaudit) {
		return this.globaudit, nil
	}
	this.globaudit = bool((this.Value & 16777216) != 0)
	this._f_globaudit = true
	return this.globaudit, nil
}
func (this *Elf_DtFlag1Values) Noksyms() (v bool, err error) {
	if (this._f_noksyms) {
		return this.noksyms, nil
	}
	this.noksyms = bool((this.Value & 524288) != 0)
	this._f_noksyms = true
	return this.noksyms, nil
}

/**
 * Object is used to interpose.
 */
func (this *Elf_DtFlag1Values) Interpose() (v bool, err error) {
	if (this._f_interpose) {
		return this.interpose, nil
	}
	this.interpose = bool((this.Value & 1024) != 0)
	this._f_interpose = true
	return this.interpose, nil
}

/**
 * Object can't be dldump'ed.
 */
func (this *Elf_DtFlag1Values) Nodump() (v bool, err error) {
	if (this._f_nodump) {
		return this.nodump, nil
	}
	this.nodump = bool((this.Value & 4096) != 0)
	this._f_nodump = true
	return this.nodump, nil
}

/**
 * Disp reloc applied at run-time.
 */
func (this *Elf_DtFlag1Values) Disprelpnd() (v bool, err error) {
	if (this._f_disprelpnd) {
		return this.disprelpnd, nil
	}
	this.disprelpnd = bool((this.Value & 65536) != 0)
	this._f_disprelpnd = true
	return this.disprelpnd, nil
}

/**
 * Set RTLD_NOOPEN for this object.
 */
func (this *Elf_DtFlag1Values) Noopen() (v bool, err error) {
	if (this._f_noopen) {
		return this.noopen, nil
	}
	this.noopen = bool((this.Value & 64) != 0)
	this._f_noopen = true
	return this.noopen, nil
}
func (this *Elf_DtFlag1Values) Stub() (v bool, err error) {
	if (this._f_stub) {
		return this.stub, nil
	}
	this.stub = bool((this.Value & 67108864) != 0)
	this._f_stub = true
	return this.stub, nil
}

/**
 * Direct binding enabled.
 */
func (this *Elf_DtFlag1Values) Direct() (v bool, err error) {
	if (this._f_direct) {
		return this.direct, nil
	}
	this.direct = bool((this.Value & 256) != 0)
	this._f_direct = true
	return this.direct, nil
}

/**
 * Object is modified after built.
 */
func (this *Elf_DtFlag1Values) Edited() (v bool, err error) {
	if (this._f_edited) {
		return this.edited, nil
	}
	this.edited = bool((this.Value & 2097152) != 0)
	this._f_edited = true
	return this.edited, nil
}

/**
 * Set RTLD_GROUP for this object.
 */
func (this *Elf_DtFlag1Values) Group() (v bool, err error) {
	if (this._f_group) {
		return this.group, nil
	}
	this.group = bool((this.Value & 4) != 0)
	this._f_group = true
	return this.group, nil
}
func (this *Elf_DtFlag1Values) Pie() (v bool, err error) {
	if (this._f_pie) {
		return this.pie, nil
	}
	this.pie = bool((this.Value & 134217728) != 0)
	this._f_pie = true
	return this.pie, nil
}

/**
 * Ignore default lib search path.
 */
func (this *Elf_DtFlag1Values) Nodeflib() (v bool, err error) {
	if (this._f_nodeflib) {
		return this.nodeflib, nil
	}
	this.nodeflib = bool((this.Value & 2048) != 0)
	this._f_nodeflib = true
	return this.nodeflib, nil
}
type Elf_EndianElf struct {
	EType Elf_ObjType
	Machine Elf_Machine
	EVersion uint32
	EntryPoint uint64
	ProgramHeaderOffset uint64
	SectionHeaderOffset uint64
	Flags []byte
	EEhsize uint16
	ProgramHeaderEntrySize uint16
	QtyProgramHeader uint16
	SectionHeaderEntrySize uint16
	QtySectionHeader uint16
	SectionNamesIdx uint16
	_io *kaitai.Stream
	_root *Elf
	_parent *Elf
	_raw_programHeaders [][]byte
	_raw_sectionHeaders [][]byte
	_raw_strings []byte
	_f_programHeaders bool
	programHeaders []*Elf_EndianElf_ProgramHeader
	_f_sectionHeaders bool
	sectionHeaders []*Elf_EndianElf_SectionHeader
	_f_strings bool
	strings *Elf_EndianElf_StringsStruct
	_is_le int
}
func NewElf_EndianElf() *Elf_EndianElf {
	return &Elf_EndianElf{
	}
}

func (this *Elf_EndianElf) Read(io *kaitai.Stream, parent *Elf, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = -1

	switch (this._root.Endian) {
	case Elf_Endian__Le:
		this._is_le = int(1)
	case Elf_Endian__Be:
		this._is_le = int(0)
	}

	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Elf_EndianElf) _read_le() (err error) {
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.EType = Elf_ObjType(tmp9)
	tmp10, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Machine = Elf_Machine(tmp10)
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.EVersion = uint32(tmp11)
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp12, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.EntryPoint = uint64(tmp12)
	case Elf_Bits__B64:
		tmp13, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.EntryPoint = uint64(tmp13)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp14, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.ProgramHeaderOffset = uint64(tmp14)
	case Elf_Bits__B64:
		tmp15, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.ProgramHeaderOffset = uint64(tmp15)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp16, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.SectionHeaderOffset = uint64(tmp16)
	case Elf_Bits__B64:
		tmp17, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.SectionHeaderOffset = uint64(tmp17)
	}
	tmp18, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.Flags = tmp18
	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.EEhsize = uint16(tmp19)
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ProgramHeaderEntrySize = uint16(tmp20)
	tmp21, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.QtyProgramHeader = uint16(tmp21)
	tmp22, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SectionHeaderEntrySize = uint16(tmp22)
	tmp23, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.QtySectionHeader = uint16(tmp23)
	tmp24, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SectionNamesIdx = uint16(tmp24)
	return err
}

func (this *Elf_EndianElf) _read_be() (err error) {
	tmp25, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.EType = Elf_ObjType(tmp25)
	tmp26, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Machine = Elf_Machine(tmp26)
	tmp27, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.EVersion = uint32(tmp27)
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp28, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.EntryPoint = uint64(tmp28)
	case Elf_Bits__B64:
		tmp29, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.EntryPoint = uint64(tmp29)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp30, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.ProgramHeaderOffset = uint64(tmp30)
	case Elf_Bits__B64:
		tmp31, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.ProgramHeaderOffset = uint64(tmp31)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp32, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.SectionHeaderOffset = uint64(tmp32)
	case Elf_Bits__B64:
		tmp33, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.SectionHeaderOffset = uint64(tmp33)
	}
	tmp34, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp34 = tmp34
	this.Flags = tmp34
	tmp35, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.EEhsize = uint16(tmp35)
	tmp36, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.ProgramHeaderEntrySize = uint16(tmp36)
	tmp37, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.QtyProgramHeader = uint16(tmp37)
	tmp38, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.SectionHeaderEntrySize = uint16(tmp38)
	tmp39, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.QtySectionHeader = uint16(tmp39)
	tmp40, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.SectionNamesIdx = uint16(tmp40)
	return err
}
func (this *Elf_EndianElf) ProgramHeaders() (v []*Elf_EndianElf_ProgramHeader, err error) {
	if (this._f_programHeaders) {
		return this.programHeaders, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.ProgramHeaderOffset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch this._is_le {
	case 0:
		this._raw_programHeaders = make([][]byte, this.QtyProgramHeader)
		this.programHeaders = make([]*Elf_EndianElf_ProgramHeader, this.QtyProgramHeader)
		for i := range this.programHeaders {
			tmp41, err := this._io.ReadBytes(int(this.ProgramHeaderEntrySize))
			if err != nil {
				return nil, err
			}
			tmp41 = tmp41
			this._raw_programHeaders[i] = tmp41
			_io__raw_programHeaders := kaitai.NewStream(bytes.NewReader(this._raw_programHeaders[i]))
			tmp42 := NewElf_EndianElf_ProgramHeader()
			err = tmp42.Read(_io__raw_programHeaders, this, this._root)
			if err != nil {
				return nil, err
			}
			this.programHeaders[i] = tmp42
		}
	case 1:
		this._raw_programHeaders = make([][]byte, this.QtyProgramHeader)
		this.programHeaders = make([]*Elf_EndianElf_ProgramHeader, this.QtyProgramHeader)
		for i := range this.programHeaders {
			tmp43, err := this._io.ReadBytes(int(this.ProgramHeaderEntrySize))
			if err != nil {
				return nil, err
			}
			tmp43 = tmp43
			this._raw_programHeaders[i] = tmp43
			_io__raw_programHeaders := kaitai.NewStream(bytes.NewReader(this._raw_programHeaders[i]))
			tmp44 := NewElf_EndianElf_ProgramHeader()
			err = tmp44.Read(_io__raw_programHeaders, this, this._root)
			if err != nil {
				return nil, err
			}
			this.programHeaders[i] = tmp44
		}
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_programHeaders = true
	this._f_programHeaders = true
	return this.programHeaders, nil
}
func (this *Elf_EndianElf) SectionHeaders() (v []*Elf_EndianElf_SectionHeader, err error) {
	if (this._f_sectionHeaders) {
		return this.sectionHeaders, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.SectionHeaderOffset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch this._is_le {
	case 0:
		this._raw_sectionHeaders = make([][]byte, this.QtySectionHeader)
		this.sectionHeaders = make([]*Elf_EndianElf_SectionHeader, this.QtySectionHeader)
		for i := range this.sectionHeaders {
			tmp45, err := this._io.ReadBytes(int(this.SectionHeaderEntrySize))
			if err != nil {
				return nil, err
			}
			tmp45 = tmp45
			this._raw_sectionHeaders[i] = tmp45
			_io__raw_sectionHeaders := kaitai.NewStream(bytes.NewReader(this._raw_sectionHeaders[i]))
			tmp46 := NewElf_EndianElf_SectionHeader()
			err = tmp46.Read(_io__raw_sectionHeaders, this, this._root)
			if err != nil {
				return nil, err
			}
			this.sectionHeaders[i] = tmp46
		}
	case 1:
		this._raw_sectionHeaders = make([][]byte, this.QtySectionHeader)
		this.sectionHeaders = make([]*Elf_EndianElf_SectionHeader, this.QtySectionHeader)
		for i := range this.sectionHeaders {
			tmp47, err := this._io.ReadBytes(int(this.SectionHeaderEntrySize))
			if err != nil {
				return nil, err
			}
			tmp47 = tmp47
			this._raw_sectionHeaders[i] = tmp47
			_io__raw_sectionHeaders := kaitai.NewStream(bytes.NewReader(this._raw_sectionHeaders[i]))
			tmp48 := NewElf_EndianElf_SectionHeader()
			err = tmp48.Read(_io__raw_sectionHeaders, this, this._root)
			if err != nil {
				return nil, err
			}
			this.sectionHeaders[i] = tmp48
		}
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_sectionHeaders = true
	this._f_sectionHeaders = true
	return this.sectionHeaders, nil
}
func (this *Elf_EndianElf) Strings() (v *Elf_EndianElf_StringsStruct, err error) {
	if (this._f_strings) {
		return this.strings, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp49, err := this.SectionHeaders()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(tmp49[this.SectionNamesIdx].OfsBody), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch this._is_le {
	case 0:
		tmp50, err := this.SectionHeaders()
		if err != nil {
			return nil, err
		}
		tmp51, err := this._io.ReadBytes(int(tmp50[this.SectionNamesIdx].LenBody))
		if err != nil {
			return nil, err
		}
		tmp51 = tmp51
		this._raw_strings = tmp51
		_io__raw_strings := kaitai.NewStream(bytes.NewReader(this._raw_strings))
		tmp52 := NewElf_EndianElf_StringsStruct()
		err = tmp52.Read(_io__raw_strings, this, this._root)
		if err != nil {
			return nil, err
		}
		this.strings = tmp52
	case 1:
		tmp53, err := this.SectionHeaders()
		if err != nil {
			return nil, err
		}
		tmp54, err := this._io.ReadBytes(int(tmp53[this.SectionNamesIdx].LenBody))
		if err != nil {
			return nil, err
		}
		tmp54 = tmp54
		this._raw_strings = tmp54
		_io__raw_strings := kaitai.NewStream(bytes.NewReader(this._raw_strings))
		tmp55 := NewElf_EndianElf_StringsStruct()
		err = tmp55.Read(_io__raw_strings, this, this._root)
		if err != nil {
			return nil, err
		}
		this.strings = tmp55
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_strings = true
	this._f_strings = true
	return this.strings, nil
}
type Elf_EndianElf_DynsymSectionEntry64 struct {
	NameOffset uint32
	Info uint8
	Other uint8
	Shndx uint16
	Value uint64
	Size uint64
	_io *kaitai.Stream
	_root *Elf
	_parent *Elf_EndianElf_DynsymSection
	_is_le int
}
func NewElf_EndianElf_DynsymSectionEntry64() *Elf_EndianElf_DynsymSectionEntry64 {
	return &Elf_EndianElf_DynsymSectionEntry64{
	}
}

func (this *Elf_EndianElf_DynsymSectionEntry64) Read(io *kaitai.Stream, parent *Elf_EndianElf_DynsymSection, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = this._parent._is_le


	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Elf_EndianElf_DynsymSectionEntry64) _read_le() (err error) {
	tmp56, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NameOffset = uint32(tmp56)
	tmp57, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Info = tmp57
	tmp58, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Other = tmp58
	tmp59, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Shndx = uint16(tmp59)
	tmp60, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Value = uint64(tmp60)
	tmp61, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Size = uint64(tmp61)
	return err
}

func (this *Elf_EndianElf_DynsymSectionEntry64) _read_be() (err error) {
	tmp62, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NameOffset = uint32(tmp62)
	tmp63, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Info = tmp63
	tmp64, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Other = tmp64
	tmp65, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Shndx = uint16(tmp65)
	tmp66, err := this._io.ReadU8be()
	if err != nil {
		return err
	}
	this.Value = uint64(tmp66)
	tmp67, err := this._io.ReadU8be()
	if err != nil {
		return err
	}
	this.Size = uint64(tmp67)
	return err
}
type Elf_EndianElf_ProgramHeader struct {
	Type Elf_PhType
	Flags64 uint32
	Offset uint64
	Vaddr uint64
	Paddr uint64
	Filesz uint64
	Memsz uint64
	Flags32 uint32
	Align uint64
	_io *kaitai.Stream
	_root *Elf
	_parent *Elf_EndianElf
	_raw_dynamic []byte
	_f_dynamic bool
	dynamic *Elf_EndianElf_DynamicSection
	_f_flagsObj bool
	flagsObj *Elf_PhdrTypeFlags
	_is_le int
}
func NewElf_EndianElf_ProgramHeader() *Elf_EndianElf_ProgramHeader {
	return &Elf_EndianElf_ProgramHeader{
	}
}

func (this *Elf_EndianElf_ProgramHeader) Read(io *kaitai.Stream, parent *Elf_EndianElf, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = this._parent._is_le


	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Elf_EndianElf_ProgramHeader) _read_le() (err error) {
	tmp68, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Type = Elf_PhType(tmp68)
	if (this._root.Bits == Elf_Bits__B64) {
		tmp69, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Flags64 = uint32(tmp69)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp70, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Offset = uint64(tmp70)
	case Elf_Bits__B64:
		tmp71, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Offset = uint64(tmp71)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp72, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Vaddr = uint64(tmp72)
	case Elf_Bits__B64:
		tmp73, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Vaddr = uint64(tmp73)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp74, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Paddr = uint64(tmp74)
	case Elf_Bits__B64:
		tmp75, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Paddr = uint64(tmp75)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp76, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Filesz = uint64(tmp76)
	case Elf_Bits__B64:
		tmp77, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Filesz = uint64(tmp77)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp78, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Memsz = uint64(tmp78)
	case Elf_Bits__B64:
		tmp79, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Memsz = uint64(tmp79)
	}
	if (this._root.Bits == Elf_Bits__B32) {
		tmp80, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Flags32 = uint32(tmp80)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp81, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Align = uint64(tmp81)
	case Elf_Bits__B64:
		tmp82, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Align = uint64(tmp82)
	}
	return err
}

func (this *Elf_EndianElf_ProgramHeader) _read_be() (err error) {
	tmp83, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Type = Elf_PhType(tmp83)
	if (this._root.Bits == Elf_Bits__B64) {
		tmp84, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Flags64 = uint32(tmp84)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp85, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Offset = uint64(tmp85)
	case Elf_Bits__B64:
		tmp86, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Offset = uint64(tmp86)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp87, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Vaddr = uint64(tmp87)
	case Elf_Bits__B64:
		tmp88, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Vaddr = uint64(tmp88)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp89, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Paddr = uint64(tmp89)
	case Elf_Bits__B64:
		tmp90, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Paddr = uint64(tmp90)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp91, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Filesz = uint64(tmp91)
	case Elf_Bits__B64:
		tmp92, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Filesz = uint64(tmp92)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp93, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Memsz = uint64(tmp93)
	case Elf_Bits__B64:
		tmp94, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Memsz = uint64(tmp94)
	}
	if (this._root.Bits == Elf_Bits__B32) {
		tmp95, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Flags32 = uint32(tmp95)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp96, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Align = uint64(tmp96)
	case Elf_Bits__B64:
		tmp97, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Align = uint64(tmp97)
	}
	return err
}
func (this *Elf_EndianElf_ProgramHeader) Dynamic() (v *Elf_EndianElf_DynamicSection, err error) {
	if (this._f_dynamic) {
		return this.dynamic, nil
	}
	if (this.Type == Elf_PhType__Dynamic) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.Offset), io.SeekStart)
		if err != nil {
			return nil, err
		}
		switch this._is_le {
		case 0:
			tmp98, err := thisIo.ReadBytes(int(this.Filesz))
			if err != nil {
				return nil, err
			}
			tmp98 = tmp98
			this._raw_dynamic = tmp98
			_io__raw_dynamic := kaitai.NewStream(bytes.NewReader(this._raw_dynamic))
			tmp99 := NewElf_EndianElf_DynamicSection()
			err = tmp99.Read(_io__raw_dynamic, this, this._root)
			if err != nil {
				return nil, err
			}
			this.dynamic = tmp99
		case 1:
			tmp100, err := thisIo.ReadBytes(int(this.Filesz))
			if err != nil {
				return nil, err
			}
			tmp100 = tmp100
			this._raw_dynamic = tmp100
			_io__raw_dynamic := kaitai.NewStream(bytes.NewReader(this._raw_dynamic))
			tmp101 := NewElf_EndianElf_DynamicSection()
			err = tmp101.Read(_io__raw_dynamic, this, this._root)
			if err != nil {
				return nil, err
			}
			this.dynamic = tmp101
		default:
			err = kaitai.UndecidedEndiannessError{}
		}
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_dynamic = true
	}
	this._f_dynamic = true
	return this.dynamic, nil
}
func (this *Elf_EndianElf_ProgramHeader) FlagsObj() (v *Elf_PhdrTypeFlags, err error) {
	if (this._f_flagsObj) {
		return this.flagsObj, nil
	}
	switch this._is_le {
	case 0:
		tmp102 := NewElf_PhdrTypeFlags((this.Flags64 | this.Flags32))
		err = tmp102.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.flagsObj = tmp102
	case 1:
		tmp103 := NewElf_PhdrTypeFlags((this.Flags64 | this.Flags32))
		err = tmp103.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.flagsObj = tmp103
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	this._f_flagsObj = true
	this._f_flagsObj = true
	return this.flagsObj, nil
}
type Elf_EndianElf_DynamicSectionEntry struct {
	Tag uint64
	ValueOrPtr uint64
	_io *kaitai.Stream
	_root *Elf
	_parent *Elf_EndianElf_DynamicSection
	_f_tagEnum bool
	tagEnum Elf_DynamicArrayTags
	_f_flag1Values bool
	flag1Values *Elf_DtFlag1Values
	_is_le int
}
func NewElf_EndianElf_DynamicSectionEntry() *Elf_EndianElf_DynamicSectionEntry {
	return &Elf_EndianElf_DynamicSectionEntry{
	}
}

func (this *Elf_EndianElf_DynamicSectionEntry) Read(io *kaitai.Stream, parent *Elf_EndianElf_DynamicSection, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = this._parent._is_le


	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Elf_EndianElf_DynamicSectionEntry) _read_le() (err error) {
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp104, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Tag = uint64(tmp104)
	case Elf_Bits__B64:
		tmp105, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Tag = uint64(tmp105)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp106, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.ValueOrPtr = uint64(tmp106)
	case Elf_Bits__B64:
		tmp107, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.ValueOrPtr = uint64(tmp107)
	}
	return err
}

func (this *Elf_EndianElf_DynamicSectionEntry) _read_be() (err error) {
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp108, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Tag = uint64(tmp108)
	case Elf_Bits__B64:
		tmp109, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Tag = uint64(tmp109)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp110, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.ValueOrPtr = uint64(tmp110)
	case Elf_Bits__B64:
		tmp111, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.ValueOrPtr = uint64(tmp111)
	}
	return err
}
func (this *Elf_EndianElf_DynamicSectionEntry) TagEnum() (v Elf_DynamicArrayTags, err error) {
	if (this._f_tagEnum) {
		return this.tagEnum, nil
	}
	this.tagEnum = Elf_DynamicArrayTags(Elf_DynamicArrayTags(this.Tag))
	this._f_tagEnum = true
	return this.tagEnum, nil
}
func (this *Elf_EndianElf_DynamicSectionEntry) Flag1Values() (v *Elf_DtFlag1Values, err error) {
	if (this._f_flag1Values) {
		return this.flag1Values, nil
	}
	tmp112, err := this.TagEnum()
	if err != nil {
		return nil, err
	}
	if (tmp112 == Elf_DynamicArrayTags__Flags1) {
		switch this._is_le {
		case 0:
			tmp113 := NewElf_DtFlag1Values(this.ValueOrPtr)
			err = tmp113.Read(this._io, this, this._root)
			if err != nil {
				return nil, err
			}
			this.flag1Values = tmp113
		case 1:
			tmp114 := NewElf_DtFlag1Values(this.ValueOrPtr)
			err = tmp114.Read(this._io, this, this._root)
			if err != nil {
				return nil, err
			}
			this.flag1Values = tmp114
		default:
			err = kaitai.UndecidedEndiannessError{}
		}
		this._f_flag1Values = true
	}
	this._f_flag1Values = true
	return this.flag1Values, nil
}
type Elf_EndianElf_SectionHeader struct {
	OfsName uint32
	Type Elf_ShType
	Flags uint64
	Addr uint64
	OfsBody uint64
	LenBody uint64
	LinkedSectionIdx uint32
	Info []byte
	Align uint64
	EntrySize uint64
	_io *kaitai.Stream
	_root *Elf
	_parent *Elf_EndianElf
	_raw_body []byte
	_f_body bool
	body interface{}
	_f_name bool
	name string
	_f_flagsObj bool
	flagsObj *Elf_SectionHeaderFlags
	_is_le int
}
func NewElf_EndianElf_SectionHeader() *Elf_EndianElf_SectionHeader {
	return &Elf_EndianElf_SectionHeader{
	}
}

func (this *Elf_EndianElf_SectionHeader) Read(io *kaitai.Stream, parent *Elf_EndianElf, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = this._parent._is_le


	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Elf_EndianElf_SectionHeader) _read_le() (err error) {
	tmp115, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsName = uint32(tmp115)
	tmp116, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Type = Elf_ShType(tmp116)
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp117, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Flags = uint64(tmp117)
	case Elf_Bits__B64:
		tmp118, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Flags = uint64(tmp118)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp119, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Addr = uint64(tmp119)
	case Elf_Bits__B64:
		tmp120, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Addr = uint64(tmp120)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp121, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.OfsBody = uint64(tmp121)
	case Elf_Bits__B64:
		tmp122, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.OfsBody = uint64(tmp122)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp123, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.LenBody = uint64(tmp123)
	case Elf_Bits__B64:
		tmp124, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.LenBody = uint64(tmp124)
	}
	tmp125, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LinkedSectionIdx = uint32(tmp125)
	tmp126, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp126 = tmp126
	this.Info = tmp126
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp127, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.Align = uint64(tmp127)
	case Elf_Bits__B64:
		tmp128, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.Align = uint64(tmp128)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp129, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.EntrySize = uint64(tmp129)
	case Elf_Bits__B64:
		tmp130, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.EntrySize = uint64(tmp130)
	}
	return err
}

func (this *Elf_EndianElf_SectionHeader) _read_be() (err error) {
	tmp131, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsName = uint32(tmp131)
	tmp132, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Type = Elf_ShType(tmp132)
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp133, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Flags = uint64(tmp133)
	case Elf_Bits__B64:
		tmp134, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Flags = uint64(tmp134)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp135, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Addr = uint64(tmp135)
	case Elf_Bits__B64:
		tmp136, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Addr = uint64(tmp136)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp137, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.OfsBody = uint64(tmp137)
	case Elf_Bits__B64:
		tmp138, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.OfsBody = uint64(tmp138)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp139, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.LenBody = uint64(tmp139)
	case Elf_Bits__B64:
		tmp140, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.LenBody = uint64(tmp140)
	}
	tmp141, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LinkedSectionIdx = uint32(tmp141)
	tmp142, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp142 = tmp142
	this.Info = tmp142
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp143, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.Align = uint64(tmp143)
	case Elf_Bits__B64:
		tmp144, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Align = uint64(tmp144)
	}
	switch (this._root.Bits) {
	case Elf_Bits__B32:
		tmp145, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.EntrySize = uint64(tmp145)
	case Elf_Bits__B64:
		tmp146, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.EntrySize = uint64(tmp146)
	}
	return err
}
func (this *Elf_EndianElf_SectionHeader) Body() (v interface{}, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsBody), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch this._is_le {
	case 0:
		switch (this.Type) {
		case Elf_ShType__Strtab:
			tmp147, err := thisIo.ReadBytes(int(this.LenBody))
			if err != nil {
				return nil, err
			}
			tmp147 = tmp147
			this._raw_body = tmp147
			_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
			tmp148 := NewElf_EndianElf_StringsStruct()
			err = tmp148.Read(_io__raw_body, this, this._root)
			if err != nil {
				return nil, err
			}
			this.body = tmp148
		case Elf_ShType__Dynamic:
			tmp149, err := thisIo.ReadBytes(int(this.LenBody))
			if err != nil {
				return nil, err
			}
			tmp149 = tmp149
			this._raw_body = tmp149
			_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
			tmp150 := NewElf_EndianElf_DynamicSection()
			err = tmp150.Read(_io__raw_body, this, this._root)
			if err != nil {
				return nil, err
			}
			this.body = tmp150
		case Elf_ShType__Dynsym:
			tmp151, err := thisIo.ReadBytes(int(this.LenBody))
			if err != nil {
				return nil, err
			}
			tmp151 = tmp151
			this._raw_body = tmp151
			_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
			tmp152 := NewElf_EndianElf_DynsymSection()
			err = tmp152.Read(_io__raw_body, this, this._root)
			if err != nil {
				return nil, err
			}
			this.body = tmp152
		case Elf_ShType__Dynstr:
			tmp153, err := thisIo.ReadBytes(int(this.LenBody))
			if err != nil {
				return nil, err
			}
			tmp153 = tmp153
			this._raw_body = tmp153
			_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
			tmp154 := NewElf_EndianElf_StringsStruct()
			err = tmp154.Read(_io__raw_body, this, this._root)
			if err != nil {
				return nil, err
			}
			this.body = tmp154
		default:
			tmp155, err := thisIo.ReadBytes(int(this.LenBody))
			if err != nil {
				return nil, err
			}
			tmp155 = tmp155
			this._raw_body = tmp155
		}
	case 1:
		switch (this.Type) {
		case Elf_ShType__Strtab:
			tmp156, err := thisIo.ReadBytes(int(this.LenBody))
			if err != nil {
				return nil, err
			}
			tmp156 = tmp156
			this._raw_body = tmp156
			_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
			tmp157 := NewElf_EndianElf_StringsStruct()
			err = tmp157.Read(_io__raw_body, this, this._root)
			if err != nil {
				return nil, err
			}
			this.body = tmp157
		case Elf_ShType__Dynamic:
			tmp158, err := thisIo.ReadBytes(int(this.LenBody))
			if err != nil {
				return nil, err
			}
			tmp158 = tmp158
			this._raw_body = tmp158
			_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
			tmp159 := NewElf_EndianElf_DynamicSection()
			err = tmp159.Read(_io__raw_body, this, this._root)
			if err != nil {
				return nil, err
			}
			this.body = tmp159
		case Elf_ShType__Dynsym:
			tmp160, err := thisIo.ReadBytes(int(this.LenBody))
			if err != nil {
				return nil, err
			}
			tmp160 = tmp160
			this._raw_body = tmp160
			_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
			tmp161 := NewElf_EndianElf_DynsymSection()
			err = tmp161.Read(_io__raw_body, this, this._root)
			if err != nil {
				return nil, err
			}
			this.body = tmp161
		case Elf_ShType__Dynstr:
			tmp162, err := thisIo.ReadBytes(int(this.LenBody))
			if err != nil {
				return nil, err
			}
			tmp162 = tmp162
			this._raw_body = tmp162
			_io__raw_body := kaitai.NewStream(bytes.NewReader(this._raw_body))
			tmp163 := NewElf_EndianElf_StringsStruct()
			err = tmp163.Read(_io__raw_body, this, this._root)
			if err != nil {
				return nil, err
			}
			this.body = tmp163
		default:
			tmp164, err := thisIo.ReadBytes(int(this.LenBody))
			if err != nil {
				return nil, err
			}
			tmp164 = tmp164
			this._raw_body = tmp164
		}
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}
func (this *Elf_EndianElf_SectionHeader) Name() (v string, err error) {
	if (this._f_name) {
		return this.name, nil
	}
	tmp165, err := this._root.Header.Strings()
	if err != nil {
		return "", err
	}
	thisIo := tmp165._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return "", err
	}
	_, err = thisIo.Seek(int64(this.OfsName), io.SeekStart)
	if err != nil {
		return "", err
	}
	switch this._is_le {
	case 0:
		tmp166, err := thisIo.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return "", err
		}
		this.name = string(tmp166)
	case 1:
		tmp167, err := thisIo.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return "", err
		}
		this.name = string(tmp167)
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_name = true
	this._f_name = true
	return this.name, nil
}
func (this *Elf_EndianElf_SectionHeader) FlagsObj() (v *Elf_SectionHeaderFlags, err error) {
	if (this._f_flagsObj) {
		return this.flagsObj, nil
	}
	switch this._is_le {
	case 0:
		tmp168 := NewElf_SectionHeaderFlags(this.Flags)
		err = tmp168.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.flagsObj = tmp168
	case 1:
		tmp169 := NewElf_SectionHeaderFlags(this.Flags)
		err = tmp169.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.flagsObj = tmp169
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	this._f_flagsObj = true
	this._f_flagsObj = true
	return this.flagsObj, nil
}
type Elf_EndianElf_DynamicSection struct {
	Entries []*Elf_EndianElf_DynamicSectionEntry
	_io *kaitai.Stream
	_root *Elf
	_parent interface{}
	_is_le int
}
func NewElf_EndianElf_DynamicSection() *Elf_EndianElf_DynamicSection {
	return &Elf_EndianElf_DynamicSection{
	}
}

func (this *Elf_EndianElf_DynamicSection) Read(io *kaitai.Stream, parent interface{}, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = this._parent._is_le


	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Elf_EndianElf_DynamicSection) _read_le() (err error) {
	for i := 1;; i++ {
		tmp170, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp170 {
			break
		}
		tmp171 := NewElf_EndianElf_DynamicSectionEntry()
		err = tmp171.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp171)
	}
	return err
}

func (this *Elf_EndianElf_DynamicSection) _read_be() (err error) {
	for i := 1;; i++ {
		tmp172, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp172 {
			break
		}
		tmp173 := NewElf_EndianElf_DynamicSectionEntry()
		err = tmp173.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp173)
	}
	return err
}
type Elf_EndianElf_DynsymSection struct {
	Entries []interface{}
	_io *kaitai.Stream
	_root *Elf
	_parent *Elf_EndianElf_SectionHeader
	_is_le int
}
func NewElf_EndianElf_DynsymSection() *Elf_EndianElf_DynsymSection {
	return &Elf_EndianElf_DynsymSection{
	}
}

func (this *Elf_EndianElf_DynsymSection) Read(io *kaitai.Stream, parent *Elf_EndianElf_SectionHeader, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = this._parent._is_le


	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Elf_EndianElf_DynsymSection) _read_le() (err error) {
	for i := 1;; i++ {
		tmp174, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp174 {
			break
		}
		switch (this._root.Bits) {
		case Elf_Bits__B32:
			tmp175 := NewElf_EndianElf_DynsymSectionEntry32()
			err = tmp175.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Entries = append(this.Entries, tmp175)
		case Elf_Bits__B64:
			tmp176 := NewElf_EndianElf_DynsymSectionEntry64()
			err = tmp176.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Entries = append(this.Entries, tmp176)
		}
	}
	return err
}

func (this *Elf_EndianElf_DynsymSection) _read_be() (err error) {
	for i := 1;; i++ {
		tmp177, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp177 {
			break
		}
		switch (this._root.Bits) {
		case Elf_Bits__B32:
			tmp178 := NewElf_EndianElf_DynsymSectionEntry32()
			err = tmp178.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Entries = append(this.Entries, tmp178)
		case Elf_Bits__B64:
			tmp179 := NewElf_EndianElf_DynsymSectionEntry64()
			err = tmp179.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Entries = append(this.Entries, tmp179)
		}
	}
	return err
}
type Elf_EndianElf_DynsymSectionEntry32 struct {
	NameOffset uint32
	Value uint32
	Size uint32
	Info uint8
	Other uint8
	Shndx uint16
	_io *kaitai.Stream
	_root *Elf
	_parent *Elf_EndianElf_DynsymSection
	_is_le int
}
func NewElf_EndianElf_DynsymSectionEntry32() *Elf_EndianElf_DynsymSectionEntry32 {
	return &Elf_EndianElf_DynsymSectionEntry32{
	}
}

func (this *Elf_EndianElf_DynsymSectionEntry32) Read(io *kaitai.Stream, parent *Elf_EndianElf_DynsymSection, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = this._parent._is_le


	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Elf_EndianElf_DynsymSectionEntry32) _read_le() (err error) {
	tmp180, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NameOffset = uint32(tmp180)
	tmp181, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Value = uint32(tmp181)
	tmp182, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp182)
	tmp183, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Info = tmp183
	tmp184, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Other = tmp184
	tmp185, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Shndx = uint16(tmp185)
	return err
}

func (this *Elf_EndianElf_DynsymSectionEntry32) _read_be() (err error) {
	tmp186, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NameOffset = uint32(tmp186)
	tmp187, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Value = uint32(tmp187)
	tmp188, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp188)
	tmp189, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Info = tmp189
	tmp190, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Other = tmp190
	tmp191, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Shndx = uint16(tmp191)
	return err
}
type Elf_EndianElf_StringsStruct struct {
	Entries []string
	_io *kaitai.Stream
	_root *Elf
	_parent interface{}
	_is_le int
}
func NewElf_EndianElf_StringsStruct() *Elf_EndianElf_StringsStruct {
	return &Elf_EndianElf_StringsStruct{
	}
}

func (this *Elf_EndianElf_StringsStruct) Read(io *kaitai.Stream, parent interface{}, root *Elf) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = this._parent._is_le


	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Elf_EndianElf_StringsStruct) _read_le() (err error) {
	for i := 1;; i++ {
		tmp192, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp192 {
			break
		}
		tmp193, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, string(tmp193))
	}
	return err
}

func (this *Elf_EndianElf_StringsStruct) _read_be() (err error) {
	for i := 1;; i++ {
		tmp194, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp194 {
			break
		}
		tmp195, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, string(tmp195))
	}
	return err
}
