// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Uimage = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * The new uImage format allows more flexibility in handling images of various
 * types (kernel, ramdisk, etc.), it also enhances integrity protection of images
 * with sha1 and md5 checksums.
 * @see {@link https://github.com/EmcraftSystems/u-boot/blob/master/include/image.h|Source}
 */

var Uimage = (function() {
  Uimage.UimageOs = Object.freeze({
    INVALID: 0,
    OPENBSD: 1,
    NETBSD: 2,
    FREEBSD: 3,
    BSD4_4: 4,
    LINUX: 5,
    SVR4: 6,
    ESIX: 7,
    SOLARIS: 8,
    IRIX: 9,
    SCO: 10,
    DELL: 11,
    NCR: 12,
    LYNXOS: 13,
    VXWORKS: 14,
    PSOS: 15,
    QNX: 16,
    U_BOOT: 17,
    RTEMS: 18,
    ARTOS: 19,
    UNITY: 20,
    INTEGRITY: 21,

    0: "INVALID",
    1: "OPENBSD",
    2: "NETBSD",
    3: "FREEBSD",
    4: "BSD4_4",
    5: "LINUX",
    6: "SVR4",
    7: "ESIX",
    8: "SOLARIS",
    9: "IRIX",
    10: "SCO",
    11: "DELL",
    12: "NCR",
    13: "LYNXOS",
    14: "VXWORKS",
    15: "PSOS",
    16: "QNX",
    17: "U_BOOT",
    18: "RTEMS",
    19: "ARTOS",
    20: "UNITY",
    21: "INTEGRITY",
  });

  Uimage.UimageArch = Object.freeze({
    INVALID: 0,
    ALPHA: 1,
    ARM: 2,
    I386: 3,
    IA64: 4,
    MIPS: 5,
    MIPS64: 6,
    PPC: 7,
    S390: 8,
    SH: 9,
    SPARC: 10,
    SPARC64: 11,
    M68K: 12,
    NIOS: 13,
    MICROBLAZE: 14,
    NIOS2: 15,
    BLACKFIN: 16,
    AVR32: 17,
    ST200: 18,

    0: "INVALID",
    1: "ALPHA",
    2: "ARM",
    3: "I386",
    4: "IA64",
    5: "MIPS",
    6: "MIPS64",
    7: "PPC",
    8: "S390",
    9: "SH",
    10: "SPARC",
    11: "SPARC64",
    12: "M68K",
    13: "NIOS",
    14: "MICROBLAZE",
    15: "NIOS2",
    16: "BLACKFIN",
    17: "AVR32",
    18: "ST200",
  });

  Uimage.UimageComp = Object.freeze({
    NONE: 0,
    GZIP: 1,
    BZIP2: 2,
    LZMA: 3,
    LZO: 4,

    0: "NONE",
    1: "GZIP",
    2: "BZIP2",
    3: "LZMA",
    4: "LZO",
  });

  Uimage.UimageType = Object.freeze({
    INVALID: 0,
    STANDALONE: 1,
    KERNEL: 2,
    RAMDISK: 3,
    MULTI: 4,
    FIRMWARE: 5,
    SCRIPT: 6,
    FILESYSTEM: 7,
    FLATDT: 8,
    KWBIMAGE: 9,
    IMXIMAGE: 10,

    0: "INVALID",
    1: "STANDALONE",
    2: "KERNEL",
    3: "RAMDISK",
    4: "MULTI",
    5: "FIRMWARE",
    6: "SCRIPT",
    7: "FILESYSTEM",
    8: "FLATDT",
    9: "KWBIMAGE",
    10: "IMXIMAGE",
  });

  function Uimage(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Uimage.prototype._read = function() {
    this.header = new Uheader(this._io, this, this._root);
    this.data = this._io.readBytes(this.header.lenImage);
  }

  var Uheader = Uimage.Uheader = (function() {
    function Uheader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Uheader.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [39, 5, 25, 86]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([39, 5, 25, 86], this.magic, this._io, "/types/uheader/seq/0");
      }
      this.headerCrc = this._io.readU4be();
      this.timestamp = this._io.readU4be();
      this.lenImage = this._io.readU4be();
      this.loadAddress = this._io.readU4be();
      this.entryAddress = this._io.readU4be();
      this.dataCrc = this._io.readU4be();
      this.osType = this._io.readU1();
      this.architecture = this._io.readU1();
      this.imageType = this._io.readU1();
      this.compressionType = this._io.readU1();
      this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(32), 0, false), "UTF-8");
    }

    return Uheader;
  })();

  return Uimage;
})();
return Uimage;
}));
