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
 * This parser is for the RPM version 3 file format which is the current version
 * of the file format used by RPM 2.1 and later (including RPM version 4.x, which
 * is the current version of the RPM tool). There are historical versions of the
 * RPM file format, as well as a currently abandoned fork (rpm5). These formats
 * are not covered by this specification.
 * \sa https://github.com/rpm-software-management/rpm/blob/afad3167/docs/manual/format.md Source
 * \sa https://github.com/rpm-software-management/rpm/blob/afad3167/docs/manual/tags.md Source
 * \sa https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/pkgformat.html Source
 * \sa http://ftp.rpm.org/max-rpm/ Source
 */

#[derive(Default, Debug, Clone)]
pub struct Rpm {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm>,
    pub _self: SharedType<Self>,
    lead: RefCell<OptRc<Rpm_Lead>>,
    signature: RefCell<OptRc<Rpm_Header>>,
    signature_padding: RefCell<Vec<u8>>,
    unnamed3: RefCell<Vec<u8>>,
    header: RefCell<OptRc<Rpm_Header>>,
    unnamed5: RefCell<Vec<u8>>,
    signature_tags_steps: RefCell<Vec<OptRc<Rpm_SignatureTagsStep>>>,
    _io: RefCell<BytesReader>,
    f_has_signature_size_tag: Cell<bool>,
    has_signature_size_tag: RefCell<bool>,
    f_len_header: Cell<bool>,
    len_header: RefCell<i32>,
    f_len_payload: Cell<bool>,
    len_payload: RefCell<i32>,
    f_ofs_header: Cell<bool>,
    ofs_header: RefCell<i32>,
    f_ofs_payload: Cell<bool>,
    ofs_payload: RefCell<i32>,
    f_payload: Cell<bool>,
    payload: RefCell<Vec<u8>>,
    f_signature_size_tag: Cell<bool>,
    signature_size_tag: RefCell<OptRc<Rpm_HeaderIndexRecord>>,
}
impl KStruct for Rpm {
    type Root = Rpm;
    type Parent = Rpm;

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
        let t = Self::read_into::<_, Rpm_Lead>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.lead.borrow_mut() = t;
        let f = |t : &mut Rpm_Header| Ok(t.set_params(true));
        let t = Self::read_into_with_init::<_, Rpm_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
        *self_rc.signature.borrow_mut() = t;
        *self_rc.signature_padding.borrow_mut() = _io.read_bytes(modulo(-(_io.pos()) as i64, 8 as i64) as usize)?.into();
        if ((*self_rc.ofs_header()? as i32) < (0 as i32)) {
            *self_rc.unnamed3.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        let f = |t : &mut Rpm_Header| Ok(t.set_params(false));
        let t = Self::read_into_with_init::<_, Rpm_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
        *self_rc.header.borrow_mut() = t;
        if ((*self_rc.ofs_payload()? as i32) < (0 as i32)) {
            *self_rc.unnamed5.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        *self_rc.signature_tags_steps.borrow_mut() = Vec::new();
        let l_signature_tags_steps = *self_rc.signature().header_record().num_index_records();
        for _i in 0..l_signature_tags_steps {
            let f = |t : &mut Rpm_SignatureTagsStep| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?, (if ((_i as i32) < (1 as i32)) { -1 } else { *self_rc.signature_tags_steps()[((_i as i32) - (1 as i32)) as usize].size_tag_idx()? }).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Rpm_SignatureTagsStep>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.signature_tags_steps.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Rpm {
    pub fn has_signature_size_tag(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_signature_size_tag.get() {
            return Ok(self.has_signature_size_tag.borrow());
        }
        self.f_has_signature_size_tag.set(true);
        *self.has_signature_size_tag.borrow_mut() = (*self.signature_tags_steps().last().ok_or(KError::EmptyIterator)?.size_tag_idx()? != -1) as bool;
        Ok(self.has_signature_size_tag.borrow())
    }
    pub fn len_header(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_header.get() {
            return Ok(self.len_header.borrow());
        }
        self.f_len_header.set(true);
        *self.len_header.borrow_mut() = (((*self.ofs_payload()? as i32) - (*self.ofs_header()? as i32))) as i32;
        Ok(self.len_header.borrow())
    }
    pub fn len_payload(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_payload.get() {
            return Ok(self.len_payload.borrow());
        }
        self.f_len_payload.set(true);
        if *self.has_signature_size_tag()? {
            *self.len_payload.borrow_mut() = (((Into::<OptRc<Rpm_RecordTypeUint32>>::into(&*self.signature_size_tag()?.body()?.as_ref().unwrap()).values()[0 as usize] as i32) - (*self.len_header()? as i32))) as i32;
        }
        Ok(self.len_payload.borrow())
    }
    pub fn ofs_header(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_header.get() {
            return Ok(self.ofs_header.borrow());
        }
        self.f_ofs_header.set(true);
        *self.ofs_header.borrow_mut() = (_io.pos()) as i32;
        Ok(self.ofs_header.borrow())
    }
    pub fn ofs_payload(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_payload.get() {
            return Ok(self.ofs_payload.borrow());
        }
        self.f_ofs_payload.set(true);
        *self.ofs_payload.borrow_mut() = (_io.pos()) as i32;
        Ok(self.ofs_payload.borrow())
    }
    pub fn payload(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_payload.get() {
            return Ok(self.payload.borrow());
        }
        self.f_payload.set(true);
        if *self.has_signature_size_tag()? {
            let _pos = _io.pos();
            _io.seek(*self.ofs_payload()? as usize)?;
            *self.payload.borrow_mut() = _io.read_bytes(*self.len_payload()? as usize)?.into();
            _io.seek(_pos)?;
        }
        Ok(self.payload.borrow())
    }
    pub fn signature_size_tag(
        &self
    ) -> KResult<Ref<'_, OptRc<Rpm_HeaderIndexRecord>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_signature_size_tag.get() {
            return Ok(self.signature_size_tag.borrow());
        }
        if *self.has_signature_size_tag()? {
            *self.signature_size_tag.borrow_mut() = self.signature().index_records()[*self.signature_tags_steps().last().ok_or(KError::EmptyIterator)?.size_tag_idx()? as usize].clone();
        }
        Ok(self.signature_size_tag.borrow())
    }
}
impl Rpm {
    pub fn lead(&self) -> Ref<'_, OptRc<Rpm_Lead>> {
        self.lead.borrow()
    }
}
impl Rpm {
    pub fn signature(&self) -> Ref<'_, OptRc<Rpm_Header>> {
        self.signature.borrow()
    }
}
impl Rpm {
    pub fn signature_padding(&self) -> Ref<'_, Vec<u8>> {
        self.signature_padding.borrow()
    }
}
impl Rpm {
    pub fn unnamed3(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed3.borrow()
    }
}
impl Rpm {
    pub fn header(&self) -> Ref<'_, OptRc<Rpm_Header>> {
        self.header.borrow()
    }
}
impl Rpm {
    pub fn unnamed5(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed5.borrow()
    }
}
impl Rpm {
    pub fn signature_tags_steps(&self) -> Ref<'_, Vec<OptRc<Rpm_SignatureTagsStep>>> {
        self.signature_tags_steps.borrow()
    }
}
impl Rpm {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Rpm_Architectures {

    /**
     * x86 or x86_64
     */
    X86,

    /**
     * Alpha or Sparc64
     * \sa https://github.com/eclipse/packager/blob/51ccdd3/rpm/src/main/java/org/eclipse/packager/rpm/Architecture.java#L24 Source
     * \sa https://github.com/file/file/blob/9b2538d/magic/Magdir/rpm#L14 Source
     * \sa https://github.com/rpm-software-management/rpm/blob/afad3167/rpmrc.in#L188-L197 Source
     */
    Alpha,
    Sparc,
    Mips,
    Ppc,
    M68k,

    /**
     * SGI Inhouse Processors (IP)
     * \sa https://github.com/file/file/blob/9b2538d/magic/Magdir/rpm#L19 Source
     * \sa https://github.com/rpm-software-management/rpm/blob/afad3167/rpmrc.in#L219 Source
     */
    Sgi,
    Rs6000,
    Ia64,
    Sparc64,
    Mips64,
    Arm,
    M68kMint,
    S390,
    S390x,
    Ppc64,
    Sh,
    Xtensa,
    Aarch64,
    MipsR6,
    Mips64R6,
    Riscv,
    Loongarch64,

    /**
     * can be installed on any architecture
     * \sa https://github.com/file/file/blob/9b2538d/magic/Magdir/rpm#L31 Source
     * \sa https://github.com/rpm-software-management/rpm/blob/afad3167/lib/rpmrc.c#L1548 Source
     */
    NoArch,
    Unknown(i64),
}

impl TryFrom<i64> for Rpm_Architectures {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Rpm_Architectures> {
        match flag {
            1 => Ok(Rpm_Architectures::X86),
            2 => Ok(Rpm_Architectures::Alpha),
            3 => Ok(Rpm_Architectures::Sparc),
            4 => Ok(Rpm_Architectures::Mips),
            5 => Ok(Rpm_Architectures::Ppc),
            6 => Ok(Rpm_Architectures::M68k),
            7 => Ok(Rpm_Architectures::Sgi),
            8 => Ok(Rpm_Architectures::Rs6000),
            9 => Ok(Rpm_Architectures::Ia64),
            10 => Ok(Rpm_Architectures::Sparc64),
            11 => Ok(Rpm_Architectures::Mips64),
            12 => Ok(Rpm_Architectures::Arm),
            13 => Ok(Rpm_Architectures::M68kMint),
            14 => Ok(Rpm_Architectures::S390),
            15 => Ok(Rpm_Architectures::S390x),
            16 => Ok(Rpm_Architectures::Ppc64),
            17 => Ok(Rpm_Architectures::Sh),
            18 => Ok(Rpm_Architectures::Xtensa),
            19 => Ok(Rpm_Architectures::Aarch64),
            20 => Ok(Rpm_Architectures::MipsR6),
            21 => Ok(Rpm_Architectures::Mips64R6),
            22 => Ok(Rpm_Architectures::Riscv),
            23 => Ok(Rpm_Architectures::Loongarch64),
            255 => Ok(Rpm_Architectures::NoArch),
            _ => Ok(Rpm_Architectures::Unknown(flag)),
        }
    }
}

impl From<&Rpm_Architectures> for i64 {
    fn from(v: &Rpm_Architectures) -> Self {
        match *v {
            Rpm_Architectures::X86 => 1,
            Rpm_Architectures::Alpha => 2,
            Rpm_Architectures::Sparc => 3,
            Rpm_Architectures::Mips => 4,
            Rpm_Architectures::Ppc => 5,
            Rpm_Architectures::M68k => 6,
            Rpm_Architectures::Sgi => 7,
            Rpm_Architectures::Rs6000 => 8,
            Rpm_Architectures::Ia64 => 9,
            Rpm_Architectures::Sparc64 => 10,
            Rpm_Architectures::Mips64 => 11,
            Rpm_Architectures::Arm => 12,
            Rpm_Architectures::M68kMint => 13,
            Rpm_Architectures::S390 => 14,
            Rpm_Architectures::S390x => 15,
            Rpm_Architectures::Ppc64 => 16,
            Rpm_Architectures::Sh => 17,
            Rpm_Architectures::Xtensa => 18,
            Rpm_Architectures::Aarch64 => 19,
            Rpm_Architectures::MipsR6 => 20,
            Rpm_Architectures::Mips64R6 => 21,
            Rpm_Architectures::Riscv => 22,
            Rpm_Architectures::Loongarch64 => 23,
            Rpm_Architectures::NoArch => 255,
            Rpm_Architectures::Unknown(v) => v
        }
    }
}

impl Default for Rpm_Architectures {
    fn default() -> Self { Rpm_Architectures::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Rpm_HeaderTags {
    Signatures,
    HeaderImmutable,
    I18nTable,

    /**
     * Specifies the name of the package.
     */
    Name,

    /**
     * Specifies the version of the package.
     */
    Version,

    /**
     * Specifies the release of the package.
     */
    Release,
    Epoch,

    /**
     * Specifies the summary description of the package. The summary
     * value pointed to by this index record contains a one line
     * description of the package.
     */
    Summary,

    /**
     * Specifies the description of the package. The description value
     * pointed to by this index record contains a full desription of
     * the package.
     */
    Description,

    /**
     * Specifies the time as seconds since the epoch
     * at which the package was built.
     */
    BuildTime,

    /**
     * Specifies the hostname of the system on which the package was built.
     */
    BuildHost,
    InstallTime,

    /**
     * Specifies the sum of the sizes of the regular files in the archive.
     */
    Size,

    /**
     * Contains the name of the distribution on which the package was built.
     */
    Distribution,

    /**
     * Contains the name of the organization that produced the package.
     */
    Vendor,
    GifObsolete,
    XpmObsolete,

    /**
     * Specifies the license which applies to this package.
     */
    License,

    /**
     * Identifies the tool used to build the package.
     */
    Packager,

    /**
     * Specifies the administrative group to which this package belongs.
     */
    Group,
    ChangelogInternal,
    Source,
    Patch,

    /**
     * Generic package information URL.
     */
    Url,

    /**
     * Specifies the OS of the package.
     */
    Os,

    /**
     * Specifies the architecture of the package.
     */
    Arch,

    /**
     * Specifies the preinstall scriptlet. If present, then
     * `::pre_install_interpreter` shall also be present.
     */
    PreInstallScriptlet,

    /**
     * Specifies the postinstall scriptlet. If present, then
     * `::post_install_interpreter` shall also be present.
     */
    PostInstallScriptlet,

    /**
     * Specifies the preuninstall scriptlet. If present, then
     * `::pre_uninstall_interpreter` shall also be present.
     */
    PreUninstallScriptlet,

    /**
     * Specifies the postuninstall scriptlet. If present, then
     * `::post_uninstall_interpreter` shall also be present.
     */
    PostUninstallScriptlet,
    OldFileNamesObsolete,

    /**
     * Specifies the size of each file in the archive.
     */
    FileSizes,
    FileStates,

    /**
     * The mode of each file in the archive.
     */
    FileModes,
    FileUidsInternal,
    FileGidsInternal,

    /**
     * The device number from which the file was copied.
     */
    DeviceNumber,

    /**
     * The modification time in seconds since the epoch
     * of each file in the archive.
     */
    Mtimes,

    /**
     * The ASCII representation of the MD5 sum of the corresponding
     * file contents. This value is empty if the corresponding archive
     * entry is not a regular file.
     */
    FileDigests,

    /**
     * The target for a symlink, otherwise NULL.
     */
    LinkTos,

    /**
     * Specifies the bit(s) to classify and control how files
     * are to be installed.
     */
    FileFlags,
    RootInternal,

    /**
     * Specifies the owner of the corresponding file.
     */
    FileOwner,

    /**
     * Specifies the group of the corresponding file.
     */
    FileGroup,
    ExcludeInternal,
    ExclusiveInternal,
    IconObsolete,

    /**
     * Specifies the name of the source RPM.
     */
    SourceRpm,

    /**
     * Specifies the bit(s) to control how files are to be verified
     * after install, specifying which checks should be performed.
     */
    FileVerifyFlags,

    /**
     * Specifies the uncompressed size of the Payload archive,
     * including the cpio headers.
     */
    ArchiveSize,

    /**
     * The name of the dependency provided by this package.
     */
    ProvideName,

    /**
     * Bits(s) to specify the dependency range and context.
     */
    RequireFlags,

    /**
     * Indicates the dependencies for this package.
     */
    RequireName,

    /**
     * Indicates the versions associated with the values found
     * in the require_name index.
     */
    RequireVersion,
    NoSource,
    NoPatch,

    /**
     * Bits(s) to specify the conflict range and context.
     */
    ConflictFlags,

    /**
     * Indicates the conflicting dependencies for this package.
     */
    ConflictName,

    /**
     * Indicates the versions associated with the
     * values found in the conflict_name index.
     */
    ConflictVersion,
    DefaultPrefixInternal,
    BuildRootInternal,
    InstallPrefixInternal,
    ExcludeArch,
    ExcludeOs,
    ExclusiveArch,
    ExclusiveOs,
    AutoreqprovInternal,

    /**
     * Indicates the version of RPM tool used to build this package.
     */
    RpmVersion,
    TriggerScripts,
    TriggerName,
    TriggerVersion,
    TriggerFlags,
    TriggerIndex,
    VerifyScript,

    /**
     * Specifies the Unix time in seconds since the epoch
     * associated with each entry in the Changelog file.
     */
    ChangelogTime,

    /**
     * Specifies the name of who made a change to this package.
     */
    ChangelogName,

    /**
     * Specifies the changes asssociated with a changelog entry.
     */
    ChangelogText,
    BrokenMd5Internal,
    PrereqInternal,

    /**
     * Specifies the name of the interpreter to which the preinstall
     * scriptlet will be passed. The interpreter pointed to by this
     * index record shall be `/bin/sh`.
     */
    PreInstallInterpreter,

    /**
     * Specifies the name of the interpreter to which the postinstall
     * scriptlet will be passed. The intepreter pointed to by this
     * index record shall be `/bin/sh`.
     */
    PostInstallInterpreter,

    /**
     * Specifies the name of the interpreter to which the preuninstall
     * scriptlet will be passed. The interpreter pointed to by this index
     * record shall be `/bin/sh`.
     */
    PreUninstallInterpreter,

    /**
     * Specifies the name of the interpreter to which the postuninstall
     * scriptlet will be passed. The interpreter pointed to by this index
     * record shall be `/bin/sh`.
     */
    PostUninstallInterpreter,
    BuildArchs,

    /**
     * Indicates the obsoleted dependencies for this package.
     */
    ObsoleteName,
    VerifyScriptProg,
    TriggerScriptProg,
    DocDirInternal,

    /**
     * Contains an opaque string whose contents are undefined.
     */
    Cookie,

    /**
     * Specifies the 16 bit device number from which the file was copied.
     */
    FileDevices,

    /**
     * Specifies the inode value from the original file system
     * on the the system on which it was built.
     */
    FileInodes,

    /**
     * Specifies a per-file locale marker used to install only locale
     * specific subsets of files when the package is installed.
     */
    FileLangs,
    Prefixes,
    InstallPrefixes,
    TriggerInstallInternal,
    TriggerUninstallInternal,
    TriggerPostUninstallInternal,
    AutoreqInternal,
    AutoprovInternal,
    CapabilityInternal,
    SourcePackage,
    OldOrigFilenamesInternal,
    BuildPrereqInternal,
    BuildRequiresInternal,
    BuildConflictsInternal,
    BuildMacrosInternal,

    /**
     * Bits(s) to specify the conflict range and context.
     */
    ProvideFlags,

    /**
     * Indicates the versions associated with the values found
     * in the provide_name index.
     */
    ProvideVersion,
    ObsoleteFlags,
    ObsoleteVersion,
    DirIndexes,
    BaseNames,
    DirNames,
    OrigDirIndexes,
    OrigBaseNames,
    OrigDirNames,
    OptFlags,
    DistUrl,
    PayloadFormat,
    PayloadCompressor,
    PayloadFlags,
    InstallColor,
    InstallTid,
    RemoveTidObsolete,
    Sha1RhnInternal,
    RhnPlatformInternal,
    Platform,
    PatchesNameObsolete,
    PatchesFlagsObsolete,
    PatchesVersionObsolete,
    CacheCtimeInternal,
    CachePkgPathInternal,
    CachePkgSizeInternal,
    CachePkgMtimeInternal,
    FileColors,
    FileClass,
    ClassDict,

    /**
     * Index into `::depends_dict` denoting start of this file's dependencies.
     */
    FileDependsIdx,

    /**
     * Number of file dependencies in `::depends_dict`, starting from `::file_depends_idx`
     */
    FileDependsNum,
    DependsDict,
    SourcePkgid,
    FileContextsObsolete,
    FsContextsObsolete,
    ReContextsObsolete,
    Policies,
    PreTrans,
    PostTrans,
    PreTransProg,
    PostTransProg,
    DistTag,
    OldSuggestsNameObsolete,
    OldSuggestsVersionObsolete,
    OldSuggestsFlagsObsolete,
    OldEnhancesNameObsolete,
    OldEnhancesVersionObsolete,
    OldEnhancesFlagsObsolete,
    PriorityUnimplemented,
    CvsidUnimplemented,
    BlinkPkgidUnimplemented,
    BlinkHdridUnimplemented,
    BlinkNevraUnimplemented,
    FlinkPkgidUnimplemented,
    FlinkHdridUnimplemented,
    FlinkNevraUnimplemented,
    PackageOriginUnimplemented,
    TriggerPreInstallInternal,
    BuildSuggestsUnimplemented,
    BuildEnhancesUnimplemented,
    ScriptStatesUnimplemented,
    ScriptMetricsUnimplemented,
    BuildCpuClockUnimplemented,
    FileDigestAlgosUnimplemented,
    VariantsUnimplemented,
    XmajorUnimplemented,
    XminorUnimplemented,
    RepoTagUnimplemented,
    KeywordsUnimplemented,
    BuildPlatformsUnimplemented,
    PackageColorUnimplemented,
    PackagePrefColorUnimplemented,
    XattrsDictUnimplemented,
    FilexAttrsxUnimplemented,
    DepAttrsDictUnimplemented,
    ConflictAttrsxUnimplemented,
    ObsoleteAttrsxUnimplemented,
    ProvideAttrsxUnimplemented,
    RequireAttrsxUnimplemented,
    BuildProvidesUnimplemented,
    BuildObsoletesUnimplemented,
    DbInstance,
    Nvra,
    FileNames,
    FileProvide,
    FileRequire,
    FsNamesUnimplemented,
    FsSizesUnimplemented,
    TriggerConds,
    TriggerType,
    OrigFileNames,
    LongFileSizes,
    LongSize,
    FileCaps,

    /**
     * File digest algorithm
     */
    FileDigestAlgo,
    BugUrl,
    Evr,
    Nvr,
    Nevr,
    Nevra,
    HeaderColor,
    Verbose,
    EpochNum,
    PreInstallFlags,
    PostInstallFlags,
    PreUninstallFlags,
    PostUninstallFlags,
    PreTransFlags,
    PostTransFlags,
    VerifyScriptFlags,
    TriggerScriptFlags,
    CollectionsUnimplemented,
    PolicyNames,
    PolicyTypes,
    PolicyTypesIndexes,
    PolicyFlags,
    Vcs,
    OrderName,
    OrderVersion,
    OrderFlags,
    MssfManifestUnimplemented,
    MssfDomainUnimplemented,
    InstFileNames,
    RequireNevrs,
    ProvideNevrs,
    ObsoleteNevrs,
    ConflictNevrs,
    FileNlinks,
    RecommendName,
    RecommendVersion,
    RecommendFlags,
    SuggestName,
    SuggestVersion,
    SuggestFlags,
    SupplementName,
    SupplementVersion,
    SupplementFlags,
    EnhanceName,
    EnhanceVersion,
    EnhanceFlags,
    RecommendNevrs,
    SuggestNevrs,
    SupplementNevrs,
    EnhanceNevrs,
    Encoding,
    FileTriggerInstallInternal,
    FileTriggerUninstallInternal,
    FileTriggerPostUninstallInternal,
    FileTriggerScripts,
    FileTriggerScriptProg,
    FileTriggerScriptFlags,
    FileTriggerName,
    FileTriggerIndex,
    FileTriggerVersion,
    FileTriggerFlags,
    TransFileTriggerInstallInternal,
    TransFileTriggerUninstallInternal,
    TransFileTriggerPostUninstallInternal,
    TransFileTriggerScripts,
    TransFileTriggerScriptProg,
    TransFileTriggerScriptFlags,
    TransFileTriggerName,
    TransFileTriggerIndex,
    TransFileTriggerVersion,
    TransFileTriggerFlags,
    RemovePathPostfixesInternal,
    FileTriggerPriorities,
    TransFileTriggerPriorities,
    FileTriggerConds,
    FileTriggerType,
    TransFileTriggerConds,
    TransFileTriggerType,
    FileSignatures,
    FileSignatureLength,
    PayloadDigest,
    PayloadDigestAlgo,
    AutoInstalledUnimplemented,
    IdentityUnimplemented,
    ModularityLabel,
    PayloadDigestAlt,
    ArchSuffix,
    Spec,
    TranslationUrl,
    UpstreamReleases,
    SourceLicenseInternal,
    PreUntrans,
    PostUntrans,
    PreUntransProg,
    PostUntransProg,
    PreUntransFlags,
    PostUntransFlags,
    SysUsers,
    Unknown(i64),
}

impl TryFrom<i64> for Rpm_HeaderTags {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Rpm_HeaderTags> {
        match flag {
            62 => Ok(Rpm_HeaderTags::Signatures),
            63 => Ok(Rpm_HeaderTags::HeaderImmutable),
            100 => Ok(Rpm_HeaderTags::I18nTable),
            1000 => Ok(Rpm_HeaderTags::Name),
            1001 => Ok(Rpm_HeaderTags::Version),
            1002 => Ok(Rpm_HeaderTags::Release),
            1003 => Ok(Rpm_HeaderTags::Epoch),
            1004 => Ok(Rpm_HeaderTags::Summary),
            1005 => Ok(Rpm_HeaderTags::Description),
            1006 => Ok(Rpm_HeaderTags::BuildTime),
            1007 => Ok(Rpm_HeaderTags::BuildHost),
            1008 => Ok(Rpm_HeaderTags::InstallTime),
            1009 => Ok(Rpm_HeaderTags::Size),
            1010 => Ok(Rpm_HeaderTags::Distribution),
            1011 => Ok(Rpm_HeaderTags::Vendor),
            1012 => Ok(Rpm_HeaderTags::GifObsolete),
            1013 => Ok(Rpm_HeaderTags::XpmObsolete),
            1014 => Ok(Rpm_HeaderTags::License),
            1015 => Ok(Rpm_HeaderTags::Packager),
            1016 => Ok(Rpm_HeaderTags::Group),
            1017 => Ok(Rpm_HeaderTags::ChangelogInternal),
            1018 => Ok(Rpm_HeaderTags::Source),
            1019 => Ok(Rpm_HeaderTags::Patch),
            1020 => Ok(Rpm_HeaderTags::Url),
            1021 => Ok(Rpm_HeaderTags::Os),
            1022 => Ok(Rpm_HeaderTags::Arch),
            1023 => Ok(Rpm_HeaderTags::PreInstallScriptlet),
            1024 => Ok(Rpm_HeaderTags::PostInstallScriptlet),
            1025 => Ok(Rpm_HeaderTags::PreUninstallScriptlet),
            1026 => Ok(Rpm_HeaderTags::PostUninstallScriptlet),
            1027 => Ok(Rpm_HeaderTags::OldFileNamesObsolete),
            1028 => Ok(Rpm_HeaderTags::FileSizes),
            1029 => Ok(Rpm_HeaderTags::FileStates),
            1030 => Ok(Rpm_HeaderTags::FileModes),
            1031 => Ok(Rpm_HeaderTags::FileUidsInternal),
            1032 => Ok(Rpm_HeaderTags::FileGidsInternal),
            1033 => Ok(Rpm_HeaderTags::DeviceNumber),
            1034 => Ok(Rpm_HeaderTags::Mtimes),
            1035 => Ok(Rpm_HeaderTags::FileDigests),
            1036 => Ok(Rpm_HeaderTags::LinkTos),
            1037 => Ok(Rpm_HeaderTags::FileFlags),
            1038 => Ok(Rpm_HeaderTags::RootInternal),
            1039 => Ok(Rpm_HeaderTags::FileOwner),
            1040 => Ok(Rpm_HeaderTags::FileGroup),
            1041 => Ok(Rpm_HeaderTags::ExcludeInternal),
            1042 => Ok(Rpm_HeaderTags::ExclusiveInternal),
            1043 => Ok(Rpm_HeaderTags::IconObsolete),
            1044 => Ok(Rpm_HeaderTags::SourceRpm),
            1045 => Ok(Rpm_HeaderTags::FileVerifyFlags),
            1046 => Ok(Rpm_HeaderTags::ArchiveSize),
            1047 => Ok(Rpm_HeaderTags::ProvideName),
            1048 => Ok(Rpm_HeaderTags::RequireFlags),
            1049 => Ok(Rpm_HeaderTags::RequireName),
            1050 => Ok(Rpm_HeaderTags::RequireVersion),
            1051 => Ok(Rpm_HeaderTags::NoSource),
            1052 => Ok(Rpm_HeaderTags::NoPatch),
            1053 => Ok(Rpm_HeaderTags::ConflictFlags),
            1054 => Ok(Rpm_HeaderTags::ConflictName),
            1055 => Ok(Rpm_HeaderTags::ConflictVersion),
            1056 => Ok(Rpm_HeaderTags::DefaultPrefixInternal),
            1057 => Ok(Rpm_HeaderTags::BuildRootInternal),
            1058 => Ok(Rpm_HeaderTags::InstallPrefixInternal),
            1059 => Ok(Rpm_HeaderTags::ExcludeArch),
            1060 => Ok(Rpm_HeaderTags::ExcludeOs),
            1061 => Ok(Rpm_HeaderTags::ExclusiveArch),
            1062 => Ok(Rpm_HeaderTags::ExclusiveOs),
            1063 => Ok(Rpm_HeaderTags::AutoreqprovInternal),
            1064 => Ok(Rpm_HeaderTags::RpmVersion),
            1065 => Ok(Rpm_HeaderTags::TriggerScripts),
            1066 => Ok(Rpm_HeaderTags::TriggerName),
            1067 => Ok(Rpm_HeaderTags::TriggerVersion),
            1068 => Ok(Rpm_HeaderTags::TriggerFlags),
            1069 => Ok(Rpm_HeaderTags::TriggerIndex),
            1079 => Ok(Rpm_HeaderTags::VerifyScript),
            1080 => Ok(Rpm_HeaderTags::ChangelogTime),
            1081 => Ok(Rpm_HeaderTags::ChangelogName),
            1082 => Ok(Rpm_HeaderTags::ChangelogText),
            1083 => Ok(Rpm_HeaderTags::BrokenMd5Internal),
            1084 => Ok(Rpm_HeaderTags::PrereqInternal),
            1085 => Ok(Rpm_HeaderTags::PreInstallInterpreter),
            1086 => Ok(Rpm_HeaderTags::PostInstallInterpreter),
            1087 => Ok(Rpm_HeaderTags::PreUninstallInterpreter),
            1088 => Ok(Rpm_HeaderTags::PostUninstallInterpreter),
            1089 => Ok(Rpm_HeaderTags::BuildArchs),
            1090 => Ok(Rpm_HeaderTags::ObsoleteName),
            1091 => Ok(Rpm_HeaderTags::VerifyScriptProg),
            1092 => Ok(Rpm_HeaderTags::TriggerScriptProg),
            1093 => Ok(Rpm_HeaderTags::DocDirInternal),
            1094 => Ok(Rpm_HeaderTags::Cookie),
            1095 => Ok(Rpm_HeaderTags::FileDevices),
            1096 => Ok(Rpm_HeaderTags::FileInodes),
            1097 => Ok(Rpm_HeaderTags::FileLangs),
            1098 => Ok(Rpm_HeaderTags::Prefixes),
            1099 => Ok(Rpm_HeaderTags::InstallPrefixes),
            1100 => Ok(Rpm_HeaderTags::TriggerInstallInternal),
            1101 => Ok(Rpm_HeaderTags::TriggerUninstallInternal),
            1102 => Ok(Rpm_HeaderTags::TriggerPostUninstallInternal),
            1103 => Ok(Rpm_HeaderTags::AutoreqInternal),
            1104 => Ok(Rpm_HeaderTags::AutoprovInternal),
            1105 => Ok(Rpm_HeaderTags::CapabilityInternal),
            1106 => Ok(Rpm_HeaderTags::SourcePackage),
            1107 => Ok(Rpm_HeaderTags::OldOrigFilenamesInternal),
            1108 => Ok(Rpm_HeaderTags::BuildPrereqInternal),
            1109 => Ok(Rpm_HeaderTags::BuildRequiresInternal),
            1110 => Ok(Rpm_HeaderTags::BuildConflictsInternal),
            1111 => Ok(Rpm_HeaderTags::BuildMacrosInternal),
            1112 => Ok(Rpm_HeaderTags::ProvideFlags),
            1113 => Ok(Rpm_HeaderTags::ProvideVersion),
            1114 => Ok(Rpm_HeaderTags::ObsoleteFlags),
            1115 => Ok(Rpm_HeaderTags::ObsoleteVersion),
            1116 => Ok(Rpm_HeaderTags::DirIndexes),
            1117 => Ok(Rpm_HeaderTags::BaseNames),
            1118 => Ok(Rpm_HeaderTags::DirNames),
            1119 => Ok(Rpm_HeaderTags::OrigDirIndexes),
            1120 => Ok(Rpm_HeaderTags::OrigBaseNames),
            1121 => Ok(Rpm_HeaderTags::OrigDirNames),
            1122 => Ok(Rpm_HeaderTags::OptFlags),
            1123 => Ok(Rpm_HeaderTags::DistUrl),
            1124 => Ok(Rpm_HeaderTags::PayloadFormat),
            1125 => Ok(Rpm_HeaderTags::PayloadCompressor),
            1126 => Ok(Rpm_HeaderTags::PayloadFlags),
            1127 => Ok(Rpm_HeaderTags::InstallColor),
            1128 => Ok(Rpm_HeaderTags::InstallTid),
            1129 => Ok(Rpm_HeaderTags::RemoveTidObsolete),
            1130 => Ok(Rpm_HeaderTags::Sha1RhnInternal),
            1131 => Ok(Rpm_HeaderTags::RhnPlatformInternal),
            1132 => Ok(Rpm_HeaderTags::Platform),
            1133 => Ok(Rpm_HeaderTags::PatchesNameObsolete),
            1134 => Ok(Rpm_HeaderTags::PatchesFlagsObsolete),
            1135 => Ok(Rpm_HeaderTags::PatchesVersionObsolete),
            1136 => Ok(Rpm_HeaderTags::CacheCtimeInternal),
            1137 => Ok(Rpm_HeaderTags::CachePkgPathInternal),
            1138 => Ok(Rpm_HeaderTags::CachePkgSizeInternal),
            1139 => Ok(Rpm_HeaderTags::CachePkgMtimeInternal),
            1140 => Ok(Rpm_HeaderTags::FileColors),
            1141 => Ok(Rpm_HeaderTags::FileClass),
            1142 => Ok(Rpm_HeaderTags::ClassDict),
            1143 => Ok(Rpm_HeaderTags::FileDependsIdx),
            1144 => Ok(Rpm_HeaderTags::FileDependsNum),
            1145 => Ok(Rpm_HeaderTags::DependsDict),
            1146 => Ok(Rpm_HeaderTags::SourcePkgid),
            1147 => Ok(Rpm_HeaderTags::FileContextsObsolete),
            1148 => Ok(Rpm_HeaderTags::FsContextsObsolete),
            1149 => Ok(Rpm_HeaderTags::ReContextsObsolete),
            1150 => Ok(Rpm_HeaderTags::Policies),
            1151 => Ok(Rpm_HeaderTags::PreTrans),
            1152 => Ok(Rpm_HeaderTags::PostTrans),
            1153 => Ok(Rpm_HeaderTags::PreTransProg),
            1154 => Ok(Rpm_HeaderTags::PostTransProg),
            1155 => Ok(Rpm_HeaderTags::DistTag),
            1156 => Ok(Rpm_HeaderTags::OldSuggestsNameObsolete),
            1157 => Ok(Rpm_HeaderTags::OldSuggestsVersionObsolete),
            1158 => Ok(Rpm_HeaderTags::OldSuggestsFlagsObsolete),
            1159 => Ok(Rpm_HeaderTags::OldEnhancesNameObsolete),
            1160 => Ok(Rpm_HeaderTags::OldEnhancesVersionObsolete),
            1161 => Ok(Rpm_HeaderTags::OldEnhancesFlagsObsolete),
            1162 => Ok(Rpm_HeaderTags::PriorityUnimplemented),
            1163 => Ok(Rpm_HeaderTags::CvsidUnimplemented),
            1164 => Ok(Rpm_HeaderTags::BlinkPkgidUnimplemented),
            1165 => Ok(Rpm_HeaderTags::BlinkHdridUnimplemented),
            1166 => Ok(Rpm_HeaderTags::BlinkNevraUnimplemented),
            1167 => Ok(Rpm_HeaderTags::FlinkPkgidUnimplemented),
            1168 => Ok(Rpm_HeaderTags::FlinkHdridUnimplemented),
            1169 => Ok(Rpm_HeaderTags::FlinkNevraUnimplemented),
            1170 => Ok(Rpm_HeaderTags::PackageOriginUnimplemented),
            1171 => Ok(Rpm_HeaderTags::TriggerPreInstallInternal),
            1172 => Ok(Rpm_HeaderTags::BuildSuggestsUnimplemented),
            1173 => Ok(Rpm_HeaderTags::BuildEnhancesUnimplemented),
            1174 => Ok(Rpm_HeaderTags::ScriptStatesUnimplemented),
            1175 => Ok(Rpm_HeaderTags::ScriptMetricsUnimplemented),
            1176 => Ok(Rpm_HeaderTags::BuildCpuClockUnimplemented),
            1177 => Ok(Rpm_HeaderTags::FileDigestAlgosUnimplemented),
            1178 => Ok(Rpm_HeaderTags::VariantsUnimplemented),
            1179 => Ok(Rpm_HeaderTags::XmajorUnimplemented),
            1180 => Ok(Rpm_HeaderTags::XminorUnimplemented),
            1181 => Ok(Rpm_HeaderTags::RepoTagUnimplemented),
            1182 => Ok(Rpm_HeaderTags::KeywordsUnimplemented),
            1183 => Ok(Rpm_HeaderTags::BuildPlatformsUnimplemented),
            1184 => Ok(Rpm_HeaderTags::PackageColorUnimplemented),
            1185 => Ok(Rpm_HeaderTags::PackagePrefColorUnimplemented),
            1186 => Ok(Rpm_HeaderTags::XattrsDictUnimplemented),
            1187 => Ok(Rpm_HeaderTags::FilexAttrsxUnimplemented),
            1188 => Ok(Rpm_HeaderTags::DepAttrsDictUnimplemented),
            1189 => Ok(Rpm_HeaderTags::ConflictAttrsxUnimplemented),
            1190 => Ok(Rpm_HeaderTags::ObsoleteAttrsxUnimplemented),
            1191 => Ok(Rpm_HeaderTags::ProvideAttrsxUnimplemented),
            1192 => Ok(Rpm_HeaderTags::RequireAttrsxUnimplemented),
            1193 => Ok(Rpm_HeaderTags::BuildProvidesUnimplemented),
            1194 => Ok(Rpm_HeaderTags::BuildObsoletesUnimplemented),
            1195 => Ok(Rpm_HeaderTags::DbInstance),
            1196 => Ok(Rpm_HeaderTags::Nvra),
            5000 => Ok(Rpm_HeaderTags::FileNames),
            5001 => Ok(Rpm_HeaderTags::FileProvide),
            5002 => Ok(Rpm_HeaderTags::FileRequire),
            5003 => Ok(Rpm_HeaderTags::FsNamesUnimplemented),
            5004 => Ok(Rpm_HeaderTags::FsSizesUnimplemented),
            5005 => Ok(Rpm_HeaderTags::TriggerConds),
            5006 => Ok(Rpm_HeaderTags::TriggerType),
            5007 => Ok(Rpm_HeaderTags::OrigFileNames),
            5008 => Ok(Rpm_HeaderTags::LongFileSizes),
            5009 => Ok(Rpm_HeaderTags::LongSize),
            5010 => Ok(Rpm_HeaderTags::FileCaps),
            5011 => Ok(Rpm_HeaderTags::FileDigestAlgo),
            5012 => Ok(Rpm_HeaderTags::BugUrl),
            5013 => Ok(Rpm_HeaderTags::Evr),
            5014 => Ok(Rpm_HeaderTags::Nvr),
            5015 => Ok(Rpm_HeaderTags::Nevr),
            5016 => Ok(Rpm_HeaderTags::Nevra),
            5017 => Ok(Rpm_HeaderTags::HeaderColor),
            5018 => Ok(Rpm_HeaderTags::Verbose),
            5019 => Ok(Rpm_HeaderTags::EpochNum),
            5020 => Ok(Rpm_HeaderTags::PreInstallFlags),
            5021 => Ok(Rpm_HeaderTags::PostInstallFlags),
            5022 => Ok(Rpm_HeaderTags::PreUninstallFlags),
            5023 => Ok(Rpm_HeaderTags::PostUninstallFlags),
            5024 => Ok(Rpm_HeaderTags::PreTransFlags),
            5025 => Ok(Rpm_HeaderTags::PostTransFlags),
            5026 => Ok(Rpm_HeaderTags::VerifyScriptFlags),
            5027 => Ok(Rpm_HeaderTags::TriggerScriptFlags),
            5029 => Ok(Rpm_HeaderTags::CollectionsUnimplemented),
            5030 => Ok(Rpm_HeaderTags::PolicyNames),
            5031 => Ok(Rpm_HeaderTags::PolicyTypes),
            5032 => Ok(Rpm_HeaderTags::PolicyTypesIndexes),
            5033 => Ok(Rpm_HeaderTags::PolicyFlags),
            5034 => Ok(Rpm_HeaderTags::Vcs),
            5035 => Ok(Rpm_HeaderTags::OrderName),
            5036 => Ok(Rpm_HeaderTags::OrderVersion),
            5037 => Ok(Rpm_HeaderTags::OrderFlags),
            5038 => Ok(Rpm_HeaderTags::MssfManifestUnimplemented),
            5039 => Ok(Rpm_HeaderTags::MssfDomainUnimplemented),
            5040 => Ok(Rpm_HeaderTags::InstFileNames),
            5041 => Ok(Rpm_HeaderTags::RequireNevrs),
            5042 => Ok(Rpm_HeaderTags::ProvideNevrs),
            5043 => Ok(Rpm_HeaderTags::ObsoleteNevrs),
            5044 => Ok(Rpm_HeaderTags::ConflictNevrs),
            5045 => Ok(Rpm_HeaderTags::FileNlinks),
            5046 => Ok(Rpm_HeaderTags::RecommendName),
            5047 => Ok(Rpm_HeaderTags::RecommendVersion),
            5048 => Ok(Rpm_HeaderTags::RecommendFlags),
            5049 => Ok(Rpm_HeaderTags::SuggestName),
            5050 => Ok(Rpm_HeaderTags::SuggestVersion),
            5051 => Ok(Rpm_HeaderTags::SuggestFlags),
            5052 => Ok(Rpm_HeaderTags::SupplementName),
            5053 => Ok(Rpm_HeaderTags::SupplementVersion),
            5054 => Ok(Rpm_HeaderTags::SupplementFlags),
            5055 => Ok(Rpm_HeaderTags::EnhanceName),
            5056 => Ok(Rpm_HeaderTags::EnhanceVersion),
            5057 => Ok(Rpm_HeaderTags::EnhanceFlags),
            5058 => Ok(Rpm_HeaderTags::RecommendNevrs),
            5059 => Ok(Rpm_HeaderTags::SuggestNevrs),
            5060 => Ok(Rpm_HeaderTags::SupplementNevrs),
            5061 => Ok(Rpm_HeaderTags::EnhanceNevrs),
            5062 => Ok(Rpm_HeaderTags::Encoding),
            5063 => Ok(Rpm_HeaderTags::FileTriggerInstallInternal),
            5064 => Ok(Rpm_HeaderTags::FileTriggerUninstallInternal),
            5065 => Ok(Rpm_HeaderTags::FileTriggerPostUninstallInternal),
            5066 => Ok(Rpm_HeaderTags::FileTriggerScripts),
            5067 => Ok(Rpm_HeaderTags::FileTriggerScriptProg),
            5068 => Ok(Rpm_HeaderTags::FileTriggerScriptFlags),
            5069 => Ok(Rpm_HeaderTags::FileTriggerName),
            5070 => Ok(Rpm_HeaderTags::FileTriggerIndex),
            5071 => Ok(Rpm_HeaderTags::FileTriggerVersion),
            5072 => Ok(Rpm_HeaderTags::FileTriggerFlags),
            5073 => Ok(Rpm_HeaderTags::TransFileTriggerInstallInternal),
            5074 => Ok(Rpm_HeaderTags::TransFileTriggerUninstallInternal),
            5075 => Ok(Rpm_HeaderTags::TransFileTriggerPostUninstallInternal),
            5076 => Ok(Rpm_HeaderTags::TransFileTriggerScripts),
            5077 => Ok(Rpm_HeaderTags::TransFileTriggerScriptProg),
            5078 => Ok(Rpm_HeaderTags::TransFileTriggerScriptFlags),
            5079 => Ok(Rpm_HeaderTags::TransFileTriggerName),
            5080 => Ok(Rpm_HeaderTags::TransFileTriggerIndex),
            5081 => Ok(Rpm_HeaderTags::TransFileTriggerVersion),
            5082 => Ok(Rpm_HeaderTags::TransFileTriggerFlags),
            5083 => Ok(Rpm_HeaderTags::RemovePathPostfixesInternal),
            5084 => Ok(Rpm_HeaderTags::FileTriggerPriorities),
            5085 => Ok(Rpm_HeaderTags::TransFileTriggerPriorities),
            5086 => Ok(Rpm_HeaderTags::FileTriggerConds),
            5087 => Ok(Rpm_HeaderTags::FileTriggerType),
            5088 => Ok(Rpm_HeaderTags::TransFileTriggerConds),
            5089 => Ok(Rpm_HeaderTags::TransFileTriggerType),
            5090 => Ok(Rpm_HeaderTags::FileSignatures),
            5091 => Ok(Rpm_HeaderTags::FileSignatureLength),
            5092 => Ok(Rpm_HeaderTags::PayloadDigest),
            5093 => Ok(Rpm_HeaderTags::PayloadDigestAlgo),
            5094 => Ok(Rpm_HeaderTags::AutoInstalledUnimplemented),
            5095 => Ok(Rpm_HeaderTags::IdentityUnimplemented),
            5096 => Ok(Rpm_HeaderTags::ModularityLabel),
            5097 => Ok(Rpm_HeaderTags::PayloadDigestAlt),
            5098 => Ok(Rpm_HeaderTags::ArchSuffix),
            5099 => Ok(Rpm_HeaderTags::Spec),
            5100 => Ok(Rpm_HeaderTags::TranslationUrl),
            5101 => Ok(Rpm_HeaderTags::UpstreamReleases),
            5102 => Ok(Rpm_HeaderTags::SourceLicenseInternal),
            5103 => Ok(Rpm_HeaderTags::PreUntrans),
            5104 => Ok(Rpm_HeaderTags::PostUntrans),
            5105 => Ok(Rpm_HeaderTags::PreUntransProg),
            5106 => Ok(Rpm_HeaderTags::PostUntransProg),
            5107 => Ok(Rpm_HeaderTags::PreUntransFlags),
            5108 => Ok(Rpm_HeaderTags::PostUntransFlags),
            5109 => Ok(Rpm_HeaderTags::SysUsers),
            _ => Ok(Rpm_HeaderTags::Unknown(flag)),
        }
    }
}

impl From<&Rpm_HeaderTags> for i64 {
    fn from(v: &Rpm_HeaderTags) -> Self {
        match *v {
            Rpm_HeaderTags::Signatures => 62,
            Rpm_HeaderTags::HeaderImmutable => 63,
            Rpm_HeaderTags::I18nTable => 100,
            Rpm_HeaderTags::Name => 1000,
            Rpm_HeaderTags::Version => 1001,
            Rpm_HeaderTags::Release => 1002,
            Rpm_HeaderTags::Epoch => 1003,
            Rpm_HeaderTags::Summary => 1004,
            Rpm_HeaderTags::Description => 1005,
            Rpm_HeaderTags::BuildTime => 1006,
            Rpm_HeaderTags::BuildHost => 1007,
            Rpm_HeaderTags::InstallTime => 1008,
            Rpm_HeaderTags::Size => 1009,
            Rpm_HeaderTags::Distribution => 1010,
            Rpm_HeaderTags::Vendor => 1011,
            Rpm_HeaderTags::GifObsolete => 1012,
            Rpm_HeaderTags::XpmObsolete => 1013,
            Rpm_HeaderTags::License => 1014,
            Rpm_HeaderTags::Packager => 1015,
            Rpm_HeaderTags::Group => 1016,
            Rpm_HeaderTags::ChangelogInternal => 1017,
            Rpm_HeaderTags::Source => 1018,
            Rpm_HeaderTags::Patch => 1019,
            Rpm_HeaderTags::Url => 1020,
            Rpm_HeaderTags::Os => 1021,
            Rpm_HeaderTags::Arch => 1022,
            Rpm_HeaderTags::PreInstallScriptlet => 1023,
            Rpm_HeaderTags::PostInstallScriptlet => 1024,
            Rpm_HeaderTags::PreUninstallScriptlet => 1025,
            Rpm_HeaderTags::PostUninstallScriptlet => 1026,
            Rpm_HeaderTags::OldFileNamesObsolete => 1027,
            Rpm_HeaderTags::FileSizes => 1028,
            Rpm_HeaderTags::FileStates => 1029,
            Rpm_HeaderTags::FileModes => 1030,
            Rpm_HeaderTags::FileUidsInternal => 1031,
            Rpm_HeaderTags::FileGidsInternal => 1032,
            Rpm_HeaderTags::DeviceNumber => 1033,
            Rpm_HeaderTags::Mtimes => 1034,
            Rpm_HeaderTags::FileDigests => 1035,
            Rpm_HeaderTags::LinkTos => 1036,
            Rpm_HeaderTags::FileFlags => 1037,
            Rpm_HeaderTags::RootInternal => 1038,
            Rpm_HeaderTags::FileOwner => 1039,
            Rpm_HeaderTags::FileGroup => 1040,
            Rpm_HeaderTags::ExcludeInternal => 1041,
            Rpm_HeaderTags::ExclusiveInternal => 1042,
            Rpm_HeaderTags::IconObsolete => 1043,
            Rpm_HeaderTags::SourceRpm => 1044,
            Rpm_HeaderTags::FileVerifyFlags => 1045,
            Rpm_HeaderTags::ArchiveSize => 1046,
            Rpm_HeaderTags::ProvideName => 1047,
            Rpm_HeaderTags::RequireFlags => 1048,
            Rpm_HeaderTags::RequireName => 1049,
            Rpm_HeaderTags::RequireVersion => 1050,
            Rpm_HeaderTags::NoSource => 1051,
            Rpm_HeaderTags::NoPatch => 1052,
            Rpm_HeaderTags::ConflictFlags => 1053,
            Rpm_HeaderTags::ConflictName => 1054,
            Rpm_HeaderTags::ConflictVersion => 1055,
            Rpm_HeaderTags::DefaultPrefixInternal => 1056,
            Rpm_HeaderTags::BuildRootInternal => 1057,
            Rpm_HeaderTags::InstallPrefixInternal => 1058,
            Rpm_HeaderTags::ExcludeArch => 1059,
            Rpm_HeaderTags::ExcludeOs => 1060,
            Rpm_HeaderTags::ExclusiveArch => 1061,
            Rpm_HeaderTags::ExclusiveOs => 1062,
            Rpm_HeaderTags::AutoreqprovInternal => 1063,
            Rpm_HeaderTags::RpmVersion => 1064,
            Rpm_HeaderTags::TriggerScripts => 1065,
            Rpm_HeaderTags::TriggerName => 1066,
            Rpm_HeaderTags::TriggerVersion => 1067,
            Rpm_HeaderTags::TriggerFlags => 1068,
            Rpm_HeaderTags::TriggerIndex => 1069,
            Rpm_HeaderTags::VerifyScript => 1079,
            Rpm_HeaderTags::ChangelogTime => 1080,
            Rpm_HeaderTags::ChangelogName => 1081,
            Rpm_HeaderTags::ChangelogText => 1082,
            Rpm_HeaderTags::BrokenMd5Internal => 1083,
            Rpm_HeaderTags::PrereqInternal => 1084,
            Rpm_HeaderTags::PreInstallInterpreter => 1085,
            Rpm_HeaderTags::PostInstallInterpreter => 1086,
            Rpm_HeaderTags::PreUninstallInterpreter => 1087,
            Rpm_HeaderTags::PostUninstallInterpreter => 1088,
            Rpm_HeaderTags::BuildArchs => 1089,
            Rpm_HeaderTags::ObsoleteName => 1090,
            Rpm_HeaderTags::VerifyScriptProg => 1091,
            Rpm_HeaderTags::TriggerScriptProg => 1092,
            Rpm_HeaderTags::DocDirInternal => 1093,
            Rpm_HeaderTags::Cookie => 1094,
            Rpm_HeaderTags::FileDevices => 1095,
            Rpm_HeaderTags::FileInodes => 1096,
            Rpm_HeaderTags::FileLangs => 1097,
            Rpm_HeaderTags::Prefixes => 1098,
            Rpm_HeaderTags::InstallPrefixes => 1099,
            Rpm_HeaderTags::TriggerInstallInternal => 1100,
            Rpm_HeaderTags::TriggerUninstallInternal => 1101,
            Rpm_HeaderTags::TriggerPostUninstallInternal => 1102,
            Rpm_HeaderTags::AutoreqInternal => 1103,
            Rpm_HeaderTags::AutoprovInternal => 1104,
            Rpm_HeaderTags::CapabilityInternal => 1105,
            Rpm_HeaderTags::SourcePackage => 1106,
            Rpm_HeaderTags::OldOrigFilenamesInternal => 1107,
            Rpm_HeaderTags::BuildPrereqInternal => 1108,
            Rpm_HeaderTags::BuildRequiresInternal => 1109,
            Rpm_HeaderTags::BuildConflictsInternal => 1110,
            Rpm_HeaderTags::BuildMacrosInternal => 1111,
            Rpm_HeaderTags::ProvideFlags => 1112,
            Rpm_HeaderTags::ProvideVersion => 1113,
            Rpm_HeaderTags::ObsoleteFlags => 1114,
            Rpm_HeaderTags::ObsoleteVersion => 1115,
            Rpm_HeaderTags::DirIndexes => 1116,
            Rpm_HeaderTags::BaseNames => 1117,
            Rpm_HeaderTags::DirNames => 1118,
            Rpm_HeaderTags::OrigDirIndexes => 1119,
            Rpm_HeaderTags::OrigBaseNames => 1120,
            Rpm_HeaderTags::OrigDirNames => 1121,
            Rpm_HeaderTags::OptFlags => 1122,
            Rpm_HeaderTags::DistUrl => 1123,
            Rpm_HeaderTags::PayloadFormat => 1124,
            Rpm_HeaderTags::PayloadCompressor => 1125,
            Rpm_HeaderTags::PayloadFlags => 1126,
            Rpm_HeaderTags::InstallColor => 1127,
            Rpm_HeaderTags::InstallTid => 1128,
            Rpm_HeaderTags::RemoveTidObsolete => 1129,
            Rpm_HeaderTags::Sha1RhnInternal => 1130,
            Rpm_HeaderTags::RhnPlatformInternal => 1131,
            Rpm_HeaderTags::Platform => 1132,
            Rpm_HeaderTags::PatchesNameObsolete => 1133,
            Rpm_HeaderTags::PatchesFlagsObsolete => 1134,
            Rpm_HeaderTags::PatchesVersionObsolete => 1135,
            Rpm_HeaderTags::CacheCtimeInternal => 1136,
            Rpm_HeaderTags::CachePkgPathInternal => 1137,
            Rpm_HeaderTags::CachePkgSizeInternal => 1138,
            Rpm_HeaderTags::CachePkgMtimeInternal => 1139,
            Rpm_HeaderTags::FileColors => 1140,
            Rpm_HeaderTags::FileClass => 1141,
            Rpm_HeaderTags::ClassDict => 1142,
            Rpm_HeaderTags::FileDependsIdx => 1143,
            Rpm_HeaderTags::FileDependsNum => 1144,
            Rpm_HeaderTags::DependsDict => 1145,
            Rpm_HeaderTags::SourcePkgid => 1146,
            Rpm_HeaderTags::FileContextsObsolete => 1147,
            Rpm_HeaderTags::FsContextsObsolete => 1148,
            Rpm_HeaderTags::ReContextsObsolete => 1149,
            Rpm_HeaderTags::Policies => 1150,
            Rpm_HeaderTags::PreTrans => 1151,
            Rpm_HeaderTags::PostTrans => 1152,
            Rpm_HeaderTags::PreTransProg => 1153,
            Rpm_HeaderTags::PostTransProg => 1154,
            Rpm_HeaderTags::DistTag => 1155,
            Rpm_HeaderTags::OldSuggestsNameObsolete => 1156,
            Rpm_HeaderTags::OldSuggestsVersionObsolete => 1157,
            Rpm_HeaderTags::OldSuggestsFlagsObsolete => 1158,
            Rpm_HeaderTags::OldEnhancesNameObsolete => 1159,
            Rpm_HeaderTags::OldEnhancesVersionObsolete => 1160,
            Rpm_HeaderTags::OldEnhancesFlagsObsolete => 1161,
            Rpm_HeaderTags::PriorityUnimplemented => 1162,
            Rpm_HeaderTags::CvsidUnimplemented => 1163,
            Rpm_HeaderTags::BlinkPkgidUnimplemented => 1164,
            Rpm_HeaderTags::BlinkHdridUnimplemented => 1165,
            Rpm_HeaderTags::BlinkNevraUnimplemented => 1166,
            Rpm_HeaderTags::FlinkPkgidUnimplemented => 1167,
            Rpm_HeaderTags::FlinkHdridUnimplemented => 1168,
            Rpm_HeaderTags::FlinkNevraUnimplemented => 1169,
            Rpm_HeaderTags::PackageOriginUnimplemented => 1170,
            Rpm_HeaderTags::TriggerPreInstallInternal => 1171,
            Rpm_HeaderTags::BuildSuggestsUnimplemented => 1172,
            Rpm_HeaderTags::BuildEnhancesUnimplemented => 1173,
            Rpm_HeaderTags::ScriptStatesUnimplemented => 1174,
            Rpm_HeaderTags::ScriptMetricsUnimplemented => 1175,
            Rpm_HeaderTags::BuildCpuClockUnimplemented => 1176,
            Rpm_HeaderTags::FileDigestAlgosUnimplemented => 1177,
            Rpm_HeaderTags::VariantsUnimplemented => 1178,
            Rpm_HeaderTags::XmajorUnimplemented => 1179,
            Rpm_HeaderTags::XminorUnimplemented => 1180,
            Rpm_HeaderTags::RepoTagUnimplemented => 1181,
            Rpm_HeaderTags::KeywordsUnimplemented => 1182,
            Rpm_HeaderTags::BuildPlatformsUnimplemented => 1183,
            Rpm_HeaderTags::PackageColorUnimplemented => 1184,
            Rpm_HeaderTags::PackagePrefColorUnimplemented => 1185,
            Rpm_HeaderTags::XattrsDictUnimplemented => 1186,
            Rpm_HeaderTags::FilexAttrsxUnimplemented => 1187,
            Rpm_HeaderTags::DepAttrsDictUnimplemented => 1188,
            Rpm_HeaderTags::ConflictAttrsxUnimplemented => 1189,
            Rpm_HeaderTags::ObsoleteAttrsxUnimplemented => 1190,
            Rpm_HeaderTags::ProvideAttrsxUnimplemented => 1191,
            Rpm_HeaderTags::RequireAttrsxUnimplemented => 1192,
            Rpm_HeaderTags::BuildProvidesUnimplemented => 1193,
            Rpm_HeaderTags::BuildObsoletesUnimplemented => 1194,
            Rpm_HeaderTags::DbInstance => 1195,
            Rpm_HeaderTags::Nvra => 1196,
            Rpm_HeaderTags::FileNames => 5000,
            Rpm_HeaderTags::FileProvide => 5001,
            Rpm_HeaderTags::FileRequire => 5002,
            Rpm_HeaderTags::FsNamesUnimplemented => 5003,
            Rpm_HeaderTags::FsSizesUnimplemented => 5004,
            Rpm_HeaderTags::TriggerConds => 5005,
            Rpm_HeaderTags::TriggerType => 5006,
            Rpm_HeaderTags::OrigFileNames => 5007,
            Rpm_HeaderTags::LongFileSizes => 5008,
            Rpm_HeaderTags::LongSize => 5009,
            Rpm_HeaderTags::FileCaps => 5010,
            Rpm_HeaderTags::FileDigestAlgo => 5011,
            Rpm_HeaderTags::BugUrl => 5012,
            Rpm_HeaderTags::Evr => 5013,
            Rpm_HeaderTags::Nvr => 5014,
            Rpm_HeaderTags::Nevr => 5015,
            Rpm_HeaderTags::Nevra => 5016,
            Rpm_HeaderTags::HeaderColor => 5017,
            Rpm_HeaderTags::Verbose => 5018,
            Rpm_HeaderTags::EpochNum => 5019,
            Rpm_HeaderTags::PreInstallFlags => 5020,
            Rpm_HeaderTags::PostInstallFlags => 5021,
            Rpm_HeaderTags::PreUninstallFlags => 5022,
            Rpm_HeaderTags::PostUninstallFlags => 5023,
            Rpm_HeaderTags::PreTransFlags => 5024,
            Rpm_HeaderTags::PostTransFlags => 5025,
            Rpm_HeaderTags::VerifyScriptFlags => 5026,
            Rpm_HeaderTags::TriggerScriptFlags => 5027,
            Rpm_HeaderTags::CollectionsUnimplemented => 5029,
            Rpm_HeaderTags::PolicyNames => 5030,
            Rpm_HeaderTags::PolicyTypes => 5031,
            Rpm_HeaderTags::PolicyTypesIndexes => 5032,
            Rpm_HeaderTags::PolicyFlags => 5033,
            Rpm_HeaderTags::Vcs => 5034,
            Rpm_HeaderTags::OrderName => 5035,
            Rpm_HeaderTags::OrderVersion => 5036,
            Rpm_HeaderTags::OrderFlags => 5037,
            Rpm_HeaderTags::MssfManifestUnimplemented => 5038,
            Rpm_HeaderTags::MssfDomainUnimplemented => 5039,
            Rpm_HeaderTags::InstFileNames => 5040,
            Rpm_HeaderTags::RequireNevrs => 5041,
            Rpm_HeaderTags::ProvideNevrs => 5042,
            Rpm_HeaderTags::ObsoleteNevrs => 5043,
            Rpm_HeaderTags::ConflictNevrs => 5044,
            Rpm_HeaderTags::FileNlinks => 5045,
            Rpm_HeaderTags::RecommendName => 5046,
            Rpm_HeaderTags::RecommendVersion => 5047,
            Rpm_HeaderTags::RecommendFlags => 5048,
            Rpm_HeaderTags::SuggestName => 5049,
            Rpm_HeaderTags::SuggestVersion => 5050,
            Rpm_HeaderTags::SuggestFlags => 5051,
            Rpm_HeaderTags::SupplementName => 5052,
            Rpm_HeaderTags::SupplementVersion => 5053,
            Rpm_HeaderTags::SupplementFlags => 5054,
            Rpm_HeaderTags::EnhanceName => 5055,
            Rpm_HeaderTags::EnhanceVersion => 5056,
            Rpm_HeaderTags::EnhanceFlags => 5057,
            Rpm_HeaderTags::RecommendNevrs => 5058,
            Rpm_HeaderTags::SuggestNevrs => 5059,
            Rpm_HeaderTags::SupplementNevrs => 5060,
            Rpm_HeaderTags::EnhanceNevrs => 5061,
            Rpm_HeaderTags::Encoding => 5062,
            Rpm_HeaderTags::FileTriggerInstallInternal => 5063,
            Rpm_HeaderTags::FileTriggerUninstallInternal => 5064,
            Rpm_HeaderTags::FileTriggerPostUninstallInternal => 5065,
            Rpm_HeaderTags::FileTriggerScripts => 5066,
            Rpm_HeaderTags::FileTriggerScriptProg => 5067,
            Rpm_HeaderTags::FileTriggerScriptFlags => 5068,
            Rpm_HeaderTags::FileTriggerName => 5069,
            Rpm_HeaderTags::FileTriggerIndex => 5070,
            Rpm_HeaderTags::FileTriggerVersion => 5071,
            Rpm_HeaderTags::FileTriggerFlags => 5072,
            Rpm_HeaderTags::TransFileTriggerInstallInternal => 5073,
            Rpm_HeaderTags::TransFileTriggerUninstallInternal => 5074,
            Rpm_HeaderTags::TransFileTriggerPostUninstallInternal => 5075,
            Rpm_HeaderTags::TransFileTriggerScripts => 5076,
            Rpm_HeaderTags::TransFileTriggerScriptProg => 5077,
            Rpm_HeaderTags::TransFileTriggerScriptFlags => 5078,
            Rpm_HeaderTags::TransFileTriggerName => 5079,
            Rpm_HeaderTags::TransFileTriggerIndex => 5080,
            Rpm_HeaderTags::TransFileTriggerVersion => 5081,
            Rpm_HeaderTags::TransFileTriggerFlags => 5082,
            Rpm_HeaderTags::RemovePathPostfixesInternal => 5083,
            Rpm_HeaderTags::FileTriggerPriorities => 5084,
            Rpm_HeaderTags::TransFileTriggerPriorities => 5085,
            Rpm_HeaderTags::FileTriggerConds => 5086,
            Rpm_HeaderTags::FileTriggerType => 5087,
            Rpm_HeaderTags::TransFileTriggerConds => 5088,
            Rpm_HeaderTags::TransFileTriggerType => 5089,
            Rpm_HeaderTags::FileSignatures => 5090,
            Rpm_HeaderTags::FileSignatureLength => 5091,
            Rpm_HeaderTags::PayloadDigest => 5092,
            Rpm_HeaderTags::PayloadDigestAlgo => 5093,
            Rpm_HeaderTags::AutoInstalledUnimplemented => 5094,
            Rpm_HeaderTags::IdentityUnimplemented => 5095,
            Rpm_HeaderTags::ModularityLabel => 5096,
            Rpm_HeaderTags::PayloadDigestAlt => 5097,
            Rpm_HeaderTags::ArchSuffix => 5098,
            Rpm_HeaderTags::Spec => 5099,
            Rpm_HeaderTags::TranslationUrl => 5100,
            Rpm_HeaderTags::UpstreamReleases => 5101,
            Rpm_HeaderTags::SourceLicenseInternal => 5102,
            Rpm_HeaderTags::PreUntrans => 5103,
            Rpm_HeaderTags::PostUntrans => 5104,
            Rpm_HeaderTags::PreUntransProg => 5105,
            Rpm_HeaderTags::PostUntransProg => 5106,
            Rpm_HeaderTags::PreUntransFlags => 5107,
            Rpm_HeaderTags::PostUntransFlags => 5108,
            Rpm_HeaderTags::SysUsers => 5109,
            Rpm_HeaderTags::Unknown(v) => v
        }
    }
}

impl Default for Rpm_HeaderTags {
    fn default() -> Self { Rpm_HeaderTags::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Rpm_OperatingSystems {
    Linux,
    Irix,

    /**
     * This value is pretty much a guess, based on that `archnum` and `osnum`
     * values are handled by the same function `getMachineInfo()` (see
     * `doc-ref` link) which uses 255 for an unknown value. Value
     * `architectures::no_arch` can be verified with the magic file of
     * `file(1)` and `.rpm` files that have `noarch` in their name, so it seems
     * reasonable that `no_os` (or "`noos`" originally) follows the same
     * pattern.
     * 
     * Moreover, this value is actually used in practice, see this sample file:
     * <https://github.com/craigwblake/redline/blob/15afff5/src/test/resources/rpm-3-1.0-1.somearch.rpm>
     * \sa https://github.com/rpm-software-management/rpm/blob/afad3167/lib/rpmrc.c#L1548 Source
     */
    NoOs,
    Unknown(i64),
}

impl TryFrom<i64> for Rpm_OperatingSystems {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Rpm_OperatingSystems> {
        match flag {
            1 => Ok(Rpm_OperatingSystems::Linux),
            2 => Ok(Rpm_OperatingSystems::Irix),
            255 => Ok(Rpm_OperatingSystems::NoOs),
            _ => Ok(Rpm_OperatingSystems::Unknown(flag)),
        }
    }
}

impl From<&Rpm_OperatingSystems> for i64 {
    fn from(v: &Rpm_OperatingSystems) -> Self {
        match *v {
            Rpm_OperatingSystems::Linux => 1,
            Rpm_OperatingSystems::Irix => 2,
            Rpm_OperatingSystems::NoOs => 255,
            Rpm_OperatingSystems::Unknown(v) => v
        }
    }
}

impl Default for Rpm_OperatingSystems {
    fn default() -> Self { Rpm_OperatingSystems::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Rpm_RecordTypes {
    NotImplemented,
    Char,
    Uint8,
    Uint16,
    Uint32,
    Uint64,
    String,
    Bin,
    StringArray,
    I18nString,
    Unknown(i64),
}

impl TryFrom<i64> for Rpm_RecordTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Rpm_RecordTypes> {
        match flag {
            0 => Ok(Rpm_RecordTypes::NotImplemented),
            1 => Ok(Rpm_RecordTypes::Char),
            2 => Ok(Rpm_RecordTypes::Uint8),
            3 => Ok(Rpm_RecordTypes::Uint16),
            4 => Ok(Rpm_RecordTypes::Uint32),
            5 => Ok(Rpm_RecordTypes::Uint64),
            6 => Ok(Rpm_RecordTypes::String),
            7 => Ok(Rpm_RecordTypes::Bin),
            8 => Ok(Rpm_RecordTypes::StringArray),
            9 => Ok(Rpm_RecordTypes::I18nString),
            _ => Ok(Rpm_RecordTypes::Unknown(flag)),
        }
    }
}

impl From<&Rpm_RecordTypes> for i64 {
    fn from(v: &Rpm_RecordTypes) -> Self {
        match *v {
            Rpm_RecordTypes::NotImplemented => 0,
            Rpm_RecordTypes::Char => 1,
            Rpm_RecordTypes::Uint8 => 2,
            Rpm_RecordTypes::Uint16 => 3,
            Rpm_RecordTypes::Uint32 => 4,
            Rpm_RecordTypes::Uint64 => 5,
            Rpm_RecordTypes::String => 6,
            Rpm_RecordTypes::Bin => 7,
            Rpm_RecordTypes::StringArray => 8,
            Rpm_RecordTypes::I18nString => 9,
            Rpm_RecordTypes::Unknown(v) => v
        }
    }
}

impl Default for Rpm_RecordTypes {
    fn default() -> Self { Rpm_RecordTypes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Rpm_RpmTypes {
    Binary,
    Source,
    Unknown(i64),
}

impl TryFrom<i64> for Rpm_RpmTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Rpm_RpmTypes> {
        match flag {
            0 => Ok(Rpm_RpmTypes::Binary),
            1 => Ok(Rpm_RpmTypes::Source),
            _ => Ok(Rpm_RpmTypes::Unknown(flag)),
        }
    }
}

impl From<&Rpm_RpmTypes> for i64 {
    fn from(v: &Rpm_RpmTypes) -> Self {
        match *v {
            Rpm_RpmTypes::Binary => 0,
            Rpm_RpmTypes::Source => 1,
            Rpm_RpmTypes::Unknown(v) => v
        }
    }
}

impl Default for Rpm_RpmTypes {
    fn default() -> Self { Rpm_RpmTypes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Rpm_SignatureTags {
    Signatures,
    HeaderImmutable,
    I18nTable,
    BadSha11Obsolete,
    BadSha12Obsolete,
    Dsa,
    Rsa,
    Sha1,
    LongSize,
    LongArchiveSize,
    Sha256,
    FileSignatures,
    FileSignatureLength,
    VeritySignatures,
    VeritySignatureAlgo,

    /**
     * Header + payload size (32bit) in bytes.
     */
    Size,

    /**
     * MD5 broken on big-endian machines, take 1
     */
    LeMd51Obsolete,

    /**
     * PGP 2.6.3 signature.
     */
    Pgp,

    /**
     * MD5 broken on big-endian machines, take 2
     */
    LeMd52Obsolete,

    /**
     * MD5 signature
     */
    Md5,

    /**
     * GnuPG signature
     */
    Gpg,
    Pgp5Obsolete,

    /**
     * Uncompressed payload size (32bit) in bytes.
     */
    PayloadSize,

    /**
     * Space reserved for signatures
     */
    ReservedSpace,
    Unknown(i64),
}

impl TryFrom<i64> for Rpm_SignatureTags {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Rpm_SignatureTags> {
        match flag {
            62 => Ok(Rpm_SignatureTags::Signatures),
            63 => Ok(Rpm_SignatureTags::HeaderImmutable),
            100 => Ok(Rpm_SignatureTags::I18nTable),
            264 => Ok(Rpm_SignatureTags::BadSha11Obsolete),
            265 => Ok(Rpm_SignatureTags::BadSha12Obsolete),
            267 => Ok(Rpm_SignatureTags::Dsa),
            268 => Ok(Rpm_SignatureTags::Rsa),
            269 => Ok(Rpm_SignatureTags::Sha1),
            270 => Ok(Rpm_SignatureTags::LongSize),
            271 => Ok(Rpm_SignatureTags::LongArchiveSize),
            273 => Ok(Rpm_SignatureTags::Sha256),
            274 => Ok(Rpm_SignatureTags::FileSignatures),
            275 => Ok(Rpm_SignatureTags::FileSignatureLength),
            276 => Ok(Rpm_SignatureTags::VeritySignatures),
            277 => Ok(Rpm_SignatureTags::VeritySignatureAlgo),
            1000 => Ok(Rpm_SignatureTags::Size),
            1001 => Ok(Rpm_SignatureTags::LeMd51Obsolete),
            1002 => Ok(Rpm_SignatureTags::Pgp),
            1003 => Ok(Rpm_SignatureTags::LeMd52Obsolete),
            1004 => Ok(Rpm_SignatureTags::Md5),
            1005 => Ok(Rpm_SignatureTags::Gpg),
            1006 => Ok(Rpm_SignatureTags::Pgp5Obsolete),
            1007 => Ok(Rpm_SignatureTags::PayloadSize),
            1008 => Ok(Rpm_SignatureTags::ReservedSpace),
            _ => Ok(Rpm_SignatureTags::Unknown(flag)),
        }
    }
}

impl From<&Rpm_SignatureTags> for i64 {
    fn from(v: &Rpm_SignatureTags) -> Self {
        match *v {
            Rpm_SignatureTags::Signatures => 62,
            Rpm_SignatureTags::HeaderImmutable => 63,
            Rpm_SignatureTags::I18nTable => 100,
            Rpm_SignatureTags::BadSha11Obsolete => 264,
            Rpm_SignatureTags::BadSha12Obsolete => 265,
            Rpm_SignatureTags::Dsa => 267,
            Rpm_SignatureTags::Rsa => 268,
            Rpm_SignatureTags::Sha1 => 269,
            Rpm_SignatureTags::LongSize => 270,
            Rpm_SignatureTags::LongArchiveSize => 271,
            Rpm_SignatureTags::Sha256 => 273,
            Rpm_SignatureTags::FileSignatures => 274,
            Rpm_SignatureTags::FileSignatureLength => 275,
            Rpm_SignatureTags::VeritySignatures => 276,
            Rpm_SignatureTags::VeritySignatureAlgo => 277,
            Rpm_SignatureTags::Size => 1000,
            Rpm_SignatureTags::LeMd51Obsolete => 1001,
            Rpm_SignatureTags::Pgp => 1002,
            Rpm_SignatureTags::LeMd52Obsolete => 1003,
            Rpm_SignatureTags::Md5 => 1004,
            Rpm_SignatureTags::Gpg => 1005,
            Rpm_SignatureTags::Pgp5Obsolete => 1006,
            Rpm_SignatureTags::PayloadSize => 1007,
            Rpm_SignatureTags::ReservedSpace => 1008,
            Rpm_SignatureTags::Unknown(v) => v
        }
    }
}

impl Default for Rpm_SignatureTags {
    fn default() -> Self { Rpm_SignatureTags::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Rpm_Dummy {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm_Header>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rpm_Dummy {
    type Root = Rpm;
    type Parent = Rpm_Header;

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
impl Rpm_Dummy {
}
impl Rpm_Dummy {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * header structure used for both the "header" and "signature", but some tag
 * values have different meanings in signature and header (hence they use
 * different enums)
 */

#[derive(Default, Debug, Clone)]
pub struct Rpm_Header {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm>,
    pub _self: SharedType<Self>,
    is_signature: RefCell<bool>,
    header_record: RefCell<OptRc<Rpm_HeaderRecord>>,
    index_records: RefCell<Vec<OptRc<Rpm_HeaderIndexRecord>>>,
    storage_section: RefCell<OptRc<Rpm_Dummy>>,
    _io: RefCell<BytesReader>,
    storage_section_raw: RefCell<Vec<u8>>,
    f_is_header: Cell<bool>,
    is_header: RefCell<bool>,
}
impl KStruct for Rpm_Header {
    type Root = Rpm;
    type Parent = Rpm;

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
        let t = Self::read_into::<_, Rpm_HeaderRecord>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header_record.borrow_mut() = t;
        *self_rc.index_records.borrow_mut() = Vec::new();
        let l_index_records = *self_rc.header_record().num_index_records();
        for _i in 0..l_index_records {
            let t = Self::read_into::<_, Rpm_HeaderIndexRecord>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.index_records.borrow_mut().push(t);
        }
        *self_rc.storage_section_raw.borrow_mut() = _io.read_bytes(*self_rc.header_record().len_storage_section() as usize)?.into();
        let storage_section_raw = self_rc.storage_section_raw.borrow();
        let _t_storage_section_raw_io = BytesReader::from(storage_section_raw.clone());
        let t = Self::read_into::<BytesReader, Rpm_Dummy>(&_t_storage_section_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.storage_section.borrow_mut() = t;
        Ok(())
    }
}
impl Rpm_Header {
    pub fn is_signature(&self) -> Ref<'_, bool> {
        self.is_signature.borrow()
    }
}
impl Rpm_Header {
    pub fn set_params(&mut self, is_signature: bool) {
        *self.is_signature.borrow_mut() = is_signature;
    }
}
impl Rpm_Header {
    pub fn is_header(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_header.get() {
            return Ok(self.is_header.borrow());
        }
        self.f_is_header.set(true);
        *self.is_header.borrow_mut() = (!(*self.is_signature())) as bool;
        Ok(self.is_header.borrow())
    }
}
impl Rpm_Header {
    pub fn header_record(&self) -> Ref<'_, OptRc<Rpm_HeaderRecord>> {
        self.header_record.borrow()
    }
}
impl Rpm_Header {
    pub fn index_records(&self) -> Ref<'_, Vec<OptRc<Rpm_HeaderIndexRecord>>> {
        self.index_records.borrow()
    }
}
impl Rpm_Header {
    pub fn storage_section(&self) -> Ref<'_, OptRc<Rpm_Dummy>> {
        self.storage_section.borrow()
    }
}
impl Rpm_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Rpm_Header {
    pub fn storage_section_raw(&self) -> Ref<'_, Vec<u8>> {
        self.storage_section_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rpm_HeaderIndexRecord {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm_Header>,
    pub _self: SharedType<Self>,
    tag_raw: RefCell<u32>,
    record_type: RefCell<Rpm_RecordTypes>,
    ofs_body: RefCell<u32>,
    count: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Option<Rpm_HeaderIndexRecord_Body>>,
    f_header_tag: Cell<bool>,
    header_tag: RefCell<Rpm_HeaderTags>,
    f_len_value: Cell<bool>,
    len_value: RefCell<u32>,
    f_num_values: Cell<bool>,
    num_values: RefCell<u32>,
    f_signature_tag: Cell<bool>,
    signature_tag: RefCell<Rpm_SignatureTags>,
}
#[derive(Debug, Clone)]
pub enum Rpm_HeaderIndexRecord_Body {
    Rpm_RecordTypeUint32(OptRc<Rpm_RecordTypeUint32>),
    Rpm_RecordTypeUint64(OptRc<Rpm_RecordTypeUint64>),
    Rpm_RecordTypeUint16(OptRc<Rpm_RecordTypeUint16>),
    Rpm_RecordTypeUint8(OptRc<Rpm_RecordTypeUint8>),
    Rpm_RecordTypeString(OptRc<Rpm_RecordTypeString>),
    Rpm_RecordTypeBin(OptRc<Rpm_RecordTypeBin>),
    Rpm_RecordTypeStringArray(OptRc<Rpm_RecordTypeStringArray>),
}
impl From<&Rpm_HeaderIndexRecord_Body> for OptRc<Rpm_RecordTypeUint32> {
    fn from(v: &Rpm_HeaderIndexRecord_Body) -> Self {
        if let Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeUint32(x) = v {
            return x.clone();
        }
        panic!("expected Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeUint32, got {:?}", v)
    }
}
impl From<OptRc<Rpm_RecordTypeUint32>> for Rpm_HeaderIndexRecord_Body {
    fn from(v: OptRc<Rpm_RecordTypeUint32>) -> Self {
        Self::Rpm_RecordTypeUint32(v)
    }
}
impl From<&Rpm_HeaderIndexRecord_Body> for OptRc<Rpm_RecordTypeUint64> {
    fn from(v: &Rpm_HeaderIndexRecord_Body) -> Self {
        if let Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeUint64(x) = v {
            return x.clone();
        }
        panic!("expected Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeUint64, got {:?}", v)
    }
}
impl From<OptRc<Rpm_RecordTypeUint64>> for Rpm_HeaderIndexRecord_Body {
    fn from(v: OptRc<Rpm_RecordTypeUint64>) -> Self {
        Self::Rpm_RecordTypeUint64(v)
    }
}
impl From<&Rpm_HeaderIndexRecord_Body> for OptRc<Rpm_RecordTypeUint16> {
    fn from(v: &Rpm_HeaderIndexRecord_Body) -> Self {
        if let Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeUint16(x) = v {
            return x.clone();
        }
        panic!("expected Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeUint16, got {:?}", v)
    }
}
impl From<OptRc<Rpm_RecordTypeUint16>> for Rpm_HeaderIndexRecord_Body {
    fn from(v: OptRc<Rpm_RecordTypeUint16>) -> Self {
        Self::Rpm_RecordTypeUint16(v)
    }
}
impl From<&Rpm_HeaderIndexRecord_Body> for OptRc<Rpm_RecordTypeUint8> {
    fn from(v: &Rpm_HeaderIndexRecord_Body) -> Self {
        if let Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeUint8(x) = v {
            return x.clone();
        }
        panic!("expected Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeUint8, got {:?}", v)
    }
}
impl From<OptRc<Rpm_RecordTypeUint8>> for Rpm_HeaderIndexRecord_Body {
    fn from(v: OptRc<Rpm_RecordTypeUint8>) -> Self {
        Self::Rpm_RecordTypeUint8(v)
    }
}
impl From<&Rpm_HeaderIndexRecord_Body> for OptRc<Rpm_RecordTypeString> {
    fn from(v: &Rpm_HeaderIndexRecord_Body) -> Self {
        if let Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeString(x) = v {
            return x.clone();
        }
        panic!("expected Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeString, got {:?}", v)
    }
}
impl From<OptRc<Rpm_RecordTypeString>> for Rpm_HeaderIndexRecord_Body {
    fn from(v: OptRc<Rpm_RecordTypeString>) -> Self {
        Self::Rpm_RecordTypeString(v)
    }
}
impl From<&Rpm_HeaderIndexRecord_Body> for OptRc<Rpm_RecordTypeBin> {
    fn from(v: &Rpm_HeaderIndexRecord_Body) -> Self {
        if let Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeBin(x) = v {
            return x.clone();
        }
        panic!("expected Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeBin, got {:?}", v)
    }
}
impl From<OptRc<Rpm_RecordTypeBin>> for Rpm_HeaderIndexRecord_Body {
    fn from(v: OptRc<Rpm_RecordTypeBin>) -> Self {
        Self::Rpm_RecordTypeBin(v)
    }
}
impl From<&Rpm_HeaderIndexRecord_Body> for OptRc<Rpm_RecordTypeStringArray> {
    fn from(v: &Rpm_HeaderIndexRecord_Body) -> Self {
        if let Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeStringArray(x) = v {
            return x.clone();
        }
        panic!("expected Rpm_HeaderIndexRecord_Body::Rpm_RecordTypeStringArray, got {:?}", v)
    }
}
impl From<OptRc<Rpm_RecordTypeStringArray>> for Rpm_HeaderIndexRecord_Body {
    fn from(v: OptRc<Rpm_RecordTypeStringArray>) -> Self {
        Self::Rpm_RecordTypeStringArray(v)
    }
}
impl KStruct for Rpm_HeaderIndexRecord {
    type Root = Rpm;
    type Parent = Rpm_Header;

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
        *self_rc.tag_raw.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.record_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.ofs_body.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.count.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Rpm_HeaderIndexRecord {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, Option<Rpm_HeaderIndexRecord_Body>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        self.f_body.set(true);
        let io = Clone::clone(&*_prc.as_ref().unwrap().storage_section()._io());
        let _pos = io.pos();
        io.seek(*self.ofs_body() as usize)?;
        match *self.record_type() {
            Rpm_RecordTypes::Bin => {
                let f = |t : &mut Rpm_RecordTypeBin| Ok(t.set_params((*self.len_value()?).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<BytesReader, Rpm_RecordTypeBin>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.body.borrow_mut() = Some(t);
            }
            Rpm_RecordTypes::Char => {
                let f = |t : &mut Rpm_RecordTypeUint8| Ok(t.set_params((*self.num_values()?).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<BytesReader, Rpm_RecordTypeUint8>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.body.borrow_mut() = Some(t);
            }
            Rpm_RecordTypes::I18nString => {
                let f = |t : &mut Rpm_RecordTypeStringArray| Ok(t.set_params((*self.num_values()?).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<BytesReader, Rpm_RecordTypeStringArray>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.body.borrow_mut() = Some(t);
            }
            Rpm_RecordTypes::String => {
                let t = Self::read_into::<BytesReader, Rpm_RecordTypeString>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.body.borrow_mut() = Some(t);
            }
            Rpm_RecordTypes::StringArray => {
                let f = |t : &mut Rpm_RecordTypeStringArray| Ok(t.set_params((*self.num_values()?).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<BytesReader, Rpm_RecordTypeStringArray>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.body.borrow_mut() = Some(t);
            }
            Rpm_RecordTypes::Uint16 => {
                let f = |t : &mut Rpm_RecordTypeUint16| Ok(t.set_params((*self.num_values()?).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<BytesReader, Rpm_RecordTypeUint16>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.body.borrow_mut() = Some(t);
            }
            Rpm_RecordTypes::Uint32 => {
                let f = |t : &mut Rpm_RecordTypeUint32| Ok(t.set_params((*self.num_values()?).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<BytesReader, Rpm_RecordTypeUint32>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.body.borrow_mut() = Some(t);
            }
            Rpm_RecordTypes::Uint64 => {
                let f = |t : &mut Rpm_RecordTypeUint64| Ok(t.set_params((*self.num_values()?).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<BytesReader, Rpm_RecordTypeUint64>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.body.borrow_mut() = Some(t);
            }
            Rpm_RecordTypes::Uint8 => {
                let f = |t : &mut Rpm_RecordTypeUint8| Ok(t.set_params((*self.num_values()?).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<BytesReader, Rpm_RecordTypeUint8>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                *self.body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        io.seek(_pos)?;
        Ok(self.body.borrow())
    }
    pub fn header_tag(
        &self
    ) -> KResult<Ref<'_, Rpm_HeaderTags>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_header_tag.get() {
            return Ok(self.header_tag.borrow());
        }
        self.f_header_tag.set(true);
        if *_prc.as_ref().unwrap().is_header()? {
            *self.header_tag.borrow_mut() = (*self.tag_raw() as i64).try_into()?;
        }
        Ok(self.header_tag.borrow())
    }
    pub fn len_value(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_value.get() {
            return Ok(self.len_value.borrow());
        }
        self.f_len_value.set(true);
        if *self.record_type() == Rpm_RecordTypes::Bin {
            *self.len_value.borrow_mut() = (*self.count()) as u32;
        }
        Ok(self.len_value.borrow())
    }
    pub fn num_values(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_values.get() {
            return Ok(self.num_values.borrow());
        }
        self.f_num_values.set(true);
        if *self.record_type() != Rpm_RecordTypes::Bin {
            *self.num_values.borrow_mut() = (*self.count()) as u32;
        }
        Ok(self.num_values.borrow())
    }
    pub fn signature_tag(
        &self
    ) -> KResult<Ref<'_, Rpm_SignatureTags>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_signature_tag.get() {
            return Ok(self.signature_tag.borrow());
        }
        self.f_signature_tag.set(true);
        if *_prc.as_ref().unwrap().is_signature() {
            *self.signature_tag.borrow_mut() = (*self.tag_raw() as i64).try_into()?;
        }
        Ok(self.signature_tag.borrow())
    }
}

/**
 * prefer to access `signature_tag` and `header_tag` instead
 */
impl Rpm_HeaderIndexRecord {
    pub fn tag_raw(&self) -> Ref<'_, u32> {
        self.tag_raw.borrow()
    }
}
impl Rpm_HeaderIndexRecord {
    pub fn record_type(&self) -> Ref<'_, Rpm_RecordTypes> {
        self.record_type.borrow()
    }
}
impl Rpm_HeaderIndexRecord {
    pub fn ofs_body(&self) -> Ref<'_, u32> {
        self.ofs_body.borrow()
    }
}

/**
 * internal; access `num_values` and `len_value` instead
 */
impl Rpm_HeaderIndexRecord {
    pub fn count(&self) -> Ref<'_, u32> {
        self.count.borrow()
    }
}
impl Rpm_HeaderIndexRecord {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rpm_HeaderRecord {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm_Header>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    reserved: RefCell<Vec<u8>>,
    num_index_records: RefCell<u32>,
    len_storage_section: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rpm_HeaderRecord {
    type Root = Rpm;
    type Parent = Rpm_Header;

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
        if !(*self_rc.magic() == vec![0x8eu8, 0xadu8, 0xe8u8, 0x1u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header_record/seq/0".to_string() }));
        }
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header_record/seq/1".to_string() }));
        }
        *self_rc.num_index_records.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.num_index_records() as u32) >= (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/header_record/seq/2".to_string() }));
        }
        *self_rc.len_storage_section.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Rpm_HeaderRecord {
}
impl Rpm_HeaderRecord {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Rpm_HeaderRecord {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Rpm_HeaderRecord {
    pub fn num_index_records(&self) -> Ref<'_, u32> {
        self.num_index_records.borrow()
    }
}

/**
 * Size of the storage area for the data
 * pointed to by the Index Records.
 */
impl Rpm_HeaderRecord {
    pub fn len_storage_section(&self) -> Ref<'_, u32> {
        self.len_storage_section.borrow()
    }
}
impl Rpm_HeaderRecord {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * In 2021, Panu Matilainen (a RPM developer) [described this
 * structure](https://github.com/kaitai-io/kaitai_struct_formats/pull/469#discussion_r718288192)
 * as follows:
 * 
 * > The lead as a structure is 25 years obsolete, the data there is
 * > meaningless. Seriously. Except to check for the magic to detect that
 * > it's an rpm file in the first place, just ignore everything in it.
 * > Literally everything.
 * 
 * The fields with `valid` constraints are important, because these are the
 * same validations that RPM does (which means that any valid `.rpm` file
 * must pass them), but otherwise you should not make decisions based on the
 * values given here.
 */

#[derive(Default, Debug, Clone)]
pub struct Rpm_Lead {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<OptRc<Rpm_RpmVersion>>,
    type: RefCell<Rpm_RpmTypes>,
    architecture: RefCell<Rpm_Architectures>,
    package_name: RefCell<String>,
    os: RefCell<Rpm_OperatingSystems>,
    signature_type: RefCell<u16>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rpm_Lead {
    type Root = Rpm;
    type Parent = Rpm;

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
        if !(*self_rc.magic() == vec![0xedu8, 0xabu8, 0xeeu8, 0xdbu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/lead/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, Rpm_RpmVersion>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.version.borrow_mut() = t;
        *self_rc.type.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.architecture.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.package_name.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(66 as usize)?.into(), 0, false).into(), "UTF-8")?;
        *self_rc.os.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.signature_type.borrow_mut() = _io.read_u2be()?.into();
        if !(((*self_rc.signature_type() as u16) == (5 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/lead/seq/6".to_string() }));
        }
        *self_rc.reserved.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        Ok(())
    }
}
impl Rpm_Lead {
}
impl Rpm_Lead {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Rpm_Lead {
    pub fn version(&self) -> Ref<'_, OptRc<Rpm_RpmVersion>> {
        self.version.borrow()
    }
}
impl Rpm_Lead {
    pub fn type(&self) -> Ref<'_, Rpm_RpmTypes> {
        self.type.borrow()
    }
}
impl Rpm_Lead {
    pub fn architecture(&self) -> Ref<'_, Rpm_Architectures> {
        self.architecture.borrow()
    }
}
impl Rpm_Lead {
    pub fn package_name(&self) -> Ref<'_, String> {
        self.package_name.borrow()
    }
}
impl Rpm_Lead {
    pub fn os(&self) -> Ref<'_, Rpm_OperatingSystems> {
        self.os.borrow()
    }
}
impl Rpm_Lead {
    pub fn signature_type(&self) -> Ref<'_, u16> {
        self.signature_type.borrow()
    }
}
impl Rpm_Lead {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Rpm_Lead {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rpm_RecordTypeBin {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm_HeaderIndexRecord>,
    pub _self: SharedType<Self>,
    len_value: RefCell<u32>,
    values: RefCell<Vec<Vec<u8>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rpm_RecordTypeBin {
    type Root = Rpm;
    type Parent = Rpm_HeaderIndexRecord;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = 1;
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(_io.read_bytes(*self_rc.len_value() as usize)?.into());
        }
        Ok(())
    }
}
impl Rpm_RecordTypeBin {
    pub fn len_value(&self) -> Ref<'_, u32> {
        self.len_value.borrow()
    }
}
impl Rpm_RecordTypeBin {
    pub fn set_params(&mut self, len_value: u32) {
        *self.len_value.borrow_mut() = len_value;
    }
}
impl Rpm_RecordTypeBin {
}
impl Rpm_RecordTypeBin {
    pub fn values(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.values.borrow()
    }
}
impl Rpm_RecordTypeBin {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rpm_RecordTypeString {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm_HeaderIndexRecord>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<String>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rpm_RecordTypeString {
    type Root = Rpm;
    type Parent = Rpm_HeaderIndexRecord;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = 1;
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?);
        }
        Ok(())
    }
}
impl Rpm_RecordTypeString {
}
impl Rpm_RecordTypeString {
    pub fn values(&self) -> Ref<'_, Vec<String>> {
        self.values.borrow()
    }
}
impl Rpm_RecordTypeString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rpm_RecordTypeStringArray {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm_HeaderIndexRecord>,
    pub _self: SharedType<Self>,
    num_values: RefCell<u32>,
    values: RefCell<Vec<String>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rpm_RecordTypeStringArray {
    type Root = Rpm;
    type Parent = Rpm_HeaderIndexRecord;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *self_rc.num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?);
        }
        Ok(())
    }
}
impl Rpm_RecordTypeStringArray {
    pub fn num_values(&self) -> Ref<'_, u32> {
        self.num_values.borrow()
    }
}
impl Rpm_RecordTypeStringArray {
    pub fn set_params(&mut self, num_values: u32) {
        *self.num_values.borrow_mut() = num_values;
    }
}
impl Rpm_RecordTypeStringArray {
}
impl Rpm_RecordTypeStringArray {
    pub fn values(&self) -> Ref<'_, Vec<String>> {
        self.values.borrow()
    }
}
impl Rpm_RecordTypeStringArray {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rpm_RecordTypeUint16 {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm_HeaderIndexRecord>,
    pub _self: SharedType<Self>,
    num_values: RefCell<u32>,
    values: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rpm_RecordTypeUint16 {
    type Root = Rpm;
    type Parent = Rpm_HeaderIndexRecord;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *self_rc.num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(_io.read_u2be()?.into());
        }
        Ok(())
    }
}
impl Rpm_RecordTypeUint16 {
    pub fn num_values(&self) -> Ref<'_, u32> {
        self.num_values.borrow()
    }
}
impl Rpm_RecordTypeUint16 {
    pub fn set_params(&mut self, num_values: u32) {
        *self.num_values.borrow_mut() = num_values;
    }
}
impl Rpm_RecordTypeUint16 {
}
impl Rpm_RecordTypeUint16 {
    pub fn values(&self) -> Ref<'_, Vec<u16>> {
        self.values.borrow()
    }
}
impl Rpm_RecordTypeUint16 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rpm_RecordTypeUint32 {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm_HeaderIndexRecord>,
    pub _self: SharedType<Self>,
    num_values: RefCell<u32>,
    values: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rpm_RecordTypeUint32 {
    type Root = Rpm;
    type Parent = Rpm_HeaderIndexRecord;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *self_rc.num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(_io.read_u4be()?.into());
        }
        Ok(())
    }
}
impl Rpm_RecordTypeUint32 {
    pub fn num_values(&self) -> Ref<'_, u32> {
        self.num_values.borrow()
    }
}
impl Rpm_RecordTypeUint32 {
    pub fn set_params(&mut self, num_values: u32) {
        *self.num_values.borrow_mut() = num_values;
    }
}
impl Rpm_RecordTypeUint32 {
}
impl Rpm_RecordTypeUint32 {
    pub fn values(&self) -> Ref<'_, Vec<u32>> {
        self.values.borrow()
    }
}
impl Rpm_RecordTypeUint32 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rpm_RecordTypeUint64 {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm_HeaderIndexRecord>,
    pub _self: SharedType<Self>,
    num_values: RefCell<u32>,
    values: RefCell<Vec<u64>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rpm_RecordTypeUint64 {
    type Root = Rpm;
    type Parent = Rpm_HeaderIndexRecord;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *self_rc.num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(_io.read_u8be()?.into());
        }
        Ok(())
    }
}
impl Rpm_RecordTypeUint64 {
    pub fn num_values(&self) -> Ref<'_, u32> {
        self.num_values.borrow()
    }
}
impl Rpm_RecordTypeUint64 {
    pub fn set_params(&mut self, num_values: u32) {
        *self.num_values.borrow_mut() = num_values;
    }
}
impl Rpm_RecordTypeUint64 {
}
impl Rpm_RecordTypeUint64 {
    pub fn values(&self) -> Ref<'_, Vec<u64>> {
        self.values.borrow()
    }
}
impl Rpm_RecordTypeUint64 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rpm_RecordTypeUint8 {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm_HeaderIndexRecord>,
    pub _self: SharedType<Self>,
    num_values: RefCell<u32>,
    values: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rpm_RecordTypeUint8 {
    type Root = Rpm;
    type Parent = Rpm_HeaderIndexRecord;

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
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *self_rc.num_values();
        for _i in 0..l_values {
            self_rc.values.borrow_mut().push(_io.read_u1()?.into());
        }
        Ok(())
    }
}
impl Rpm_RecordTypeUint8 {
    pub fn num_values(&self) -> Ref<'_, u32> {
        self.num_values.borrow()
    }
}
impl Rpm_RecordTypeUint8 {
    pub fn set_params(&mut self, num_values: u32) {
        *self.num_values.borrow_mut() = num_values;
    }
}
impl Rpm_RecordTypeUint8 {
}
impl Rpm_RecordTypeUint8 {
    pub fn values(&self) -> Ref<'_, Vec<u8>> {
        self.values.borrow()
    }
}
impl Rpm_RecordTypeUint8 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rpm_RpmVersion {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm_Lead>,
    pub _self: SharedType<Self>,
    major: RefCell<u8>,
    minor: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Rpm_RpmVersion {
    type Root = Rpm;
    type Parent = Rpm_Lead;

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
        *self_rc.major.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.major() as u8) >= (3 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/rpm_version/seq/0".to_string() }));
        }
        if !(((*self_rc.major() as u8) <= (4 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/rpm_version/seq/0".to_string() }));
        }
        *self_rc.minor.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Rpm_RpmVersion {
}

/**
 * \sa https://github.com/rpm-software-management/rpm/blob/afad3167/lib/rpmlead.c#L102 Source
 */
impl Rpm_RpmVersion {
    pub fn major(&self) -> Ref<'_, u8> {
        self.major.borrow()
    }
}
impl Rpm_RpmVersion {
    pub fn minor(&self) -> Ref<'_, u8> {
        self.minor.borrow()
    }
}
impl Rpm_RpmVersion {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Rpm_SignatureTagsStep {
    pub _root: SharedType<Rpm>,
    pub _parent: SharedType<Rpm>,
    pub _self: SharedType<Self>,
    idx: RefCell<i32>,
    prev_size_tag_idx: RefCell<i32>,
    _io: RefCell<BytesReader>,
    f_size_tag_idx: Cell<bool>,
    size_tag_idx: RefCell<i32>,
}
impl KStruct for Rpm_SignatureTagsStep {
    type Root = Rpm;
    type Parent = Rpm;

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
impl Rpm_SignatureTagsStep {
    pub fn idx(&self) -> Ref<'_, i32> {
        self.idx.borrow()
    }
}
impl Rpm_SignatureTagsStep {
    pub fn prev_size_tag_idx(&self) -> Ref<'_, i32> {
        self.prev_size_tag_idx.borrow()
    }
}
impl Rpm_SignatureTagsStep {
    pub fn set_params(&mut self, idx: i32, prev_size_tag_idx: i32) {
        *self.idx.borrow_mut() = idx;
        *self.prev_size_tag_idx.borrow_mut() = prev_size_tag_idx;
    }
}
impl Rpm_SignatureTagsStep {
    pub fn size_tag_idx(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_size_tag_idx.get() {
            return Ok(self.size_tag_idx.borrow());
        }
        self.f_size_tag_idx.set(true);
        *self.size_tag_idx.borrow_mut() = (if ((*self.prev_size_tag_idx() as i32) != (-1 as i32)) { *self.prev_size_tag_idx() } else { if  ((*_prc.as_ref().unwrap().signature().index_records()[*self.idx() as usize].signature_tag()? == Rpm_SignatureTags::Size) && (*_prc.as_ref().unwrap().signature().index_records()[*self.idx() as usize].record_type() == Rpm_RecordTypes::Uint32) && (((*_prc.as_ref().unwrap().signature().index_records()[*self.idx() as usize].num_values()? as u32) >= (1 as u32))))  { *self.idx() } else { -1 } }) as i32;
        Ok(self.size_tag_idx.borrow())
    }
}
impl Rpm_SignatureTagsStep {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
