// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.MicrosoftPe = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * @see {@link http://www.microsoft.com/whdc/system/platform/firmware/PECOFF.mspx|Source}
 */

var MicrosoftPe = (function() {
  MicrosoftPe.PeFormat = Object.freeze({
    ROM_IMAGE: 263,
    PE32: 267,
    PE32_PLUS: 523,

    263: "ROM_IMAGE",
    267: "PE32",
    523: "PE32_PLUS",
  });

  function MicrosoftPe(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  MicrosoftPe.prototype._read = function() {
    this.mz = new MzPlaceholder(this._io, this, this._root);
  }

  /**
   * @see {@link https://docs.microsoft.com/en-us/windows/desktop/debug/pe-format#the-attribute-certificate-table-image-only|Source}
   */

  var CertificateEntry = MicrosoftPe.CertificateEntry = (function() {
    CertificateEntry.CertificateRevision = Object.freeze({
      REVISION_1_0: 256,
      REVISION_2_0: 512,

      256: "REVISION_1_0",
      512: "REVISION_2_0",
    });

    CertificateEntry.CertificateType = Object.freeze({
      X509: 1,
      PKCS_SIGNED_DATA: 2,
      RESERVED_1: 3,
      TS_STACK_SIGNED: 4,

      1: "X509",
      2: "PKCS_SIGNED_DATA",
      3: "RESERVED_1",
      4: "TS_STACK_SIGNED",
    });

    function CertificateEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CertificateEntry.prototype._read = function() {
      this.length = this._io.readU4le();
      this.revision = this._io.readU2le();
      this.certificateType = this._io.readU2le();
      this.certificateBytes = this._io.readBytes((this.length - 8));
    }

    /**
     * Specifies the length of the attribute certificate entry.
     */

    /**
     * Contains the certificate version number.
     */

    /**
     * Specifies the type of content in bCertificate
     */

    /**
     * Contains a certificate, such as an Authenticode signature.
     */

    return CertificateEntry;
  })();

  var OptionalHeaderWindows = MicrosoftPe.OptionalHeaderWindows = (function() {
    OptionalHeaderWindows.SubsystemEnum = Object.freeze({
      UNKNOWN: 0,
      NATIVE: 1,
      WINDOWS_GUI: 2,
      WINDOWS_CUI: 3,
      POSIX_CUI: 7,
      WINDOWS_CE_GUI: 9,
      EFI_APPLICATION: 10,
      EFI_BOOT_SERVICE_DRIVER: 11,
      EFI_RUNTIME_DRIVER: 12,
      EFI_ROM: 13,
      XBOX: 14,
      WINDOWS_BOOT_APPLICATION: 16,

      0: "UNKNOWN",
      1: "NATIVE",
      2: "WINDOWS_GUI",
      3: "WINDOWS_CUI",
      7: "POSIX_CUI",
      9: "WINDOWS_CE_GUI",
      10: "EFI_APPLICATION",
      11: "EFI_BOOT_SERVICE_DRIVER",
      12: "EFI_RUNTIME_DRIVER",
      13: "EFI_ROM",
      14: "XBOX",
      16: "WINDOWS_BOOT_APPLICATION",
    });

    function OptionalHeaderWindows(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OptionalHeaderWindows.prototype._read = function() {
      if (this._parent.std.format == MicrosoftPe.PeFormat.PE32) {
        this.imageBase32 = this._io.readU4le();
      }
      if (this._parent.std.format == MicrosoftPe.PeFormat.PE32_PLUS) {
        this.imageBase64 = this._io.readU8le();
      }
      this.sectionAlignment = this._io.readU4le();
      this.fileAlignment = this._io.readU4le();
      this.majorOperatingSystemVersion = this._io.readU2le();
      this.minorOperatingSystemVersion = this._io.readU2le();
      this.majorImageVersion = this._io.readU2le();
      this.minorImageVersion = this._io.readU2le();
      this.majorSubsystemVersion = this._io.readU2le();
      this.minorSubsystemVersion = this._io.readU2le();
      this.win32VersionValue = this._io.readU4le();
      this.sizeOfImage = this._io.readU4le();
      this.sizeOfHeaders = this._io.readU4le();
      this.checkSum = this._io.readU4le();
      this.subsystem = this._io.readU2le();
      this.dllCharacteristics = this._io.readU2le();
      if (this._parent.std.format == MicrosoftPe.PeFormat.PE32) {
        this.sizeOfStackReserve32 = this._io.readU4le();
      }
      if (this._parent.std.format == MicrosoftPe.PeFormat.PE32_PLUS) {
        this.sizeOfStackReserve64 = this._io.readU8le();
      }
      if (this._parent.std.format == MicrosoftPe.PeFormat.PE32) {
        this.sizeOfStackCommit32 = this._io.readU4le();
      }
      if (this._parent.std.format == MicrosoftPe.PeFormat.PE32_PLUS) {
        this.sizeOfStackCommit64 = this._io.readU8le();
      }
      if (this._parent.std.format == MicrosoftPe.PeFormat.PE32) {
        this.sizeOfHeapReserve32 = this._io.readU4le();
      }
      if (this._parent.std.format == MicrosoftPe.PeFormat.PE32_PLUS) {
        this.sizeOfHeapReserve64 = this._io.readU8le();
      }
      if (this._parent.std.format == MicrosoftPe.PeFormat.PE32) {
        this.sizeOfHeapCommit32 = this._io.readU4le();
      }
      if (this._parent.std.format == MicrosoftPe.PeFormat.PE32_PLUS) {
        this.sizeOfHeapCommit64 = this._io.readU8le();
      }
      this.loaderFlags = this._io.readU4le();
      this.numberOfRvaAndSizes = this._io.readU4le();
    }

    return OptionalHeaderWindows;
  })();

  var OptionalHeaderDataDirs = MicrosoftPe.OptionalHeaderDataDirs = (function() {
    function OptionalHeaderDataDirs(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OptionalHeaderDataDirs.prototype._read = function() {
      this.exportTable = new DataDir(this._io, this, this._root);
      this.importTable = new DataDir(this._io, this, this._root);
      this.resourceTable = new DataDir(this._io, this, this._root);
      this.exceptionTable = new DataDir(this._io, this, this._root);
      this.certificateTable = new DataDir(this._io, this, this._root);
      this.baseRelocationTable = new DataDir(this._io, this, this._root);
      this.debug = new DataDir(this._io, this, this._root);
      this.architecture = new DataDir(this._io, this, this._root);
      this.globalPtr = new DataDir(this._io, this, this._root);
      this.tlsTable = new DataDir(this._io, this, this._root);
      this.loadConfigTable = new DataDir(this._io, this, this._root);
      this.boundImport = new DataDir(this._io, this, this._root);
      this.iat = new DataDir(this._io, this, this._root);
      this.delayImportDescriptor = new DataDir(this._io, this, this._root);
      this.clrRuntimeHeader = new DataDir(this._io, this, this._root);
    }

    return OptionalHeaderDataDirs;
  })();

  var DataDir = MicrosoftPe.DataDir = (function() {
    function DataDir(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DataDir.prototype._read = function() {
      this.virtualAddress = this._io.readU4le();
      this.size = this._io.readU4le();
    }

    return DataDir;
  })();

  var CoffSymbol = MicrosoftPe.CoffSymbol = (function() {
    function CoffSymbol(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CoffSymbol.prototype._read = function() {
      this._raw_nameAnnoying = this._io.readBytes(8);
      var _io__raw_nameAnnoying = new KaitaiStream(this._raw_nameAnnoying);
      this.nameAnnoying = new Annoyingstring(_io__raw_nameAnnoying, this, this._root);
      this.value = this._io.readU4le();
      this.sectionNumber = this._io.readU2le();
      this.type = this._io.readU2le();
      this.storageClass = this._io.readU1();
      this.numberOfAuxSymbols = this._io.readU1();
    }
    Object.defineProperty(CoffSymbol.prototype, 'section', {
      get: function() {
        if (this._m_section !== undefined)
          return this._m_section;
        this._m_section = this._root.pe.sections[(this.sectionNumber - 1)];
        return this._m_section;
      }
    });
    Object.defineProperty(CoffSymbol.prototype, 'data', {
      get: function() {
        if (this._m_data !== undefined)
          return this._m_data;
        var _pos = this._io.pos;
        this._io.seek((this.section.pointerToRawData + this.value));
        this._m_data = this._io.readBytes(1);
        this._io.seek(_pos);
        return this._m_data;
      }
    });

    return CoffSymbol;
  })();

  var PeHeader = MicrosoftPe.PeHeader = (function() {
    function PeHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    PeHeader.prototype._read = function() {
      this.peSignature = this._io.ensureFixedContents([80, 69, 0, 0]);
      this.coffHdr = new CoffHeader(this._io, this, this._root);
      this._raw_optionalHdr = this._io.readBytes(this.coffHdr.sizeOfOptionalHeader);
      var _io__raw_optionalHdr = new KaitaiStream(this._raw_optionalHdr);
      this.optionalHdr = new OptionalHeader(_io__raw_optionalHdr, this, this._root);
      this.sections = new Array(this.coffHdr.numberOfSections);
      for (var i = 0; i < this.coffHdr.numberOfSections; i++) {
        this.sections[i] = new Section(this._io, this, this._root);
      }
    }
    Object.defineProperty(PeHeader.prototype, 'certificateTable', {
      get: function() {
        if (this._m_certificateTable !== undefined)
          return this._m_certificateTable;
        if (this.optionalHdr.dataDirs.certificateTable.virtualAddress != 0) {
          var _pos = this._io.pos;
          this._io.seek(this.optionalHdr.dataDirs.certificateTable.virtualAddress);
          this._raw__m_certificateTable = this._io.readBytes(this.optionalHdr.dataDirs.certificateTable.size);
          var _io__raw__m_certificateTable = new KaitaiStream(this._raw__m_certificateTable);
          this._m_certificateTable = new CertificateTable(_io__raw__m_certificateTable, this, this._root);
          this._io.seek(_pos);
        }
        return this._m_certificateTable;
      }
    });

    return PeHeader;
  })();

  var OptionalHeader = MicrosoftPe.OptionalHeader = (function() {
    function OptionalHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OptionalHeader.prototype._read = function() {
      this.std = new OptionalHeaderStd(this._io, this, this._root);
      this.windows = new OptionalHeaderWindows(this._io, this, this._root);
      this.dataDirs = new OptionalHeaderDataDirs(this._io, this, this._root);
    }

    return OptionalHeader;
  })();

  var Section = MicrosoftPe.Section = (function() {
    function Section(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Section.prototype._read = function() {
      this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesStripRight(this._io.readBytes(8), 0), "UTF-8");
      this.virtualSize = this._io.readU4le();
      this.virtualAddress = this._io.readU4le();
      this.sizeOfRawData = this._io.readU4le();
      this.pointerToRawData = this._io.readU4le();
      this.pointerToRelocations = this._io.readU4le();
      this.pointerToLinenumbers = this._io.readU4le();
      this.numberOfRelocations = this._io.readU2le();
      this.numberOfLinenumbers = this._io.readU2le();
      this.characteristics = this._io.readU4le();
    }
    Object.defineProperty(Section.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var _pos = this._io.pos;
        this._io.seek(this.pointerToRawData);
        this._m_body = this._io.readBytes(this.sizeOfRawData);
        this._io.seek(_pos);
        return this._m_body;
      }
    });

    return Section;
  })();

  var CertificateTable = MicrosoftPe.CertificateTable = (function() {
    function CertificateTable(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CertificateTable.prototype._read = function() {
      this.items = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.items.push(new CertificateEntry(this._io, this, this._root));
        i++;
      }
    }

    return CertificateTable;
  })();

  var MzPlaceholder = MicrosoftPe.MzPlaceholder = (function() {
    function MzPlaceholder(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MzPlaceholder.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([77, 90]);
      this.data1 = this._io.readBytes(58);
      this.ofsPe = this._io.readU4le();
    }

    /**
     * In PE file, an offset to PE header
     */

    return MzPlaceholder;
  })();

  var OptionalHeaderStd = MicrosoftPe.OptionalHeaderStd = (function() {
    function OptionalHeaderStd(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OptionalHeaderStd.prototype._read = function() {
      this.format = this._io.readU2le();
      this.majorLinkerVersion = this._io.readU1();
      this.minorLinkerVersion = this._io.readU1();
      this.sizeOfCode = this._io.readU4le();
      this.sizeOfInitializedData = this._io.readU4le();
      this.sizeOfUninitializedData = this._io.readU4le();
      this.addressOfEntryPoint = this._io.readU4le();
      this.baseOfCode = this._io.readU4le();
      if (this.format == MicrosoftPe.PeFormat.PE32) {
        this.baseOfData = this._io.readU4le();
      }
    }

    return OptionalHeaderStd;
  })();

  /**
   * @see 3.3. COFF File Header (Object and Image)
   */

  var CoffHeader = MicrosoftPe.CoffHeader = (function() {
    CoffHeader.MachineType = Object.freeze({
      UNKNOWN: 0,
      I386: 332,
      R4000: 358,
      WCEMIPSV2: 361,
      ALPHA: 388,
      SH3: 418,
      SH3DSP: 419,
      SH4: 422,
      SH5: 424,
      ARM: 448,
      THUMB: 450,
      ARMNT: 452,
      AM33: 467,
      POWERPC: 496,
      POWERPCFP: 497,
      IA64: 512,
      MIPS16: 614,
      MIPSFPU: 870,
      MIPSFPU16: 1126,
      EBC: 3772,
      RISCV32: 20530,
      RISCV64: 20580,
      RISCV128: 20776,
      AMD64: 34404,
      M32R: 36929,
      ARM64: 43620,

      0: "UNKNOWN",
      332: "I386",
      358: "R4000",
      361: "WCEMIPSV2",
      388: "ALPHA",
      418: "SH3",
      419: "SH3DSP",
      422: "SH4",
      424: "SH5",
      448: "ARM",
      450: "THUMB",
      452: "ARMNT",
      467: "AM33",
      496: "POWERPC",
      497: "POWERPCFP",
      512: "IA64",
      614: "MIPS16",
      870: "MIPSFPU",
      1126: "MIPSFPU16",
      3772: "EBC",
      20530: "RISCV32",
      20580: "RISCV64",
      20776: "RISCV128",
      34404: "AMD64",
      36929: "M32R",
      43620: "ARM64",
    });

    function CoffHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CoffHeader.prototype._read = function() {
      this.machine = this._io.readU2le();
      this.numberOfSections = this._io.readU2le();
      this.timeDateStamp = this._io.readU4le();
      this.pointerToSymbolTable = this._io.readU4le();
      this.numberOfSymbols = this._io.readU4le();
      this.sizeOfOptionalHeader = this._io.readU2le();
      this.characteristics = this._io.readU2le();
    }
    Object.defineProperty(CoffHeader.prototype, 'symbolTableSize', {
      get: function() {
        if (this._m_symbolTableSize !== undefined)
          return this._m_symbolTableSize;
        this._m_symbolTableSize = (this.numberOfSymbols * 18);
        return this._m_symbolTableSize;
      }
    });
    Object.defineProperty(CoffHeader.prototype, 'symbolNameTableOffset', {
      get: function() {
        if (this._m_symbolNameTableOffset !== undefined)
          return this._m_symbolNameTableOffset;
        this._m_symbolNameTableOffset = (this.pointerToSymbolTable + this.symbolTableSize);
        return this._m_symbolNameTableOffset;
      }
    });
    Object.defineProperty(CoffHeader.prototype, 'symbolNameTableSize', {
      get: function() {
        if (this._m_symbolNameTableSize !== undefined)
          return this._m_symbolNameTableSize;
        var _pos = this._io.pos;
        this._io.seek(this.symbolNameTableOffset);
        this._m_symbolNameTableSize = this._io.readU4le();
        this._io.seek(_pos);
        return this._m_symbolNameTableSize;
      }
    });
    Object.defineProperty(CoffHeader.prototype, 'symbolTable', {
      get: function() {
        if (this._m_symbolTable !== undefined)
          return this._m_symbolTable;
        var _pos = this._io.pos;
        this._io.seek(this.pointerToSymbolTable);
        this._m_symbolTable = new Array(this.numberOfSymbols);
        for (var i = 0; i < this.numberOfSymbols; i++) {
          this._m_symbolTable[i] = new CoffSymbol(this._io, this, this._root);
        }
        this._io.seek(_pos);
        return this._m_symbolTable;
      }
    });

    return CoffHeader;
  })();

  var Annoyingstring = MicrosoftPe.Annoyingstring = (function() {
    function Annoyingstring(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Annoyingstring.prototype._read = function() {
    }
    Object.defineProperty(Annoyingstring.prototype, 'nameFromOffset', {
      get: function() {
        if (this._m_nameFromOffset !== undefined)
          return this._m_nameFromOffset;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek((this.nameZeroes == 0 ? (this._parent._parent.symbolNameTableOffset + this.nameOffset) : 0));
        this._m_nameFromOffset = KaitaiStream.bytesToStr(io.readBytesTerm(0, false, true, false), "ascii");
        io.seek(_pos);
        return this._m_nameFromOffset;
      }
    });
    Object.defineProperty(Annoyingstring.prototype, 'nameOffset', {
      get: function() {
        if (this._m_nameOffset !== undefined)
          return this._m_nameOffset;
        var _pos = this._io.pos;
        this._io.seek(4);
        this._m_nameOffset = this._io.readU4le();
        this._io.seek(_pos);
        return this._m_nameOffset;
      }
    });
    Object.defineProperty(Annoyingstring.prototype, 'name', {
      get: function() {
        if (this._m_name !== undefined)
          return this._m_name;
        this._m_name = (this.nameZeroes == 0 ? this.nameFromOffset : this.nameFromShort);
        return this._m_name;
      }
    });
    Object.defineProperty(Annoyingstring.prototype, 'nameZeroes', {
      get: function() {
        if (this._m_nameZeroes !== undefined)
          return this._m_nameZeroes;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._m_nameZeroes = this._io.readU4le();
        this._io.seek(_pos);
        return this._m_nameZeroes;
      }
    });
    Object.defineProperty(Annoyingstring.prototype, 'nameFromShort', {
      get: function() {
        if (this._m_nameFromShort !== undefined)
          return this._m_nameFromShort;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._m_nameFromShort = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, false), "ascii");
        this._io.seek(_pos);
        return this._m_nameFromShort;
      }
    });

    return Annoyingstring;
  })();
  Object.defineProperty(MicrosoftPe.prototype, 'pe', {
    get: function() {
      if (this._m_pe !== undefined)
        return this._m_pe;
      var _pos = this._io.pos;
      this._io.seek(this.mz.ofsPe);
      this._m_pe = new PeHeader(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_pe;
    }
  });

  return MicrosoftPe;
})();
return MicrosoftPe;
}));
