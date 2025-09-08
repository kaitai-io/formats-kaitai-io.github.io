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
 * The new uImage format allows more flexibility in handling images of various
 * types (kernel, ramdisk, etc.), it also enhances integrity protection of images
 * with sha1 and md5 checksums.
 * \sa https://source.denx.de/u-boot/u-boot/-/raw/e4dba4ba6f/include/image.h Source
 */

#[derive(Default, Debug, Clone)]
pub struct Uimage {
    pub _root: SharedType<Uimage>,
    pub _parent: SharedType<Uimage>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Uimage_Uheader>>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Uimage {
    type Root = Uimage;
    type Parent = Uimage;

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
        let t = Self::read_into::<_, Uimage_Uheader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.header().len_image() as usize)?.into();
        Ok(())
    }
}
impl Uimage {
}
impl Uimage {
    pub fn header(&self) -> Ref<'_, OptRc<Uimage_Uheader>> {
        self.header.borrow()
    }
}
impl Uimage {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Uimage {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Uimage_UimageArch {

    /**
     * Invalid CPU
     */
    Invalid,

    /**
     * Alpha
     */
    Alpha,

    /**
     * ARM
     */
    Arm,

    /**
     * Intel x86
     */
    I386,

    /**
     * IA64
     */
    Ia64,

    /**
     * MIPS
     */
    Mips,

    /**
     * MIPS 64 Bit
     */
    Mips64,

    /**
     * PowerPC
     */
    Ppc,

    /**
     * IBM S390
     */
    S390,

    /**
     * SuperH
     */
    Sh,

    /**
     * Sparc
     */
    Sparc,

    /**
     * Sparc 64 Bit
     */
    Sparc64,

    /**
     * M68K
     */
    M68k,

    /**
     * Nios-32
     */
    Nios,

    /**
     * MicroBlaze
     */
    Microblaze,

    /**
     * Nios-II
     */
    Nios2,

    /**
     * Blackfin
     */
    Blackfin,

    /**
     * AVR32
     */
    Avr32,

    /**
     * STMicroelectronics ST200
     */
    St200,

    /**
     * Sandbox architecture (test only)
     */
    Sandbox,

    /**
     * ANDES Technology - NDS32
     */
    Nds32,

    /**
     * OpenRISC 1000
     */
    Openrisc,

    /**
     * ARM64
     */
    Arm64,

    /**
     * Synopsys DesignWare ARC
     */
    Arc,

    /**
     * AMD x86_64, Intel and Via
     */
    X8664,

    /**
     * Xtensa
     */
    Xtensa,

    /**
     * RISC-V
     */
    Riscv,
    Unknown(i64),
}

impl TryFrom<i64> for Uimage_UimageArch {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Uimage_UimageArch> {
        match flag {
            0 => Ok(Uimage_UimageArch::Invalid),
            1 => Ok(Uimage_UimageArch::Alpha),
            2 => Ok(Uimage_UimageArch::Arm),
            3 => Ok(Uimage_UimageArch::I386),
            4 => Ok(Uimage_UimageArch::Ia64),
            5 => Ok(Uimage_UimageArch::Mips),
            6 => Ok(Uimage_UimageArch::Mips64),
            7 => Ok(Uimage_UimageArch::Ppc),
            8 => Ok(Uimage_UimageArch::S390),
            9 => Ok(Uimage_UimageArch::Sh),
            10 => Ok(Uimage_UimageArch::Sparc),
            11 => Ok(Uimage_UimageArch::Sparc64),
            12 => Ok(Uimage_UimageArch::M68k),
            13 => Ok(Uimage_UimageArch::Nios),
            14 => Ok(Uimage_UimageArch::Microblaze),
            15 => Ok(Uimage_UimageArch::Nios2),
            16 => Ok(Uimage_UimageArch::Blackfin),
            17 => Ok(Uimage_UimageArch::Avr32),
            18 => Ok(Uimage_UimageArch::St200),
            19 => Ok(Uimage_UimageArch::Sandbox),
            20 => Ok(Uimage_UimageArch::Nds32),
            21 => Ok(Uimage_UimageArch::Openrisc),
            22 => Ok(Uimage_UimageArch::Arm64),
            23 => Ok(Uimage_UimageArch::Arc),
            24 => Ok(Uimage_UimageArch::X8664),
            25 => Ok(Uimage_UimageArch::Xtensa),
            26 => Ok(Uimage_UimageArch::Riscv),
            _ => Ok(Uimage_UimageArch::Unknown(flag)),
        }
    }
}

impl From<&Uimage_UimageArch> for i64 {
    fn from(v: &Uimage_UimageArch) -> Self {
        match *v {
            Uimage_UimageArch::Invalid => 0,
            Uimage_UimageArch::Alpha => 1,
            Uimage_UimageArch::Arm => 2,
            Uimage_UimageArch::I386 => 3,
            Uimage_UimageArch::Ia64 => 4,
            Uimage_UimageArch::Mips => 5,
            Uimage_UimageArch::Mips64 => 6,
            Uimage_UimageArch::Ppc => 7,
            Uimage_UimageArch::S390 => 8,
            Uimage_UimageArch::Sh => 9,
            Uimage_UimageArch::Sparc => 10,
            Uimage_UimageArch::Sparc64 => 11,
            Uimage_UimageArch::M68k => 12,
            Uimage_UimageArch::Nios => 13,
            Uimage_UimageArch::Microblaze => 14,
            Uimage_UimageArch::Nios2 => 15,
            Uimage_UimageArch::Blackfin => 16,
            Uimage_UimageArch::Avr32 => 17,
            Uimage_UimageArch::St200 => 18,
            Uimage_UimageArch::Sandbox => 19,
            Uimage_UimageArch::Nds32 => 20,
            Uimage_UimageArch::Openrisc => 21,
            Uimage_UimageArch::Arm64 => 22,
            Uimage_UimageArch::Arc => 23,
            Uimage_UimageArch::X8664 => 24,
            Uimage_UimageArch::Xtensa => 25,
            Uimage_UimageArch::Riscv => 26,
            Uimage_UimageArch::Unknown(v) => v
        }
    }
}

impl Default for Uimage_UimageArch {
    fn default() -> Self { Uimage_UimageArch::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Uimage_UimageComp {

    /**
     * No Compression Used
     */
    None,
    Gzip,
    Bzip2,
    Lzma,
    Lzo,
    Lz4,
    Zstd,
    Unknown(i64),
}

impl TryFrom<i64> for Uimage_UimageComp {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Uimage_UimageComp> {
        match flag {
            0 => Ok(Uimage_UimageComp::None),
            1 => Ok(Uimage_UimageComp::Gzip),
            2 => Ok(Uimage_UimageComp::Bzip2),
            3 => Ok(Uimage_UimageComp::Lzma),
            4 => Ok(Uimage_UimageComp::Lzo),
            5 => Ok(Uimage_UimageComp::Lz4),
            6 => Ok(Uimage_UimageComp::Zstd),
            _ => Ok(Uimage_UimageComp::Unknown(flag)),
        }
    }
}

impl From<&Uimage_UimageComp> for i64 {
    fn from(v: &Uimage_UimageComp) -> Self {
        match *v {
            Uimage_UimageComp::None => 0,
            Uimage_UimageComp::Gzip => 1,
            Uimage_UimageComp::Bzip2 => 2,
            Uimage_UimageComp::Lzma => 3,
            Uimage_UimageComp::Lzo => 4,
            Uimage_UimageComp::Lz4 => 5,
            Uimage_UimageComp::Zstd => 6,
            Uimage_UimageComp::Unknown(v) => v
        }
    }
}

impl Default for Uimage_UimageComp {
    fn default() -> Self { Uimage_UimageComp::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Uimage_UimageOs {

    /**
     * Invalid OS
     */
    Invalid,

    /**
     * OpenBSD
     */
    Openbsd,

    /**
     * NetBSD
     */
    Netbsd,

    /**
     * FreeBSD
     */
    Freebsd,

    /**
     * 4.4BSD
     */
    Bsd44,

    /**
     * Linux
     */
    Linux,

    /**
     * SVR4
     */
    Svr4,

    /**
     * Esix
     */
    Esix,

    /**
     * Solaris
     */
    Solaris,

    /**
     * Irix
     */
    Irix,

    /**
     * SCO
     */
    Sco,

    /**
     * Dell
     */
    Dell,

    /**
     * NCR
     */
    Ncr,

    /**
     * LynxOS
     */
    Lynxos,

    /**
     * VxWorks
     */
    Vxworks,

    /**
     * pSOS
     */
    Psos,

    /**
     * QNX
     */
    Qnx,

    /**
     * Firmware
     */
    UBoot,

    /**
     * RTEMS
     */
    Rtems,

    /**
     * ARTOS
     */
    Artos,

    /**
     * Unity OS
     */
    Unity,

    /**
     * INTEGRITY
     */
    Integrity,

    /**
     * OSE
     */
    Ose,

    /**
     * Plan 9
     */
    Plan9,

    /**
     * OpenRTOS
     */
    Openrtos,

    /**
     * ARM Trusted Firmware
     */
    ArmTrustedFirmware,

    /**
     * Trusted Execution Environment
     */
    Tee,

    /**
     * RISC-V OpenSBI
     */
    Opensbi,

    /**
     * EFI Firmware (e.g. GRUB2)
     */
    Efi,
    Unknown(i64),
}

impl TryFrom<i64> for Uimage_UimageOs {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Uimage_UimageOs> {
        match flag {
            0 => Ok(Uimage_UimageOs::Invalid),
            1 => Ok(Uimage_UimageOs::Openbsd),
            2 => Ok(Uimage_UimageOs::Netbsd),
            3 => Ok(Uimage_UimageOs::Freebsd),
            4 => Ok(Uimage_UimageOs::Bsd44),
            5 => Ok(Uimage_UimageOs::Linux),
            6 => Ok(Uimage_UimageOs::Svr4),
            7 => Ok(Uimage_UimageOs::Esix),
            8 => Ok(Uimage_UimageOs::Solaris),
            9 => Ok(Uimage_UimageOs::Irix),
            10 => Ok(Uimage_UimageOs::Sco),
            11 => Ok(Uimage_UimageOs::Dell),
            12 => Ok(Uimage_UimageOs::Ncr),
            13 => Ok(Uimage_UimageOs::Lynxos),
            14 => Ok(Uimage_UimageOs::Vxworks),
            15 => Ok(Uimage_UimageOs::Psos),
            16 => Ok(Uimage_UimageOs::Qnx),
            17 => Ok(Uimage_UimageOs::UBoot),
            18 => Ok(Uimage_UimageOs::Rtems),
            19 => Ok(Uimage_UimageOs::Artos),
            20 => Ok(Uimage_UimageOs::Unity),
            21 => Ok(Uimage_UimageOs::Integrity),
            22 => Ok(Uimage_UimageOs::Ose),
            23 => Ok(Uimage_UimageOs::Plan9),
            24 => Ok(Uimage_UimageOs::Openrtos),
            25 => Ok(Uimage_UimageOs::ArmTrustedFirmware),
            26 => Ok(Uimage_UimageOs::Tee),
            27 => Ok(Uimage_UimageOs::Opensbi),
            28 => Ok(Uimage_UimageOs::Efi),
            _ => Ok(Uimage_UimageOs::Unknown(flag)),
        }
    }
}

impl From<&Uimage_UimageOs> for i64 {
    fn from(v: &Uimage_UimageOs) -> Self {
        match *v {
            Uimage_UimageOs::Invalid => 0,
            Uimage_UimageOs::Openbsd => 1,
            Uimage_UimageOs::Netbsd => 2,
            Uimage_UimageOs::Freebsd => 3,
            Uimage_UimageOs::Bsd44 => 4,
            Uimage_UimageOs::Linux => 5,
            Uimage_UimageOs::Svr4 => 6,
            Uimage_UimageOs::Esix => 7,
            Uimage_UimageOs::Solaris => 8,
            Uimage_UimageOs::Irix => 9,
            Uimage_UimageOs::Sco => 10,
            Uimage_UimageOs::Dell => 11,
            Uimage_UimageOs::Ncr => 12,
            Uimage_UimageOs::Lynxos => 13,
            Uimage_UimageOs::Vxworks => 14,
            Uimage_UimageOs::Psos => 15,
            Uimage_UimageOs::Qnx => 16,
            Uimage_UimageOs::UBoot => 17,
            Uimage_UimageOs::Rtems => 18,
            Uimage_UimageOs::Artos => 19,
            Uimage_UimageOs::Unity => 20,
            Uimage_UimageOs::Integrity => 21,
            Uimage_UimageOs::Ose => 22,
            Uimage_UimageOs::Plan9 => 23,
            Uimage_UimageOs::Openrtos => 24,
            Uimage_UimageOs::ArmTrustedFirmware => 25,
            Uimage_UimageOs::Tee => 26,
            Uimage_UimageOs::Opensbi => 27,
            Uimage_UimageOs::Efi => 28,
            Uimage_UimageOs::Unknown(v) => v
        }
    }
}

impl Default for Uimage_UimageOs {
    fn default() -> Self { Uimage_UimageOs::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Uimage_UimageType {

    /**
     * Invalid Image
     */
    Invalid,

    /**
     * Standalone Program
     */
    Standalone,

    /**
     * OS Kernel Image
     */
    Kernel,

    /**
     * RAMDisk Image
     */
    Ramdisk,

    /**
     * Multi-File Image
     */
    Multi,

    /**
     * Firmware Image
     */
    Firmware,

    /**
     * Script file
     */
    Script,

    /**
     * Filesystem Image (any type)
     */
    Filesystem,

    /**
     * Binary Flat Device Tree Blob
     */
    Flatdt,

    /**
     * Kirkwood Boot Image
     */
    Kwbimage,

    /**
     * Freescale IMXBoot Image
     */
    Imximage,

    /**
     * Davinci UBL Image
     */
    Ublimage,

    /**
     * TI OMAP Config Header Image
     */
    Omapimage,

    /**
     * TI Davinci AIS Image
     */
    Aisimage,

    /**
     * OS Kernel Image, can run from any load address
     */
    KernelNoload,

    /**
     * Freescale PBL Boot Image
     */
    Pblimage,

    /**
     * Freescale MXSBoot Image
     */
    Mxsimage,

    /**
     * TI Keystone GPHeader Image
     */
    Gpimage,

    /**
     * ATMEL ROM bootable Image
     */
    Atmelimage,

    /**
     * Altera SOCFPGA CV/AV Preloader
     */
    Socfpgaimage,

    /**
     * x86 setup.bin Image
     */
    X86Setup,

    /**
     * x86 setup.bin Image
     */
    Lpc32xximage,

    /**
     * A list of typeless images
     */
    Loadable,

    /**
     * Rockchip Boot Image
     */
    Rkimage,

    /**
     * Rockchip SD card
     */
    Rksd,

    /**
     * Rockchip SPI image
     */
    Rkspi,

    /**
     * Xilinx Zynq Boot Image
     */
    Zynqimage,

    /**
     * Xilinx ZynqMP Boot Image
     */
    Zynqmpimage,

    /**
     * Xilinx ZynqMP Boot Image (bif)
     */
    Zynqmpbif,

    /**
     * FPGA Image
     */
    Fpga,

    /**
     * VYBRID .vyb Image
     */
    Vybridimage,

    /**
     * Trusted Execution Environment OS Image
     */
    Tee,

    /**
     * Firmware Image with HABv4 IVT
     */
    FirmwareIvt,

    /**
     * TI Power Management Micro-Controller Firmware
     */
    Pmmc,

    /**
     * STMicroelectronics STM32 Image
     */
    Stm32image,

    /**
     * Altera SOCFPGA A10 Preloader
     */
    SocfpgaimageV1,

    /**
     * MediaTek BootROM loadable Image
     */
    Mtkimage,

    /**
     * Freescale IMX8MBoot Image
     */
    Imx8mimage,

    /**
     * Freescale IMX8Boot Image
     */
    Imx8image,

    /**
     * Coprocessor Image for remoteproc
     */
    Copro,

    /**
     * Allwinner eGON Boot Image
     */
    SunxiEgon,
    Unknown(i64),
}

impl TryFrom<i64> for Uimage_UimageType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Uimage_UimageType> {
        match flag {
            0 => Ok(Uimage_UimageType::Invalid),
            1 => Ok(Uimage_UimageType::Standalone),
            2 => Ok(Uimage_UimageType::Kernel),
            3 => Ok(Uimage_UimageType::Ramdisk),
            4 => Ok(Uimage_UimageType::Multi),
            5 => Ok(Uimage_UimageType::Firmware),
            6 => Ok(Uimage_UimageType::Script),
            7 => Ok(Uimage_UimageType::Filesystem),
            8 => Ok(Uimage_UimageType::Flatdt),
            9 => Ok(Uimage_UimageType::Kwbimage),
            10 => Ok(Uimage_UimageType::Imximage),
            11 => Ok(Uimage_UimageType::Ublimage),
            12 => Ok(Uimage_UimageType::Omapimage),
            13 => Ok(Uimage_UimageType::Aisimage),
            14 => Ok(Uimage_UimageType::KernelNoload),
            15 => Ok(Uimage_UimageType::Pblimage),
            16 => Ok(Uimage_UimageType::Mxsimage),
            17 => Ok(Uimage_UimageType::Gpimage),
            18 => Ok(Uimage_UimageType::Atmelimage),
            19 => Ok(Uimage_UimageType::Socfpgaimage),
            20 => Ok(Uimage_UimageType::X86Setup),
            21 => Ok(Uimage_UimageType::Lpc32xximage),
            22 => Ok(Uimage_UimageType::Loadable),
            23 => Ok(Uimage_UimageType::Rkimage),
            24 => Ok(Uimage_UimageType::Rksd),
            25 => Ok(Uimage_UimageType::Rkspi),
            26 => Ok(Uimage_UimageType::Zynqimage),
            27 => Ok(Uimage_UimageType::Zynqmpimage),
            28 => Ok(Uimage_UimageType::Zynqmpbif),
            29 => Ok(Uimage_UimageType::Fpga),
            30 => Ok(Uimage_UimageType::Vybridimage),
            31 => Ok(Uimage_UimageType::Tee),
            32 => Ok(Uimage_UimageType::FirmwareIvt),
            33 => Ok(Uimage_UimageType::Pmmc),
            34 => Ok(Uimage_UimageType::Stm32image),
            35 => Ok(Uimage_UimageType::SocfpgaimageV1),
            36 => Ok(Uimage_UimageType::Mtkimage),
            37 => Ok(Uimage_UimageType::Imx8mimage),
            38 => Ok(Uimage_UimageType::Imx8image),
            39 => Ok(Uimage_UimageType::Copro),
            40 => Ok(Uimage_UimageType::SunxiEgon),
            _ => Ok(Uimage_UimageType::Unknown(flag)),
        }
    }
}

impl From<&Uimage_UimageType> for i64 {
    fn from(v: &Uimage_UimageType) -> Self {
        match *v {
            Uimage_UimageType::Invalid => 0,
            Uimage_UimageType::Standalone => 1,
            Uimage_UimageType::Kernel => 2,
            Uimage_UimageType::Ramdisk => 3,
            Uimage_UimageType::Multi => 4,
            Uimage_UimageType::Firmware => 5,
            Uimage_UimageType::Script => 6,
            Uimage_UimageType::Filesystem => 7,
            Uimage_UimageType::Flatdt => 8,
            Uimage_UimageType::Kwbimage => 9,
            Uimage_UimageType::Imximage => 10,
            Uimage_UimageType::Ublimage => 11,
            Uimage_UimageType::Omapimage => 12,
            Uimage_UimageType::Aisimage => 13,
            Uimage_UimageType::KernelNoload => 14,
            Uimage_UimageType::Pblimage => 15,
            Uimage_UimageType::Mxsimage => 16,
            Uimage_UimageType::Gpimage => 17,
            Uimage_UimageType::Atmelimage => 18,
            Uimage_UimageType::Socfpgaimage => 19,
            Uimage_UimageType::X86Setup => 20,
            Uimage_UimageType::Lpc32xximage => 21,
            Uimage_UimageType::Loadable => 22,
            Uimage_UimageType::Rkimage => 23,
            Uimage_UimageType::Rksd => 24,
            Uimage_UimageType::Rkspi => 25,
            Uimage_UimageType::Zynqimage => 26,
            Uimage_UimageType::Zynqmpimage => 27,
            Uimage_UimageType::Zynqmpbif => 28,
            Uimage_UimageType::Fpga => 29,
            Uimage_UimageType::Vybridimage => 30,
            Uimage_UimageType::Tee => 31,
            Uimage_UimageType::FirmwareIvt => 32,
            Uimage_UimageType::Pmmc => 33,
            Uimage_UimageType::Stm32image => 34,
            Uimage_UimageType::SocfpgaimageV1 => 35,
            Uimage_UimageType::Mtkimage => 36,
            Uimage_UimageType::Imx8mimage => 37,
            Uimage_UimageType::Imx8image => 38,
            Uimage_UimageType::Copro => 39,
            Uimage_UimageType::SunxiEgon => 40,
            Uimage_UimageType::Unknown(v) => v
        }
    }
}

impl Default for Uimage_UimageType {
    fn default() -> Self { Uimage_UimageType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Uimage_Uheader {
    pub _root: SharedType<Uimage>,
    pub _parent: SharedType<Uimage>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    header_crc: RefCell<u32>,
    timestamp: RefCell<u32>,
    len_image: RefCell<u32>,
    load_address: RefCell<u32>,
    entry_address: RefCell<u32>,
    data_crc: RefCell<u32>,
    os_type: RefCell<Uimage_UimageOs>,
    architecture: RefCell<Uimage_UimageArch>,
    image_type: RefCell<Uimage_UimageType>,
    compression_type: RefCell<Uimage_UimageComp>,
    name: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Uimage_Uheader {
    type Root = Uimage;
    type Parent = Uimage;

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
        if !(*self_rc.magic() == vec![0x27u8, 0x5u8, 0x19u8, 0x56u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/uheader/seq/0".to_string() }));
        }
        *self_rc.header_crc.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.timestamp.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.len_image.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.load_address.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.entry_address.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.data_crc.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.os_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.architecture.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.image_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.compression_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.name.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(32 as usize)?.into(), 0, false).into(), "UTF-8")?;
        Ok(())
    }
}
impl Uimage_Uheader {
}
impl Uimage_Uheader {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Uimage_Uheader {
    pub fn header_crc(&self) -> Ref<'_, u32> {
        self.header_crc.borrow()
    }
}
impl Uimage_Uheader {
    pub fn timestamp(&self) -> Ref<'_, u32> {
        self.timestamp.borrow()
    }
}
impl Uimage_Uheader {
    pub fn len_image(&self) -> Ref<'_, u32> {
        self.len_image.borrow()
    }
}
impl Uimage_Uheader {
    pub fn load_address(&self) -> Ref<'_, u32> {
        self.load_address.borrow()
    }
}
impl Uimage_Uheader {
    pub fn entry_address(&self) -> Ref<'_, u32> {
        self.entry_address.borrow()
    }
}
impl Uimage_Uheader {
    pub fn data_crc(&self) -> Ref<'_, u32> {
        self.data_crc.borrow()
    }
}
impl Uimage_Uheader {
    pub fn os_type(&self) -> Ref<'_, Uimage_UimageOs> {
        self.os_type.borrow()
    }
}
impl Uimage_Uheader {
    pub fn architecture(&self) -> Ref<'_, Uimage_UimageArch> {
        self.architecture.borrow()
    }
}
impl Uimage_Uheader {
    pub fn image_type(&self) -> Ref<'_, Uimage_UimageType> {
        self.image_type.borrow()
    }
}
impl Uimage_Uheader {
    pub fn compression_type(&self) -> Ref<'_, Uimage_UimageComp> {
        self.compression_type.borrow()
    }
}
impl Uimage_Uheader {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Uimage_Uheader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
