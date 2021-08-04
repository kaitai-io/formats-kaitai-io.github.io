<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The new uImage format allows more flexibility in handling images of various
 * types (kernel, ramdisk, etc.), it also enhances integrity protection of images
 * with sha1 and md5 checksums.
 */

namespace {
    class Uimage extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Uimage $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Uimage\Uheader($this->_io, $this, $this->_root);
            $this->_m_data = $this->_io->readBytes($this->header()->lenImage());
        }
        protected $_m_header;
        protected $_m_data;
        public function header() { return $this->_m_header; }
        public function data() { return $this->_m_data; }
    }
}

namespace Uimage {
    class Uheader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Uimage $_parent = null, \Uimage $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x27\x05\x19\x56")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x27\x05\x19\x56", $this->magic(), $this->_io(), "/types/uheader/seq/0");
            }
            $this->_m_headerCrc = $this->_io->readU4be();
            $this->_m_timestamp = $this->_io->readU4be();
            $this->_m_lenImage = $this->_io->readU4be();
            $this->_m_loadAddress = $this->_io->readU4be();
            $this->_m_entryAddress = $this->_io->readU4be();
            $this->_m_dataCrc = $this->_io->readU4be();
            $this->_m_osType = $this->_io->readU1();
            $this->_m_architecture = $this->_io->readU1();
            $this->_m_imageType = $this->_io->readU1();
            $this->_m_compressionType = $this->_io->readU1();
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(32), 0, false), "UTF-8");
        }
        protected $_m_magic;
        protected $_m_headerCrc;
        protected $_m_timestamp;
        protected $_m_lenImage;
        protected $_m_loadAddress;
        protected $_m_entryAddress;
        protected $_m_dataCrc;
        protected $_m_osType;
        protected $_m_architecture;
        protected $_m_imageType;
        protected $_m_compressionType;
        protected $_m_name;
        public function magic() { return $this->_m_magic; }
        public function headerCrc() { return $this->_m_headerCrc; }
        public function timestamp() { return $this->_m_timestamp; }
        public function lenImage() { return $this->_m_lenImage; }
        public function loadAddress() { return $this->_m_loadAddress; }
        public function entryAddress() { return $this->_m_entryAddress; }
        public function dataCrc() { return $this->_m_dataCrc; }
        public function osType() { return $this->_m_osType; }
        public function architecture() { return $this->_m_architecture; }
        public function imageType() { return $this->_m_imageType; }
        public function compressionType() { return $this->_m_compressionType; }
        public function name() { return $this->_m_name; }
    }
}

namespace Uimage {
    class UimageOs {

        /**
         * Invalid OS
         */
        const INVALID = 0;

        /**
         * OpenBSD
         */
        const OPENBSD = 1;

        /**
         * NetBSD
         */
        const NETBSD = 2;

        /**
         * FreeBSD
         */
        const FREEBSD = 3;

        /**
         * 4.4BSD
         */
        const BSD4_4 = 4;

        /**
         * Linux
         */
        const LINUX = 5;

        /**
         * SVR4
         */
        const SVR4 = 6;

        /**
         * Esix
         */
        const ESIX = 7;

        /**
         * Solaris
         */
        const SOLARIS = 8;

        /**
         * Irix
         */
        const IRIX = 9;

        /**
         * SCO
         */
        const SCO = 10;

        /**
         * Dell
         */
        const DELL = 11;

        /**
         * NCR
         */
        const NCR = 12;

        /**
         * LynxOS
         */
        const LYNXOS = 13;

        /**
         * VxWorks
         */
        const VXWORKS = 14;

        /**
         * pSOS
         */
        const PSOS = 15;

        /**
         * QNX
         */
        const QNX = 16;

        /**
         * Firmware
         */
        const U_BOOT = 17;

        /**
         * RTEMS
         */
        const RTEMS = 18;

        /**
         * ARTOS
         */
        const ARTOS = 19;

        /**
         * Unity OS
         */
        const UNITY = 20;

        /**
         * INTEGRITY
         */
        const INTEGRITY = 21;

        /**
         * OSE
         */
        const OSE = 22;

        /**
         * Plan 9
         */
        const PLAN9 = 23;

        /**
         * OpenRTOS
         */
        const OPENRTOS = 24;

        /**
         * ARM Trusted Firmware
         */
        const ARM_TRUSTED_FIRMWARE = 25;

        /**
         * Trusted Execution Environment
         */
        const TEE = 26;

        /**
         * RISC-V OpenSBI
         */
        const OPENSBI = 27;

        /**
         * EFI Firmware (e.g. GRUB2)
         */
        const EFI = 28;
    }
}

namespace Uimage {
    class UimageArch {

        /**
         * Invalid CPU
         */
        const INVALID = 0;

        /**
         * Alpha
         */
        const ALPHA = 1;

        /**
         * ARM
         */
        const ARM = 2;

        /**
         * Intel x86
         */
        const I386 = 3;

        /**
         * IA64
         */
        const IA64 = 4;

        /**
         * MIPS
         */
        const MIPS = 5;

        /**
         * MIPS 64 Bit
         */
        const MIPS64 = 6;

        /**
         * PowerPC
         */
        const PPC = 7;

        /**
         * IBM S390
         */
        const S390 = 8;

        /**
         * SuperH
         */
        const SH = 9;

        /**
         * Sparc
         */
        const SPARC = 10;

        /**
         * Sparc 64 Bit
         */
        const SPARC64 = 11;

        /**
         * M68K
         */
        const M68K = 12;

        /**
         * Nios-32
         */
        const NIOS = 13;

        /**
         * MicroBlaze
         */
        const MICROBLAZE = 14;

        /**
         * Nios-II
         */
        const NIOS2 = 15;

        /**
         * Blackfin
         */
        const BLACKFIN = 16;

        /**
         * AVR32
         */
        const AVR32 = 17;

        /**
         * STMicroelectronics ST200
         */
        const ST200 = 18;

        /**
         * Sandbox architecture (test only)
         */
        const SANDBOX = 19;

        /**
         * ANDES Technology - NDS32
         */
        const NDS32 = 20;

        /**
         * OpenRISC 1000
         */
        const OPENRISC = 21;

        /**
         * ARM64
         */
        const ARM64 = 22;

        /**
         * Synopsys DesignWare ARC
         */
        const ARC = 23;

        /**
         * AMD x86_64, Intel and Via
         */
        const X86_64 = 24;

        /**
         * Xtensa
         */
        const XTENSA = 25;

        /**
         * RISC-V
         */
        const RISCV = 26;
    }
}

namespace Uimage {
    class UimageComp {

        /**
         * No Compression Used
         */
        const NONE = 0;
        const GZIP = 1;
        const BZIP2 = 2;
        const LZMA = 3;
        const LZO = 4;
        const LZ4 = 5;
        const ZSTD = 6;
    }
}

namespace Uimage {
    class UimageType {

        /**
         * Invalid Image
         */
        const INVALID = 0;

        /**
         * Standalone Program
         */
        const STANDALONE = 1;

        /**
         * OS Kernel Image
         */
        const KERNEL = 2;

        /**
         * RAMDisk Image
         */
        const RAMDISK = 3;

        /**
         * Multi-File Image
         */
        const MULTI = 4;

        /**
         * Firmware Image
         */
        const FIRMWARE = 5;

        /**
         * Script file
         */
        const SCRIPT = 6;

        /**
         * Filesystem Image (any type)
         */
        const FILESYSTEM = 7;

        /**
         * Binary Flat Device Tree Blob
         */
        const FLATDT = 8;

        /**
         * Kirkwood Boot Image
         */
        const KWBIMAGE = 9;

        /**
         * Freescale IMXBoot Image
         */
        const IMXIMAGE = 10;

        /**
         * Davinci UBL Image
         */
        const UBLIMAGE = 11;

        /**
         * TI OMAP Config Header Image
         */
        const OMAPIMAGE = 12;

        /**
         * TI Davinci AIS Image
         */
        const AISIMAGE = 13;

        /**
         * OS Kernel Image, can run from any load address
         */
        const KERNEL_NOLOAD = 14;

        /**
         * Freescale PBL Boot Image
         */
        const PBLIMAGE = 15;

        /**
         * Freescale MXSBoot Image
         */
        const MXSIMAGE = 16;

        /**
         * TI Keystone GPHeader Image
         */
        const GPIMAGE = 17;

        /**
         * ATMEL ROM bootable Image
         */
        const ATMELIMAGE = 18;

        /**
         * Altera SOCFPGA CV/AV Preloader
         */
        const SOCFPGAIMAGE = 19;

        /**
         * x86 setup.bin Image
         */
        const X86_SETUP = 20;

        /**
         * x86 setup.bin Image
         */
        const LPC32XXIMAGE = 21;

        /**
         * A list of typeless images
         */
        const LOADABLE = 22;

        /**
         * Rockchip Boot Image
         */
        const RKIMAGE = 23;

        /**
         * Rockchip SD card
         */
        const RKSD = 24;

        /**
         * Rockchip SPI image
         */
        const RKSPI = 25;

        /**
         * Xilinx Zynq Boot Image
         */
        const ZYNQIMAGE = 26;

        /**
         * Xilinx ZynqMP Boot Image
         */
        const ZYNQMPIMAGE = 27;

        /**
         * Xilinx ZynqMP Boot Image (bif)
         */
        const ZYNQMPBIF = 28;

        /**
         * FPGA Image
         */
        const FPGA = 29;

        /**
         * VYBRID .vyb Image
         */
        const VYBRIDIMAGE = 30;

        /**
         * Trusted Execution Environment OS Image
         */
        const TEE = 31;

        /**
         * Firmware Image with HABv4 IVT
         */
        const FIRMWARE_IVT = 32;

        /**
         * TI Power Management Micro-Controller Firmware
         */
        const PMMC = 33;

        /**
         * STMicroelectronics STM32 Image
         */
        const STM32IMAGE = 34;

        /**
         * Altera SOCFPGA A10 Preloader
         */
        const SOCFPGAIMAGE_V1 = 35;

        /**
         * MediaTek BootROM loadable Image
         */
        const MTKIMAGE = 36;

        /**
         * Freescale IMX8MBoot Image
         */
        const IMX8MIMAGE = 37;

        /**
         * Freescale IMX8Boot Image
         */
        const IMX8IMAGE = 38;

        /**
         * Coprocessor Image for remoteproc
         */
        const COPRO = 39;

        /**
         * Allwinner eGON Boot Image
         */
        const SUNXI_EGON = 40;
    }
}
