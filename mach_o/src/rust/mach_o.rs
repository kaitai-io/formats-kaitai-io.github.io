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
use super::asn1_der::Asn1Der;

/**
 * \sa https://www.stonedcoder.org/~kd/lib/MachORuntime.pdf Source
 * \sa https://opensource.apple.com/source/python_modules/python_modules-43/Modules/macholib-1.5.1/macholib-1.5.1.tar.gz Source
 * \sa https://github.com/comex/cs/blob/07a88f9/macho_cs.py Source
 * \sa https://opensource.apple.com/source/Security/Security-55471/libsecurity_codesigning/requirements.grammar.auto.html Source
 * \sa https://github.com/apple/darwin-xnu/blob/xnu-2782.40.9/bsd/sys/codesign.h Source
 * \sa https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachO.cpp.auto.html Source
 * \sa https://opensource.apple.com/source/dyld/dyld-852/src/ImageLoaderMachOCompressed.cpp.auto.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct MachO {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO>,
    pub _self: SharedType<Self>,
    magic: RefCell<MachO_MagicType>,
    header: RefCell<OptRc<MachO_MachHeader>>,
    load_commands: RefCell<Vec<OptRc<MachO_LoadCommand>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO {
    type Root = MachO;
    type Parent = MachO;

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
        *self_rc.magic.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        let t = Self::read_into::<_, MachO_MachHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.load_commands.borrow_mut() = Vec::new();
        let l_load_commands = *self_rc.header().ncmds();
        for _i in 0..l_load_commands {
            let t = Self::read_into::<_, MachO_LoadCommand>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.load_commands.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl MachO {
}
impl MachO {
    pub fn magic(&self) -> Ref<'_, MachO_MagicType> {
        self.magic.borrow()
    }
}
impl MachO {
    pub fn header(&self) -> Ref<'_, OptRc<MachO_MachHeader>> {
        self.header.borrow()
    }
}
impl MachO {
    pub fn load_commands(&self) -> Ref<'_, Vec<OptRc<MachO_LoadCommand>>> {
        self.load_commands.borrow()
    }
}
impl MachO {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MachO_CpuType {
    Vax,
    Romp,
    Ns32032,
    Ns32332,
    I386,
    Mips,
    Ns32532,
    Hppa,
    Arm,
    Mc88000,
    Sparc,
    I860,
    I860Little,
    Rs6000,
    Powerpc,
    Abi64,
    X8664,
    Arm64,
    Powerpc64,
    Any,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_CpuType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_CpuType> {
        match flag {
            1 => Ok(MachO_CpuType::Vax),
            2 => Ok(MachO_CpuType::Romp),
            4 => Ok(MachO_CpuType::Ns32032),
            5 => Ok(MachO_CpuType::Ns32332),
            7 => Ok(MachO_CpuType::I386),
            8 => Ok(MachO_CpuType::Mips),
            9 => Ok(MachO_CpuType::Ns32532),
            11 => Ok(MachO_CpuType::Hppa),
            12 => Ok(MachO_CpuType::Arm),
            13 => Ok(MachO_CpuType::Mc88000),
            14 => Ok(MachO_CpuType::Sparc),
            15 => Ok(MachO_CpuType::I860),
            16 => Ok(MachO_CpuType::I860Little),
            17 => Ok(MachO_CpuType::Rs6000),
            18 => Ok(MachO_CpuType::Powerpc),
            16777216 => Ok(MachO_CpuType::Abi64),
            16777223 => Ok(MachO_CpuType::X8664),
            16777228 => Ok(MachO_CpuType::Arm64),
            16777234 => Ok(MachO_CpuType::Powerpc64),
            4294967295 => Ok(MachO_CpuType::Any),
            _ => Ok(MachO_CpuType::Unknown(flag)),
        }
    }
}

impl From<&MachO_CpuType> for i64 {
    fn from(v: &MachO_CpuType) -> Self {
        match *v {
            MachO_CpuType::Vax => 1,
            MachO_CpuType::Romp => 2,
            MachO_CpuType::Ns32032 => 4,
            MachO_CpuType::Ns32332 => 5,
            MachO_CpuType::I386 => 7,
            MachO_CpuType::Mips => 8,
            MachO_CpuType::Ns32532 => 9,
            MachO_CpuType::Hppa => 11,
            MachO_CpuType::Arm => 12,
            MachO_CpuType::Mc88000 => 13,
            MachO_CpuType::Sparc => 14,
            MachO_CpuType::I860 => 15,
            MachO_CpuType::I860Little => 16,
            MachO_CpuType::Rs6000 => 17,
            MachO_CpuType::Powerpc => 18,
            MachO_CpuType::Abi64 => 16777216,
            MachO_CpuType::X8664 => 16777223,
            MachO_CpuType::Arm64 => 16777228,
            MachO_CpuType::Powerpc64 => 16777234,
            MachO_CpuType::Any => 4294967295,
            MachO_CpuType::Unknown(v) => v
        }
    }
}

impl Default for MachO_CpuType {
    fn default() -> Self { MachO_CpuType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MachO_FileType {
    Object,
    Execute,
    Fvmlib,
    Core,
    Preload,
    Dylib,
    Dylinker,
    Bundle,
    DylibStub,
    Dsym,
    KextBundle,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_FileType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_FileType> {
        match flag {
            1 => Ok(MachO_FileType::Object),
            2 => Ok(MachO_FileType::Execute),
            3 => Ok(MachO_FileType::Fvmlib),
            4 => Ok(MachO_FileType::Core),
            5 => Ok(MachO_FileType::Preload),
            6 => Ok(MachO_FileType::Dylib),
            7 => Ok(MachO_FileType::Dylinker),
            8 => Ok(MachO_FileType::Bundle),
            9 => Ok(MachO_FileType::DylibStub),
            10 => Ok(MachO_FileType::Dsym),
            11 => Ok(MachO_FileType::KextBundle),
            _ => Ok(MachO_FileType::Unknown(flag)),
        }
    }
}

impl From<&MachO_FileType> for i64 {
    fn from(v: &MachO_FileType) -> Self {
        match *v {
            MachO_FileType::Object => 1,
            MachO_FileType::Execute => 2,
            MachO_FileType::Fvmlib => 3,
            MachO_FileType::Core => 4,
            MachO_FileType::Preload => 5,
            MachO_FileType::Dylib => 6,
            MachO_FileType::Dylinker => 7,
            MachO_FileType::Bundle => 8,
            MachO_FileType::DylibStub => 9,
            MachO_FileType::Dsym => 10,
            MachO_FileType::KextBundle => 11,
            MachO_FileType::Unknown(v) => v
        }
    }
}

impl Default for MachO_FileType {
    fn default() -> Self { MachO_FileType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MachO_LoadCommandType {
    Segment,
    Symtab,
    Symseg,
    Thread,
    UnixThread,
    LoadFvmLib,
    IdFvmLib,
    Ident,
    FvmFile,
    Prepage,
    Dysymtab,
    LoadDylib,
    IdDylib,
    LoadDylinker,
    IdDylinker,
    PreboundDylib,
    Routines,
    SubFramework,
    SubUmbrella,
    SubClient,
    SubLibrary,
    TwolevelHints,
    PrebindCksum,
    Segment64,
    Routines64,
    Uuid,
    CodeSignature,
    SegmentSplitInfo,
    LazyLoadDylib,
    EncryptionInfo,
    DyldInfo,
    VersionMinMacosx,
    VersionMinIphoneos,
    FunctionStarts,
    DyldEnvironment,
    DataInCode,
    SourceVersion,
    DylibCodeSignDrs,
    EncryptionInfo64,
    LinkerOption,
    LinkerOptimizationHint,
    VersionMinTvos,
    VersionMinWatchos,
    BuildVersion,
    ReqDyld,
    LoadWeakDylib,
    Rpath,
    ReexportDylib,
    DyldInfoOnly,
    LoadUpwardDylib,
    Main,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_LoadCommandType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_LoadCommandType> {
        match flag {
            1 => Ok(MachO_LoadCommandType::Segment),
            2 => Ok(MachO_LoadCommandType::Symtab),
            3 => Ok(MachO_LoadCommandType::Symseg),
            4 => Ok(MachO_LoadCommandType::Thread),
            5 => Ok(MachO_LoadCommandType::UnixThread),
            6 => Ok(MachO_LoadCommandType::LoadFvmLib),
            7 => Ok(MachO_LoadCommandType::IdFvmLib),
            8 => Ok(MachO_LoadCommandType::Ident),
            9 => Ok(MachO_LoadCommandType::FvmFile),
            10 => Ok(MachO_LoadCommandType::Prepage),
            11 => Ok(MachO_LoadCommandType::Dysymtab),
            12 => Ok(MachO_LoadCommandType::LoadDylib),
            13 => Ok(MachO_LoadCommandType::IdDylib),
            14 => Ok(MachO_LoadCommandType::LoadDylinker),
            15 => Ok(MachO_LoadCommandType::IdDylinker),
            16 => Ok(MachO_LoadCommandType::PreboundDylib),
            17 => Ok(MachO_LoadCommandType::Routines),
            18 => Ok(MachO_LoadCommandType::SubFramework),
            19 => Ok(MachO_LoadCommandType::SubUmbrella),
            20 => Ok(MachO_LoadCommandType::SubClient),
            21 => Ok(MachO_LoadCommandType::SubLibrary),
            22 => Ok(MachO_LoadCommandType::TwolevelHints),
            23 => Ok(MachO_LoadCommandType::PrebindCksum),
            25 => Ok(MachO_LoadCommandType::Segment64),
            26 => Ok(MachO_LoadCommandType::Routines64),
            27 => Ok(MachO_LoadCommandType::Uuid),
            29 => Ok(MachO_LoadCommandType::CodeSignature),
            30 => Ok(MachO_LoadCommandType::SegmentSplitInfo),
            32 => Ok(MachO_LoadCommandType::LazyLoadDylib),
            33 => Ok(MachO_LoadCommandType::EncryptionInfo),
            34 => Ok(MachO_LoadCommandType::DyldInfo),
            36 => Ok(MachO_LoadCommandType::VersionMinMacosx),
            37 => Ok(MachO_LoadCommandType::VersionMinIphoneos),
            38 => Ok(MachO_LoadCommandType::FunctionStarts),
            39 => Ok(MachO_LoadCommandType::DyldEnvironment),
            41 => Ok(MachO_LoadCommandType::DataInCode),
            42 => Ok(MachO_LoadCommandType::SourceVersion),
            43 => Ok(MachO_LoadCommandType::DylibCodeSignDrs),
            44 => Ok(MachO_LoadCommandType::EncryptionInfo64),
            45 => Ok(MachO_LoadCommandType::LinkerOption),
            46 => Ok(MachO_LoadCommandType::LinkerOptimizationHint),
            47 => Ok(MachO_LoadCommandType::VersionMinTvos),
            48 => Ok(MachO_LoadCommandType::VersionMinWatchos),
            50 => Ok(MachO_LoadCommandType::BuildVersion),
            2147483648 => Ok(MachO_LoadCommandType::ReqDyld),
            2147483672 => Ok(MachO_LoadCommandType::LoadWeakDylib),
            2147483676 => Ok(MachO_LoadCommandType::Rpath),
            2147483679 => Ok(MachO_LoadCommandType::ReexportDylib),
            2147483682 => Ok(MachO_LoadCommandType::DyldInfoOnly),
            2147483683 => Ok(MachO_LoadCommandType::LoadUpwardDylib),
            2147483688 => Ok(MachO_LoadCommandType::Main),
            _ => Ok(MachO_LoadCommandType::Unknown(flag)),
        }
    }
}

impl From<&MachO_LoadCommandType> for i64 {
    fn from(v: &MachO_LoadCommandType) -> Self {
        match *v {
            MachO_LoadCommandType::Segment => 1,
            MachO_LoadCommandType::Symtab => 2,
            MachO_LoadCommandType::Symseg => 3,
            MachO_LoadCommandType::Thread => 4,
            MachO_LoadCommandType::UnixThread => 5,
            MachO_LoadCommandType::LoadFvmLib => 6,
            MachO_LoadCommandType::IdFvmLib => 7,
            MachO_LoadCommandType::Ident => 8,
            MachO_LoadCommandType::FvmFile => 9,
            MachO_LoadCommandType::Prepage => 10,
            MachO_LoadCommandType::Dysymtab => 11,
            MachO_LoadCommandType::LoadDylib => 12,
            MachO_LoadCommandType::IdDylib => 13,
            MachO_LoadCommandType::LoadDylinker => 14,
            MachO_LoadCommandType::IdDylinker => 15,
            MachO_LoadCommandType::PreboundDylib => 16,
            MachO_LoadCommandType::Routines => 17,
            MachO_LoadCommandType::SubFramework => 18,
            MachO_LoadCommandType::SubUmbrella => 19,
            MachO_LoadCommandType::SubClient => 20,
            MachO_LoadCommandType::SubLibrary => 21,
            MachO_LoadCommandType::TwolevelHints => 22,
            MachO_LoadCommandType::PrebindCksum => 23,
            MachO_LoadCommandType::Segment64 => 25,
            MachO_LoadCommandType::Routines64 => 26,
            MachO_LoadCommandType::Uuid => 27,
            MachO_LoadCommandType::CodeSignature => 29,
            MachO_LoadCommandType::SegmentSplitInfo => 30,
            MachO_LoadCommandType::LazyLoadDylib => 32,
            MachO_LoadCommandType::EncryptionInfo => 33,
            MachO_LoadCommandType::DyldInfo => 34,
            MachO_LoadCommandType::VersionMinMacosx => 36,
            MachO_LoadCommandType::VersionMinIphoneos => 37,
            MachO_LoadCommandType::FunctionStarts => 38,
            MachO_LoadCommandType::DyldEnvironment => 39,
            MachO_LoadCommandType::DataInCode => 41,
            MachO_LoadCommandType::SourceVersion => 42,
            MachO_LoadCommandType::DylibCodeSignDrs => 43,
            MachO_LoadCommandType::EncryptionInfo64 => 44,
            MachO_LoadCommandType::LinkerOption => 45,
            MachO_LoadCommandType::LinkerOptimizationHint => 46,
            MachO_LoadCommandType::VersionMinTvos => 47,
            MachO_LoadCommandType::VersionMinWatchos => 48,
            MachO_LoadCommandType::BuildVersion => 50,
            MachO_LoadCommandType::ReqDyld => 2147483648,
            MachO_LoadCommandType::LoadWeakDylib => 2147483672,
            MachO_LoadCommandType::Rpath => 2147483676,
            MachO_LoadCommandType::ReexportDylib => 2147483679,
            MachO_LoadCommandType::DyldInfoOnly => 2147483682,
            MachO_LoadCommandType::LoadUpwardDylib => 2147483683,
            MachO_LoadCommandType::Main => 2147483688,
            MachO_LoadCommandType::Unknown(v) => v
        }
    }
}

impl Default for MachO_LoadCommandType {
    fn default() -> Self { MachO_LoadCommandType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MachO_MagicType {
    MachoLeX86,
    MachoLeX64,
    MachoBeX86,
    MachoBeX64,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_MagicType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_MagicType> {
        match flag {
            3472551422 => Ok(MachO_MagicType::MachoLeX86),
            3489328638 => Ok(MachO_MagicType::MachoLeX64),
            4277009102 => Ok(MachO_MagicType::MachoBeX86),
            4277009103 => Ok(MachO_MagicType::MachoBeX64),
            _ => Ok(MachO_MagicType::Unknown(flag)),
        }
    }
}

impl From<&MachO_MagicType> for i64 {
    fn from(v: &MachO_MagicType) -> Self {
        match *v {
            MachO_MagicType::MachoLeX86 => 3472551422,
            MachO_MagicType::MachoLeX64 => 3489328638,
            MachO_MagicType::MachoBeX86 => 4277009102,
            MachO_MagicType::MachoBeX64 => 4277009103,
            MachO_MagicType::Unknown(v) => v
        }
    }
}

impl Default for MachO_MagicType {
    fn default() -> Self { MachO_MagicType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MachO_BuildVersionCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    platform: RefCell<u32>,
    minos: RefCell<u32>,
    sdk: RefCell<u32>,
    ntools: RefCell<u32>,
    tools: RefCell<Vec<OptRc<MachO_BuildVersionCommand_BuildToolVersion>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_BuildVersionCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.platform.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.minos.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.sdk.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ntools.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.tools.borrow_mut() = Vec::new();
        let l_tools = *self_rc.ntools();
        for _i in 0..l_tools {
            let t = Self::read_into::<_, MachO_BuildVersionCommand_BuildToolVersion>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.tools.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl MachO_BuildVersionCommand {
}
impl MachO_BuildVersionCommand {
    pub fn platform(&self) -> Ref<'_, u32> {
        self.platform.borrow()
    }
}
impl MachO_BuildVersionCommand {
    pub fn minos(&self) -> Ref<'_, u32> {
        self.minos.borrow()
    }
}
impl MachO_BuildVersionCommand {
    pub fn sdk(&self) -> Ref<'_, u32> {
        self.sdk.borrow()
    }
}
impl MachO_BuildVersionCommand {
    pub fn ntools(&self) -> Ref<'_, u32> {
        self.ntools.borrow()
    }
}
impl MachO_BuildVersionCommand {
    pub fn tools(&self) -> Ref<'_, Vec<OptRc<MachO_BuildVersionCommand_BuildToolVersion>>> {
        self.tools.borrow()
    }
}
impl MachO_BuildVersionCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_BuildVersionCommand_BuildToolVersion {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_BuildVersionCommand>,
    pub _self: SharedType<Self>,
    tool: RefCell<u32>,
    version: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_BuildVersionCommand_BuildToolVersion {
    type Root = MachO;
    type Parent = MachO_BuildVersionCommand;

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
        *self_rc.tool.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.version.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MachO_BuildVersionCommand_BuildToolVersion {
}
impl MachO_BuildVersionCommand_BuildToolVersion {
    pub fn tool(&self) -> Ref<'_, u32> {
        self.tool.borrow()
    }
}
impl MachO_BuildVersionCommand_BuildToolVersion {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}
impl MachO_BuildVersionCommand_BuildToolVersion {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CodeSignatureCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    data_off: RefCell<u32>,
    data_size: RefCell<u32>,
    _io: RefCell<BytesReader>,
    code_signature_raw: RefCell<Vec<u8>>,
    f_code_signature: Cell<bool>,
    code_signature: RefCell<OptRc<MachO_CsBlob>>,
}
impl KStruct for MachO_CodeSignatureCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.data_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data_size.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MachO_CodeSignatureCommand {
    pub fn code_signature(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO_CsBlob>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_code_signature.get() {
            return Ok(self.code_signature.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.data_off() as usize)?;
        *self.code_signature_raw.borrow_mut() = io.read_bytes(*self.data_size() as usize)?.into();
        let code_signature_raw = self.code_signature_raw.borrow();
        let _t_code_signature_raw_io = BytesReader::from(code_signature_raw.clone());
        let t = Self::read_into::<BytesReader, MachO_CsBlob>(&_t_code_signature_raw_io, Some(self._root.clone()), None)?.into();
        *self.code_signature.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.code_signature.borrow())
    }
}
impl MachO_CodeSignatureCommand {
    pub fn data_off(&self) -> Ref<'_, u32> {
        self.data_off.borrow()
    }
}
impl MachO_CodeSignatureCommand {
    pub fn data_size(&self) -> Ref<'_, u32> {
        self.data_size.borrow()
    }
}
impl MachO_CodeSignatureCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MachO_CodeSignatureCommand {
    pub fn code_signature_raw(&self) -> Ref<'_, Vec<u8>> {
        self.code_signature_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    magic: RefCell<MachO_CsBlob_CsMagic>,
    length: RefCell<u32>,
    body: RefCell<Option<MachO_CsBlob_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum MachO_CsBlob_Body {
    MachO_CsBlob_Requirements(OptRc<MachO_CsBlob_Requirements>),
    Bytes(Vec<u8>),
    MachO_CsBlob_SuperBlob(OptRc<MachO_CsBlob_SuperBlob>),
    MachO_CsBlob_BlobWrapper(OptRc<MachO_CsBlob_BlobWrapper>),
    MachO_CsBlob_Entitlements(OptRc<MachO_CsBlob_Entitlements>),
    MachO_CsBlob_Requirement(OptRc<MachO_CsBlob_Requirement>),
    MachO_CsBlob_CodeDirectory(OptRc<MachO_CsBlob_CodeDirectory>),
    Asn1Der(OptRc<Asn1Der>),
}
impl From<&MachO_CsBlob_Body> for OptRc<MachO_CsBlob_Requirements> {
    fn from(v: &MachO_CsBlob_Body) -> Self {
        if let MachO_CsBlob_Body::MachO_CsBlob_Requirements(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Body::MachO_CsBlob_Requirements, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Requirements>> for MachO_CsBlob_Body {
    fn from(v: OptRc<MachO_CsBlob_Requirements>) -> Self {
        Self::MachO_CsBlob_Requirements(v)
    }
}
impl From<&MachO_CsBlob_Body> for Vec<u8> {
    fn from(v: &MachO_CsBlob_Body) -> Self {
        if let MachO_CsBlob_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for MachO_CsBlob_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&MachO_CsBlob_Body> for OptRc<MachO_CsBlob_SuperBlob> {
    fn from(v: &MachO_CsBlob_Body) -> Self {
        if let MachO_CsBlob_Body::MachO_CsBlob_SuperBlob(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Body::MachO_CsBlob_SuperBlob, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_SuperBlob>> for MachO_CsBlob_Body {
    fn from(v: OptRc<MachO_CsBlob_SuperBlob>) -> Self {
        Self::MachO_CsBlob_SuperBlob(v)
    }
}
impl From<&MachO_CsBlob_Body> for OptRc<MachO_CsBlob_BlobWrapper> {
    fn from(v: &MachO_CsBlob_Body) -> Self {
        if let MachO_CsBlob_Body::MachO_CsBlob_BlobWrapper(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Body::MachO_CsBlob_BlobWrapper, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_BlobWrapper>> for MachO_CsBlob_Body {
    fn from(v: OptRc<MachO_CsBlob_BlobWrapper>) -> Self {
        Self::MachO_CsBlob_BlobWrapper(v)
    }
}
impl From<&MachO_CsBlob_Body> for OptRc<MachO_CsBlob_Entitlements> {
    fn from(v: &MachO_CsBlob_Body) -> Self {
        if let MachO_CsBlob_Body::MachO_CsBlob_Entitlements(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Body::MachO_CsBlob_Entitlements, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Entitlements>> for MachO_CsBlob_Body {
    fn from(v: OptRc<MachO_CsBlob_Entitlements>) -> Self {
        Self::MachO_CsBlob_Entitlements(v)
    }
}
impl From<&MachO_CsBlob_Body> for OptRc<MachO_CsBlob_Requirement> {
    fn from(v: &MachO_CsBlob_Body) -> Self {
        if let MachO_CsBlob_Body::MachO_CsBlob_Requirement(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Body::MachO_CsBlob_Requirement, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Requirement>> for MachO_CsBlob_Body {
    fn from(v: OptRc<MachO_CsBlob_Requirement>) -> Self {
        Self::MachO_CsBlob_Requirement(v)
    }
}
impl From<&MachO_CsBlob_Body> for OptRc<MachO_CsBlob_CodeDirectory> {
    fn from(v: &MachO_CsBlob_Body) -> Self {
        if let MachO_CsBlob_Body::MachO_CsBlob_CodeDirectory(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Body::MachO_CsBlob_CodeDirectory, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_CodeDirectory>> for MachO_CsBlob_Body {
    fn from(v: OptRc<MachO_CsBlob_CodeDirectory>) -> Self {
        Self::MachO_CsBlob_CodeDirectory(v)
    }
}
impl From<&MachO_CsBlob_Body> for OptRc<Asn1Der> {
    fn from(v: &MachO_CsBlob_Body) -> Self {
        if let MachO_CsBlob_Body::Asn1Der(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Body::Asn1Der, got {:?}", v)
    }
}
impl From<OptRc<Asn1Der>> for MachO_CsBlob_Body {
    fn from(v: OptRc<Asn1Der>) -> Self {
        Self::Asn1Der(v)
    }
}
impl KStruct for MachO_CsBlob {
    type Root = MachO;
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
        *self_rc.magic.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.length.borrow_mut() = _io.read_u4be()?.into();
        match *self_rc.magic() {
            MachO_CsBlob_CsMagic::BlobWrapper => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_CsBlob_BlobWrapper>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_CsBlob_CsMagic::CodeDirectory => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_CsBlob_CodeDirectory>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_CsBlob_CsMagic::DerEntitlements => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Asn1Der>(&_t_body_raw_io, None, None)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_CsBlob_CsMagic::DetachedSignature => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_CsBlob_SuperBlob>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_CsBlob_CsMagic::EmbeddedSignature => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_CsBlob_SuperBlob>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_CsBlob_CsMagic::Entitlements => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_CsBlob_Entitlements>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_CsBlob_CsMagic::Requirement => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_CsBlob_Requirement>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_CsBlob_CsMagic::Requirements => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_CsBlob_Requirements>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(((*self_rc.length() as u32) - (8 as u32)) as usize)?.into());
            }
        }
        Ok(())
    }
}
impl MachO_CsBlob {
}
impl MachO_CsBlob {
    pub fn magic(&self) -> Ref<'_, MachO_CsBlob_CsMagic> {
        self.magic.borrow()
    }
}
impl MachO_CsBlob {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl MachO_CsBlob {
    pub fn body(&self) -> Ref<'_, Option<MachO_CsBlob_Body>> {
        self.body.borrow()
    }
}
impl MachO_CsBlob {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MachO_CsBlob {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MachO_CsBlob_CsMagic {
    BlobWrapper,
    Requirement,
    Requirements,
    CodeDirectory,
    EmbeddedSignature,
    DetachedSignature,
    Entitlements,
    DerEntitlements,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_CsBlob_CsMagic {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_CsBlob_CsMagic> {
        match flag {
            4208855809 => Ok(MachO_CsBlob_CsMagic::BlobWrapper),
            4208856064 => Ok(MachO_CsBlob_CsMagic::Requirement),
            4208856065 => Ok(MachO_CsBlob_CsMagic::Requirements),
            4208856066 => Ok(MachO_CsBlob_CsMagic::CodeDirectory),
            4208856256 => Ok(MachO_CsBlob_CsMagic::EmbeddedSignature),
            4208856257 => Ok(MachO_CsBlob_CsMagic::DetachedSignature),
            4208882033 => Ok(MachO_CsBlob_CsMagic::Entitlements),
            4208882034 => Ok(MachO_CsBlob_CsMagic::DerEntitlements),
            _ => Ok(MachO_CsBlob_CsMagic::Unknown(flag)),
        }
    }
}

impl From<&MachO_CsBlob_CsMagic> for i64 {
    fn from(v: &MachO_CsBlob_CsMagic) -> Self {
        match *v {
            MachO_CsBlob_CsMagic::BlobWrapper => 4208855809,
            MachO_CsBlob_CsMagic::Requirement => 4208856064,
            MachO_CsBlob_CsMagic::Requirements => 4208856065,
            MachO_CsBlob_CsMagic::CodeDirectory => 4208856066,
            MachO_CsBlob_CsMagic::EmbeddedSignature => 4208856256,
            MachO_CsBlob_CsMagic::DetachedSignature => 4208856257,
            MachO_CsBlob_CsMagic::Entitlements => 4208882033,
            MachO_CsBlob_CsMagic::DerEntitlements => 4208882034,
            MachO_CsBlob_CsMagic::Unknown(v) => v
        }
    }
}

impl Default for MachO_CsBlob_CsMagic {
    fn default() -> Self { MachO_CsBlob_CsMagic::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_BlobIndex {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_SuperBlob>,
    pub _self: SharedType<Self>,
    type: RefCell<MachO_CsBlob_BlobIndex_CsslotType>,
    offset: RefCell<u32>,
    _io: RefCell<BytesReader>,
    blob_raw: RefCell<Vec<u8>>,
    f_blob: Cell<bool>,
    blob: RefCell<OptRc<MachO_CsBlob>>,
}
impl KStruct for MachO_CsBlob_BlobIndex {
    type Root = MachO;
    type Parent = MachO_CsBlob_SuperBlob;

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
        *self_rc.type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.offset.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl MachO_CsBlob_BlobIndex {
    pub fn blob(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO_CsBlob>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blob.get() {
            return Ok(self.blob.borrow());
        }
        let io = Clone::clone(&*_prc.as_ref().unwrap()._io());
        let _pos = io.pos();
        io.seek(((*self.offset() as u32) - (8 as u32)) as usize)?;
        *self.blob_raw.borrow_mut() = io.read_bytes_full()?.into();
        let blob_raw = self.blob_raw.borrow();
        let _t_blob_raw_io = BytesReader::from(blob_raw.clone());
        let t = Self::read_into::<BytesReader, MachO_CsBlob>(&_t_blob_raw_io, Some(self._root.clone()), None)?.into();
        *self.blob.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.blob.borrow())
    }
}
impl MachO_CsBlob_BlobIndex {
    pub fn type(&self) -> Ref<'_, MachO_CsBlob_BlobIndex_CsslotType> {
        self.type.borrow()
    }
}
impl MachO_CsBlob_BlobIndex {
    pub fn offset(&self) -> Ref<'_, u32> {
        self.offset.borrow()
    }
}
impl MachO_CsBlob_BlobIndex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MachO_CsBlob_BlobIndex {
    pub fn blob_raw(&self) -> Ref<'_, Vec<u8>> {
        self.blob_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MachO_CsBlob_BlobIndex_CsslotType {
    CodeDirectory,
    InfoSlot,
    Requirements,
    ResourceDir,
    Application,
    Entitlements,
    DerEntitlements,
    AlternateCodeDirectories,
    SignatureSlot,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_CsBlob_BlobIndex_CsslotType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_CsBlob_BlobIndex_CsslotType> {
        match flag {
            0 => Ok(MachO_CsBlob_BlobIndex_CsslotType::CodeDirectory),
            1 => Ok(MachO_CsBlob_BlobIndex_CsslotType::InfoSlot),
            2 => Ok(MachO_CsBlob_BlobIndex_CsslotType::Requirements),
            3 => Ok(MachO_CsBlob_BlobIndex_CsslotType::ResourceDir),
            4 => Ok(MachO_CsBlob_BlobIndex_CsslotType::Application),
            5 => Ok(MachO_CsBlob_BlobIndex_CsslotType::Entitlements),
            7 => Ok(MachO_CsBlob_BlobIndex_CsslotType::DerEntitlements),
            4096 => Ok(MachO_CsBlob_BlobIndex_CsslotType::AlternateCodeDirectories),
            65536 => Ok(MachO_CsBlob_BlobIndex_CsslotType::SignatureSlot),
            _ => Ok(MachO_CsBlob_BlobIndex_CsslotType::Unknown(flag)),
        }
    }
}

impl From<&MachO_CsBlob_BlobIndex_CsslotType> for i64 {
    fn from(v: &MachO_CsBlob_BlobIndex_CsslotType) -> Self {
        match *v {
            MachO_CsBlob_BlobIndex_CsslotType::CodeDirectory => 0,
            MachO_CsBlob_BlobIndex_CsslotType::InfoSlot => 1,
            MachO_CsBlob_BlobIndex_CsslotType::Requirements => 2,
            MachO_CsBlob_BlobIndex_CsslotType::ResourceDir => 3,
            MachO_CsBlob_BlobIndex_CsslotType::Application => 4,
            MachO_CsBlob_BlobIndex_CsslotType::Entitlements => 5,
            MachO_CsBlob_BlobIndex_CsslotType::DerEntitlements => 7,
            MachO_CsBlob_BlobIndex_CsslotType::AlternateCodeDirectories => 4096,
            MachO_CsBlob_BlobIndex_CsslotType::SignatureSlot => 65536,
            MachO_CsBlob_BlobIndex_CsslotType::Unknown(v) => v
        }
    }
}

impl Default for MachO_CsBlob_BlobIndex_CsslotType {
    fn default() -> Self { MachO_CsBlob_BlobIndex_CsslotType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_BlobWrapper {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob>,
    pub _self: SharedType<Self>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_BlobWrapper {
    type Root = MachO;
    type Parent = MachO_CsBlob;

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
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl MachO_CsBlob_BlobWrapper {
}
impl MachO_CsBlob_BlobWrapper {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl MachO_CsBlob_BlobWrapper {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_CodeDirectory {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob>,
    pub _self: SharedType<Self>,
    version: RefCell<u32>,
    flags: RefCell<u32>,
    hash_offset: RefCell<u32>,
    ident_offset: RefCell<u32>,
    n_special_slots: RefCell<u32>,
    n_code_slots: RefCell<u32>,
    code_limit: RefCell<u32>,
    hash_size: RefCell<u8>,
    hash_type: RefCell<u8>,
    spare1: RefCell<u8>,
    page_size: RefCell<u8>,
    spare2: RefCell<u32>,
    scatter_offset: RefCell<u32>,
    team_id_offset: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_hashes: Cell<bool>,
    hashes: RefCell<Vec<Vec<u8>>>,
    f_ident: Cell<bool>,
    ident: RefCell<String>,
    f_team_id: Cell<bool>,
    team_id: RefCell<String>,
}
impl KStruct for MachO_CsBlob_CodeDirectory {
    type Root = MachO;
    type Parent = MachO_CsBlob;

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
        *self_rc.version.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.hash_offset.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ident_offset.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.n_special_slots.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.n_code_slots.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.code_limit.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.hash_size.borrow_mut() = _io.read_u1()?.into();
        *self_rc.hash_type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.spare1.borrow_mut() = _io.read_u1()?.into();
        *self_rc.page_size.borrow_mut() = _io.read_u1()?.into();
        *self_rc.spare2.borrow_mut() = _io.read_u4be()?.into();
        if ((*self_rc.version() as i32) >= (131328 as i32)) {
            *self_rc.scatter_offset.borrow_mut() = _io.read_u4be()?.into();
        }
        if ((*self_rc.version() as i32) >= (131584 as i32)) {
            *self_rc.team_id_offset.borrow_mut() = _io.read_u4be()?.into();
        }
        Ok(())
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn hashes(
        &self
    ) -> KResult<Ref<'_, Vec<Vec<u8>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_hashes.get() {
            return Ok(self.hashes.borrow());
        }
        self.f_hashes.set(true);
        let _pos = _io.pos();
        _io.seek(((((*self.hash_offset() as u32) - (8 as u32)) as i32) - (((*self.hash_size() as u32) * (*self.n_special_slots() as u32)) as i32)) as usize)?;
        *self.hashes.borrow_mut() = Vec::new();
        let l_hashes = ((*self.n_special_slots() as u32) + (*self.n_code_slots() as u32));
        for _i in 0..l_hashes {
            self.hashes.borrow_mut().push(_io.read_bytes(*self.hash_size() as usize)?.into());
        }
        _io.seek(_pos)?;
        Ok(self.hashes.borrow())
    }
    pub fn ident(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ident.get() {
            return Ok(self.ident.borrow());
        }
        self.f_ident.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.ident_offset() as u32) - (8 as u32)) as usize)?;
        *self.ident.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        _io.seek(_pos)?;
        Ok(self.ident.borrow())
    }
    pub fn team_id(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_team_id.get() {
            return Ok(self.team_id.borrow());
        }
        self.f_team_id.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.team_id_offset() as u32) - (8 as u32)) as usize)?;
        *self.team_id.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        _io.seek(_pos)?;
        Ok(self.team_id.borrow())
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn hash_offset(&self) -> Ref<'_, u32> {
        self.hash_offset.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn ident_offset(&self) -> Ref<'_, u32> {
        self.ident_offset.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn n_special_slots(&self) -> Ref<'_, u32> {
        self.n_special_slots.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn n_code_slots(&self) -> Ref<'_, u32> {
        self.n_code_slots.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn code_limit(&self) -> Ref<'_, u32> {
        self.code_limit.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn hash_size(&self) -> Ref<'_, u8> {
        self.hash_size.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn hash_type(&self) -> Ref<'_, u8> {
        self.hash_type.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn spare1(&self) -> Ref<'_, u8> {
        self.spare1.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn page_size(&self) -> Ref<'_, u8> {
        self.page_size.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn spare2(&self) -> Ref<'_, u32> {
        self.spare2.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn scatter_offset(&self) -> Ref<'_, u32> {
        self.scatter_offset.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn team_id_offset(&self) -> Ref<'_, u32> {
        self.team_id_offset.borrow()
    }
}
impl MachO_CsBlob_CodeDirectory {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Data {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    length: RefCell<u32>,
    value: RefCell<Vec<u8>>,
    padding: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Data {
    type Root = MachO;
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
        *self_rc.length.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.value.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
        *self_rc.padding.borrow_mut() = _io.read_bytes(modulo(-(*self_rc.length()) as i64, 4 as i64) as usize)?.into();
        Ok(())
    }
}
impl MachO_CsBlob_Data {
}
impl MachO_CsBlob_Data {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl MachO_CsBlob_Data {
    pub fn value(&self) -> Ref<'_, Vec<u8>> {
        self.value.borrow()
    }
}
impl MachO_CsBlob_Data {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl MachO_CsBlob_Data {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Entitlements {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob>,
    pub _self: SharedType<Self>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Entitlements {
    type Root = MachO;
    type Parent = MachO_CsBlob;

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
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl MachO_CsBlob_Entitlements {
}
impl MachO_CsBlob_Entitlements {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl MachO_CsBlob_Entitlements {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Expr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    op: RefCell<MachO_CsBlob_Expr_OpEnum>,
    data: RefCell<Option<MachO_CsBlob_Expr_Data>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum MachO_CsBlob_Expr_Data {
    MachO_CsBlob_Expr_OrExpr(OptRc<MachO_CsBlob_Expr_OrExpr>),
    MachO_CsBlob_Expr_EntitlementFieldExpr(OptRc<MachO_CsBlob_Expr_EntitlementFieldExpr>),
    MachO_CsBlob_Expr_AndExpr(OptRc<MachO_CsBlob_Expr_AndExpr>),
    MachO_CsBlob_Expr_CertFieldExpr(OptRc<MachO_CsBlob_Expr_CertFieldExpr>),
    MachO_CsBlob_Expr_CertSlotExpr(OptRc<MachO_CsBlob_Expr_CertSlotExpr>),
    MachO_CsBlob_Expr_IdentExpr(OptRc<MachO_CsBlob_Expr_IdentExpr>),
    MachO_CsBlob_Expr_AppleGenericAnchorExpr(OptRc<MachO_CsBlob_Expr_AppleGenericAnchorExpr>),
    MachO_CsBlob_Expr_InfoKeyFieldExpr(OptRc<MachO_CsBlob_Expr_InfoKeyFieldExpr>),
    MachO_CsBlob_Expr(OptRc<MachO_CsBlob_Expr>),
    MachO_CsBlob_Expr_AnchorHashExpr(OptRc<MachO_CsBlob_Expr_AnchorHashExpr>),
    MachO_CsBlob_Data(OptRc<MachO_CsBlob_Data>),
    MachO_CsBlob_Expr_CertGenericExpr(OptRc<MachO_CsBlob_Expr_CertGenericExpr>),
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Expr_OrExpr> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_OrExpr(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_OrExpr, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Expr_OrExpr>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Expr_OrExpr>) -> Self {
        Self::MachO_CsBlob_Expr_OrExpr(v)
    }
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Expr_EntitlementFieldExpr> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_EntitlementFieldExpr(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_EntitlementFieldExpr, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Expr_EntitlementFieldExpr>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Expr_EntitlementFieldExpr>) -> Self {
        Self::MachO_CsBlob_Expr_EntitlementFieldExpr(v)
    }
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Expr_AndExpr> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_AndExpr(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_AndExpr, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Expr_AndExpr>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Expr_AndExpr>) -> Self {
        Self::MachO_CsBlob_Expr_AndExpr(v)
    }
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Expr_CertFieldExpr> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_CertFieldExpr(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_CertFieldExpr, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Expr_CertFieldExpr>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Expr_CertFieldExpr>) -> Self {
        Self::MachO_CsBlob_Expr_CertFieldExpr(v)
    }
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Expr_CertSlotExpr> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_CertSlotExpr(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_CertSlotExpr, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Expr_CertSlotExpr>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Expr_CertSlotExpr>) -> Self {
        Self::MachO_CsBlob_Expr_CertSlotExpr(v)
    }
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Expr_IdentExpr> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_IdentExpr(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_IdentExpr, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Expr_IdentExpr>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Expr_IdentExpr>) -> Self {
        Self::MachO_CsBlob_Expr_IdentExpr(v)
    }
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Expr_AppleGenericAnchorExpr> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_AppleGenericAnchorExpr(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_AppleGenericAnchorExpr, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Expr_AppleGenericAnchorExpr>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Expr_AppleGenericAnchorExpr>) -> Self {
        Self::MachO_CsBlob_Expr_AppleGenericAnchorExpr(v)
    }
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Expr_InfoKeyFieldExpr> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_InfoKeyFieldExpr(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_InfoKeyFieldExpr, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Expr_InfoKeyFieldExpr>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Expr_InfoKeyFieldExpr>) -> Self {
        Self::MachO_CsBlob_Expr_InfoKeyFieldExpr(v)
    }
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Expr> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Expr>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Expr>) -> Self {
        Self::MachO_CsBlob_Expr(v)
    }
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Expr_AnchorHashExpr> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_AnchorHashExpr(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_AnchorHashExpr, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Expr_AnchorHashExpr>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Expr_AnchorHashExpr>) -> Self {
        Self::MachO_CsBlob_Expr_AnchorHashExpr(v)
    }
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Data> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Data(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Data, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Data>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Data>) -> Self {
        Self::MachO_CsBlob_Data(v)
    }
}
impl From<&MachO_CsBlob_Expr_Data> for OptRc<MachO_CsBlob_Expr_CertGenericExpr> {
    fn from(v: &MachO_CsBlob_Expr_Data) -> Self {
        if let MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_CertGenericExpr(x) = v {
            return x.clone();
        }
        panic!("expected MachO_CsBlob_Expr_Data::MachO_CsBlob_Expr_CertGenericExpr, got {:?}", v)
    }
}
impl From<OptRc<MachO_CsBlob_Expr_CertGenericExpr>> for MachO_CsBlob_Expr_Data {
    fn from(v: OptRc<MachO_CsBlob_Expr_CertGenericExpr>) -> Self {
        Self::MachO_CsBlob_Expr_CertGenericExpr(v)
    }
}
impl KStruct for MachO_CsBlob_Expr {
    type Root = MachO;
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
        *self_rc.op.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.op() {
            MachO_CsBlob_Expr_OpEnum::AnchorHash => {
                let t = Self::read_into::<_, MachO_CsBlob_Expr_AnchorHashExpr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::AndOp => {
                let t = Self::read_into::<_, MachO_CsBlob_Expr_AndExpr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::AppleGenericAnchor => {
                let t = Self::read_into::<_, MachO_CsBlob_Expr_AppleGenericAnchorExpr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::CdHash => {
                let t = Self::read_into::<_, MachO_CsBlob_Data>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::CertField => {
                let t = Self::read_into::<_, MachO_CsBlob_Expr_CertFieldExpr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::CertGeneric => {
                let t = Self::read_into::<_, MachO_CsBlob_Expr_CertGenericExpr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::EntitlementField => {
                let t = Self::read_into::<_, MachO_CsBlob_Expr_EntitlementFieldExpr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::Ident => {
                let t = Self::read_into::<_, MachO_CsBlob_Expr_IdentExpr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::InfoKeyField => {
                let t = Self::read_into::<_, MachO_CsBlob_Expr_InfoKeyFieldExpr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::InfoKeyValue => {
                let t = Self::read_into::<_, MachO_CsBlob_Data>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::NotOp => {
                let t = Self::read_into::<_, MachO_CsBlob_Expr>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::OrOp => {
                let t = Self::read_into::<_, MachO_CsBlob_Expr_OrExpr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            MachO_CsBlob_Expr_OpEnum::TrustedCert => {
                let t = Self::read_into::<_, MachO_CsBlob_Expr_CertSlotExpr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl MachO_CsBlob_Expr {
}
impl MachO_CsBlob_Expr {
    pub fn op(&self) -> Ref<'_, MachO_CsBlob_Expr_OpEnum> {
        self.op.borrow()
    }
}
impl MachO_CsBlob_Expr {
    pub fn data(&self) -> Ref<'_, Option<MachO_CsBlob_Expr_Data>> {
        self.data.borrow()
    }
}
impl MachO_CsBlob_Expr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MachO_CsBlob_Expr_CertSlot {
    LeftCert,
    AnchorCert,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_CsBlob_Expr_CertSlot {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_CsBlob_Expr_CertSlot> {
        match flag {
            0 => Ok(MachO_CsBlob_Expr_CertSlot::LeftCert),
            4294967295 => Ok(MachO_CsBlob_Expr_CertSlot::AnchorCert),
            _ => Ok(MachO_CsBlob_Expr_CertSlot::Unknown(flag)),
        }
    }
}

impl From<&MachO_CsBlob_Expr_CertSlot> for i64 {
    fn from(v: &MachO_CsBlob_Expr_CertSlot) -> Self {
        match *v {
            MachO_CsBlob_Expr_CertSlot::LeftCert => 0,
            MachO_CsBlob_Expr_CertSlot::AnchorCert => 4294967295,
            MachO_CsBlob_Expr_CertSlot::Unknown(v) => v
        }
    }
}

impl Default for MachO_CsBlob_Expr_CertSlot {
    fn default() -> Self { MachO_CsBlob_Expr_CertSlot::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MachO_CsBlob_Expr_OpEnum {
    False,
    True,
    Ident,
    AppleAnchor,
    AnchorHash,
    InfoKeyValue,
    AndOp,
    OrOp,
    CdHash,
    NotOp,
    InfoKeyField,
    CertField,
    TrustedCert,
    TrustedCerts,
    CertGeneric,
    AppleGenericAnchor,
    EntitlementField,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_CsBlob_Expr_OpEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_CsBlob_Expr_OpEnum> {
        match flag {
            0 => Ok(MachO_CsBlob_Expr_OpEnum::False),
            1 => Ok(MachO_CsBlob_Expr_OpEnum::True),
            2 => Ok(MachO_CsBlob_Expr_OpEnum::Ident),
            3 => Ok(MachO_CsBlob_Expr_OpEnum::AppleAnchor),
            4 => Ok(MachO_CsBlob_Expr_OpEnum::AnchorHash),
            5 => Ok(MachO_CsBlob_Expr_OpEnum::InfoKeyValue),
            6 => Ok(MachO_CsBlob_Expr_OpEnum::AndOp),
            7 => Ok(MachO_CsBlob_Expr_OpEnum::OrOp),
            8 => Ok(MachO_CsBlob_Expr_OpEnum::CdHash),
            9 => Ok(MachO_CsBlob_Expr_OpEnum::NotOp),
            10 => Ok(MachO_CsBlob_Expr_OpEnum::InfoKeyField),
            11 => Ok(MachO_CsBlob_Expr_OpEnum::CertField),
            12 => Ok(MachO_CsBlob_Expr_OpEnum::TrustedCert),
            13 => Ok(MachO_CsBlob_Expr_OpEnum::TrustedCerts),
            14 => Ok(MachO_CsBlob_Expr_OpEnum::CertGeneric),
            15 => Ok(MachO_CsBlob_Expr_OpEnum::AppleGenericAnchor),
            16 => Ok(MachO_CsBlob_Expr_OpEnum::EntitlementField),
            _ => Ok(MachO_CsBlob_Expr_OpEnum::Unknown(flag)),
        }
    }
}

impl From<&MachO_CsBlob_Expr_OpEnum> for i64 {
    fn from(v: &MachO_CsBlob_Expr_OpEnum) -> Self {
        match *v {
            MachO_CsBlob_Expr_OpEnum::False => 0,
            MachO_CsBlob_Expr_OpEnum::True => 1,
            MachO_CsBlob_Expr_OpEnum::Ident => 2,
            MachO_CsBlob_Expr_OpEnum::AppleAnchor => 3,
            MachO_CsBlob_Expr_OpEnum::AnchorHash => 4,
            MachO_CsBlob_Expr_OpEnum::InfoKeyValue => 5,
            MachO_CsBlob_Expr_OpEnum::AndOp => 6,
            MachO_CsBlob_Expr_OpEnum::OrOp => 7,
            MachO_CsBlob_Expr_OpEnum::CdHash => 8,
            MachO_CsBlob_Expr_OpEnum::NotOp => 9,
            MachO_CsBlob_Expr_OpEnum::InfoKeyField => 10,
            MachO_CsBlob_Expr_OpEnum::CertField => 11,
            MachO_CsBlob_Expr_OpEnum::TrustedCert => 12,
            MachO_CsBlob_Expr_OpEnum::TrustedCerts => 13,
            MachO_CsBlob_Expr_OpEnum::CertGeneric => 14,
            MachO_CsBlob_Expr_OpEnum::AppleGenericAnchor => 15,
            MachO_CsBlob_Expr_OpEnum::EntitlementField => 16,
            MachO_CsBlob_Expr_OpEnum::Unknown(v) => v
        }
    }
}

impl Default for MachO_CsBlob_Expr_OpEnum {
    fn default() -> Self { MachO_CsBlob_Expr_OpEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Expr_AnchorHashExpr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_Expr>,
    pub _self: SharedType<Self>,
    cert_slot: RefCell<MachO_CsBlob_Expr_CertSlot>,
    data: RefCell<OptRc<MachO_CsBlob_Data>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Expr_AnchorHashExpr {
    type Root = MachO;
    type Parent = MachO_CsBlob_Expr;

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
        *self_rc.cert_slot.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        let t = Self::read_into::<_, MachO_CsBlob_Data>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.data.borrow_mut() = Some(t);
        Ok(())
    }
}
impl MachO_CsBlob_Expr_AnchorHashExpr {
}
impl MachO_CsBlob_Expr_AnchorHashExpr {
    pub fn cert_slot(&self) -> Ref<'_, MachO_CsBlob_Expr_CertSlot> {
        self.cert_slot.borrow()
    }
}
impl MachO_CsBlob_Expr_AnchorHashExpr {
    pub fn data(&self) -> Ref<'_, OptRc<MachO_CsBlob_Data>> {
        self.data.borrow()
    }
}
impl MachO_CsBlob_Expr_AnchorHashExpr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Expr_AndExpr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_Expr>,
    pub _self: SharedType<Self>,
    left: RefCell<OptRc<MachO_CsBlob_Expr>>,
    right: RefCell<OptRc<MachO_CsBlob_Expr>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Expr_AndExpr {
    type Root = MachO;
    type Parent = MachO_CsBlob_Expr;

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
        let t = Self::read_into::<_, MachO_CsBlob_Expr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.left.borrow_mut() = t;
        let t = Self::read_into::<_, MachO_CsBlob_Expr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.right.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_CsBlob_Expr_AndExpr {
}
impl MachO_CsBlob_Expr_AndExpr {
    pub fn left(&self) -> Ref<'_, OptRc<MachO_CsBlob_Expr>> {
        self.left.borrow()
    }
}
impl MachO_CsBlob_Expr_AndExpr {
    pub fn right(&self) -> Ref<'_, OptRc<MachO_CsBlob_Expr>> {
        self.right.borrow()
    }
}
impl MachO_CsBlob_Expr_AndExpr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Expr_AppleGenericAnchorExpr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_Expr>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<String>,
}
impl KStruct for MachO_CsBlob_Expr_AppleGenericAnchorExpr {
    type Root = MachO;
    type Parent = MachO_CsBlob_Expr;

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
impl MachO_CsBlob_Expr_AppleGenericAnchorExpr {
    pub fn value(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = "anchor apple generic".to_string();
        Ok(self.value.borrow())
    }
}
impl MachO_CsBlob_Expr_AppleGenericAnchorExpr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Expr_CertFieldExpr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_Expr>,
    pub _self: SharedType<Self>,
    cert_slot: RefCell<MachO_CsBlob_Expr_CertSlot>,
    data: RefCell<OptRc<MachO_CsBlob_Data>>,
    match: RefCell<OptRc<MachO_CsBlob_Match>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Expr_CertFieldExpr {
    type Root = MachO;
    type Parent = MachO_CsBlob_Expr;

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
        *self_rc.cert_slot.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        let t = Self::read_into::<_, MachO_CsBlob_Data>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.data.borrow_mut() = Some(t);
        let t = Self::read_into::<_, MachO_CsBlob_Match>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.match.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_CsBlob_Expr_CertFieldExpr {
}
impl MachO_CsBlob_Expr_CertFieldExpr {
    pub fn cert_slot(&self) -> Ref<'_, MachO_CsBlob_Expr_CertSlot> {
        self.cert_slot.borrow()
    }
}
impl MachO_CsBlob_Expr_CertFieldExpr {
    pub fn data(&self) -> Ref<'_, OptRc<MachO_CsBlob_Data>> {
        self.data.borrow()
    }
}
impl MachO_CsBlob_Expr_CertFieldExpr {
    pub fn match(&self) -> Ref<'_, OptRc<MachO_CsBlob_Match>> {
        self.match.borrow()
    }
}
impl MachO_CsBlob_Expr_CertFieldExpr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Expr_CertGenericExpr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_Expr>,
    pub _self: SharedType<Self>,
    cert_slot: RefCell<MachO_CsBlob_Expr_CertSlot>,
    data: RefCell<OptRc<MachO_CsBlob_Data>>,
    match: RefCell<OptRc<MachO_CsBlob_Match>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Expr_CertGenericExpr {
    type Root = MachO;
    type Parent = MachO_CsBlob_Expr;

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
        *self_rc.cert_slot.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        let t = Self::read_into::<_, MachO_CsBlob_Data>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.data.borrow_mut() = t;
        let t = Self::read_into::<_, MachO_CsBlob_Match>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.match.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_CsBlob_Expr_CertGenericExpr {
}
impl MachO_CsBlob_Expr_CertGenericExpr {
    pub fn cert_slot(&self) -> Ref<'_, MachO_CsBlob_Expr_CertSlot> {
        self.cert_slot.borrow()
    }
}
impl MachO_CsBlob_Expr_CertGenericExpr {
    pub fn data(&self) -> Ref<'_, OptRc<MachO_CsBlob_Data>> {
        self.data.borrow()
    }
}
impl MachO_CsBlob_Expr_CertGenericExpr {
    pub fn match(&self) -> Ref<'_, OptRc<MachO_CsBlob_Match>> {
        self.match.borrow()
    }
}
impl MachO_CsBlob_Expr_CertGenericExpr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Expr_CertSlotExpr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_Expr>,
    pub _self: SharedType<Self>,
    value: RefCell<MachO_CsBlob_Expr_CertSlot>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Expr_CertSlotExpr {
    type Root = MachO;
    type Parent = MachO_CsBlob_Expr;

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
        *self_rc.value.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        Ok(())
    }
}
impl MachO_CsBlob_Expr_CertSlotExpr {
}
impl MachO_CsBlob_Expr_CertSlotExpr {
    pub fn value(&self) -> Ref<'_, MachO_CsBlob_Expr_CertSlot> {
        self.value.borrow()
    }
}
impl MachO_CsBlob_Expr_CertSlotExpr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Expr_EntitlementFieldExpr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_Expr>,
    pub _self: SharedType<Self>,
    data: RefCell<OptRc<MachO_CsBlob_Data>>,
    match: RefCell<OptRc<MachO_CsBlob_Match>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Expr_EntitlementFieldExpr {
    type Root = MachO;
    type Parent = MachO_CsBlob_Expr;

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
        let t = Self::read_into::<_, MachO_CsBlob_Data>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.data.borrow_mut() = t;
        let t = Self::read_into::<_, MachO_CsBlob_Match>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.match.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_CsBlob_Expr_EntitlementFieldExpr {
}
impl MachO_CsBlob_Expr_EntitlementFieldExpr {
    pub fn data(&self) -> Ref<'_, OptRc<MachO_CsBlob_Data>> {
        self.data.borrow()
    }
}
impl MachO_CsBlob_Expr_EntitlementFieldExpr {
    pub fn match(&self) -> Ref<'_, OptRc<MachO_CsBlob_Match>> {
        self.match.borrow()
    }
}
impl MachO_CsBlob_Expr_EntitlementFieldExpr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Expr_IdentExpr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_Expr>,
    pub _self: SharedType<Self>,
    identifier: RefCell<OptRc<MachO_CsBlob_Data>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Expr_IdentExpr {
    type Root = MachO;
    type Parent = MachO_CsBlob_Expr;

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
        let t = Self::read_into::<_, MachO_CsBlob_Data>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.identifier.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_CsBlob_Expr_IdentExpr {
}
impl MachO_CsBlob_Expr_IdentExpr {
    pub fn identifier(&self) -> Ref<'_, OptRc<MachO_CsBlob_Data>> {
        self.identifier.borrow()
    }
}
impl MachO_CsBlob_Expr_IdentExpr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Expr_InfoKeyFieldExpr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_Expr>,
    pub _self: SharedType<Self>,
    data: RefCell<OptRc<MachO_CsBlob_Data>>,
    match: RefCell<OptRc<MachO_CsBlob_Match>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Expr_InfoKeyFieldExpr {
    type Root = MachO;
    type Parent = MachO_CsBlob_Expr;

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
        let t = Self::read_into::<_, MachO_CsBlob_Data>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.data.borrow_mut() = t;
        let t = Self::read_into::<_, MachO_CsBlob_Match>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.match.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_CsBlob_Expr_InfoKeyFieldExpr {
}
impl MachO_CsBlob_Expr_InfoKeyFieldExpr {
    pub fn data(&self) -> Ref<'_, OptRc<MachO_CsBlob_Data>> {
        self.data.borrow()
    }
}
impl MachO_CsBlob_Expr_InfoKeyFieldExpr {
    pub fn match(&self) -> Ref<'_, OptRc<MachO_CsBlob_Match>> {
        self.match.borrow()
    }
}
impl MachO_CsBlob_Expr_InfoKeyFieldExpr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Expr_OrExpr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_Expr>,
    pub _self: SharedType<Self>,
    left: RefCell<OptRc<MachO_CsBlob_Expr>>,
    right: RefCell<OptRc<MachO_CsBlob_Expr>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Expr_OrExpr {
    type Root = MachO;
    type Parent = MachO_CsBlob_Expr;

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
        let t = Self::read_into::<_, MachO_CsBlob_Expr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.left.borrow_mut() = t;
        let t = Self::read_into::<_, MachO_CsBlob_Expr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.right.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_CsBlob_Expr_OrExpr {
}
impl MachO_CsBlob_Expr_OrExpr {
    pub fn left(&self) -> Ref<'_, OptRc<MachO_CsBlob_Expr>> {
        self.left.borrow()
    }
}
impl MachO_CsBlob_Expr_OrExpr {
    pub fn right(&self) -> Ref<'_, OptRc<MachO_CsBlob_Expr>> {
        self.right.borrow()
    }
}
impl MachO_CsBlob_Expr_OrExpr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Match {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    match_op: RefCell<MachO_CsBlob_Match_Op>,
    data: RefCell<OptRc<MachO_CsBlob_Data>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Match {
    type Root = MachO;
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
        *self_rc.match_op.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        if *self_rc.match_op() != MachO_CsBlob_Match_Op::Exists {
            let t = Self::read_into::<_, MachO_CsBlob_Data>(&*_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.data.borrow_mut() = t;
        }
        Ok(())
    }
}
impl MachO_CsBlob_Match {
}
impl MachO_CsBlob_Match {
    pub fn match_op(&self) -> Ref<'_, MachO_CsBlob_Match_Op> {
        self.match_op.borrow()
    }
}
impl MachO_CsBlob_Match {
    pub fn data(&self) -> Ref<'_, OptRc<MachO_CsBlob_Data>> {
        self.data.borrow()
    }
}
impl MachO_CsBlob_Match {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MachO_CsBlob_Match_Op {
    Exists,
    Equal,
    Contains,
    BeginsWith,
    EndsWith,
    LessThan,
    GreaterThan,
    LessEqual,
    GreaterEqual,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_CsBlob_Match_Op {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_CsBlob_Match_Op> {
        match flag {
            0 => Ok(MachO_CsBlob_Match_Op::Exists),
            1 => Ok(MachO_CsBlob_Match_Op::Equal),
            2 => Ok(MachO_CsBlob_Match_Op::Contains),
            3 => Ok(MachO_CsBlob_Match_Op::BeginsWith),
            4 => Ok(MachO_CsBlob_Match_Op::EndsWith),
            5 => Ok(MachO_CsBlob_Match_Op::LessThan),
            6 => Ok(MachO_CsBlob_Match_Op::GreaterThan),
            7 => Ok(MachO_CsBlob_Match_Op::LessEqual),
            8 => Ok(MachO_CsBlob_Match_Op::GreaterEqual),
            _ => Ok(MachO_CsBlob_Match_Op::Unknown(flag)),
        }
    }
}

impl From<&MachO_CsBlob_Match_Op> for i64 {
    fn from(v: &MachO_CsBlob_Match_Op) -> Self {
        match *v {
            MachO_CsBlob_Match_Op::Exists => 0,
            MachO_CsBlob_Match_Op::Equal => 1,
            MachO_CsBlob_Match_Op::Contains => 2,
            MachO_CsBlob_Match_Op::BeginsWith => 3,
            MachO_CsBlob_Match_Op::EndsWith => 4,
            MachO_CsBlob_Match_Op::LessThan => 5,
            MachO_CsBlob_Match_Op::GreaterThan => 6,
            MachO_CsBlob_Match_Op::LessEqual => 7,
            MachO_CsBlob_Match_Op::GreaterEqual => 8,
            MachO_CsBlob_Match_Op::Unknown(v) => v
        }
    }
}

impl Default for MachO_CsBlob_Match_Op {
    fn default() -> Self { MachO_CsBlob_Match_Op::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Requirement {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob>,
    pub _self: SharedType<Self>,
    kind: RefCell<u32>,
    expr: RefCell<OptRc<MachO_CsBlob_Expr>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Requirement {
    type Root = MachO;
    type Parent = MachO_CsBlob;

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
        *self_rc.kind.borrow_mut() = _io.read_u4be()?.into();
        let t = Self::read_into::<_, MachO_CsBlob_Expr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.expr.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_CsBlob_Requirement {
}
impl MachO_CsBlob_Requirement {
    pub fn kind(&self) -> Ref<'_, u32> {
        self.kind.borrow()
    }
}
impl MachO_CsBlob_Requirement {
    pub fn expr(&self) -> Ref<'_, OptRc<MachO_CsBlob_Expr>> {
        self.expr.borrow()
    }
}
impl MachO_CsBlob_Requirement {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_Requirements {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob>,
    pub _self: SharedType<Self>,
    count: RefCell<u32>,
    items: RefCell<Vec<OptRc<MachO_CsBlob_RequirementsBlobIndex>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_Requirements {
    type Root = MachO;
    type Parent = MachO_CsBlob;

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
        *self_rc.count.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.items.borrow_mut() = Vec::new();
        let l_items = *self_rc.count();
        for _i in 0..l_items {
            let t = Self::read_into::<_, MachO_CsBlob_RequirementsBlobIndex>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.items.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl MachO_CsBlob_Requirements {
}
impl MachO_CsBlob_Requirements {
    pub fn count(&self) -> Ref<'_, u32> {
        self.count.borrow()
    }
}
impl MachO_CsBlob_Requirements {
    pub fn items(&self) -> Ref<'_, Vec<OptRc<MachO_CsBlob_RequirementsBlobIndex>>> {
        self.items.borrow()
    }
}
impl MachO_CsBlob_Requirements {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_RequirementsBlobIndex {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob_Requirements>,
    pub _self: SharedType<Self>,
    type: RefCell<MachO_CsBlob_RequirementsBlobIndex_RequirementType>,
    offset: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<OptRc<MachO_CsBlob>>,
}
impl KStruct for MachO_CsBlob_RequirementsBlobIndex {
    type Root = MachO;
    type Parent = MachO_CsBlob_Requirements;

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
        *self_rc.type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.offset.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl MachO_CsBlob_RequirementsBlobIndex {
    pub fn value(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO_CsBlob>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*self.offset() as u32) - (8 as u32)) as usize)?;
        let t = Self::read_into::<_, MachO_CsBlob>(&*_io, Some(self._root.clone()), None)?.into();
        *self.value.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.value.borrow())
    }
}
impl MachO_CsBlob_RequirementsBlobIndex {
    pub fn type(&self) -> Ref<'_, MachO_CsBlob_RequirementsBlobIndex_RequirementType> {
        self.type.borrow()
    }
}
impl MachO_CsBlob_RequirementsBlobIndex {
    pub fn offset(&self) -> Ref<'_, u32> {
        self.offset.borrow()
    }
}
impl MachO_CsBlob_RequirementsBlobIndex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MachO_CsBlob_RequirementsBlobIndex_RequirementType {
    Host,
    Guest,
    Designated,
    Library,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_CsBlob_RequirementsBlobIndex_RequirementType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_CsBlob_RequirementsBlobIndex_RequirementType> {
        match flag {
            1 => Ok(MachO_CsBlob_RequirementsBlobIndex_RequirementType::Host),
            2 => Ok(MachO_CsBlob_RequirementsBlobIndex_RequirementType::Guest),
            3 => Ok(MachO_CsBlob_RequirementsBlobIndex_RequirementType::Designated),
            4 => Ok(MachO_CsBlob_RequirementsBlobIndex_RequirementType::Library),
            _ => Ok(MachO_CsBlob_RequirementsBlobIndex_RequirementType::Unknown(flag)),
        }
    }
}

impl From<&MachO_CsBlob_RequirementsBlobIndex_RequirementType> for i64 {
    fn from(v: &MachO_CsBlob_RequirementsBlobIndex_RequirementType) -> Self {
        match *v {
            MachO_CsBlob_RequirementsBlobIndex_RequirementType::Host => 1,
            MachO_CsBlob_RequirementsBlobIndex_RequirementType::Guest => 2,
            MachO_CsBlob_RequirementsBlobIndex_RequirementType::Designated => 3,
            MachO_CsBlob_RequirementsBlobIndex_RequirementType::Library => 4,
            MachO_CsBlob_RequirementsBlobIndex_RequirementType::Unknown(v) => v
        }
    }
}

impl Default for MachO_CsBlob_RequirementsBlobIndex_RequirementType {
    fn default() -> Self { MachO_CsBlob_RequirementsBlobIndex_RequirementType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MachO_CsBlob_SuperBlob {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_CsBlob>,
    pub _self: SharedType<Self>,
    count: RefCell<u32>,
    blobs: RefCell<Vec<OptRc<MachO_CsBlob_BlobIndex>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_CsBlob_SuperBlob {
    type Root = MachO;
    type Parent = MachO_CsBlob;

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
        *self_rc.count.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.blobs.borrow_mut() = Vec::new();
        let l_blobs = *self_rc.count();
        for _i in 0..l_blobs {
            let t = Self::read_into::<_, MachO_CsBlob_BlobIndex>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.blobs.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl MachO_CsBlob_SuperBlob {
}
impl MachO_CsBlob_SuperBlob {
    pub fn count(&self) -> Ref<'_, u32> {
        self.count.borrow()
    }
}
impl MachO_CsBlob_SuperBlob {
    pub fn blobs(&self) -> Ref<'_, Vec<OptRc<MachO_CsBlob_BlobIndex>>> {
        self.blobs.borrow()
    }
}
impl MachO_CsBlob_SuperBlob {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_DyldInfoCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    rebase_off: RefCell<u32>,
    rebase_size: RefCell<u32>,
    bind_off: RefCell<u32>,
    bind_size: RefCell<u32>,
    weak_bind_off: RefCell<u32>,
    weak_bind_size: RefCell<u32>,
    lazy_bind_off: RefCell<u32>,
    lazy_bind_size: RefCell<u32>,
    export_off: RefCell<u32>,
    export_size: RefCell<u32>,
    _io: RefCell<BytesReader>,
    bind_raw: RefCell<Vec<u8>>,
    exports_raw: RefCell<Vec<u8>>,
    lazy_bind_raw: RefCell<Vec<u8>>,
    rebase_raw: RefCell<Vec<u8>>,
    weak_bind_raw: RefCell<Vec<u8>>,
    f_bind: Cell<bool>,
    bind: RefCell<OptRc<MachO_DyldInfoCommand_BindData>>,
    f_exports: Cell<bool>,
    exports: RefCell<OptRc<MachO_DyldInfoCommand_ExportNode>>,
    f_lazy_bind: Cell<bool>,
    lazy_bind: RefCell<OptRc<MachO_DyldInfoCommand_BindData>>,
    f_rebase: Cell<bool>,
    rebase: RefCell<OptRc<MachO_DyldInfoCommand_RebaseData>>,
    f_weak_bind: Cell<bool>,
    weak_bind: RefCell<OptRc<MachO_DyldInfoCommand_BindData>>,
}
impl KStruct for MachO_DyldInfoCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.rebase_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.rebase_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.bind_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.bind_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.weak_bind_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.weak_bind_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.lazy_bind_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.lazy_bind_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.export_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.export_size.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MachO_DyldInfoCommand {
    pub fn bind(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO_DyldInfoCommand_BindData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bind.get() {
            return Ok(self.bind.borrow());
        }
        if ((*self.bind_size() as u32) != (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.bind_off() as usize)?;
            *self.bind_raw.borrow_mut() = io.read_bytes(*self.bind_size() as usize)?.into();
            let bind_raw = self.bind_raw.borrow();
            let _t_bind_raw_io = BytesReader::from(bind_raw.clone());
            let t = Self::read_into::<BytesReader, MachO_DyldInfoCommand_BindData>(&_t_bind_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.bind.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.bind.borrow())
    }
    pub fn exports(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO_DyldInfoCommand_ExportNode>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_exports.get() {
            return Ok(self.exports.borrow());
        }
        if ((*self.export_size() as u32) != (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.export_off() as usize)?;
            *self.exports_raw.borrow_mut() = io.read_bytes(*self.export_size() as usize)?.into();
            let exports_raw = self.exports_raw.borrow();
            let _t_exports_raw_io = BytesReader::from(exports_raw.clone());
            let t = Self::read_into::<BytesReader, MachO_DyldInfoCommand_ExportNode>(&_t_exports_raw_io, Some(self._root.clone()), None)?.into();
            *self.exports.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.exports.borrow())
    }
    pub fn lazy_bind(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO_DyldInfoCommand_BindData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_lazy_bind.get() {
            return Ok(self.lazy_bind.borrow());
        }
        if ((*self.lazy_bind_size() as u32) != (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.lazy_bind_off() as usize)?;
            *self.lazy_bind_raw.borrow_mut() = io.read_bytes(*self.lazy_bind_size() as usize)?.into();
            let lazy_bind_raw = self.lazy_bind_raw.borrow();
            let _t_lazy_bind_raw_io = BytesReader::from(lazy_bind_raw.clone());
            let t = Self::read_into::<BytesReader, MachO_DyldInfoCommand_BindData>(&_t_lazy_bind_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.lazy_bind.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.lazy_bind.borrow())
    }
    pub fn rebase(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO_DyldInfoCommand_RebaseData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_rebase.get() {
            return Ok(self.rebase.borrow());
        }
        if ((*self.rebase_size() as u32) != (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.rebase_off() as usize)?;
            *self.rebase_raw.borrow_mut() = io.read_bytes(*self.rebase_size() as usize)?.into();
            let rebase_raw = self.rebase_raw.borrow();
            let _t_rebase_raw_io = BytesReader::from(rebase_raw.clone());
            let t = Self::read_into::<BytesReader, MachO_DyldInfoCommand_RebaseData>(&_t_rebase_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.rebase.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.rebase.borrow())
    }
    pub fn weak_bind(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO_DyldInfoCommand_BindData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_weak_bind.get() {
            return Ok(self.weak_bind.borrow());
        }
        if ((*self.weak_bind_size() as u32) != (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.weak_bind_off() as usize)?;
            *self.weak_bind_raw.borrow_mut() = io.read_bytes(*self.weak_bind_size() as usize)?.into();
            let weak_bind_raw = self.weak_bind_raw.borrow();
            let _t_weak_bind_raw_io = BytesReader::from(weak_bind_raw.clone());
            let t = Self::read_into::<BytesReader, MachO_DyldInfoCommand_BindData>(&_t_weak_bind_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.weak_bind.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.weak_bind.borrow())
    }
}
impl MachO_DyldInfoCommand {
    pub fn rebase_off(&self) -> Ref<'_, u32> {
        self.rebase_off.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn rebase_size(&self) -> Ref<'_, u32> {
        self.rebase_size.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn bind_off(&self) -> Ref<'_, u32> {
        self.bind_off.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn bind_size(&self) -> Ref<'_, u32> {
        self.bind_size.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn weak_bind_off(&self) -> Ref<'_, u32> {
        self.weak_bind_off.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn weak_bind_size(&self) -> Ref<'_, u32> {
        self.weak_bind_size.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn lazy_bind_off(&self) -> Ref<'_, u32> {
        self.lazy_bind_off.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn lazy_bind_size(&self) -> Ref<'_, u32> {
        self.lazy_bind_size.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn export_off(&self) -> Ref<'_, u32> {
        self.export_off.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn export_size(&self) -> Ref<'_, u32> {
        self.export_size.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn bind_raw(&self) -> Ref<'_, Vec<u8>> {
        self.bind_raw.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn exports_raw(&self) -> Ref<'_, Vec<u8>> {
        self.exports_raw.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn lazy_bind_raw(&self) -> Ref<'_, Vec<u8>> {
        self.lazy_bind_raw.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn rebase_raw(&self) -> Ref<'_, Vec<u8>> {
        self.rebase_raw.borrow()
    }
}
impl MachO_DyldInfoCommand {
    pub fn weak_bind_raw(&self) -> Ref<'_, Vec<u8>> {
        self.weak_bind_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MachO_DyldInfoCommand_BindOpcode {
    Done,
    SetDylibOrdinalImmediate,
    SetDylibOrdinalUleb,
    SetDylibSpecialImmediate,
    SetSymbolTrailingFlagsImmediate,
    SetTypeImmediate,
    SetAppendSleb,
    SetSegmentAndOffsetUleb,
    AddAddressUleb,
    DoBind,
    DoBindAddAddressUleb,
    DoBindAddAddressImmediateScaled,
    DoBindUlebTimesSkippingUleb,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_DyldInfoCommand_BindOpcode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_DyldInfoCommand_BindOpcode> {
        match flag {
            0 => Ok(MachO_DyldInfoCommand_BindOpcode::Done),
            16 => Ok(MachO_DyldInfoCommand_BindOpcode::SetDylibOrdinalImmediate),
            32 => Ok(MachO_DyldInfoCommand_BindOpcode::SetDylibOrdinalUleb),
            48 => Ok(MachO_DyldInfoCommand_BindOpcode::SetDylibSpecialImmediate),
            64 => Ok(MachO_DyldInfoCommand_BindOpcode::SetSymbolTrailingFlagsImmediate),
            80 => Ok(MachO_DyldInfoCommand_BindOpcode::SetTypeImmediate),
            96 => Ok(MachO_DyldInfoCommand_BindOpcode::SetAppendSleb),
            112 => Ok(MachO_DyldInfoCommand_BindOpcode::SetSegmentAndOffsetUleb),
            128 => Ok(MachO_DyldInfoCommand_BindOpcode::AddAddressUleb),
            144 => Ok(MachO_DyldInfoCommand_BindOpcode::DoBind),
            160 => Ok(MachO_DyldInfoCommand_BindOpcode::DoBindAddAddressUleb),
            176 => Ok(MachO_DyldInfoCommand_BindOpcode::DoBindAddAddressImmediateScaled),
            192 => Ok(MachO_DyldInfoCommand_BindOpcode::DoBindUlebTimesSkippingUleb),
            _ => Ok(MachO_DyldInfoCommand_BindOpcode::Unknown(flag)),
        }
    }
}

impl From<&MachO_DyldInfoCommand_BindOpcode> for i64 {
    fn from(v: &MachO_DyldInfoCommand_BindOpcode) -> Self {
        match *v {
            MachO_DyldInfoCommand_BindOpcode::Done => 0,
            MachO_DyldInfoCommand_BindOpcode::SetDylibOrdinalImmediate => 16,
            MachO_DyldInfoCommand_BindOpcode::SetDylibOrdinalUleb => 32,
            MachO_DyldInfoCommand_BindOpcode::SetDylibSpecialImmediate => 48,
            MachO_DyldInfoCommand_BindOpcode::SetSymbolTrailingFlagsImmediate => 64,
            MachO_DyldInfoCommand_BindOpcode::SetTypeImmediate => 80,
            MachO_DyldInfoCommand_BindOpcode::SetAppendSleb => 96,
            MachO_DyldInfoCommand_BindOpcode::SetSegmentAndOffsetUleb => 112,
            MachO_DyldInfoCommand_BindOpcode::AddAddressUleb => 128,
            MachO_DyldInfoCommand_BindOpcode::DoBind => 144,
            MachO_DyldInfoCommand_BindOpcode::DoBindAddAddressUleb => 160,
            MachO_DyldInfoCommand_BindOpcode::DoBindAddAddressImmediateScaled => 176,
            MachO_DyldInfoCommand_BindOpcode::DoBindUlebTimesSkippingUleb => 192,
            MachO_DyldInfoCommand_BindOpcode::Unknown(v) => v
        }
    }
}

impl Default for MachO_DyldInfoCommand_BindOpcode {
    fn default() -> Self { MachO_DyldInfoCommand_BindOpcode::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MachO_DyldInfoCommand_BindData {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_DyldInfoCommand>,
    pub _self: SharedType<Self>,
    items: RefCell<Vec<OptRc<MachO_DyldInfoCommand_BindItem>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_DyldInfoCommand_BindData {
    type Root = MachO;
    type Parent = MachO_DyldInfoCommand;

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
        *self_rc.items.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, MachO_DyldInfoCommand_BindItem>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.items.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl MachO_DyldInfoCommand_BindData {
}
impl MachO_DyldInfoCommand_BindData {
    pub fn items(&self) -> Ref<'_, Vec<OptRc<MachO_DyldInfoCommand_BindItem>>> {
        self.items.borrow()
    }
}
impl MachO_DyldInfoCommand_BindData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_DyldInfoCommand_BindItem {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_DyldInfoCommand_BindData>,
    pub _self: SharedType<Self>,
    opcode_and_immediate: RefCell<u8>,
    uleb: RefCell<OptRc<MachO_Uleb128>>,
    skip: RefCell<OptRc<MachO_Uleb128>>,
    symbol: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_immediate: Cell<bool>,
    immediate: RefCell<i32>,
    f_opcode: Cell<bool>,
    opcode: RefCell<MachO_DyldInfoCommand_BindOpcode>,
}
impl KStruct for MachO_DyldInfoCommand_BindItem {
    type Root = MachO;
    type Parent = MachO_DyldInfoCommand_BindData;

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
        *self_rc.opcode_and_immediate.borrow_mut() = _io.read_u1()?.into();
        if  ((*self_rc.opcode()? == MachO_DyldInfoCommand_BindOpcode::SetDylibOrdinalUleb) || (*self_rc.opcode()? == MachO_DyldInfoCommand_BindOpcode::SetAppendSleb) || (*self_rc.opcode()? == MachO_DyldInfoCommand_BindOpcode::SetSegmentAndOffsetUleb) || (*self_rc.opcode()? == MachO_DyldInfoCommand_BindOpcode::AddAddressUleb) || (*self_rc.opcode()? == MachO_DyldInfoCommand_BindOpcode::DoBindAddAddressUleb) || (*self_rc.opcode()? == MachO_DyldInfoCommand_BindOpcode::DoBindUlebTimesSkippingUleb))  {
            let t = Self::read_into::<_, MachO_Uleb128>(&*_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.uleb.borrow_mut() = t;
        }
        if *self_rc.opcode()? == MachO_DyldInfoCommand_BindOpcode::DoBindUlebTimesSkippingUleb {
            let t = Self::read_into::<_, MachO_Uleb128>(&*_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.skip.borrow_mut() = t;
        }
        if *self_rc.opcode()? == MachO_DyldInfoCommand_BindOpcode::SetSymbolTrailingFlagsImmediate {
            *self_rc.symbol.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        }
        Ok(())
    }
}
impl MachO_DyldInfoCommand_BindItem {
    pub fn immediate(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_immediate.get() {
            return Ok(self.immediate.borrow());
        }
        self.f_immediate.set(true);
        *self.immediate.borrow_mut() = (((*self.opcode_and_immediate() as u8) & (15 as u8))) as i32;
        Ok(self.immediate.borrow())
    }
    pub fn opcode(
        &self
    ) -> KResult<Ref<'_, MachO_DyldInfoCommand_BindOpcode>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_opcode.get() {
            return Ok(self.opcode.borrow());
        }
        self.f_opcode.set(true);
        *self.opcode.borrow_mut() = (((*self.opcode_and_immediate() as u8) & (240 as u8)) as i64).try_into()?;
        Ok(self.opcode.borrow())
    }
}
impl MachO_DyldInfoCommand_BindItem {
    pub fn opcode_and_immediate(&self) -> Ref<'_, u8> {
        self.opcode_and_immediate.borrow()
    }
}
impl MachO_DyldInfoCommand_BindItem {
    pub fn uleb(&self) -> Ref<'_, OptRc<MachO_Uleb128>> {
        self.uleb.borrow()
    }
}
impl MachO_DyldInfoCommand_BindItem {
    pub fn skip(&self) -> Ref<'_, OptRc<MachO_Uleb128>> {
        self.skip.borrow()
    }
}
impl MachO_DyldInfoCommand_BindItem {
    pub fn symbol(&self) -> Ref<'_, String> {
        self.symbol.borrow()
    }
}
impl MachO_DyldInfoCommand_BindItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_DyldInfoCommand_ExportNode {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    terminal_size: RefCell<OptRc<MachO_Uleb128>>,
    children_count: RefCell<u8>,
    children: RefCell<Vec<OptRc<MachO_DyldInfoCommand_ExportNode_Child>>>,
    terminal: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_DyldInfoCommand_ExportNode {
    type Root = MachO;
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
        let t = Self::read_into::<_, MachO_Uleb128>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.terminal_size.borrow_mut() = t;
        *self_rc.children_count.borrow_mut() = _io.read_u1()?.into();
        *self_rc.children.borrow_mut() = Vec::new();
        let l_children = *self_rc.children_count();
        for _i in 0..l_children {
            let t = Self::read_into::<_, MachO_DyldInfoCommand_ExportNode_Child>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.children.borrow_mut().push(t);
        }
        *self_rc.terminal.borrow_mut() = _io.read_bytes(*self_rc.terminal_size().value()? as usize)?.into();
        Ok(())
    }
}
impl MachO_DyldInfoCommand_ExportNode {
}
impl MachO_DyldInfoCommand_ExportNode {
    pub fn terminal_size(&self) -> Ref<'_, OptRc<MachO_Uleb128>> {
        self.terminal_size.borrow()
    }
}
impl MachO_DyldInfoCommand_ExportNode {
    pub fn children_count(&self) -> Ref<'_, u8> {
        self.children_count.borrow()
    }
}
impl MachO_DyldInfoCommand_ExportNode {
    pub fn children(&self) -> Ref<'_, Vec<OptRc<MachO_DyldInfoCommand_ExportNode_Child>>> {
        self.children.borrow()
    }
}
impl MachO_DyldInfoCommand_ExportNode {
    pub fn terminal(&self) -> Ref<'_, Vec<u8>> {
        self.terminal.borrow()
    }
}
impl MachO_DyldInfoCommand_ExportNode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_DyldInfoCommand_ExportNode_Child {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_DyldInfoCommand_ExportNode>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    node_offset: RefCell<OptRc<MachO_Uleb128>>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<OptRc<MachO_DyldInfoCommand_ExportNode>>,
}
impl KStruct for MachO_DyldInfoCommand_ExportNode_Child {
    type Root = MachO;
    type Parent = MachO_DyldInfoCommand_ExportNode;

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
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        let t = Self::read_into::<_, MachO_Uleb128>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.node_offset.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_DyldInfoCommand_ExportNode_Child {
    pub fn value(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO_DyldInfoCommand_ExportNode>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.node_offset().value()? as usize)?;
        let t = Self::read_into::<_, MachO_DyldInfoCommand_ExportNode>(&*_io, Some(self._root.clone()), None)?.into();
        *self.value.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.value.borrow())
    }
}
impl MachO_DyldInfoCommand_ExportNode_Child {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl MachO_DyldInfoCommand_ExportNode_Child {
    pub fn node_offset(&self) -> Ref<'_, OptRc<MachO_Uleb128>> {
        self.node_offset.borrow()
    }
}
impl MachO_DyldInfoCommand_ExportNode_Child {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_DyldInfoCommand_RebaseData {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_DyldInfoCommand>,
    pub _self: SharedType<Self>,
    items: RefCell<Vec<OptRc<MachO_DyldInfoCommand_RebaseData_RebaseItem>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_DyldInfoCommand_RebaseData {
    type Root = MachO;
    type Parent = MachO_DyldInfoCommand;

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
        *self_rc.items.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, MachO_DyldInfoCommand_RebaseData_RebaseItem>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.items.borrow_mut().push(t);
                let _t_items = self_rc.items.borrow();
                let _tmpa = _t_items.last().unwrap();
                _i += 1;
                let x = !(*_tmpa.opcode()? == MachO_DyldInfoCommand_RebaseData_Opcode::Done);
                x
            } {}
        }
        Ok(())
    }
}
impl MachO_DyldInfoCommand_RebaseData {
}
impl MachO_DyldInfoCommand_RebaseData {
    pub fn items(&self) -> Ref<'_, Vec<OptRc<MachO_DyldInfoCommand_RebaseData_RebaseItem>>> {
        self.items.borrow()
    }
}
impl MachO_DyldInfoCommand_RebaseData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MachO_DyldInfoCommand_RebaseData_Opcode {
    Done,
    SetTypeImmediate,
    SetSegmentAndOffsetUleb,
    AddAddressUleb,
    AddAddressImmediateScaled,
    DoRebaseImmediateTimes,
    DoRebaseUlebTimes,
    DoRebaseAddAddressUleb,
    DoRebaseUlebTimesSkippingUleb,
    Unknown(i64),
}

impl TryFrom<i64> for MachO_DyldInfoCommand_RebaseData_Opcode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MachO_DyldInfoCommand_RebaseData_Opcode> {
        match flag {
            0 => Ok(MachO_DyldInfoCommand_RebaseData_Opcode::Done),
            16 => Ok(MachO_DyldInfoCommand_RebaseData_Opcode::SetTypeImmediate),
            32 => Ok(MachO_DyldInfoCommand_RebaseData_Opcode::SetSegmentAndOffsetUleb),
            48 => Ok(MachO_DyldInfoCommand_RebaseData_Opcode::AddAddressUleb),
            64 => Ok(MachO_DyldInfoCommand_RebaseData_Opcode::AddAddressImmediateScaled),
            80 => Ok(MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseImmediateTimes),
            96 => Ok(MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseUlebTimes),
            112 => Ok(MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseAddAddressUleb),
            128 => Ok(MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseUlebTimesSkippingUleb),
            _ => Ok(MachO_DyldInfoCommand_RebaseData_Opcode::Unknown(flag)),
        }
    }
}

impl From<&MachO_DyldInfoCommand_RebaseData_Opcode> for i64 {
    fn from(v: &MachO_DyldInfoCommand_RebaseData_Opcode) -> Self {
        match *v {
            MachO_DyldInfoCommand_RebaseData_Opcode::Done => 0,
            MachO_DyldInfoCommand_RebaseData_Opcode::SetTypeImmediate => 16,
            MachO_DyldInfoCommand_RebaseData_Opcode::SetSegmentAndOffsetUleb => 32,
            MachO_DyldInfoCommand_RebaseData_Opcode::AddAddressUleb => 48,
            MachO_DyldInfoCommand_RebaseData_Opcode::AddAddressImmediateScaled => 64,
            MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseImmediateTimes => 80,
            MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseUlebTimes => 96,
            MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseAddAddressUleb => 112,
            MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseUlebTimesSkippingUleb => 128,
            MachO_DyldInfoCommand_RebaseData_Opcode::Unknown(v) => v
        }
    }
}

impl Default for MachO_DyldInfoCommand_RebaseData_Opcode {
    fn default() -> Self { MachO_DyldInfoCommand_RebaseData_Opcode::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MachO_DyldInfoCommand_RebaseData_RebaseItem {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_DyldInfoCommand_RebaseData>,
    pub _self: SharedType<Self>,
    opcode_and_immediate: RefCell<u8>,
    uleb: RefCell<OptRc<MachO_Uleb128>>,
    skip: RefCell<OptRc<MachO_Uleb128>>,
    _io: RefCell<BytesReader>,
    f_immediate: Cell<bool>,
    immediate: RefCell<i32>,
    f_opcode: Cell<bool>,
    opcode: RefCell<MachO_DyldInfoCommand_RebaseData_Opcode>,
}
impl KStruct for MachO_DyldInfoCommand_RebaseData_RebaseItem {
    type Root = MachO;
    type Parent = MachO_DyldInfoCommand_RebaseData;

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
        *self_rc.opcode_and_immediate.borrow_mut() = _io.read_u1()?.into();
        if  ((*self_rc.opcode()? == MachO_DyldInfoCommand_RebaseData_Opcode::SetSegmentAndOffsetUleb) || (*self_rc.opcode()? == MachO_DyldInfoCommand_RebaseData_Opcode::AddAddressUleb) || (*self_rc.opcode()? == MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseUlebTimes) || (*self_rc.opcode()? == MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseAddAddressUleb) || (*self_rc.opcode()? == MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseUlebTimesSkippingUleb))  {
            let t = Self::read_into::<_, MachO_Uleb128>(&*_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.uleb.borrow_mut() = t;
        }
        if *self_rc.opcode()? == MachO_DyldInfoCommand_RebaseData_Opcode::DoRebaseUlebTimesSkippingUleb {
            let t = Self::read_into::<_, MachO_Uleb128>(&*_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.skip.borrow_mut() = t;
        }
        Ok(())
    }
}
impl MachO_DyldInfoCommand_RebaseData_RebaseItem {
    pub fn immediate(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_immediate.get() {
            return Ok(self.immediate.borrow());
        }
        self.f_immediate.set(true);
        *self.immediate.borrow_mut() = (((*self.opcode_and_immediate() as u8) & (15 as u8))) as i32;
        Ok(self.immediate.borrow())
    }
    pub fn opcode(
        &self
    ) -> KResult<Ref<'_, MachO_DyldInfoCommand_RebaseData_Opcode>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_opcode.get() {
            return Ok(self.opcode.borrow());
        }
        self.f_opcode.set(true);
        *self.opcode.borrow_mut() = (((*self.opcode_and_immediate() as u8) & (240 as u8)) as i64).try_into()?;
        Ok(self.opcode.borrow())
    }
}
impl MachO_DyldInfoCommand_RebaseData_RebaseItem {
    pub fn opcode_and_immediate(&self) -> Ref<'_, u8> {
        self.opcode_and_immediate.borrow()
    }
}
impl MachO_DyldInfoCommand_RebaseData_RebaseItem {
    pub fn uleb(&self) -> Ref<'_, OptRc<MachO_Uleb128>> {
        self.uleb.borrow()
    }
}
impl MachO_DyldInfoCommand_RebaseData_RebaseItem {
    pub fn skip(&self) -> Ref<'_, OptRc<MachO_Uleb128>> {
        self.skip.borrow()
    }
}
impl MachO_DyldInfoCommand_RebaseData_RebaseItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_DylibCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    name_offset: RefCell<u32>,
    timestamp: RefCell<u32>,
    current_version: RefCell<u32>,
    compatibility_version: RefCell<u32>,
    name: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_DylibCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.name_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.timestamp.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.current_version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.compatibility_version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl MachO_DylibCommand {
}
impl MachO_DylibCommand {
    pub fn name_offset(&self) -> Ref<'_, u32> {
        self.name_offset.borrow()
    }
}
impl MachO_DylibCommand {
    pub fn timestamp(&self) -> Ref<'_, u32> {
        self.timestamp.borrow()
    }
}
impl MachO_DylibCommand {
    pub fn current_version(&self) -> Ref<'_, u32> {
        self.current_version.borrow()
    }
}
impl MachO_DylibCommand {
    pub fn compatibility_version(&self) -> Ref<'_, u32> {
        self.compatibility_version.borrow()
    }
}
impl MachO_DylibCommand {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl MachO_DylibCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_DylinkerCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    name: RefCell<OptRc<MachO_LcStr>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_DylinkerCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        let t = Self::read_into::<_, MachO_LcStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.name.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_DylinkerCommand {
}
impl MachO_DylinkerCommand {
    pub fn name(&self) -> Ref<'_, OptRc<MachO_LcStr>> {
        self.name.borrow()
    }
}
impl MachO_DylinkerCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_DysymtabCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    i_local_sym: RefCell<u32>,
    n_local_sym: RefCell<u32>,
    i_ext_def_sym: RefCell<u32>,
    n_ext_def_sym: RefCell<u32>,
    i_undef_sym: RefCell<u32>,
    n_undef_sym: RefCell<u32>,
    toc_off: RefCell<u32>,
    n_toc: RefCell<u32>,
    mod_tab_off: RefCell<u32>,
    n_mod_tab: RefCell<u32>,
    ext_ref_sym_off: RefCell<u32>,
    n_ext_ref_syms: RefCell<u32>,
    indirect_sym_off: RefCell<u32>,
    n_indirect_syms: RefCell<u32>,
    ext_rel_off: RefCell<u32>,
    n_ext_rel: RefCell<u32>,
    loc_rel_off: RefCell<u32>,
    n_loc_rel: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_indirect_symbols: Cell<bool>,
    indirect_symbols: RefCell<Vec<u32>>,
}
impl KStruct for MachO_DysymtabCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.i_local_sym.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_local_sym.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.i_ext_def_sym.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_ext_def_sym.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.i_undef_sym.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_undef_sym.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.toc_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_toc.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.mod_tab_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_mod_tab.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ext_ref_sym_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_ext_ref_syms.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.indirect_sym_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_indirect_syms.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ext_rel_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_ext_rel.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.loc_rel_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_loc_rel.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MachO_DysymtabCommand {
    pub fn indirect_symbols(
        &self
    ) -> KResult<Ref<'_, Vec<u32>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_indirect_symbols.get() {
            return Ok(self.indirect_symbols.borrow());
        }
        self.f_indirect_symbols.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.indirect_sym_off() as usize)?;
        *self.indirect_symbols.borrow_mut() = Vec::new();
        let l_indirect_symbols = *self.n_indirect_syms();
        for _i in 0..l_indirect_symbols {
            self.indirect_symbols.borrow_mut().push(io.read_u4le()?.into());
        }
        io.seek(_pos)?;
        Ok(self.indirect_symbols.borrow())
    }
}
impl MachO_DysymtabCommand {
    pub fn i_local_sym(&self) -> Ref<'_, u32> {
        self.i_local_sym.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn n_local_sym(&self) -> Ref<'_, u32> {
        self.n_local_sym.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn i_ext_def_sym(&self) -> Ref<'_, u32> {
        self.i_ext_def_sym.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn n_ext_def_sym(&self) -> Ref<'_, u32> {
        self.n_ext_def_sym.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn i_undef_sym(&self) -> Ref<'_, u32> {
        self.i_undef_sym.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn n_undef_sym(&self) -> Ref<'_, u32> {
        self.n_undef_sym.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn toc_off(&self) -> Ref<'_, u32> {
        self.toc_off.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn n_toc(&self) -> Ref<'_, u32> {
        self.n_toc.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn mod_tab_off(&self) -> Ref<'_, u32> {
        self.mod_tab_off.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn n_mod_tab(&self) -> Ref<'_, u32> {
        self.n_mod_tab.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn ext_ref_sym_off(&self) -> Ref<'_, u32> {
        self.ext_ref_sym_off.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn n_ext_ref_syms(&self) -> Ref<'_, u32> {
        self.n_ext_ref_syms.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn indirect_sym_off(&self) -> Ref<'_, u32> {
        self.indirect_sym_off.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn n_indirect_syms(&self) -> Ref<'_, u32> {
        self.n_indirect_syms.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn ext_rel_off(&self) -> Ref<'_, u32> {
        self.ext_rel_off.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn n_ext_rel(&self) -> Ref<'_, u32> {
        self.n_ext_rel.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn loc_rel_off(&self) -> Ref<'_, u32> {
        self.loc_rel_off.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn n_loc_rel(&self) -> Ref<'_, u32> {
        self.n_loc_rel.borrow()
    }
}
impl MachO_DysymtabCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_EncryptionInfoCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    cryptoff: RefCell<u32>,
    cryptsize: RefCell<u32>,
    cryptid: RefCell<u32>,
    pad: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_EncryptionInfoCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.cryptoff.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.cryptsize.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.cryptid.borrow_mut() = _io.read_u4le()?.into();
        if  ((*_r.magic() == MachO_MagicType::MachoBeX64) || (*_r.magic() == MachO_MagicType::MachoLeX64))  {
            *self_rc.pad.borrow_mut() = _io.read_u4le()?.into();
        }
        Ok(())
    }
}
impl MachO_EncryptionInfoCommand {
}
impl MachO_EncryptionInfoCommand {
    pub fn cryptoff(&self) -> Ref<'_, u32> {
        self.cryptoff.borrow()
    }
}
impl MachO_EncryptionInfoCommand {
    pub fn cryptsize(&self) -> Ref<'_, u32> {
        self.cryptsize.borrow()
    }
}
impl MachO_EncryptionInfoCommand {
    pub fn cryptid(&self) -> Ref<'_, u32> {
        self.cryptid.borrow()
    }
}
impl MachO_EncryptionInfoCommand {
    pub fn pad(&self) -> Ref<'_, u32> {
        self.pad.borrow()
    }
}
impl MachO_EncryptionInfoCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_EntryPointCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    entry_off: RefCell<u64>,
    stack_size: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_EntryPointCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.entry_off.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.stack_size.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl MachO_EntryPointCommand {
}
impl MachO_EntryPointCommand {
    pub fn entry_off(&self) -> Ref<'_, u64> {
        self.entry_off.borrow()
    }
}
impl MachO_EntryPointCommand {
    pub fn stack_size(&self) -> Ref<'_, u64> {
        self.stack_size.borrow()
    }
}
impl MachO_EntryPointCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_LcStr {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    length: RefCell<u32>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_LcStr {
    type Root = MachO;
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
        *self_rc.length.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.value.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl MachO_LcStr {
}
impl MachO_LcStr {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl MachO_LcStr {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl MachO_LcStr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_LinkeditDataCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    data_off: RefCell<u32>,
    data_size: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_LinkeditDataCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.data_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data_size.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MachO_LinkeditDataCommand {
}
impl MachO_LinkeditDataCommand {
    pub fn data_off(&self) -> Ref<'_, u32> {
        self.data_off.borrow()
    }
}
impl MachO_LinkeditDataCommand {
    pub fn data_size(&self) -> Ref<'_, u32> {
        self.data_size.borrow()
    }
}
impl MachO_LinkeditDataCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_LinkerOptionCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    num_strings: RefCell<u32>,
    strings: RefCell<Vec<String>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_LinkerOptionCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.num_strings.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.strings.borrow_mut() = Vec::new();
        let l_strings = *self_rc.num_strings();
        for _i in 0..l_strings {
            self_rc.strings.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?);
        }
        Ok(())
    }
}
impl MachO_LinkerOptionCommand {
}
impl MachO_LinkerOptionCommand {
    pub fn num_strings(&self) -> Ref<'_, u32> {
        self.num_strings.borrow()
    }
}
impl MachO_LinkerOptionCommand {
    pub fn strings(&self) -> Ref<'_, Vec<String>> {
        self.strings.borrow()
    }
}
impl MachO_LinkerOptionCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_LoadCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO>,
    pub _self: SharedType<Self>,
    type: RefCell<MachO_LoadCommandType>,
    size: RefCell<u32>,
    body: RefCell<Option<MachO_LoadCommand_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum MachO_LoadCommand_Body {
    MachO_RoutinesCommand64(OptRc<MachO_RoutinesCommand64>),
    MachO_CodeSignatureCommand(OptRc<MachO_CodeSignatureCommand>),
    MachO_EntryPointCommand(OptRc<MachO_EntryPointCommand>),
    MachO_SourceVersionCommand(OptRc<MachO_SourceVersionCommand>),
    MachO_SubCommand(OptRc<MachO_SubCommand>),
    Bytes(Vec<u8>),
    MachO_EncryptionInfoCommand(OptRc<MachO_EncryptionInfoCommand>),
    MachO_UuidCommand(OptRc<MachO_UuidCommand>),
    MachO_SymtabCommand(OptRc<MachO_SymtabCommand>),
    MachO_SegmentCommand64(OptRc<MachO_SegmentCommand64>),
    MachO_RpathCommand(OptRc<MachO_RpathCommand>),
    MachO_TwolevelHintsCommand(OptRc<MachO_TwolevelHintsCommand>),
    MachO_VersionMinCommand(OptRc<MachO_VersionMinCommand>),
    MachO_SegmentCommand(OptRc<MachO_SegmentCommand>),
    MachO_LinkerOptionCommand(OptRc<MachO_LinkerOptionCommand>),
    MachO_DylinkerCommand(OptRc<MachO_DylinkerCommand>),
    MachO_DylibCommand(OptRc<MachO_DylibCommand>),
    MachO_DyldInfoCommand(OptRc<MachO_DyldInfoCommand>),
    MachO_RoutinesCommand(OptRc<MachO_RoutinesCommand>),
    MachO_BuildVersionCommand(OptRc<MachO_BuildVersionCommand>),
    MachO_DysymtabCommand(OptRc<MachO_DysymtabCommand>),
    MachO_LinkeditDataCommand(OptRc<MachO_LinkeditDataCommand>),
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_RoutinesCommand64> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_RoutinesCommand64(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_RoutinesCommand64, got {:?}", v)
    }
}
impl From<OptRc<MachO_RoutinesCommand64>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_RoutinesCommand64>) -> Self {
        Self::MachO_RoutinesCommand64(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_CodeSignatureCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_CodeSignatureCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_CodeSignatureCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_CodeSignatureCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_CodeSignatureCommand>) -> Self {
        Self::MachO_CodeSignatureCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_EntryPointCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_EntryPointCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_EntryPointCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_EntryPointCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_EntryPointCommand>) -> Self {
        Self::MachO_EntryPointCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_SourceVersionCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_SourceVersionCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_SourceVersionCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_SourceVersionCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_SourceVersionCommand>) -> Self {
        Self::MachO_SourceVersionCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_SubCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_SubCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_SubCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_SubCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_SubCommand>) -> Self {
        Self::MachO_SubCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for Vec<u8> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for MachO_LoadCommand_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_EncryptionInfoCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_EncryptionInfoCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_EncryptionInfoCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_EncryptionInfoCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_EncryptionInfoCommand>) -> Self {
        Self::MachO_EncryptionInfoCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_UuidCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_UuidCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_UuidCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_UuidCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_UuidCommand>) -> Self {
        Self::MachO_UuidCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_SymtabCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_SymtabCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_SymtabCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_SymtabCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_SymtabCommand>) -> Self {
        Self::MachO_SymtabCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_SegmentCommand64> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_SegmentCommand64(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_SegmentCommand64, got {:?}", v)
    }
}
impl From<OptRc<MachO_SegmentCommand64>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_SegmentCommand64>) -> Self {
        Self::MachO_SegmentCommand64(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_RpathCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_RpathCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_RpathCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_RpathCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_RpathCommand>) -> Self {
        Self::MachO_RpathCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_TwolevelHintsCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_TwolevelHintsCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_TwolevelHintsCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_TwolevelHintsCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_TwolevelHintsCommand>) -> Self {
        Self::MachO_TwolevelHintsCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_VersionMinCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_VersionMinCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_VersionMinCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_VersionMinCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_VersionMinCommand>) -> Self {
        Self::MachO_VersionMinCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_SegmentCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_SegmentCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_SegmentCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_SegmentCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_SegmentCommand>) -> Self {
        Self::MachO_SegmentCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_LinkerOptionCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_LinkerOptionCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_LinkerOptionCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_LinkerOptionCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_LinkerOptionCommand>) -> Self {
        Self::MachO_LinkerOptionCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_DylinkerCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_DylinkerCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_DylinkerCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_DylinkerCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_DylinkerCommand>) -> Self {
        Self::MachO_DylinkerCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_DylibCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_DylibCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_DylibCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_DylibCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_DylibCommand>) -> Self {
        Self::MachO_DylibCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_DyldInfoCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_DyldInfoCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_DyldInfoCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_DyldInfoCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_DyldInfoCommand>) -> Self {
        Self::MachO_DyldInfoCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_RoutinesCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_RoutinesCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_RoutinesCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_RoutinesCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_RoutinesCommand>) -> Self {
        Self::MachO_RoutinesCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_BuildVersionCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_BuildVersionCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_BuildVersionCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_BuildVersionCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_BuildVersionCommand>) -> Self {
        Self::MachO_BuildVersionCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_DysymtabCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_DysymtabCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_DysymtabCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_DysymtabCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_DysymtabCommand>) -> Self {
        Self::MachO_DysymtabCommand(v)
    }
}
impl From<&MachO_LoadCommand_Body> for OptRc<MachO_LinkeditDataCommand> {
    fn from(v: &MachO_LoadCommand_Body) -> Self {
        if let MachO_LoadCommand_Body::MachO_LinkeditDataCommand(x) = v {
            return x.clone();
        }
        panic!("expected MachO_LoadCommand_Body::MachO_LinkeditDataCommand, got {:?}", v)
    }
}
impl From<OptRc<MachO_LinkeditDataCommand>> for MachO_LoadCommand_Body {
    fn from(v: OptRc<MachO_LinkeditDataCommand>) -> Self {
        Self::MachO_LinkeditDataCommand(v)
    }
}
impl KStruct for MachO_LoadCommand {
    type Root = MachO;
    type Parent = MachO;

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
        *self_rc.type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        match *self_rc.type() {
            MachO_LoadCommandType::BuildVersion => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_BuildVersionCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::CodeSignature => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_CodeSignatureCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::DataInCode => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_LinkeditDataCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::DyldEnvironment => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DylinkerCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::DyldInfo => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DyldInfoCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::DyldInfoOnly => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DyldInfoCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::DylibCodeSignDrs => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_LinkeditDataCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::Dysymtab => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DysymtabCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::EncryptionInfo => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_EncryptionInfoCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::EncryptionInfo64 => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_EncryptionInfoCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::FunctionStarts => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_LinkeditDataCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::IdDylib => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DylibCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::IdDylinker => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DylinkerCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::LazyLoadDylib => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DylibCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::LinkerOptimizationHint => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_LinkeditDataCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::LinkerOption => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_LinkerOptionCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::LoadDylib => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DylibCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::LoadDylinker => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DylinkerCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::LoadUpwardDylib => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DylibCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::LoadWeakDylib => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DylibCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::Main => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_EntryPointCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::ReexportDylib => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_DylibCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::Routines => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_RoutinesCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::Routines64 => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_RoutinesCommand64>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::Rpath => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_RpathCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::Segment => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::Segment64 => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::SegmentSplitInfo => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_LinkeditDataCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::SourceVersion => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SourceVersionCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::SubClient => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SubCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::SubFramework => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SubCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::SubLibrary => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SubCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::SubUmbrella => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SubCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::Symtab => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SymtabCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::TwolevelHints => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_TwolevelHintsCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::Uuid => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_UuidCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::VersionMinIphoneos => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_VersionMinCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::VersionMinMacosx => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_VersionMinCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::VersionMinTvos => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_VersionMinCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            MachO_LoadCommandType::VersionMinWatchos => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_VersionMinCommand>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(((*self_rc.size() as u32) - (8 as u32)) as usize)?.into());
            }
        }
        Ok(())
    }
}
impl MachO_LoadCommand {
}
impl MachO_LoadCommand {
    pub fn type(&self) -> Ref<'_, MachO_LoadCommandType> {
        self.type.borrow()
    }
}
impl MachO_LoadCommand {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl MachO_LoadCommand {
    pub fn body(&self) -> Ref<'_, Option<MachO_LoadCommand_Body>> {
        self.body.borrow()
    }
}
impl MachO_LoadCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MachO_LoadCommand {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_MachHeader {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO>,
    pub _self: SharedType<Self>,
    cputype: RefCell<MachO_CpuType>,
    cpusubtype: RefCell<u32>,
    filetype: RefCell<MachO_FileType>,
    ncmds: RefCell<u32>,
    sizeofcmds: RefCell<u32>,
    flags: RefCell<u32>,
    reserved: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_flags_obj: Cell<bool>,
    flags_obj: RefCell<OptRc<MachO_MachoFlags>>,
}
impl KStruct for MachO_MachHeader {
    type Root = MachO;
    type Parent = MachO;

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
        *self_rc.cputype.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.cpusubtype.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.filetype.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.ncmds.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.sizeofcmds.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        if  ((*_r.magic() == MachO_MagicType::MachoBeX64) || (*_r.magic() == MachO_MagicType::MachoLeX64))  {
            *self_rc.reserved.borrow_mut() = _io.read_u4le()?.into();
        }
        Ok(())
    }
}
impl MachO_MachHeader {
    pub fn flags_obj(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO_MachoFlags>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flags_obj.get() {
            return Ok(self.flags_obj.borrow());
        }
        let f = |t : &mut MachO_MachoFlags| Ok(t.set_params((*self.flags()).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, MachO_MachoFlags>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
        *self.flags_obj.borrow_mut() = t;
        Ok(self.flags_obj.borrow())
    }
}
impl MachO_MachHeader {
    pub fn cputype(&self) -> Ref<'_, MachO_CpuType> {
        self.cputype.borrow()
    }
}
impl MachO_MachHeader {
    pub fn cpusubtype(&self) -> Ref<'_, u32> {
        self.cpusubtype.borrow()
    }
}
impl MachO_MachHeader {
    pub fn filetype(&self) -> Ref<'_, MachO_FileType> {
        self.filetype.borrow()
    }
}
impl MachO_MachHeader {
    pub fn ncmds(&self) -> Ref<'_, u32> {
        self.ncmds.borrow()
    }
}
impl MachO_MachHeader {
    pub fn sizeofcmds(&self) -> Ref<'_, u32> {
        self.sizeofcmds.borrow()
    }
}
impl MachO_MachHeader {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl MachO_MachHeader {
    pub fn reserved(&self) -> Ref<'_, u32> {
        self.reserved.borrow()
    }
}
impl MachO_MachHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_MachoFlags {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_MachHeader>,
    pub _self: SharedType<Self>,
    value: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_all_mods_bound: Cell<bool>,
    all_mods_bound: RefCell<bool>,
    f_allow_stack_execution: Cell<bool>,
    allow_stack_execution: RefCell<bool>,
    f_app_extension_safe: Cell<bool>,
    app_extension_safe: RefCell<bool>,
    f_bind_at_load: Cell<bool>,
    bind_at_load: RefCell<bool>,
    f_binds_to_weak: Cell<bool>,
    binds_to_weak: RefCell<bool>,
    f_canonical: Cell<bool>,
    canonical: RefCell<bool>,
    f_dead_strippable_dylib: Cell<bool>,
    dead_strippable_dylib: RefCell<bool>,
    f_dyld_link: Cell<bool>,
    dyld_link: RefCell<bool>,
    f_force_flat: Cell<bool>,
    force_flat: RefCell<bool>,
    f_has_tlv_descriptors: Cell<bool>,
    has_tlv_descriptors: RefCell<bool>,
    f_incr_link: Cell<bool>,
    incr_link: RefCell<bool>,
    f_lazy_init: Cell<bool>,
    lazy_init: RefCell<bool>,
    f_no_fix_prebinding: Cell<bool>,
    no_fix_prebinding: RefCell<bool>,
    f_no_heap_execution: Cell<bool>,
    no_heap_execution: RefCell<bool>,
    f_no_multi_defs: Cell<bool>,
    no_multi_defs: RefCell<bool>,
    f_no_reexported_dylibs: Cell<bool>,
    no_reexported_dylibs: RefCell<bool>,
    f_no_undefs: Cell<bool>,
    no_undefs: RefCell<bool>,
    f_pie: Cell<bool>,
    pie: RefCell<bool>,
    f_prebindable: Cell<bool>,
    prebindable: RefCell<bool>,
    f_prebound: Cell<bool>,
    prebound: RefCell<bool>,
    f_root_safe: Cell<bool>,
    root_safe: RefCell<bool>,
    f_setuid_safe: Cell<bool>,
    setuid_safe: RefCell<bool>,
    f_split_segs: Cell<bool>,
    split_segs: RefCell<bool>,
    f_subsections_via_symbols: Cell<bool>,
    subsections_via_symbols: RefCell<bool>,
    f_two_level: Cell<bool>,
    two_level: RefCell<bool>,
    f_weak_defines: Cell<bool>,
    weak_defines: RefCell<bool>,
}
impl KStruct for MachO_MachoFlags {
    type Root = MachO;
    type Parent = MachO_MachHeader;

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
impl MachO_MachoFlags {
    pub fn value(&self) -> Ref<'_, u32> {
        self.value.borrow()
    }
}
impl MachO_MachoFlags {
    pub fn set_params(&mut self, value: u32) {
        *self.value.borrow_mut() = value;
    }
}
impl MachO_MachoFlags {

    /**
     * indicates that this binary binds to all two-level namespace modules of its dependent libraries. only used when MH_PREBINDABLE and MH_TWOLEVEL are both set.
     */
    pub fn all_mods_bound(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_all_mods_bound.get() {
            return Ok(self.all_mods_bound.borrow());
        }
        self.f_all_mods_bound.set(true);
        *self.all_mods_bound.borrow_mut() = (((((*self.value() as i32) & (4096 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.all_mods_bound.borrow())
    }

    /**
     * When this bit is set, all stacks in the task will be given stack execution privilege.  Only used in MH_EXECUTE filetypes.
     */
    pub fn allow_stack_execution(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_allow_stack_execution.get() {
            return Ok(self.allow_stack_execution.borrow());
        }
        self.f_allow_stack_execution.set(true);
        *self.allow_stack_execution.borrow_mut() = (((((*self.value() as i32) & (131072 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.allow_stack_execution.borrow())
    }
    pub fn app_extension_safe(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_app_extension_safe.get() {
            return Ok(self.app_extension_safe.borrow());
        }
        self.f_app_extension_safe.set(true);
        *self.app_extension_safe.borrow_mut() = (((((*self.value() as i32) & (33554432 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.app_extension_safe.borrow())
    }

    /**
     * the object file's undefined references are bound by the dynamic linker when loaded.
     */
    pub fn bind_at_load(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bind_at_load.get() {
            return Ok(self.bind_at_load.borrow());
        }
        self.f_bind_at_load.set(true);
        *self.bind_at_load.borrow_mut() = (((((*self.value() as u32) & (8 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.bind_at_load.borrow())
    }

    /**
     * the final linked image uses weak symbols
     */
    pub fn binds_to_weak(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_binds_to_weak.get() {
            return Ok(self.binds_to_weak.borrow());
        }
        self.f_binds_to_weak.set(true);
        *self.binds_to_weak.borrow_mut() = (((((*self.value() as i32) & (65536 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.binds_to_weak.borrow())
    }

    /**
     * the binary has been canonicalized via the unprebind operation
     */
    pub fn canonical(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_canonical.get() {
            return Ok(self.canonical.borrow());
        }
        self.f_canonical.set(true);
        *self.canonical.borrow_mut() = (((((*self.value() as i32) & (16384 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.canonical.borrow())
    }
    pub fn dead_strippable_dylib(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_dead_strippable_dylib.get() {
            return Ok(self.dead_strippable_dylib.borrow());
        }
        self.f_dead_strippable_dylib.set(true);
        *self.dead_strippable_dylib.borrow_mut() = (((((*self.value() as i32) & (4194304 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.dead_strippable_dylib.borrow())
    }

    /**
     * the object file is input for the dynamic linker and can't be staticly link edited again
     */
    pub fn dyld_link(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_dyld_link.get() {
            return Ok(self.dyld_link.borrow());
        }
        self.f_dyld_link.set(true);
        *self.dyld_link.borrow_mut() = (((((*self.value() as u32) & (4 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.dyld_link.borrow())
    }

    /**
     * the executable is forcing all images to use flat name space bindings
     */
    pub fn force_flat(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_force_flat.get() {
            return Ok(self.force_flat.borrow());
        }
        self.f_force_flat.set(true);
        *self.force_flat.borrow_mut() = (((((*self.value() as i32) & (256 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.force_flat.borrow())
    }
    pub fn has_tlv_descriptors(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_tlv_descriptors.get() {
            return Ok(self.has_tlv_descriptors.borrow());
        }
        self.f_has_tlv_descriptors.set(true);
        *self.has_tlv_descriptors.borrow_mut() = (((((*self.value() as i32) & (8388608 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_tlv_descriptors.borrow())
    }

    /**
     * the object file is the output of an incremental link against a base file and can't be link edited again
     */
    pub fn incr_link(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_incr_link.get() {
            return Ok(self.incr_link.borrow());
        }
        self.f_incr_link.set(true);
        *self.incr_link.borrow_mut() = (((((*self.value() as u32) & (2 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.incr_link.borrow())
    }

    /**
     * the shared library init routine is to be run lazily via catching memory faults to its writeable segments (obsolete)
     */
    pub fn lazy_init(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_lazy_init.get() {
            return Ok(self.lazy_init.borrow());
        }
        self.f_lazy_init.set(true);
        *self.lazy_init.borrow_mut() = (((((*self.value() as u32) & (64 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.lazy_init.borrow())
    }

    /**
     * do not have dyld notify the prebinding agent about this executable
     */
    pub fn no_fix_prebinding(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_fix_prebinding.get() {
            return Ok(self.no_fix_prebinding.borrow());
        }
        self.f_no_fix_prebinding.set(true);
        *self.no_fix_prebinding.borrow_mut() = (((((*self.value() as i32) & (1024 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_fix_prebinding.borrow())
    }
    pub fn no_heap_execution(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_heap_execution.get() {
            return Ok(self.no_heap_execution.borrow());
        }
        self.f_no_heap_execution.set(true);
        *self.no_heap_execution.borrow_mut() = (((((*self.value() as i32) & (16777216 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_heap_execution.borrow())
    }

    /**
     * this umbrella guarantees no multiple defintions of symbols in its sub-images so the two-level namespace hints can always be used.
     */
    pub fn no_multi_defs(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_multi_defs.get() {
            return Ok(self.no_multi_defs.borrow());
        }
        self.f_no_multi_defs.set(true);
        *self.no_multi_defs.borrow_mut() = (((((*self.value() as i32) & (512 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_multi_defs.borrow())
    }

    /**
     * When this bit is set on a dylib, the static linker does not need to examine dependent dylibs to see if any are re-exported
     */
    pub fn no_reexported_dylibs(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_reexported_dylibs.get() {
            return Ok(self.no_reexported_dylibs.borrow());
        }
        self.f_no_reexported_dylibs.set(true);
        *self.no_reexported_dylibs.borrow_mut() = (((((*self.value() as i32) & (1048576 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_reexported_dylibs.borrow())
    }

    /**
     * the object file has no undefined references
     */
    pub fn no_undefs(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_no_undefs.get() {
            return Ok(self.no_undefs.borrow());
        }
        self.f_no_undefs.set(true);
        *self.no_undefs.borrow_mut() = (((((*self.value() as u32) & (1 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.no_undefs.borrow())
    }

    /**
     * When this bit is set, the OS will load the main executable at a random address. Only used in MH_EXECUTE filetypes.
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
        *self.pie.borrow_mut() = (((((*self.value() as i32) & (2097152 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.pie.borrow())
    }

    /**
     * the binary is not prebound but can have its prebinding redone. only used when MH_PREBOUND is not set.
     */
    pub fn prebindable(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_prebindable.get() {
            return Ok(self.prebindable.borrow());
        }
        self.f_prebindable.set(true);
        *self.prebindable.borrow_mut() = (((((*self.value() as i32) & (2048 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.prebindable.borrow())
    }

    /**
     * the file has its dynamic undefined references prebound.
     */
    pub fn prebound(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_prebound.get() {
            return Ok(self.prebound.borrow());
        }
        self.f_prebound.set(true);
        *self.prebound.borrow_mut() = (((((*self.value() as u32) & (16 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.prebound.borrow())
    }

    /**
     * When this bit is set, the binary declares it is safe for use in processes with uid zero
     */
    pub fn root_safe(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_root_safe.get() {
            return Ok(self.root_safe.borrow());
        }
        self.f_root_safe.set(true);
        *self.root_safe.borrow_mut() = (((((*self.value() as i32) & (262144 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.root_safe.borrow())
    }

    /**
     * When this bit is set, the binary declares it is safe for use in processes when issetugid() is true
     */
    pub fn setuid_safe(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_setuid_safe.get() {
            return Ok(self.setuid_safe.borrow());
        }
        self.f_setuid_safe.set(true);
        *self.setuid_safe.borrow_mut() = (((((*self.value() as i32) & (524288 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.setuid_safe.borrow())
    }

    /**
     * the file has its read-only and read-write segments split
     */
    pub fn split_segs(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_split_segs.get() {
            return Ok(self.split_segs.borrow());
        }
        self.f_split_segs.set(true);
        *self.split_segs.borrow_mut() = (((((*self.value() as u32) & (32 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.split_segs.borrow())
    }

    /**
     * safe to divide up the sections into sub-sections via symbols for dead code stripping
     */
    pub fn subsections_via_symbols(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_subsections_via_symbols.get() {
            return Ok(self.subsections_via_symbols.borrow());
        }
        self.f_subsections_via_symbols.set(true);
        *self.subsections_via_symbols.borrow_mut() = (((((*self.value() as i32) & (8192 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.subsections_via_symbols.borrow())
    }

    /**
     * the image is using two-level name space bindings
     */
    pub fn two_level(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_two_level.get() {
            return Ok(self.two_level.borrow());
        }
        self.f_two_level.set(true);
        *self.two_level.borrow_mut() = (((((*self.value() as u32) & (128 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.two_level.borrow())
    }

    /**
     * the final linked image contains external weak symbols
     */
    pub fn weak_defines(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_weak_defines.get() {
            return Ok(self.weak_defines.borrow());
        }
        self.f_weak_defines.set(true);
        *self.weak_defines.borrow_mut() = (((((*self.value() as i32) & (32768 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.weak_defines.borrow())
    }
}
impl MachO_MachoFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_RoutinesCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    init_address: RefCell<u32>,
    init_module: RefCell<u32>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_RoutinesCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.init_address.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.init_module.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(24 as usize)?.into();
        Ok(())
    }
}
impl MachO_RoutinesCommand {
}
impl MachO_RoutinesCommand {
    pub fn init_address(&self) -> Ref<'_, u32> {
        self.init_address.borrow()
    }
}
impl MachO_RoutinesCommand {
    pub fn init_module(&self) -> Ref<'_, u32> {
        self.init_module.borrow()
    }
}
impl MachO_RoutinesCommand {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl MachO_RoutinesCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_RoutinesCommand64 {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    init_address: RefCell<u64>,
    init_module: RefCell<u64>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_RoutinesCommand64 {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.init_address.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.init_module.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(48 as usize)?.into();
        Ok(())
    }
}
impl MachO_RoutinesCommand64 {
}
impl MachO_RoutinesCommand64 {
    pub fn init_address(&self) -> Ref<'_, u64> {
        self.init_address.borrow()
    }
}
impl MachO_RoutinesCommand64 {
    pub fn init_module(&self) -> Ref<'_, u64> {
        self.init_module.borrow()
    }
}
impl MachO_RoutinesCommand64 {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl MachO_RoutinesCommand64 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_RpathCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    path_offset: RefCell<u32>,
    path: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_RpathCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.path_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.path.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl MachO_RpathCommand {
}
impl MachO_RpathCommand {
    pub fn path_offset(&self) -> Ref<'_, u32> {
        self.path_offset.borrow()
    }
}
impl MachO_RpathCommand {
    pub fn path(&self) -> Ref<'_, String> {
        self.path.borrow()
    }
}
impl MachO_RpathCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    segname: RefCell<String>,
    vmaddr: RefCell<u32>,
    vmsize: RefCell<u32>,
    fileoff: RefCell<u32>,
    filesize: RefCell<u32>,
    maxprot: RefCell<OptRc<MachO_VmProt>>,
    initprot: RefCell<OptRc<MachO_VmProt>>,
    nsects: RefCell<u32>,
    flags: RefCell<u32>,
    sections: RefCell<Vec<OptRc<MachO_SegmentCommand_Section>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SegmentCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.segname.borrow_mut() = bytes_to_str(&bytes_strip_right(&_io.read_bytes(16 as usize)?.into(), 0).into(), "ASCII")?;
        *self_rc.vmaddr.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.vmsize.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.fileoff.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.filesize.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, MachO_VmProt>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.maxprot.borrow_mut() = t;
        let t = Self::read_into::<_, MachO_VmProt>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.initprot.borrow_mut() = t;
        *self_rc.nsects.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.sections.borrow_mut() = Vec::new();
        let l_sections = *self_rc.nsects();
        for _i in 0..l_sections {
            let t = Self::read_into::<_, MachO_SegmentCommand_Section>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.sections.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl MachO_SegmentCommand {
}
impl MachO_SegmentCommand {
    pub fn segname(&self) -> Ref<'_, String> {
        self.segname.borrow()
    }
}
impl MachO_SegmentCommand {
    pub fn vmaddr(&self) -> Ref<'_, u32> {
        self.vmaddr.borrow()
    }
}
impl MachO_SegmentCommand {
    pub fn vmsize(&self) -> Ref<'_, u32> {
        self.vmsize.borrow()
    }
}
impl MachO_SegmentCommand {
    pub fn fileoff(&self) -> Ref<'_, u32> {
        self.fileoff.borrow()
    }
}
impl MachO_SegmentCommand {
    pub fn filesize(&self) -> Ref<'_, u32> {
        self.filesize.borrow()
    }
}
impl MachO_SegmentCommand {
    pub fn maxprot(&self) -> Ref<'_, OptRc<MachO_VmProt>> {
        self.maxprot.borrow()
    }
}
impl MachO_SegmentCommand {
    pub fn initprot(&self) -> Ref<'_, OptRc<MachO_VmProt>> {
        self.initprot.borrow()
    }
}
impl MachO_SegmentCommand {
    pub fn nsects(&self) -> Ref<'_, u32> {
        self.nsects.borrow()
    }
}
impl MachO_SegmentCommand {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl MachO_SegmentCommand {
    pub fn sections(&self) -> Ref<'_, Vec<OptRc<MachO_SegmentCommand_Section>>> {
        self.sections.borrow()
    }
}
impl MachO_SegmentCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand_Section {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SegmentCommand>,
    pub _self: SharedType<Self>,
    sect_name: RefCell<String>,
    seg_name: RefCell<String>,
    addr: RefCell<u32>,
    size: RefCell<u32>,
    offset: RefCell<u32>,
    align: RefCell<u32>,
    reloff: RefCell<u32>,
    nreloc: RefCell<u32>,
    flags: RefCell<u32>,
    reserved1: RefCell<u32>,
    reserved2: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
}
impl KStruct for MachO_SegmentCommand_Section {
    type Root = MachO;
    type Parent = MachO_SegmentCommand;

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
        *self_rc.sect_name.borrow_mut() = bytes_to_str(&bytes_strip_right(&_io.read_bytes(16 as usize)?.into(), 0).into(), "ASCII")?;
        *self_rc.seg_name.borrow_mut() = bytes_to_str(&bytes_strip_right(&_io.read_bytes(16 as usize)?.into(), 0).into(), "ASCII")?;
        *self_rc.addr.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.align.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reloff.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.nreloc.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved1.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MachO_SegmentCommand_Section {
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.offset() as usize)?;
        *self.data.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
        io.seek(_pos)?;
        Ok(self.data.borrow())
    }
}
impl MachO_SegmentCommand_Section {
    pub fn sect_name(&self) -> Ref<'_, String> {
        self.sect_name.borrow()
    }
}
impl MachO_SegmentCommand_Section {
    pub fn seg_name(&self) -> Ref<'_, String> {
        self.seg_name.borrow()
    }
}
impl MachO_SegmentCommand_Section {
    pub fn addr(&self) -> Ref<'_, u32> {
        self.addr.borrow()
    }
}
impl MachO_SegmentCommand_Section {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl MachO_SegmentCommand_Section {
    pub fn offset(&self) -> Ref<'_, u32> {
        self.offset.borrow()
    }
}
impl MachO_SegmentCommand_Section {
    pub fn align(&self) -> Ref<'_, u32> {
        self.align.borrow()
    }
}
impl MachO_SegmentCommand_Section {
    pub fn reloff(&self) -> Ref<'_, u32> {
        self.reloff.borrow()
    }
}
impl MachO_SegmentCommand_Section {
    pub fn nreloc(&self) -> Ref<'_, u32> {
        self.nreloc.borrow()
    }
}
impl MachO_SegmentCommand_Section {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl MachO_SegmentCommand_Section {
    pub fn reserved1(&self) -> Ref<'_, u32> {
        self.reserved1.borrow()
    }
}
impl MachO_SegmentCommand_Section {
    pub fn reserved2(&self) -> Ref<'_, u32> {
        self.reserved2.borrow()
    }
}
impl MachO_SegmentCommand_Section {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand64 {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    segname: RefCell<String>,
    vmaddr: RefCell<u64>,
    vmsize: RefCell<u64>,
    fileoff: RefCell<u64>,
    filesize: RefCell<u64>,
    maxprot: RefCell<OptRc<MachO_VmProt>>,
    initprot: RefCell<OptRc<MachO_VmProt>>,
    nsects: RefCell<u32>,
    flags: RefCell<u32>,
    sections: RefCell<Vec<OptRc<MachO_SegmentCommand64_Section64>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SegmentCommand64 {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.segname.borrow_mut() = bytes_to_str(&bytes_strip_right(&_io.read_bytes(16 as usize)?.into(), 0).into(), "ASCII")?;
        *self_rc.vmaddr.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.vmsize.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.fileoff.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.filesize.borrow_mut() = _io.read_u8le()?.into();
        let t = Self::read_into::<_, MachO_VmProt>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.maxprot.borrow_mut() = t;
        let t = Self::read_into::<_, MachO_VmProt>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.initprot.borrow_mut() = t;
        *self_rc.nsects.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.sections.borrow_mut() = Vec::new();
        let l_sections = *self_rc.nsects();
        for _i in 0..l_sections {
            let t = Self::read_into::<_, MachO_SegmentCommand64_Section64>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.sections.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl MachO_SegmentCommand64 {
}
impl MachO_SegmentCommand64 {
    pub fn segname(&self) -> Ref<'_, String> {
        self.segname.borrow()
    }
}
impl MachO_SegmentCommand64 {
    pub fn vmaddr(&self) -> Ref<'_, u64> {
        self.vmaddr.borrow()
    }
}
impl MachO_SegmentCommand64 {
    pub fn vmsize(&self) -> Ref<'_, u64> {
        self.vmsize.borrow()
    }
}
impl MachO_SegmentCommand64 {
    pub fn fileoff(&self) -> Ref<'_, u64> {
        self.fileoff.borrow()
    }
}
impl MachO_SegmentCommand64 {
    pub fn filesize(&self) -> Ref<'_, u64> {
        self.filesize.borrow()
    }
}
impl MachO_SegmentCommand64 {
    pub fn maxprot(&self) -> Ref<'_, OptRc<MachO_VmProt>> {
        self.maxprot.borrow()
    }
}
impl MachO_SegmentCommand64 {
    pub fn initprot(&self) -> Ref<'_, OptRc<MachO_VmProt>> {
        self.initprot.borrow()
    }
}
impl MachO_SegmentCommand64 {
    pub fn nsects(&self) -> Ref<'_, u32> {
        self.nsects.borrow()
    }
}
impl MachO_SegmentCommand64 {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl MachO_SegmentCommand64 {
    pub fn sections(&self) -> Ref<'_, Vec<OptRc<MachO_SegmentCommand64_Section64>>> {
        self.sections.borrow()
    }
}
impl MachO_SegmentCommand64 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand64_Section64 {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SegmentCommand64>,
    pub _self: SharedType<Self>,
    sect_name: RefCell<String>,
    seg_name: RefCell<String>,
    addr: RefCell<u64>,
    size: RefCell<u64>,
    offset: RefCell<u32>,
    align: RefCell<u32>,
    reloff: RefCell<u32>,
    nreloc: RefCell<u32>,
    flags: RefCell<u32>,
    reserved1: RefCell<u32>,
    reserved2: RefCell<u32>,
    reserved3: RefCell<u32>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
    f_data: Cell<bool>,
    data: RefCell<Option<MachO_SegmentCommand64_Section64_Data>>,
}
#[derive(Debug, Clone)]
pub enum MachO_SegmentCommand64_Section64_Data {
    MachO_SegmentCommand64_Section64_StringList(OptRc<MachO_SegmentCommand64_Section64_StringList>),
    Bytes(Vec<u8>),
    MachO_SegmentCommand64_Section64_CfStringList(OptRc<MachO_SegmentCommand64_Section64_CfStringList>),
    MachO_SegmentCommand64_Section64_PointerList(OptRc<MachO_SegmentCommand64_Section64_PointerList>),
    MachO_SegmentCommand64_Section64_EhFrame(OptRc<MachO_SegmentCommand64_Section64_EhFrame>),
}
impl From<&MachO_SegmentCommand64_Section64_Data> for OptRc<MachO_SegmentCommand64_Section64_StringList> {
    fn from(v: &MachO_SegmentCommand64_Section64_Data) -> Self {
        if let MachO_SegmentCommand64_Section64_Data::MachO_SegmentCommand64_Section64_StringList(x) = v {
            return x.clone();
        }
        panic!("expected MachO_SegmentCommand64_Section64_Data::MachO_SegmentCommand64_Section64_StringList, got {:?}", v)
    }
}
impl From<OptRc<MachO_SegmentCommand64_Section64_StringList>> for MachO_SegmentCommand64_Section64_Data {
    fn from(v: OptRc<MachO_SegmentCommand64_Section64_StringList>) -> Self {
        Self::MachO_SegmentCommand64_Section64_StringList(v)
    }
}
impl From<&MachO_SegmentCommand64_Section64_Data> for Vec<u8> {
    fn from(v: &MachO_SegmentCommand64_Section64_Data) -> Self {
        if let MachO_SegmentCommand64_Section64_Data::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected MachO_SegmentCommand64_Section64_Data::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for MachO_SegmentCommand64_Section64_Data {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&MachO_SegmentCommand64_Section64_Data> for OptRc<MachO_SegmentCommand64_Section64_CfStringList> {
    fn from(v: &MachO_SegmentCommand64_Section64_Data) -> Self {
        if let MachO_SegmentCommand64_Section64_Data::MachO_SegmentCommand64_Section64_CfStringList(x) = v {
            return x.clone();
        }
        panic!("expected MachO_SegmentCommand64_Section64_Data::MachO_SegmentCommand64_Section64_CfStringList, got {:?}", v)
    }
}
impl From<OptRc<MachO_SegmentCommand64_Section64_CfStringList>> for MachO_SegmentCommand64_Section64_Data {
    fn from(v: OptRc<MachO_SegmentCommand64_Section64_CfStringList>) -> Self {
        Self::MachO_SegmentCommand64_Section64_CfStringList(v)
    }
}
impl From<&MachO_SegmentCommand64_Section64_Data> for OptRc<MachO_SegmentCommand64_Section64_PointerList> {
    fn from(v: &MachO_SegmentCommand64_Section64_Data) -> Self {
        if let MachO_SegmentCommand64_Section64_Data::MachO_SegmentCommand64_Section64_PointerList(x) = v {
            return x.clone();
        }
        panic!("expected MachO_SegmentCommand64_Section64_Data::MachO_SegmentCommand64_Section64_PointerList, got {:?}", v)
    }
}
impl From<OptRc<MachO_SegmentCommand64_Section64_PointerList>> for MachO_SegmentCommand64_Section64_Data {
    fn from(v: OptRc<MachO_SegmentCommand64_Section64_PointerList>) -> Self {
        Self::MachO_SegmentCommand64_Section64_PointerList(v)
    }
}
impl From<&MachO_SegmentCommand64_Section64_Data> for OptRc<MachO_SegmentCommand64_Section64_EhFrame> {
    fn from(v: &MachO_SegmentCommand64_Section64_Data) -> Self {
        if let MachO_SegmentCommand64_Section64_Data::MachO_SegmentCommand64_Section64_EhFrame(x) = v {
            return x.clone();
        }
        panic!("expected MachO_SegmentCommand64_Section64_Data::MachO_SegmentCommand64_Section64_EhFrame, got {:?}", v)
    }
}
impl From<OptRc<MachO_SegmentCommand64_Section64_EhFrame>> for MachO_SegmentCommand64_Section64_Data {
    fn from(v: OptRc<MachO_SegmentCommand64_Section64_EhFrame>) -> Self {
        Self::MachO_SegmentCommand64_Section64_EhFrame(v)
    }
}
impl KStruct for MachO_SegmentCommand64_Section64 {
    type Root = MachO;
    type Parent = MachO_SegmentCommand64;

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
        *self_rc.sect_name.borrow_mut() = bytes_to_str(&bytes_strip_right(&_io.read_bytes(16 as usize)?.into(), 0).into(), "ASCII")?;
        *self_rc.seg_name.borrow_mut() = bytes_to_str(&bytes_strip_right(&_io.read_bytes(16 as usize)?.into(), 0).into(), "ASCII")?;
        *self_rc.addr.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.align.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reloff.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.nreloc.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved1.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved3.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Option<MachO_SegmentCommand64_Section64_Data>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.offset() as usize)?;
        {
            let on = self.sect_name();
            if *on == "__cfstring" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_CfStringList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__cstring" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_StringList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__eh_frame" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_EhFrame>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__got" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_PointerList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__la_symbol_ptr" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_PointerList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__nl_symbol_ptr" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_PointerList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__objc_classlist" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_PointerList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__objc_classname" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_StringList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__objc_classrefs" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_PointerList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__objc_imageinfo" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_PointerList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__objc_methname" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_StringList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__objc_methtype" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_StringList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__objc_nlclslist" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_PointerList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__objc_protolist" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_PointerList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__objc_protorefs" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_PointerList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__objc_selrefs" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_PointerList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else if *on == "__objc_superrefs" {
                *self.data_raw.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
                let data_raw = self.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_PointerList>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.data.borrow_mut() = Some(t);
            }
            else {
                *self.data.borrow_mut() = Some(io.read_bytes(*self.size() as usize)?.into());
            }
        }
        io.seek(_pos)?;
        Ok(self.data.borrow())
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn sect_name(&self) -> Ref<'_, String> {
        self.sect_name.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn seg_name(&self) -> Ref<'_, String> {
        self.seg_name.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn addr(&self) -> Ref<'_, u64> {
        self.addr.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn size(&self) -> Ref<'_, u64> {
        self.size.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn offset(&self) -> Ref<'_, u32> {
        self.offset.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn align(&self) -> Ref<'_, u32> {
        self.align.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn reloff(&self) -> Ref<'_, u32> {
        self.reloff.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn nreloc(&self) -> Ref<'_, u32> {
        self.nreloc.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn reserved1(&self) -> Ref<'_, u32> {
        self.reserved1.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn reserved2(&self) -> Ref<'_, u32> {
        self.reserved2.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn reserved3(&self) -> Ref<'_, u32> {
        self.reserved3.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MachO_SegmentCommand64_Section64 {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand64_Section64_CfString {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SegmentCommand64_Section64_CfStringList>,
    pub _self: SharedType<Self>,
    isa: RefCell<u64>,
    info: RefCell<u64>,
    data: RefCell<u64>,
    length: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SegmentCommand64_Section64_CfString {
    type Root = MachO;
    type Parent = MachO_SegmentCommand64_Section64_CfStringList;

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
        *self_rc.isa.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.info.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.data.borrow_mut() = Some(_io.read_u8le()?.into());
        *self_rc.length.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl MachO_SegmentCommand64_Section64_CfString {
}
impl MachO_SegmentCommand64_Section64_CfString {
    pub fn isa(&self) -> Ref<'_, u64> {
        self.isa.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_CfString {
    pub fn info(&self) -> Ref<'_, u64> {
        self.info.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_CfString {
    pub fn data(&self) -> Ref<'_, u64> {
        self.data.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_CfString {
    pub fn length(&self) -> Ref<'_, u64> {
        self.length.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_CfString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand64_Section64_CfStringList {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SegmentCommand64_Section64>,
    pub _self: SharedType<Self>,
    items: RefCell<Vec<OptRc<MachO_SegmentCommand64_Section64_CfString>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SegmentCommand64_Section64_CfStringList {
    type Root = MachO;
    type Parent = MachO_SegmentCommand64_Section64;

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
        *self_rc.items.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, MachO_SegmentCommand64_Section64_CfString>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.items.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl MachO_SegmentCommand64_Section64_CfStringList {
}
impl MachO_SegmentCommand64_Section64_CfStringList {
    pub fn items(&self) -> Ref<'_, Vec<OptRc<MachO_SegmentCommand64_Section64_CfString>>> {
        self.items.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_CfStringList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand64_Section64_EhFrame {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SegmentCommand64_Section64>,
    pub _self: SharedType<Self>,
    items: RefCell<Vec<OptRc<MachO_SegmentCommand64_Section64_EhFrameItem>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SegmentCommand64_Section64_EhFrame {
    type Root = MachO;
    type Parent = MachO_SegmentCommand64_Section64;

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
        *self_rc.items.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, MachO_SegmentCommand64_Section64_EhFrameItem>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.items.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl MachO_SegmentCommand64_Section64_EhFrame {
}
impl MachO_SegmentCommand64_Section64_EhFrame {
    pub fn items(&self) -> Ref<'_, Vec<OptRc<MachO_SegmentCommand64_Section64_EhFrameItem>>> {
        self.items.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrame {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand64_Section64_EhFrameItem {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SegmentCommand64_Section64_EhFrame>,
    pub _self: SharedType<Self>,
    length: RefCell<u32>,
    length64: RefCell<u64>,
    id: RefCell<u32>,
    body: RefCell<Option<MachO_SegmentCommand64_Section64_EhFrameItem_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum MachO_SegmentCommand64_Section64_EhFrameItem_Body {
    MachO_SegmentCommand64_Section64_EhFrameItem_Cie(OptRc<MachO_SegmentCommand64_Section64_EhFrameItem_Cie>),
    Bytes(Vec<u8>),
}
impl From<&MachO_SegmentCommand64_Section64_EhFrameItem_Body> for OptRc<MachO_SegmentCommand64_Section64_EhFrameItem_Cie> {
    fn from(v: &MachO_SegmentCommand64_Section64_EhFrameItem_Body) -> Self {
        if let MachO_SegmentCommand64_Section64_EhFrameItem_Body::MachO_SegmentCommand64_Section64_EhFrameItem_Cie(x) = v {
            return x.clone();
        }
        panic!("expected MachO_SegmentCommand64_Section64_EhFrameItem_Body::MachO_SegmentCommand64_Section64_EhFrameItem_Cie, got {:?}", v)
    }
}
impl From<OptRc<MachO_SegmentCommand64_Section64_EhFrameItem_Cie>> for MachO_SegmentCommand64_Section64_EhFrameItem_Body {
    fn from(v: OptRc<MachO_SegmentCommand64_Section64_EhFrameItem_Cie>) -> Self {
        Self::MachO_SegmentCommand64_Section64_EhFrameItem_Cie(v)
    }
}
impl From<&MachO_SegmentCommand64_Section64_EhFrameItem_Body> for Vec<u8> {
    fn from(v: &MachO_SegmentCommand64_Section64_EhFrameItem_Body) -> Self {
        if let MachO_SegmentCommand64_Section64_EhFrameItem_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected MachO_SegmentCommand64_Section64_EhFrameItem_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for MachO_SegmentCommand64_Section64_EhFrameItem_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for MachO_SegmentCommand64_Section64_EhFrameItem {
    type Root = MachO;
    type Parent = MachO_SegmentCommand64_Section64_EhFrame;

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
        *self_rc.length.borrow_mut() = _io.read_u4le()?.into();
        if ((*self_rc.length() as i32) == (4294967295 as i32)) {
            *self_rc.length64.borrow_mut() = _io.read_u8le()?.into();
        }
        *self_rc.id.borrow_mut() = _io.read_u4le()?.into();
        if ((*self_rc.length() as u32) > (0 as u32)) {
            match *self_rc.id() {
                0 => {
                    *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u32) - (4 as u32)) as usize)?.into();
                    let body_raw = self_rc.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let t = Self::read_into::<BytesReader, MachO_SegmentCommand64_Section64_EhFrameItem_Cie>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.body.borrow_mut() = Some(t);
                }
                _ => {
                    *self_rc.body.borrow_mut() = Some(_io.read_bytes(((*self_rc.length() as u32) - (4 as u32)) as usize)?.into());
                }
            }
        }
        Ok(())
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem {
}
impl MachO_SegmentCommand64_Section64_EhFrameItem {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem {
    pub fn length64(&self) -> Ref<'_, u64> {
        self.length64.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem {
    pub fn id(&self) -> Ref<'_, u32> {
        self.id.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem {
    pub fn body(&self) -> Ref<'_, Option<MachO_SegmentCommand64_Section64_EhFrameItem_Body>> {
        self.body.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SegmentCommand64_Section64_EhFrameItem_Cie>,
    pub _self: SharedType<Self>,
    length: RefCell<OptRc<MachO_Uleb128>>,
    fde_pointer_encoding: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry {
    type Root = MachO;
    type Parent = MachO_SegmentCommand64_Section64_EhFrameItem_Cie;

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
        let t = Self::read_into::<_, MachO_Uleb128>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.length.borrow_mut() = t;
        if ((*_prc.as_ref().unwrap().aug_str().next().chr() as u8) == (82 as u8)) {
            *self_rc.fde_pointer_encoding.borrow_mut() = _io.read_u1()?.into();
        }
        Ok(())
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry {
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry {
    pub fn length(&self) -> Ref<'_, OptRc<MachO_Uleb128>> {
        self.length.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry {
    pub fn fde_pointer_encoding(&self) -> Ref<'_, u8> {
        self.fde_pointer_encoding.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand64_Section64_EhFrameItem_CharChain {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    chr: RefCell<u8>,
    next: RefCell<OptRc<MachO_SegmentCommand64_Section64_EhFrameItem_CharChain>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SegmentCommand64_Section64_EhFrameItem_CharChain {
    type Root = MachO;
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
        *self_rc.chr.borrow_mut() = _io.read_u1()?.into();
        if ((*self_rc.chr() as u8) != (0 as u8)) {
            let t = Self::read_into::<_, MachO_SegmentCommand64_Section64_EhFrameItem_CharChain>(&*_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.next.borrow_mut() = t;
        }
        Ok(())
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_CharChain {
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_CharChain {
    pub fn chr(&self) -> Ref<'_, u8> {
        self.chr.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_CharChain {
    pub fn next(&self) -> Ref<'_, OptRc<MachO_SegmentCommand64_Section64_EhFrameItem_CharChain>> {
        self.next.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_CharChain {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand64_Section64_EhFrameItem_Cie {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SegmentCommand64_Section64_EhFrameItem>,
    pub _self: SharedType<Self>,
    version: RefCell<u8>,
    aug_str: RefCell<OptRc<MachO_SegmentCommand64_Section64_EhFrameItem_CharChain>>,
    code_alignment_factor: RefCell<OptRc<MachO_Uleb128>>,
    data_alignment_factor: RefCell<OptRc<MachO_Uleb128>>,
    return_address_register: RefCell<u8>,
    augmentation: RefCell<OptRc<MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SegmentCommand64_Section64_EhFrameItem_Cie {
    type Root = MachO;
    type Parent = MachO_SegmentCommand64_Section64_EhFrameItem;

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
        *self_rc.version.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, MachO_SegmentCommand64_Section64_EhFrameItem_CharChain>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.aug_str.borrow_mut() = t;
        let t = Self::read_into::<_, MachO_Uleb128>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.code_alignment_factor.borrow_mut() = t;
        let t = Self::read_into::<_, MachO_Uleb128>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.data_alignment_factor.borrow_mut() = t;
        *self_rc.return_address_register.borrow_mut() = _io.read_u1()?.into();
        if ((*self_rc.aug_str().chr() as u8) == (122 as u8)) {
            let t = Self::read_into::<_, MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.augmentation.borrow_mut() = t;
        }
        Ok(())
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_Cie {
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_Cie {
    pub fn version(&self) -> Ref<'_, u8> {
        self.version.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_Cie {
    pub fn aug_str(&self) -> Ref<'_, OptRc<MachO_SegmentCommand64_Section64_EhFrameItem_CharChain>> {
        self.aug_str.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_Cie {
    pub fn code_alignment_factor(&self) -> Ref<'_, OptRc<MachO_Uleb128>> {
        self.code_alignment_factor.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_Cie {
    pub fn data_alignment_factor(&self) -> Ref<'_, OptRc<MachO_Uleb128>> {
        self.data_alignment_factor.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_Cie {
    pub fn return_address_register(&self) -> Ref<'_, u8> {
        self.return_address_register.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_Cie {
    pub fn augmentation(&self) -> Ref<'_, OptRc<MachO_SegmentCommand64_Section64_EhFrameItem_AugmentationEntry>> {
        self.augmentation.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_EhFrameItem_Cie {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand64_Section64_PointerList {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SegmentCommand64_Section64>,
    pub _self: SharedType<Self>,
    items: RefCell<Vec<u64>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SegmentCommand64_Section64_PointerList {
    type Root = MachO;
    type Parent = MachO_SegmentCommand64_Section64;

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
        *self_rc.items.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.items.borrow_mut().push(_io.read_u8le()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl MachO_SegmentCommand64_Section64_PointerList {
}
impl MachO_SegmentCommand64_Section64_PointerList {
    pub fn items(&self) -> Ref<'_, Vec<u64>> {
        self.items.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_PointerList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SegmentCommand64_Section64_StringList {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SegmentCommand64_Section64>,
    pub _self: SharedType<Self>,
    strings: RefCell<Vec<String>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SegmentCommand64_Section64_StringList {
    type Root = MachO;
    type Parent = MachO_SegmentCommand64_Section64;

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
        *self_rc.strings.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.strings.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl MachO_SegmentCommand64_Section64_StringList {
}
impl MachO_SegmentCommand64_Section64_StringList {
    pub fn strings(&self) -> Ref<'_, Vec<String>> {
        self.strings.borrow()
    }
}
impl MachO_SegmentCommand64_Section64_StringList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SourceVersionCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    version: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SourceVersionCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.version.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl MachO_SourceVersionCommand {
}
impl MachO_SourceVersionCommand {
    pub fn version(&self) -> Ref<'_, u64> {
        self.version.borrow()
    }
}
impl MachO_SourceVersionCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SubCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    name: RefCell<OptRc<MachO_LcStr>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SubCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        let t = Self::read_into::<_, MachO_LcStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.name.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_SubCommand {
}
impl MachO_SubCommand {
    pub fn name(&self) -> Ref<'_, OptRc<MachO_LcStr>> {
        self.name.borrow()
    }
}
impl MachO_SubCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SymtabCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    sym_off: RefCell<u32>,
    n_syms: RefCell<u32>,
    str_off: RefCell<u32>,
    str_size: RefCell<u32>,
    _io: RefCell<BytesReader>,
    strs_raw: RefCell<Vec<u8>>,
    f_strs: Cell<bool>,
    strs: RefCell<OptRc<MachO_SymtabCommand_StrTable>>,
    f_symbols: Cell<bool>,
    symbols: RefCell<Vec<MachO_SymtabCommand_Symbols>>,
}
impl KStruct for MachO_SymtabCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.sym_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.n_syms.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.str_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.str_size.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MachO_SymtabCommand {
    pub fn strs(
        &self
    ) -> KResult<Ref<'_, OptRc<MachO_SymtabCommand_StrTable>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_strs.get() {
            return Ok(self.strs.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.str_off() as usize)?;
        *self.strs_raw.borrow_mut() = io.read_bytes(*self.str_size() as usize)?.into();
        let strs_raw = self.strs_raw.borrow();
        let _t_strs_raw_io = BytesReader::from(strs_raw.clone());
        let t = Self::read_into::<BytesReader, MachO_SymtabCommand_StrTable>(&_t_strs_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.strs.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.strs.borrow())
    }
    pub fn symbols(
        &self
    ) -> KResult<Ref<'_, Vec<MachO_SymtabCommand_Symbols>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_symbols.get() {
            return Ok(self.symbols.borrow());
        }
        self.f_symbols.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.sym_off() as usize)?;
        *self.symbols.borrow_mut() = Vec::new();
        let l_symbols = *self.n_syms();
        for _i in 0..l_symbols {
            match *_r.magic() {
                MachO_MagicType::MachoBeX64 => {
                    let t = Self::read_into::<BytesReader, MachO_SymtabCommand_Nlist64>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                    self.symbols.borrow_mut().push(t);
                }
                MachO_MagicType::MachoBeX86 => {
                    let t = Self::read_into::<BytesReader, MachO_SymtabCommand_Nlist>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                    self.symbols.borrow_mut().push(t);
                }
                MachO_MagicType::MachoLeX64 => {
                    let t = Self::read_into::<BytesReader, MachO_SymtabCommand_Nlist64>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                    self.symbols.borrow_mut().push(t);
                }
                MachO_MagicType::MachoLeX86 => {
                    let t = Self::read_into::<BytesReader, MachO_SymtabCommand_Nlist>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                    self.symbols.borrow_mut().push(t);
                }
                _ => {}
            }
        }
        io.seek(_pos)?;
        Ok(self.symbols.borrow())
    }
}
impl MachO_SymtabCommand {
    pub fn sym_off(&self) -> Ref<'_, u32> {
        self.sym_off.borrow()
    }
}
impl MachO_SymtabCommand {
    pub fn n_syms(&self) -> Ref<'_, u32> {
        self.n_syms.borrow()
    }
}
impl MachO_SymtabCommand {
    pub fn str_off(&self) -> Ref<'_, u32> {
        self.str_off.borrow()
    }
}
impl MachO_SymtabCommand {
    pub fn str_size(&self) -> Ref<'_, u32> {
        self.str_size.borrow()
    }
}
impl MachO_SymtabCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MachO_SymtabCommand {
    pub fn strs_raw(&self) -> Ref<'_, Vec<u8>> {
        self.strs_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SymtabCommand_Nlist {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SymtabCommand>,
    pub _self: SharedType<Self>,
    un: RefCell<u32>,
    type: RefCell<u8>,
    sect: RefCell<u8>,
    desc: RefCell<u16>,
    value: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_name: Cell<bool>,
    name: RefCell<String>,
}
impl KStruct for MachO_SymtabCommand_Nlist {
    type Root = MachO;
    type Parent = MachO_SymtabCommand;

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
        *self_rc.un.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sect.borrow_mut() = _io.read_u1()?.into();
        *self_rc.desc.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.value.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MachO_SymtabCommand_Nlist {
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
        if ((*self.un() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(((*_prc.as_ref().unwrap().str_off() as u32) + (*self.un() as u32)) as usize)?;
            *self.name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
            _io.seek(_pos)?;
        }
        Ok(self.name.borrow())
    }
}
impl MachO_SymtabCommand_Nlist {
    pub fn un(&self) -> Ref<'_, u32> {
        self.un.borrow()
    }
}
impl MachO_SymtabCommand_Nlist {
    pub fn type(&self) -> Ref<'_, u8> {
        self.type.borrow()
    }
}
impl MachO_SymtabCommand_Nlist {
    pub fn sect(&self) -> Ref<'_, u8> {
        self.sect.borrow()
    }
}
impl MachO_SymtabCommand_Nlist {
    pub fn desc(&self) -> Ref<'_, u16> {
        self.desc.borrow()
    }
}
impl MachO_SymtabCommand_Nlist {
    pub fn value(&self) -> Ref<'_, u32> {
        self.value.borrow()
    }
}
impl MachO_SymtabCommand_Nlist {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SymtabCommand_Nlist64 {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SymtabCommand>,
    pub _self: SharedType<Self>,
    un: RefCell<u32>,
    type: RefCell<u8>,
    sect: RefCell<u8>,
    desc: RefCell<u16>,
    value: RefCell<u64>,
    _io: RefCell<BytesReader>,
    f_name: Cell<bool>,
    name: RefCell<String>,
}
impl KStruct for MachO_SymtabCommand_Nlist64 {
    type Root = MachO;
    type Parent = MachO_SymtabCommand;

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
        *self_rc.un.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sect.borrow_mut() = _io.read_u1()?.into();
        *self_rc.desc.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.value.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl MachO_SymtabCommand_Nlist64 {
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
        if ((*self.un() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(((*_prc.as_ref().unwrap().str_off() as u32) + (*self.un() as u32)) as usize)?;
            *self.name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
            _io.seek(_pos)?;
        }
        Ok(self.name.borrow())
    }
}
impl MachO_SymtabCommand_Nlist64 {
    pub fn un(&self) -> Ref<'_, u32> {
        self.un.borrow()
    }
}
impl MachO_SymtabCommand_Nlist64 {
    pub fn type(&self) -> Ref<'_, u8> {
        self.type.borrow()
    }
}
impl MachO_SymtabCommand_Nlist64 {
    pub fn sect(&self) -> Ref<'_, u8> {
        self.sect.borrow()
    }
}
impl MachO_SymtabCommand_Nlist64 {
    pub fn desc(&self) -> Ref<'_, u16> {
        self.desc.borrow()
    }
}
impl MachO_SymtabCommand_Nlist64 {
    pub fn value(&self) -> Ref<'_, u64> {
        self.value.borrow()
    }
}
impl MachO_SymtabCommand_Nlist64 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_SymtabCommand_StrTable {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_SymtabCommand>,
    pub _self: SharedType<Self>,
    unknown: RefCell<u32>,
    items: RefCell<Vec<String>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_SymtabCommand_StrTable {
    type Root = MachO;
    type Parent = MachO_SymtabCommand;

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
        *self_rc.unknown.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.items.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                self_rc.items.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, false)?.into(), "UTF-8")?);
                let _t_items = self_rc.items.borrow();
                let _tmpa = _t_items.last().unwrap();
                _i += 1;
                let x = !(_tmpa == "".to_string());
                x
            } {}
        }
        Ok(())
    }
}
impl MachO_SymtabCommand_StrTable {
}
impl MachO_SymtabCommand_StrTable {
    pub fn unknown(&self) -> Ref<'_, u32> {
        self.unknown.borrow()
    }
}
impl MachO_SymtabCommand_StrTable {
    pub fn items(&self) -> Ref<'_, Vec<String>> {
        self.items.borrow()
    }
}
impl MachO_SymtabCommand_StrTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_TwolevelHintsCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    offset: RefCell<u32>,
    num_hints: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_TwolevelHintsCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_hints.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MachO_TwolevelHintsCommand {
}
impl MachO_TwolevelHintsCommand {
    pub fn offset(&self) -> Ref<'_, u32> {
        self.offset.borrow()
    }
}
impl MachO_TwolevelHintsCommand {
    pub fn num_hints(&self) -> Ref<'_, u32> {
        self.num_hints.borrow()
    }
}
impl MachO_TwolevelHintsCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_Uleb128 {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    b1: RefCell<u8>,
    b2: RefCell<u8>,
    b3: RefCell<u8>,
    b4: RefCell<u8>,
    b5: RefCell<u8>,
    b6: RefCell<u8>,
    b7: RefCell<u8>,
    b8: RefCell<u8>,
    b9: RefCell<u8>,
    b10: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<i32>,
}
impl KStruct for MachO_Uleb128 {
    type Root = MachO;
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
        *self_rc.b1.borrow_mut() = _io.read_u1()?.into();
        if ((((*self_rc.b1() as u8) & (128 as u8)) as i32) != (0 as i32)) {
            *self_rc.b2.borrow_mut() = _io.read_u1()?.into();
        }
        if ((((*self_rc.b2() as u8) & (128 as u8)) as i32) != (0 as i32)) {
            *self_rc.b3.borrow_mut() = _io.read_u1()?.into();
        }
        if ((((*self_rc.b3() as u8) & (128 as u8)) as i32) != (0 as i32)) {
            *self_rc.b4.borrow_mut() = _io.read_u1()?.into();
        }
        if ((((*self_rc.b4() as u8) & (128 as u8)) as i32) != (0 as i32)) {
            *self_rc.b5.borrow_mut() = _io.read_u1()?.into();
        }
        if ((((*self_rc.b5() as u8) & (128 as u8)) as i32) != (0 as i32)) {
            *self_rc.b6.borrow_mut() = _io.read_u1()?.into();
        }
        if ((((*self_rc.b6() as u8) & (128 as u8)) as i32) != (0 as i32)) {
            *self_rc.b7.borrow_mut() = _io.read_u1()?.into();
        }
        if ((((*self_rc.b7() as u8) & (128 as u8)) as i32) != (0 as i32)) {
            *self_rc.b8.borrow_mut() = _io.read_u1()?.into();
        }
        if ((((*self_rc.b8() as u8) & (128 as u8)) as i32) != (0 as i32)) {
            *self_rc.b9.borrow_mut() = _io.read_u1()?.into();
        }
        if ((((*self_rc.b9() as u8) & (128 as u8)) as i32) != (0 as i32)) {
            *self_rc.b10.borrow_mut() = _io.read_u1()?.into();
        }
        Ok(())
    }
}
impl MachO_Uleb128 {
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
        *self.value.borrow_mut() = (((((((*self.b1() as u8) % (128 as u8)) as i32) << (0 as i32)) as i32) + (if ((((*self.b1() as u8) & (128 as u8)) as i32) == (0 as i32)) { 0 } else { ((((((*self.b2() as u8) % (128 as u8)) as i32) << (7 as i32)) as i32) + (if ((((*self.b2() as u8) & (128 as u8)) as i32) == (0 as i32)) { 0 } else { ((((((*self.b3() as u8) % (128 as u8)) as i32) << (14 as i32)) as i32) + (if ((((*self.b3() as u8) & (128 as u8)) as i32) == (0 as i32)) { 0 } else { ((((((*self.b4() as u8) % (128 as u8)) as i32) << (21 as i32)) as i32) + (if ((((*self.b4() as u8) & (128 as u8)) as i32) == (0 as i32)) { 0 } else { ((((((*self.b5() as u8) % (128 as u8)) as i32) << (28 as i32)) as i32) + (if ((((*self.b5() as u8) & (128 as u8)) as i32) == (0 as i32)) { 0 } else { ((((((*self.b6() as u8) % (128 as u8)) as i32) << (35 as i32)) as i32) + (if ((((*self.b6() as u8) & (128 as u8)) as i32) == (0 as i32)) { 0 } else { ((((((*self.b7() as u8) % (128 as u8)) as i32) << (42 as i32)) as i32) + (if ((((*self.b7() as u8) & (128 as u8)) as i32) == (0 as i32)) { 0 } else { ((((((*self.b8() as u8) % (128 as u8)) as i32) << (49 as i32)) as i32) + (if ((((*self.b8() as u8) & (128 as u8)) as i32) == (0 as i32)) { 0 } else { ((((((*self.b9() as u8) % (128 as u8)) as i32) << (56 as i32)) as i32) + (if ((((*self.b8() as u8) & (128 as u8)) as i32) == (0 as i32)) { 0 } else { ((((*self.b10() as u8) % (128 as u8)) as i32) << (63 as i32)) } as i32)) } as i32)) } as i32)) } as i32)) } as i32)) } as i32)) } as i32)) } as i32)) } as i32))) as i32;
        Ok(self.value.borrow())
    }
}
impl MachO_Uleb128 {
    pub fn b1(&self) -> Ref<'_, u8> {
        self.b1.borrow()
    }
}
impl MachO_Uleb128 {
    pub fn b2(&self) -> Ref<'_, u8> {
        self.b2.borrow()
    }
}
impl MachO_Uleb128 {
    pub fn b3(&self) -> Ref<'_, u8> {
        self.b3.borrow()
    }
}
impl MachO_Uleb128 {
    pub fn b4(&self) -> Ref<'_, u8> {
        self.b4.borrow()
    }
}
impl MachO_Uleb128 {
    pub fn b5(&self) -> Ref<'_, u8> {
        self.b5.borrow()
    }
}
impl MachO_Uleb128 {
    pub fn b6(&self) -> Ref<'_, u8> {
        self.b6.borrow()
    }
}
impl MachO_Uleb128 {
    pub fn b7(&self) -> Ref<'_, u8> {
        self.b7.borrow()
    }
}
impl MachO_Uleb128 {
    pub fn b8(&self) -> Ref<'_, u8> {
        self.b8.borrow()
    }
}
impl MachO_Uleb128 {
    pub fn b9(&self) -> Ref<'_, u8> {
        self.b9.borrow()
    }
}
impl MachO_Uleb128 {
    pub fn b10(&self) -> Ref<'_, u8> {
        self.b10.borrow()
    }
}
impl MachO_Uleb128 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_UuidCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    uuid: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_UuidCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        *self_rc.uuid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        Ok(())
    }
}
impl MachO_UuidCommand {
}
impl MachO_UuidCommand {
    pub fn uuid(&self) -> Ref<'_, Vec<u8>> {
        self.uuid.borrow()
    }
}
impl MachO_UuidCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_Version {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_VersionMinCommand>,
    pub _self: SharedType<Self>,
    p1: RefCell<u8>,
    minor: RefCell<u8>,
    major: RefCell<u8>,
    release: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_Version {
    type Root = MachO;
    type Parent = MachO_VersionMinCommand;

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
        *self_rc.p1.borrow_mut() = _io.read_u1()?.into();
        *self_rc.minor.borrow_mut() = _io.read_u1()?.into();
        *self_rc.major.borrow_mut() = _io.read_u1()?.into();
        *self_rc.release.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl MachO_Version {
}
impl MachO_Version {
    pub fn p1(&self) -> Ref<'_, u8> {
        self.p1.borrow()
    }
}
impl MachO_Version {
    pub fn minor(&self) -> Ref<'_, u8> {
        self.minor.borrow()
    }
}
impl MachO_Version {
    pub fn major(&self) -> Ref<'_, u8> {
        self.major.borrow()
    }
}
impl MachO_Version {
    pub fn release(&self) -> Ref<'_, u8> {
        self.release.borrow()
    }
}
impl MachO_Version {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_VersionMinCommand {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<MachO_LoadCommand>,
    pub _self: SharedType<Self>,
    version: RefCell<OptRc<MachO_Version>>,
    sdk: RefCell<OptRc<MachO_Version>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_VersionMinCommand {
    type Root = MachO;
    type Parent = MachO_LoadCommand;

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
        let t = Self::read_into::<_, MachO_Version>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.version.borrow_mut() = t;
        let t = Self::read_into::<_, MachO_Version>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.sdk.borrow_mut() = t;
        Ok(())
    }
}
impl MachO_VersionMinCommand {
}
impl MachO_VersionMinCommand {
    pub fn version(&self) -> Ref<'_, OptRc<MachO_Version>> {
        self.version.borrow()
    }
}
impl MachO_VersionMinCommand {
    pub fn sdk(&self) -> Ref<'_, OptRc<MachO_Version>> {
        self.sdk.borrow()
    }
}
impl MachO_VersionMinCommand {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MachO_VmProt {
    pub _root: SharedType<MachO>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    strip_read: RefCell<bool>,
    is_mask: RefCell<bool>,
    reserved0: RefCell<bool>,
    copy: RefCell<bool>,
    no_change: RefCell<bool>,
    execute: RefCell<bool>,
    write: RefCell<bool>,
    read: RefCell<bool>,
    reserved1: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MachO_VmProt {
    type Root = MachO;
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
        *self_rc.strip_read.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.is_mask.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved0.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.copy.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.no_change.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.execute.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.write.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.read.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved1.borrow_mut() = _io.read_bits_int_be(24)?;
        Ok(())
    }
}
impl MachO_VmProt {
}

/**
 * Special marker to support execute-only protection.
 */
impl MachO_VmProt {
    pub fn strip_read(&self) -> Ref<'_, bool> {
        self.strip_read.borrow()
    }
}

/**
 * Indicates to use value as a mask against the actual protection bits.
 */
impl MachO_VmProt {
    pub fn is_mask(&self) -> Ref<'_, bool> {
        self.is_mask.borrow()
    }
}

/**
 * Reserved (unused) bit.
 */
impl MachO_VmProt {
    pub fn reserved0(&self) -> Ref<'_, bool> {
        self.reserved0.borrow()
    }
}

/**
 * Used when write permission can not be obtained, to mark the entry as COW.
 */
impl MachO_VmProt {
    pub fn copy(&self) -> Ref<'_, bool> {
        self.copy.borrow()
    }
}

/**
 * Used only by memory_object_lock_request to indicate no change to page locks.
 */
impl MachO_VmProt {
    pub fn no_change(&self) -> Ref<'_, bool> {
        self.no_change.borrow()
    }
}

/**
 * Execute permission.
 */
impl MachO_VmProt {
    pub fn execute(&self) -> Ref<'_, bool> {
        self.execute.borrow()
    }
}

/**
 * Write permission.
 */
impl MachO_VmProt {
    pub fn write(&self) -> Ref<'_, bool> {
        self.write.borrow()
    }
}

/**
 * Read permission.
 */
impl MachO_VmProt {
    pub fn read(&self) -> Ref<'_, bool> {
        self.read.borrow()
    }
}

/**
 * Reserved (unused) bits.
 */
impl MachO_VmProt {
    pub fn reserved1(&self) -> Ref<'_, u64> {
        self.reserved1.borrow()
    }
}
impl MachO_VmProt {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
