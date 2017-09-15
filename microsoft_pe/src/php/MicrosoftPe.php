<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class MicrosoftPe extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MicrosoftPe $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_mz1 = new \MicrosoftPe\MzPlaceholder($this->_io, $this, $this->_root);
        $this->_m_mz2 = $this->_io->readBytes(($this->mz1()->headerSize() - 64));
        $this->_m_peSignature = $this->_io->ensureFixedContents("\x50\x45\x00\x00");
        $this->_m_coffHdr = new \MicrosoftPe\CoffHeader($this->_io, $this, $this->_root);
        $this->_m__raw_optionalHdr = $this->_io->readBytes($this->coffHdr()->sizeOfOptionalHeader());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_optionalHdr);
        $this->_m_optionalHdr = new \MicrosoftPe\OptionalHeader($io, $this, $this->_root);
        $this->_m_sections = [];
        $n = $this->coffHdr()->numberOfSections();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_sections[] = new \MicrosoftPe\Section($this->_io, $this, $this->_root);
        }
    }
    protected $_m_mz1;
    protected $_m_mz2;
    protected $_m_peSignature;
    protected $_m_coffHdr;
    protected $_m_optionalHdr;
    protected $_m_sections;
    protected $_m__raw_optionalHdr;
    public function mz1() { return $this->_m_mz1; }
    public function mz2() { return $this->_m_mz2; }
    public function peSignature() { return $this->_m_peSignature; }
    public function coffHdr() { return $this->_m_coffHdr; }
    public function optionalHdr() { return $this->_m_optionalHdr; }
    public function sections() { return $this->_m_sections; }
    public function _raw_optionalHdr() { return $this->_m__raw_optionalHdr; }
}

namespace \MicrosoftPe;

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

namespace \MicrosoftPe\OptionalHeaderWindows;

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
}

namespace \MicrosoftPe;

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

namespace \MicrosoftPe;

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

namespace \MicrosoftPe;

class OptionalHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe $_parent = null, \MicrosoftPe $_root = null) {
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

namespace \MicrosoftPe;

class Section extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe $_parent = null, \MicrosoftPe $_root = null) {
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

namespace \MicrosoftPe;

class MzPlaceholder extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe $_parent = null, \MicrosoftPe $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x4D\x5A");
        $this->_m_data1 = $this->_io->readBytes(58);
        $this->_m_headerSize = $this->_io->readU4le();
    }
    protected $_m_magic;
    protected $_m_data1;
    protected $_m_headerSize;
    public function magic() { return $this->_m_magic; }
    public function data1() { return $this->_m_data1; }
    public function headerSize() { return $this->_m_headerSize; }
}

namespace \MicrosoftPe;

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

namespace \MicrosoftPe;

class CoffHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MicrosoftPe $_parent = null, \MicrosoftPe $_root = null) {
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

namespace \MicrosoftPe\CoffHeader;

class MachineType {
    const UNKNOWN = 0;
    const I386 = 332;
    const R4000 = 358;
    const WCEMIPSV2 = 361;
    const SH3 = 418;
    const SH3DSP = 419;
    const SH4 = 422;
    const SH5 = 424;
    const ARM = 448;
    const THUMB = 450;
    const ARMNT = 452;
    const AM33 = 467;
    const POWERPC = 496;
    const POWERPCFP = 497;
    const IA64 = 512;
    const MIPS16 = 614;
    const MIPSFPU = 870;
    const MIPSFPU16 = 1126;
    const EBC = 3772;
    const RISCV32 = 20530;
    const RISCV64 = 20580;
    const RISCV128 = 20776;
    const AMD64 = 34404;
    const M32R = 36929;
}

namespace \MicrosoftPe;

class PeFormat {
    const ROM_IMAGE = 263;
    const PE32 = 267;
    const PE32_PLUS = 523;
}
