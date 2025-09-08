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
 * This type of executables could be found inside the UEFI firmware. The UEFI
 * firmware is stored in SPI flash memory, which is a chip soldered on a
 * system's motherboard. UEFI firmware is very modular: it usually contains
 * dozens, if not hundreds, of executables. To store all these separates files,
 * the firmware is laid out in volumes using the Firmware File System (FFS), a
 * file system specifically designed to store firmware images. The volumes
 * contain files that are identified by GUIDs and each of these files contain
 * one or more sections holding the data. One of these sections contains the
 * actual executable image. Most of the executable images follow the PE format.
 * However, some of them follow the TE format.
 * 
 * The Terse Executable (TE) image format was created as a mechanism to reduce
 * the overhead of the PE/COFF headers in PE32/PE32+ images, resulting in a
 * corresponding reduction of image sizes for executables running in the PI
 * (Platform Initialization) Architecture environment. Reducing image size
 * provides an opportunity for use of a smaller system flash part.
 * 
 * So the TE format is basically a stripped version of PE.
 * \sa https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct UefiTe {
    pub _root: SharedType<UefiTe>,
    pub _parent: SharedType<UefiTe>,
    pub _self: SharedType<Self>,
    te_hdr: RefCell<OptRc<UefiTe_TeHeader>>,
    sections: RefCell<Vec<OptRc<UefiTe_Section>>>,
    _io: RefCell<BytesReader>,
    te_hdr_raw: RefCell<Vec<u8>>,
}
impl KStruct for UefiTe {
    type Root = UefiTe;
    type Parent = UefiTe;

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
        *self_rc.te_hdr_raw.borrow_mut() = _io.read_bytes(40 as usize)?.into();
        let te_hdr_raw = self_rc.te_hdr_raw.borrow();
        let _t_te_hdr_raw_io = BytesReader::from(te_hdr_raw.clone());
        let t = Self::read_into::<BytesReader, UefiTe_TeHeader>(&_t_te_hdr_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.te_hdr.borrow_mut() = t;
        *self_rc.sections.borrow_mut() = Vec::new();
        let l_sections = *self_rc.te_hdr().num_sections();
        for _i in 0..l_sections {
            let t = Self::read_into::<_, UefiTe_Section>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.sections.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl UefiTe {
}
impl UefiTe {
    pub fn te_hdr(&self) -> Ref<'_, OptRc<UefiTe_TeHeader>> {
        self.te_hdr.borrow()
    }
}
impl UefiTe {
    pub fn sections(&self) -> Ref<'_, Vec<OptRc<UefiTe_Section>>> {
        self.sections.borrow()
    }
}
impl UefiTe {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl UefiTe {
    pub fn te_hdr_raw(&self) -> Ref<'_, Vec<u8>> {
        self.te_hdr_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct UefiTe_DataDir {
    pub _root: SharedType<UefiTe>,
    pub _parent: SharedType<UefiTe_HeaderDataDirs>,
    pub _self: SharedType<Self>,
    virtual_address: RefCell<u32>,
    size: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for UefiTe_DataDir {
    type Root = UefiTe;
    type Parent = UefiTe_HeaderDataDirs;

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
        *self_rc.virtual_address.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl UefiTe_DataDir {
}
impl UefiTe_DataDir {
    pub fn virtual_address(&self) -> Ref<'_, u32> {
        self.virtual_address.borrow()
    }
}
impl UefiTe_DataDir {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl UefiTe_DataDir {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct UefiTe_HeaderDataDirs {
    pub _root: SharedType<UefiTe>,
    pub _parent: SharedType<UefiTe_TeHeader>,
    pub _self: SharedType<Self>,
    base_relocation_table: RefCell<OptRc<UefiTe_DataDir>>,
    debug: RefCell<OptRc<UefiTe_DataDir>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for UefiTe_HeaderDataDirs {
    type Root = UefiTe;
    type Parent = UefiTe_TeHeader;

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
        let t = Self::read_into::<_, UefiTe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.base_relocation_table.borrow_mut() = t;
        let t = Self::read_into::<_, UefiTe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.debug.borrow_mut() = t;
        Ok(())
    }
}
impl UefiTe_HeaderDataDirs {
}
impl UefiTe_HeaderDataDirs {
    pub fn base_relocation_table(&self) -> Ref<'_, OptRc<UefiTe_DataDir>> {
        self.base_relocation_table.borrow()
    }
}
impl UefiTe_HeaderDataDirs {
    pub fn debug(&self) -> Ref<'_, OptRc<UefiTe_DataDir>> {
        self.debug.borrow()
    }
}
impl UefiTe_HeaderDataDirs {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct UefiTe_Section {
    pub _root: SharedType<UefiTe>,
    pub _parent: SharedType<UefiTe>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    virtual_size: RefCell<u32>,
    virtual_address: RefCell<u32>,
    size_of_raw_data: RefCell<u32>,
    pointer_to_raw_data: RefCell<u32>,
    pointer_to_relocations: RefCell<u32>,
    pointer_to_linenumbers: RefCell<u32>,
    num_relocations: RefCell<u16>,
    num_linenumbers: RefCell<u16>,
    characteristics: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Vec<u8>>,
}
impl KStruct for UefiTe_Section {
    type Root = UefiTe;
    type Parent = UefiTe;

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
        *self_rc.name.borrow_mut() = bytes_to_str(&bytes_strip_right(&_io.read_bytes(8 as usize)?.into(), 0).into(), "UTF-8")?;
        *self_rc.virtual_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.virtual_address.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size_of_raw_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.pointer_to_raw_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.pointer_to_relocations.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.pointer_to_linenumbers.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_relocations.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.num_linenumbers.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.characteristics.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl UefiTe_Section {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        self.f_body.set(true);
        let _pos = _io.pos();
        _io.seek(((((*self.pointer_to_raw_data() as u32) - (*_r.te_hdr().stripped_size() as u32)) as i32) + (*_r.te_hdr()._io().size() as i32)) as usize)?;
        *self.body.borrow_mut() = _io.read_bytes(*self.size_of_raw_data() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.body.borrow())
    }
}
impl UefiTe_Section {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl UefiTe_Section {
    pub fn virtual_size(&self) -> Ref<'_, u32> {
        self.virtual_size.borrow()
    }
}
impl UefiTe_Section {
    pub fn virtual_address(&self) -> Ref<'_, u32> {
        self.virtual_address.borrow()
    }
}
impl UefiTe_Section {
    pub fn size_of_raw_data(&self) -> Ref<'_, u32> {
        self.size_of_raw_data.borrow()
    }
}
impl UefiTe_Section {
    pub fn pointer_to_raw_data(&self) -> Ref<'_, u32> {
        self.pointer_to_raw_data.borrow()
    }
}
impl UefiTe_Section {
    pub fn pointer_to_relocations(&self) -> Ref<'_, u32> {
        self.pointer_to_relocations.borrow()
    }
}
impl UefiTe_Section {
    pub fn pointer_to_linenumbers(&self) -> Ref<'_, u32> {
        self.pointer_to_linenumbers.borrow()
    }
}
impl UefiTe_Section {
    pub fn num_relocations(&self) -> Ref<'_, u16> {
        self.num_relocations.borrow()
    }
}
impl UefiTe_Section {
    pub fn num_linenumbers(&self) -> Ref<'_, u16> {
        self.num_linenumbers.borrow()
    }
}
impl UefiTe_Section {
    pub fn characteristics(&self) -> Ref<'_, u32> {
        self.characteristics.borrow()
    }
}
impl UefiTe_Section {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct UefiTe_TeHeader {
    pub _root: SharedType<UefiTe>,
    pub _parent: SharedType<UefiTe>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    machine: RefCell<UefiTe_TeHeader_MachineType>,
    num_sections: RefCell<u8>,
    subsystem: RefCell<UefiTe_TeHeader_SubsystemEnum>,
    stripped_size: RefCell<u16>,
    entry_point_addr: RefCell<u32>,
    base_of_code: RefCell<u32>,
    image_base: RefCell<u64>,
    data_dirs: RefCell<OptRc<UefiTe_HeaderDataDirs>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for UefiTe_TeHeader {
    type Root = UefiTe;
    type Parent = UefiTe;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.magic() == vec![0x56u8, 0x5au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/te_header/seq/0".to_string() }));
        }
        *self_rc.machine.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.num_sections.borrow_mut() = _io.read_u1()?.into();
        *self_rc.subsystem.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.stripped_size.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.entry_point_addr.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.base_of_code.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.image_base.borrow_mut() = _io.read_u8le()?.into();
        let t = Self::read_into::<_, UefiTe_HeaderDataDirs>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.data_dirs.borrow_mut() = t;
        Ok(())
    }
}
impl UefiTe_TeHeader {
}
impl UefiTe_TeHeader {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl UefiTe_TeHeader {
    pub fn machine(&self) -> Ref<'_, UefiTe_TeHeader_MachineType> {
        self.machine.borrow()
    }
}
impl UefiTe_TeHeader {
    pub fn num_sections(&self) -> Ref<'_, u8> {
        self.num_sections.borrow()
    }
}
impl UefiTe_TeHeader {
    pub fn subsystem(&self) -> Ref<'_, UefiTe_TeHeader_SubsystemEnum> {
        self.subsystem.borrow()
    }
}
impl UefiTe_TeHeader {
    pub fn stripped_size(&self) -> Ref<'_, u16> {
        self.stripped_size.borrow()
    }
}
impl UefiTe_TeHeader {
    pub fn entry_point_addr(&self) -> Ref<'_, u32> {
        self.entry_point_addr.borrow()
    }
}
impl UefiTe_TeHeader {
    pub fn base_of_code(&self) -> Ref<'_, u32> {
        self.base_of_code.borrow()
    }
}
impl UefiTe_TeHeader {
    pub fn image_base(&self) -> Ref<'_, u64> {
        self.image_base.borrow()
    }
}
impl UefiTe_TeHeader {
    pub fn data_dirs(&self) -> Ref<'_, OptRc<UefiTe_HeaderDataDirs>> {
        self.data_dirs.borrow()
    }
}
impl UefiTe_TeHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum UefiTe_TeHeader_MachineType {

    /**
     * The content of this field is assumed to be applicable to any machine type
     */
    Unknown,

    /**
     * Intel 386 or later processors and compatible processors
     */
    I386,

    /**
     * MIPS little endian
     */
    R4000,

    /**
     * MIPS little-endian WCE v2
     */
    WceMipsV2,

    /**
     * Alpha AXP, 32-bit address space
     */
    Alpha,

    /**
     * Hitachi SH3
     */
    Sh3,

    /**
     * Hitachi SH3 DSP
     */
    Sh3Dsp,

    /**
     * Hitachi SH4
     */
    Sh4,

    /**
     * Hitachi SH5
     */
    Sh5,

    /**
     * ARM little endian
     */
    Arm,

    /**
     * Thumb
     */
    Thumb,

    /**
     * ARM Thumb-2 little endian
     */
    ArmNt,

    /**
     * Matsushita AM33
     */
    Am33,

    /**
     * Power PC little endian
     */
    Powerpc,

    /**
     * Power PC with floating point support
     */
    PowerpcFp,

    /**
     * Intel Itanium processor family
     */
    Ia64,

    /**
     * MIPS16
     */
    Mips16,

    /**
     * > Alpha 64, 64-bit address space
     * or
     * > AXP 64 (Same as Alpha 64)
     */
    Alpha64OrAxp64,

    /**
     * MIPS with FPU
     */
    MipsFpu,

    /**
     * MIPS16 with FPU
     */
    Mips16Fpu,

    /**
     * EFI byte code
     */
    Ebc,

    /**
     * RISC-V 32-bit address space
     */
    Riscv32,

    /**
     * RISC-V 64-bit address space
     */
    Riscv64,

    /**
     * RISC-V 128-bit address space
     */
    Riscv128,

    /**
     * LoongArch 32-bit processor family
     */
    Loongarch32,

    /**
     * LoongArch 64-bit processor family
     */
    Loongarch64,

    /**
     * x64
     */
    Amd64,

    /**
     * Mitsubishi M32R little endian
     */
    M32r,

    /**
     * ARM64 little endian
     */
    Arm64,
    Unknown(i64),
}

impl TryFrom<i64> for UefiTe_TeHeader_MachineType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<UefiTe_TeHeader_MachineType> {
        match flag {
            0 => Ok(UefiTe_TeHeader_MachineType::Unknown),
            332 => Ok(UefiTe_TeHeader_MachineType::I386),
            358 => Ok(UefiTe_TeHeader_MachineType::R4000),
            361 => Ok(UefiTe_TeHeader_MachineType::WceMipsV2),
            388 => Ok(UefiTe_TeHeader_MachineType::Alpha),
            418 => Ok(UefiTe_TeHeader_MachineType::Sh3),
            419 => Ok(UefiTe_TeHeader_MachineType::Sh3Dsp),
            422 => Ok(UefiTe_TeHeader_MachineType::Sh4),
            424 => Ok(UefiTe_TeHeader_MachineType::Sh5),
            448 => Ok(UefiTe_TeHeader_MachineType::Arm),
            450 => Ok(UefiTe_TeHeader_MachineType::Thumb),
            452 => Ok(UefiTe_TeHeader_MachineType::ArmNt),
            467 => Ok(UefiTe_TeHeader_MachineType::Am33),
            496 => Ok(UefiTe_TeHeader_MachineType::Powerpc),
            497 => Ok(UefiTe_TeHeader_MachineType::PowerpcFp),
            512 => Ok(UefiTe_TeHeader_MachineType::Ia64),
            614 => Ok(UefiTe_TeHeader_MachineType::Mips16),
            644 => Ok(UefiTe_TeHeader_MachineType::Alpha64OrAxp64),
            870 => Ok(UefiTe_TeHeader_MachineType::MipsFpu),
            1126 => Ok(UefiTe_TeHeader_MachineType::Mips16Fpu),
            3772 => Ok(UefiTe_TeHeader_MachineType::Ebc),
            20530 => Ok(UefiTe_TeHeader_MachineType::Riscv32),
            20580 => Ok(UefiTe_TeHeader_MachineType::Riscv64),
            20776 => Ok(UefiTe_TeHeader_MachineType::Riscv128),
            25138 => Ok(UefiTe_TeHeader_MachineType::Loongarch32),
            25188 => Ok(UefiTe_TeHeader_MachineType::Loongarch64),
            34404 => Ok(UefiTe_TeHeader_MachineType::Amd64),
            36929 => Ok(UefiTe_TeHeader_MachineType::M32r),
            43620 => Ok(UefiTe_TeHeader_MachineType::Arm64),
            _ => Ok(UefiTe_TeHeader_MachineType::Unknown(flag)),
        }
    }
}

impl From<&UefiTe_TeHeader_MachineType> for i64 {
    fn from(v: &UefiTe_TeHeader_MachineType) -> Self {
        match *v {
            UefiTe_TeHeader_MachineType::Unknown => 0,
            UefiTe_TeHeader_MachineType::I386 => 332,
            UefiTe_TeHeader_MachineType::R4000 => 358,
            UefiTe_TeHeader_MachineType::WceMipsV2 => 361,
            UefiTe_TeHeader_MachineType::Alpha => 388,
            UefiTe_TeHeader_MachineType::Sh3 => 418,
            UefiTe_TeHeader_MachineType::Sh3Dsp => 419,
            UefiTe_TeHeader_MachineType::Sh4 => 422,
            UefiTe_TeHeader_MachineType::Sh5 => 424,
            UefiTe_TeHeader_MachineType::Arm => 448,
            UefiTe_TeHeader_MachineType::Thumb => 450,
            UefiTe_TeHeader_MachineType::ArmNt => 452,
            UefiTe_TeHeader_MachineType::Am33 => 467,
            UefiTe_TeHeader_MachineType::Powerpc => 496,
            UefiTe_TeHeader_MachineType::PowerpcFp => 497,
            UefiTe_TeHeader_MachineType::Ia64 => 512,
            UefiTe_TeHeader_MachineType::Mips16 => 614,
            UefiTe_TeHeader_MachineType::Alpha64OrAxp64 => 644,
            UefiTe_TeHeader_MachineType::MipsFpu => 870,
            UefiTe_TeHeader_MachineType::Mips16Fpu => 1126,
            UefiTe_TeHeader_MachineType::Ebc => 3772,
            UefiTe_TeHeader_MachineType::Riscv32 => 20530,
            UefiTe_TeHeader_MachineType::Riscv64 => 20580,
            UefiTe_TeHeader_MachineType::Riscv128 => 20776,
            UefiTe_TeHeader_MachineType::Loongarch32 => 25138,
            UefiTe_TeHeader_MachineType::Loongarch64 => 25188,
            UefiTe_TeHeader_MachineType::Amd64 => 34404,
            UefiTe_TeHeader_MachineType::M32r => 36929,
            UefiTe_TeHeader_MachineType::Arm64 => 43620,
            UefiTe_TeHeader_MachineType::Unknown(v) => v
        }
    }
}

impl Default for UefiTe_TeHeader_MachineType {
    fn default() -> Self { UefiTe_TeHeader_MachineType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum UefiTe_TeHeader_SubsystemEnum {
    Unknown,
    Native,
    WindowsGui,
    WindowsCui,
    PosixCui,
    WindowsCeGui,
    EfiApplication,
    EfiBootServiceDriver,
    EfiRuntimeDriver,
    EfiRom,
    Xbox,
    WindowsBootApplication,
    Unknown(i64),
}

impl TryFrom<i64> for UefiTe_TeHeader_SubsystemEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<UefiTe_TeHeader_SubsystemEnum> {
        match flag {
            0 => Ok(UefiTe_TeHeader_SubsystemEnum::Unknown),
            1 => Ok(UefiTe_TeHeader_SubsystemEnum::Native),
            2 => Ok(UefiTe_TeHeader_SubsystemEnum::WindowsGui),
            3 => Ok(UefiTe_TeHeader_SubsystemEnum::WindowsCui),
            7 => Ok(UefiTe_TeHeader_SubsystemEnum::PosixCui),
            9 => Ok(UefiTe_TeHeader_SubsystemEnum::WindowsCeGui),
            10 => Ok(UefiTe_TeHeader_SubsystemEnum::EfiApplication),
            11 => Ok(UefiTe_TeHeader_SubsystemEnum::EfiBootServiceDriver),
            12 => Ok(UefiTe_TeHeader_SubsystemEnum::EfiRuntimeDriver),
            13 => Ok(UefiTe_TeHeader_SubsystemEnum::EfiRom),
            14 => Ok(UefiTe_TeHeader_SubsystemEnum::Xbox),
            16 => Ok(UefiTe_TeHeader_SubsystemEnum::WindowsBootApplication),
            _ => Ok(UefiTe_TeHeader_SubsystemEnum::Unknown(flag)),
        }
    }
}

impl From<&UefiTe_TeHeader_SubsystemEnum> for i64 {
    fn from(v: &UefiTe_TeHeader_SubsystemEnum) -> Self {
        match *v {
            UefiTe_TeHeader_SubsystemEnum::Unknown => 0,
            UefiTe_TeHeader_SubsystemEnum::Native => 1,
            UefiTe_TeHeader_SubsystemEnum::WindowsGui => 2,
            UefiTe_TeHeader_SubsystemEnum::WindowsCui => 3,
            UefiTe_TeHeader_SubsystemEnum::PosixCui => 7,
            UefiTe_TeHeader_SubsystemEnum::WindowsCeGui => 9,
            UefiTe_TeHeader_SubsystemEnum::EfiApplication => 10,
            UefiTe_TeHeader_SubsystemEnum::EfiBootServiceDriver => 11,
            UefiTe_TeHeader_SubsystemEnum::EfiRuntimeDriver => 12,
            UefiTe_TeHeader_SubsystemEnum::EfiRom => 13,
            UefiTe_TeHeader_SubsystemEnum::Xbox => 14,
            UefiTe_TeHeader_SubsystemEnum::WindowsBootApplication => 16,
            UefiTe_TeHeader_SubsystemEnum::Unknown(v) => v
        }
    }
}

impl Default for UefiTe_TeHeader_SubsystemEnum {
    fn default() -> Self { UefiTe_TeHeader_SubsystemEnum::Unknown(0) }
}

