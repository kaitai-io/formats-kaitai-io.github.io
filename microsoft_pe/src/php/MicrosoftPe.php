<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class MicrosoftPe extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_mz = new \MicrosoftPe\MzPlaceholder($this->_io, $this, $this->_root);
        }
        protected $_m_pe;
        public function pe() {
            if ($this->_m_pe !== null)
                return $this->_m_pe;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->mz()->ofsPe());
            $this->_m_pe = new \MicrosoftPe\PeHeader($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_pe;
        }
        protected $_m_mz;
        public function mz() { return $this->_m_mz; }
    }
}

namespace MicrosoftPe {
    class CertificateEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe\CertificateTable $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_length = $this->_io->readU4le();
            $this->_m_revision = $this->_io->readU2le();
            $this->_m_certificateType = $this->_io->readU2le();
            $this->_m_certificateBytes = $this->_io->readBytes(($this->length() - 8));
        }
        protected $_m_length;
        protected $_m_revision;
        protected $_m_certificateType;
        protected $_m_certificateBytes;

        /**
         * Specifies the length of the attribute certificate entry.
         */
        public function length() { return $this->_m_length; }

        /**
         * Contains the certificate version number.
         */
        public function revision() { return $this->_m_revision; }

        /**
         * Specifies the type of content in bCertificate
         */
        public function certificateType() { return $this->_m_certificateType; }

        /**
         * Contains a certificate, such as an Authenticode signature.
         */
        public function certificateBytes() { return $this->_m_certificateBytes; }
    }
}

namespace MicrosoftPe\CertificateEntry {
    class CertificateRevision {

        /**
         * Version 1, legacy version of the Win_Certificate structure.
         * It is supported only for purposes of verifying legacy Authenticode signatures
         */
        const REVISION_1_0 = 256;

        /**
         * Version 2 is the current version of the Win_Certificate structure.
         */
        const REVISION_2_0 = 512;
    }
}

namespace MicrosoftPe\CertificateEntry {
    class CertificateTypeEnum {

        /**
         * bCertificate contains an X.509 Certificate
         * Not Supported
         */
        const X509 = 1;

        /**
         * bCertificate contains a PKCS#7 SignedData structure
         */
        const PKCS_SIGNED_DATA = 2;

        /**
         * Reserved
         */
        const RESERVED_1 = 3;

        /**
         * Terminal Server Protocol Stack Certificate signing
         * Not Supported
         */
        const TS_STACK_SIGNED = 4;
    }
}

namespace MicrosoftPe {
    class OptionalHeaderWindows extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe\OptionalHeader $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            if ($this->_parent()->std()->format() == \MicrosoftPe\PeFormat::PE32) {
                $this->_m_imageBase32 = $this->_io->readU4le();
            }
            if ($this->_parent()->std()->format() == \MicrosoftPe\PeFormat::PE32_PLUS) {
                $this->_m_imageBase64 = $this->_io->readU8le();
            }
            $this->_m_sectionAlignment = $this->_io->readU4le();
            $this->_m_fileAlignment = $this->_io->readU4le();
            $this->_m_majorOperatingSystemVersion = $this->_io->readU2le();
            $this->_m_minorOperatingSystemVersion = $this->_io->readU2le();
            $this->_m_majorImageVersion = $this->_io->readU2le();
            $this->_m_minorImageVersion = $this->_io->readU2le();
            $this->_m_majorSubsystemVersion = $this->_io->readU2le();
            $this->_m_minorSubsystemVersion = $this->_io->readU2le();
            $this->_m_win32VersionValue = $this->_io->readU4le();
            $this->_m_sizeOfImage = $this->_io->readU4le();
            $this->_m_sizeOfHeaders = $this->_io->readU4le();
            $this->_m_checkSum = $this->_io->readU4le();
            $this->_m_subsystem = $this->_io->readU2le();
            $this->_m_dllCharacteristics = $this->_io->readU2le();
            if ($this->_parent()->std()->format() == \MicrosoftPe\PeFormat::PE32) {
                $this->_m_sizeOfStackReserve32 = $this->_io->readU4le();
            }
            if ($this->_parent()->std()->format() == \MicrosoftPe\PeFormat::PE32_PLUS) {
                $this->_m_sizeOfStackReserve64 = $this->_io->readU8le();
            }
            if ($this->_parent()->std()->format() == \MicrosoftPe\PeFormat::PE32) {
                $this->_m_sizeOfStackCommit32 = $this->_io->readU4le();
            }
            if ($this->_parent()->std()->format() == \MicrosoftPe\PeFormat::PE32_PLUS) {
                $this->_m_sizeOfStackCommit64 = $this->_io->readU8le();
            }
            if ($this->_parent()->std()->format() == \MicrosoftPe\PeFormat::PE32) {
                $this->_m_sizeOfHeapReserve32 = $this->_io->readU4le();
            }
            if ($this->_parent()->std()->format() == \MicrosoftPe\PeFormat::PE32_PLUS) {
                $this->_m_sizeOfHeapReserve64 = $this->_io->readU8le();
            }
            if ($this->_parent()->std()->format() == \MicrosoftPe\PeFormat::PE32) {
                $this->_m_sizeOfHeapCommit32 = $this->_io->readU4le();
            }
            if ($this->_parent()->std()->format() == \MicrosoftPe\PeFormat::PE32_PLUS) {
                $this->_m_sizeOfHeapCommit64 = $this->_io->readU8le();
            }
            $this->_m_loaderFlags = $this->_io->readU4le();
            $this->_m_numberOfRvaAndSizes = $this->_io->readU4le();
        }
        protected $_m_imageBase32;
        protected $_m_imageBase64;
        protected $_m_sectionAlignment;
        protected $_m_fileAlignment;
        protected $_m_majorOperatingSystemVersion;
        protected $_m_minorOperatingSystemVersion;
        protected $_m_majorImageVersion;
        protected $_m_minorImageVersion;
        protected $_m_majorSubsystemVersion;
        protected $_m_minorSubsystemVersion;
        protected $_m_win32VersionValue;
        protected $_m_sizeOfImage;
        protected $_m_sizeOfHeaders;
        protected $_m_checkSum;
        protected $_m_subsystem;
        protected $_m_dllCharacteristics;
        protected $_m_sizeOfStackReserve32;
        protected $_m_sizeOfStackReserve64;
        protected $_m_sizeOfStackCommit32;
        protected $_m_sizeOfStackCommit64;
        protected $_m_sizeOfHeapReserve32;
        protected $_m_sizeOfHeapReserve64;
        protected $_m_sizeOfHeapCommit32;
        protected $_m_sizeOfHeapCommit64;
        protected $_m_loaderFlags;
        protected $_m_numberOfRvaAndSizes;
        public function imageBase32() { return $this->_m_imageBase32; }
        public function imageBase64() { return $this->_m_imageBase64; }
        public function sectionAlignment() { return $this->_m_sectionAlignment; }
        public function fileAlignment() { return $this->_m_fileAlignment; }
        public function majorOperatingSystemVersion() { return $this->_m_majorOperatingSystemVersion; }
        public function minorOperatingSystemVersion() { return $this->_m_minorOperatingSystemVersion; }
        public function majorImageVersion() { return $this->_m_majorImageVersion; }
        public function minorImageVersion() { return $this->_m_minorImageVersion; }
        public function majorSubsystemVersion() { return $this->_m_majorSubsystemVersion; }
        public function minorSubsystemVersion() { return $this->_m_minorSubsystemVersion; }
        public function win32VersionValue() { return $this->_m_win32VersionValue; }
        public function sizeOfImage() { return $this->_m_sizeOfImage; }
        public function sizeOfHeaders() { return $this->_m_sizeOfHeaders; }
        public function checkSum() { return $this->_m_checkSum; }
        public function subsystem() { return $this->_m_subsystem; }
        public function dllCharacteristics() { return $this->_m_dllCharacteristics; }
        public function sizeOfStackReserve32() { return $this->_m_sizeOfStackReserve32; }
        public function sizeOfStackReserve64() { return $this->_m_sizeOfStackReserve64; }
        public function sizeOfStackCommit32() { return $this->_m_sizeOfStackCommit32; }
        public function sizeOfStackCommit64() { return $this->_m_sizeOfStackCommit64; }
        public function sizeOfHeapReserve32() { return $this->_m_sizeOfHeapReserve32; }
        public function sizeOfHeapReserve64() { return $this->_m_sizeOfHeapReserve64; }
        public function sizeOfHeapCommit32() { return $this->_m_sizeOfHeapCommit32; }
        public function sizeOfHeapCommit64() { return $this->_m_sizeOfHeapCommit64; }
        public function loaderFlags() { return $this->_m_loaderFlags; }
        public function numberOfRvaAndSizes() { return $this->_m_numberOfRvaAndSizes; }
    }
}

namespace MicrosoftPe\OptionalHeaderWindows {
    class SubsystemEnum {
        const UNKNOWN = 0;
        const NATIVE = 1;
        const WINDOWS_GUI = 2;
        const WINDOWS_CUI = 3;
        const POSIX_CUI = 7;
        const WINDOWS_CE_GUI = 9;
        const EFI_APPLICATION = 10;
        const EFI_BOOT_SERVICE_DRIVER = 11;
        const EFI_RUNTIME_DRIVER = 12;
        const EFI_ROM = 13;
        const XBOX = 14;
        const WINDOWS_BOOT_APPLICATION = 16;
    }
}

namespace MicrosoftPe {
    class OptionalHeaderDataDirs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe\OptionalHeader $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_exportTable = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_importTable = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_resourceTable = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_exceptionTable = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_certificateTable = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_baseRelocationTable = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_debug = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_architecture = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_globalPtr = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_tlsTable = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_loadConfigTable = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_boundImport = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_iat = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_delayImportDescriptor = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
            $this->_m_clrRuntimeHeader = new \MicrosoftPe\DataDir($this->_io, $this, $this->_root);
        }
        protected $_m_exportTable;
        protected $_m_importTable;
        protected $_m_resourceTable;
        protected $_m_exceptionTable;
        protected $_m_certificateTable;
        protected $_m_baseRelocationTable;
        protected $_m_debug;
        protected $_m_architecture;
        protected $_m_globalPtr;
        protected $_m_tlsTable;
        protected $_m_loadConfigTable;
        protected $_m_boundImport;
        protected $_m_iat;
        protected $_m_delayImportDescriptor;
        protected $_m_clrRuntimeHeader;
        public function exportTable() { return $this->_m_exportTable; }
        public function importTable() { return $this->_m_importTable; }
        public function resourceTable() { return $this->_m_resourceTable; }
        public function exceptionTable() { return $this->_m_exceptionTable; }
        public function certificateTable() { return $this->_m_certificateTable; }
        public function baseRelocationTable() { return $this->_m_baseRelocationTable; }
        public function debug() { return $this->_m_debug; }
        public function architecture() { return $this->_m_architecture; }
        public function globalPtr() { return $this->_m_globalPtr; }
        public function tlsTable() { return $this->_m_tlsTable; }
        public function loadConfigTable() { return $this->_m_loadConfigTable; }
        public function boundImport() { return $this->_m_boundImport; }
        public function iat() { return $this->_m_iat; }
        public function delayImportDescriptor() { return $this->_m_delayImportDescriptor; }
        public function clrRuntimeHeader() { return $this->_m_clrRuntimeHeader; }
    }
}

namespace MicrosoftPe {
    class DataDir extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe\OptionalHeaderDataDirs $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_virtualAddress = $this->_io->readU4le();
            $this->_m_size = $this->_io->readU4le();
        }
        protected $_m_virtualAddress;
        protected $_m_size;
        public function virtualAddress() { return $this->_m_virtualAddress; }
        public function size() { return $this->_m_size; }
    }
}

namespace MicrosoftPe {
    class CoffSymbol extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe\CoffHeader $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_nameAnnoying = $this->_io->readBytes(8);
            $_io__raw_nameAnnoying = new \Kaitai\Struct\Stream($this->_m__raw_nameAnnoying);
            $this->_m_nameAnnoying = new \MicrosoftPe\Annoyingstring($_io__raw_nameAnnoying, $this, $this->_root);
            $this->_m_value = $this->_io->readU4le();
            $this->_m_sectionNumber = $this->_io->readU2le();
            $this->_m_type = $this->_io->readU2le();
            $this->_m_storageClass = $this->_io->readU1();
            $this->_m_numberOfAuxSymbols = $this->_io->readU1();
        }
        protected $_m_section;
        public function section() {
            if ($this->_m_section !== null)
                return $this->_m_section;
            $this->_m_section = $this->_root()->pe()->sections()[($this->sectionNumber() - 1)];
            return $this->_m_section;
        }
        protected $_m_data;
        public function data() {
            if ($this->_m_data !== null)
                return $this->_m_data;
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->section()->pointerToRawData() + $this->value()));
            $this->_m_data = $this->_io->readBytes(1);
            $this->_io->seek($_pos);
            return $this->_m_data;
        }
        protected $_m_nameAnnoying;
        protected $_m_value;
        protected $_m_sectionNumber;
        protected $_m_type;
        protected $_m_storageClass;
        protected $_m_numberOfAuxSymbols;
        protected $_m__raw_nameAnnoying;
        public function nameAnnoying() { return $this->_m_nameAnnoying; }
        public function value() { return $this->_m_value; }
        public function sectionNumber() { return $this->_m_sectionNumber; }
        public function type() { return $this->_m_type; }
        public function storageClass() { return $this->_m_storageClass; }
        public function numberOfAuxSymbols() { return $this->_m_numberOfAuxSymbols; }
        public function _raw_nameAnnoying() { return $this->_m__raw_nameAnnoying; }
    }
}

namespace MicrosoftPe {
    class PeHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_peSignature = $this->_io->readBytes(4);
            if (!($this->peSignature() == "\x50\x45\x00\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x50\x45\x00\x00", $this->peSignature(), $this->_io(), "/types/pe_header/seq/0");
            }
            $this->_m_coffHdr = new \MicrosoftPe\CoffHeader($this->_io, $this, $this->_root);
            $this->_m__raw_optionalHdr = $this->_io->readBytes($this->coffHdr()->sizeOfOptionalHeader());
            $_io__raw_optionalHdr = new \Kaitai\Struct\Stream($this->_m__raw_optionalHdr);
            $this->_m_optionalHdr = new \MicrosoftPe\OptionalHeader($_io__raw_optionalHdr, $this, $this->_root);
            $this->_m_sections = [];
            $n = $this->coffHdr()->numberOfSections();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_sections[] = new \MicrosoftPe\Section($this->_io, $this, $this->_root);
            }
        }
        protected $_m_certificateTable;
        public function certificateTable() {
            if ($this->_m_certificateTable !== null)
                return $this->_m_certificateTable;
            if ($this->optionalHdr()->dataDirs()->certificateTable()->virtualAddress() != 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->optionalHdr()->dataDirs()->certificateTable()->virtualAddress());
                $this->_m__raw_certificateTable = $this->_io->readBytes($this->optionalHdr()->dataDirs()->certificateTable()->size());
                $_io__raw_certificateTable = new \Kaitai\Struct\Stream($this->_m__raw_certificateTable);
                $this->_m_certificateTable = new \MicrosoftPe\CertificateTable($_io__raw_certificateTable, $this, $this->_root);
                $this->_io->seek($_pos);
            }
            return $this->_m_certificateTable;
        }
        protected $_m_peSignature;
        protected $_m_coffHdr;
        protected $_m_optionalHdr;
        protected $_m_sections;
        protected $_m__raw_optionalHdr;
        protected $_m__raw_certificateTable;
        public function peSignature() { return $this->_m_peSignature; }
        public function coffHdr() { return $this->_m_coffHdr; }
        public function optionalHdr() { return $this->_m_optionalHdr; }
        public function sections() { return $this->_m_sections; }
        public function _raw_optionalHdr() { return $this->_m__raw_optionalHdr; }
        public function _raw_certificateTable() { return $this->_m__raw_certificateTable; }
    }
}

namespace MicrosoftPe {
    class OptionalHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe\PeHeader $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_std = new \MicrosoftPe\OptionalHeaderStd($this->_io, $this, $this->_root);
            $this->_m_windows = new \MicrosoftPe\OptionalHeaderWindows($this->_io, $this, $this->_root);
            $this->_m_dataDirs = new \MicrosoftPe\OptionalHeaderDataDirs($this->_io, $this, $this->_root);
        }
        protected $_m_std;
        protected $_m_windows;
        protected $_m_dataDirs;
        public function std() { return $this->_m_std; }
        public function windows() { return $this->_m_windows; }
        public function dataDirs() { return $this->_m_dataDirs; }
    }
}

namespace MicrosoftPe {
    class Section extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe\PeHeader $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(8), 0), "UTF-8");
            $this->_m_virtualSize = $this->_io->readU4le();
            $this->_m_virtualAddress = $this->_io->readU4le();
            $this->_m_sizeOfRawData = $this->_io->readU4le();
            $this->_m_pointerToRawData = $this->_io->readU4le();
            $this->_m_pointerToRelocations = $this->_io->readU4le();
            $this->_m_pointerToLinenumbers = $this->_io->readU4le();
            $this->_m_numberOfRelocations = $this->_io->readU2le();
            $this->_m_numberOfLinenumbers = $this->_io->readU2le();
            $this->_m_characteristics = $this->_io->readU4le();
        }
        protected $_m_body;
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->pointerToRawData());
            $this->_m_body = $this->_io->readBytes($this->sizeOfRawData());
            $this->_io->seek($_pos);
            return $this->_m_body;
        }
        protected $_m_name;
        protected $_m_virtualSize;
        protected $_m_virtualAddress;
        protected $_m_sizeOfRawData;
        protected $_m_pointerToRawData;
        protected $_m_pointerToRelocations;
        protected $_m_pointerToLinenumbers;
        protected $_m_numberOfRelocations;
        protected $_m_numberOfLinenumbers;
        protected $_m_characteristics;
        public function name() { return $this->_m_name; }
        public function virtualSize() { return $this->_m_virtualSize; }
        public function virtualAddress() { return $this->_m_virtualAddress; }
        public function sizeOfRawData() { return $this->_m_sizeOfRawData; }
        public function pointerToRawData() { return $this->_m_pointerToRawData; }
        public function pointerToRelocations() { return $this->_m_pointerToRelocations; }
        public function pointerToLinenumbers() { return $this->_m_pointerToLinenumbers; }
        public function numberOfRelocations() { return $this->_m_numberOfRelocations; }
        public function numberOfLinenumbers() { return $this->_m_numberOfLinenumbers; }
        public function characteristics() { return $this->_m_characteristics; }
    }
}

namespace MicrosoftPe {
    class CertificateTable extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe\PeHeader $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_items = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_items[] = new \MicrosoftPe\CertificateEntry($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_items;
        public function items() { return $this->_m_items; }
    }
}

namespace MicrosoftPe {
    class MzPlaceholder extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(2);
            if (!($this->magic() == "\x4D\x5A")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4D\x5A", $this->magic(), $this->_io(), "/types/mz_placeholder/seq/0");
            }
            $this->_m_data1 = $this->_io->readBytes(58);
            $this->_m_ofsPe = $this->_io->readU4le();
        }
        protected $_m_magic;
        protected $_m_data1;
        protected $_m_ofsPe;
        public function magic() { return $this->_m_magic; }
        public function data1() { return $this->_m_data1; }

        /**
         * In PE file, an offset to PE header
         */
        public function ofsPe() { return $this->_m_ofsPe; }
    }
}

namespace MicrosoftPe {
    class OptionalHeaderStd extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe\OptionalHeader $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_format = $this->_io->readU2le();
            $this->_m_majorLinkerVersion = $this->_io->readU1();
            $this->_m_minorLinkerVersion = $this->_io->readU1();
            $this->_m_sizeOfCode = $this->_io->readU4le();
            $this->_m_sizeOfInitializedData = $this->_io->readU4le();
            $this->_m_sizeOfUninitializedData = $this->_io->readU4le();
            $this->_m_addressOfEntryPoint = $this->_io->readU4le();
            $this->_m_baseOfCode = $this->_io->readU4le();
            if ($this->format() == \MicrosoftPe\PeFormat::PE32) {
                $this->_m_baseOfData = $this->_io->readU4le();
            }
        }
        protected $_m_format;
        protected $_m_majorLinkerVersion;
        protected $_m_minorLinkerVersion;
        protected $_m_sizeOfCode;
        protected $_m_sizeOfInitializedData;
        protected $_m_sizeOfUninitializedData;
        protected $_m_addressOfEntryPoint;
        protected $_m_baseOfCode;
        protected $_m_baseOfData;
        public function format() { return $this->_m_format; }
        public function majorLinkerVersion() { return $this->_m_majorLinkerVersion; }
        public function minorLinkerVersion() { return $this->_m_minorLinkerVersion; }
        public function sizeOfCode() { return $this->_m_sizeOfCode; }
        public function sizeOfInitializedData() { return $this->_m_sizeOfInitializedData; }
        public function sizeOfUninitializedData() { return $this->_m_sizeOfUninitializedData; }
        public function addressOfEntryPoint() { return $this->_m_addressOfEntryPoint; }
        public function baseOfCode() { return $this->_m_baseOfCode; }
        public function baseOfData() { return $this->_m_baseOfData; }
    }
}

namespace MicrosoftPe {
    class CoffHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe\PeHeader $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_machine = $this->_io->readU2le();
            $this->_m_numberOfSections = $this->_io->readU2le();
            $this->_m_timeDateStamp = $this->_io->readU4le();
            $this->_m_pointerToSymbolTable = $this->_io->readU4le();
            $this->_m_numberOfSymbols = $this->_io->readU4le();
            $this->_m_sizeOfOptionalHeader = $this->_io->readU2le();
            $this->_m_characteristics = $this->_io->readU2le();
        }
        protected $_m_symbolTableSize;
        public function symbolTableSize() {
            if ($this->_m_symbolTableSize !== null)
                return $this->_m_symbolTableSize;
            $this->_m_symbolTableSize = ($this->numberOfSymbols() * 18);
            return $this->_m_symbolTableSize;
        }
        protected $_m_symbolNameTableOffset;
        public function symbolNameTableOffset() {
            if ($this->_m_symbolNameTableOffset !== null)
                return $this->_m_symbolNameTableOffset;
            $this->_m_symbolNameTableOffset = ($this->pointerToSymbolTable() + $this->symbolTableSize());
            return $this->_m_symbolNameTableOffset;
        }
        protected $_m_symbolNameTableSize;
        public function symbolNameTableSize() {
            if ($this->_m_symbolNameTableSize !== null)
                return $this->_m_symbolNameTableSize;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->symbolNameTableOffset());
            $this->_m_symbolNameTableSize = $this->_io->readU4le();
            $this->_io->seek($_pos);
            return $this->_m_symbolNameTableSize;
        }
        protected $_m_symbolTable;
        public function symbolTable() {
            if ($this->_m_symbolTable !== null)
                return $this->_m_symbolTable;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->pointerToSymbolTable());
            $this->_m_symbolTable = [];
            $n = $this->numberOfSymbols();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_symbolTable[] = new \MicrosoftPe\CoffSymbol($this->_io, $this, $this->_root);
            }
            $this->_io->seek($_pos);
            return $this->_m_symbolTable;
        }
        protected $_m_machine;
        protected $_m_numberOfSections;
        protected $_m_timeDateStamp;
        protected $_m_pointerToSymbolTable;
        protected $_m_numberOfSymbols;
        protected $_m_sizeOfOptionalHeader;
        protected $_m_characteristics;
        public function machine() { return $this->_m_machine; }
        public function numberOfSections() { return $this->_m_numberOfSections; }
        public function timeDateStamp() { return $this->_m_timeDateStamp; }
        public function pointerToSymbolTable() { return $this->_m_pointerToSymbolTable; }
        public function numberOfSymbols() { return $this->_m_numberOfSymbols; }
        public function sizeOfOptionalHeader() { return $this->_m_sizeOfOptionalHeader; }
        public function characteristics() { return $this->_m_characteristics; }
    }
}

namespace MicrosoftPe\CoffHeader {
    class MachineType {

        /**
         * The content of this field is assumed to be applicable to any machine type
         */
        const UNKNOWN = 0;

        /**
         * Intel 386 or later processors and compatible processors
         */
        const I386 = 332;

        /**
         * MIPS little endian
         */
        const R4000 = 358;

        /**
         * MIPS little-endian WCE v2
         */
        const WCE_MIPS_V2 = 361;

        /**
         * Alpha AXP, 32-bit address space
         */
        const ALPHA = 388;

        /**
         * Hitachi SH3
         */
        const SH3 = 418;

        /**
         * Hitachi SH3 DSP
         */
        const SH3_DSP = 419;

        /**
         * Hitachi SH4
         */
        const SH4 = 422;

        /**
         * Hitachi SH5
         */
        const SH5 = 424;

        /**
         * ARM little endian
         */
        const ARM = 448;

        /**
         * Thumb
         */
        const THUMB = 450;

        /**
         * ARM Thumb-2 little endian
         */
        const ARM_NT = 452;

        /**
         * Matsushita AM33
         */
        const AM33 = 467;

        /**
         * Power PC little endian
         */
        const POWERPC = 496;

        /**
         * Power PC with floating point support
         */
        const POWERPC_FP = 497;

        /**
         * Intel Itanium processor family
         */
        const IA64 = 512;

        /**
         * MIPS16
         */
        const MIPS16 = 614;

        /**
         * > Alpha 64, 64-bit address space
         * or
         * > AXP 64 (Same as Alpha 64)
         */
        const ALPHA64_OR_AXP64 = 644;

        /**
         * MIPS with FPU
         */
        const MIPS_FPU = 870;

        /**
         * MIPS16 with FPU
         */
        const MIPS16_FPU = 1126;

        /**
         * EFI byte code
         */
        const EBC = 3772;

        /**
         * RISC-V 32-bit address space
         */
        const RISCV32 = 20530;

        /**
         * RISC-V 64-bit address space
         */
        const RISCV64 = 20580;

        /**
         * RISC-V 128-bit address space
         */
        const RISCV128 = 20776;

        /**
         * LoongArch 32-bit processor family
         */
        const LOONGARCH32 = 25138;

        /**
         * LoongArch 64-bit processor family
         */
        const LOONGARCH64 = 25188;

        /**
         * x64
         */
        const AMD64 = 34404;

        /**
         * Mitsubishi M32R little endian
         */
        const M32R = 36929;

        /**
         * ARM64 little endian
         */
        const ARM64 = 43620;
    }
}

namespace MicrosoftPe {
    class Annoyingstring extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe\CoffSymbol $_parent = null, \MicrosoftPe $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_nameFromOffset;
        public function nameFromOffset() {
            if ($this->_m_nameFromOffset !== null)
                return $this->_m_nameFromOffset;
            if ($this->nameZeroes() == 0) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek(($this->nameZeroes() == 0 ? ($this->_parent()->_parent()->symbolNameTableOffset() + $this->nameOffset()) : 0));
                $this->_m_nameFromOffset = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, false), "ascii");
                $io->seek($_pos);
            }
            return $this->_m_nameFromOffset;
        }
        protected $_m_nameOffset;
        public function nameOffset() {
            if ($this->_m_nameOffset !== null)
                return $this->_m_nameOffset;
            $_pos = $this->_io->pos();
            $this->_io->seek(4);
            $this->_m_nameOffset = $this->_io->readU4le();
            $this->_io->seek($_pos);
            return $this->_m_nameOffset;
        }
        protected $_m_name;
        public function name() {
            if ($this->_m_name !== null)
                return $this->_m_name;
            $this->_m_name = ($this->nameZeroes() == 0 ? $this->nameFromOffset() : $this->nameFromShort());
            return $this->_m_name;
        }
        protected $_m_nameZeroes;
        public function nameZeroes() {
            if ($this->_m_nameZeroes !== null)
                return $this->_m_nameZeroes;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_nameZeroes = $this->_io->readU4le();
            $this->_io->seek($_pos);
            return $this->_m_nameZeroes;
        }
        protected $_m_nameFromShort;
        public function nameFromShort() {
            if ($this->_m_nameFromShort !== null)
                return $this->_m_nameFromShort;
            if ($this->nameZeroes() != 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek(0);
                $this->_m_nameFromShort = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, false), "ascii");
                $this->_io->seek($_pos);
            }
            return $this->_m_nameFromShort;
        }
    }
}

namespace MicrosoftPe {
    class PeFormat {
        const ROM_IMAGE = 263;
        const PE32 = 267;
        const PE32_PLUS = 523;
    }
}
