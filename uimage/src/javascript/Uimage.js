// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Uimage || (root.Uimage = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Uimage_, KaitaiStream) {
/**
 * The legacy U-Boot image format (uImage), as created by `mkimage`: a 64-byte
 * header followed by the image data (e.g. a Linux kernel, a ramdisk or a
 * script). The header describes the data (OS, CPU architecture, image type,
 * compression, load and entry point addresses, name) and protects both the
 * header and the data with CRC-32 checksums.
 * 
 * U-Boot's newer FIT (Flattened Image Tree) format is not covered by this spec.
 * @see {@link https://github.com/u-boot/u-boot/blob/ece349ade2973e220f524ce59e59711cc919263f/include/image.h|Git tag "v2026.07"}
 */

var Uimage = (function() {
  Uimage.MagicTypes = Object.freeze({
    ALLNET_ALL_SG8316M: 5,
    ALLNET_ALL_SG8208M: 6,
    ALLNET_ALL_SG8324M: 22,
    DATTO_L8: 7353344,
    ALLNET_ALL_WAPC0450C: 9453568,
    ENGENIUS_EWS2910P_V3: 50398464,
    ENGENIUS_EWS1200_28TFP: 50402048,
    ENGENIUS_EWS7926EFP: 50402050,
    ENGENIUS_EWS7952P: 50406401,
    ENGENIUS_EWS2908P: 50409728,
    ENGENIUS_EWS7928P_V2: 51450112,
    ENGENIUS_EWS1200_28TFP_V2: 51450624,
    ENGENIUS_EWS2910P: 58730768,
    ENGENIUS_EWS5912FP: 58743058,
    ENGENIUS_EWS7928P: 58751272,
    ENGENIUS_EWS1200D_10T: 59187216,
    ENGENIUS_EWS1200_28T: 59187240,
    ENGENIUS_EWS7928FP: 59216527,
    ENGENIUS_EWS1200_52T: 60235858,
    ENGENIUS_EWS7952FP: 60265775,
    YOUKU_YK_L1: 304680960,
    REALTEK_SDK: 305418240,
    NETGEAR_GS750E: 391006017,
    NETGEAR_GS728TP_V2: 391006018,
    BOLT_BL100: 638656533,
    UIMAGE: 654645590,
    NETGEAR_WNCE4004: 654645607,
    NETGEAR_WNR612_V2_EARLY: 808857906,
    NETGEAR_WNR1000_V2_VC: 825241648,
    NETGEAR_WNR1000_V2: 825241649,
    NETGEAR_WNR1000_V2_VM: 825241650,
    NETGEAR_WNR1000_V4: 825241652,
    NETGEAR_WPN824N: 825307184,
    ZYXEL_UAG50: 827343191,
    NETGEAR_WNR2000: 842018865,
    NETGEAR_WNR2000_V3: 842018867,
    NETGEAR_WNR2000_V4: 842018868,
    NETGEAR_WNR612_V2: 842020401,
    NETGEAR_WNR2200: 842149936,
    NETGEAR_WNDR3700: 859254832,
    NETGEAR_WNDR3700_V2: 859254833,
    NETGEAR_WNDR3700_V4: 859254835,
    NETGEAR_R6100: 909127728,
    NETGEAR_WNR612: 909193778,
    MITRASTAR_COMB: 1129270594,
    MITRASTAR_COMC: 1129270595,
    NETGEAR_GS308T: 1313293109,
    NETGEAR_NGE: 1313293600,
    NETGEAR_NGF: 1313293856,
    NETGEAR_NGG: 1313294112,
    NETGEAR_NGH: 1313294368,
    NETGEAR_NGI: 1313294624,
    NETGEAR_NGP: 1313296416,
    OPENWRT_OKLI: 1330334793,
    OPENWRT_DLINK_COVR: 1752396147,
    OPENWRT_SENAO_OKLI: 1936805707,
    ENGENIUS_ECS1112FP: 2155872258,
    ENGENIUS_EWS1200_28TFP_OLD_FW: 2197885696,
    ENGENIUS_EWS7926EFP_OLD_FW: 2197885698,
    ENGENIUS_EWS7952P_OLD_FW: 2197890049,
    REALTEK_RTL838X: 2206203904,
    IODATA_BSH_G08M: 2206203905,
    IODATA_BSH_GP08: 2206203906,
    IODATA_BSH_G16M: 2206203907,
    IODATA_BSH_G24M: 2206203908,
    IODATA_BSH_G08MB: 2206203920,
    IODATA_BSH_GP08MB: 2206203921,
    IODATA_BSH_G16MB: 2206203922,
    IODATA_BSH_G24MB: 2206203923,
    TRENDNET_TPE_3012LS: 2206210573,
    TRENDNET_TPE_3018LS: 2206210574,
    ENGENIUS_EGS2108P_OLD_FW: 2206212360,
    ENGENIUS_EGS2110P_OLD_FW: 2206212368,
    ENGENIUS_EWS2910P_OLD_FW: 2206214416,
    ENGENIUS_EGS5110P_OLD_FW: 2206224656,
    ENGENIUS_EGS5212FP_OLD_FW: 2206224914,
    ENGENIUS_EWS5912FP_OLD_FW: 2206226706,
    ENGENIUS_EWS7928P_OLD_FW: 2206234920,
    ENGENIUS_EWS1200D_10T_OLD_FW: 2206670864,
    ENGENIUS_EWS1200_28T_OLD_FW: 2206670888,
    ENGENIUS_EGS7228FP_OLD_FW: 2206671503,
    ENGENIUS_EWS7928FP_OLD_FW: 2206700175,
    REALTEK_RTL839X: 2207252480,
    REALTEK_RTL8396: 2207645696,
    ENGENIUS_EWS1200_52T_OLD_FW: 2207719506,
    ENGENIUS_EGS7252FP_OLD_FW: 2207720751,
    ENGENIUS_EWS7952FP_OLD_FW: 2207749423,
    REALTEK_RTL930X: 2466250752,
    ZYXEL_XGS1010_12: 2466254864,
    ZYXEL_XGS1210_12: 2466255376,
    ZYXEL_XGS1250_12: 2466255440,
    NICGIGA_S100_0800S_M: 2466447360,
    PLASMACLOUD_PSX28: 2467299328,

    5: "ALLNET_ALL_SG8316M",
    6: "ALLNET_ALL_SG8208M",
    22: "ALLNET_ALL_SG8324M",
    7353344: "DATTO_L8",
    9453568: "ALLNET_ALL_WAPC0450C",
    50398464: "ENGENIUS_EWS2910P_V3",
    50402048: "ENGENIUS_EWS1200_28TFP",
    50402050: "ENGENIUS_EWS7926EFP",
    50406401: "ENGENIUS_EWS7952P",
    50409728: "ENGENIUS_EWS2908P",
    51450112: "ENGENIUS_EWS7928P_V2",
    51450624: "ENGENIUS_EWS1200_28TFP_V2",
    58730768: "ENGENIUS_EWS2910P",
    58743058: "ENGENIUS_EWS5912FP",
    58751272: "ENGENIUS_EWS7928P",
    59187216: "ENGENIUS_EWS1200D_10T",
    59187240: "ENGENIUS_EWS1200_28T",
    59216527: "ENGENIUS_EWS7928FP",
    60235858: "ENGENIUS_EWS1200_52T",
    60265775: "ENGENIUS_EWS7952FP",
    304680960: "YOUKU_YK_L1",
    305418240: "REALTEK_SDK",
    391006017: "NETGEAR_GS750E",
    391006018: "NETGEAR_GS728TP_V2",
    638656533: "BOLT_BL100",
    654645590: "UIMAGE",
    654645607: "NETGEAR_WNCE4004",
    808857906: "NETGEAR_WNR612_V2_EARLY",
    825241648: "NETGEAR_WNR1000_V2_VC",
    825241649: "NETGEAR_WNR1000_V2",
    825241650: "NETGEAR_WNR1000_V2_VM",
    825241652: "NETGEAR_WNR1000_V4",
    825307184: "NETGEAR_WPN824N",
    827343191: "ZYXEL_UAG50",
    842018865: "NETGEAR_WNR2000",
    842018867: "NETGEAR_WNR2000_V3",
    842018868: "NETGEAR_WNR2000_V4",
    842020401: "NETGEAR_WNR612_V2",
    842149936: "NETGEAR_WNR2200",
    859254832: "NETGEAR_WNDR3700",
    859254833: "NETGEAR_WNDR3700_V2",
    859254835: "NETGEAR_WNDR3700_V4",
    909127728: "NETGEAR_R6100",
    909193778: "NETGEAR_WNR612",
    1129270594: "MITRASTAR_COMB",
    1129270595: "MITRASTAR_COMC",
    1313293109: "NETGEAR_GS308T",
    1313293600: "NETGEAR_NGE",
    1313293856: "NETGEAR_NGF",
    1313294112: "NETGEAR_NGG",
    1313294368: "NETGEAR_NGH",
    1313294624: "NETGEAR_NGI",
    1313296416: "NETGEAR_NGP",
    1330334793: "OPENWRT_OKLI",
    1752396147: "OPENWRT_DLINK_COVR",
    1936805707: "OPENWRT_SENAO_OKLI",
    2155872258: "ENGENIUS_ECS1112FP",
    2197885696: "ENGENIUS_EWS1200_28TFP_OLD_FW",
    2197885698: "ENGENIUS_EWS7926EFP_OLD_FW",
    2197890049: "ENGENIUS_EWS7952P_OLD_FW",
    2206203904: "REALTEK_RTL838X",
    2206203905: "IODATA_BSH_G08M",
    2206203906: "IODATA_BSH_GP08",
    2206203907: "IODATA_BSH_G16M",
    2206203908: "IODATA_BSH_G24M",
    2206203920: "IODATA_BSH_G08MB",
    2206203921: "IODATA_BSH_GP08MB",
    2206203922: "IODATA_BSH_G16MB",
    2206203923: "IODATA_BSH_G24MB",
    2206210573: "TRENDNET_TPE_3012LS",
    2206210574: "TRENDNET_TPE_3018LS",
    2206212360: "ENGENIUS_EGS2108P_OLD_FW",
    2206212368: "ENGENIUS_EGS2110P_OLD_FW",
    2206214416: "ENGENIUS_EWS2910P_OLD_FW",
    2206224656: "ENGENIUS_EGS5110P_OLD_FW",
    2206224914: "ENGENIUS_EGS5212FP_OLD_FW",
    2206226706: "ENGENIUS_EWS5912FP_OLD_FW",
    2206234920: "ENGENIUS_EWS7928P_OLD_FW",
    2206670864: "ENGENIUS_EWS1200D_10T_OLD_FW",
    2206670888: "ENGENIUS_EWS1200_28T_OLD_FW",
    2206671503: "ENGENIUS_EGS7228FP_OLD_FW",
    2206700175: "ENGENIUS_EWS7928FP_OLD_FW",
    2207252480: "REALTEK_RTL839X",
    2207645696: "REALTEK_RTL8396",
    2207719506: "ENGENIUS_EWS1200_52T_OLD_FW",
    2207720751: "ENGENIUS_EGS7252FP_OLD_FW",
    2207749423: "ENGENIUS_EWS7952FP_OLD_FW",
    2466250752: "REALTEK_RTL930X",
    2466254864: "ZYXEL_XGS1010_12",
    2466255376: "ZYXEL_XGS1210_12",
    2466255440: "ZYXEL_XGS1250_12",
    2466447360: "NICGIGA_S100_0800S_M",
    2467299328: "PLASMACLOUD_PSX28",
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
    MZ: 9,
    XIP: 10,

    0: "NONE",
    1: "GZIP",
    2: "BZIP2",
    3: "LZMA",
    4: "LZO",
    5: "LZ4",
    6: "ZSTD",
    9: "MZ",
    10: "XIP",
  });

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
    ELF: 29,

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
    29: "ELF",
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
    SUNXI_TOC0: 41,
    FDT_LEGACY: 42,
    RENESAS_SPKG: 43,
    STARFIVE_SPL: 44,
    TFA_BL31: 45,
    STM32IMAGE_V2: 46,
    AMLIMAGE: 47,

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
    41: "SUNXI_TOC0",
    42: "FDT_LEGACY",
    43: "RENESAS_SPKG",
    44: "STARFIVE_SPL",
    45: "TFA_BL31",
    46: "STM32IMAGE_V2",
    47: "AMLIMAGE",
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

  /**
   * ASUS firmware images [overlay the 32-byte image
   * name](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L185-L188)
   * with a [`TAIL`
   * structure](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L151-L171)
   * that contains version information and the product ID (model name).
   * 
   * The first 16 bytes have the same structure in all three known variants of
   * the `TAIL` structure. The meaning of the last 16 bytes differs across the
   * variants - therefore, for simplicity, this Kaitai Struct implementation
   * treats them as an opaque byte array named `extra_info`. For an overview of
   * the variants, see the documentation for `extra_info`.
   */

  var AsusFirmwareInformation = Uimage.AsusFirmwareInformation = (function() {
    function AsusFirmwareInformation(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    AsusFirmwareInformation.prototype._read = function() {
      this.kernelVersion = new Version(this._io, this, this._root);
      this.fsVersion = new Version(this._io, this, this._root);
      this.productId = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(12), 0, false), "UTF-8");
      this.extraInfo = this._io.readBytes(16);
    }

    /**
     * In the Ralink SDK variant (see `extra_info`), the product ID field is
     * actually 23 bytes long, but no known product ID is longer than 12
     * bytes.
     */

    /**
     * The structure of these bytes varies among the three known variants of
     * the `TAIL` structure, and the header doesn't say which one is used:
     * 
     * * Plain: 8 hardware versions (using the `version` type) - see
     *   <https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L170>
     * 
     *   Sample file: `RT-AC51U_3.0.0.4_380_8591-ga8dd632.trx` from
     *   <https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC51U/FW_RT_AC51U_30043808591.zip>,
     *   released on 2020-09-22 and listed on
     *   <https://www.asus.com/supportonly/rt-ac51u/helpdesk_bios/>.
     * 
     *   Source code links:
     * 
     *   - [ASUS GPL source, RT-AC55UHP
     *     3.0.0.4.382.51915](https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/GPL_RT_AC55UHP_300438251915.zip)
     *     (`asuswrt/release/src/asustools/mkimage.src/` in
     *     `GPL_RT-AC55UHP_3.0.0.4.382.51915-g4086e57.tgz`)
     *   - [ASUS GPL source, RT-AC55U 3.0.0.4.382.50702 (unofficial
     *     mirror)](https://github.com/drag0njoe/RT-AC55U/tree/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src)
     * 
     * * `TRX_NEW` (a macro defined when building `mkimage`): the
     *   build number and extended build number (`u2le` each), two key bytes
     *   and 5 hardware versions - see
     *   <https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src/include/image.h#L174-L180>
     * 
     *   `mkimage` [overwrites the first 3 hardware
     *   versions](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src/mkimage.c#L546-L569)
     *   with values derived from the key bytes.
     * 
     *   Sample file: `RT-AC55UHP_3.0.0.4_382_52236-ga0f880d.trx` (build 382,
     *   extended build 52236) from
     *   <https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/FW_RT_AC55UHP_300438252236.zip>,
     *   released on 2020-06-04 and listed on
     *   <https://www.asus.com/supportonly/rt-ac55uhp/helpdesk_bios/>.
     * 
     *   Source code links:
     * 
     *   - [ASUS GPL source, RT-AC55UHP
     *     3.0.0.4.382.51915](https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/GPL_RT_AC55UHP_300438251915.zip)
     *     (`asuswrt/release/src-qca/asustools/mkimage.src/` in
     *     `GPL_RT-AC55UHP_3.0.0.4.382.51915-g4086e57.tgz`)
     *   - [ASUS GPL source, RT-AC55U 3.0.0.4.382.50702 (unofficial
     *     mirror)](https://github.com/drag0njoe/RT-AC55U/tree/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src)
     * 
     * * Ralink SDK: the rest of a 23-byte product ID (see `product_id`),
     *   a version suffix letter and the kernel part size (called `ih_ksz`) -
     *   see <https://github.com/andy-padavan/rt-n56u/blob/32a93db4026cc2cff585d7008373432d888fc1aa/trunk/tools/mkimage/include/image.h#L164-L165>
     * 
     *   Sample file: `RP-N12_1.0.1.1f.trx` from
     *   <https://dlcdnets.asus.com/pub/ASUS/wireless/RP-N12/FW_RP-N12_1.0.1.1f.zip>,
     *   released on 2019-11-12 and listed on
     *   <https://www.asus.com/supportonly/rp-n12/helpdesk_bios/>.
     * 
     *   Source code links:
     * 
     *   - [ASUS GPL source, RP-N12
     *     1.0.1.1f](https://dlcdnets.asus.com/pub/ASUS/wireless/RP-N12/GPL_RP_N12_1011f.zip)
     *     (`GPL_RP-N12_source.1011f/user/mkimage/include/image.h` in
     *     `GPL_RP-N12_source.1011f.tar.bz2`)
     *   - [rt-n56u custom firmware by Andy
     *     Padavan](https://github.com/andy-padavan/rt-n56u/blob/32a93db4026cc2cff585d7008373432d888fc1aa/trunk/tools/mkimage/include/image.h)
     * 
     * In the plain and `TRX_NEW` variants, the last 4 bytes may instead
     * contain the offset of the root file system, which is [written by
     * `mkimage -r`](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/mkimage.c#L527-L542)
     * as the magic byte 0xA9
     * ([`ROOTFS_OFFSET_MAGIC`](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L154-L159))
     * followed by the offset as a 24-bit big-endian integer.
     */

    return AsusFirmwareInformation;
  })();

  var NameOrAsusInfo = Uimage.NameOrAsusInfo = (function() {
    function NameOrAsusInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    NameOrAsusInfo.prototype._read = function() {
      if (!(this.hasAsusInfo)) {
        this.name = KaitaiStream.bytesToStr(this._io.readBytesTerm(0, false, true, false), "UTF-8");
      }
      if (this.hasAsusInfo) {
        this.asusInfo = new AsusFirmwareInformation(this._io, this, this._root);
      }
    }
    Object.defineProperty(NameOrAsusInfo.prototype, 'byte0', {
      get: function() {
        if (this._m_byte0 !== undefined)
          return this._m_byte0;
        var _pos = this._io.pos;
        this._io.seek(0);
        this._m_byte0 = this._io.readU1();
        this._io.seek(_pos);
        return this._m_byte0;
      }
    });
    Object.defineProperty(NameOrAsusInfo.prototype, 'byte4', {
      get: function() {
        if (this._m_byte4 !== undefined)
          return this._m_byte4;
        var _pos = this._io.pos;
        this._io.seek(4);
        this._m_byte4 = this._io.readU1();
        this._io.seek(_pos);
        return this._m_byte4;
      }
    });

    /**
     * Whether this type stores ASUS firmware information (`asus_info`)
     * rather than an image name (`name`).
     * 
     * The header doesn't say which one it is, so we infer it using a
     * heuristic based on the layout of the `asus_firmware_information` type.
     * If ASUS firmware info is present, the first byte (the major kernel
     * version number) is a small integer (i.e. not a printable character),
     * and byte 4 (first byte of the product ID/model name) is a printable
     * character. An empty name is not mistaken for ASUS information, because
     * its byte 4 is a null byte.
     * 
     * The highest known major kernel version number is 9 (e.g. in
     * `DSL-N55U_9.0.0.4_380_3925-gad8f412_Annex_A.trx` from
     * <https://dlcdnets.asus.com/pub/ASUS/wireless/DSL-N55U/FW_DSL_N55U_90043803925.zip>,
     * released on 2016-08-04 and listed on
     * <https://www.asus.com/supportonly/dsl-n55u/helpdesk_bios/>). ASUS
     * seems to use such high major versions (9, sometimes 7) for beta
     * releases, whereas regular releases use 3 (or 1 in older firmware).
     * 
     * It can also be 0, in particular due to a bug in the MediaTek MT798X
     * build of ASUS's `mkimage` (it reads the `-V` values from fixed `argv`
     * positions, even though it parses the options using `getopt()` - see
     * <https://github.com/blocktrron/tuf-ax4200-gpl/blob/a4fe37f4d78473f97c6d47cf93d97c3811af90cc/release/src-mtk-MT798X/Uboot-upstream/tools/mkimage.c#L317-L333>).
     * For example, this is the case in
     * `RT-AX52_3.0.0.4_388_34015-g9488655.trx` from
     * <https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AX52/FW_RT-AX52_300438834015.zip>,
     * released on 2026-03-20 and listed on
     * <https://www.asus.com/supportonly/rt-ax52/helpdesk_bios?model2Name=RT-AX52>.
     */
    Object.defineProperty(NameOrAsusInfo.prototype, 'hasAsusInfo', {
      get: function() {
        if (this._m_hasAsusInfo !== undefined)
          return this._m_hasAsusInfo;
        this._m_hasAsusInfo =  ((this.byte0 < 32) && (this.byte4 >= 32) && (this.byte4 < 127)) ;
        return this._m_hasAsusInfo;
      }
    });

    return NameOrAsusInfo;
  })();

  var Uheader = Uimage.Uheader = (function() {
    function Uheader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Uheader.prototype._read = function() {
      this.magic = this._io.readU4be();
      if (!Object.prototype.hasOwnProperty.call(Uimage.MagicTypes, this.magic)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.magic, this._io, "/types/uheader/seq/0");
      }
      this.headerCrc = this._io.readU4be();
      this.timestamp = this._io.readU4be();
      this.lenImage = this._io.readU4be();
      this.loadAddress = this._io.readU4be();
      this.entryAddress = this._io.readU4be();
      this.dataCrc = this._io.readU4be();
      this.osType = this._io.readU1();
      if (!Object.prototype.hasOwnProperty.call(Uimage.UimageOs, this.osType)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.osType, this._io, "/types/uheader/seq/7");
      }
      this.architecture = this._io.readU1();
      if (!Object.prototype.hasOwnProperty.call(Uimage.UimageArch, this.architecture)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.architecture, this._io, "/types/uheader/seq/8");
      }
      this.imageType = this._io.readU1();
      if (!Object.prototype.hasOwnProperty.call(Uimage.UimageType, this.imageType)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.imageType, this._io, "/types/uheader/seq/9");
      }
      this.compressionType = this._io.readU1();
      if (!Object.prototype.hasOwnProperty.call(Uimage.UimageComp, this.compressionType)) {
        throw new KaitaiStream.ValidationNotInEnumError(this.compressionType, this._io, "/types/uheader/seq/10");
      }
      this._raw_nameOrAsusInfo = this._io.readBytes(32);
      var _io__raw_nameOrAsusInfo = new KaitaiStream(this._raw_nameOrAsusInfo);
      this.nameOrAsusInfo = new NameOrAsusInfo(_io__raw_nameOrAsusInfo, this, this._root);
    }

    /**
     * Besides the standard U-Boot magic, some vendors' bootloaders expect
     * their own value (often a different one for each device model), with
     * the rest of the header unchanged. `magic_types` lists the values
     * known so far; images with any other magic are rejected.
     */

    return Uheader;
  })();

  var Version = Uimage.Version = (function() {
    function Version(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Version.prototype._read = function() {
      this.major = this._io.readU1();
      this.minor = this._io.readU1();
    }

    return Version;
  })();

  return Uimage;
})();
Uimage_.Uimage = Uimage;
});
