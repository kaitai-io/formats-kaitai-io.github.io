// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "uimage.h"
#include "kaitai/exceptions.h"
const std::set<uimage_t::magic_types_t> uimage_t::_values_magic_types_t{
    uimage_t::MAGIC_TYPES_ALLNET_ALL_SG8316M,
    uimage_t::MAGIC_TYPES_ALLNET_ALL_SG8208M,
    uimage_t::MAGIC_TYPES_ALLNET_ALL_SG8324M,
    uimage_t::MAGIC_TYPES_DATTO_L8,
    uimage_t::MAGIC_TYPES_ALLNET_ALL_WAPC0450C,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS2910P_V3,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_28TFP,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS7926EFP,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS7952P,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS2908P,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS7928P_V2,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_28TFP_V2,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS2910P,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS5912FP,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS7928P,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200D_10T,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_28T,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS7928FP,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_52T,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS7952FP,
    uimage_t::MAGIC_TYPES_YOUKU_YK_L1,
    uimage_t::MAGIC_TYPES_REALTEK_SDK,
    uimage_t::MAGIC_TYPES_NETGEAR_GS750E,
    uimage_t::MAGIC_TYPES_NETGEAR_GS728TP_V2,
    uimage_t::MAGIC_TYPES_BOLT_BL100,
    uimage_t::MAGIC_TYPES_UIMAGE,
    uimage_t::MAGIC_TYPES_NETGEAR_WNCE4004,
    uimage_t::MAGIC_TYPES_NETGEAR_WNR612_V2_EARLY,
    uimage_t::MAGIC_TYPES_NETGEAR_WNR1000_V2_VC,
    uimage_t::MAGIC_TYPES_NETGEAR_WNR1000_V2,
    uimage_t::MAGIC_TYPES_NETGEAR_WNR1000_V2_VM,
    uimage_t::MAGIC_TYPES_NETGEAR_WNR1000_V4,
    uimage_t::MAGIC_TYPES_NETGEAR_WPN824N,
    uimage_t::MAGIC_TYPES_ZYXEL_UAG50,
    uimage_t::MAGIC_TYPES_NETGEAR_WNR2000,
    uimage_t::MAGIC_TYPES_NETGEAR_WNR2000_V3,
    uimage_t::MAGIC_TYPES_NETGEAR_WNR2000_V4,
    uimage_t::MAGIC_TYPES_NETGEAR_WNR612_V2,
    uimage_t::MAGIC_TYPES_NETGEAR_WNR2200,
    uimage_t::MAGIC_TYPES_NETGEAR_WNDR3700,
    uimage_t::MAGIC_TYPES_NETGEAR_WNDR3700_V2,
    uimage_t::MAGIC_TYPES_NETGEAR_WNDR3700_V4,
    uimage_t::MAGIC_TYPES_NETGEAR_R6100,
    uimage_t::MAGIC_TYPES_NETGEAR_WNR612,
    uimage_t::MAGIC_TYPES_MITRASTAR_COMB,
    uimage_t::MAGIC_TYPES_MITRASTAR_COMC,
    uimage_t::MAGIC_TYPES_NETGEAR_GS308T,
    uimage_t::MAGIC_TYPES_NETGEAR_NGE,
    uimage_t::MAGIC_TYPES_NETGEAR_NGF,
    uimage_t::MAGIC_TYPES_NETGEAR_NGG,
    uimage_t::MAGIC_TYPES_NETGEAR_NGH,
    uimage_t::MAGIC_TYPES_NETGEAR_NGI,
    uimage_t::MAGIC_TYPES_NETGEAR_NGP,
    uimage_t::MAGIC_TYPES_OPENWRT_OKLI,
    uimage_t::MAGIC_TYPES_OPENWRT_DLINK_COVR,
    uimage_t::MAGIC_TYPES_OPENWRT_SENAO_OKLI,
    uimage_t::MAGIC_TYPES_ENGENIUS_ECS1112FP,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_28TFP_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS7926EFP_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS7952P_OLD_FW,
    uimage_t::MAGIC_TYPES_REALTEK_RTL838X,
    uimage_t::MAGIC_TYPES_IODATA_BSH_G08M,
    uimage_t::MAGIC_TYPES_IODATA_BSH_GP08,
    uimage_t::MAGIC_TYPES_IODATA_BSH_G16M,
    uimage_t::MAGIC_TYPES_IODATA_BSH_G24M,
    uimage_t::MAGIC_TYPES_IODATA_BSH_G08MB,
    uimage_t::MAGIC_TYPES_IODATA_BSH_GP08MB,
    uimage_t::MAGIC_TYPES_IODATA_BSH_G16MB,
    uimage_t::MAGIC_TYPES_IODATA_BSH_G24MB,
    uimage_t::MAGIC_TYPES_TRENDNET_TPE_3012LS,
    uimage_t::MAGIC_TYPES_TRENDNET_TPE_3018LS,
    uimage_t::MAGIC_TYPES_ENGENIUS_EGS2108P_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EGS2110P_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS2910P_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EGS5110P_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EGS5212FP_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS5912FP_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS7928P_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200D_10T_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_28T_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EGS7228FP_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS7928FP_OLD_FW,
    uimage_t::MAGIC_TYPES_REALTEK_RTL839X,
    uimage_t::MAGIC_TYPES_REALTEK_RTL8396,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_52T_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EGS7252FP_OLD_FW,
    uimage_t::MAGIC_TYPES_ENGENIUS_EWS7952FP_OLD_FW,
    uimage_t::MAGIC_TYPES_REALTEK_RTL930X,
    uimage_t::MAGIC_TYPES_ZYXEL_XGS1010_12,
    uimage_t::MAGIC_TYPES_ZYXEL_XGS1210_12,
    uimage_t::MAGIC_TYPES_ZYXEL_XGS1250_12,
    uimage_t::MAGIC_TYPES_NICGIGA_S100_0800S_M,
    uimage_t::MAGIC_TYPES_PLASMACLOUD_PSX28,
};
bool uimage_t::_is_defined_magic_types_t(uimage_t::magic_types_t v) {
    return uimage_t::_values_magic_types_t.find(v) != uimage_t::_values_magic_types_t.end();
}
const std::set<uimage_t::uimage_arch_t> uimage_t::_values_uimage_arch_t{
    uimage_t::UIMAGE_ARCH_INVALID,
    uimage_t::UIMAGE_ARCH_ALPHA,
    uimage_t::UIMAGE_ARCH_ARM,
    uimage_t::UIMAGE_ARCH_I386,
    uimage_t::UIMAGE_ARCH_IA64,
    uimage_t::UIMAGE_ARCH_MIPS,
    uimage_t::UIMAGE_ARCH_MIPS64,
    uimage_t::UIMAGE_ARCH_PPC,
    uimage_t::UIMAGE_ARCH_S390,
    uimage_t::UIMAGE_ARCH_SH,
    uimage_t::UIMAGE_ARCH_SPARC,
    uimage_t::UIMAGE_ARCH_SPARC64,
    uimage_t::UIMAGE_ARCH_M68K,
    uimage_t::UIMAGE_ARCH_NIOS,
    uimage_t::UIMAGE_ARCH_MICROBLAZE,
    uimage_t::UIMAGE_ARCH_NIOS2,
    uimage_t::UIMAGE_ARCH_BLACKFIN,
    uimage_t::UIMAGE_ARCH_AVR32,
    uimage_t::UIMAGE_ARCH_ST200,
    uimage_t::UIMAGE_ARCH_SANDBOX,
    uimage_t::UIMAGE_ARCH_NDS32,
    uimage_t::UIMAGE_ARCH_OPENRISC,
    uimage_t::UIMAGE_ARCH_ARM64,
    uimage_t::UIMAGE_ARCH_ARC,
    uimage_t::UIMAGE_ARCH_X86_64,
    uimage_t::UIMAGE_ARCH_XTENSA,
    uimage_t::UIMAGE_ARCH_RISCV,
};
bool uimage_t::_is_defined_uimage_arch_t(uimage_t::uimage_arch_t v) {
    return uimage_t::_values_uimage_arch_t.find(v) != uimage_t::_values_uimage_arch_t.end();
}
const std::set<uimage_t::uimage_comp_t> uimage_t::_values_uimage_comp_t{
    uimage_t::UIMAGE_COMP_NONE,
    uimage_t::UIMAGE_COMP_GZIP,
    uimage_t::UIMAGE_COMP_BZIP2,
    uimage_t::UIMAGE_COMP_LZMA,
    uimage_t::UIMAGE_COMP_LZO,
    uimage_t::UIMAGE_COMP_LZ4,
    uimage_t::UIMAGE_COMP_ZSTD,
    uimage_t::UIMAGE_COMP_MZ,
    uimage_t::UIMAGE_COMP_XIP,
};
bool uimage_t::_is_defined_uimage_comp_t(uimage_t::uimage_comp_t v) {
    return uimage_t::_values_uimage_comp_t.find(v) != uimage_t::_values_uimage_comp_t.end();
}
const std::set<uimage_t::uimage_os_t> uimage_t::_values_uimage_os_t{
    uimage_t::UIMAGE_OS_INVALID,
    uimage_t::UIMAGE_OS_OPENBSD,
    uimage_t::UIMAGE_OS_NETBSD,
    uimage_t::UIMAGE_OS_FREEBSD,
    uimage_t::UIMAGE_OS_BSD4_4,
    uimage_t::UIMAGE_OS_LINUX,
    uimage_t::UIMAGE_OS_SVR4,
    uimage_t::UIMAGE_OS_ESIX,
    uimage_t::UIMAGE_OS_SOLARIS,
    uimage_t::UIMAGE_OS_IRIX,
    uimage_t::UIMAGE_OS_SCO,
    uimage_t::UIMAGE_OS_DELL,
    uimage_t::UIMAGE_OS_NCR,
    uimage_t::UIMAGE_OS_LYNXOS,
    uimage_t::UIMAGE_OS_VXWORKS,
    uimage_t::UIMAGE_OS_PSOS,
    uimage_t::UIMAGE_OS_QNX,
    uimage_t::UIMAGE_OS_U_BOOT,
    uimage_t::UIMAGE_OS_RTEMS,
    uimage_t::UIMAGE_OS_ARTOS,
    uimage_t::UIMAGE_OS_UNITY,
    uimage_t::UIMAGE_OS_INTEGRITY,
    uimage_t::UIMAGE_OS_OSE,
    uimage_t::UIMAGE_OS_PLAN9,
    uimage_t::UIMAGE_OS_OPENRTOS,
    uimage_t::UIMAGE_OS_ARM_TRUSTED_FIRMWARE,
    uimage_t::UIMAGE_OS_TEE,
    uimage_t::UIMAGE_OS_OPENSBI,
    uimage_t::UIMAGE_OS_EFI,
    uimage_t::UIMAGE_OS_ELF,
};
bool uimage_t::_is_defined_uimage_os_t(uimage_t::uimage_os_t v) {
    return uimage_t::_values_uimage_os_t.find(v) != uimage_t::_values_uimage_os_t.end();
}
const std::set<uimage_t::uimage_type_t> uimage_t::_values_uimage_type_t{
    uimage_t::UIMAGE_TYPE_INVALID,
    uimage_t::UIMAGE_TYPE_STANDALONE,
    uimage_t::UIMAGE_TYPE_KERNEL,
    uimage_t::UIMAGE_TYPE_RAMDISK,
    uimage_t::UIMAGE_TYPE_MULTI,
    uimage_t::UIMAGE_TYPE_FIRMWARE,
    uimage_t::UIMAGE_TYPE_SCRIPT,
    uimage_t::UIMAGE_TYPE_FILESYSTEM,
    uimage_t::UIMAGE_TYPE_FLATDT,
    uimage_t::UIMAGE_TYPE_KWBIMAGE,
    uimage_t::UIMAGE_TYPE_IMXIMAGE,
    uimage_t::UIMAGE_TYPE_UBLIMAGE,
    uimage_t::UIMAGE_TYPE_OMAPIMAGE,
    uimage_t::UIMAGE_TYPE_AISIMAGE,
    uimage_t::UIMAGE_TYPE_KERNEL_NOLOAD,
    uimage_t::UIMAGE_TYPE_PBLIMAGE,
    uimage_t::UIMAGE_TYPE_MXSIMAGE,
    uimage_t::UIMAGE_TYPE_GPIMAGE,
    uimage_t::UIMAGE_TYPE_ATMELIMAGE,
    uimage_t::UIMAGE_TYPE_SOCFPGAIMAGE,
    uimage_t::UIMAGE_TYPE_X86_SETUP,
    uimage_t::UIMAGE_TYPE_LPC32XXIMAGE,
    uimage_t::UIMAGE_TYPE_LOADABLE,
    uimage_t::UIMAGE_TYPE_RKIMAGE,
    uimage_t::UIMAGE_TYPE_RKSD,
    uimage_t::UIMAGE_TYPE_RKSPI,
    uimage_t::UIMAGE_TYPE_ZYNQIMAGE,
    uimage_t::UIMAGE_TYPE_ZYNQMPIMAGE,
    uimage_t::UIMAGE_TYPE_ZYNQMPBIF,
    uimage_t::UIMAGE_TYPE_FPGA,
    uimage_t::UIMAGE_TYPE_VYBRIDIMAGE,
    uimage_t::UIMAGE_TYPE_TEE,
    uimage_t::UIMAGE_TYPE_FIRMWARE_IVT,
    uimage_t::UIMAGE_TYPE_PMMC,
    uimage_t::UIMAGE_TYPE_STM32IMAGE,
    uimage_t::UIMAGE_TYPE_SOCFPGAIMAGE_V1,
    uimage_t::UIMAGE_TYPE_MTKIMAGE,
    uimage_t::UIMAGE_TYPE_IMX8MIMAGE,
    uimage_t::UIMAGE_TYPE_IMX8IMAGE,
    uimage_t::UIMAGE_TYPE_COPRO,
    uimage_t::UIMAGE_TYPE_SUNXI_EGON,
    uimage_t::UIMAGE_TYPE_SUNXI_TOC0,
    uimage_t::UIMAGE_TYPE_FDT_LEGACY,
    uimage_t::UIMAGE_TYPE_RENESAS_SPKG,
    uimage_t::UIMAGE_TYPE_STARFIVE_SPL,
    uimage_t::UIMAGE_TYPE_TFA_BL31,
    uimage_t::UIMAGE_TYPE_STM32IMAGE_V2,
    uimage_t::UIMAGE_TYPE_AMLIMAGE,
};
bool uimage_t::_is_defined_uimage_type_t(uimage_t::uimage_type_t v) {
    return uimage_t::_values_uimage_type_t.find(v) != uimage_t::_values_uimage_type_t.end();
}

uimage_t::uimage_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, uimage_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = nullptr;
    _read();
}

void uimage_t::_read() {
    m_header = std::unique_ptr<uheader_t>(new uheader_t(m__io, this, m__root));
    m_data = m__io->read_bytes(header()->len_image());
}

uimage_t::~uimage_t() {
    _clean_up();
}

void uimage_t::_clean_up() {
}

uimage_t::asus_firmware_information_t::asus_firmware_information_t(kaitai::kstream* p__io, uimage_t::name_or_asus_info_t* p__parent, uimage_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_kernel_version = nullptr;
    m_fs_version = nullptr;
    _read();
}

void uimage_t::asus_firmware_information_t::_read() {
    m_kernel_version = std::unique_ptr<version_t>(new version_t(m__io, this, m__root));
    m_fs_version = std::unique_ptr<version_t>(new version_t(m__io, this, m__root));
    m_product_id = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(12), 0, false), "UTF-8");
    m_extra_info = m__io->read_bytes(16);
}

uimage_t::asus_firmware_information_t::~asus_firmware_information_t() {
    _clean_up();
}

void uimage_t::asus_firmware_information_t::_clean_up() {
}

uimage_t::name_or_asus_info_t::name_or_asus_info_t(kaitai::kstream* p__io, uimage_t::uheader_t* p__parent, uimage_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_asus_info = nullptr;
    f_byte0 = false;
    f_byte4 = false;
    f_has_asus_info = false;
    _read();
}

void uimage_t::name_or_asus_info_t::_read() {
    n_name = true;
    if (!(has_asus_info())) {
        n_name = false;
        m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, false), "UTF-8");
    }
    n_asus_info = true;
    if (has_asus_info()) {
        n_asus_info = false;
        m_asus_info = std::unique_ptr<asus_firmware_information_t>(new asus_firmware_information_t(m__io, this, m__root));
    }
}

uimage_t::name_or_asus_info_t::~name_or_asus_info_t() {
    _clean_up();
}

void uimage_t::name_or_asus_info_t::_clean_up() {
    if (!n_name) {
    }
    if (!n_asus_info) {
    }
    if (f_byte0) {
    }
    if (f_byte4) {
    }
}

uint8_t uimage_t::name_or_asus_info_t::byte0() {
    if (f_byte0)
        return m_byte0;
    f_byte0 = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_byte0 = m__io->read_u1();
    m__io->seek(_pos);
    return m_byte0;
}

uint8_t uimage_t::name_or_asus_info_t::byte4() {
    if (f_byte4)
        return m_byte4;
    f_byte4 = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(4);
    m_byte4 = m__io->read_u1();
    m__io->seek(_pos);
    return m_byte4;
}

bool uimage_t::name_or_asus_info_t::has_asus_info() {
    if (f_has_asus_info)
        return m_has_asus_info;
    f_has_asus_info = true;
    m_has_asus_info =  ((byte0() < 32) && (byte4() >= 32) && (byte4() < 127)) ;
    return m_has_asus_info;
}

uimage_t::uheader_t::uheader_t(kaitai::kstream* p__io, uimage_t* p__parent, uimage_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name_or_asus_info = nullptr;
    m__io__raw_name_or_asus_info = nullptr;
    _read();
}

void uimage_t::uheader_t::_read() {
    m_magic = static_cast<uimage_t::magic_types_t>(m__io->read_u4be());
    if (!uimage_t::_is_defined_magic_types_t(m_magic)) {
        throw kaitai::validation_not_in_enum_error<uimage_t::magic_types_t>(m_magic, m__io, std::string("/types/uheader/seq/0"));
    }
    m_header_crc = m__io->read_u4be();
    m_timestamp = m__io->read_u4be();
    m_len_image = m__io->read_u4be();
    m_load_address = m__io->read_u4be();
    m_entry_address = m__io->read_u4be();
    m_data_crc = m__io->read_u4be();
    m_os_type = static_cast<uimage_t::uimage_os_t>(m__io->read_u1());
    if (!uimage_t::_is_defined_uimage_os_t(m_os_type)) {
        throw kaitai::validation_not_in_enum_error<uimage_t::uimage_os_t>(m_os_type, m__io, std::string("/types/uheader/seq/7"));
    }
    m_architecture = static_cast<uimage_t::uimage_arch_t>(m__io->read_u1());
    if (!uimage_t::_is_defined_uimage_arch_t(m_architecture)) {
        throw kaitai::validation_not_in_enum_error<uimage_t::uimage_arch_t>(m_architecture, m__io, std::string("/types/uheader/seq/8"));
    }
    m_image_type = static_cast<uimage_t::uimage_type_t>(m__io->read_u1());
    if (!uimage_t::_is_defined_uimage_type_t(m_image_type)) {
        throw kaitai::validation_not_in_enum_error<uimage_t::uimage_type_t>(m_image_type, m__io, std::string("/types/uheader/seq/9"));
    }
    m_compression_type = static_cast<uimage_t::uimage_comp_t>(m__io->read_u1());
    if (!uimage_t::_is_defined_uimage_comp_t(m_compression_type)) {
        throw kaitai::validation_not_in_enum_error<uimage_t::uimage_comp_t>(m_compression_type, m__io, std::string("/types/uheader/seq/10"));
    }
    m__raw_name_or_asus_info = m__io->read_bytes(32);
    m__io__raw_name_or_asus_info = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_name_or_asus_info));
    m_name_or_asus_info = std::unique_ptr<name_or_asus_info_t>(new name_or_asus_info_t(m__io__raw_name_or_asus_info.get(), this, m__root));
}

uimage_t::uheader_t::~uheader_t() {
    _clean_up();
}

void uimage_t::uheader_t::_clean_up() {
}

uimage_t::version_t::version_t(kaitai::kstream* p__io, uimage_t::asus_firmware_information_t* p__parent, uimage_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void uimage_t::version_t::_read() {
    m_major = m__io->read_u1();
    m_minor = m__io->read_u1();
}

uimage_t::version_t::~version_t() {
    _clean_up();
}

void uimage_t::version_t::_clean_up() {
}
