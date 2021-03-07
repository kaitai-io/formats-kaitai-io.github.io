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
 * @see {@link https://source.denx.de/u-boot/u-boot/-/raw/e4dba4b/include/image.h|Source}
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
    OSE: 22,
    PLAN9: 23,
    OPENRTOS: 24,
    ARM_TRUSTED_FIRMWARE: 25,
    TEE: 26,
    OPENSBI: 27,
    EFI: 28,

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
    22: "OSE",
    23: "PLAN9",
    24: "OPENRTOS",
    25: "ARM_TRUSTED_FIRMWARE",
    26: "TEE",
    27: "OPENSBI",
    28: "EFI",
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
    SANDBOX: 19,
    NDS32: 20,
    OPENRISC: 21,
    ARM64: 22,
    ARC: 23,
    X86_64: 24,
    XTENSA: 25,
    RISCV: 26,

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
    19: "SANDBOX",
    20: "NDS32",
    21: "OPENRISC",
    22: "ARM64",
    23: "ARC",
    24: "X86_64",
    25: "XTENSA",
    26: "RISCV",
  });

  Uimage.UimageComp = Object.freeze({
    NONE: 0,
    GZIP: 1,
    BZIP2: 2,
    LZMA: 3,
    LZO: 4,
    LZ4: 5,
    ZSTD: 6,

    0: "NONE",
    1: "GZIP",
    2: "BZIP2",
    3: "LZMA",
    4: "LZO",
    5: "LZ4",
    6: "ZSTD",
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
    UBLIMAGE: 11,
    OMAPIMAGE: 12,
    AISIMAGE: 13,
    KERNEL_NOLOAD: 14,
    PBLIMAGE: 15,
    MXSIMAGE: 16,
    GPIMAGE: 17,
    ATMELIMAGE: 18,
    SOCFPGAIMAGE: 19,
    X86_SETUP: 20,
    LPC32XXIMAGE: 21,
    LOADABLE: 22,
    RKIMAGE: 23,
    RKSD: 24,
    RKSPI: 25,
    ZYNQIMAGE: 26,
    ZYNQMPIMAGE: 27,
    ZYNQMPBIF: 28,
    FPGA: 29,
    VYBRIDIMAGE: 30,
    TEE: 31,
    FIRMWARE_IVT: 32,
    PMMC: 33,
    STM32IMAGE: 34,
    SOCFPGAIMAGE_V1: 35,
    MTKIMAGE: 36,
    IMX8MIMAGE: 37,
    IMX8IMAGE: 38,
    COPRO: 39,
    SUNXI_EGON: 40,

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
    11: "UBLIMAGE",
    12: "OMAPIMAGE",
    13: "AISIMAGE",
    14: "KERNEL_NOLOAD",
    15: "PBLIMAGE",
    16: "MXSIMAGE",
    17: "GPIMAGE",
    18: "ATMELIMAGE",
    19: "SOCFPGAIMAGE",
    20: "X86_SETUP",
    21: "LPC32XXIMAGE",
    22: "LOADABLE",
    23: "RKIMAGE",
    24: "RKSD",
    25: "RKSPI",
    26: "ZYNQIMAGE",
    27: "ZYNQMPIMAGE",
    28: "ZYNQMPBIF",
    29: "FPGA",
    30: "VYBRIDIMAGE",
    31: "TEE",
    32: "FIRMWARE_IVT",
    33: "PMMC",
    34: "STM32IMAGE",
    35: "SOCFPGAIMAGE_V1",
    36: "MTKIMAGE",
    37: "IMX8MIMAGE",
    38: "IMX8IMAGE",
    39: "COPRO",
    40: "SUNXI_EGON",
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
