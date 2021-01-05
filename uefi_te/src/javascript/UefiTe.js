// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.UefiTe = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * This type of executables could be found inside the UEFI firmware. The UEFI
 * firmware is stored in SPI flash memory, which is a chip soldered on a
 * system’s motherboard. UEFI firmware is very modular: it usually contains
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
 * @see {@link https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf|Source}
 */

var UefiTe = (function() {
  function UefiTe(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  UefiTe.prototype._read = function() {
    this._raw_teHdr = this._io.readBytes(40);
    var _io__raw_teHdr = new KaitaiStream(this._raw_teHdr);
    this.teHdr = new TeHeader(_io__raw_teHdr, this, this._root);
    this.sections = new Array(this.teHdr.numSections);
    for (var i = 0; i < this.teHdr.numSections; i++) {
      this.sections[i] = new Section(this._io, this, this._root);
    }
  }

  var TeHeader = UefiTe.TeHeader = (function() {
    TeHeader.MachineType = Object.freeze({
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

    TeHeader.SubsystemEnum = Object.freeze({
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

    function TeHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TeHeader.prototype._read = function() {
      this.magic = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [86, 90]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([86, 90], this.magic, this._io, "/types/te_header/seq/0");
      }
      this.machine = this._io.readU2le();
      this.numSections = this._io.readU1();
      this.subsystem = this._io.readU1();
      this.strippedSize = this._io.readU2le();
      this.entryPointAddr = this._io.readU4le();
      this.baseOfCode = this._io.readU4le();
      this.imageBase = this._io.readU8le();
      this.dataDirs = new HeaderDataDirs(this._io, this, this._root);
    }

    return TeHeader;
  })();

  var HeaderDataDirs = UefiTe.HeaderDataDirs = (function() {
    function HeaderDataDirs(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    HeaderDataDirs.prototype._read = function() {
      this.baseRelocationTable = new DataDir(this._io, this, this._root);
      this.debug = new DataDir(this._io, this, this._root);
    }

    return HeaderDataDirs;
  })();

  var DataDir = UefiTe.DataDir = (function() {
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

  var Section = UefiTe.Section = (function() {
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
      this.numRelocations = this._io.readU2le();
      this.numLinenumbers = this._io.readU2le();
      this.characteristics = this._io.readU4le();
    }
    Object.defineProperty(Section.prototype, 'body', {
      get: function() {
        if (this._m_body !== undefined)
          return this._m_body;
        var _pos = this._io.pos;
        this._io.seek(((this.pointerToRawData - this._root.teHdr.strippedSize) + this._root.teHdr._io.size));
        this._m_body = this._io.readBytes(this.sizeOfRawData);
        this._io.seek(_pos);
        return this._m_body;
      }
    });

    return Section;
  })();

  return UefiTe;
})();
return UefiTe;
}));
