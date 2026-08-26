// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]

extern crate kaitai;
use kaitai::*;
use std::convert::{TryFrom, TryInto};
use std::cell::{Ref, Cell, RefCell};
use std::rc::{Rc, Weak};

/**
 * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h Source
 * \sa https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-application-binary-interface.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    bits: RefCell<Elf_Bits>,
    endian: RefCell<Elf_Endian>,
    ei_version: RefCell<u8>,
    abi: RefCell<Elf_OsAbi>,
    abi_version: RefCell<u8>,
    pad: RefCell<Vec<u8>>,
    header: RefCell<OptRc<Elf_EndianElf>>,
    _io: RefCell<BytesReader>,
    f_sh_idx_hi_os: Cell<bool>,
    sh_idx_hi_os: RefCell<i32>,
    f_sh_idx_hi_proc: Cell<bool>,
    sh_idx_hi_proc: RefCell<i32>,
    f_sh_idx_hi_reserved: Cell<bool>,
    sh_idx_hi_reserved: RefCell<i32>,
    f_sh_idx_lo_os: Cell<bool>,
    sh_idx_lo_os: RefCell<i32>,
    f_sh_idx_lo_proc: Cell<bool>,
    sh_idx_lo_proc: RefCell<i32>,
    f_sh_idx_lo_reserved: Cell<bool>,
    sh_idx_lo_reserved: RefCell<i32>,
}
impl KStruct for Elf {
    type Root = Elf;
    type Parent = Elf;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x7fu8, 0x45u8, 0x4cu8, 0x46u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.bits.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.endian.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.ei_version.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.ei_version() as u8) == (1 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/3".to_string() }));
        }
        *self_rc.abi.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.abi_version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.pad.borrow_mut() = _io.read_bytes(7 as usize)?.into();
        if !(*self_rc.pad() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/6".to_string() }));
        }
        let t = Self::read_into::<_, Elf_EndianElf>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl Elf {
    pub fn sh_idx_hi_os(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sh_idx_hi_os.get() {
            return Ok(self.sh_idx_hi_os.borrow());
        }
        self.f_sh_idx_hi_os.set(true);
        *self.sh_idx_hi_os.borrow_mut() = (65343) as i32;
        Ok(self.sh_idx_hi_os.borrow())
    }
    pub fn sh_idx_hi_proc(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sh_idx_hi_proc.get() {
            return Ok(self.sh_idx_hi_proc.borrow());
        }
        self.f_sh_idx_hi_proc.set(true);
        *self.sh_idx_hi_proc.borrow_mut() = (65311) as i32;
        Ok(self.sh_idx_hi_proc.borrow())
    }
    pub fn sh_idx_hi_reserved(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sh_idx_hi_reserved.get() {
            return Ok(self.sh_idx_hi_reserved.borrow());
        }
        self.f_sh_idx_hi_reserved.set(true);
        *self.sh_idx_hi_reserved.borrow_mut() = (65535) as i32;
        Ok(self.sh_idx_hi_reserved.borrow())
    }
    pub fn sh_idx_lo_os(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sh_idx_lo_os.get() {
            return Ok(self.sh_idx_lo_os.borrow());
        }
        self.f_sh_idx_lo_os.set(true);
        *self.sh_idx_lo_os.borrow_mut() = (65312) as i32;
        Ok(self.sh_idx_lo_os.borrow())
    }
    pub fn sh_idx_lo_proc(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sh_idx_lo_proc.get() {
            return Ok(self.sh_idx_lo_proc.borrow());
        }
        self.f_sh_idx_lo_proc.set(true);
        *self.sh_idx_lo_proc.borrow_mut() = (65280) as i32;
        Ok(self.sh_idx_lo_proc.borrow())
    }
    pub fn sh_idx_lo_reserved(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sh_idx_lo_reserved.get() {
            return Ok(self.sh_idx_lo_reserved.borrow());
        }
        self.f_sh_idx_lo_reserved.set(true);
        *self.sh_idx_lo_reserved.borrow_mut() = (65280) as i32;
        Ok(self.sh_idx_lo_reserved.borrow())
    }
}

/**
 * File identification, must be 0x7f + "ELF".
 */
impl Elf {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * File class: designates target machine word size (32 or 64
 * bits). The size of many integer fields in this format will
 * depend on this setting.
 */
impl Elf {
    pub fn bits(&self) -> Ref<'_, Elf_Bits> {
        self.bits.borrow()
    }
}

/**
 * Endianness used for all integers.
 */
impl Elf {
    pub fn endian(&self) -> Ref<'_, Elf_Endian> {
        self.endian.borrow()
    }
}

/**
 * ELF header version.
 */
impl Elf {
    pub fn ei_version(&self) -> Ref<'_, u8> {
        self.ei_version.borrow()
    }
}

/**
 * Specifies which OS- and ABI-related extensions will be used
 * in this ELF file.
 */
impl Elf {
    pub fn abi(&self) -> Ref<'_, Elf_OsAbi> {
        self.abi.borrow()
    }
}

/**
 * Version of ABI targeted by this ELF file. Interpretation
 * depends on `abi` attribute.
 */
impl Elf {
    pub fn abi_version(&self) -> Ref<'_, u8> {
        self.abi_version.borrow()
    }
}
impl Elf {
    pub fn pad(&self) -> Ref<'_, Vec<u8>> {
        self.pad.borrow()
    }
}
impl Elf {
    pub fn header(&self) -> Ref<'_, OptRc<Elf_EndianElf>> {
        self.header.borrow()
    }
}
impl Elf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Elf_Bits {
    B32,
    B64,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_Bits {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_Bits> {
        match flag {
            1 => Ok(Elf_Bits::B32),
            2 => Ok(Elf_Bits::B64),
            _ => Ok(Elf_Bits::Unknown(flag)),
        }
    }
}

impl From<&Elf_Bits> for i64 {
    fn from(v: &Elf_Bits) -> Self {
        match *v {
            Elf_Bits::B32 => 1,
            Elf_Bits::B64 => 2,
            Elf_Bits::Unknown(v) => v
        }
    }
}

impl Default for Elf_Bits {
    fn default() -> Self { Elf_Bits::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_DynamicArrayTags {

    /**
     * Marks end of dynamic section
     */
    Null,
    Needed,
    Pltrelsz,
    Pltgot,
    Hash,

    /**
     * Address of string table
     */
    Strtab,
    Symtab,
    Rela,
    Relasz,
    Relaent,

    /**
     * Size of string table
     */
    Strsz,
    Syment,
    Init,
    Fini,
    Soname,
    Rpath,
    Symbolic,
    Rel,
    Relsz,
    Relent,
    Pltrel,
    Debug,
    Textrel,
    Jmprel,
    BindNow,
    InitArray,
    FiniArray,
    InitArraysz,
    FiniArraysz,
    Runpath,
    Flags,
    PreinitArray,
    PreinitArraysz,
    SymtabShndx,
    Relrsz,
    Relr,
    Relrent,

    /**
     * DT_SPARC_REGISTER was originally assigned 0x7000001. It is processor
     * specific, and should have been in the range DT_LOPROC-DT_HIPROC
     * instead of here. When the error was fixed,
     * DT_DEPRECATED_SPARC_REGISTER was created to maintain backward
     * compatibility.
     * \sa https://github.com/illumos/illumos-gate/blob/1d806c5f41/usr/src/cmd/sgs/libconv/common/dynamic.c#L522-L528 Source
     * \sa https://github.com/illumos/illumos-gate/blob/1d806c5f41/usr/src/boot/sys/sys/elf_common.h#L634-L635 Source
     */
    DeprecatedSparcRegister,
    SunwAuxiliary,
    SunwRtldinf,

    /**
     * Note: <https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER6-TBL-52>
     * states that `DT_SUNW_FILTER` has the value `0x6000000e`, but this is
     * apparently only a human error - that would make the value collide with
     * the previous one (`DT_SUNW_RTLDINF`) and there is not even a single
     * source supporting this other than verbatim copies of the same table.
     * \sa https://github.com/gcc-mirror/gcc/blob/240f07805d/libphobos/libdruntime/core/sys/solaris/sys/link.d#L77 Source
     * \sa https://github.com/illumos/illumos-gate/blob/1d806c5f41/usr/src/uts/common/sys/link.h#L136 Source
     */
    SunwFilter,
    SunwCap,
    SunwSymtab,
    SunwSymsz,
    SunwSortent,
    SunwSymsort,
    SunwSymsortsz,
    SunwTlssort,
    SunwTlssortsz,
    SunwCapinfo,
    SunwStrpad,
    SunwCapchain,
    SunwLdmach,
    SunwSymtabShndx,
    SunwCapchainent,
    SunwDeferred,
    SunwCapchainsz,
    SunwPhname,
    SunwParent,
    SunwSxAslr,
    SunwRelax,
    SunwKmod,
    SunwSxNxheap,
    SunwSxNxstack,
    SunwSxAdiheap,
    SunwSxAdistack,
    SunwSxSsbd,
    SunwSymnsort,
    SunwSymnsortsz,
    GnuFlags1,
    GnuPrelinked,
    GnuConflictsz,
    GnuLiblistsz,
    Checksum,
    Pltpadsz,
    Moveent,
    Movesz,
    Feature1,
    Posflag1,
    Syminsz,
    Syminent,
    GnuHash,
    TlsdescPlt,
    TlsdescGot,
    GnuConflict,
    GnuLiblist,
    Config,
    Depaudit,
    Audit,
    Pltpad,
    Movetab,
    Syminfo,
    Versym,
    Relacount,
    Relcount,
    Flags1,
    Verdef,

    /**
     * Number of version definitions
     */
    Verdefnum,
    Verneed,

    /**
     * Number of dependency versions
     */
    Verneednum,
    SparcRegister,
    Auxiliary,
    Used,
    Filter,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_DynamicArrayTags {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_DynamicArrayTags> {
        match flag {
            0 => Ok(Elf_DynamicArrayTags::Null),
            1 => Ok(Elf_DynamicArrayTags::Needed),
            2 => Ok(Elf_DynamicArrayTags::Pltrelsz),
            3 => Ok(Elf_DynamicArrayTags::Pltgot),
            4 => Ok(Elf_DynamicArrayTags::Hash),
            5 => Ok(Elf_DynamicArrayTags::Strtab),
            6 => Ok(Elf_DynamicArrayTags::Symtab),
            7 => Ok(Elf_DynamicArrayTags::Rela),
            8 => Ok(Elf_DynamicArrayTags::Relasz),
            9 => Ok(Elf_DynamicArrayTags::Relaent),
            10 => Ok(Elf_DynamicArrayTags::Strsz),
            11 => Ok(Elf_DynamicArrayTags::Syment),
            12 => Ok(Elf_DynamicArrayTags::Init),
            13 => Ok(Elf_DynamicArrayTags::Fini),
            14 => Ok(Elf_DynamicArrayTags::Soname),
            15 => Ok(Elf_DynamicArrayTags::Rpath),
            16 => Ok(Elf_DynamicArrayTags::Symbolic),
            17 => Ok(Elf_DynamicArrayTags::Rel),
            18 => Ok(Elf_DynamicArrayTags::Relsz),
            19 => Ok(Elf_DynamicArrayTags::Relent),
            20 => Ok(Elf_DynamicArrayTags::Pltrel),
            21 => Ok(Elf_DynamicArrayTags::Debug),
            22 => Ok(Elf_DynamicArrayTags::Textrel),
            23 => Ok(Elf_DynamicArrayTags::Jmprel),
            24 => Ok(Elf_DynamicArrayTags::BindNow),
            25 => Ok(Elf_DynamicArrayTags::InitArray),
            26 => Ok(Elf_DynamicArrayTags::FiniArray),
            27 => Ok(Elf_DynamicArrayTags::InitArraysz),
            28 => Ok(Elf_DynamicArrayTags::FiniArraysz),
            29 => Ok(Elf_DynamicArrayTags::Runpath),
            30 => Ok(Elf_DynamicArrayTags::Flags),
            32 => Ok(Elf_DynamicArrayTags::PreinitArray),
            33 => Ok(Elf_DynamicArrayTags::PreinitArraysz),
            34 => Ok(Elf_DynamicArrayTags::SymtabShndx),
            35 => Ok(Elf_DynamicArrayTags::Relrsz),
            36 => Ok(Elf_DynamicArrayTags::Relr),
            37 => Ok(Elf_DynamicArrayTags::Relrent),
            117440513 => Ok(Elf_DynamicArrayTags::DeprecatedSparcRegister),
            1610612749 => Ok(Elf_DynamicArrayTags::SunwAuxiliary),
            1610612750 => Ok(Elf_DynamicArrayTags::SunwRtldinf),
            1610612751 => Ok(Elf_DynamicArrayTags::SunwFilter),
            1610612752 => Ok(Elf_DynamicArrayTags::SunwCap),
            1610612753 => Ok(Elf_DynamicArrayTags::SunwSymtab),
            1610612754 => Ok(Elf_DynamicArrayTags::SunwSymsz),
            1610612755 => Ok(Elf_DynamicArrayTags::SunwSortent),
            1610612756 => Ok(Elf_DynamicArrayTags::SunwSymsort),
            1610612757 => Ok(Elf_DynamicArrayTags::SunwSymsortsz),
            1610612758 => Ok(Elf_DynamicArrayTags::SunwTlssort),
            1610612759 => Ok(Elf_DynamicArrayTags::SunwTlssortsz),
            1610612760 => Ok(Elf_DynamicArrayTags::SunwCapinfo),
            1610612761 => Ok(Elf_DynamicArrayTags::SunwStrpad),
            1610612762 => Ok(Elf_DynamicArrayTags::SunwCapchain),
            1610612763 => Ok(Elf_DynamicArrayTags::SunwLdmach),
            1610612764 => Ok(Elf_DynamicArrayTags::SunwSymtabShndx),
            1610612765 => Ok(Elf_DynamicArrayTags::SunwCapchainent),
            1610612766 => Ok(Elf_DynamicArrayTags::SunwDeferred),
            1610612767 => Ok(Elf_DynamicArrayTags::SunwCapchainsz),
            1610612768 => Ok(Elf_DynamicArrayTags::SunwPhname),
            1610612769 => Ok(Elf_DynamicArrayTags::SunwParent),
            1610612771 => Ok(Elf_DynamicArrayTags::SunwSxAslr),
            1610612773 => Ok(Elf_DynamicArrayTags::SunwRelax),
            1610612775 => Ok(Elf_DynamicArrayTags::SunwKmod),
            1610612777 => Ok(Elf_DynamicArrayTags::SunwSxNxheap),
            1610612779 => Ok(Elf_DynamicArrayTags::SunwSxNxstack),
            1610612781 => Ok(Elf_DynamicArrayTags::SunwSxAdiheap),
            1610612783 => Ok(Elf_DynamicArrayTags::SunwSxAdistack),
            1610612785 => Ok(Elf_DynamicArrayTags::SunwSxSsbd),
            1610612786 => Ok(Elf_DynamicArrayTags::SunwSymnsort),
            1610612787 => Ok(Elf_DynamicArrayTags::SunwSymnsortsz),
            1879047668 => Ok(Elf_DynamicArrayTags::GnuFlags1),
            1879047669 => Ok(Elf_DynamicArrayTags::GnuPrelinked),
            1879047670 => Ok(Elf_DynamicArrayTags::GnuConflictsz),
            1879047671 => Ok(Elf_DynamicArrayTags::GnuLiblistsz),
            1879047672 => Ok(Elf_DynamicArrayTags::Checksum),
            1879047673 => Ok(Elf_DynamicArrayTags::Pltpadsz),
            1879047674 => Ok(Elf_DynamicArrayTags::Moveent),
            1879047675 => Ok(Elf_DynamicArrayTags::Movesz),
            1879047676 => Ok(Elf_DynamicArrayTags::Feature1),
            1879047677 => Ok(Elf_DynamicArrayTags::Posflag1),
            1879047678 => Ok(Elf_DynamicArrayTags::Syminsz),
            1879047679 => Ok(Elf_DynamicArrayTags::Syminent),
            1879047925 => Ok(Elf_DynamicArrayTags::GnuHash),
            1879047926 => Ok(Elf_DynamicArrayTags::TlsdescPlt),
            1879047927 => Ok(Elf_DynamicArrayTags::TlsdescGot),
            1879047928 => Ok(Elf_DynamicArrayTags::GnuConflict),
            1879047929 => Ok(Elf_DynamicArrayTags::GnuLiblist),
            1879047930 => Ok(Elf_DynamicArrayTags::Config),
            1879047931 => Ok(Elf_DynamicArrayTags::Depaudit),
            1879047932 => Ok(Elf_DynamicArrayTags::Audit),
            1879047933 => Ok(Elf_DynamicArrayTags::Pltpad),
            1879047934 => Ok(Elf_DynamicArrayTags::Movetab),
            1879047935 => Ok(Elf_DynamicArrayTags::Syminfo),
            1879048176 => Ok(Elf_DynamicArrayTags::Versym),
            1879048185 => Ok(Elf_DynamicArrayTags::Relacount),
            1879048186 => Ok(Elf_DynamicArrayTags::Relcount),
            1879048187 => Ok(Elf_DynamicArrayTags::Flags1),
            1879048188 => Ok(Elf_DynamicArrayTags::Verdef),
            1879048189 => Ok(Elf_DynamicArrayTags::Verdefnum),
            1879048190 => Ok(Elf_DynamicArrayTags::Verneed),
            1879048191 => Ok(Elf_DynamicArrayTags::Verneednum),
            1879048193 => Ok(Elf_DynamicArrayTags::SparcRegister),
            2147483645 => Ok(Elf_DynamicArrayTags::Auxiliary),
            2147483646 => Ok(Elf_DynamicArrayTags::Used),
            2147483647 => Ok(Elf_DynamicArrayTags::Filter),
            _ => Ok(Elf_DynamicArrayTags::Unknown(flag)),
        }
    }
}

impl From<&Elf_DynamicArrayTags> for i64 {
    fn from(v: &Elf_DynamicArrayTags) -> Self {
        match *v {
            Elf_DynamicArrayTags::Null => 0,
            Elf_DynamicArrayTags::Needed => 1,
            Elf_DynamicArrayTags::Pltrelsz => 2,
            Elf_DynamicArrayTags::Pltgot => 3,
            Elf_DynamicArrayTags::Hash => 4,
            Elf_DynamicArrayTags::Strtab => 5,
            Elf_DynamicArrayTags::Symtab => 6,
            Elf_DynamicArrayTags::Rela => 7,
            Elf_DynamicArrayTags::Relasz => 8,
            Elf_DynamicArrayTags::Relaent => 9,
            Elf_DynamicArrayTags::Strsz => 10,
            Elf_DynamicArrayTags::Syment => 11,
            Elf_DynamicArrayTags::Init => 12,
            Elf_DynamicArrayTags::Fini => 13,
            Elf_DynamicArrayTags::Soname => 14,
            Elf_DynamicArrayTags::Rpath => 15,
            Elf_DynamicArrayTags::Symbolic => 16,
            Elf_DynamicArrayTags::Rel => 17,
            Elf_DynamicArrayTags::Relsz => 18,
            Elf_DynamicArrayTags::Relent => 19,
            Elf_DynamicArrayTags::Pltrel => 20,
            Elf_DynamicArrayTags::Debug => 21,
            Elf_DynamicArrayTags::Textrel => 22,
            Elf_DynamicArrayTags::Jmprel => 23,
            Elf_DynamicArrayTags::BindNow => 24,
            Elf_DynamicArrayTags::InitArray => 25,
            Elf_DynamicArrayTags::FiniArray => 26,
            Elf_DynamicArrayTags::InitArraysz => 27,
            Elf_DynamicArrayTags::FiniArraysz => 28,
            Elf_DynamicArrayTags::Runpath => 29,
            Elf_DynamicArrayTags::Flags => 30,
            Elf_DynamicArrayTags::PreinitArray => 32,
            Elf_DynamicArrayTags::PreinitArraysz => 33,
            Elf_DynamicArrayTags::SymtabShndx => 34,
            Elf_DynamicArrayTags::Relrsz => 35,
            Elf_DynamicArrayTags::Relr => 36,
            Elf_DynamicArrayTags::Relrent => 37,
            Elf_DynamicArrayTags::DeprecatedSparcRegister => 117440513,
            Elf_DynamicArrayTags::SunwAuxiliary => 1610612749,
            Elf_DynamicArrayTags::SunwRtldinf => 1610612750,
            Elf_DynamicArrayTags::SunwFilter => 1610612751,
            Elf_DynamicArrayTags::SunwCap => 1610612752,
            Elf_DynamicArrayTags::SunwSymtab => 1610612753,
            Elf_DynamicArrayTags::SunwSymsz => 1610612754,
            Elf_DynamicArrayTags::SunwSortent => 1610612755,
            Elf_DynamicArrayTags::SunwSymsort => 1610612756,
            Elf_DynamicArrayTags::SunwSymsortsz => 1610612757,
            Elf_DynamicArrayTags::SunwTlssort => 1610612758,
            Elf_DynamicArrayTags::SunwTlssortsz => 1610612759,
            Elf_DynamicArrayTags::SunwCapinfo => 1610612760,
            Elf_DynamicArrayTags::SunwStrpad => 1610612761,
            Elf_DynamicArrayTags::SunwCapchain => 1610612762,
            Elf_DynamicArrayTags::SunwLdmach => 1610612763,
            Elf_DynamicArrayTags::SunwSymtabShndx => 1610612764,
            Elf_DynamicArrayTags::SunwCapchainent => 1610612765,
            Elf_DynamicArrayTags::SunwDeferred => 1610612766,
            Elf_DynamicArrayTags::SunwCapchainsz => 1610612767,
            Elf_DynamicArrayTags::SunwPhname => 1610612768,
            Elf_DynamicArrayTags::SunwParent => 1610612769,
            Elf_DynamicArrayTags::SunwSxAslr => 1610612771,
            Elf_DynamicArrayTags::SunwRelax => 1610612773,
            Elf_DynamicArrayTags::SunwKmod => 1610612775,
            Elf_DynamicArrayTags::SunwSxNxheap => 1610612777,
            Elf_DynamicArrayTags::SunwSxNxstack => 1610612779,
            Elf_DynamicArrayTags::SunwSxAdiheap => 1610612781,
            Elf_DynamicArrayTags::SunwSxAdistack => 1610612783,
            Elf_DynamicArrayTags::SunwSxSsbd => 1610612785,
            Elf_DynamicArrayTags::SunwSymnsort => 1610612786,
            Elf_DynamicArrayTags::SunwSymnsortsz => 1610612787,
            Elf_DynamicArrayTags::GnuFlags1 => 1879047668,
            Elf_DynamicArrayTags::GnuPrelinked => 1879047669,
            Elf_DynamicArrayTags::GnuConflictsz => 1879047670,
            Elf_DynamicArrayTags::GnuLiblistsz => 1879047671,
            Elf_DynamicArrayTags::Checksum => 1879047672,
            Elf_DynamicArrayTags::Pltpadsz => 1879047673,
            Elf_DynamicArrayTags::Moveent => 1879047674,
            Elf_DynamicArrayTags::Movesz => 1879047675,
            Elf_DynamicArrayTags::Feature1 => 1879047676,
            Elf_DynamicArrayTags::Posflag1 => 1879047677,
            Elf_DynamicArrayTags::Syminsz => 1879047678,
            Elf_DynamicArrayTags::Syminent => 1879047679,
            Elf_DynamicArrayTags::GnuHash => 1879047925,
            Elf_DynamicArrayTags::TlsdescPlt => 1879047926,
            Elf_DynamicArrayTags::TlsdescGot => 1879047927,
            Elf_DynamicArrayTags::GnuConflict => 1879047928,
            Elf_DynamicArrayTags::GnuLiblist => 1879047929,
            Elf_DynamicArrayTags::Config => 1879047930,
            Elf_DynamicArrayTags::Depaudit => 1879047931,
            Elf_DynamicArrayTags::Audit => 1879047932,
            Elf_DynamicArrayTags::Pltpad => 1879047933,
            Elf_DynamicArrayTags::Movetab => 1879047934,
            Elf_DynamicArrayTags::Syminfo => 1879047935,
            Elf_DynamicArrayTags::Versym => 1879048176,
            Elf_DynamicArrayTags::Relacount => 1879048185,
            Elf_DynamicArrayTags::Relcount => 1879048186,
            Elf_DynamicArrayTags::Flags1 => 1879048187,
            Elf_DynamicArrayTags::Verdef => 1879048188,
            Elf_DynamicArrayTags::Verdefnum => 1879048189,
            Elf_DynamicArrayTags::Verneed => 1879048190,
            Elf_DynamicArrayTags::Verneednum => 1879048191,
            Elf_DynamicArrayTags::SparcRegister => 1879048193,
            Elf_DynamicArrayTags::Auxiliary => 2147483645,
            Elf_DynamicArrayTags::Used => 2147483646,
            Elf_DynamicArrayTags::Filter => 2147483647,
            Elf_DynamicArrayTags::Unknown(v) => v
        }
    }
}

impl Default for Elf_DynamicArrayTags {
    fn default() -> Self { Elf_DynamicArrayTags::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_Endian {
    Le,
    Be,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_Endian {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_Endian> {
        match flag {
            1 => Ok(Elf_Endian::Le),
            2 => Ok(Elf_Endian::Be),
            _ => Ok(Elf_Endian::Unknown(flag)),
        }
    }
}

impl From<&Elf_Endian> for i64 {
    fn from(v: &Elf_Endian) -> Self {
        match *v {
            Elf_Endian::Le => 1,
            Elf_Endian::Be => 2,
            Elf_Endian::Unknown(v) => v
        }
    }
}

impl Default for Elf_Endian {
    fn default() -> Self { Elf_Endian::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_Machine {

    /**
     * No machine
     */
    NoMachine,

    /**
     * AT&T WE 32100
     */
    M32,

    /**
     * Sun SPARC
     */
    Sparc,

    /**
     * Intel 80386
     */
    I386,

    /**
     * Motorola m68k family
     */
    M68k,

    /**
     * Motorola m88k family
     */
    M88k,

    /**
     * Intel MCU.
     * 
     * This value was originally assigned as `EM_486` (for Intel i486), but was
     * likely never used in that sense, or only briefly (in
     * <https://www.sco.com/developers/gabi/2001-04-24/ch4.eheader.html>, it is
     * marked as "Reserved for future use (was `EM_486`)" and there is an HTML
     * comment `<!-- before 1994, was EM_486, Intel 80486 -->`). See also
     * <https://landley.net/notes-2009.html#08-11-2009>. In 2015, this number
     * was repurposed to `EM_IAMCU`, see
     * <https://groups.google.com/g/generic-abi/c/pXfB_RXGY8Q/m/QntbSjBX7GkJ>.
     * \sa https://groups.google.com/g/generic-abi/c/pXfB_RXGY8Q/m/QntbSjBX7GkJ Source
     * \sa https://sourceware.org/bugzilla/show_bug.cgi?id=18404 Source
     * \sa https://gcc.gnu.org/legacy-ml/gcc/2015-05/msg00090.html Source
     * \sa https://github.com/gcc-mirror/gcc/blob/240f07805d/libgo/go/debug/elf/elf.go#L389 Source
     */
    Iamcu,

    /**
     * Intel 80860
     */
    I860,

    /**
     * MIPS I architecture.
     * 
     * Note: some sources describe this as "MIPS RS3000 big-endian", but that's
     * outdated - in practice, it is used for little-endian binaries as well,
     * see <https://github.com/radareorg/radare2/issues/2078>. Historically,
     * there was a value `EM_MIPS_RS3_LE`, which stood for
     * "MIPS R3000 little-endian", but it has long since fallen out of use
     * (it's unclear whether it was ever used in practice at all).
     */
    Mips,

    /**
     * IBM System/370 (S/370)
     */
    S370,

    /**
     * MIPS R3000 little-endian (Oct 4 1999 Draft). Deprecated.
     * 
     * The Linux kernel source code (Git tag "v7.1") has the [following
     * comment](https://github.com/torvalds/linux/blob/8cd9520d35a6c38db6567e97dd93b1f11f185dc6/include/uapi/linux/elf-em.h#L15-L19):
     * 
     * > Next two are historical and binaries and modules of these types will
     * > be rejected by Linux.
     * 
     * <https://github.com/radareorg/radare2/issues/2078> shows that the
     * `EM_MIPS` value is also used for little-endian binaries (not just
     * big-endian).
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/commit/39834263784567c306fbccb8230ddd1badca53fe Source
     */
    MipsRs3Le,

    /**
     * Old version of Sparc v9, from before the ABI. Deprecated.
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L121 Source
     */
    OldSparcV9,

    /**
     * Hewlett-Packard PA-RISC (HP/PA or HPPA)
     */
    Parisc,

    /**
     * Fujitsu VPP500
     */
    Vpp500,

    /**
     * Sun's "v8plus"
     */
    Sparc32plus,

    /**
     * Intel 80960
     */
    I960,

    /**
     * 32-bit PowerPC
     */
    Powerpc,

    /**
     * 64-bit PowerPC
     */
    Powerpc64,

    /**
     * IBM System/390 (S/390)
     */
    S390,

    /**
     * STI (Sony, Toshiba and IBM) Cell BE SPU
     */
    Spu,

    /**
     * NEC V800 series
     */
    V800,

    /**
     * Fujitsu FR20
     */
    Fr20,

    /**
     * TRW RH32
     */
    Rh32,

    /**
     * Motorola M*Core (also spelled as MCore or M-Core)
     * 
     * `EM_RCE` is "Old name for MCore" according to
     * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L152>
     */
    Mcore,

    /**
     * ARM 32-bit architecture (AArch32)
     */
    Arm,

    /**
     * DEC Alpha
     */
    OldAlpha,

    /**
     * Renesas (formerly Hitachi) SuperH SH
     */
    Superh,

    /**
     * SPARC v9 64-bit
     */
    SparcV9,

    /**
     * Siemens TriCore embedded processor
     */
    Tricore,

    /**
     * Argonaut RISC Core
     */
    Arc,

    /**
     * Renesas (formerly Hitachi) H8/300
     */
    H8300,

    /**
     * Renesas (formerly Hitachi) H8/300H
     */
    H8300h,

    /**
     * Renesas (formerly Hitachi) H8S
     */
    H8s,

    /**
     * Renesas (formerly Hitachi) H8/500
     */
    H8500,

    /**
     * Intel IA-64 processor architecture
     */
    Ia64,

    /**
     * Stanford MIPS-X
     */
    MipsX,

    /**
     * Motorola ColdFire
     */
    Coldfire,

    /**
     * Motorola M68HC12
     */
    M68hc12,

    /**
     * Fujitsu MMA Multimedia Accelerator
     */
    Mma,

    /**
     * Siemens PCP
     */
    Pcp,

    /**
     * Sony nCPU embedded RISC processor
     */
    Ncpu,

    /**
     * Denso NDR1 microprocessor
     */
    Ndr1,

    /**
     * Motorola Star*Core processor
     */
    Starcore,

    /**
     * Toyota ME16 processor
     */
    Me16,

    /**
     * STMicroelectronics ST100 processor
     */
    St100,

    /**
     * Advanced Logic Corp. TinyJ embedded processor family
     */
    Tinyj,

    /**
     * AMD x86-64 architecture
     */
    X8664,

    /**
     * Sony DSP Processor
     */
    Pdsp,

    /**
     * Digital Equipment Corp. PDP-10
     */
    Pdp10,

    /**
     * Digital Equipment Corp. PDP-11
     */
    Pdp11,

    /**
     * Siemens FX66 microcontroller
     */
    Fx66,

    /**
     * STMicroelectronics ST9+ 8/16 bit microcontroller
     */
    St9plus,

    /**
     * STMicroelectronics ST7 8-bit microcontroller
     */
    St7,

    /**
     * Motorola MC68HC16 microcontroller
     */
    M68hc16,

    /**
     * Motorola MC68HC11 microcontroller
     */
    M68hc11,

    /**
     * Motorola MC68HC08 microcontroller
     */
    M68hc08,

    /**
     * Motorola MC68HC05 microcontroller
     */
    M68hc05,

    /**
     * Silicon Graphics SVx
     */
    Svx,

    /**
     * STMicroelectronics ST19 8-bit microcontroller
     */
    St19,

    /**
     * Digital VAX
     */
    Vax,

    /**
     * Axis Communications 32-bit embedded processor
     */
    Cris,

    /**
     * Infineon Technologies 32-bit embedded processor
     */
    Javelin,

    /**
     * Element 14 64-bit DSP Processor
     */
    Firepath,

    /**
     * LSI Logic 16-bit DSP Processor
     */
    Zsp,

    /**
     * Donald Knuth's educational 64-bit processor
     */
    Mmix,

    /**
     * Harvard University machine-independent object files
     */
    Huany,

    /**
     * SiTera Prism
     */
    Prism,

    /**
     * Atmel AVR 8-bit microcontroller
     */
    Avr,

    /**
     * Fujitsu FR30
     */
    Fr30,

    /**
     * Mitsubishi D10V
     */
    D10v,

    /**
     * Mitsubishi D30V
     */
    D30v,

    /**
     * Renesas V850 (formerly NEC V850)
     */
    V850,

    /**
     * Renesas M32R (formerly Mitsubishi M32R)
     */
    M32r,

    /**
     * Panasonic MN10300 (formerly Matsushita MN10300)
     */
    Mn10300,

    /**
     * Panasonic MN10200 (formerly Matsushita MN10200)
     */
    Mn10200,

    /**
     * picoJava
     */
    Picojava,

    /**
     * OpenRISC 1000 32-bit embedded processor
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L205 Source
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L455 Source
     */
    Or1k,

    /**
     * ARC International ARCompact processor
     */
    ArcCompact,

    /**
     * Tensilica Xtensa architecture
     */
    Xtensa,

    /**
     * Alphamosaic VideoCore processor
     */
    Videocore,

    /**
     * Thompson Multimedia General Purpose Processor
     */
    TmmGpp,

    /**
     * National Semiconductor 32000 series
     */
    Ns32k,

    /**
     * Tenor Network TPC processor
     */
    Tpc,

    /**
     * Trebia SNP 1000 processor
     */
    Snp1k,

    /**
     * STMicroelectronics ST200 microcontroller
     */
    St200,

    /**
     * Ubicom IP2xxx microcontroller family
     */
    Ip2k,

    /**
     * MAX processor
     */
    Max,

    /**
     * National Semiconductor CompactRISC microprocessor
     */
    Cr,

    /**
     * Fujitsu F2MC16
     */
    F2mc16,

    /**
     * Texas Instruments embedded microcontroller MSP430
     */
    Msp430,

    /**
     * Analog Devices, Inc. (ADI) Blackfin
     */
    Blackfin,

    /**
     * Seiko Epson S1C33 family
     */
    SeC33,

    /**
     * Sharp embedded microprocessor
     */
    Sep,

    /**
     * Arca RISC microprocessor
     */
    Arca,

    /**
     * Microprocessor series from PKU-Unity Ltd. and MPRC of Peking University
     */
    Unicore,

    /**
     * eXcess: 16/32/64-bit configurable embedded CPU
     */
    Excess,

    /**
     * Icera Semiconductor Inc. Deep Execution Processor
     */
    Dxp,

    /**
     * Altera Nios II soft-core processor
     */
    AlteraNios2,

    /**
     * National Semiconductor CompactRISC CRX microprocessor
     */
    Crx,

    /**
     * Motorola XGATE embedded processor
     */
    Xgate,

    /**
     * Infineon C16x/XC16x processor
     */
    C166,

    /**
     * Renesas M16C series microprocessors
     */
    M16c,

    /**
     * Microchip Technology dsPIC30F Digital Signal Controller
     */
    Dspic30f,

    /**
     * Freescale Communication Engine RISC core
     */
    FreescaleCe,

    /**
     * Renesas M32C series microprocessors
     */
    M32c,

    /**
     * Altium TSK3000 core
     */
    Tsk3000,

    /**
     * Freescale RS08 embedded processor
     */
    Rs08,

    /**
     * Analog Devices, Inc. (ADI) SHARC family of 32-bit DSP processors
     */
    Sharc,

    /**
     * Cyan Technology eCOG2 microprocessor
     */
    Ecog2,

    /**
     * Sunplus S+core7 RISC processor
     */
    Score7,

    /**
     * New Japan Radio (NJR) 24-bit DSP Processor
     */
    Dsp24,

    /**
     * Broadcom VideoCore III processor
     */
    Videocore3,

    /**
     * RISC processor for Lattice FPGA architecture
     */
    Latticemico32,

    /**
     * Seiko Epson C17 family
     */
    SeC17,

    /**
     * Texas Instruments TMS320C6000 DSP family
     */
    TiC6000,

    /**
     * Texas Instruments TMS320C2000 DSP family
     */
    TiC2000,

    /**
     * Texas Instruments TMS320C55x DSP family
     */
    TiC5500,

    /**
     * Texas Instruments Application Specific RISC Processor, 32bit fetch
     */
    TiArp32,

    /**
     * Texas Instruments Programmable Realtime Unit
     */
    TiPru,

    /**
     * STMicroelectronics 64bit VLIW Data Signal Processor
     */
    MmdspPlus,

    /**
     * Cypress M8C microprocessor
     */
    CypressM8c,

    /**
     * Renesas R32C series microprocessors
     */
    R32c,

    /**
     * NXP Semiconductors TriMedia architecture family
     */
    Trimedia,

    /**
     * Qualcomm Hexagon (QDSP6) processor
     */
    Qdsp6,

    /**
     * Intel 8051 and variants
     */
    I8051,

    /**
     * STMicroelectronics STxP7x family of configurable and extensible RISC processors
     */
    Stxp7x,

    /**
     * Andes Technology compact code size embedded RISC processor family
     */
    Nds32,

    /**
     * Cyan Technology eCOG1X family
     */
    Ecog1x,

    /**
     * Dallas Semiconductor MAXQ30 Core Micro-controllers
     */
    Maxq30,

    /**
     * New Japan Radio (NJR) 16-bit DSP Processor
     */
    Ximo16,

    /**
     * M2000 Reconfigurable RISC Microprocessor
     */
    Manik,

    /**
     * Cray Inc. NV2 vector architecture
     */
    CrayNv2,

    /**
     * Renesas RX family
     */
    Rx,

    /**
     * Imagination Technologies META processor architecture
     */
    Metag,

    /**
     * MCST Elbrus general purpose hardware architecture
     */
    McstElbrus,

    /**
     * Cyan Technology eCOG16 family
     */
    Ecog16,

    /**
     * National Semiconductor CompactRISC CR16 16-bit microprocessor
     */
    Cr16,

    /**
     * Freescale Extended Time Processing Unit
     */
    Etpu,

    /**
     * Infineon Technologies SLE9X core
     */
    Sle9x,

    /**
     * Intel L1OM
     */
    L1om,

    /**
     * Intel K1OM
     */
    K1om,

    /**
     * Reserved by Intel
     */
    Intel182,

    /**
     * ARM 64-bit architecture
     */
    Aarch64,

    /**
     * Reserved by ARM
     */
    Arm184,

    /**
     * Atmel Corporation 32-bit microprocessor family
     */
    Avr32,

    /**
     * STMicroeletronics STM8 8-bit microcontroller
     */
    Stm8,

    /**
     * Tilera TILE64 multicore architecture family
     */
    Tile64,

    /**
     * Tilera TILEPro multicore architecture family
     */
    Tilepro,

    /**
     * Xilinx MicroBlaze 32-bit RISC soft processor core
     */
    Microblaze,

    /**
     * NVIDIA CUDA architecture
     */
    Cuda,

    /**
     * Tilera TILE-Gx multicore architecture family
     */
    Tilegx,

    /**
     * CloudShield architecture family
     */
    Cloudshield,

    /**
     * KIPO-KAIST Core-A 1st generation processor family
     */
    Corea1st,

    /**
     * KIPO-KAIST Core-A 2nd generation processor family
     */
    Corea2nd,

    /**
     * Synopsys ARCompact V2 (ARCv2)
     */
    ArcCompact2,

    /**
     * Open8 8-bit RISC soft processor core
     */
    Open8,

    /**
     * Renesas RL78 family
     */
    Rl78,

    /**
     * Broadcom VideoCore V processor
     */
    Videocore5,

    /**
     * Renesas 78K0R family
     */
    Renesas78k0r,

    /**
     * Freescale 56800EX Digital Signal Controller (DSC)
     */
    Freescale56800ex,

    /**
     * Beyond BA1 CPU architecture
     */
    Ba1,

    /**
     * Beyond BA2 CPU architecture
     */
    Ba2,

    /**
     * XMOS xCORE processor family
     */
    Xcore,

    /**
     * Microchip 8-bit PIC(r) family
     */
    MchpPic,

    /**
     * Intel Graphics Technology
     * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L339 Source
     */
    Intelgt,

    /**
     * Reserved by Intel
     */
    Intel206,

    /**
     * Reserved by Intel
     */
    Intel207,

    /**
     * Reserved by Intel
     */
    Intel208,

    /**
     * Reserved by Intel
     */
    Intel209,

    /**
     * KM211 KM32 32-bit processor
     */
    Km32,

    /**
     * KM211 KMX32 32-bit processor
     */
    Kmx32,

    /**
     * KM211 KMX16 16-bit processor
     */
    Kmx16,

    /**
     * KM211 KMX8 8-bit processor
     */
    Kmx8,

    /**
     * KM211 KVARC processor
     */
    Kvarc,

    /**
     * Paneve CDP architecture family
     */
    Cdp,

    /**
     * Cognitive Smart Memory Processor
     */
    Coge,

    /**
     * Bluechip Systems CoolEngine
     */
    Cool,

    /**
     * Nanoradio Optimized RISC
     */
    Norc,

    /**
     * CSR Kalimba architecture family
     */
    CsrKalimba,

    /**
     * Zilog Z80
     */
    Z80,

    /**
     * Controls and Data Services VISIUMcore processor
     */
    Visium,

    /**
     * FTDI Chip FT32 high performance 32-bit RISC architecture
     */
    Ft32,

    /**
     * Moxie processor family
     */
    Moxie,

    /**
     * AMD GPU architecture
     */
    Amdgpu,

    /**
     * RISC-V
     */
    Riscv,

    /**
     * Lanai 32-bit processor
     */
    Lanai,

    /**
     * CEVA Processor Architecture Family
     */
    Ceva,

    /**
     * CEVA X2 Processor Family
     */
    CevaX2,

    /**
     * Linux BPF - in-kernel virtual machine
     */
    Bpf,

    /**
     * Graphcore Intelligent Processing Unit
     */
    GraphcoreIpu,

    /**
     * Imagination Technologies
     */
    Img1,

    /**
     * Netronome Flow Processor (NFP)
     */
    Nfp,

    /**
     * NEC SX-Aurora Vector Engine (VE) processor
     */
    Ve,

    /**
     * C-SKY 32-bit processor family
     */
    Csky,

    /**
     * Synopsys ARCv3 64-bit.
     * 
     * Note: in the [official
     * registry](https://gabi.xinuos.com/v42/elf/a-emachine.html), this is
     * labeled "Synopsys ARCv2.3 64-bit". Nearly all implementations of the ELF
     * format have adopted this description verbatim without verification.
     * However, it seems that there is no such thing as "ARCv2.3". The only
     * correct and official name from Synopsys is "ARCv3" - see the
     * [ARCv3 ELF ABI specification](https://github.com/foss-for-synopsys-dwc-arc-processors/arc-ABI-manual/blob/8db91b9b7b92222cfb8972293b6d714ee2959248/arcv3-elf.md#-file-header):
     * 
     * > * e_machine: Identifies the machine this ELF file targets. Always
     * >   contains:
     * >   * EM_ARC_COMPACT3_64 (253 - 0xfd) for Synopsys ARCv3 64-bit
     * >   * EM_ARC_COMPACT3 (255 - 0xff) for Synopsys ARCv3 32-bit
     * 
     * One of the few projects that recognized and fixed this error is the
     * `file` command, see
     * <https://github.com/file/file/commit/70200102a0be50d409dca5ef76d9cbc3703a0753>
     */
    ArcCompact364,

    /**
     * MOS Technology MCS 6502 processor
     */
    Mcs6502,

    /**
     * Synopsys ARCv3 32-bit.
     * 
     * Note: in the [official
     * registry](https://gabi.xinuos.com/v42/elf/a-emachine.html), this is
     * labeled "Synopsys ARCv2.3 32-bit". Nearly all implementations of the ELF
     * format have adopted this description verbatim without verification.
     * However, it seems that there is no such thing as "ARCv2.3". The only
     * correct and official name from Synopsys is "ARCv3" - see the
     * [ARCv3 ELF ABI specification](https://github.com/foss-for-synopsys-dwc-arc-processors/arc-ABI-manual/blob/8db91b9b7b92222cfb8972293b6d714ee2959248/arcv3-elf.md#-file-header):
     * 
     * > * e_machine: Identifies the machine this ELF file targets. Always
     * >   contains:
     * >   * EM_ARC_COMPACT3_64 (253 - 0xfd) for Synopsys ARCv3 64-bit
     * >   * EM_ARC_COMPACT3 (255 - 0xff) for Synopsys ARCv3 32-bit
     * 
     * One of the few projects that recognized and fixed this error is the
     * `file` command, see
     * <https://github.com/file/file/commit/70200102a0be50d409dca5ef76d9cbc3703a0753>.
     */
    ArcCompact3,

    /**
     * Kalray VLIW core of the MPPA processor family
     */
    Kvx,

    /**
     * WDC 65816/65C816
     */
    Wdc65816,

    /**
     * LoongArch
     */
    Loongarch,

    /**
     * ChipON KungFu32
     */
    Kf32,

    /**
     * LAPIS nX-U16/U8
     */
    U16U8core,

    /**
     * Tachyum
     */
    Tachyum,

    /**
     * NXP 56800EF Digital Signal Controller (DSC)
     */
    Nxp56800ef,

    /**
     * Solana Bytecode Format
     */
    Sbf,

    /**
     * AMD/Xilinx AI Engine architecture
     */
    AiEngine,

    /**
     * SiMa MLA
     */
    SimaMla,

    /**
     * Cambricon BANG
     */
    Bang,

    /**
     * Loongson LoongGPU
     */
    Loonggpu,

    /**
     * Wuxi Institute of Advanced Technology SW64
     */
    Sw64,

    /**
     * AMD/Xilinx AI Engine ctrlcode
     */
    AiEngineCtrlcode,

    /**
     * T-Head PPU
     * \sa https://groups.google.com/g/generic-abi/c/XKECxlRDvu8 Source
     */
    Ppu,
    AvrOld,
    Msp430Old,

    /**
     * Adapteva's Epiphany architecture
     */
    AdaptevaEpiphany,

    /**
     * Morpho MT
     */
    Mt,
    CygnusFr30,

    /**
     * Unofficial value for WebAssembly (Wasm) binaries, as used by LLVM.
     */
    Webassembly,

    /**
     * Infineon Technologies 16-bit microcontroller with C166-V2 core
     */
    Xc16x,

    /**
     * Freescale S12Z. The Freescale toolchain generates ELF files with this value.
     */
    S12z,
    CygnusFrv,

    /**
     * openDLX
     */
    Dlx,
    CygnusD10v,
    CygnusD30v,

    /**
     * Ubicom IP2xxx (old)
     */
    Ip2kOld,

    /**
     * Cygnus PowerPC
     */
    CygnusPowerpc,
    Alpha,

    /**
     * Cygnus M32R.
     * 
     * According to the Linux kernel (Git tag "v7.1") -
     * <https://github.com/torvalds/linux/blob/8cd9520d35a6c38db6567e97dd93b1f11f185dc6/include/uapi/linux/elf-em.h#L63>:
     * 
     * > Bogus old m32r magic number, used by old tools.
     */
    CygnusM32r,
    CygnusV850,
    S390Old,

    /**
     * Old, unofficial value for Xtensa
     */
    XtensaOld,
    Xstormy16,

    /**
     * Old MicroBlaze
     */
    MicroblazeOld,
    CygnusMn10300,
    CygnusMn10200,

    /**
     * Toshiba MeP
     */
    CygnusMep,

    /**
     * Renesas M32C and M16C
     */
    M32cOld,

    /**
     * Vitesse IQ2000
     */
    Iq2000,
    Nios32,

    /**
     * Old, unofficial value for Moxie
     */
    MoxieOld,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_Machine {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_Machine> {
        match flag {
            0 => Ok(Elf_Machine::NoMachine),
            1 => Ok(Elf_Machine::M32),
            2 => Ok(Elf_Machine::Sparc),
            3 => Ok(Elf_Machine::I386),
            4 => Ok(Elf_Machine::M68k),
            5 => Ok(Elf_Machine::M88k),
            6 => Ok(Elf_Machine::Iamcu),
            7 => Ok(Elf_Machine::I860),
            8 => Ok(Elf_Machine::Mips),
            9 => Ok(Elf_Machine::S370),
            10 => Ok(Elf_Machine::MipsRs3Le),
            11 => Ok(Elf_Machine::OldSparcV9),
            15 => Ok(Elf_Machine::Parisc),
            17 => Ok(Elf_Machine::Vpp500),
            18 => Ok(Elf_Machine::Sparc32plus),
            19 => Ok(Elf_Machine::I960),
            20 => Ok(Elf_Machine::Powerpc),
            21 => Ok(Elf_Machine::Powerpc64),
            22 => Ok(Elf_Machine::S390),
            23 => Ok(Elf_Machine::Spu),
            36 => Ok(Elf_Machine::V800),
            37 => Ok(Elf_Machine::Fr20),
            38 => Ok(Elf_Machine::Rh32),
            39 => Ok(Elf_Machine::Mcore),
            40 => Ok(Elf_Machine::Arm),
            41 => Ok(Elf_Machine::OldAlpha),
            42 => Ok(Elf_Machine::Superh),
            43 => Ok(Elf_Machine::SparcV9),
            44 => Ok(Elf_Machine::Tricore),
            45 => Ok(Elf_Machine::Arc),
            46 => Ok(Elf_Machine::H8300),
            47 => Ok(Elf_Machine::H8300h),
            48 => Ok(Elf_Machine::H8s),
            49 => Ok(Elf_Machine::H8500),
            50 => Ok(Elf_Machine::Ia64),
            51 => Ok(Elf_Machine::MipsX),
            52 => Ok(Elf_Machine::Coldfire),
            53 => Ok(Elf_Machine::M68hc12),
            54 => Ok(Elf_Machine::Mma),
            55 => Ok(Elf_Machine::Pcp),
            56 => Ok(Elf_Machine::Ncpu),
            57 => Ok(Elf_Machine::Ndr1),
            58 => Ok(Elf_Machine::Starcore),
            59 => Ok(Elf_Machine::Me16),
            60 => Ok(Elf_Machine::St100),
            61 => Ok(Elf_Machine::Tinyj),
            62 => Ok(Elf_Machine::X8664),
            63 => Ok(Elf_Machine::Pdsp),
            64 => Ok(Elf_Machine::Pdp10),
            65 => Ok(Elf_Machine::Pdp11),
            66 => Ok(Elf_Machine::Fx66),
            67 => Ok(Elf_Machine::St9plus),
            68 => Ok(Elf_Machine::St7),
            69 => Ok(Elf_Machine::M68hc16),
            70 => Ok(Elf_Machine::M68hc11),
            71 => Ok(Elf_Machine::M68hc08),
            72 => Ok(Elf_Machine::M68hc05),
            73 => Ok(Elf_Machine::Svx),
            74 => Ok(Elf_Machine::St19),
            75 => Ok(Elf_Machine::Vax),
            76 => Ok(Elf_Machine::Cris),
            77 => Ok(Elf_Machine::Javelin),
            78 => Ok(Elf_Machine::Firepath),
            79 => Ok(Elf_Machine::Zsp),
            80 => Ok(Elf_Machine::Mmix),
            81 => Ok(Elf_Machine::Huany),
            82 => Ok(Elf_Machine::Prism),
            83 => Ok(Elf_Machine::Avr),
            84 => Ok(Elf_Machine::Fr30),
            85 => Ok(Elf_Machine::D10v),
            86 => Ok(Elf_Machine::D30v),
            87 => Ok(Elf_Machine::V850),
            88 => Ok(Elf_Machine::M32r),
            89 => Ok(Elf_Machine::Mn10300),
            90 => Ok(Elf_Machine::Mn10200),
            91 => Ok(Elf_Machine::Picojava),
            92 => Ok(Elf_Machine::Or1k),
            93 => Ok(Elf_Machine::ArcCompact),
            94 => Ok(Elf_Machine::Xtensa),
            95 => Ok(Elf_Machine::Videocore),
            96 => Ok(Elf_Machine::TmmGpp),
            97 => Ok(Elf_Machine::Ns32k),
            98 => Ok(Elf_Machine::Tpc),
            99 => Ok(Elf_Machine::Snp1k),
            100 => Ok(Elf_Machine::St200),
            101 => Ok(Elf_Machine::Ip2k),
            102 => Ok(Elf_Machine::Max),
            103 => Ok(Elf_Machine::Cr),
            104 => Ok(Elf_Machine::F2mc16),
            105 => Ok(Elf_Machine::Msp430),
            106 => Ok(Elf_Machine::Blackfin),
            107 => Ok(Elf_Machine::SeC33),
            108 => Ok(Elf_Machine::Sep),
            109 => Ok(Elf_Machine::Arca),
            110 => Ok(Elf_Machine::Unicore),
            111 => Ok(Elf_Machine::Excess),
            112 => Ok(Elf_Machine::Dxp),
            113 => Ok(Elf_Machine::AlteraNios2),
            114 => Ok(Elf_Machine::Crx),
            115 => Ok(Elf_Machine::Xgate),
            116 => Ok(Elf_Machine::C166),
            117 => Ok(Elf_Machine::M16c),
            118 => Ok(Elf_Machine::Dspic30f),
            119 => Ok(Elf_Machine::FreescaleCe),
            120 => Ok(Elf_Machine::M32c),
            131 => Ok(Elf_Machine::Tsk3000),
            132 => Ok(Elf_Machine::Rs08),
            133 => Ok(Elf_Machine::Sharc),
            134 => Ok(Elf_Machine::Ecog2),
            135 => Ok(Elf_Machine::Score7),
            136 => Ok(Elf_Machine::Dsp24),
            137 => Ok(Elf_Machine::Videocore3),
            138 => Ok(Elf_Machine::Latticemico32),
            139 => Ok(Elf_Machine::SeC17),
            140 => Ok(Elf_Machine::TiC6000),
            141 => Ok(Elf_Machine::TiC2000),
            142 => Ok(Elf_Machine::TiC5500),
            143 => Ok(Elf_Machine::TiArp32),
            144 => Ok(Elf_Machine::TiPru),
            160 => Ok(Elf_Machine::MmdspPlus),
            161 => Ok(Elf_Machine::CypressM8c),
            162 => Ok(Elf_Machine::R32c),
            163 => Ok(Elf_Machine::Trimedia),
            164 => Ok(Elf_Machine::Qdsp6),
            165 => Ok(Elf_Machine::I8051),
            166 => Ok(Elf_Machine::Stxp7x),
            167 => Ok(Elf_Machine::Nds32),
            168 => Ok(Elf_Machine::Ecog1x),
            169 => Ok(Elf_Machine::Maxq30),
            170 => Ok(Elf_Machine::Ximo16),
            171 => Ok(Elf_Machine::Manik),
            172 => Ok(Elf_Machine::CrayNv2),
            173 => Ok(Elf_Machine::Rx),
            174 => Ok(Elf_Machine::Metag),
            175 => Ok(Elf_Machine::McstElbrus),
            176 => Ok(Elf_Machine::Ecog16),
            177 => Ok(Elf_Machine::Cr16),
            178 => Ok(Elf_Machine::Etpu),
            179 => Ok(Elf_Machine::Sle9x),
            180 => Ok(Elf_Machine::L1om),
            181 => Ok(Elf_Machine::K1om),
            182 => Ok(Elf_Machine::Intel182),
            183 => Ok(Elf_Machine::Aarch64),
            184 => Ok(Elf_Machine::Arm184),
            185 => Ok(Elf_Machine::Avr32),
            186 => Ok(Elf_Machine::Stm8),
            187 => Ok(Elf_Machine::Tile64),
            188 => Ok(Elf_Machine::Tilepro),
            189 => Ok(Elf_Machine::Microblaze),
            190 => Ok(Elf_Machine::Cuda),
            191 => Ok(Elf_Machine::Tilegx),
            192 => Ok(Elf_Machine::Cloudshield),
            193 => Ok(Elf_Machine::Corea1st),
            194 => Ok(Elf_Machine::Corea2nd),
            195 => Ok(Elf_Machine::ArcCompact2),
            196 => Ok(Elf_Machine::Open8),
            197 => Ok(Elf_Machine::Rl78),
            198 => Ok(Elf_Machine::Videocore5),
            199 => Ok(Elf_Machine::Renesas78k0r),
            200 => Ok(Elf_Machine::Freescale56800ex),
            201 => Ok(Elf_Machine::Ba1),
            202 => Ok(Elf_Machine::Ba2),
            203 => Ok(Elf_Machine::Xcore),
            204 => Ok(Elf_Machine::MchpPic),
            205 => Ok(Elf_Machine::Intelgt),
            206 => Ok(Elf_Machine::Intel206),
            207 => Ok(Elf_Machine::Intel207),
            208 => Ok(Elf_Machine::Intel208),
            209 => Ok(Elf_Machine::Intel209),
            210 => Ok(Elf_Machine::Km32),
            211 => Ok(Elf_Machine::Kmx32),
            212 => Ok(Elf_Machine::Kmx16),
            213 => Ok(Elf_Machine::Kmx8),
            214 => Ok(Elf_Machine::Kvarc),
            215 => Ok(Elf_Machine::Cdp),
            216 => Ok(Elf_Machine::Coge),
            217 => Ok(Elf_Machine::Cool),
            218 => Ok(Elf_Machine::Norc),
            219 => Ok(Elf_Machine::CsrKalimba),
            220 => Ok(Elf_Machine::Z80),
            221 => Ok(Elf_Machine::Visium),
            222 => Ok(Elf_Machine::Ft32),
            223 => Ok(Elf_Machine::Moxie),
            224 => Ok(Elf_Machine::Amdgpu),
            243 => Ok(Elf_Machine::Riscv),
            244 => Ok(Elf_Machine::Lanai),
            245 => Ok(Elf_Machine::Ceva),
            246 => Ok(Elf_Machine::CevaX2),
            247 => Ok(Elf_Machine::Bpf),
            248 => Ok(Elf_Machine::GraphcoreIpu),
            249 => Ok(Elf_Machine::Img1),
            250 => Ok(Elf_Machine::Nfp),
            251 => Ok(Elf_Machine::Ve),
            252 => Ok(Elf_Machine::Csky),
            253 => Ok(Elf_Machine::ArcCompact364),
            254 => Ok(Elf_Machine::Mcs6502),
            255 => Ok(Elf_Machine::ArcCompact3),
            256 => Ok(Elf_Machine::Kvx),
            257 => Ok(Elf_Machine::Wdc65816),
            258 => Ok(Elf_Machine::Loongarch),
            259 => Ok(Elf_Machine::Kf32),
            260 => Ok(Elf_Machine::U16U8core),
            261 => Ok(Elf_Machine::Tachyum),
            262 => Ok(Elf_Machine::Nxp56800ef),
            263 => Ok(Elf_Machine::Sbf),
            264 => Ok(Elf_Machine::AiEngine),
            265 => Ok(Elf_Machine::SimaMla),
            266 => Ok(Elf_Machine::Bang),
            267 => Ok(Elf_Machine::Loonggpu),
            268 => Ok(Elf_Machine::Sw64),
            269 => Ok(Elf_Machine::AiEngineCtrlcode),
            270 => Ok(Elf_Machine::Ppu),
            4183 => Ok(Elf_Machine::AvrOld),
            4185 => Ok(Elf_Machine::Msp430Old),
            4643 => Ok(Elf_Machine::AdaptevaEpiphany),
            9520 => Ok(Elf_Machine::Mt),
            13104 => Ok(Elf_Machine::CygnusFr30),
            16727 => Ok(Elf_Machine::Webassembly),
            18056 => Ok(Elf_Machine::Xc16x),
            19951 => Ok(Elf_Machine::S12z),
            21569 => Ok(Elf_Machine::CygnusFrv),
            23205 => Ok(Elf_Machine::Dlx),
            30288 => Ok(Elf_Machine::CygnusD10v),
            30326 => Ok(Elf_Machine::CygnusD30v),
            33303 => Ok(Elf_Machine::Ip2kOld),
            36901 => Ok(Elf_Machine::CygnusPowerpc),
            36902 => Ok(Elf_Machine::Alpha),
            36929 => Ok(Elf_Machine::CygnusM32r),
            36992 => Ok(Elf_Machine::CygnusV850),
            41872 => Ok(Elf_Machine::S390Old),
            43975 => Ok(Elf_Machine::XtensaOld),
            44357 => Ok(Elf_Machine::Xstormy16),
            47787 => Ok(Elf_Machine::MicroblazeOld),
            48879 => Ok(Elf_Machine::CygnusMn10300),
            57005 => Ok(Elf_Machine::CygnusMn10200),
            61453 => Ok(Elf_Machine::CygnusMep),
            65200 => Ok(Elf_Machine::M32cOld),
            65210 => Ok(Elf_Machine::Iq2000),
            65211 => Ok(Elf_Machine::Nios32),
            65261 => Ok(Elf_Machine::MoxieOld),
            _ => Ok(Elf_Machine::Unknown(flag)),
        }
    }
}

impl From<&Elf_Machine> for i64 {
    fn from(v: &Elf_Machine) -> Self {
        match *v {
            Elf_Machine::NoMachine => 0,
            Elf_Machine::M32 => 1,
            Elf_Machine::Sparc => 2,
            Elf_Machine::I386 => 3,
            Elf_Machine::M68k => 4,
            Elf_Machine::M88k => 5,
            Elf_Machine::Iamcu => 6,
            Elf_Machine::I860 => 7,
            Elf_Machine::Mips => 8,
            Elf_Machine::S370 => 9,
            Elf_Machine::MipsRs3Le => 10,
            Elf_Machine::OldSparcV9 => 11,
            Elf_Machine::Parisc => 15,
            Elf_Machine::Vpp500 => 17,
            Elf_Machine::Sparc32plus => 18,
            Elf_Machine::I960 => 19,
            Elf_Machine::Powerpc => 20,
            Elf_Machine::Powerpc64 => 21,
            Elf_Machine::S390 => 22,
            Elf_Machine::Spu => 23,
            Elf_Machine::V800 => 36,
            Elf_Machine::Fr20 => 37,
            Elf_Machine::Rh32 => 38,
            Elf_Machine::Mcore => 39,
            Elf_Machine::Arm => 40,
            Elf_Machine::OldAlpha => 41,
            Elf_Machine::Superh => 42,
            Elf_Machine::SparcV9 => 43,
            Elf_Machine::Tricore => 44,
            Elf_Machine::Arc => 45,
            Elf_Machine::H8300 => 46,
            Elf_Machine::H8300h => 47,
            Elf_Machine::H8s => 48,
            Elf_Machine::H8500 => 49,
            Elf_Machine::Ia64 => 50,
            Elf_Machine::MipsX => 51,
            Elf_Machine::Coldfire => 52,
            Elf_Machine::M68hc12 => 53,
            Elf_Machine::Mma => 54,
            Elf_Machine::Pcp => 55,
            Elf_Machine::Ncpu => 56,
            Elf_Machine::Ndr1 => 57,
            Elf_Machine::Starcore => 58,
            Elf_Machine::Me16 => 59,
            Elf_Machine::St100 => 60,
            Elf_Machine::Tinyj => 61,
            Elf_Machine::X8664 => 62,
            Elf_Machine::Pdsp => 63,
            Elf_Machine::Pdp10 => 64,
            Elf_Machine::Pdp11 => 65,
            Elf_Machine::Fx66 => 66,
            Elf_Machine::St9plus => 67,
            Elf_Machine::St7 => 68,
            Elf_Machine::M68hc16 => 69,
            Elf_Machine::M68hc11 => 70,
            Elf_Machine::M68hc08 => 71,
            Elf_Machine::M68hc05 => 72,
            Elf_Machine::Svx => 73,
            Elf_Machine::St19 => 74,
            Elf_Machine::Vax => 75,
            Elf_Machine::Cris => 76,
            Elf_Machine::Javelin => 77,
            Elf_Machine::Firepath => 78,
            Elf_Machine::Zsp => 79,
            Elf_Machine::Mmix => 80,
            Elf_Machine::Huany => 81,
            Elf_Machine::Prism => 82,
            Elf_Machine::Avr => 83,
            Elf_Machine::Fr30 => 84,
            Elf_Machine::D10v => 85,
            Elf_Machine::D30v => 86,
            Elf_Machine::V850 => 87,
            Elf_Machine::M32r => 88,
            Elf_Machine::Mn10300 => 89,
            Elf_Machine::Mn10200 => 90,
            Elf_Machine::Picojava => 91,
            Elf_Machine::Or1k => 92,
            Elf_Machine::ArcCompact => 93,
            Elf_Machine::Xtensa => 94,
            Elf_Machine::Videocore => 95,
            Elf_Machine::TmmGpp => 96,
            Elf_Machine::Ns32k => 97,
            Elf_Machine::Tpc => 98,
            Elf_Machine::Snp1k => 99,
            Elf_Machine::St200 => 100,
            Elf_Machine::Ip2k => 101,
            Elf_Machine::Max => 102,
            Elf_Machine::Cr => 103,
            Elf_Machine::F2mc16 => 104,
            Elf_Machine::Msp430 => 105,
            Elf_Machine::Blackfin => 106,
            Elf_Machine::SeC33 => 107,
            Elf_Machine::Sep => 108,
            Elf_Machine::Arca => 109,
            Elf_Machine::Unicore => 110,
            Elf_Machine::Excess => 111,
            Elf_Machine::Dxp => 112,
            Elf_Machine::AlteraNios2 => 113,
            Elf_Machine::Crx => 114,
            Elf_Machine::Xgate => 115,
            Elf_Machine::C166 => 116,
            Elf_Machine::M16c => 117,
            Elf_Machine::Dspic30f => 118,
            Elf_Machine::FreescaleCe => 119,
            Elf_Machine::M32c => 120,
            Elf_Machine::Tsk3000 => 131,
            Elf_Machine::Rs08 => 132,
            Elf_Machine::Sharc => 133,
            Elf_Machine::Ecog2 => 134,
            Elf_Machine::Score7 => 135,
            Elf_Machine::Dsp24 => 136,
            Elf_Machine::Videocore3 => 137,
            Elf_Machine::Latticemico32 => 138,
            Elf_Machine::SeC17 => 139,
            Elf_Machine::TiC6000 => 140,
            Elf_Machine::TiC2000 => 141,
            Elf_Machine::TiC5500 => 142,
            Elf_Machine::TiArp32 => 143,
            Elf_Machine::TiPru => 144,
            Elf_Machine::MmdspPlus => 160,
            Elf_Machine::CypressM8c => 161,
            Elf_Machine::R32c => 162,
            Elf_Machine::Trimedia => 163,
            Elf_Machine::Qdsp6 => 164,
            Elf_Machine::I8051 => 165,
            Elf_Machine::Stxp7x => 166,
            Elf_Machine::Nds32 => 167,
            Elf_Machine::Ecog1x => 168,
            Elf_Machine::Maxq30 => 169,
            Elf_Machine::Ximo16 => 170,
            Elf_Machine::Manik => 171,
            Elf_Machine::CrayNv2 => 172,
            Elf_Machine::Rx => 173,
            Elf_Machine::Metag => 174,
            Elf_Machine::McstElbrus => 175,
            Elf_Machine::Ecog16 => 176,
            Elf_Machine::Cr16 => 177,
            Elf_Machine::Etpu => 178,
            Elf_Machine::Sle9x => 179,
            Elf_Machine::L1om => 180,
            Elf_Machine::K1om => 181,
            Elf_Machine::Intel182 => 182,
            Elf_Machine::Aarch64 => 183,
            Elf_Machine::Arm184 => 184,
            Elf_Machine::Avr32 => 185,
            Elf_Machine::Stm8 => 186,
            Elf_Machine::Tile64 => 187,
            Elf_Machine::Tilepro => 188,
            Elf_Machine::Microblaze => 189,
            Elf_Machine::Cuda => 190,
            Elf_Machine::Tilegx => 191,
            Elf_Machine::Cloudshield => 192,
            Elf_Machine::Corea1st => 193,
            Elf_Machine::Corea2nd => 194,
            Elf_Machine::ArcCompact2 => 195,
            Elf_Machine::Open8 => 196,
            Elf_Machine::Rl78 => 197,
            Elf_Machine::Videocore5 => 198,
            Elf_Machine::Renesas78k0r => 199,
            Elf_Machine::Freescale56800ex => 200,
            Elf_Machine::Ba1 => 201,
            Elf_Machine::Ba2 => 202,
            Elf_Machine::Xcore => 203,
            Elf_Machine::MchpPic => 204,
            Elf_Machine::Intelgt => 205,
            Elf_Machine::Intel206 => 206,
            Elf_Machine::Intel207 => 207,
            Elf_Machine::Intel208 => 208,
            Elf_Machine::Intel209 => 209,
            Elf_Machine::Km32 => 210,
            Elf_Machine::Kmx32 => 211,
            Elf_Machine::Kmx16 => 212,
            Elf_Machine::Kmx8 => 213,
            Elf_Machine::Kvarc => 214,
            Elf_Machine::Cdp => 215,
            Elf_Machine::Coge => 216,
            Elf_Machine::Cool => 217,
            Elf_Machine::Norc => 218,
            Elf_Machine::CsrKalimba => 219,
            Elf_Machine::Z80 => 220,
            Elf_Machine::Visium => 221,
            Elf_Machine::Ft32 => 222,
            Elf_Machine::Moxie => 223,
            Elf_Machine::Amdgpu => 224,
            Elf_Machine::Riscv => 243,
            Elf_Machine::Lanai => 244,
            Elf_Machine::Ceva => 245,
            Elf_Machine::CevaX2 => 246,
            Elf_Machine::Bpf => 247,
            Elf_Machine::GraphcoreIpu => 248,
            Elf_Machine::Img1 => 249,
            Elf_Machine::Nfp => 250,
            Elf_Machine::Ve => 251,
            Elf_Machine::Csky => 252,
            Elf_Machine::ArcCompact364 => 253,
            Elf_Machine::Mcs6502 => 254,
            Elf_Machine::ArcCompact3 => 255,
            Elf_Machine::Kvx => 256,
            Elf_Machine::Wdc65816 => 257,
            Elf_Machine::Loongarch => 258,
            Elf_Machine::Kf32 => 259,
            Elf_Machine::U16U8core => 260,
            Elf_Machine::Tachyum => 261,
            Elf_Machine::Nxp56800ef => 262,
            Elf_Machine::Sbf => 263,
            Elf_Machine::AiEngine => 264,
            Elf_Machine::SimaMla => 265,
            Elf_Machine::Bang => 266,
            Elf_Machine::Loonggpu => 267,
            Elf_Machine::Sw64 => 268,
            Elf_Machine::AiEngineCtrlcode => 269,
            Elf_Machine::Ppu => 270,
            Elf_Machine::AvrOld => 4183,
            Elf_Machine::Msp430Old => 4185,
            Elf_Machine::AdaptevaEpiphany => 4643,
            Elf_Machine::Mt => 9520,
            Elf_Machine::CygnusFr30 => 13104,
            Elf_Machine::Webassembly => 16727,
            Elf_Machine::Xc16x => 18056,
            Elf_Machine::S12z => 19951,
            Elf_Machine::CygnusFrv => 21569,
            Elf_Machine::Dlx => 23205,
            Elf_Machine::CygnusD10v => 30288,
            Elf_Machine::CygnusD30v => 30326,
            Elf_Machine::Ip2kOld => 33303,
            Elf_Machine::CygnusPowerpc => 36901,
            Elf_Machine::Alpha => 36902,
            Elf_Machine::CygnusM32r => 36929,
            Elf_Machine::CygnusV850 => 36992,
            Elf_Machine::S390Old => 41872,
            Elf_Machine::XtensaOld => 43975,
            Elf_Machine::Xstormy16 => 44357,
            Elf_Machine::MicroblazeOld => 47787,
            Elf_Machine::CygnusMn10300 => 48879,
            Elf_Machine::CygnusMn10200 => 57005,
            Elf_Machine::CygnusMep => 61453,
            Elf_Machine::M32cOld => 65200,
            Elf_Machine::Iq2000 => 65210,
            Elf_Machine::Nios32 => 65211,
            Elf_Machine::MoxieOld => 65261,
            Elf_Machine::Unknown(v) => v
        }
    }
}

impl Default for Elf_Machine {
    fn default() -> Self { Elf_Machine::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_ObjType {
    NoFileType,
    Relocatable,
    Executable,
    Shared,
    Core,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_ObjType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_ObjType> {
        match flag {
            0 => Ok(Elf_ObjType::NoFileType),
            1 => Ok(Elf_ObjType::Relocatable),
            2 => Ok(Elf_ObjType::Executable),
            3 => Ok(Elf_ObjType::Shared),
            4 => Ok(Elf_ObjType::Core),
            _ => Ok(Elf_ObjType::Unknown(flag)),
        }
    }
}

impl From<&Elf_ObjType> for i64 {
    fn from(v: &Elf_ObjType) -> Self {
        match *v {
            Elf_ObjType::NoFileType => 0,
            Elf_ObjType::Relocatable => 1,
            Elf_ObjType::Executable => 2,
            Elf_ObjType::Shared => 3,
            Elf_ObjType::Core => 4,
            Elf_ObjType::Unknown(v) => v
        }
    }
}

impl Default for Elf_ObjType {
    fn default() -> Self { Elf_ObjType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_OsAbi {

    /**
     * UNIX System V ABI
     */
    SystemV,

    /**
     * HP-UX
     */
    HpUx,

    /**
     * NetBSD
     */
    Netbsd,

    /**
     * Object uses GNU ELF extensions.
     */
    Gnu,

    /**
     * Solaris
     */
    Solaris,

    /**
     * IBM AIX
     */
    Aix,

    /**
     * IRIX by Silicon Graphics (SGI)
     */
    Irix,

    /**
     * FreeBSD
     */
    Freebsd,

    /**
     * Compaq TRU64 UNIX
     */
    Tru64,

    /**
     * Novell Modesto
     */
    Modesto,

    /**
     * OpenBSD
     */
    Openbsd,

    /**
     * OpenVMS
     */
    Openvms,

    /**
     * Hewlett-Packard NonStop Kernel
     */
    Nsk,

    /**
     * AROS Research Operating System
     */
    Aros,

    /**
     * FenixOS
     */
    Fenixos,

    /**
     * Nuxi CloudABI
     */
    Cloudabi,

    /**
     * Stratus Technologies OpenVOS
     */
    Openvos,

    /**
     * NVIDIA CUDA architecture
     * \sa https://github.com/llvm/llvm-project/blob/ca7933e47d3a3451d81e72ac174dcb5aa28b59d1/llvm/include/llvm/BinaryFormat/ELF.h#L364 Git tag "llvmorg-22.1.8"
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L79 Source
     * \sa https://docs.nvidia.com/cuda/cuda-binary-utilities/index.html search for `"ei_osabi": 51,`
     */
    Cuda,

    /**
     * ARM EABI (symbol versioning extensions)
     */
    ArmAeabi,

    /**
     * ARM FDPIC
     * \sa https://github.com/llvm/llvm-project/blob/ca7933e47d3a3451d81e72ac174dcb5aa28b59d1/llvm/include/llvm/BinaryFormat/ELF.h#L371 Git tag "llvmorg-22.1.8"
     */
    ArmFdpic,

    /**
     * AMD GCN GPUs (GFX6+) for MESA runtime
     * \sa https://github.com/llvm/llvm-project/blob/ca7933e47d3a3451d81e72ac174dcb5aa28b59d1/llvm/include/llvm/BinaryFormat/ELF.h#L369 Git tag "llvmorg-22.1.8"
     */
    AmdgpuMesa3d,

    /**
     * ARM
     */
    Arm,

    /**
     * Standalone (embedded) application
     */
    Standalone,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_OsAbi {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_OsAbi> {
        match flag {
            0 => Ok(Elf_OsAbi::SystemV),
            1 => Ok(Elf_OsAbi::HpUx),
            2 => Ok(Elf_OsAbi::Netbsd),
            3 => Ok(Elf_OsAbi::Gnu),
            6 => Ok(Elf_OsAbi::Solaris),
            7 => Ok(Elf_OsAbi::Aix),
            8 => Ok(Elf_OsAbi::Irix),
            9 => Ok(Elf_OsAbi::Freebsd),
            10 => Ok(Elf_OsAbi::Tru64),
            11 => Ok(Elf_OsAbi::Modesto),
            12 => Ok(Elf_OsAbi::Openbsd),
            13 => Ok(Elf_OsAbi::Openvms),
            14 => Ok(Elf_OsAbi::Nsk),
            15 => Ok(Elf_OsAbi::Aros),
            16 => Ok(Elf_OsAbi::Fenixos),
            17 => Ok(Elf_OsAbi::Cloudabi),
            18 => Ok(Elf_OsAbi::Openvos),
            51 => Ok(Elf_OsAbi::Cuda),
            64 => Ok(Elf_OsAbi::ArmAeabi),
            65 => Ok(Elf_OsAbi::ArmFdpic),
            66 => Ok(Elf_OsAbi::AmdgpuMesa3d),
            97 => Ok(Elf_OsAbi::Arm),
            255 => Ok(Elf_OsAbi::Standalone),
            _ => Ok(Elf_OsAbi::Unknown(flag)),
        }
    }
}

impl From<&Elf_OsAbi> for i64 {
    fn from(v: &Elf_OsAbi) -> Self {
        match *v {
            Elf_OsAbi::SystemV => 0,
            Elf_OsAbi::HpUx => 1,
            Elf_OsAbi::Netbsd => 2,
            Elf_OsAbi::Gnu => 3,
            Elf_OsAbi::Solaris => 6,
            Elf_OsAbi::Aix => 7,
            Elf_OsAbi::Irix => 8,
            Elf_OsAbi::Freebsd => 9,
            Elf_OsAbi::Tru64 => 10,
            Elf_OsAbi::Modesto => 11,
            Elf_OsAbi::Openbsd => 12,
            Elf_OsAbi::Openvms => 13,
            Elf_OsAbi::Nsk => 14,
            Elf_OsAbi::Aros => 15,
            Elf_OsAbi::Fenixos => 16,
            Elf_OsAbi::Cloudabi => 17,
            Elf_OsAbi::Openvos => 18,
            Elf_OsAbi::Cuda => 51,
            Elf_OsAbi::ArmAeabi => 64,
            Elf_OsAbi::ArmFdpic => 65,
            Elf_OsAbi::AmdgpuMesa3d => 66,
            Elf_OsAbi::Arm => 97,
            Elf_OsAbi::Standalone => 255,
            Elf_OsAbi::Unknown(v) => v
        }
    }
}

impl Default for Elf_OsAbi {
    fn default() -> Self { Elf_OsAbi::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_PhType {

    /**
     * Program header table entry unused
     */
    NullType,

    /**
     * Loadable program segment
     */
    Load,

    /**
     * Dynamic linking information
     */
    Dynamic,

    /**
     * Program interpreter (i.e. runtime/dynamic linker)
     */
    Interp,

    /**
     * Auxiliary information
     */
    Note,

    /**
     * Reserved
     */
    Shlib,

    /**
     * Segment for the program header table itself
     */
    Phdr,

    /**
     * Thread-local storage segment
     */
    Tls,

    /**
     * Equivalent to `PT_SUNW_EH_FRAME` (`ph_type::gnu_eh_frame`)
     * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-header.html#GUID-49F99618-9CDC-4A08-A94C-E2AA264AA01A__CHAPTER6-69880 Source
     */
    SunwUnwind,

    /**
     * Exception unwind tables (`.eh_frame_hdr` section)
     */
    GnuEhFrame,

    /**
     * Indicates stack executability
     */
    GnuStack,

    /**
     * Read-only after relocation
     */
    GnuRelro,

    /**
     * Segment containing the `.note.gnu.property` section
     */
    GnuProperty,

    /**
     * GNU SFrame stack trace segment (`.sframe` section)
     */
    GnuSframe,

    /**
     * PaX flags
     */
    PaxFlags,

    /**
     * Like bss, but not immutable
     */
    OpenbsdMutable,

    /**
     * Fill with random data
     */
    OpenbsdRandomize,

    /**
     * Program does W^X violations
     */
    OpenbsdWxneeded,

    /**
     * No branch target CFI
     */
    OpenbsdNobtcfi,

    /**
     * System call sites
     */
    OpenbsdSyscalls,

    /**
     * Section for boot arguments
     */
    OpenbsdBootdata,

    /**
     * Reserved for internal use
     * \sa `/usr/include/sys/elf.h` on Oracle Solaris 11.4
     */
    SunwSysstatZone,

    /**
     * Reserved for internal use
     */
    SunwSysstat,

    /**
     * Memory reservation
     */
    SunwReserve,
    SunwBss,

    /**
     * Describes the stack segment
     */
    SunwStack,

    /**
     * Reserved for internal use by `dtrace(8)`
     */
    SunwDtrace,

    /**
     * Capability requirements
     */
    SunwCap,

    /**
     * Platform architecture compatibility information
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/arm.h#L40 Source
     * \sa https://github.com/ARM-software/abi-aa/blob/daa7a94ca55973736c0e434a67a6e4bbcd35d7fa/aaelf32/aaelf32.rst#61program-header Git tag "2025Q4"
     */
    ArmArchext,

    /**
     * Exception unwind tables
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/arm.h#L41 Source
     * \sa https://github.com/ARM-software/abi-aa/blob/daa7a94ca55973736c0e434a67a6e4bbcd35d7fa/aaelf32/aaelf32.rst#61program-header Git tag "2025Q4"
     */
    ArmExidx,

    /**
     * MTE memory tags
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/aarch64.h#L31 Source
     */
    Aarch64MemtagMte,

    /**
     * RISC-V ELF attribute section (deprecated)
     * \sa https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/01017c343cd6d89ed4d1d568b1c75fac79d2a689/riscv-elf.adoc#program-header-table Source
     */
    RiscvAttributes,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_PhType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_PhType> {
        match flag {
            0 => Ok(Elf_PhType::NullType),
            1 => Ok(Elf_PhType::Load),
            2 => Ok(Elf_PhType::Dynamic),
            3 => Ok(Elf_PhType::Interp),
            4 => Ok(Elf_PhType::Note),
            5 => Ok(Elf_PhType::Shlib),
            6 => Ok(Elf_PhType::Phdr),
            7 => Ok(Elf_PhType::Tls),
            1684333904 => Ok(Elf_PhType::SunwUnwind),
            1685382480 => Ok(Elf_PhType::GnuEhFrame),
            1685382481 => Ok(Elf_PhType::GnuStack),
            1685382482 => Ok(Elf_PhType::GnuRelro),
            1685382483 => Ok(Elf_PhType::GnuProperty),
            1685382484 => Ok(Elf_PhType::GnuSframe),
            1694766464 => Ok(Elf_PhType::PaxFlags),
            1705237477 => Ok(Elf_PhType::OpenbsdMutable),
            1705237478 => Ok(Elf_PhType::OpenbsdRandomize),
            1705237479 => Ok(Elf_PhType::OpenbsdWxneeded),
            1705237480 => Ok(Elf_PhType::OpenbsdNobtcfi),
            1705237481 => Ok(Elf_PhType::OpenbsdSyscalls),
            1705253862 => Ok(Elf_PhType::OpenbsdBootdata),
            1879048183 => Ok(Elf_PhType::SunwSysstatZone),
            1879048184 => Ok(Elf_PhType::SunwSysstat),
            1879048185 => Ok(Elf_PhType::SunwReserve),
            1879048186 => Ok(Elf_PhType::SunwBss),
            1879048187 => Ok(Elf_PhType::SunwStack),
            1879048188 => Ok(Elf_PhType::SunwDtrace),
            1879048189 => Ok(Elf_PhType::SunwCap),
            1879048192 => Ok(Elf_PhType::ArmArchext),
            1879048193 => Ok(Elf_PhType::ArmExidx),
            1879048194 => Ok(Elf_PhType::Aarch64MemtagMte),
            1879048195 => Ok(Elf_PhType::RiscvAttributes),
            _ => Ok(Elf_PhType::Unknown(flag)),
        }
    }
}

impl From<&Elf_PhType> for i64 {
    fn from(v: &Elf_PhType) -> Self {
        match *v {
            Elf_PhType::NullType => 0,
            Elf_PhType::Load => 1,
            Elf_PhType::Dynamic => 2,
            Elf_PhType::Interp => 3,
            Elf_PhType::Note => 4,
            Elf_PhType::Shlib => 5,
            Elf_PhType::Phdr => 6,
            Elf_PhType::Tls => 7,
            Elf_PhType::SunwUnwind => 1684333904,
            Elf_PhType::GnuEhFrame => 1685382480,
            Elf_PhType::GnuStack => 1685382481,
            Elf_PhType::GnuRelro => 1685382482,
            Elf_PhType::GnuProperty => 1685382483,
            Elf_PhType::GnuSframe => 1685382484,
            Elf_PhType::PaxFlags => 1694766464,
            Elf_PhType::OpenbsdMutable => 1705237477,
            Elf_PhType::OpenbsdRandomize => 1705237478,
            Elf_PhType::OpenbsdWxneeded => 1705237479,
            Elf_PhType::OpenbsdNobtcfi => 1705237480,
            Elf_PhType::OpenbsdSyscalls => 1705237481,
            Elf_PhType::OpenbsdBootdata => 1705253862,
            Elf_PhType::SunwSysstatZone => 1879048183,
            Elf_PhType::SunwSysstat => 1879048184,
            Elf_PhType::SunwReserve => 1879048185,
            Elf_PhType::SunwBss => 1879048186,
            Elf_PhType::SunwStack => 1879048187,
            Elf_PhType::SunwDtrace => 1879048188,
            Elf_PhType::SunwCap => 1879048189,
            Elf_PhType::ArmArchext => 1879048192,
            Elf_PhType::ArmExidx => 1879048193,
            Elf_PhType::Aarch64MemtagMte => 1879048194,
            Elf_PhType::RiscvAttributes => 1879048195,
            Elf_PhType::Unknown(v) => v
        }
    }
}

impl Default for Elf_PhType {
    fn default() -> Self { Elf_PhType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_SectionHeaderIdxSpecial {
    Undefined,
    Before,
    After,
    Amd64Lcommon,
    SunwIgnore,
    Abs,
    Common,
    Xindex,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_SectionHeaderIdxSpecial {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_SectionHeaderIdxSpecial> {
        match flag {
            0 => Ok(Elf_SectionHeaderIdxSpecial::Undefined),
            65280 => Ok(Elf_SectionHeaderIdxSpecial::Before),
            65281 => Ok(Elf_SectionHeaderIdxSpecial::After),
            65282 => Ok(Elf_SectionHeaderIdxSpecial::Amd64Lcommon),
            65343 => Ok(Elf_SectionHeaderIdxSpecial::SunwIgnore),
            65521 => Ok(Elf_SectionHeaderIdxSpecial::Abs),
            65522 => Ok(Elf_SectionHeaderIdxSpecial::Common),
            65535 => Ok(Elf_SectionHeaderIdxSpecial::Xindex),
            _ => Ok(Elf_SectionHeaderIdxSpecial::Unknown(flag)),
        }
    }
}

impl From<&Elf_SectionHeaderIdxSpecial> for i64 {
    fn from(v: &Elf_SectionHeaderIdxSpecial) -> Self {
        match *v {
            Elf_SectionHeaderIdxSpecial::Undefined => 0,
            Elf_SectionHeaderIdxSpecial::Before => 65280,
            Elf_SectionHeaderIdxSpecial::After => 65281,
            Elf_SectionHeaderIdxSpecial::Amd64Lcommon => 65282,
            Elf_SectionHeaderIdxSpecial::SunwIgnore => 65343,
            Elf_SectionHeaderIdxSpecial::Abs => 65521,
            Elf_SectionHeaderIdxSpecial::Common => 65522,
            Elf_SectionHeaderIdxSpecial::Xindex => 65535,
            Elf_SectionHeaderIdxSpecial::Unknown(v) => v
        }
    }
}

impl Default for Elf_SectionHeaderIdxSpecial {
    fn default() -> Self { Elf_SectionHeaderIdxSpecial::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_ShType {

    /**
     * Section header table entry unused
     */
    NullType,

    /**
     * Program specific (private) data
     */
    Progbits,

    /**
     * Link editing symbol table
     */
    Symtab,

    /**
     * String table
     */
    Strtab,

    /**
     * Relocation entries with addends
     */
    Rela,

    /**
     * Symbol hash table
     */
    Hash,

    /**
     * Dynamic linking information
     */
    Dynamic,

    /**
     * Information that marks the file in some way
     */
    Note,

    /**
     * Section occupies no space in file
     */
    Nobits,

    /**
     * Relocation entries, no addends
     */
    Rel,

    /**
     * Reserved, unspecified semantics
     */
    Shlib,

    /**
     * Dynamic linking symbol table
     */
    Dynsym,

    /**
     * Pointers to initialization functions
     */
    InitArray,

    /**
     * Pointers to termination functions
     */
    FiniArray,

    /**
     * Pointers to pre-init functions
     */
    PreinitArray,

    /**
     * Section contains a section group
     */
    Group,

    /**
     * Indices for `SHN_XINDEX` entries
     */
    SymtabShndx,

    /**
     * Relative relocations (only offsets)
     */
    Relr,

    /**
     * Android packed relocation entries, no addends
     */
    AndroidRel,

    /**
     * Android packed relocation entries with addends
     */
    AndroidRela,

    /**
     * Incremental build data
     */
    GnuIncrementalInputs,

    /**
     * LLVM ODR table
     */
    LlvmOdrtab,

    /**
     * LLVM Linker Options
     */
    LlvmLinkerOptions,

    /**
     * List of address-significant symbols for safe ICF
     */
    LlvmAddrsig,

    /**
     * LLVM Dependent Library Specifiers
     */
    LlvmDependentLibraries,

    /**
     * Symbol partition specification
     */
    LlvmSympart,

    /**
     * ELF header for loadable partition
     */
    LlvmPartEhdr,

    /**
     * Phdrs for loadable partition
     */
    LlvmPartPhdr,

    /**
     * LLVM Basic Block Address Map, version 0.
     * 
     * Superseded by `sh_type::llvm_bb_addr_map` (`SHT_LLVM_BB_ADDR_MAP`).
     * LLVM 21.1.0 removed support for this value - see
     * <https://github.com/llvm/llvm-project/commit/6b623a6622707ea47d84ab0069f766215a6fec44>
     * and [LLVM 21.1.0 Release Notes](https://releases.llvm.org/21.1.0/docs/ReleaseNotes.html#changes-to-the-llvm-tools).
     */
    LlvmBbAddrMapV0,

    /**
     * LLVM Call Graph Profile
     */
    LlvmCallGraphProfile,

    /**
     * LLVM Basic Block Address Map
     */
    LlvmBbAddrMap,

    /**
     * LLVM device offloading data
     */
    LlvmOffloading,

    /**
     * `.llvm.lto` section for fat LTO
     */
    LlvmLto,

    /**
     * LLVM jump tables sizes
     */
    LlvmJtSizes,

    /**
     * LLVM CFI jump table
     */
    LlvmCfiJumpTable,

    /**
     * LLVM Call Graph Section
     */
    LlvmCallGraph,

    /**
     * LLVM Dynamic Debugging ELF
     * \sa https://github.com/llvm/llvm-project/blob/30ad5cc8f094a248b883e613f523925c63c666b8/llvm/include/llvm/BinaryFormat/ELF.h#L1200 Source
     */
    LlvmDyndbgElf,
    AndroidRelr,
    SunwCtf,
    SunwSymnsort,
    SunwPhname,
    SunwAncillary,
    SunwCapchain,
    SunwCapinfo,
    SunwSymsort,
    SunwTlssort,
    SunwLdynsym,

    /**
     * SFrame stack trace information (added in GNU Binutils 2.45)
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L571 Source
     */
    GnuSframe,

    /**
     * Object attributes
     */
    GnuAttributes,

    /**
     * GNU style symbol hash table
     */
    GnuHash,

    /**
     * List of prelink dependencies
     */
    GnuLiblist,

    /**
     * Checksum for DSO content
     */
    Checksum,

    /**
     * Object only
     */
    GnuObjectOnly,
    SunwMove,
    SunwComdat,
    SunwSyminfo,

    /**
     * Versions defined by file
     */
    GnuVerdef,

    /**
     * Versions needed by file
     */
    GnuVerneed,

    /**
     * Symbol versions
     */
    GnuVersym,
    SparcGotdata,

    /**
     * Unwind information
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/x86-64.h#L121 Source
     */
    X8664Unwind,

    /**
     * Preemption details
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/arm.h#L81 Source
     */
    ArmPreemptmap,

    /**
     * ARM build attributes
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/arm.h#L82 Source
     */
    ArmAttributes,

    /**
     * Overlay debug info
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/arm.h#L83 Source
     */
    ArmDebugoverlay,

    /**
     * GDB and overlay integration info
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/arm.h#L84 Source
     */
    ArmOverlaysection,
    Aarch64MemtagGlobalsStatic,
    Aarch64MemtagGlobalsDynamic,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_ShType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_ShType> {
        match flag {
            0 => Ok(Elf_ShType::NullType),
            1 => Ok(Elf_ShType::Progbits),
            2 => Ok(Elf_ShType::Symtab),
            3 => Ok(Elf_ShType::Strtab),
            4 => Ok(Elf_ShType::Rela),
            5 => Ok(Elf_ShType::Hash),
            6 => Ok(Elf_ShType::Dynamic),
            7 => Ok(Elf_ShType::Note),
            8 => Ok(Elf_ShType::Nobits),
            9 => Ok(Elf_ShType::Rel),
            10 => Ok(Elf_ShType::Shlib),
            11 => Ok(Elf_ShType::Dynsym),
            14 => Ok(Elf_ShType::InitArray),
            15 => Ok(Elf_ShType::FiniArray),
            16 => Ok(Elf_ShType::PreinitArray),
            17 => Ok(Elf_ShType::Group),
            18 => Ok(Elf_ShType::SymtabShndx),
            19 => Ok(Elf_ShType::Relr),
            1610612737 => Ok(Elf_ShType::AndroidRel),
            1610612738 => Ok(Elf_ShType::AndroidRela),
            1879000832 => Ok(Elf_ShType::GnuIncrementalInputs),
            1879002112 => Ok(Elf_ShType::LlvmOdrtab),
            1879002113 => Ok(Elf_ShType::LlvmLinkerOptions),
            1879002115 => Ok(Elf_ShType::LlvmAddrsig),
            1879002116 => Ok(Elf_ShType::LlvmDependentLibraries),
            1879002117 => Ok(Elf_ShType::LlvmSympart),
            1879002118 => Ok(Elf_ShType::LlvmPartEhdr),
            1879002119 => Ok(Elf_ShType::LlvmPartPhdr),
            1879002120 => Ok(Elf_ShType::LlvmBbAddrMapV0),
            1879002121 => Ok(Elf_ShType::LlvmCallGraphProfile),
            1879002122 => Ok(Elf_ShType::LlvmBbAddrMap),
            1879002123 => Ok(Elf_ShType::LlvmOffloading),
            1879002124 => Ok(Elf_ShType::LlvmLto),
            1879002125 => Ok(Elf_ShType::LlvmJtSizes),
            1879002126 => Ok(Elf_ShType::LlvmCfiJumpTable),
            1879002127 => Ok(Elf_ShType::LlvmCallGraph),
            1879002128 => Ok(Elf_ShType::LlvmDyndbgElf),
            1879047936 => Ok(Elf_ShType::AndroidRelr),
            1879048171 => Ok(Elf_ShType::SunwCtf),
            1879048172 => Ok(Elf_ShType::SunwSymnsort),
            1879048173 => Ok(Elf_ShType::SunwPhname),
            1879048174 => Ok(Elf_ShType::SunwAncillary),
            1879048175 => Ok(Elf_ShType::SunwCapchain),
            1879048176 => Ok(Elf_ShType::SunwCapinfo),
            1879048177 => Ok(Elf_ShType::SunwSymsort),
            1879048178 => Ok(Elf_ShType::SunwTlssort),
            1879048179 => Ok(Elf_ShType::SunwLdynsym),
            1879048180 => Ok(Elf_ShType::GnuSframe),
            1879048181 => Ok(Elf_ShType::GnuAttributes),
            1879048182 => Ok(Elf_ShType::GnuHash),
            1879048183 => Ok(Elf_ShType::GnuLiblist),
            1879048184 => Ok(Elf_ShType::Checksum),
            1879048185 => Ok(Elf_ShType::GnuObjectOnly),
            1879048186 => Ok(Elf_ShType::SunwMove),
            1879048187 => Ok(Elf_ShType::SunwComdat),
            1879048188 => Ok(Elf_ShType::SunwSyminfo),
            1879048189 => Ok(Elf_ShType::GnuVerdef),
            1879048190 => Ok(Elf_ShType::GnuVerneed),
            1879048191 => Ok(Elf_ShType::GnuVersym),
            1879048192 => Ok(Elf_ShType::SparcGotdata),
            1879048193 => Ok(Elf_ShType::X8664Unwind),
            1879048194 => Ok(Elf_ShType::ArmPreemptmap),
            1879048195 => Ok(Elf_ShType::ArmAttributes),
            1879048196 => Ok(Elf_ShType::ArmDebugoverlay),
            1879048197 => Ok(Elf_ShType::ArmOverlaysection),
            1879048199 => Ok(Elf_ShType::Aarch64MemtagGlobalsStatic),
            1879048200 => Ok(Elf_ShType::Aarch64MemtagGlobalsDynamic),
            _ => Ok(Elf_ShType::Unknown(flag)),
        }
    }
}

impl From<&Elf_ShType> for i64 {
    fn from(v: &Elf_ShType) -> Self {
        match *v {
            Elf_ShType::NullType => 0,
            Elf_ShType::Progbits => 1,
            Elf_ShType::Symtab => 2,
            Elf_ShType::Strtab => 3,
            Elf_ShType::Rela => 4,
            Elf_ShType::Hash => 5,
            Elf_ShType::Dynamic => 6,
            Elf_ShType::Note => 7,
            Elf_ShType::Nobits => 8,
            Elf_ShType::Rel => 9,
            Elf_ShType::Shlib => 10,
            Elf_ShType::Dynsym => 11,
            Elf_ShType::InitArray => 14,
            Elf_ShType::FiniArray => 15,
            Elf_ShType::PreinitArray => 16,
            Elf_ShType::Group => 17,
            Elf_ShType::SymtabShndx => 18,
            Elf_ShType::Relr => 19,
            Elf_ShType::AndroidRel => 1610612737,
            Elf_ShType::AndroidRela => 1610612738,
            Elf_ShType::GnuIncrementalInputs => 1879000832,
            Elf_ShType::LlvmOdrtab => 1879002112,
            Elf_ShType::LlvmLinkerOptions => 1879002113,
            Elf_ShType::LlvmAddrsig => 1879002115,
            Elf_ShType::LlvmDependentLibraries => 1879002116,
            Elf_ShType::LlvmSympart => 1879002117,
            Elf_ShType::LlvmPartEhdr => 1879002118,
            Elf_ShType::LlvmPartPhdr => 1879002119,
            Elf_ShType::LlvmBbAddrMapV0 => 1879002120,
            Elf_ShType::LlvmCallGraphProfile => 1879002121,
            Elf_ShType::LlvmBbAddrMap => 1879002122,
            Elf_ShType::LlvmOffloading => 1879002123,
            Elf_ShType::LlvmLto => 1879002124,
            Elf_ShType::LlvmJtSizes => 1879002125,
            Elf_ShType::LlvmCfiJumpTable => 1879002126,
            Elf_ShType::LlvmCallGraph => 1879002127,
            Elf_ShType::LlvmDyndbgElf => 1879002128,
            Elf_ShType::AndroidRelr => 1879047936,
            Elf_ShType::SunwCtf => 1879048171,
            Elf_ShType::SunwSymnsort => 1879048172,
            Elf_ShType::SunwPhname => 1879048173,
            Elf_ShType::SunwAncillary => 1879048174,
            Elf_ShType::SunwCapchain => 1879048175,
            Elf_ShType::SunwCapinfo => 1879048176,
            Elf_ShType::SunwSymsort => 1879048177,
            Elf_ShType::SunwTlssort => 1879048178,
            Elf_ShType::SunwLdynsym => 1879048179,
            Elf_ShType::GnuSframe => 1879048180,
            Elf_ShType::GnuAttributes => 1879048181,
            Elf_ShType::GnuHash => 1879048182,
            Elf_ShType::GnuLiblist => 1879048183,
            Elf_ShType::Checksum => 1879048184,
            Elf_ShType::GnuObjectOnly => 1879048185,
            Elf_ShType::SunwMove => 1879048186,
            Elf_ShType::SunwComdat => 1879048187,
            Elf_ShType::SunwSyminfo => 1879048188,
            Elf_ShType::GnuVerdef => 1879048189,
            Elf_ShType::GnuVerneed => 1879048190,
            Elf_ShType::GnuVersym => 1879048191,
            Elf_ShType::SparcGotdata => 1879048192,
            Elf_ShType::X8664Unwind => 1879048193,
            Elf_ShType::ArmPreemptmap => 1879048194,
            Elf_ShType::ArmAttributes => 1879048195,
            Elf_ShType::ArmDebugoverlay => 1879048196,
            Elf_ShType::ArmOverlaysection => 1879048197,
            Elf_ShType::Aarch64MemtagGlobalsStatic => 1879048199,
            Elf_ShType::Aarch64MemtagGlobalsDynamic => 1879048200,
            Elf_ShType::Unknown(v) => v
        }
    }
}

impl Default for Elf_ShType {
    fn default() -> Self { Elf_ShType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_SymbolBinding {

    /**
     * not visible outside the object file containing their definition
     */
    Local,

    /**
     * visible to all object files being combined
     * 
     * As of KSC 0.9, this enum key can't be called `global` because it would
     * cause a syntax error in Python (it is a keyword).
     */
    GlobalSymbol,

    /**
     * like `symbol_binding::global_symbol`, but their definitions have lower precedence
     */
    Weak,

    /**
     * reserved for operating system-specific semantics
     */
    Os10,

    /**
     * reserved for operating system-specific semantics
     */
    Os11,

    /**
     * reserved for operating system-specific semantics
     */
    Os12,

    /**
     * reserved for processor-specific semantics
     */
    Proc13,

    /**
     * reserved for processor-specific semantics
     */
    Proc14,

    /**
     * reserved for processor-specific semantics
     */
    Proc15,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_SymbolBinding {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_SymbolBinding> {
        match flag {
            0 => Ok(Elf_SymbolBinding::Local),
            1 => Ok(Elf_SymbolBinding::GlobalSymbol),
            2 => Ok(Elf_SymbolBinding::Weak),
            10 => Ok(Elf_SymbolBinding::Os10),
            11 => Ok(Elf_SymbolBinding::Os11),
            12 => Ok(Elf_SymbolBinding::Os12),
            13 => Ok(Elf_SymbolBinding::Proc13),
            14 => Ok(Elf_SymbolBinding::Proc14),
            15 => Ok(Elf_SymbolBinding::Proc15),
            _ => Ok(Elf_SymbolBinding::Unknown(flag)),
        }
    }
}

impl From<&Elf_SymbolBinding> for i64 {
    fn from(v: &Elf_SymbolBinding) -> Self {
        match *v {
            Elf_SymbolBinding::Local => 0,
            Elf_SymbolBinding::GlobalSymbol => 1,
            Elf_SymbolBinding::Weak => 2,
            Elf_SymbolBinding::Os10 => 10,
            Elf_SymbolBinding::Os11 => 11,
            Elf_SymbolBinding::Os12 => 12,
            Elf_SymbolBinding::Proc13 => 13,
            Elf_SymbolBinding::Proc14 => 14,
            Elf_SymbolBinding::Proc15 => 15,
            Elf_SymbolBinding::Unknown(v) => v
        }
    }
}

impl Default for Elf_SymbolBinding {
    fn default() -> Self { Elf_SymbolBinding::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_SymbolType {
    NoType,

    /**
     * associated with a data object, such as a variable, an array, and so on
     */
    Object,

    /**
     * associated with a function or other executable code
     */
    Func,

    /**
     * associated with a section
     */
    Section,

    /**
     * symbol's name gives the name of the source file associated with the object file
     */
    File,

    /**
     * labels an uninitialized common block
     */
    Common,

    /**
     * specifies a thread-local storage entity
     */
    Tls,

    /**
     * complex relocation expression
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L1155 Source
     */
    Relc,

    /**
     * signed complex relocation expression
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L1156 Source
     */
    Srelc,

    /**
     * reserved for OS-specific semantics
     * 
     * `STT_GNU_IFUNC` is a GNU extension to ELF format that adds support for "indirect functions"
     */
    GnuIfunc,

    /**
     * reserved for OS-specific semantics
     */
    Os11,

    /**
     * reserved for OS-specific semantics
     */
    Os12,

    /**
     * reserved for processor-specific semantics
     */
    Proc13,

    /**
     * reserved for processor-specific semantics
     */
    Proc14,

    /**
     * reserved for processor-specific semantics
     */
    Proc15,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_SymbolType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_SymbolType> {
        match flag {
            0 => Ok(Elf_SymbolType::NoType),
            1 => Ok(Elf_SymbolType::Object),
            2 => Ok(Elf_SymbolType::Func),
            3 => Ok(Elf_SymbolType::Section),
            4 => Ok(Elf_SymbolType::File),
            5 => Ok(Elf_SymbolType::Common),
            6 => Ok(Elf_SymbolType::Tls),
            8 => Ok(Elf_SymbolType::Relc),
            9 => Ok(Elf_SymbolType::Srelc),
            10 => Ok(Elf_SymbolType::GnuIfunc),
            11 => Ok(Elf_SymbolType::Os11),
            12 => Ok(Elf_SymbolType::Os12),
            13 => Ok(Elf_SymbolType::Proc13),
            14 => Ok(Elf_SymbolType::Proc14),
            15 => Ok(Elf_SymbolType::Proc15),
            _ => Ok(Elf_SymbolType::Unknown(flag)),
        }
    }
}

impl From<&Elf_SymbolType> for i64 {
    fn from(v: &Elf_SymbolType) -> Self {
        match *v {
            Elf_SymbolType::NoType => 0,
            Elf_SymbolType::Object => 1,
            Elf_SymbolType::Func => 2,
            Elf_SymbolType::Section => 3,
            Elf_SymbolType::File => 4,
            Elf_SymbolType::Common => 5,
            Elf_SymbolType::Tls => 6,
            Elf_SymbolType::Relc => 8,
            Elf_SymbolType::Srelc => 9,
            Elf_SymbolType::GnuIfunc => 10,
            Elf_SymbolType::Os11 => 11,
            Elf_SymbolType::Os12 => 12,
            Elf_SymbolType::Proc13 => 13,
            Elf_SymbolType::Proc14 => 14,
            Elf_SymbolType::Proc15 => 15,
            Elf_SymbolType::Unknown(v) => v
        }
    }
}

impl Default for Elf_SymbolType {
    fn default() -> Self { Elf_SymbolType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_SymbolVisibility {
    Default,
    Internal,
    Hidden,
    Protected,
    Exported,
    Singleton,
    Eliminate,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_SymbolVisibility {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_SymbolVisibility> {
        match flag {
            0 => Ok(Elf_SymbolVisibility::Default),
            1 => Ok(Elf_SymbolVisibility::Internal),
            2 => Ok(Elf_SymbolVisibility::Hidden),
            3 => Ok(Elf_SymbolVisibility::Protected),
            4 => Ok(Elf_SymbolVisibility::Exported),
            5 => Ok(Elf_SymbolVisibility::Singleton),
            6 => Ok(Elf_SymbolVisibility::Eliminate),
            _ => Ok(Elf_SymbolVisibility::Unknown(flag)),
        }
    }
}

impl From<&Elf_SymbolVisibility> for i64 {
    fn from(v: &Elf_SymbolVisibility) -> Self {
        match *v {
            Elf_SymbolVisibility::Default => 0,
            Elf_SymbolVisibility::Internal => 1,
            Elf_SymbolVisibility::Hidden => 2,
            Elf_SymbolVisibility::Protected => 3,
            Elf_SymbolVisibility::Exported => 4,
            Elf_SymbolVisibility::Singleton => 5,
            Elf_SymbolVisibility::Eliminate => 6,
            Elf_SymbolVisibility::Unknown(v) => v
        }
    }
}

impl Default for Elf_SymbolVisibility {
    fn default() -> Self { Elf_SymbolVisibility::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Elf_VersionIndexSpecial {

    /**
     * The symbol is local, not available outside the object.
     */
    Local,

    /**
     * The symbol is defined in this object and is globally available. It's
     * assigned to the base version definition. This value is used for
     * unversioned symbols.
     * 
     * As of KSC 0.9, this enum key can't be called `global` because it would
     * cause a syntax error in Python (it is a keyword).
     */
    GlobalSymbol,

    /**
     * Symbol is to be eliminated.
     * 
     * This appears to be a Solaris-specific value - as far as I know, no GNU
     * software (such as glibc or binutils) uses it.
     * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1092 Source
     */
    Eliminate,
    Unknown(i64),
}

impl TryFrom<i64> for Elf_VersionIndexSpecial {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Elf_VersionIndexSpecial> {
        match flag {
            0 => Ok(Elf_VersionIndexSpecial::Local),
            1 => Ok(Elf_VersionIndexSpecial::GlobalSymbol),
            65281 => Ok(Elf_VersionIndexSpecial::Eliminate),
            _ => Ok(Elf_VersionIndexSpecial::Unknown(flag)),
        }
    }
}

impl From<&Elf_VersionIndexSpecial> for i64 {
    fn from(v: &Elf_VersionIndexSpecial) -> Self {
        match *v {
            Elf_VersionIndexSpecial::Local => 0,
            Elf_VersionIndexSpecial::GlobalSymbol => 1,
            Elf_VersionIndexSpecial::Eliminate => 65281,
            Elf_VersionIndexSpecial::Unknown(v) => v
        }
    }
}

impl Default for Elf_VersionIndexSpecial {
    fn default() -> Self { Elf_VersionIndexSpecial::Unknown(0) }
}


/**
 * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1008 Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER6-TBL-53 Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_DtFlag1Values {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    value: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_conf_alt: Cell<bool>,
    conf_alt: RefCell<bool>,
    f_direct: Cell<bool>,
    direct: RefCell<bool>,
    f_disp_rel_dne: Cell<bool>,
    disp_rel_dne: RefCell<bool>,
    f_disp_rel_pnd: Cell<bool>,
    disp_rel_pnd: RefCell<bool>,
    f_edited: Cell<bool>,
    edited: RefCell<bool>,
    f_end_filtee: Cell<bool>,
    end_filtee: RefCell<bool>,
    f_glob_audit: Cell<bool>,
    glob_audit: RefCell<bool>,
    f_group: Cell<bool>,
    group: RefCell<bool>,
    f_ign_mul_def: Cell<bool>,
    ign_mul_def: RefCell<bool>,
    f_init_first: Cell<bool>,
    init_first: RefCell<bool>,
    f_interpose: Cell<bool>,
    interpose: RefCell<bool>,
    f_kmod: Cell<bool>,
    kmod: RefCell<bool>,
    f_load_fltr: Cell<bool>,
    load_fltr: RefCell<bool>,
    f_no_common: Cell<bool>,
    no_common: RefCell<bool>,
    f_no_def_lib: Cell<bool>,
    no_def_lib: RefCell<bool>,
    f_no_delete: Cell<bool>,
    no_delete: RefCell<bool>,
    f_no_direct: Cell<bool>,
    no_direct: RefCell<bool>,
    f_no_dump: Cell<bool>,
    no_dump: RefCell<bool>,
    f_no_hdr: Cell<bool>,
    no_hdr: RefCell<bool>,
    f_no_ksyms: Cell<bool>,
    no_ksyms: RefCell<bool>,
    f_no_open: Cell<bool>,
    no_open: RefCell<bool>,
    f_no_reloc: Cell<bool>,
    no_reloc: RefCell<bool>,
    f_now: Cell<bool>,
    now: RefCell<bool>,
    f_origin: Cell<bool>,
    origin: RefCell<bool>,
    f_pie: Cell<bool>,
    pie: RefCell<bool>,
    f_rtld_global: Cell<bool>,
    rtld_global: RefCell<bool>,
    f_singleton: Cell<bool>,
    singleton: RefCell<bool>,
    f_stub: Cell<bool>,
    stub: RefCell<bool>,
    f_sym_intpose: Cell<bool>,
    sym_intpose: RefCell<bool>,
    f_trans: Cell<bool>,
    trans: RefCell<bool>,
    f_weak_filter: Cell<bool>,
    weak_filter: RefCell<bool>,
}
impl KStruct for Elf_DtFlag1Values {
    type Root = Elf;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Elf_DtFlag1Values {
    pub fn value(&self) -> Ref<'_, u32> {
        self.value.borrow()
    }
}
impl Elf_DtFlag1Values {
    pub fn set_params(&mut self, value: u32) {
        *self.value.borrow_mut() = value;
    }
}
impl Elf_DtFlag1Values {

    /**
     * Configuration alternative created.
     * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1023 Source
     */
    pub fn conf_alt(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_conf_alt.get() {
            return Ok(self.conf_alt.borrow());
        }
        self.f_conf_alt.set(true);
        *self.conf_alt.borrow_mut() = (((((*self.value() as i32) & (8192 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.conf_alt.borrow())
    }

    /**
     * Direct binding enabled.
     */
    pub fn direct(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_direct.get() {
            return Ok(self.direct.borrow());
        }
        self.f_direct.set(true);
        *self.direct.borrow_mut() = (((((*self.value() as i32) & (256 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.direct.borrow())
    }

    /**
     * Displacement relocation done (applied at build time).
     */
    pub fn disp_rel_dne(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_disp_rel_dne.get() {
            return Ok(self.disp_rel_dne.borrow());
        }
        self.f_disp_rel_dne.set(true);
        *self.disp_rel_dne.borrow_mut() = (((((*self.value() as i32) & (32768 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.disp_rel_dne.borrow())
    }

    /**
     * Displacement relocation pending (applied at runtime).
     */
    pub fn disp_rel_pnd(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_disp_rel_pnd.get() {
            return Ok(self.disp_rel_pnd.borrow());
        }
        self.f_disp_rel_pnd.set(true);
        *self.disp_rel_pnd.borrow_mut() = (((((*self.value() as i32) & (65536 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.disp_rel_pnd.borrow())
    }

    /**
     * Object is modified after built.
     */
    pub fn edited(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_edited.get() {
            return Ok(self.edited.borrow());
        }
        self.f_edited.set(true);
        *self.edited.borrow_mut() = (((((*self.value() as i32) & (2097152 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.edited.borrow())
    }

    /**
     * Filtee terminates filters search.
     */
    pub fn end_filtee(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_end_filtee.get() {
            return Ok(self.end_filtee.borrow());
        }
        self.f_end_filtee.set(true);
        *self.end_filtee.borrow_mut() = (((((*self.value() as i32) & (16384 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.end_filtee.borrow())
    }

    /**
     * Global auditing required.
     */
    pub fn glob_audit(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_glob_audit.get() {
            return Ok(self.glob_audit.borrow());
        }
        self.f_glob_audit.set(true);
        *self.glob_audit.borrow_mut() = (((((*self.value() as i32) & (16777216 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.glob_audit.borrow())
    }

    /**
     * Set `RTLD_GROUP` for this object.
     */
    pub fn group(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_group.get() {
            return Ok(self.group.borrow());
        }
        self.f_group.set(true);
        *self.group.borrow_mut() = (((((*self.value() as u32) & (4 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.group.borrow())
    }
    pub fn ign_mul_def(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ign_mul_def.get() {
            return Ok(self.ign_mul_def.borrow());
        }
        self.f_ign_mul_def.set(true);
        *self.ign_mul_def.borrow_mut() = (((((*self.value() as i32) & (262144 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.ign_mul_def.borrow())
    }

    /**
     * Set `RTLD_INITFIRST` for this object.
     */
    pub fn init_first(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_init_first.get() {
            return Ok(self.init_first.borrow());
        }
        self.f_init_first.set(true);
        *self.init_first.borrow_mut() = (((((*self.value() as u32) & (32 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.init_first.borrow())
    }

    /**
     * Object is used to interpose.
     */
    pub fn interpose(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_interpose.get() {
            return Ok(self.interpose.borrow());
        }
        self.f_interpose.set(true);
        *self.interpose.borrow_mut() = (((((*self.value() as i32) & (1024 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.interpose.borrow())
    }

    /**
     * Object is a kernel module.
     */
    pub fn kmod(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_kmod.get() {
            return Ok(self.kmod.borrow());
        }
        self.f_kmod.set(true);
        *self.kmod.borrow_mut() = (((((*self.value() as i32) & (268435456 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.kmod.borrow())
    }

    /**
     * Trigger filtee loading at runtime.
     */
    pub fn load_fltr(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_load_fltr.get() {
            return Ok(self.load_fltr.borrow());
        }
        self.f_load_fltr.set(true);
        *self.load_fltr.borrow_mut() = (((((*self.value() as u32) & (16 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.load_fltr.borrow())
    }

    /**
     * No COMMON symbols exist.
     * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1040 Source
     */
    pub fn no_common(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_common.get() {
            return Ok(self.no_common.borrow());
        }
        self.f_no_common.set(true);
        *self.no_common.borrow_mut() = (((((*self.value() as i32) & (1073741824 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_common.borrow())
    }

    /**
     * Ignore the default library search path.
     */
    pub fn no_def_lib(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_def_lib.get() {
            return Ok(self.no_def_lib.borrow());
        }
        self.f_no_def_lib.set(true);
        *self.no_def_lib.borrow_mut() = (((((*self.value() as i32) & (2048 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_def_lib.borrow())
    }

    /**
     * Set `RTLD_NODELETE` for this object.
     */
    pub fn no_delete(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_delete.get() {
            return Ok(self.no_delete.borrow());
        }
        self.f_no_delete.set(true);
        *self.no_delete.borrow_mut() = (((((*self.value() as u32) & (8 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_delete.borrow())
    }

    /**
     * Object contains non-direct bindings.
     */
    pub fn no_direct(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_direct.get() {
            return Ok(self.no_direct.borrow());
        }
        self.f_no_direct.set(true);
        *self.no_direct.borrow_mut() = (((((*self.value() as i32) & (131072 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_direct.borrow())
    }

    /**
     * Object can't be dldump'ed.
     */
    pub fn no_dump(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_dump.get() {
            return Ok(self.no_dump.borrow());
        }
        self.f_no_dump.set(true);
        *self.no_dump.borrow_mut() = (((((*self.value() as i32) & (4096 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_dump.borrow())
    }
    pub fn no_hdr(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_hdr.get() {
            return Ok(self.no_hdr.borrow());
        }
        self.f_no_hdr.set(true);
        *self.no_hdr.borrow_mut() = (((((*self.value() as i32) & (1048576 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_hdr.borrow())
    }
    pub fn no_ksyms(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_ksyms.get() {
            return Ok(self.no_ksyms.borrow());
        }
        self.f_no_ksyms.set(true);
        *self.no_ksyms.borrow_mut() = (((((*self.value() as i32) & (524288 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_ksyms.borrow())
    }

    /**
     * Set `RTLD_NOOPEN` for this object.
     */
    pub fn no_open(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_open.get() {
            return Ok(self.no_open.borrow());
        }
        self.f_no_open.set(true);
        *self.no_open.borrow_mut() = (((((*self.value() as u32) & (64 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_open.borrow())
    }
    pub fn no_reloc(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_reloc.get() {
            return Ok(self.no_reloc.borrow());
        }
        self.f_no_reloc.set(true);
        *self.no_reloc.borrow_mut() = (((((*self.value() as i32) & (4194304 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_reloc.borrow())
    }

    /**
     * Set `RTLD_NOW` for this object.
     */
    pub fn now(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_now.get() {
            return Ok(self.now.borrow());
        }
        self.f_now.set(true);
        *self.now.borrow_mut() = (((((*self.value() as u32) & (1 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.now.borrow())
    }

    /**
     * `$ORIGIN` must be handled.
     */
    pub fn origin(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_origin.get() {
            return Ok(self.origin.borrow());
        }
        self.f_origin.set(true);
        *self.origin.borrow_mut() = (((((*self.value() as u32) & (128 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.origin.borrow())
    }

    /**
     * Object is a Position Independent Executable (PIE).
     */
    pub fn pie(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_pie.get() {
            return Ok(self.pie.borrow());
        }
        self.f_pie.set(true);
        *self.pie.borrow_mut() = (((((*self.value() as i32) & (134217728 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.pie.borrow())
    }

    /**
     * Set `RTLD_GLOBAL` for this object.
     */
    pub fn rtld_global(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_rtld_global.get() {
            return Ok(self.rtld_global.borrow());
        }
        self.f_rtld_global.set(true);
        *self.rtld_global.borrow_mut() = (((((*self.value() as u32) & (2 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.rtld_global.borrow())
    }

    /**
     * Singleton symbols are used.
     */
    pub fn singleton(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_singleton.get() {
            return Ok(self.singleton.borrow());
        }
        self.f_singleton.set(true);
        *self.singleton.borrow_mut() = (((((*self.value() as i32) & (33554432 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.singleton.borrow())
    }

    /**
     * Object is a stub.
     * See [Stub Objects](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/stub-objects.html).
     */
    pub fn stub(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_stub.get() {
            return Ok(self.stub.borrow());
        }
        self.f_stub.set(true);
        *self.stub.borrow_mut() = (((((*self.value() as i32) & (67108864 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.stub.borrow())
    }

    /**
     * Object has individual symbol interposers.
     */
    pub fn sym_intpose(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sym_intpose.get() {
            return Ok(self.sym_intpose.borrow());
        }
        self.f_sym_intpose.set(true);
        *self.sym_intpose.borrow_mut() = (((((*self.value() as i32) & (8388608 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.sym_intpose.borrow())
    }

    /**
     * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1019 Source
     */
    pub fn trans(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_trans.get() {
            return Ok(self.trans.borrow());
        }
        self.f_trans.set(true);
        *self.trans.borrow_mut() = (((((*self.value() as i32) & (512 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.trans.borrow())
    }

    /**
     * Object is a weak standard filter.
     */
    pub fn weak_filter(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_weak_filter.get() {
            return Ok(self.weak_filter.borrow());
        }
        self.f_weak_filter.set(true);
        *self.weak_filter.borrow_mut() = (((((*self.value() as i32) & (536870912 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.weak_filter.borrow())
    }
}
impl Elf_DtFlag1Values {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html Figure 5-11: DT_FLAGS values
 * \sa https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095 Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER7-TBL-5 Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_DtFlagValues {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    value: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_bind_now: Cell<bool>,
    bind_now: RefCell<bool>,
    f_origin: Cell<bool>,
    origin: RefCell<bool>,
    f_static_tls: Cell<bool>,
    static_tls: RefCell<bool>,
    f_symbolic: Cell<bool>,
    symbolic: RefCell<bool>,
    f_textrel: Cell<bool>,
    textrel: RefCell<bool>,
}
impl KStruct for Elf_DtFlagValues {
    type Root = Elf;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Elf_DtFlagValues {
    pub fn value(&self) -> Ref<'_, u32> {
        self.value.borrow()
    }
}
impl Elf_DtFlagValues {
    pub fn set_params(&mut self, value: u32) {
        *self.value.borrow_mut() = value;
    }
}
impl Elf_DtFlagValues {

    /**
     * all relocations for this object must be processed before returning
     * control to the program
     */
    pub fn bind_now(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bind_now.get() {
            return Ok(self.bind_now.borrow());
        }
        self.f_bind_now.set(true);
        *self.bind_now.borrow_mut() = (((((*self.value() as u32) & (8 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.bind_now.borrow())
    }

    /**
     * object may reference the $ORIGIN substitution string
     */
    pub fn origin(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_origin.get() {
            return Ok(self.origin.borrow());
        }
        self.f_origin.set(true);
        *self.origin.borrow_mut() = (((((*self.value() as u32) & (1 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.origin.borrow())
    }

    /**
     * object uses static thread-local storage scheme
     */
    pub fn static_tls(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_static_tls.get() {
            return Ok(self.static_tls.borrow());
        }
        self.f_static_tls.set(true);
        *self.static_tls.borrow_mut() = (((((*self.value() as u32) & (16 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.static_tls.borrow())
    }

    /**
     * symbolic linking
     */
    pub fn symbolic(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_symbolic.get() {
            return Ok(self.symbolic.borrow());
        }
        self.f_symbolic.set(true);
        *self.symbolic.borrow_mut() = (((((*self.value() as u32) & (2 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.symbolic.borrow())
    }

    /**
     * relocation entries might request modifications to a non-writable segment
     */
    pub fn textrel(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_textrel.get() {
            return Ok(self.textrel.borrow());
        }
        self.f_textrel.set(true);
        *self.textrel.borrow_mut() = (((((*self.value() as u32) & (4 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.textrel.borrow())
    }
}
impl Elf_DtFlagValues {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://gabi.xinuos.com/v42/elf/02-eheader.html Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-header.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf>,
    pub _self: SharedType<Self>,
    e_type: RefCell<Elf_ObjType>,
    machine: RefCell<Elf_Machine>,
    e_version: RefCell<u32>,
    entry_point: RefCell<Option<Elf_EndianElf_EntryPoint>>,
    ofs_program_headers: RefCell<Option<Elf_EndianElf_OfsProgramHeaders>>,
    ofs_section_headers: RefCell<Option<Elf_EndianElf_OfsSectionHeaders>>,
    flags: RefCell<Vec<u8>>,
    e_ehsize: RefCell<u16>,
    program_header_size: RefCell<u16>,
    num_program_headers: RefCell<u16>,
    section_header_size: RefCell<u16>,
    num_section_headers: RefCell<u16>,
    section_names_idx: RefCell<u16>,
    _io: RefCell<BytesReader>,
    program_headers_raw: RefCell<Vec<Vec<u8>>>,
    section_headers_raw: RefCell<Vec<Vec<u8>>>,
    section_names_raw: RefCell<Vec<u8>>,
    f_program_headers: Cell<bool>,
    program_headers: RefCell<Vec<OptRc<Elf_EndianElf_ProgramHeader>>>,
    f_section_headers: Cell<bool>,
    section_headers: RefCell<Vec<OptRc<Elf_EndianElf_SectionHeader>>>,
    f_section_names: Cell<bool>,
    section_names: RefCell<OptRc<Elf_EndianElf_StringsStruct>>,
    _is_le: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Elf_EndianElf_EntryPoint {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_EntryPoint {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_EntryPoint> for u32 {
    fn from(e: &Elf_EndianElf_EntryPoint) -> Self {
        if let Elf_EndianElf_EntryPoint::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_EntryPoint::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_EntryPoint {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_EntryPoint> for u64 {
    fn from(e: &Elf_EndianElf_EntryPoint) -> Self {
        if let Elf_EndianElf_EntryPoint::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_EntryPoint::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_EntryPoint> for usize {
    fn from(e: &Elf_EndianElf_EntryPoint) -> Self {
        match e {
            Elf_EndianElf_EntryPoint::U4(v) => *v as usize,
            Elf_EndianElf_EntryPoint::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_OfsProgramHeaders {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_OfsProgramHeaders {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_OfsProgramHeaders> for u32 {
    fn from(e: &Elf_EndianElf_OfsProgramHeaders) -> Self {
        if let Elf_EndianElf_OfsProgramHeaders::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_OfsProgramHeaders::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_OfsProgramHeaders {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_OfsProgramHeaders> for u64 {
    fn from(e: &Elf_EndianElf_OfsProgramHeaders) -> Self {
        if let Elf_EndianElf_OfsProgramHeaders::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_OfsProgramHeaders::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_OfsProgramHeaders> for usize {
    fn from(e: &Elf_EndianElf_OfsProgramHeaders) -> Self {
        match e {
            Elf_EndianElf_OfsProgramHeaders::U4(v) => *v as usize,
            Elf_EndianElf_OfsProgramHeaders::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_OfsSectionHeaders {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_OfsSectionHeaders {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_OfsSectionHeaders> for u32 {
    fn from(e: &Elf_EndianElf_OfsSectionHeaders) -> Self {
        if let Elf_EndianElf_OfsSectionHeaders::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_OfsSectionHeaders::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_OfsSectionHeaders {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_OfsSectionHeaders> for u64 {
    fn from(e: &Elf_EndianElf_OfsSectionHeaders) -> Self {
        if let Elf_EndianElf_OfsSectionHeaders::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_OfsSectionHeaders::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_OfsSectionHeaders> for usize {
    fn from(e: &Elf_EndianElf_OfsSectionHeaders) -> Self {
        match e {
            Elf_EndianElf_OfsSectionHeaders::U4(v) => *v as usize,
            Elf_EndianElf_OfsSectionHeaders::U8(v) => *v as usize,
        }
    }
}

impl KStruct for Elf_EndianElf {
    type Root = Elf;
    type Parent = Elf;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        match *_r.endian() {
            Elf_Endian::Le => {
                *self_rc._is_le.borrow_mut() = (1) as i32;
            }
            Elf_Endian::Be => {
                *self_rc._is_le.borrow_mut() = (2) as i32;
            }
            _ => {}
        }
        if *self_rc._is_le.borrow() == 0 {
            return Err(KError::UndecidedEndianness { src_path: "/types/endian_elf".to_string() });
        }
        *self_rc.e_type.borrow_mut() = (_io.read_u2()? as i64).try_into()?;
        *self_rc.machine.borrow_mut() = (_io.read_u2()? as i64).try_into()?;
        *self_rc.e_version.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.entry_point.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.entry_point.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.ofs_program_headers.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.ofs_program_headers.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.ofs_section_headers.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.ofs_section_headers.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        *self_rc.flags.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.e_ehsize.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        *self_rc.program_header_size.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        *self_rc.num_program_headers.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        *self_rc.section_header_size.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        *self_rc.num_section_headers.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        *self_rc.section_names_idx.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        Ok(())
    }
}
impl Elf_EndianElf {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf {
    pub fn program_headers(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Elf_EndianElf_ProgramHeader>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_program_headers.get() {
            return Ok(self.program_headers.borrow());
        }
        self.f_program_headers.set(true);
        let _pos = _io.pos();
        _io.seek(self.ofs_program_headers() as usize)?;
        *self.program_headers_raw.borrow_mut() = Vec::new();
        *self.program_headers.borrow_mut() = Vec::new();
        let l_program_headers = *self.num_program_headers();
        for _i in 0..l_program_headers {
            self.program_headers_raw.borrow_mut().push(_io.read_bytes(*self.program_header_size() as usize)?.into());
            let program_headers_raw = self.program_headers_raw.borrow();
            let io_program_headers_raw = BytesReader::from(program_headers_raw.last().unwrap().clone());
            let f = |t : &mut Elf_EndianElf_ProgramHeader| Ok(t.set_endian(*self._is_le.borrow()));
            let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_ProgramHeader>(&io_program_headers_raw, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.program_headers.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.program_headers.borrow())
    }
    pub fn section_headers(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Elf_EndianElf_SectionHeader>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_section_headers.get() {
            return Ok(self.section_headers.borrow());
        }
        self.f_section_headers.set(true);
        let _pos = _io.pos();
        _io.seek(self.ofs_section_headers() as usize)?;
        *self.section_headers_raw.borrow_mut() = Vec::new();
        *self.section_headers.borrow_mut() = Vec::new();
        let l_section_headers = *self.num_section_headers();
        for _i in 0..l_section_headers {
            self.section_headers_raw.borrow_mut().push(_io.read_bytes(*self.section_header_size() as usize)?.into());
            let section_headers_raw = self.section_headers_raw.borrow();
            let io_section_headers_raw = BytesReader::from(section_headers_raw.last().unwrap().clone());
            let f = |t : &mut Elf_EndianElf_SectionHeader| Ok(t.set_endian(*self._is_le.borrow()));
            let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_SectionHeader>(&io_section_headers_raw, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.section_headers.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.section_headers.borrow())
    }
    pub fn section_names(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_EndianElf_StringsStruct>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_section_names.get() {
            return Ok(self.section_names.borrow());
        }
        if  ((((*self.section_names_idx() as i32) != (i64::from(&Elf_SectionHeaderIdxSpecial::Undefined) as i32))) && (*self.section_names_idx() < *_r.header().num_section_headers()))  {
            let _pos = _io.pos();
            _io.seek(self.section_headers()?[*self.section_names_idx() as usize].ofs_body() as usize)?;
            *self.section_names_raw.borrow_mut() = _io.read_bytes(self.section_headers()?[*self.section_names_idx() as usize].len_body() as usize)?.into();
            let section_names_raw = self.section_names_raw.borrow();
            let _t_section_names_raw_io = BytesReader::from(section_names_raw.clone());
            let f = |t : &mut Elf_EndianElf_StringsStruct| Ok(t.set_endian(*self._is_le.borrow()));
            let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_StringsStruct>(&_t_section_names_raw_io, Some(self._root.clone()), None, &f)?.into();
            *self.section_names.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.section_names.borrow())
    }
}
impl Elf_EndianElf {
    pub fn e_type(&self) -> Ref<'_, Elf_ObjType> {
        self.e_type.borrow()
    }
}
impl Elf_EndianElf {
    pub fn machine(&self) -> Ref<'_, Elf_Machine> {
        self.machine.borrow()
    }
}
impl Elf_EndianElf {
    pub fn e_version(&self) -> Ref<'_, u32> {
        self.e_version.borrow()
    }
}
impl Elf_EndianElf {
    pub fn entry_point(&self) -> usize {
        self.entry_point.borrow().as_ref().unwrap().into()
    }
    pub fn entry_point_enum(&self) -> Ref<'_, Option<Elf_EndianElf_EntryPoint>> {
        self.entry_point.borrow()
    }
}
impl Elf_EndianElf {
    pub fn ofs_program_headers(&self) -> usize {
        self.ofs_program_headers.borrow().as_ref().unwrap().into()
    }
    pub fn ofs_program_headers_enum(&self) -> Ref<'_, Option<Elf_EndianElf_OfsProgramHeaders>> {
        self.ofs_program_headers.borrow()
    }
}
impl Elf_EndianElf {
    pub fn ofs_section_headers(&self) -> usize {
        self.ofs_section_headers.borrow().as_ref().unwrap().into()
    }
    pub fn ofs_section_headers_enum(&self) -> Ref<'_, Option<Elf_EndianElf_OfsSectionHeaders>> {
        self.ofs_section_headers.borrow()
    }
}
impl Elf_EndianElf {
    pub fn flags(&self) -> Ref<'_, Vec<u8>> {
        self.flags.borrow()
    }
}
impl Elf_EndianElf {
    pub fn e_ehsize(&self) -> Ref<'_, u16> {
        self.e_ehsize.borrow()
    }
}
impl Elf_EndianElf {
    pub fn program_header_size(&self) -> Ref<'_, u16> {
        self.program_header_size.borrow()
    }
}
impl Elf_EndianElf {
    pub fn num_program_headers(&self) -> Ref<'_, u16> {
        self.num_program_headers.borrow()
    }
}
impl Elf_EndianElf {
    pub fn section_header_size(&self) -> Ref<'_, u16> {
        self.section_header_size.borrow()
    }
}
impl Elf_EndianElf {
    pub fn num_section_headers(&self) -> Ref<'_, u16> {
        self.num_section_headers.borrow()
    }
}
impl Elf_EndianElf {
    pub fn section_names_idx(&self) -> Ref<'_, u16> {
        self.section_names_idx.borrow()
    }
}
impl Elf_EndianElf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Elf_EndianElf {
    pub fn program_headers_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.program_headers_raw.borrow()
    }
}
impl Elf_EndianElf {
    pub fn section_headers_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.section_headers_raw.borrow()
    }
}
impl Elf_EndianElf {
    pub fn section_names_raw(&self) -> Ref<'_, Vec<u8>> {
        self.section_names_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_DynsymSection {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_SectionHeader>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Elf_EndianElf_DynsymSectionEntry>>>,
    _io: RefCell<BytesReader>,
    f_is_string_table_linked: Cell<bool>,
    is_string_table_linked: RefCell<bool>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_DynsymSection {
    type Root = Elf;
    type Parent = Elf_EndianElf_SectionHeader;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let f = |t : &mut Elf_EndianElf_DynsymSectionEntry| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Elf_EndianElf_DynsymSectionEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Elf_EndianElf_DynsymSection {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_DynsymSection {
    pub fn is_string_table_linked(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_string_table_linked.get() {
            return Ok(self.is_string_table_linked.borrow());
        }
        self.f_is_string_table_linked.set(true);
        *self.is_string_table_linked.borrow_mut() = (*_prc.as_ref().unwrap().linked_section()?.type() == Elf_ShType::Strtab) as bool;
        Ok(self.is_string_table_linked.borrow())
    }
}
impl Elf_EndianElf_DynsymSection {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Elf_EndianElf_DynsymSectionEntry>>> {
        self.entries.borrow()
    }
}
impl Elf_EndianElf_DynsymSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://gabi.xinuos.com/elf/05-symtab.html Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/symbol-table-section.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_DynsymSectionEntry {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_DynsymSection>,
    pub _self: SharedType<Self>,
    ofs_name: RefCell<u32>,
    value_b32: RefCell<u32>,
    size_b32: RefCell<u32>,
    bind: RefCell<Elf_SymbolBinding>,
    type: RefCell<Elf_SymbolType>,
    other: RefCell<u8>,
    sh_idx: RefCell<u16>,
    value_b64: RefCell<u64>,
    size_b64: RefCell<u64>,
    _io: RefCell<BytesReader>,
    f_is_sh_idx_os: Cell<bool>,
    is_sh_idx_os: RefCell<bool>,
    f_is_sh_idx_proc: Cell<bool>,
    is_sh_idx_proc: RefCell<bool>,
    f_is_sh_idx_reserved: Cell<bool>,
    is_sh_idx_reserved: RefCell<bool>,
    f_name: Cell<bool>,
    name: RefCell<String>,
    f_sh_idx_special: Cell<bool>,
    sh_idx_special: RefCell<Elf_SectionHeaderIdxSpecial>,
    f_size: Cell<bool>,
    size: RefCell<u64>,
    f_value: Cell<bool>,
    value: RefCell<u64>,
    f_visibility: Cell<bool>,
    visibility: RefCell<Elf_SymbolVisibility>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_DynsymSectionEntry {
    type Root = Elf;
    type Parent = Elf_EndianElf_DynsymSection;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.ofs_name.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        if *_r.bits() == Elf_Bits::B32 {
            *self_rc.value_b32.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        }
        if *_r.bits() == Elf_Bits::B32 {
            *self_rc.size_b32.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        }
        *self_rc.bind.borrow_mut() = (_io.read_bits_int_be(4)? as i64).try_into()?;
        *self_rc.type.borrow_mut() = (_io.read_bits_int_be(4)? as i64).try_into()?;
        _io.align_to_byte()?;
        *self_rc.other.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sh_idx.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        if *_r.bits() == Elf_Bits::B64 {
            *self_rc.value_b64.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() };
        }
        if *_r.bits() == Elf_Bits::B64 {
            *self_rc.size_b64.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() };
        }
        Ok(())
    }
}
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn is_sh_idx_os(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_sh_idx_os.get() {
            return Ok(self.is_sh_idx_os.borrow());
        }
        self.f_is_sh_idx_os.set(true);
        *self.is_sh_idx_os.borrow_mut() = ( ((((*self.sh_idx() as i32) >= (*_r.sh_idx_lo_os()? as i32))) && (((*self.sh_idx() as i32) <= (*_r.sh_idx_hi_os()? as i32)))) ) as bool;
        Ok(self.is_sh_idx_os.borrow())
    }
    pub fn is_sh_idx_proc(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_sh_idx_proc.get() {
            return Ok(self.is_sh_idx_proc.borrow());
        }
        self.f_is_sh_idx_proc.set(true);
        *self.is_sh_idx_proc.borrow_mut() = ( ((((*self.sh_idx() as i32) >= (*_r.sh_idx_lo_proc()? as i32))) && (((*self.sh_idx() as i32) <= (*_r.sh_idx_hi_proc()? as i32)))) ) as bool;
        Ok(self.is_sh_idx_proc.borrow())
    }
    pub fn is_sh_idx_reserved(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_sh_idx_reserved.get() {
            return Ok(self.is_sh_idx_reserved.borrow());
        }
        self.f_is_sh_idx_reserved.set(true);
        *self.is_sh_idx_reserved.borrow_mut() = ( ((((*self.sh_idx() as i32) >= (*_r.sh_idx_lo_reserved()? as i32))) && (((*self.sh_idx() as i32) <= (*_r.sh_idx_hi_reserved()? as i32)))) ) as bool;
        Ok(self.is_sh_idx_reserved.borrow())
    }
    pub fn name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name.get() {
            return Ok(self.name.borrow());
        }
        self.f_name.set(true);
        if  ((((*self.ofs_name() as u32) != (0 as u32))) && (*_prc.as_ref().unwrap().is_string_table_linked()?))  {
            let io = Clone::clone(&*Into::<OptRc<Elf_EndianElf_StringsStruct>>::into(&*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().linked_section()?.body()?.as_ref().unwrap())._io());
            let _pos = io.pos();
            io.seek(*self.ofs_name() as usize)?;
            *self.name.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
            io.seek(_pos)?;
        }
        Ok(self.name.borrow())
    }
    pub fn sh_idx_special(
        &self
    ) -> KResult<Ref<'_, Elf_SectionHeaderIdxSpecial>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sh_idx_special.get() {
            return Ok(self.sh_idx_special.borrow());
        }
        self.f_sh_idx_special.set(true);
        *self.sh_idx_special.borrow_mut() = (*self.sh_idx() as i64).try_into()?;
        Ok(self.sh_idx_special.borrow())
    }
    pub fn size(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_size.get() {
            return Ok(self.size.borrow());
        }
        self.f_size.set(true);
        *self.size.borrow_mut() = (if *_r.bits() == Elf_Bits::B32 { *self.size_b32() } else { if *_r.bits() == Elf_Bits::B64 { *self.size_b64() } else { 0 } }) as u64;
        Ok(self.size.borrow())
    }
    pub fn value(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = (if *_r.bits() == Elf_Bits::B32 { *self.value_b32() } else { if *_r.bits() == Elf_Bits::B64 { *self.value_b64() } else { 0 } }) as u64;
        Ok(self.value.borrow())
    }

    /**
     * \sa https://github.com/xinuos/gabi/commit/acd5ebb2962cf243dca4983bc934442b42ef96f5 Source
     */
    pub fn visibility(
        &self
    ) -> KResult<Ref<'_, Elf_SymbolVisibility>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_visibility.get() {
            return Ok(self.visibility.borrow());
        }
        self.f_visibility.set(true);
        *self.visibility.borrow_mut() = (((*self.other() as u8) & (7 as u8)) as i64).try_into()?;
        Ok(self.visibility.borrow())
    }
}
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn ofs_name(&self) -> Ref<'_, u32> {
        self.ofs_name.borrow()
    }
}
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn value_b32(&self) -> Ref<'_, u32> {
        self.value_b32.borrow()
    }
}
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn size_b32(&self) -> Ref<'_, u32> {
        self.size_b32.borrow()
    }
}
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn bind(&self) -> Ref<'_, Elf_SymbolBinding> {
        self.bind.borrow()
    }
}
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn type(&self) -> Ref<'_, Elf_SymbolType> {
        self.type.borrow()
    }
}

/**
 * don't read this field, access `visibility` instead
 */
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn other(&self) -> Ref<'_, u8> {
        self.other.borrow()
    }
}

/**
 * section header index
 */
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn sh_idx(&self) -> Ref<'_, u16> {
        self.sh_idx.borrow()
    }
}
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn value_b64(&self) -> Ref<'_, u64> {
        self.value_b64.borrow()
    }
}
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn size_b64(&self) -> Ref<'_, u64> {
        self.size_b64.borrow()
    }
}
impl Elf_EndianElf_DynsymSectionEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_NoteSection {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Elf_EndianElf_NoteSectionEntry>>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_NoteSection {
    type Root = Elf;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let f = |t : &mut Elf_EndianElf_NoteSectionEntry| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Elf_EndianElf_NoteSectionEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Elf_EndianElf_NoteSection {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_NoteSection {
}
impl Elf_EndianElf_NoteSection {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Elf_EndianElf_NoteSectionEntry>>> {
        self.entries.borrow()
    }
}
impl Elf_EndianElf_NoteSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/note-section.html Source
 * \sa https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_NoteSectionEntry {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_NoteSection>,
    pub _self: SharedType<Self>,
    len_name: RefCell<u32>,
    len_descriptor: RefCell<u32>,
    type: RefCell<u32>,
    name: RefCell<Vec<u8>>,
    name_padding: RefCell<Vec<u8>>,
    descriptor: RefCell<Vec<u8>>,
    descriptor_padding: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_NoteSectionEntry {
    type Root = Elf;
    type Parent = Elf_EndianElf_NoteSection;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.len_name.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.len_descriptor.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.type.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.name.borrow_mut() = bytes_terminate(&_io.read_bytes(*self_rc.len_name() as usize)?.into(), 0, false).into();
        *self_rc.name_padding.borrow_mut() = _io.read_bytes(modulo(-(*self_rc.len_name()) as i64, 4 as i64) as usize)?.into();
        *self_rc.descriptor.borrow_mut() = _io.read_bytes(*self_rc.len_descriptor() as usize)?.into();
        *self_rc.descriptor_padding.borrow_mut() = _io.read_bytes(modulo(-(*self_rc.len_descriptor()) as i64, 4 as i64) as usize)?.into();
        Ok(())
    }
}
impl Elf_EndianElf_NoteSectionEntry {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_NoteSectionEntry {
}
impl Elf_EndianElf_NoteSectionEntry {
    pub fn len_name(&self) -> Ref<'_, u32> {
        self.len_name.borrow()
    }
}
impl Elf_EndianElf_NoteSectionEntry {
    pub fn len_descriptor(&self) -> Ref<'_, u32> {
        self.len_descriptor.borrow()
    }
}
impl Elf_EndianElf_NoteSectionEntry {
    pub fn type(&self) -> Ref<'_, u32> {
        self.type.borrow()
    }
}

/**
 * Although the ELF specification seems to hint that the `note_name` field
 * is ASCII this isn't the case for Linux binaries that have a
 * `.gnu.build.attributes` section.
 * \sa https://fedoraproject.org/wiki/Toolchain/Watermark#Proposed_Specification_for_non-loaded_notes Source
 */
impl Elf_EndianElf_NoteSectionEntry {
    pub fn name(&self) -> Ref<'_, Vec<u8>> {
        self.name.borrow()
    }
}
impl Elf_EndianElf_NoteSectionEntry {
    pub fn name_padding(&self) -> Ref<'_, Vec<u8>> {
        self.name_padding.borrow()
    }
}
impl Elf_EndianElf_NoteSectionEntry {
    pub fn descriptor(&self) -> Ref<'_, Vec<u8>> {
        self.descriptor.borrow()
    }
}
impl Elf_EndianElf_NoteSectionEntry {
    pub fn descriptor_padding(&self) -> Ref<'_, Vec<u8>> {
        self.descriptor_padding.borrow()
    }
}
impl Elf_EndianElf_NoteSectionEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Same type as `sh_dynamic_section`, but it does not use
 * `_parent.linked_section`, which is available only in section headers
 * (i.e. when `_parent` is of type `section_header`). This allows it to
 * be used in program headers (i.e. from the `program_header` type).
 * 
 * The inability to access `linked_section` means that offsets in the
 * string table (which should be stored in the `.dynstr` section) will
 * not be resolved to strings and will be provided only in raw form in
 * the `value_or_ptr` field. In other words, the
 * `ph_dynamic_section_entry` type has no `value_str` instance, unlike
 * the `sh_dynamic_section_entry` type.
 * 
 * There is another way to find the string table referenced by the
 * dynamic section entries that does not rely on `linked_section`, but is
 * a bit more complex (and is therefore considered out of scope of this
 * .ksy spec): the mandatory dynamic tag `dynamic_array_tags::strtab`
 * (`DT_STRTAB`) specifies the virtual address of the string table, and
 * `dynamic_array_tags::strsz` (`DT_STRSZ`) specifies its size in bytes.
 * The virtual address can be converted to a file offset by reading the
 * program headers - see the source code for the `readelf` command:
 * 
 * 1. [`offset_from_vma` call site with an address from `DT_STRTAB` as an
 *   argument](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13018)
 * 2. [`offset_from_vma` function
 *   definition](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L7788)
 * \sa https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_PhDynamicSection {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_ProgramHeader>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Elf_EndianElf_PhDynamicSectionEntry>>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_PhDynamicSection {
    type Root = Elf;
    type Parent = Elf_EndianElf_ProgramHeader;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let f = |t : &mut Elf_EndianElf_PhDynamicSectionEntry| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Elf_EndianElf_PhDynamicSectionEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                self_rc.entries.borrow_mut().push(t);
                let _t_entries = self_rc.entries.borrow();
                let _tmpa = _t_entries.last().unwrap();
                _i += 1;
                let x = !(*_tmpa.tag_enum()? == Elf_DynamicArrayTags::Null);
                x
            } {}
        }
        Ok(())
    }
}
impl Elf_EndianElf_PhDynamicSection {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_PhDynamicSection {
}
impl Elf_EndianElf_PhDynamicSection {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Elf_EndianElf_PhDynamicSectionEntry>>> {
        self.entries.borrow()
    }
}
impl Elf_EndianElf_PhDynamicSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Same type as `sh_dynamic_section_entry`, but without the `value_str`
 * instance - see the documentation for `ph_dynamic_section` for more
 * details.
 * \sa https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_PhDynamicSectionEntry {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_PhDynamicSection>,
    pub _self: SharedType<Self>,
    tag: RefCell<Option<Elf_EndianElf_PhDynamicSectionEntry_Tag>>,
    value_or_ptr: RefCell<Option<Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr>>,
    _io: RefCell<BytesReader>,
    f_flag_1_values: Cell<bool>,
    flag_1_values: RefCell<OptRc<Elf_DtFlag1Values>>,
    f_flag_values: Cell<bool>,
    flag_values: RefCell<OptRc<Elf_DtFlagValues>>,
    f_is_value_str: Cell<bool>,
    is_value_str: RefCell<bool>,
    f_tag_enum: Cell<bool>,
    tag_enum: RefCell<Elf_DynamicArrayTags>,
    _is_le: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Elf_EndianElf_PhDynamicSectionEntry_Tag {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_PhDynamicSectionEntry_Tag {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_PhDynamicSectionEntry_Tag> for u32 {
    fn from(e: &Elf_EndianElf_PhDynamicSectionEntry_Tag) -> Self {
        if let Elf_EndianElf_PhDynamicSectionEntry_Tag::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_PhDynamicSectionEntry_Tag::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_PhDynamicSectionEntry_Tag {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_PhDynamicSectionEntry_Tag> for u64 {
    fn from(e: &Elf_EndianElf_PhDynamicSectionEntry_Tag) -> Self {
        if let Elf_EndianElf_PhDynamicSectionEntry_Tag::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_PhDynamicSectionEntry_Tag::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_PhDynamicSectionEntry_Tag> for usize {
    fn from(e: &Elf_EndianElf_PhDynamicSectionEntry_Tag) -> Self {
        match e {
            Elf_EndianElf_PhDynamicSectionEntry_Tag::U4(v) => *v as usize,
            Elf_EndianElf_PhDynamicSectionEntry_Tag::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr> for u32 {
    fn from(e: &Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr) -> Self {
        if let Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr> for u64 {
    fn from(e: &Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr) -> Self {
        if let Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr> for usize {
    fn from(e: &Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr) -> Self {
        match e {
            Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr::U4(v) => *v as usize,
            Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr::U8(v) => *v as usize,
        }
    }
}

impl KStruct for Elf_EndianElf_PhDynamicSectionEntry {
    type Root = Elf;
    type Parent = Elf_EndianElf_PhDynamicSection;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.tag.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.tag.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.value_or_ptr.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.value_or_ptr.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        Ok(())
    }
}
impl Elf_EndianElf_PhDynamicSectionEntry {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_PhDynamicSectionEntry {
    pub fn flag_1_values(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_DtFlag1Values>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flag_1_values.get() {
            return Ok(self.flag_1_values.borrow());
        }
        if *self.tag_enum()? == Elf_DynamicArrayTags::Flags1 {
            let f = |t : &mut Elf_DtFlag1Values| Ok(t.set_params((self.value_or_ptr()).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Elf_DtFlag1Values>(&*_io, Some(self._root.clone()), None, &f)?.into();
            *self.flag_1_values.borrow_mut() = t;
        }
        Ok(self.flag_1_values.borrow())
    }
    pub fn flag_values(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_DtFlagValues>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flag_values.get() {
            return Ok(self.flag_values.borrow());
        }
        if *self.tag_enum()? == Elf_DynamicArrayTags::Flags {
            let f = |t : &mut Elf_DtFlagValues| Ok(t.set_params((self.value_or_ptr()).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Elf_DtFlagValues>(&*_io, Some(self._root.clone()), None, &f)?.into();
            *self.flag_values.borrow_mut() = t;
        }
        Ok(self.flag_values.borrow())
    }
    pub fn is_value_str(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_value_str.get() {
            return Ok(self.is_value_str.borrow());
        }
        self.f_is_value_str.set(true);
        *self.is_value_str.borrow_mut() = ( ((((self.value_or_ptr() as u64) != (0 as u64))) && ( ((*self.tag_enum()? == Elf_DynamicArrayTags::Needed) || (*self.tag_enum()? == Elf_DynamicArrayTags::Soname) || (*self.tag_enum()? == Elf_DynamicArrayTags::Rpath) || (*self.tag_enum()? == Elf_DynamicArrayTags::Runpath) || (*self.tag_enum()? == Elf_DynamicArrayTags::SunwAuxiliary) || (*self.tag_enum()? == Elf_DynamicArrayTags::SunwFilter) || (*self.tag_enum()? == Elf_DynamicArrayTags::Auxiliary) || (*self.tag_enum()? == Elf_DynamicArrayTags::Filter) || (*self.tag_enum()? == Elf_DynamicArrayTags::Config) || (*self.tag_enum()? == Elf_DynamicArrayTags::Depaudit) || (*self.tag_enum()? == Elf_DynamicArrayTags::Audit)) )) ) as bool;
        Ok(self.is_value_str.borrow())
    }
    pub fn tag_enum(
        &self
    ) -> KResult<Ref<'_, Elf_DynamicArrayTags>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tag_enum.get() {
            return Ok(self.tag_enum.borrow());
        }
        self.f_tag_enum.set(true);
        *self.tag_enum.borrow_mut() = (self.tag() as i64).try_into()?;
        Ok(self.tag_enum.borrow())
    }
}
impl Elf_EndianElf_PhDynamicSectionEntry {
    pub fn tag(&self) -> usize {
        self.tag.borrow().as_ref().unwrap().into()
    }
    pub fn tag_enum(&self) -> Ref<'_, Option<Elf_EndianElf_PhDynamicSectionEntry_Tag>> {
        self.tag.borrow()
    }
}
impl Elf_EndianElf_PhDynamicSectionEntry {
    pub fn value_or_ptr(&self) -> usize {
        self.value_or_ptr.borrow().as_ref().unwrap().into()
    }
    pub fn value_or_ptr_enum(&self) -> Ref<'_, Option<Elf_EndianElf_PhDynamicSectionEntry_ValueOrPtr>> {
        self.value_or_ptr.borrow()
    }
}
impl Elf_EndianElf_PhDynamicSectionEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://gabi.xinuos.com/v42/elf/07-pheader.html#program-header-entry Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-header.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_ProgramHeader {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf>,
    pub _self: SharedType<Self>,
    type: RefCell<Elf_PhType>,
    flags64: RefCell<u32>,
    ofs_body: RefCell<Option<Elf_EndianElf_ProgramHeader_OfsBody>>,
    virt_addr: RefCell<Option<Elf_EndianElf_ProgramHeader_VirtAddr>>,
    phys_addr: RefCell<Option<Elf_EndianElf_ProgramHeader_PhysAddr>>,
    len_body: RefCell<Option<Elf_EndianElf_ProgramHeader_LenBody>>,
    memory_size: RefCell<Option<Elf_EndianElf_ProgramHeader_MemorySize>>,
    flags32: RefCell<u32>,
    align: RefCell<Option<Elf_EndianElf_ProgramHeader_Align>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_body: Cell<bool>,
    body: RefCell<Option<Elf_EndianElf_ProgramHeader_Body>>,
    f_flags_obj: Cell<bool>,
    flags_obj: RefCell<Option<Elf_EndianElf_ProgramHeader_FlagsObj>>,
    _is_le: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Elf_EndianElf_ProgramHeader_OfsBody {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_ProgramHeader_OfsBody {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_OfsBody> for u32 {
    fn from(e: &Elf_EndianElf_ProgramHeader_OfsBody) -> Self {
        if let Elf_EndianElf_ProgramHeader_OfsBody::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_OfsBody::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_ProgramHeader_OfsBody {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_OfsBody> for u64 {
    fn from(e: &Elf_EndianElf_ProgramHeader_OfsBody) -> Self {
        if let Elf_EndianElf_ProgramHeader_OfsBody::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_OfsBody::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_OfsBody> for usize {
    fn from(e: &Elf_EndianElf_ProgramHeader_OfsBody) -> Self {
        match e {
            Elf_EndianElf_ProgramHeader_OfsBody::U4(v) => *v as usize,
            Elf_EndianElf_ProgramHeader_OfsBody::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_ProgramHeader_VirtAddr {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_ProgramHeader_VirtAddr {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_VirtAddr> for u32 {
    fn from(e: &Elf_EndianElf_ProgramHeader_VirtAddr) -> Self {
        if let Elf_EndianElf_ProgramHeader_VirtAddr::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_VirtAddr::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_ProgramHeader_VirtAddr {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_VirtAddr> for u64 {
    fn from(e: &Elf_EndianElf_ProgramHeader_VirtAddr) -> Self {
        if let Elf_EndianElf_ProgramHeader_VirtAddr::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_VirtAddr::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_VirtAddr> for usize {
    fn from(e: &Elf_EndianElf_ProgramHeader_VirtAddr) -> Self {
        match e {
            Elf_EndianElf_ProgramHeader_VirtAddr::U4(v) => *v as usize,
            Elf_EndianElf_ProgramHeader_VirtAddr::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_ProgramHeader_PhysAddr {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_ProgramHeader_PhysAddr {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_PhysAddr> for u32 {
    fn from(e: &Elf_EndianElf_ProgramHeader_PhysAddr) -> Self {
        if let Elf_EndianElf_ProgramHeader_PhysAddr::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_PhysAddr::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_ProgramHeader_PhysAddr {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_PhysAddr> for u64 {
    fn from(e: &Elf_EndianElf_ProgramHeader_PhysAddr) -> Self {
        if let Elf_EndianElf_ProgramHeader_PhysAddr::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_PhysAddr::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_PhysAddr> for usize {
    fn from(e: &Elf_EndianElf_ProgramHeader_PhysAddr) -> Self {
        match e {
            Elf_EndianElf_ProgramHeader_PhysAddr::U4(v) => *v as usize,
            Elf_EndianElf_ProgramHeader_PhysAddr::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_ProgramHeader_LenBody {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_ProgramHeader_LenBody {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_LenBody> for u32 {
    fn from(e: &Elf_EndianElf_ProgramHeader_LenBody) -> Self {
        if let Elf_EndianElf_ProgramHeader_LenBody::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_LenBody::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_ProgramHeader_LenBody {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_LenBody> for u64 {
    fn from(e: &Elf_EndianElf_ProgramHeader_LenBody) -> Self {
        if let Elf_EndianElf_ProgramHeader_LenBody::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_LenBody::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_LenBody> for usize {
    fn from(e: &Elf_EndianElf_ProgramHeader_LenBody) -> Self {
        match e {
            Elf_EndianElf_ProgramHeader_LenBody::U4(v) => *v as usize,
            Elf_EndianElf_ProgramHeader_LenBody::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_ProgramHeader_MemorySize {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_ProgramHeader_MemorySize {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_MemorySize> for u32 {
    fn from(e: &Elf_EndianElf_ProgramHeader_MemorySize) -> Self {
        if let Elf_EndianElf_ProgramHeader_MemorySize::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_MemorySize::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_ProgramHeader_MemorySize {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_MemorySize> for u64 {
    fn from(e: &Elf_EndianElf_ProgramHeader_MemorySize) -> Self {
        if let Elf_EndianElf_ProgramHeader_MemorySize::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_MemorySize::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_MemorySize> for usize {
    fn from(e: &Elf_EndianElf_ProgramHeader_MemorySize) -> Self {
        match e {
            Elf_EndianElf_ProgramHeader_MemorySize::U4(v) => *v as usize,
            Elf_EndianElf_ProgramHeader_MemorySize::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_ProgramHeader_Align {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_ProgramHeader_Align {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_Align> for u32 {
    fn from(e: &Elf_EndianElf_ProgramHeader_Align) -> Self {
        if let Elf_EndianElf_ProgramHeader_Align::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_Align::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_ProgramHeader_Align {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_Align> for u64 {
    fn from(e: &Elf_EndianElf_ProgramHeader_Align) -> Self {
        if let Elf_EndianElf_ProgramHeader_Align::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ProgramHeader_Align::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_Align> for usize {
    fn from(e: &Elf_EndianElf_ProgramHeader_Align) -> Self {
        match e {
            Elf_EndianElf_ProgramHeader_Align::U4(v) => *v as usize,
            Elf_EndianElf_ProgramHeader_Align::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_ProgramHeader_Body {
    Elf_EndianElf_PhDynamicSection(OptRc<Elf_EndianElf_PhDynamicSection>),
    Elf_EndianElf_ProgramHeader_PhInterpreter(OptRc<Elf_EndianElf_ProgramHeader_PhInterpreter>),
    Elf_EndianElf_NoteSection(OptRc<Elf_EndianElf_NoteSection>),
    Bytes(Vec<u8>),
}
impl From<&Elf_EndianElf_ProgramHeader_Body> for OptRc<Elf_EndianElf_PhDynamicSection> {
    fn from(v: &Elf_EndianElf_ProgramHeader_Body) -> Self {
        if let Elf_EndianElf_ProgramHeader_Body::Elf_EndianElf_PhDynamicSection(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_ProgramHeader_Body::Elf_EndianElf_PhDynamicSection, got {:?}", v)
    }
}
impl From<OptRc<Elf_EndianElf_PhDynamicSection>> for Elf_EndianElf_ProgramHeader_Body {
    fn from(v: OptRc<Elf_EndianElf_PhDynamicSection>) -> Self {
        Self::Elf_EndianElf_PhDynamicSection(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_Body> for OptRc<Elf_EndianElf_ProgramHeader_PhInterpreter> {
    fn from(v: &Elf_EndianElf_ProgramHeader_Body) -> Self {
        if let Elf_EndianElf_ProgramHeader_Body::Elf_EndianElf_ProgramHeader_PhInterpreter(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_ProgramHeader_Body::Elf_EndianElf_ProgramHeader_PhInterpreter, got {:?}", v)
    }
}
impl From<OptRc<Elf_EndianElf_ProgramHeader_PhInterpreter>> for Elf_EndianElf_ProgramHeader_Body {
    fn from(v: OptRc<Elf_EndianElf_ProgramHeader_PhInterpreter>) -> Self {
        Self::Elf_EndianElf_ProgramHeader_PhInterpreter(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_Body> for OptRc<Elf_EndianElf_NoteSection> {
    fn from(v: &Elf_EndianElf_ProgramHeader_Body) -> Self {
        if let Elf_EndianElf_ProgramHeader_Body::Elf_EndianElf_NoteSection(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_ProgramHeader_Body::Elf_EndianElf_NoteSection, got {:?}", v)
    }
}
impl From<OptRc<Elf_EndianElf_NoteSection>> for Elf_EndianElf_ProgramHeader_Body {
    fn from(v: OptRc<Elf_EndianElf_NoteSection>) -> Self {
        Self::Elf_EndianElf_NoteSection(v)
    }
}
impl From<&Elf_EndianElf_ProgramHeader_Body> for Vec<u8> {
    fn from(v: &Elf_EndianElf_ProgramHeader_Body) -> Self {
        if let Elf_EndianElf_ProgramHeader_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_ProgramHeader_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Elf_EndianElf_ProgramHeader_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
#[derive(Debug, Clone)]
pub enum Elf_EndianElf_ProgramHeader_FlagsObj {
    Elf_PhdrTypeFlags(OptRc<Elf_PhdrTypeFlags>),
}
impl From<&Elf_EndianElf_ProgramHeader_FlagsObj> for OptRc<Elf_PhdrTypeFlags> {
    fn from(v: &Elf_EndianElf_ProgramHeader_FlagsObj) -> Self {
        if let Elf_EndianElf_ProgramHeader_FlagsObj::Elf_PhdrTypeFlags(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_ProgramHeader_FlagsObj::Elf_PhdrTypeFlags, got {:?}", v)
    }
}
impl From<OptRc<Elf_PhdrTypeFlags>> for Elf_EndianElf_ProgramHeader_FlagsObj {
    fn from(v: OptRc<Elf_PhdrTypeFlags>) -> Self {
        Self::Elf_PhdrTypeFlags(v)
    }
}
impl KStruct for Elf_EndianElf_ProgramHeader {
    type Root = Elf;
    type Parent = Elf_EndianElf;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.type.borrow_mut() = (_io.read_u4()? as i64).try_into()?;
        if *_r.bits() == Elf_Bits::B64 {
            *self_rc.flags64.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.ofs_body.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.ofs_body.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.virt_addr.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.virt_addr.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.phys_addr.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.phys_addr.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.len_body.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.len_body.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.memory_size.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.memory_size.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        if *_r.bits() == Elf_Bits::B32 {
            *self_rc.flags32.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.align.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.align.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        Ok(())
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_ProgramHeader {

    /**
     * Note: a program header may not have a valid body in the same ELF
     * file, so accessing `body` may result in reading garbage or
     * triggering EOF errors.
     * 
     * In particular, `*.debug` files produced by elfutils'
     * `eu-strip --strip-debug` (as used by Fedora/RHEL and other
     * RPM-based distros for their `*-debuginfo` packages, e.g.
     * `glibc-debuginfo`) copy the original binary's program header table
     * verbatim, including `ofs_body`/`len_body` (i.e.
     * `p_offset`/`p_filesz`), while dropping the actual contents of most
     * segments. Such segments can be recognized by the fact that the
     * corresponding section headers have type `sh_type::nobits`
     * (`SHT_NOBITS`). However, this Kaitai Struct implementation doesn't
     * know the mapping between program headers and section headers, so
     * this must be handled externally.
     * 
     * `*.debug` files from Debian/Ubuntu `*-dbg` packages (e.g.
     * `libc6-dbg`) are usually not affected by this issue, because they
     * are produced using GNU Binutils (`objcopy --only-keep-debug`),
     * which zeroes `len_body` for segments whose contents were omitted
     * (which reliably tells us that there is no `body`).
     */
    pub fn body(
        &self
    ) -> KResult<Ref<'_, Option<Elf_EndianElf_ProgramHeader_Body>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        self.f_body.set(true);
        if ((self.len_body() as u64) != (0 as u64)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(self.ofs_body() as usize)?;
            match *self.type() {
                Elf_PhType::Dynamic => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_PhDynamicSection| Ok(t.set_endian(*self._is_le.borrow()));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_PhDynamicSection>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                Elf_PhType::Interp => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_ProgramHeader_PhInterpreter| Ok(t.set_endian(*self._is_le.borrow()));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_ProgramHeader_PhInterpreter>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                Elf_PhType::Note => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_NoteSection| Ok(t.set_endian(*self._is_le.borrow()));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_NoteSection>(&_t_body_raw_io, Some(self._root.clone()), None, &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                _ => {
                    *self.body.borrow_mut() = Some(io.read_bytes(self.len_body() as usize)?.into());
                }
            }
            io.seek(_pos)?;
        }
        Ok(self.body.borrow())
    }
    pub fn flags_obj(
        &self
    ) -> KResult<Ref<'_, Option<Elf_EndianElf_ProgramHeader_FlagsObj>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flags_obj.get() {
            return Ok(self.flags_obj.borrow());
        }
        self.f_flags_obj.set(true);
        match *_r.bits() {
            Elf_Bits::B32 => {
                let f = |t : &mut Elf_PhdrTypeFlags| Ok(t.set_params((*self.flags32()).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Elf_PhdrTypeFlags>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.flags_obj.borrow_mut() = Some(t);
            }
            Elf_Bits::B64 => {
                let f = |t : &mut Elf_PhdrTypeFlags| Ok(t.set_params((*self.flags64()).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Elf_PhdrTypeFlags>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.flags_obj.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(self.flags_obj.borrow())
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn type(&self) -> Ref<'_, Elf_PhType> {
        self.type.borrow()
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn flags64(&self) -> Ref<'_, u32> {
        self.flags64.borrow()
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn ofs_body(&self) -> usize {
        self.ofs_body.borrow().as_ref().unwrap().into()
    }
    pub fn ofs_body_enum(&self) -> Ref<'_, Option<Elf_EndianElf_ProgramHeader_OfsBody>> {
        self.ofs_body.borrow()
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn virt_addr(&self) -> usize {
        self.virt_addr.borrow().as_ref().unwrap().into()
    }
    pub fn virt_addr_enum(&self) -> Ref<'_, Option<Elf_EndianElf_ProgramHeader_VirtAddr>> {
        self.virt_addr.borrow()
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn phys_addr(&self) -> usize {
        self.phys_addr.borrow().as_ref().unwrap().into()
    }
    pub fn phys_addr_enum(&self) -> Ref<'_, Option<Elf_EndianElf_ProgramHeader_PhysAddr>> {
        self.phys_addr.borrow()
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn len_body(&self) -> usize {
        self.len_body.borrow().as_ref().unwrap().into()
    }
    pub fn len_body_enum(&self) -> Ref<'_, Option<Elf_EndianElf_ProgramHeader_LenBody>> {
        self.len_body.borrow()
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn memory_size(&self) -> usize {
        self.memory_size.borrow().as_ref().unwrap().into()
    }
    pub fn memory_size_enum(&self) -> Ref<'_, Option<Elf_EndianElf_ProgramHeader_MemorySize>> {
        self.memory_size.borrow()
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn flags32(&self) -> Ref<'_, u32> {
        self.flags32.borrow()
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn align(&self) -> usize {
        self.align.borrow().as_ref().unwrap().into()
    }
    pub fn align_enum(&self) -> Ref<'_, Option<Elf_EndianElf_ProgramHeader_Align>> {
        self.align.borrow()
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Elf_EndianElf_ProgramHeader {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

/**
 * \sa https://gabi.xinuos.com/v42/elf/08-dynamic.html#program-interpreter Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-interpreter.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_ProgramHeader_PhInterpreter {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_ProgramHeader>,
    pub _self: SharedType<Self>,
    path_name: RefCell<String>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_ProgramHeader_PhInterpreter {
    type Root = Elf;
    type Parent = Elf_EndianElf_ProgramHeader;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.path_name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl Elf_EndianElf_ProgramHeader_PhInterpreter {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_ProgramHeader_PhInterpreter {
}
impl Elf_EndianElf_ProgramHeader_PhInterpreter {
    pub fn path_name(&self) -> Ref<'_, String> {
        self.path_name.borrow()
    }
}
impl Elf_EndianElf_ProgramHeader_PhInterpreter {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/relocation-sections.html Source
 * \sa https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.reloc.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_RelocationSection {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_SectionHeader>,
    pub _self: SharedType<Self>,
    has_addend: RefCell<bool>,
    entries: RefCell<Vec<OptRc<Elf_EndianElf_RelocationSectionEntry>>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_RelocationSection {
    type Root = Elf;
    type Parent = Elf_EndianElf_SectionHeader;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let f = |t : &mut Elf_EndianElf_RelocationSectionEntry| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Elf_EndianElf_RelocationSectionEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Elf_EndianElf_RelocationSection {
    pub fn has_addend(&self) -> Ref<'_, bool> {
        self.has_addend.borrow()
    }
}
impl Elf_EndianElf_RelocationSection {
    pub fn set_params(&mut self, has_addend: bool) {
        *self.has_addend.borrow_mut() = has_addend;
    }
}
impl Elf_EndianElf_RelocationSection {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_RelocationSection {
}
impl Elf_EndianElf_RelocationSection {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Elf_EndianElf_RelocationSectionEntry>>> {
        self.entries.borrow()
    }
}
impl Elf_EndianElf_RelocationSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_RelocationSectionEntry {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_RelocationSection>,
    pub _self: SharedType<Self>,
    offset: RefCell<Option<Elf_EndianElf_RelocationSectionEntry_Offset>>,
    info: RefCell<Option<Elf_EndianElf_RelocationSectionEntry_Info>>,
    addend: RefCell<Option<Elf_EndianElf_RelocationSectionEntry_Addend>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Elf_EndianElf_RelocationSectionEntry_Offset {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_RelocationSectionEntry_Offset {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_RelocationSectionEntry_Offset> for u32 {
    fn from(e: &Elf_EndianElf_RelocationSectionEntry_Offset) -> Self {
        if let Elf_EndianElf_RelocationSectionEntry_Offset::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_RelocationSectionEntry_Offset::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_RelocationSectionEntry_Offset {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_RelocationSectionEntry_Offset> for u64 {
    fn from(e: &Elf_EndianElf_RelocationSectionEntry_Offset) -> Self {
        if let Elf_EndianElf_RelocationSectionEntry_Offset::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_RelocationSectionEntry_Offset::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_RelocationSectionEntry_Offset> for usize {
    fn from(e: &Elf_EndianElf_RelocationSectionEntry_Offset) -> Self {
        match e {
            Elf_EndianElf_RelocationSectionEntry_Offset::U4(v) => *v as usize,
            Elf_EndianElf_RelocationSectionEntry_Offset::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_RelocationSectionEntry_Info {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_RelocationSectionEntry_Info {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_RelocationSectionEntry_Info> for u32 {
    fn from(e: &Elf_EndianElf_RelocationSectionEntry_Info) -> Self {
        if let Elf_EndianElf_RelocationSectionEntry_Info::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_RelocationSectionEntry_Info::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_RelocationSectionEntry_Info {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_RelocationSectionEntry_Info> for u64 {
    fn from(e: &Elf_EndianElf_RelocationSectionEntry_Info) -> Self {
        if let Elf_EndianElf_RelocationSectionEntry_Info::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_RelocationSectionEntry_Info::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_RelocationSectionEntry_Info> for usize {
    fn from(e: &Elf_EndianElf_RelocationSectionEntry_Info) -> Self {
        match e {
            Elf_EndianElf_RelocationSectionEntry_Info::U4(v) => *v as usize,
            Elf_EndianElf_RelocationSectionEntry_Info::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_RelocationSectionEntry_Addend {
    S4(i32),
    S8(i64),
}
impl From<i32> for Elf_EndianElf_RelocationSectionEntry_Addend {
    fn from(v: i32) -> Self {
        Self::S4(v)
    }
}
impl From<&Elf_EndianElf_RelocationSectionEntry_Addend> for i32 {
    fn from(e: &Elf_EndianElf_RelocationSectionEntry_Addend) -> Self {
        if let Elf_EndianElf_RelocationSectionEntry_Addend::S4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_RelocationSectionEntry_Addend::S4 to i32, enum value {:?}", e)
    }
}
impl From<i64> for Elf_EndianElf_RelocationSectionEntry_Addend {
    fn from(v: i64) -> Self {
        Self::S8(v)
    }
}
impl From<&Elf_EndianElf_RelocationSectionEntry_Addend> for i64 {
    fn from(e: &Elf_EndianElf_RelocationSectionEntry_Addend) -> Self {
        if let Elf_EndianElf_RelocationSectionEntry_Addend::S8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_RelocationSectionEntry_Addend::S8 to i64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_RelocationSectionEntry_Addend> for usize {
    fn from(e: &Elf_EndianElf_RelocationSectionEntry_Addend) -> Self {
        match e {
            Elf_EndianElf_RelocationSectionEntry_Addend::S4(v) => *v as usize,
            Elf_EndianElf_RelocationSectionEntry_Addend::S8(v) => *v as usize,
        }
    }
}

impl KStruct for Elf_EndianElf_RelocationSectionEntry {
    type Root = Elf;
    type Parent = Elf_EndianElf_RelocationSection;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.offset.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.offset.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.info.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.info.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        if *_prc.as_ref().unwrap().has_addend() {
            match *_r.bits() {
                Elf_Bits::B32 => {
                    *self_rc.addend.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_s4le()?.into() } else { _io.read_s4be()?.into() });
                }
                Elf_Bits::B64 => {
                    *self_rc.addend.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_s8le()?.into() } else { _io.read_s8be()?.into() });
                }
                _ => {}
            }
        }
        Ok(())
    }
}
impl Elf_EndianElf_RelocationSectionEntry {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_RelocationSectionEntry {
}
impl Elf_EndianElf_RelocationSectionEntry {
    pub fn offset(&self) -> usize {
        self.offset.borrow().as_ref().unwrap().into()
    }
    pub fn offset_enum(&self) -> Ref<'_, Option<Elf_EndianElf_RelocationSectionEntry_Offset>> {
        self.offset.borrow()
    }
}
impl Elf_EndianElf_RelocationSectionEntry {
    pub fn info(&self) -> usize {
        self.info.borrow().as_ref().unwrap().into()
    }
    pub fn info_enum(&self) -> Ref<'_, Option<Elf_EndianElf_RelocationSectionEntry_Info>> {
        self.info.borrow()
    }
}
impl Elf_EndianElf_RelocationSectionEntry {
    pub fn addend(&self) -> usize {
        self.addend.borrow().as_ref().unwrap().into()
    }
    pub fn addend_enum(&self) -> Ref<'_, Option<Elf_EndianElf_RelocationSectionEntry_Addend>> {
        self.addend.borrow()
    }
}
impl Elf_EndianElf_RelocationSectionEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://gabi.xinuos.com/v42/elf/03-sheader.html#section-header-table-entry Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_SectionHeader {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf>,
    pub _self: SharedType<Self>,
    ofs_name: RefCell<u32>,
    type: RefCell<Elf_ShType>,
    flags: RefCell<Option<Elf_EndianElf_SectionHeader_Flags>>,
    addr: RefCell<Option<Elf_EndianElf_SectionHeader_Addr>>,
    ofs_body: RefCell<Option<Elf_EndianElf_SectionHeader_OfsBody>>,
    len_body: RefCell<Option<Elf_EndianElf_SectionHeader_LenBody>>,
    linked_section_idx: RefCell<u32>,
    info: RefCell<u32>,
    align: RefCell<Option<Elf_EndianElf_SectionHeader_Align>>,
    entry_size: RefCell<Option<Elf_EndianElf_SectionHeader_EntrySize>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_body: Cell<bool>,
    body: RefCell<Option<Elf_EndianElf_SectionHeader_Body>>,
    f_flags_obj: Cell<bool>,
    flags_obj: RefCell<OptRc<Elf_SectionHeaderFlags>>,
    f_linked_section: Cell<bool>,
    linked_section: RefCell<OptRc<Elf_EndianElf_SectionHeader>>,
    f_name: Cell<bool>,
    name: RefCell<String>,
    _is_le: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Elf_EndianElf_SectionHeader_Flags {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_SectionHeader_Flags {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Flags> for u32 {
    fn from(e: &Elf_EndianElf_SectionHeader_Flags) -> Self {
        if let Elf_EndianElf_SectionHeader_Flags::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_Flags::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_SectionHeader_Flags {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Flags> for u64 {
    fn from(e: &Elf_EndianElf_SectionHeader_Flags) -> Self {
        if let Elf_EndianElf_SectionHeader_Flags::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_Flags::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Flags> for usize {
    fn from(e: &Elf_EndianElf_SectionHeader_Flags) -> Self {
        match e {
            Elf_EndianElf_SectionHeader_Flags::U4(v) => *v as usize,
            Elf_EndianElf_SectionHeader_Flags::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_SectionHeader_Addr {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_SectionHeader_Addr {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Addr> for u32 {
    fn from(e: &Elf_EndianElf_SectionHeader_Addr) -> Self {
        if let Elf_EndianElf_SectionHeader_Addr::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_Addr::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_SectionHeader_Addr {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Addr> for u64 {
    fn from(e: &Elf_EndianElf_SectionHeader_Addr) -> Self {
        if let Elf_EndianElf_SectionHeader_Addr::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_Addr::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Addr> for usize {
    fn from(e: &Elf_EndianElf_SectionHeader_Addr) -> Self {
        match e {
            Elf_EndianElf_SectionHeader_Addr::U4(v) => *v as usize,
            Elf_EndianElf_SectionHeader_Addr::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_SectionHeader_OfsBody {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_SectionHeader_OfsBody {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_OfsBody> for u32 {
    fn from(e: &Elf_EndianElf_SectionHeader_OfsBody) -> Self {
        if let Elf_EndianElf_SectionHeader_OfsBody::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_OfsBody::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_SectionHeader_OfsBody {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_OfsBody> for u64 {
    fn from(e: &Elf_EndianElf_SectionHeader_OfsBody) -> Self {
        if let Elf_EndianElf_SectionHeader_OfsBody::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_OfsBody::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_SectionHeader_OfsBody> for usize {
    fn from(e: &Elf_EndianElf_SectionHeader_OfsBody) -> Self {
        match e {
            Elf_EndianElf_SectionHeader_OfsBody::U4(v) => *v as usize,
            Elf_EndianElf_SectionHeader_OfsBody::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_SectionHeader_LenBody {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_SectionHeader_LenBody {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_LenBody> for u32 {
    fn from(e: &Elf_EndianElf_SectionHeader_LenBody) -> Self {
        if let Elf_EndianElf_SectionHeader_LenBody::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_LenBody::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_SectionHeader_LenBody {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_LenBody> for u64 {
    fn from(e: &Elf_EndianElf_SectionHeader_LenBody) -> Self {
        if let Elf_EndianElf_SectionHeader_LenBody::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_LenBody::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_SectionHeader_LenBody> for usize {
    fn from(e: &Elf_EndianElf_SectionHeader_LenBody) -> Self {
        match e {
            Elf_EndianElf_SectionHeader_LenBody::U4(v) => *v as usize,
            Elf_EndianElf_SectionHeader_LenBody::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_SectionHeader_Align {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_SectionHeader_Align {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Align> for u32 {
    fn from(e: &Elf_EndianElf_SectionHeader_Align) -> Self {
        if let Elf_EndianElf_SectionHeader_Align::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_Align::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_SectionHeader_Align {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Align> for u64 {
    fn from(e: &Elf_EndianElf_SectionHeader_Align) -> Self {
        if let Elf_EndianElf_SectionHeader_Align::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_Align::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Align> for usize {
    fn from(e: &Elf_EndianElf_SectionHeader_Align) -> Self {
        match e {
            Elf_EndianElf_SectionHeader_Align::U4(v) => *v as usize,
            Elf_EndianElf_SectionHeader_Align::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_SectionHeader_EntrySize {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_SectionHeader_EntrySize {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_EntrySize> for u32 {
    fn from(e: &Elf_EndianElf_SectionHeader_EntrySize) -> Self {
        if let Elf_EndianElf_SectionHeader_EntrySize::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_EntrySize::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_SectionHeader_EntrySize {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_EntrySize> for u64 {
    fn from(e: &Elf_EndianElf_SectionHeader_EntrySize) -> Self {
        if let Elf_EndianElf_SectionHeader_EntrySize::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_SectionHeader_EntrySize::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_SectionHeader_EntrySize> for usize {
    fn from(e: &Elf_EndianElf_SectionHeader_EntrySize) -> Self {
        match e {
            Elf_EndianElf_SectionHeader_EntrySize::U4(v) => *v as usize,
            Elf_EndianElf_SectionHeader_EntrySize::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_SectionHeader_Body {
    Elf_EndianElf_DynsymSection(OptRc<Elf_EndianElf_DynsymSection>),
    Elf_EndianElf_VerneedSection(OptRc<Elf_EndianElf_VerneedSection>),
    Elf_EndianElf_NoteSection(OptRc<Elf_EndianElf_NoteSection>),
    Bytes(Vec<u8>),
    Elf_EndianElf_StringsStruct(OptRc<Elf_EndianElf_StringsStruct>),
    Elf_EndianElf_VerdefSection(OptRc<Elf_EndianElf_VerdefSection>),
    Elf_EndianElf_RelocationSection(OptRc<Elf_EndianElf_RelocationSection>),
    Elf_EndianElf_ShDynamicSection(OptRc<Elf_EndianElf_ShDynamicSection>),
    Elf_EndianElf_VersymSection(OptRc<Elf_EndianElf_VersymSection>),
}
impl From<&Elf_EndianElf_SectionHeader_Body> for OptRc<Elf_EndianElf_DynsymSection> {
    fn from(v: &Elf_EndianElf_SectionHeader_Body) -> Self {
        if let Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_DynsymSection(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_DynsymSection, got {:?}", v)
    }
}
impl From<OptRc<Elf_EndianElf_DynsymSection>> for Elf_EndianElf_SectionHeader_Body {
    fn from(v: OptRc<Elf_EndianElf_DynsymSection>) -> Self {
        Self::Elf_EndianElf_DynsymSection(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Body> for OptRc<Elf_EndianElf_VerneedSection> {
    fn from(v: &Elf_EndianElf_SectionHeader_Body) -> Self {
        if let Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_VerneedSection(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_VerneedSection, got {:?}", v)
    }
}
impl From<OptRc<Elf_EndianElf_VerneedSection>> for Elf_EndianElf_SectionHeader_Body {
    fn from(v: OptRc<Elf_EndianElf_VerneedSection>) -> Self {
        Self::Elf_EndianElf_VerneedSection(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Body> for OptRc<Elf_EndianElf_NoteSection> {
    fn from(v: &Elf_EndianElf_SectionHeader_Body) -> Self {
        if let Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_NoteSection(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_NoteSection, got {:?}", v)
    }
}
impl From<OptRc<Elf_EndianElf_NoteSection>> for Elf_EndianElf_SectionHeader_Body {
    fn from(v: OptRc<Elf_EndianElf_NoteSection>) -> Self {
        Self::Elf_EndianElf_NoteSection(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Body> for Vec<u8> {
    fn from(v: &Elf_EndianElf_SectionHeader_Body) -> Self {
        if let Elf_EndianElf_SectionHeader_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_SectionHeader_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Elf_EndianElf_SectionHeader_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Body> for OptRc<Elf_EndianElf_StringsStruct> {
    fn from(v: &Elf_EndianElf_SectionHeader_Body) -> Self {
        if let Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_StringsStruct(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_StringsStruct, got {:?}", v)
    }
}
impl From<OptRc<Elf_EndianElf_StringsStruct>> for Elf_EndianElf_SectionHeader_Body {
    fn from(v: OptRc<Elf_EndianElf_StringsStruct>) -> Self {
        Self::Elf_EndianElf_StringsStruct(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Body> for OptRc<Elf_EndianElf_VerdefSection> {
    fn from(v: &Elf_EndianElf_SectionHeader_Body) -> Self {
        if let Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_VerdefSection(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_VerdefSection, got {:?}", v)
    }
}
impl From<OptRc<Elf_EndianElf_VerdefSection>> for Elf_EndianElf_SectionHeader_Body {
    fn from(v: OptRc<Elf_EndianElf_VerdefSection>) -> Self {
        Self::Elf_EndianElf_VerdefSection(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Body> for OptRc<Elf_EndianElf_RelocationSection> {
    fn from(v: &Elf_EndianElf_SectionHeader_Body) -> Self {
        if let Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_RelocationSection(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_RelocationSection, got {:?}", v)
    }
}
impl From<OptRc<Elf_EndianElf_RelocationSection>> for Elf_EndianElf_SectionHeader_Body {
    fn from(v: OptRc<Elf_EndianElf_RelocationSection>) -> Self {
        Self::Elf_EndianElf_RelocationSection(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Body> for OptRc<Elf_EndianElf_ShDynamicSection> {
    fn from(v: &Elf_EndianElf_SectionHeader_Body) -> Self {
        if let Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_ShDynamicSection(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_ShDynamicSection, got {:?}", v)
    }
}
impl From<OptRc<Elf_EndianElf_ShDynamicSection>> for Elf_EndianElf_SectionHeader_Body {
    fn from(v: OptRc<Elf_EndianElf_ShDynamicSection>) -> Self {
        Self::Elf_EndianElf_ShDynamicSection(v)
    }
}
impl From<&Elf_EndianElf_SectionHeader_Body> for OptRc<Elf_EndianElf_VersymSection> {
    fn from(v: &Elf_EndianElf_SectionHeader_Body) -> Self {
        if let Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_VersymSection(x) = v {
            return x.clone();
        }
        panic!("expected Elf_EndianElf_SectionHeader_Body::Elf_EndianElf_VersymSection, got {:?}", v)
    }
}
impl From<OptRc<Elf_EndianElf_VersymSection>> for Elf_EndianElf_SectionHeader_Body {
    fn from(v: OptRc<Elf_EndianElf_VersymSection>) -> Self {
        Self::Elf_EndianElf_VersymSection(v)
    }
}
impl KStruct for Elf_EndianElf_SectionHeader {
    type Root = Elf;
    type Parent = Elf_EndianElf;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.ofs_name.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.type.borrow_mut() = (_io.read_u4()? as i64).try_into()?;
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.flags.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.flags.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.addr.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.addr.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.ofs_body.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.ofs_body.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.len_body.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.len_body.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        *self_rc.linked_section_idx.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.info.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.align.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.align.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.entry_size.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.entry_size.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        Ok(())
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, Option<Elf_EndianElf_SectionHeader_Body>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        self.f_body.set(true);
        if *self.type() != Elf_ShType::Nobits {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(self.ofs_body() as usize)?;
            match *self.type() {
                Elf_ShType::Dynamic => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_ShDynamicSection| Ok(t.set_endian(*self._is_le.borrow()));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_ShDynamicSection>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                Elf_ShType::Dynsym => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_DynsymSection| Ok(t.set_endian(*self._is_le.borrow()));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_DynsymSection>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                Elf_ShType::GnuVerdef => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_VerdefSection| Ok(t.set_endian(*self._is_le.borrow()));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_VerdefSection>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                Elf_ShType::GnuVerneed => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_VerneedSection| Ok(t.set_endian(*self._is_le.borrow()));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_VerneedSection>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                Elf_ShType::GnuVersym => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_VersymSection| Ok(t.set_endian(*self._is_le.borrow()));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_VersymSection>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                Elf_ShType::Note => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_NoteSection| Ok(t.set_endian(*self._is_le.borrow()));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_NoteSection>(&_t_body_raw_io, Some(self._root.clone()), None, &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                Elf_ShType::Rel => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_RelocationSection| Ok(t.set_params(false));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_RelocationSection>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                Elf_ShType::Rela => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_RelocationSection| Ok(t.set_params(true));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_RelocationSection>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                Elf_ShType::Strtab => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_StringsStruct| Ok(t.set_endian(*self._is_le.borrow()));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_StringsStruct>(&_t_body_raw_io, Some(self._root.clone()), None, &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                Elf_ShType::Symtab => {
                    *self.body_raw.borrow_mut() = io.read_bytes(self.len_body() as usize)?.into();
                    let body_raw = self.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let f = |t : &mut Elf_EndianElf_DynsymSection| Ok(t.set_endian(*self._is_le.borrow()));
                    let t = Self::read_into_with_init::<BytesReader, Elf_EndianElf_DynsymSection>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                    *self.body.borrow_mut() = Some(t);
                }
                _ => {
                    *self.body.borrow_mut() = Some(io.read_bytes(self.len_body() as usize)?.into());
                }
            }
            io.seek(_pos)?;
        }
        Ok(self.body.borrow())
    }
    pub fn flags_obj(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_SectionHeaderFlags>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flags_obj.get() {
            return Ok(self.flags_obj.borrow());
        }
        let f = |t : &mut Elf_SectionHeaderFlags| Ok(t.set_params((self.flags()).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, Elf_SectionHeaderFlags>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
        *self.flags_obj.borrow_mut() = t;
        Ok(self.flags_obj.borrow())
    }

    /**
     * may reference a later section header, so don't try to access too early (use only lazy `instances`)
     * \sa https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.sheader.html#sh_link Source
     */
    pub fn linked_section(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_EndianElf_SectionHeader>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_linked_section.get() {
            return Ok(self.linked_section.borrow());
        }
        if  ((((*self.linked_section_idx() as i32) != (i64::from(&Elf_SectionHeaderIdxSpecial::Undefined) as i32))) && (((*self.linked_section_idx() as u32) < (*_r.header().num_section_headers() as u32))))  {
            *self.linked_section.borrow_mut() = _r.header().section_headers()?[*self.linked_section_idx() as usize].clone();
        }
        Ok(self.linked_section.borrow())
    }
    pub fn name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name.get() {
            return Ok(self.name.borrow());
        }
        self.f_name.set(true);
        let io = Clone::clone(&*_r.header().section_names()?._io());
        let _pos = io.pos();
        io.seek(*self.ofs_name() as usize)?;
        *self.name.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        io.seek(_pos)?;
        Ok(self.name.borrow())
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn ofs_name(&self) -> Ref<'_, u32> {
        self.ofs_name.borrow()
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn type(&self) -> Ref<'_, Elf_ShType> {
        self.type.borrow()
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn flags(&self) -> usize {
        self.flags.borrow().as_ref().unwrap().into()
    }
    pub fn flags_enum(&self) -> Ref<'_, Option<Elf_EndianElf_SectionHeader_Flags>> {
        self.flags.borrow()
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn addr(&self) -> usize {
        self.addr.borrow().as_ref().unwrap().into()
    }
    pub fn addr_enum(&self) -> Ref<'_, Option<Elf_EndianElf_SectionHeader_Addr>> {
        self.addr.borrow()
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn ofs_body(&self) -> usize {
        self.ofs_body.borrow().as_ref().unwrap().into()
    }
    pub fn ofs_body_enum(&self) -> Ref<'_, Option<Elf_EndianElf_SectionHeader_OfsBody>> {
        self.ofs_body.borrow()
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn len_body(&self) -> usize {
        self.len_body.borrow().as_ref().unwrap().into()
    }
    pub fn len_body_enum(&self) -> Ref<'_, Option<Elf_EndianElf_SectionHeader_LenBody>> {
        self.len_body.borrow()
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn linked_section_idx(&self) -> Ref<'_, u32> {
        self.linked_section_idx.borrow()
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn info(&self) -> Ref<'_, u32> {
        self.info.borrow()
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn align(&self) -> usize {
        self.align.borrow().as_ref().unwrap().into()
    }
    pub fn align_enum(&self) -> Ref<'_, Option<Elf_EndianElf_SectionHeader_Align>> {
        self.align.borrow()
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn entry_size(&self) -> usize {
        self.entry_size.borrow().as_ref().unwrap().into()
    }
    pub fn entry_size_enum(&self) -> Ref<'_, Option<Elf_EndianElf_SectionHeader_EntrySize>> {
        self.entry_size.borrow()
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Elf_EndianElf_SectionHeader {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

/**
 * Same type as `ph_dynamic_section`, but it depends on
 * `_parent.linked_section`, so it can be used only in the
 * `section_header` type. See the documentation for `ph_dynamic_section`
 * for more details.
 * \sa https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_ShDynamicSection {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_SectionHeader>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Elf_EndianElf_ShDynamicSectionEntry>>>,
    _io: RefCell<BytesReader>,
    f_is_string_table_linked: Cell<bool>,
    is_string_table_linked: RefCell<bool>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_ShDynamicSection {
    type Root = Elf;
    type Parent = Elf_EndianElf_SectionHeader;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let f = |t : &mut Elf_EndianElf_ShDynamicSectionEntry| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Elf_EndianElf_ShDynamicSectionEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                self_rc.entries.borrow_mut().push(t);
                let _t_entries = self_rc.entries.borrow();
                let _tmpa = _t_entries.last().unwrap();
                _i += 1;
                let x = !(*_tmpa.tag_enum()? == Elf_DynamicArrayTags::Null);
                x
            } {}
        }
        Ok(())
    }
}
impl Elf_EndianElf_ShDynamicSection {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_ShDynamicSection {
    pub fn is_string_table_linked(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_string_table_linked.get() {
            return Ok(self.is_string_table_linked.borrow());
        }
        self.f_is_string_table_linked.set(true);
        *self.is_string_table_linked.borrow_mut() = (*_prc.as_ref().unwrap().linked_section()?.type() == Elf_ShType::Strtab) as bool;
        Ok(self.is_string_table_linked.borrow())
    }
}
impl Elf_EndianElf_ShDynamicSection {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Elf_EndianElf_ShDynamicSectionEntry>>> {
        self.entries.borrow()
    }
}
impl Elf_EndianElf_ShDynamicSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Same type as `ph_dynamic_section_entry`, but with the `value_str`
 * instance - see the documentation for `ph_dynamic_section` for more
 * details.
 * \sa https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_ShDynamicSectionEntry {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_ShDynamicSection>,
    pub _self: SharedType<Self>,
    tag: RefCell<Option<Elf_EndianElf_ShDynamicSectionEntry_Tag>>,
    value_or_ptr: RefCell<Option<Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr>>,
    _io: RefCell<BytesReader>,
    f_flag_1_values: Cell<bool>,
    flag_1_values: RefCell<OptRc<Elf_DtFlag1Values>>,
    f_flag_values: Cell<bool>,
    flag_values: RefCell<OptRc<Elf_DtFlagValues>>,
    f_is_value_str: Cell<bool>,
    is_value_str: RefCell<bool>,
    f_tag_enum: Cell<bool>,
    tag_enum: RefCell<Elf_DynamicArrayTags>,
    f_value_str: Cell<bool>,
    value_str: RefCell<String>,
    _is_le: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Elf_EndianElf_ShDynamicSectionEntry_Tag {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_ShDynamicSectionEntry_Tag {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_ShDynamicSectionEntry_Tag> for u32 {
    fn from(e: &Elf_EndianElf_ShDynamicSectionEntry_Tag) -> Self {
        if let Elf_EndianElf_ShDynamicSectionEntry_Tag::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ShDynamicSectionEntry_Tag::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_ShDynamicSectionEntry_Tag {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_ShDynamicSectionEntry_Tag> for u64 {
    fn from(e: &Elf_EndianElf_ShDynamicSectionEntry_Tag) -> Self {
        if let Elf_EndianElf_ShDynamicSectionEntry_Tag::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ShDynamicSectionEntry_Tag::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_ShDynamicSectionEntry_Tag> for usize {
    fn from(e: &Elf_EndianElf_ShDynamicSectionEntry_Tag) -> Self {
        match e {
            Elf_EndianElf_ShDynamicSectionEntry_Tag::U4(v) => *v as usize,
            Elf_EndianElf_ShDynamicSectionEntry_Tag::U8(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr {
    U4(u32),
    U8(u64),
}
impl From<u32> for Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr> for u32 {
    fn from(e: &Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr) -> Self {
        if let Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr::U4 to u32, enum value {:?}", e)
    }
}
impl From<u64> for Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr> for u64 {
    fn from(e: &Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr) -> Self {
        if let Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr::U8(v) = e {
            return *v
        }
        panic!("trying to convert from enum Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr::U8 to u64, enum value {:?}", e)
    }
}
impl From<&Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr> for usize {
    fn from(e: &Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr) -> Self {
        match e {
            Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr::U4(v) => *v as usize,
            Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr::U8(v) => *v as usize,
        }
    }
}

impl KStruct for Elf_EndianElf_ShDynamicSectionEntry {
    type Root = Elf;
    type Parent = Elf_EndianElf_ShDynamicSection;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.tag.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.tag.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        match *_r.bits() {
            Elf_Bits::B32 => {
                *self_rc.value_or_ptr.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() });
            }
            Elf_Bits::B64 => {
                *self_rc.value_or_ptr.borrow_mut() = Some(if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() });
            }
            _ => {}
        }
        Ok(())
    }
}
impl Elf_EndianElf_ShDynamicSectionEntry {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_ShDynamicSectionEntry {
    pub fn flag_1_values(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_DtFlag1Values>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flag_1_values.get() {
            return Ok(self.flag_1_values.borrow());
        }
        if *self.tag_enum()? == Elf_DynamicArrayTags::Flags1 {
            let f = |t : &mut Elf_DtFlag1Values| Ok(t.set_params((self.value_or_ptr()).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Elf_DtFlag1Values>(&*_io, Some(self._root.clone()), None, &f)?.into();
            *self.flag_1_values.borrow_mut() = t;
        }
        Ok(self.flag_1_values.borrow())
    }
    pub fn flag_values(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_DtFlagValues>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flag_values.get() {
            return Ok(self.flag_values.borrow());
        }
        if *self.tag_enum()? == Elf_DynamicArrayTags::Flags {
            let f = |t : &mut Elf_DtFlagValues| Ok(t.set_params((self.value_or_ptr()).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Elf_DtFlagValues>(&*_io, Some(self._root.clone()), None, &f)?.into();
            *self.flag_values.borrow_mut() = t;
        }
        Ok(self.flag_values.borrow())
    }
    pub fn is_value_str(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_value_str.get() {
            return Ok(self.is_value_str.borrow());
        }
        self.f_is_value_str.set(true);
        *self.is_value_str.borrow_mut() = ( ((((self.value_or_ptr() as u64) != (0 as u64))) && ( ((*self.tag_enum()? == Elf_DynamicArrayTags::Needed) || (*self.tag_enum()? == Elf_DynamicArrayTags::Soname) || (*self.tag_enum()? == Elf_DynamicArrayTags::Rpath) || (*self.tag_enum()? == Elf_DynamicArrayTags::Runpath) || (*self.tag_enum()? == Elf_DynamicArrayTags::SunwAuxiliary) || (*self.tag_enum()? == Elf_DynamicArrayTags::SunwFilter) || (*self.tag_enum()? == Elf_DynamicArrayTags::Auxiliary) || (*self.tag_enum()? == Elf_DynamicArrayTags::Filter) || (*self.tag_enum()? == Elf_DynamicArrayTags::Config) || (*self.tag_enum()? == Elf_DynamicArrayTags::Depaudit) || (*self.tag_enum()? == Elf_DynamicArrayTags::Audit)) )) ) as bool;
        Ok(self.is_value_str.borrow())
    }
    pub fn tag_enum(
        &self
    ) -> KResult<Ref<'_, Elf_DynamicArrayTags>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tag_enum.get() {
            return Ok(self.tag_enum.borrow());
        }
        self.f_tag_enum.set(true);
        *self.tag_enum.borrow_mut() = (self.tag() as i64).try_into()?;
        Ok(self.tag_enum.borrow())
    }
    pub fn value_str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_str.get() {
            return Ok(self.value_str.borrow());
        }
        self.f_value_str.set(true);
        if  ((*self.is_value_str()?) && (*_prc.as_ref().unwrap().is_string_table_linked()?))  {
            let io = Clone::clone(&*Into::<OptRc<Elf_EndianElf_StringsStruct>>::into(&*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().linked_section()?.body()?.as_ref().unwrap())._io());
            let _pos = io.pos();
            io.seek(self.value_or_ptr() as usize)?;
            *self.value_str.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
            io.seek(_pos)?;
        }
        Ok(self.value_str.borrow())
    }
}
impl Elf_EndianElf_ShDynamicSectionEntry {
    pub fn tag(&self) -> usize {
        self.tag.borrow().as_ref().unwrap().into()
    }
    pub fn tag_enum(&self) -> Ref<'_, Option<Elf_EndianElf_ShDynamicSectionEntry_Tag>> {
        self.tag.borrow()
    }
}
impl Elf_EndianElf_ShDynamicSectionEntry {
    pub fn value_or_ptr(&self) -> usize {
        self.value_or_ptr.borrow().as_ref().unwrap().into()
    }
    pub fn value_or_ptr_enum(&self) -> Ref<'_, Option<Elf_EndianElf_ShDynamicSectionEntry_ValueOrPtr>> {
        self.value_or_ptr.borrow()
    }
}
impl Elf_EndianElf_ShDynamicSectionEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_StringsStruct {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<String>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_StringsStruct {
    type Root = Elf;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.entries.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Elf_EndianElf_StringsStruct {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_StringsStruct {
}
impl Elf_EndianElf_StringsStruct {
    pub fn entries(&self) -> Ref<'_, Vec<String>> {
        self.entries.borrow()
    }
}
impl Elf_EndianElf_StringsStruct {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFEXTS Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html Source
 * \sa https://www.akkadia.org/drepper/symbol-versioning Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_VerdauxEntry {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_VerdefSection>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<Vec<u8>>,
    ofs_name: RefCell<u32>,
    ofs_next: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_name: Cell<bool>,
    name: RefCell<String>,
    f_next: Cell<bool>,
    next: RefCell<OptRc<Elf_EndianElf_VerdauxEntry>>,
    f_ofs_start: Cell<bool>,
    ofs_start: RefCell<i32>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_VerdauxEntry {
    type Root = Elf;
    type Parent = Elf_EndianElf_VerdefSection;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if ((*self_rc.ofs_start()? as i32) < (0 as i32)) {
            *self_rc.unnamed0.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        *self_rc.ofs_name.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.ofs_next.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        let _tmpa = *self_rc.ofs_next();
        if !( ((((_tmpa as u32) == (0 as u32))) || (((_tmpa as i32) >= (8 as i32)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/endian_elf/types/verdaux_entry/seq/2".to_string() }));
        }
        Ok(())
    }
}
impl Elf_EndianElf_VerdauxEntry {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_VerdauxEntry {
    pub fn name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name.get() {
            return Ok(self.name.borrow());
        }
        self.f_name.set(true);
        if *_prc.as_ref().unwrap().is_string_table_linked()? {
            let io = Clone::clone(&*Into::<OptRc<Elf_EndianElf_StringsStruct>>::into(&*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().linked_section()?.body()?.as_ref().unwrap())._io());
            let _pos = io.pos();
            io.seek(*self.ofs_name() as usize)?;
            *self.name.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
            io.seek(_pos)?;
        }
        Ok(self.name.borrow())
    }
    pub fn next(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_EndianElf_VerdauxEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_next.get() {
            return Ok(self.next.borrow());
        }
        if ((*self.ofs_next() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(((*self.ofs_start()? as i32) + (*self.ofs_next() as i32)) as usize)?;
            let f = |t : &mut Elf_EndianElf_VerdauxEntry| Ok(t.set_endian(*self._is_le.borrow()));
            let t = Self::read_into_with_init::<_, Elf_EndianElf_VerdauxEntry>(&*_io, Some(self._root.clone()), Some(SharedType::new(_prc.as_ref().unwrap().clone())), &f)?.into();
            *self.next.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.next.borrow())
    }
    pub fn ofs_start(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_start.get() {
            return Ok(self.ofs_start.borrow());
        }
        self.f_ofs_start.set(true);
        *self.ofs_start.borrow_mut() = (_io.pos()) as i32;
        Ok(self.ofs_start.borrow())
    }
}
impl Elf_EndianElf_VerdauxEntry {
    pub fn unnamed0(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed0.borrow()
    }
}

/**
 * Byte offset to the version or dependency name string in the linked
 * string table.
 */
impl Elf_EndianElf_VerdauxEntry {
    pub fn ofs_name(&self) -> Ref<'_, u32> {
        self.ofs_name.borrow()
    }
}

/**
 * Byte offset to the next verdaux entry, relative to the start of
 * this `verdaux_entry`. A value of zero means that there is no next
 * entry.
 */
impl Elf_EndianElf_VerdauxEntry {
    pub fn ofs_next(&self) -> Ref<'_, u32> {
        self.ofs_next.borrow()
    }
}
impl Elf_EndianElf_VerdauxEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Version Definitions, contained in the special section named
 * `.gnu.version_d` with the section type `sh_type::gnu_verdef`
 * (`SHT_GNU_verdef`).
 * 
 * The number of entries in this section must match the value of the
 * dynamic tag `dynamic_array_tags::verdefnum` (`DT_VERDEFNUM`) in the
 * Dynamic Section (`.dynamic`).
 * 
 * `_parent.linked_section` must be the string table that contains the
 * strings referenced by this section. Specifically, the string table in
 * the `.dynstr` section should be used (side note: the `readelf` command
 * doesn't even check which string table `sh_link` points to, and always
 * uses `.dynstr` for the lookups - see
 * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13787>).
 * 
 * The `is_string_table_linked` value instance indicates whether the
 * string table is linked. If it is not, version names (the `name`
 * instance in the `verdaux_entry` type) will not be available.
 * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERDEFS Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html Source
 * \sa https://www.akkadia.org/drepper/symbol-versioning Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_VerdefSection {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_SectionHeader>,
    pub _self: SharedType<Self>,
    first_entry: RefCell<OptRc<Elf_EndianElf_VerdefSectionEntry>>,
    _io: RefCell<BytesReader>,
    f_is_string_table_linked: Cell<bool>,
    is_string_table_linked: RefCell<bool>,
    f_num_entries: Cell<bool>,
    num_entries: RefCell<u32>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_VerdefSection {
    type Root = Elf;
    type Parent = Elf_EndianElf_SectionHeader;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let f = |t : &mut Elf_EndianElf_VerdefSectionEntry| Ok(t.set_endian(*self_rc._is_le.borrow()));
        let t = Self::read_into_with_init::<_, Elf_EndianElf_VerdefSectionEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
        *self_rc.first_entry.borrow_mut() = t;
        Ok(())
    }
}
impl Elf_EndianElf_VerdefSection {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_VerdefSection {

    /**
     * Indicates whether a string table is linked. This should always be
     * `true` in spec-compliant ELF files. If it is `false`, the string
     * offsets in this section will not be resolved to strings.
     */
    pub fn is_string_table_linked(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_string_table_linked.get() {
            return Ok(self.is_string_table_linked.borrow());
        }
        self.f_is_string_table_linked.set(true);
        *self.is_string_table_linked.borrow_mut() = (*_prc.as_ref().unwrap().linked_section()?.type() == Elf_ShType::Strtab) as bool;
        Ok(self.is_string_table_linked.borrow())
    }

    /**
     * Number of entries (version definitions)
     * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976 Source
     */
    pub fn num_entries(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_entries.get() {
            return Ok(self.num_entries.borrow());
        }
        self.f_num_entries.set(true);
        *self.num_entries.borrow_mut() = (_prc.as_ref().unwrap().info()) as u32;
        Ok(self.num_entries.borrow())
    }
}
impl Elf_EndianElf_VerdefSection {
    pub fn first_entry(&self) -> Ref<'_, OptRc<Elf_EndianElf_VerdefSectionEntry>> {
        self.first_entry.borrow()
    }
}
impl Elf_EndianElf_VerdefSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFENTRIES Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html Source
 * \sa https://www.akkadia.org/drepper/symbol-versioning Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_VerdefSectionEntry {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_VerdefSection>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<Vec<u8>>,
    version: RefCell<u16>,
    flags: RefCell<u16>,
    version_index: RefCell<u16>,
    num_aux_entries: RefCell<u16>,
    hash: RefCell<u32>,
    ofs_first_aux: RefCell<u32>,
    ofs_next: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_first_aux: Cell<bool>,
    first_aux: RefCell<OptRc<Elf_EndianElf_VerdauxEntry>>,
    f_flags_obj: Cell<bool>,
    flags_obj: RefCell<OptRc<Elf_EndianElf_VersionFlags>>,
    f_next: Cell<bool>,
    next: RefCell<OptRc<Elf_EndianElf_VerdefSectionEntry>>,
    f_ofs_start: Cell<bool>,
    ofs_start: RefCell<i32>,
    f_version_index_special: Cell<bool>,
    version_index_special: RefCell<Elf_VersionIndexSpecial>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_VerdefSectionEntry {
    type Root = Elf;
    type Parent = Elf_EndianElf_VerdefSection;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if ((*self_rc.ofs_start()? as i32) < (0 as i32)) {
            *self_rc.unnamed0.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        *self_rc.version.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        if !(((*self_rc.version() as u16) == (1 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/endian_elf/types/verdef_section_entry/seq/1".to_string() }));
        }
        *self_rc.flags.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        *self_rc.version_index.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        let _tmpa = *self_rc.version_index();
        if !(((((_tmpa as i32) & (32768 as i32)) as i32) == (0 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/endian_elf/types/verdef_section_entry/seq/3".to_string() }));
        }
        *self_rc.num_aux_entries.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        if !(((*self_rc.num_aux_entries() as u16) >= (1 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/endian_elf/types/verdef_section_entry/seq/4".to_string() }));
        }
        *self_rc.hash.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.ofs_first_aux.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        if !(((*self_rc.ofs_first_aux() as i32) >= (20 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/endian_elf/types/verdef_section_entry/seq/6".to_string() }));
        }
        *self_rc.ofs_next.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        let _tmpa = *self_rc.ofs_next();
        if !( ((((_tmpa as u32) == (0 as u32))) || (((_tmpa as i32) >= (20 as i32)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/endian_elf/types/verdef_section_entry/seq/7".to_string() }));
        }
        Ok(())
    }
}
impl Elf_EndianElf_VerdefSectionEntry {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_VerdefSectionEntry {

    /**
     * First auxiliary entry of type `verdaux_entry` (`Elfxx_Verdaux`).
     * The rest follow its `next` instance.
     */
    pub fn first_aux(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_EndianElf_VerdauxEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_first_aux.get() {
            return Ok(self.first_aux.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*self.ofs_start()? as i32) + (*self.ofs_first_aux() as i32)) as usize)?;
        let f = |t : &mut Elf_EndianElf_VerdauxEntry| Ok(t.set_endian(*self._is_le.borrow()));
        let t = Self::read_into_with_init::<_, Elf_EndianElf_VerdauxEntry>(&*_io, Some(self._root.clone()), Some(SharedType::new(_prc.as_ref().unwrap().clone())), &f)?.into();
        *self.first_aux.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.first_aux.borrow())
    }
    pub fn flags_obj(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_EndianElf_VersionFlags>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flags_obj.get() {
            return Ok(self.flags_obj.borrow());
        }
        let f = |t : &mut Elf_EndianElf_VersionFlags| Ok(t.set_params((*self.flags()).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, Elf_EndianElf_VersionFlags>(&*_io, Some(self._root.clone()), None, &f)?.into();
        *self.flags_obj.borrow_mut() = t;
        Ok(self.flags_obj.borrow())
    }
    pub fn next(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_EndianElf_VerdefSectionEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_next.get() {
            return Ok(self.next.borrow());
        }
        if ((*self.ofs_next() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(((*self.ofs_start()? as i32) + (*self.ofs_next() as i32)) as usize)?;
            let f = |t : &mut Elf_EndianElf_VerdefSectionEntry| Ok(t.set_endian(*self._is_le.borrow()));
            let t = Self::read_into_with_init::<_, Elf_EndianElf_VerdefSectionEntry>(&*_io, Some(self._root.clone()), Some(SharedType::new(_prc.as_ref().unwrap().clone())), &f)?.into();
            *self.next.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.next.borrow())
    }
    pub fn ofs_start(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_start.get() {
            return Ok(self.ofs_start.borrow());
        }
        self.f_ofs_start.set(true);
        *self.ofs_start.borrow_mut() = (_io.pos()) as i32;
        Ok(self.ofs_start.borrow())
    }
    pub fn version_index_special(
        &self
    ) -> KResult<Ref<'_, Elf_VersionIndexSpecial>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_version_index_special.get() {
            return Ok(self.version_index_special.borrow());
        }
        self.f_version_index_special.set(true);
        *self.version_index_special.borrow_mut() = (*self.version_index() as i64).try_into()?;
        Ok(self.version_index_special.borrow())
    }
}
impl Elf_EndianElf_VerdefSectionEntry {
    pub fn unnamed0(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed0.borrow()
    }
}

/**
 * Version of the structure. Must be set to 1.
 */
impl Elf_EndianElf_VerdefSectionEntry {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}

/**
 * Version information flag bitmask. Access `flags_obj` instead.
 */
impl Elf_EndianElf_VerdefSectionEntry {
    pub fn flags(&self) -> Ref<'_, u16> {
        self.flags.borrow()
    }
}

/**
 * Version index assigned to this version definition. A unique index
 * that entries in the Symbol Version Table (the `versym_section`
 * type) use to reference the corresponding version definition.
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html Source
 */
impl Elf_EndianElf_VerdefSectionEntry {
    pub fn version_index(&self) -> Ref<'_, u16> {
        self.version_index.borrow()
    }
}

/**
 * Number of associated auxiliary entries.
 */
impl Elf_EndianElf_VerdefSectionEntry {
    pub fn num_aux_entries(&self) -> Ref<'_, u16> {
        self.num_aux_entries.borrow()
    }
}

/**
 * Version name hash value (ELF hash function).
 */
impl Elf_EndianElf_VerdefSectionEntry {
    pub fn hash(&self) -> Ref<'_, u32> {
        self.hash.borrow()
    }
}

/**
 * Byte offset to the first `verdaux_entry` (`Elfxx_Verdaux`)
 * associated with this version definition. The offset is relative to
 * the start of this `verdef_section_entry`.
 */
impl Elf_EndianElf_VerdefSectionEntry {
    pub fn ofs_first_aux(&self) -> Ref<'_, u32> {
        self.ofs_first_aux.borrow()
    }
}

/**
 * Byte offset to the next verdef entry, relative to the start of
 * this `verdef_section_entry`. A value of zero means that there is
 * no next entry.
 */
impl Elf_EndianElf_VerdefSectionEntry {
    pub fn ofs_next(&self) -> Ref<'_, u32> {
        self.ofs_next.borrow()
    }
}
impl Elf_EndianElf_VerdefSectionEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDEXTFIG Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html Source
 * \sa https://www.akkadia.org/drepper/symbol-versioning Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_VernauxEntry {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_VerneedSection>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<Vec<u8>>,
    hash: RefCell<u32>,
    flags: RefCell<u16>,
    version_index: RefCell<OptRc<Elf_EndianElf_VersionIndex>>,
    ofs_name: RefCell<u32>,
    ofs_next: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_flags_obj: Cell<bool>,
    flags_obj: RefCell<OptRc<Elf_EndianElf_VersionFlags>>,
    f_name: Cell<bool>,
    name: RefCell<String>,
    f_next: Cell<bool>,
    next: RefCell<OptRc<Elf_EndianElf_VernauxEntry>>,
    f_ofs_start: Cell<bool>,
    ofs_start: RefCell<i32>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_VernauxEntry {
    type Root = Elf;
    type Parent = Elf_EndianElf_VerneedSection;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if ((*self_rc.ofs_start()? as i32) < (0 as i32)) {
            *self_rc.unnamed0.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        *self_rc.hash.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.flags.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        let f = |t : &mut Elf_EndianElf_VersionIndex| Ok(t.set_endian(*self_rc._is_le.borrow()));
        let t = Self::read_into_with_init::<_, Elf_EndianElf_VersionIndex>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
        *self_rc.version_index.borrow_mut() = t;
        *self_rc.ofs_name.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.ofs_next.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        let _tmpa = *self_rc.ofs_next();
        if !( ((((_tmpa as u32) == (0 as u32))) || (((_tmpa as i32) >= (16 as i32)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/endian_elf/types/vernaux_entry/seq/5".to_string() }));
        }
        Ok(())
    }
}
impl Elf_EndianElf_VernauxEntry {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_VernauxEntry {
    pub fn flags_obj(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_EndianElf_VersionFlags>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flags_obj.get() {
            return Ok(self.flags_obj.borrow());
        }
        let f = |t : &mut Elf_EndianElf_VersionFlags| Ok(t.set_params((*self.flags()).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, Elf_EndianElf_VersionFlags>(&*_io, Some(self._root.clone()), None, &f)?.into();
        *self.flags_obj.borrow_mut() = t;
        Ok(self.flags_obj.borrow())
    }
    pub fn name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name.get() {
            return Ok(self.name.borrow());
        }
        self.f_name.set(true);
        if *_prc.as_ref().unwrap().is_string_table_linked()? {
            let io = Clone::clone(&*Into::<OptRc<Elf_EndianElf_StringsStruct>>::into(&*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().linked_section()?.body()?.as_ref().unwrap())._io());
            let _pos = io.pos();
            io.seek(*self.ofs_name() as usize)?;
            *self.name.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
            io.seek(_pos)?;
        }
        Ok(self.name.borrow())
    }
    pub fn next(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_EndianElf_VernauxEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_next.get() {
            return Ok(self.next.borrow());
        }
        if ((*self.ofs_next() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(((*self.ofs_start()? as i32) + (*self.ofs_next() as i32)) as usize)?;
            let f = |t : &mut Elf_EndianElf_VernauxEntry| Ok(t.set_endian(*self._is_le.borrow()));
            let t = Self::read_into_with_init::<_, Elf_EndianElf_VernauxEntry>(&*_io, Some(self._root.clone()), Some(SharedType::new(_prc.as_ref().unwrap().clone())), &f)?.into();
            *self.next.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.next.borrow())
    }
    pub fn ofs_start(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_start.get() {
            return Ok(self.ofs_start.borrow());
        }
        self.f_ofs_start.set(true);
        *self.ofs_start.borrow_mut() = (_io.pos()) as i32;
        Ok(self.ofs_start.borrow())
    }
}
impl Elf_EndianElf_VernauxEntry {
    pub fn unnamed0(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed0.borrow()
    }
}

/**
 * Dependency name hash value (ELF hash function).
 */
impl Elf_EndianElf_VernauxEntry {
    pub fn hash(&self) -> Ref<'_, u32> {
        self.hash.borrow()
    }
}

/**
 * Dependency information flag bitmask. Access `flags_obj` instead.
 */
impl Elf_EndianElf_VernauxEntry {
    pub fn flags(&self) -> Ref<'_, u16> {
        self.flags.borrow()
    }
}

/**
 * Version index assigned to this dependency version. A unique index
 * that entries in the Symbol Version Table (the `versym_section`
 * type) use to reference the corresponding dependency version.
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html Source
 */
impl Elf_EndianElf_VernauxEntry {
    pub fn version_index(&self) -> Ref<'_, OptRc<Elf_EndianElf_VersionIndex>> {
        self.version_index.borrow()
    }
}

/**
 * Byte offset to the dependency name string in the linked string
 * table.
 */
impl Elf_EndianElf_VernauxEntry {
    pub fn ofs_name(&self) -> Ref<'_, u32> {
        self.ofs_name.borrow()
    }
}

/**
 * Byte offset to the next vernaux entry, relative to the start of
 * this `vernaux_entry`. A value of zero means that there is no next
 * entry.
 */
impl Elf_EndianElf_VernauxEntry {
    pub fn ofs_next(&self) -> Ref<'_, u32> {
        self.ofs_next.borrow()
    }
}
impl Elf_EndianElf_VernauxEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Version Requirements, contained in the special section named
 * `.gnu.version_r` with the section type `sh_type::gnu_verneed`
 * (`SHT_GNU_verneed`). This section defines the required versions of
 * dynamic symbols from other shared objects.
 * 
 * The number of entries in this section must match the value of the
 * dynamic tag `dynamic_array_tags::verneednum` (`DT_VERNEEDNUM`) in the
 * Dynamic Section (`.dynamic`).
 * 
 * `_parent.linked_section` must be the string table that contains the
 * strings referenced by this section. Specifically, the string table in
 * the `.dynstr` section should be used (side note: the `readelf` command
 * doesn't even check which string table `sh_link` points to, and always
 * uses `.dynstr` for the lookups - see
 * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13941>).
 * 
 * The `is_string_table_linked` value instance indicates whether the
 * string table is linked. If it is not, file names (the `file_name`
 * instance in the `verneed_section_entry` type) or version names (the
 * `name` instance in the `vernaux_entry` type) will not be available.
 * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERRQMTS Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html Source
 * \sa https://www.akkadia.org/drepper/symbol-versioning Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_VerneedSection {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_SectionHeader>,
    pub _self: SharedType<Self>,
    first_entry: RefCell<OptRc<Elf_EndianElf_VerneedSectionEntry>>,
    _io: RefCell<BytesReader>,
    f_is_string_table_linked: Cell<bool>,
    is_string_table_linked: RefCell<bool>,
    f_num_entries: Cell<bool>,
    num_entries: RefCell<u32>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_VerneedSection {
    type Root = Elf;
    type Parent = Elf_EndianElf_SectionHeader;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let f = |t : &mut Elf_EndianElf_VerneedSectionEntry| Ok(t.set_endian(*self_rc._is_le.borrow()));
        let t = Self::read_into_with_init::<_, Elf_EndianElf_VerneedSectionEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
        *self_rc.first_entry.borrow_mut() = t;
        Ok(())
    }
}
impl Elf_EndianElf_VerneedSection {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_VerneedSection {

    /**
     * Indicates whether a string table is linked. This should always be
     * `true` in spec-compliant ELF files. If it is `false`, the string
     * offsets in this section will not be resolved to strings.
     */
    pub fn is_string_table_linked(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_string_table_linked.get() {
            return Ok(self.is_string_table_linked.borrow());
        }
        self.f_is_string_table_linked.set(true);
        *self.is_string_table_linked.borrow_mut() = (*_prc.as_ref().unwrap().linked_section()?.type() == Elf_ShType::Strtab) as bool;
        Ok(self.is_string_table_linked.borrow())
    }

    /**
     * Number of entries (dependency versions)
     * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976 Source
     */
    pub fn num_entries(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_entries.get() {
            return Ok(self.num_entries.borrow());
        }
        self.f_num_entries.set(true);
        *self.num_entries.borrow_mut() = (_prc.as_ref().unwrap().info()) as u32;
        Ok(self.num_entries.borrow())
    }
}
impl Elf_EndianElf_VerneedSection {
    pub fn first_entry(&self) -> Ref<'_, OptRc<Elf_EndianElf_VerneedSectionEntry>> {
        self.first_entry.borrow()
    }
}
impl Elf_EndianElf_VerneedSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDFIG Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html Source
 * \sa https://www.akkadia.org/drepper/symbol-versioning Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_VerneedSectionEntry {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_VerneedSection>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<Vec<u8>>,
    version: RefCell<u16>,
    num_aux_entries: RefCell<u16>,
    ofs_file_name: RefCell<u32>,
    ofs_first_aux: RefCell<u32>,
    ofs_next: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_file_name: Cell<bool>,
    file_name: RefCell<String>,
    f_first_aux: Cell<bool>,
    first_aux: RefCell<OptRc<Elf_EndianElf_VernauxEntry>>,
    f_next: Cell<bool>,
    next: RefCell<OptRc<Elf_EndianElf_VerneedSectionEntry>>,
    f_ofs_start: Cell<bool>,
    ofs_start: RefCell<i32>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_VerneedSectionEntry {
    type Root = Elf;
    type Parent = Elf_EndianElf_VerneedSection;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if ((*self_rc.ofs_start()? as i32) < (0 as i32)) {
            *self_rc.unnamed0.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        *self_rc.version.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        if !(((*self_rc.version() as u16) == (1 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/endian_elf/types/verneed_section_entry/seq/1".to_string() }));
        }
        *self_rc.num_aux_entries.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        if !(((*self_rc.num_aux_entries() as u16) >= (1 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/endian_elf/types/verneed_section_entry/seq/2".to_string() }));
        }
        *self_rc.ofs_file_name.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.ofs_first_aux.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        if !(((*self_rc.ofs_first_aux() as i32) >= (16 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/endian_elf/types/verneed_section_entry/seq/4".to_string() }));
        }
        *self_rc.ofs_next.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        let _tmpa = *self_rc.ofs_next();
        if !( ((((_tmpa as u32) == (0 as u32))) || (((_tmpa as i32) >= (16 as i32)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/endian_elf/types/verneed_section_entry/seq/5".to_string() }));
        }
        Ok(())
    }
}
impl Elf_EndianElf_VerneedSectionEntry {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_VerneedSectionEntry {
    pub fn file_name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_file_name.get() {
            return Ok(self.file_name.borrow());
        }
        self.f_file_name.set(true);
        if *_prc.as_ref().unwrap().is_string_table_linked()? {
            let io = Clone::clone(&*Into::<OptRc<Elf_EndianElf_StringsStruct>>::into(&*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().linked_section()?.body()?.as_ref().unwrap())._io());
            let _pos = io.pos();
            io.seek(*self.ofs_file_name() as usize)?;
            *self.file_name.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
            io.seek(_pos)?;
        }
        Ok(self.file_name.borrow())
    }

    /**
     * First auxiliary entry of type `vernaux_entry` (`Elfxx_Vernaux`).
     * The rest follow its `next` instance.
     */
    pub fn first_aux(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_EndianElf_VernauxEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_first_aux.get() {
            return Ok(self.first_aux.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*self.ofs_start()? as i32) + (*self.ofs_first_aux() as i32)) as usize)?;
        let f = |t : &mut Elf_EndianElf_VernauxEntry| Ok(t.set_endian(*self._is_le.borrow()));
        let t = Self::read_into_with_init::<_, Elf_EndianElf_VernauxEntry>(&*_io, Some(self._root.clone()), Some(SharedType::new(_prc.as_ref().unwrap().clone())), &f)?.into();
        *self.first_aux.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.first_aux.borrow())
    }
    pub fn next(
        &self
    ) -> KResult<Ref<'_, OptRc<Elf_EndianElf_VerneedSectionEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_next.get() {
            return Ok(self.next.borrow());
        }
        if ((*self.ofs_next() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(((*self.ofs_start()? as i32) + (*self.ofs_next() as i32)) as usize)?;
            let f = |t : &mut Elf_EndianElf_VerneedSectionEntry| Ok(t.set_endian(*self._is_le.borrow()));
            let t = Self::read_into_with_init::<_, Elf_EndianElf_VerneedSectionEntry>(&*_io, Some(self._root.clone()), Some(SharedType::new(_prc.as_ref().unwrap().clone())), &f)?.into();
            *self.next.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.next.borrow())
    }
    pub fn ofs_start(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_start.get() {
            return Ok(self.ofs_start.borrow());
        }
        self.f_ofs_start.set(true);
        *self.ofs_start.borrow_mut() = (_io.pos()) as i32;
        Ok(self.ofs_start.borrow())
    }
}
impl Elf_EndianElf_VerneedSectionEntry {
    pub fn unnamed0(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed0.borrow()
    }
}

/**
 * Version of the structure. Must be set to 1.
 */
impl Elf_EndianElf_VerneedSectionEntry {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}

/**
 * Number of associated auxiliary entries.
 */
impl Elf_EndianElf_VerneedSectionEntry {
    pub fn num_aux_entries(&self) -> Ref<'_, u16> {
        self.num_aux_entries.borrow()
    }
}

/**
 * Byte offset to the file name string in the linked string table.
 */
impl Elf_EndianElf_VerneedSectionEntry {
    pub fn ofs_file_name(&self) -> Ref<'_, u32> {
        self.ofs_file_name.borrow()
    }
}

/**
 * Byte offset to the first associated `vernaux_entry`
 * (`Elfxx_Vernaux`). The offset is relative to the start of this
 * `verneed_section_entry`.
 */
impl Elf_EndianElf_VerneedSectionEntry {
    pub fn ofs_first_aux(&self) -> Ref<'_, u32> {
        self.ofs_first_aux.borrow()
    }
}

/**
 * Byte offset to the next verneed entry, relative to the start of
 * this `verneed_section_entry`. A value of zero means that there is
 * no next entry.
 */
impl Elf_EndianElf_VerneedSectionEntry {
    pub fn ofs_next(&self) -> Ref<'_, u32> {
        self.ofs_next.borrow()
    }
}
impl Elf_EndianElf_VerneedSectionEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Version information flag bitmask, shared by the `flags` (`vd_flags`)
 * field of `verdef_section_entry` (`Elfxx_Verdef`) and the `flags`
 * (`vna_flags`) field of `vernaux_entry` (`Elfxx_Vernaux`).
 * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMSTARTSEQ Source
 * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1078 Source
 * \sa https://www.akkadia.org/drepper/symbol-versioning Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_VersionFlags {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    value: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_base: Cell<bool>,
    base: RefCell<bool>,
    f_info: Cell<bool>,
    info: RefCell<bool>,
    f_weak: Cell<bool>,
    weak: RefCell<bool>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_VersionFlags {
    type Root = Elf;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Elf_EndianElf_VersionFlags {
    pub fn value(&self) -> Ref<'_, u16> {
        self.value.borrow()
    }
}
impl Elf_EndianElf_VersionFlags {
    pub fn set_params(&mut self, value: u16) {
        *self.value.borrow_mut() = value;
    }
}
impl Elf_EndianElf_VersionFlags {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_VersionFlags {

    /**
     * Version definition of the file itself (the base definition).
     */
    pub fn base(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_base.get() {
            return Ok(self.base.borrow());
        }
        self.f_base.set(true);
        *self.base.borrow_mut() = (((((*self.value() as u16) & (1 as u16)) as i32) != (0 as i32))) as bool;
        Ok(self.base.borrow())
    }

    /**
     * Version reference exists for informational purposes and does not
     * need to be validated at runtime.
     * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html Source
     */
    pub fn info(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_info.get() {
            return Ok(self.info.borrow());
        }
        self.f_info.set(true);
        *self.info.borrow_mut() = (((((*self.value() as u16) & (4 as u16)) as i32) != (0 as i32))) as bool;
        Ok(self.info.borrow())
    }

    /**
     * Weak version identifier.
     * 
     * A weak version definition has no symbols associated with the
     * version. See [Creating a Weak Version
     * Definition](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/creating-weak-version-definition.html).
     */
    pub fn weak(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_weak.get() {
            return Ok(self.weak.borrow());
        }
        self.f_weak.set(true);
        *self.weak.borrow_mut() = (((((*self.value() as u16) & (2 as u16)) as i32) != (0 as i32))) as bool;
        Ok(self.weak.borrow())
    }
}
impl Elf_EndianElf_VersionFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_VersionIndex {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    raw: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_is_hidden: Cell<bool>,
    is_hidden: RefCell<bool>,
    f_value: Cell<bool>,
    value: RefCell<i32>,
    f_version_index_special: Cell<bool>,
    version_index_special: RefCell<Elf_VersionIndexSpecial>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_VersionIndex {
    type Root = Elf;
    type Parent = KStructUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.raw.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        Ok(())
    }
}
impl Elf_EndianElf_VersionIndex {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_VersionIndex {

    /**
     * This bit is set if the symbol is hidden, and is only visible with
     * an explicit version number. This is a GNU extension.
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L1379 Source
     */
    pub fn is_hidden(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_hidden.get() {
            return Ok(self.is_hidden.borrow());
        }
        self.f_is_hidden.set(true);
        *self.is_hidden.borrow_mut() = (((((*self.raw() as i32) & (32768 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.is_hidden.borrow())
    }

    /**
     * The values `version_index_special::local` (0) and
     * `version_index_special::global_symbol` (1) have special meanings.
     * The `version_index_special` value instance converts the integer
     * value to the `version_index_special` enum.
     */
    pub fn value(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = (((*self.raw() as i32) & (32767 as i32))) as i32;
        Ok(self.value.borrow())
    }

    /**
     * Note: we match special constants against the full 16-bit integer
     * value (called `raw` in this .ksy implementation), because that's
     * what the `readelf` command does when deciding whether to print
     * `0 (*local*)` or `1 (*global*)` in the `.gnu.version`
     * (`SHT_GNU_versym`) section - see
     * <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L14079>.
     * 
     * Besides, `version_index_special::eliminate` (`VER_NDX_ELIMINATE`)
     * has a value of `0xff01`, which is a 16-bit value. If we matched
     * against `value` instead, `version_index_special::eliminate` would
     * be unreachable, because `value` contains only the lower 15 bits,
     * so its maximum possible value is `0x7fff`.
     */
    pub fn version_index_special(
        &self
    ) -> KResult<Ref<'_, Elf_VersionIndexSpecial>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_version_index_special.get() {
            return Ok(self.version_index_special.borrow());
        }
        self.f_version_index_special.set(true);
        *self.version_index_special.borrow_mut() = (*self.raw() as i64).try_into()?;
        Ok(self.version_index_special.borrow())
    }
}

/**
 * Raw value, don't read this field - access `value`,
 * `version_index_special` and `is_hidden` instead.
 */
impl Elf_EndianElf_VersionIndex {
    pub fn raw(&self) -> Ref<'_, u16> {
        self.raw.borrow()
    }
}
impl Elf_EndianElf_VersionIndex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Symbol Version Table, contained in the special section named
 * `.gnu.version` with the section type `sh_type::gnu_versym`
 * (`SHT_GNU_versym`).
 * 
 * This section must have the same number of entries as the Dynamic
 * Symbol Table in the `.dynsym` section (section type `sh_type::dynsym`
 * / `SHT_DYNSYM`). Each entry specifies the version defined for or
 * required by the corresponding symbol in the Dynamic Symbol Table.
 * \sa https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERTBL Source
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-symbol-section.html Source
 * \sa https://www.akkadia.org/drepper/symbol-versioning Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_EndianElf_VersymSection {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_SectionHeader>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Elf_EndianElf_VersionIndex>>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Elf_EndianElf_VersymSection {
    type Root = Elf;
    type Parent = Elf_EndianElf_SectionHeader;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let f = |t : &mut Elf_EndianElf_VersionIndex| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Elf_EndianElf_VersionIndex>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Elf_EndianElf_VersymSection {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Elf_EndianElf_VersymSection {
}

/**
 * Version indexes for the corresponding symbols in the Dynamic
 * Symbol Table (`.dynsym` section).
 * 
 * These values are not the versions themselves: they are keys that
 * are matched against the `version_index` (`vd_ndx`) field of the
 * `verdef_section_entry` (`Elfxx_Verdef`) type if the symbol is
 * defined in this object, or the `version_index` (`vna_other`) field
 * of the `vernaux_entry` (`Elfxx_Vernaux`) type if the symbol is
 * required from another object. The `name` instance of the matched
 * entry specifies the version of the symbol.
 */
impl Elf_EndianElf_VersymSection {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Elf_EndianElf_VersionIndex>>> {
        self.entries.borrow()
    }
}
impl Elf_EndianElf_VersymSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Elf_PhdrTypeFlags {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_ProgramHeader>,
    pub _self: SharedType<Self>,
    value: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_execute: Cell<bool>,
    execute: RefCell<bool>,
    f_mask_proc: Cell<bool>,
    mask_proc: RefCell<bool>,
    f_read: Cell<bool>,
    read: RefCell<bool>,
    f_write: Cell<bool>,
    write: RefCell<bool>,
}
impl KStruct for Elf_PhdrTypeFlags {
    type Root = Elf;
    type Parent = Elf_EndianElf_ProgramHeader;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Elf_PhdrTypeFlags {
    pub fn value(&self) -> Ref<'_, u32> {
        self.value.borrow()
    }
}
impl Elf_PhdrTypeFlags {
    pub fn set_params(&mut self, value: u32) {
        *self.value.borrow_mut() = value;
    }
}
impl Elf_PhdrTypeFlags {
    pub fn execute(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_execute.get() {
            return Ok(self.execute.borrow());
        }
        self.f_execute.set(true);
        *self.execute.borrow_mut() = (((((*self.value() as u32) & (1 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.execute.borrow())
    }
    pub fn mask_proc(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_mask_proc.get() {
            return Ok(self.mask_proc.borrow());
        }
        self.f_mask_proc.set(true);
        *self.mask_proc.borrow_mut() = (((((*self.value() as i32) & (4026531840 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.mask_proc.borrow())
    }
    pub fn read(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_read.get() {
            return Ok(self.read.borrow());
        }
        self.f_read.set(true);
        *self.read.borrow_mut() = (((((*self.value() as u32) & (4 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.read.borrow())
    }
    pub fn write(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_write.get() {
            return Ok(self.write.borrow());
        }
        self.f_write.set(true);
        *self.write.borrow_mut() = (((((*self.value() as u32) & (2 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.write.borrow())
    }
}
impl Elf_PhdrTypeFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675 Source
 * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L614 Source
 * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L468 Source
 */

#[derive(Default, Debug, Clone)]
pub struct Elf_SectionHeaderFlags {
    pub _root: SharedType<Elf>,
    pub _parent: SharedType<Elf_EndianElf_SectionHeader>,
    pub _self: SharedType<Self>,
    value: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_alloc: Cell<bool>,
    alloc: RefCell<bool>,
    f_compressed: Cell<bool>,
    compressed: RefCell<bool>,
    f_exclude: Cell<bool>,
    exclude: RefCell<bool>,
    f_exec_instr: Cell<bool>,
    exec_instr: RefCell<bool>,
    f_gnu_mbind: Cell<bool>,
    gnu_mbind: RefCell<bool>,
    f_group: Cell<bool>,
    group: RefCell<bool>,
    f_info_link: Cell<bool>,
    info_link: RefCell<bool>,
    f_link_order: Cell<bool>,
    link_order: RefCell<bool>,
    f_mask_os: Cell<bool>,
    mask_os: RefCell<bool>,
    f_mask_proc: Cell<bool>,
    mask_proc: RefCell<bool>,
    f_merge: Cell<bool>,
    merge: RefCell<bool>,
    f_ordered: Cell<bool>,
    ordered: RefCell<bool>,
    f_os_nonconforming: Cell<bool>,
    os_nonconforming: RefCell<bool>,
    f_retain: Cell<bool>,
    retain: RefCell<bool>,
    f_strings: Cell<bool>,
    strings: RefCell<bool>,
    f_tls: Cell<bool>,
    tls: RefCell<bool>,
    f_write: Cell<bool>,
    write: RefCell<bool>,
}
impl KStruct for Elf_SectionHeaderFlags {
    type Root = Elf;
    type Parent = Elf_EndianElf_SectionHeader;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        Ok(())
    }
}
impl Elf_SectionHeaderFlags {
    pub fn value(&self) -> Ref<'_, u32> {
        self.value.borrow()
    }
}
impl Elf_SectionHeaderFlags {
    pub fn set_params(&mut self, value: u32) {
        *self.value.borrow_mut() = value;
    }
}
impl Elf_SectionHeaderFlags {

    /**
     * Occupies memory during execution
     */
    pub fn alloc(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_alloc.get() {
            return Ok(self.alloc.borrow());
        }
        self.f_alloc.set(true);
        *self.alloc.borrow_mut() = (((((*self.value() as u32) & (2 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.alloc.borrow())
    }

    /**
     * Section with compressed data
     */
    pub fn compressed(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_compressed.get() {
            return Ok(self.compressed.borrow());
        }
        self.f_compressed.set(true);
        *self.compressed.borrow_mut() = (((((*self.value() as i32) & (2048 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.compressed.borrow())
    }

    /**
     * Section is excluded unless referenced or allocated (Solaris)
     */
    pub fn exclude(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_exclude.get() {
            return Ok(self.exclude.borrow());
        }
        self.f_exclude.set(true);
        *self.exclude.borrow_mut() = (((((*self.value() as i32) & (2147483648 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.exclude.borrow())
    }

    /**
     * Executable machine instructions
     */
    pub fn exec_instr(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_exec_instr.get() {
            return Ok(self.exec_instr.borrow());
        }
        self.f_exec_instr.set(true);
        *self.exec_instr.borrow_mut() = (((((*self.value() as u32) & (4 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.exec_instr.borrow())
    }

    /**
     * Mbind section
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L631 Source
     */
    pub fn gnu_mbind(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_gnu_mbind.get() {
            return Ok(self.gnu_mbind.borrow());
        }
        self.f_gnu_mbind.set(true);
        *self.gnu_mbind.borrow_mut() = (((((*self.value() as i32) & (16777216 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.gnu_mbind.borrow())
    }

    /**
     * Member of a section group
     */
    pub fn group(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_group.get() {
            return Ok(self.group.borrow());
        }
        self.f_group.set(true);
        *self.group.borrow_mut() = (((((*self.value() as i32) & (512 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.group.borrow())
    }

    /**
     * Section header's `sh_info` field holds a section header table index
     */
    pub fn info_link(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_info_link.get() {
            return Ok(self.info_link.borrow());
        }
        self.f_info_link.set(true);
        *self.info_link.borrow_mut() = (((((*self.value() as u32) & (64 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.info_link.borrow())
    }

    /**
     * Preserve section ordering when linking
     */
    pub fn link_order(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_link_order.get() {
            return Ok(self.link_order.borrow());
        }
        self.f_link_order.set(true);
        *self.link_order.borrow_mut() = (((((*self.value() as u32) & (128 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.link_order.borrow())
    }

    /**
     * OS-specific semantics
     */
    pub fn mask_os(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_mask_os.get() {
            return Ok(self.mask_os.borrow());
        }
        self.f_mask_os.set(true);
        *self.mask_os.borrow_mut() = (((((*self.value() as i32) & (267386880 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.mask_os.borrow())
    }

    /**
     * Processor-specific semantics
     */
    pub fn mask_proc(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_mask_proc.get() {
            return Ok(self.mask_proc.borrow());
        }
        self.f_mask_proc.set(true);
        *self.mask_proc.borrow_mut() = (((((*self.value() as i32) & (4026531840 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.mask_proc.borrow())
    }

    /**
     * Data in this section can be merged to eliminate duplication
     */
    pub fn merge(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_merge.get() {
            return Ok(self.merge.borrow());
        }
        self.f_merge.set(true);
        *self.merge.borrow_mut() = (((((*self.value() as u32) & (16 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.merge.borrow())
    }

    /**
     * Special ordering requirement (Solaris)
     * 
     * From <https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675>:
     * 
     * > `SHF_ORDERED` is an older version of the functionality provided by
     * > `SHF_LINK_ORDER`, and has been superseded by `SHF_LINK_ORDER`.
     * > `SHF_ORDERED` is no longer supported.
     * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L485 Source
     * \sa https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675 Source
     */
    pub fn ordered(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ordered.get() {
            return Ok(self.ordered.borrow());
        }
        self.f_ordered.set(true);
        *self.ordered.borrow_mut() = (((((*self.value() as i32) & (1073741824 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.ordered.borrow())
    }

    /**
     * Special OS-specific handling required
     */
    pub fn os_nonconforming(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_os_nonconforming.get() {
            return Ok(self.os_nonconforming.borrow());
        }
        self.f_os_nonconforming.set(true);
        *self.os_nonconforming.borrow_mut() = (((((*self.value() as i32) & (256 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.os_nonconforming.borrow())
    }

    /**
     * Section should not be garbage collected by the linker
     * \sa https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L630 Source
     * \sa https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L484 Source
     */
    pub fn retain(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_retain.get() {
            return Ok(self.retain.borrow());
        }
        self.f_retain.set(true);
        *self.retain.borrow_mut() = (((((*self.value() as i32) & (2097152 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.retain.borrow())
    }

    /**
     * Contains null-terminated character strings
     */
    pub fn strings(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_strings.get() {
            return Ok(self.strings.borrow());
        }
        self.f_strings.set(true);
        *self.strings.borrow_mut() = (((((*self.value() as u32) & (32 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.strings.borrow())
    }

    /**
     * Thread-local storage section (`.tbss` or `.tdata` according to [ELF
     * Handling For Thread-Local
     * Storage](https://www.akkadia.org/drepper/tls.pdf))
     */
    pub fn tls(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tls.get() {
            return Ok(self.tls.borrow());
        }
        self.f_tls.set(true);
        *self.tls.borrow_mut() = (((((*self.value() as i32) & (1024 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.tls.borrow())
    }

    /**
     * Writable during execution
     */
    pub fn write(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_write.get() {
            return Ok(self.write.borrow());
        }
        self.f_write.set(true);
        *self.write.borrow_mut() = (((((*self.value() as u32) & (1 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.write.borrow())
    }
}
impl Elf_SectionHeaderFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
