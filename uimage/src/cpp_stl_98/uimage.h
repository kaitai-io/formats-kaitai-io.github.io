#ifndef UIMAGE_H_
#define UIMAGE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class uimage_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <set>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * The legacy U-Boot image format (uImage), as created by `mkimage`: a 64-byte
 * header followed by the image data (e.g. a Linux kernel, a ramdisk or a
 * script). The header describes the data (OS, CPU architecture, image type,
 * compression, load and entry point addresses, name) and protects both the
 * header and the data with CRC-32 checksums.
 * 
 * U-Boot's newer FIT (Flattened Image Tree) format is not covered by this spec.
 * \sa https://github.com/u-boot/u-boot/blob/ece349ade2973e220f524ce59e59711cc919263f/include/image.h Git tag "v2026.07"
 */

class uimage_t : public kaitai::kstruct {

public:
    class asus_firmware_information_t;
    class name_or_asus_info_t;
    class uheader_t;
    class version_t;

    enum magic_types_t {
        MAGIC_TYPES_ALLNET_ALL_SG8316M = 5,
        MAGIC_TYPES_ALLNET_ALL_SG8208M = 6,
        MAGIC_TYPES_ALLNET_ALL_SG8324M = 22,
        MAGIC_TYPES_DATTO_L8 = 7353344,
        MAGIC_TYPES_ALLNET_ALL_WAPC0450C = 9453568,
        MAGIC_TYPES_ENGENIUS_EWS2910P_V3 = 50398464,
        MAGIC_TYPES_ENGENIUS_EWS1200_28TFP = 50402048,
        MAGIC_TYPES_ENGENIUS_EWS7926EFP = 50402050,
        MAGIC_TYPES_ENGENIUS_EWS7952P = 50406401,
        MAGIC_TYPES_ENGENIUS_EWS2908P = 50409728,
        MAGIC_TYPES_ENGENIUS_EWS7928P_V2 = 51450112,
        MAGIC_TYPES_ENGENIUS_EWS1200_28TFP_V2 = 51450624,
        MAGIC_TYPES_ENGENIUS_EWS2910P = 58730768,
        MAGIC_TYPES_ENGENIUS_EWS5912FP = 58743058,
        MAGIC_TYPES_ENGENIUS_EWS7928P = 58751272,
        MAGIC_TYPES_ENGENIUS_EWS1200D_10T = 59187216,
        MAGIC_TYPES_ENGENIUS_EWS1200_28T = 59187240,
        MAGIC_TYPES_ENGENIUS_EWS7928FP = 59216527,
        MAGIC_TYPES_ENGENIUS_EWS1200_52T = 60235858,
        MAGIC_TYPES_ENGENIUS_EWS7952FP = 60265775,
        MAGIC_TYPES_YOUKU_YK_L1 = 304680960,
        MAGIC_TYPES_REALTEK_SDK = 305418240,
        MAGIC_TYPES_NETGEAR_GS750E = 391006017,
        MAGIC_TYPES_NETGEAR_GS728TP_V2 = 391006018,
        MAGIC_TYPES_BOLT_BL100 = 638656533,
        MAGIC_TYPES_UIMAGE = 654645590,
        MAGIC_TYPES_NETGEAR_WNCE4004 = 654645607,
        MAGIC_TYPES_NETGEAR_WNR612_V2_EARLY = 808857906,
        MAGIC_TYPES_NETGEAR_WNR1000_V2_VC = 825241648,
        MAGIC_TYPES_NETGEAR_WNR1000_V2 = 825241649,
        MAGIC_TYPES_NETGEAR_WNR1000_V2_VM = 825241650,
        MAGIC_TYPES_NETGEAR_WNR1000_V4 = 825241652,
        MAGIC_TYPES_NETGEAR_WPN824N = 825307184,
        MAGIC_TYPES_ZYXEL_UAG50 = 827343191,
        MAGIC_TYPES_NETGEAR_WNR2000 = 842018865,
        MAGIC_TYPES_NETGEAR_WNR2000_V3 = 842018867,
        MAGIC_TYPES_NETGEAR_WNR2000_V4 = 842018868,
        MAGIC_TYPES_NETGEAR_WNR612_V2 = 842020401,
        MAGIC_TYPES_NETGEAR_WNR2200 = 842149936,
        MAGIC_TYPES_NETGEAR_WNDR3700 = 859254832,
        MAGIC_TYPES_NETGEAR_WNDR3700_V2 = 859254833,
        MAGIC_TYPES_NETGEAR_WNDR3700_V4 = 859254835,
        MAGIC_TYPES_NETGEAR_R6100 = 909127728,
        MAGIC_TYPES_NETGEAR_WNR612 = 909193778,
        MAGIC_TYPES_MITRASTAR_COMB = 1129270594,
        MAGIC_TYPES_MITRASTAR_COMC = 1129270595,
        MAGIC_TYPES_NETGEAR_GS308T = 1313293109,
        MAGIC_TYPES_NETGEAR_NGE = 1313293600,
        MAGIC_TYPES_NETGEAR_NGF = 1313293856,
        MAGIC_TYPES_NETGEAR_NGG = 1313294112,
        MAGIC_TYPES_NETGEAR_NGH = 1313294368,
        MAGIC_TYPES_NETGEAR_NGI = 1313294624,
        MAGIC_TYPES_NETGEAR_NGP = 1313296416,
        MAGIC_TYPES_OPENWRT_OKLI = 1330334793,
        MAGIC_TYPES_OPENWRT_DLINK_COVR = 1752396147,
        MAGIC_TYPES_OPENWRT_SENAO_OKLI = 1936805707,
        MAGIC_TYPES_ENGENIUS_ECS1112FP = 2155872258UL,
        MAGIC_TYPES_ENGENIUS_FITSWITCH = 2155872259UL,
        MAGIC_TYPES_ENGENIUS_EWS1200_28TFP_OLD_FW = 2197885696UL,
        MAGIC_TYPES_ENGENIUS_EWS7926EFP_OLD_FW = 2197885698UL,
        MAGIC_TYPES_ENGENIUS_EWS7952P_OLD_FW = 2197890049UL,
        MAGIC_TYPES_REALTEK_RTL838X = 2206203904UL,
        MAGIC_TYPES_IODATA_BSH_G08M = 2206203905UL,
        MAGIC_TYPES_IODATA_BSH_GP08 = 2206203906UL,
        MAGIC_TYPES_IODATA_BSH_G16M = 2206203907UL,
        MAGIC_TYPES_IODATA_BSH_G24M = 2206203908UL,
        MAGIC_TYPES_IODATA_BSH_G08MB = 2206203920UL,
        MAGIC_TYPES_IODATA_BSH_GP08MB = 2206203921UL,
        MAGIC_TYPES_IODATA_BSH_G16MB = 2206203922UL,
        MAGIC_TYPES_IODATA_BSH_G24MB = 2206203923UL,
        MAGIC_TYPES_TRENDNET_TPE_3012LS = 2206210573UL,
        MAGIC_TYPES_TRENDNET_TPE_3018LS = 2206210574UL,
        MAGIC_TYPES_ENGENIUS_EGS2108P_OLD_FW = 2206212360UL,
        MAGIC_TYPES_ENGENIUS_EGS2110P_OLD_FW = 2206212368UL,
        MAGIC_TYPES_ENGENIUS_EWS2910P_OLD_FW = 2206214416UL,
        MAGIC_TYPES_ENGENIUS_EGS5110P_OLD_FW = 2206224656UL,
        MAGIC_TYPES_ENGENIUS_EGS5212FP_OLD_FW = 2206224914UL,
        MAGIC_TYPES_ENGENIUS_EWS5912FP_OLD_FW = 2206226706UL,
        MAGIC_TYPES_ENGENIUS_EWS7928P_OLD_FW = 2206234920UL,
        MAGIC_TYPES_ENGENIUS_EWS1200D_10T_OLD_FW = 2206670864UL,
        MAGIC_TYPES_ENGENIUS_EWS1200_28T_OLD_FW = 2206670888UL,
        MAGIC_TYPES_ENGENIUS_EGS7228FP_OLD_FW = 2206671503UL,
        MAGIC_TYPES_ENGENIUS_EWS7928FP_OLD_FW = 2206700175UL,
        MAGIC_TYPES_REALTEK_RTL839X = 2207252480UL,
        MAGIC_TYPES_REALTEK_RTL8396 = 2207645696UL,
        MAGIC_TYPES_ENGENIUS_EWS1200_52T_OLD_FW = 2207719506UL,
        MAGIC_TYPES_ENGENIUS_EGS7252FP_OLD_FW = 2207720751UL,
        MAGIC_TYPES_ENGENIUS_EWS7952FP_OLD_FW = 2207749423UL,
        MAGIC_TYPES_REALTEK_RTL930X = 2466250752UL,
        MAGIC_TYPES_ZYXEL_XGS1010_12 = 2466254864UL,
        MAGIC_TYPES_ZYXEL_XGS1210_12 = 2466255376UL,
        MAGIC_TYPES_ZYXEL_XGS1250_12 = 2466255440UL,
        MAGIC_TYPES_NICGIGA_S100_0800S_M = 2466447360UL,
        MAGIC_TYPES_PLASMACLOUD_PSX28 = 2467299328UL
    };
    static bool _is_defined_magic_types_t(magic_types_t v);

private:
    static const std::set<magic_types_t> _values_magic_types_t;
    static std::set<magic_types_t> _build_values_magic_types_t();

public:

    enum uimage_arch_t {
        UIMAGE_ARCH_INVALID = 0,
        UIMAGE_ARCH_ALPHA = 1,
        UIMAGE_ARCH_ARM = 2,
        UIMAGE_ARCH_I386 = 3,
        UIMAGE_ARCH_IA64 = 4,
        UIMAGE_ARCH_MIPS = 5,
        UIMAGE_ARCH_MIPS64 = 6,
        UIMAGE_ARCH_PPC = 7,
        UIMAGE_ARCH_S390 = 8,
        UIMAGE_ARCH_SH = 9,
        UIMAGE_ARCH_SPARC = 10,
        UIMAGE_ARCH_SPARC64 = 11,
        UIMAGE_ARCH_M68K = 12,
        UIMAGE_ARCH_NIOS = 13,
        UIMAGE_ARCH_MICROBLAZE = 14,
        UIMAGE_ARCH_NIOS2 = 15,
        UIMAGE_ARCH_BLACKFIN = 16,
        UIMAGE_ARCH_AVR32 = 17,
        UIMAGE_ARCH_ST200 = 18,
        UIMAGE_ARCH_SANDBOX = 19,
        UIMAGE_ARCH_NDS32 = 20,
        UIMAGE_ARCH_OPENRISC = 21,
        UIMAGE_ARCH_ARM64 = 22,
        UIMAGE_ARCH_ARC = 23,
        UIMAGE_ARCH_X86_64 = 24,
        UIMAGE_ARCH_XTENSA = 25,
        UIMAGE_ARCH_RISCV = 26
    };
    static bool _is_defined_uimage_arch_t(uimage_arch_t v);

private:
    static const std::set<uimage_arch_t> _values_uimage_arch_t;
    static std::set<uimage_arch_t> _build_values_uimage_arch_t();

public:

    enum uimage_comp_t {
        UIMAGE_COMP_NONE = 0,
        UIMAGE_COMP_GZIP = 1,
        UIMAGE_COMP_BZIP2 = 2,
        UIMAGE_COMP_LZMA = 3,
        UIMAGE_COMP_LZO = 4,
        UIMAGE_COMP_LZ4 = 5,
        UIMAGE_COMP_ZSTD = 6,
        UIMAGE_COMP_MZ = 9,
        UIMAGE_COMP_XIP = 10
    };
    static bool _is_defined_uimage_comp_t(uimage_comp_t v);

private:
    static const std::set<uimage_comp_t> _values_uimage_comp_t;
    static std::set<uimage_comp_t> _build_values_uimage_comp_t();

public:

    enum uimage_os_t {
        UIMAGE_OS_INVALID = 0,
        UIMAGE_OS_OPENBSD = 1,
        UIMAGE_OS_NETBSD = 2,
        UIMAGE_OS_FREEBSD = 3,
        UIMAGE_OS_BSD4_4 = 4,
        UIMAGE_OS_LINUX = 5,
        UIMAGE_OS_SVR4 = 6,
        UIMAGE_OS_ESIX = 7,
        UIMAGE_OS_SOLARIS = 8,
        UIMAGE_OS_IRIX = 9,
        UIMAGE_OS_SCO = 10,
        UIMAGE_OS_DELL = 11,
        UIMAGE_OS_NCR = 12,
        UIMAGE_OS_LYNXOS = 13,
        UIMAGE_OS_VXWORKS = 14,
        UIMAGE_OS_PSOS = 15,
        UIMAGE_OS_QNX = 16,
        UIMAGE_OS_U_BOOT = 17,
        UIMAGE_OS_RTEMS = 18,
        UIMAGE_OS_ARTOS = 19,
        UIMAGE_OS_UNITY = 20,
        UIMAGE_OS_INTEGRITY = 21,
        UIMAGE_OS_OSE = 22,
        UIMAGE_OS_PLAN9 = 23,
        UIMAGE_OS_OPENRTOS = 24,
        UIMAGE_OS_ARM_TRUSTED_FIRMWARE = 25,
        UIMAGE_OS_TEE = 26,
        UIMAGE_OS_OPENSBI = 27,
        UIMAGE_OS_EFI = 28,
        UIMAGE_OS_ELF = 29
    };
    static bool _is_defined_uimage_os_t(uimage_os_t v);

private:
    static const std::set<uimage_os_t> _values_uimage_os_t;
    static std::set<uimage_os_t> _build_values_uimage_os_t();

public:

    enum uimage_type_t {
        UIMAGE_TYPE_INVALID = 0,
        UIMAGE_TYPE_STANDALONE = 1,
        UIMAGE_TYPE_KERNEL = 2,
        UIMAGE_TYPE_RAMDISK = 3,
        UIMAGE_TYPE_MULTI = 4,
        UIMAGE_TYPE_FIRMWARE = 5,
        UIMAGE_TYPE_SCRIPT = 6,
        UIMAGE_TYPE_FILESYSTEM = 7,
        UIMAGE_TYPE_FLATDT = 8,
        UIMAGE_TYPE_KWBIMAGE = 9,
        UIMAGE_TYPE_IMXIMAGE = 10,
        UIMAGE_TYPE_UBLIMAGE = 11,
        UIMAGE_TYPE_OMAPIMAGE = 12,
        UIMAGE_TYPE_AISIMAGE = 13,
        UIMAGE_TYPE_KERNEL_NOLOAD = 14,
        UIMAGE_TYPE_PBLIMAGE = 15,
        UIMAGE_TYPE_MXSIMAGE = 16,
        UIMAGE_TYPE_GPIMAGE = 17,
        UIMAGE_TYPE_ATMELIMAGE = 18,
        UIMAGE_TYPE_SOCFPGAIMAGE = 19,
        UIMAGE_TYPE_X86_SETUP = 20,
        UIMAGE_TYPE_LPC32XXIMAGE = 21,
        UIMAGE_TYPE_LOADABLE = 22,
        UIMAGE_TYPE_RKIMAGE = 23,
        UIMAGE_TYPE_RKSD = 24,
        UIMAGE_TYPE_RKSPI = 25,
        UIMAGE_TYPE_ZYNQIMAGE = 26,
        UIMAGE_TYPE_ZYNQMPIMAGE = 27,
        UIMAGE_TYPE_ZYNQMPBIF = 28,
        UIMAGE_TYPE_FPGA = 29,
        UIMAGE_TYPE_VYBRIDIMAGE = 30,
        UIMAGE_TYPE_TEE = 31,
        UIMAGE_TYPE_FIRMWARE_IVT = 32,
        UIMAGE_TYPE_PMMC = 33,
        UIMAGE_TYPE_STM32IMAGE = 34,
        UIMAGE_TYPE_SOCFPGAIMAGE_V1 = 35,
        UIMAGE_TYPE_MTKIMAGE = 36,
        UIMAGE_TYPE_IMX8MIMAGE = 37,
        UIMAGE_TYPE_IMX8IMAGE = 38,
        UIMAGE_TYPE_COPRO = 39,
        UIMAGE_TYPE_SUNXI_EGON = 40,
        UIMAGE_TYPE_SUNXI_TOC0 = 41,
        UIMAGE_TYPE_FDT_LEGACY = 42,
        UIMAGE_TYPE_RENESAS_SPKG = 43,
        UIMAGE_TYPE_STARFIVE_SPL = 44,
        UIMAGE_TYPE_TFA_BL31 = 45,
        UIMAGE_TYPE_STM32IMAGE_V2 = 46,
        UIMAGE_TYPE_AMLIMAGE = 47
    };
    static bool _is_defined_uimage_type_t(uimage_type_t v);

private:
    static const std::set<uimage_type_t> _values_uimage_type_t;
    static std::set<uimage_type_t> _build_values_uimage_type_t();

public:

    uimage_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, uimage_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~uimage_t();

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

    class asus_firmware_information_t : public kaitai::kstruct {

    public:

        asus_firmware_information_t(kaitai::kstream* p__io, uimage_t::name_or_asus_info_t* p__parent = 0, uimage_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~asus_firmware_information_t();

    private:
        version_t* m_kernel_version;
        version_t* m_fs_version;
        std::string m_product_id;
        std::string m_extra_info;
        uimage_t* m__root;
        uimage_t::name_or_asus_info_t* m__parent;

    public:
        version_t* kernel_version() const { return m_kernel_version; }
        version_t* fs_version() const { return m_fs_version; }

        /**
         * In the Ralink SDK variant (see `extra_info`), the product ID field is
         * actually 23 bytes long, but no known product ID is longer than 12
         * bytes.
         */
        std::string product_id() const { return m_product_id; }

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
        std::string extra_info() const { return m_extra_info; }
        uimage_t* _root() const { return m__root; }
        uimage_t::name_or_asus_info_t* _parent() const { return m__parent; }
    };

    class name_or_asus_info_t : public kaitai::kstruct {

    public:

        name_or_asus_info_t(kaitai::kstream* p__io, uimage_t::uheader_t* p__parent = 0, uimage_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~name_or_asus_info_t();

    private:
        bool f_byte0;
        uint8_t m_byte0;

    public:
        uint8_t byte0();

    private:
        bool f_byte4;
        uint8_t m_byte4;

    public:
        uint8_t byte4();

    private:
        bool f_has_asus_info;
        bool m_has_asus_info;

    public:

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
        bool has_asus_info();

    private:
        std::string m_name;
        bool n_name;

    public:
        bool _is_null_name() { name(); return n_name; };

    private:
        asus_firmware_information_t* m_asus_info;
        bool n_asus_info;

    public:
        bool _is_null_asus_info() { asus_info(); return n_asus_info; };

    private:
        uimage_t* m__root;
        uimage_t::uheader_t* m__parent;

    public:
        std::string name() const { return m_name; }
        asus_firmware_information_t* asus_info() const { return m_asus_info; }
        uimage_t* _root() const { return m__root; }
        uimage_t::uheader_t* _parent() const { return m__parent; }
    };

    class uheader_t : public kaitai::kstruct {

    public:

        uheader_t(kaitai::kstream* p__io, uimage_t* p__parent = 0, uimage_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~uheader_t();

    private:
        magic_types_t m_magic;
        uint32_t m_header_crc;
        uint32_t m_timestamp;
        uint32_t m_len_image;
        uint32_t m_load_address;
        uint32_t m_entry_address;
        uint32_t m_data_crc;
        uimage_os_t m_os_type;
        uimage_arch_t m_architecture;
        uimage_type_t m_image_type;
        uimage_comp_t m_compression_type;
        name_or_asus_info_t* m_name_or_asus_info;
        uimage_t* m__root;
        uimage_t* m__parent;
        std::string m__raw_name_or_asus_info;
        kaitai::kstream* m__io__raw_name_or_asus_info;

    public:

        /**
         * Besides the standard U-Boot magic, some vendors' bootloaders expect
         * their own value (often a different one for each device model), with
         * the rest of the header unchanged. `magic_types` lists the values
         * known so far; images with any other magic are rejected.
         */
        magic_types_t magic() const { return m_magic; }
        uint32_t header_crc() const { return m_header_crc; }
        uint32_t timestamp() const { return m_timestamp; }
        uint32_t len_image() const { return m_len_image; }
        uint32_t load_address() const { return m_load_address; }
        uint32_t entry_address() const { return m_entry_address; }
        uint32_t data_crc() const { return m_data_crc; }
        uimage_os_t os_type() const { return m_os_type; }
        uimage_arch_t architecture() const { return m_architecture; }
        uimage_type_t image_type() const { return m_image_type; }
        uimage_comp_t compression_type() const { return m_compression_type; }
        name_or_asus_info_t* name_or_asus_info() const { return m_name_or_asus_info; }
        uimage_t* _root() const { return m__root; }
        uimage_t* _parent() const { return m__parent; }
        std::string _raw_name_or_asus_info() const { return m__raw_name_or_asus_info; }
        kaitai::kstream* _io__raw_name_or_asus_info() const { return m__io__raw_name_or_asus_info; }
    };

    class version_t : public kaitai::kstruct {

    public:

        version_t(kaitai::kstream* p__io, uimage_t::asus_firmware_information_t* p__parent = 0, uimage_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~version_t();

    private:
        uint8_t m_major;
        uint8_t m_minor;
        uimage_t* m__root;
        uimage_t::asus_firmware_information_t* m__parent;

    public:
        uint8_t major() const { return m_major; }
        uint8_t minor() const { return m_minor; }
        uimage_t* _root() const { return m__root; }
        uimage_t::asus_firmware_information_t* _parent() const { return m__parent; }
    };

private:
    uheader_t* m_header;
    std::string m_data;
    uimage_t* m__root;
    kaitai::kstruct* m__parent;

public:
    uheader_t* header() const { return m_header; }
    std::string data() const { return m_data; }
    uimage_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // UIMAGE_H_
