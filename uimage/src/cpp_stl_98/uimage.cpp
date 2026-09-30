// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "uimage.h"
#include "kaitai/exceptions.h"
std::set<uimage_t::magic_types_t> uimage_t::_build_values_magic_types_t() {
    std::set<uimage_t::magic_types_t> _t;
    _t.insert(uimage_t::MAGIC_TYPES_ALLNET_ALL_SG8316M);
    _t.insert(uimage_t::MAGIC_TYPES_ALLNET_ALL_SG8208M);
    _t.insert(uimage_t::MAGIC_TYPES_ALLNET_ALL_SG8324M);
    _t.insert(uimage_t::MAGIC_TYPES_DATTO_L8);
    _t.insert(uimage_t::MAGIC_TYPES_ALLNET_ALL_WAPC0450C);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS2910P_V3);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_28TFP);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS7926EFP);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS7952P);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS2908P);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS7928P_V2);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_28TFP_V2);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS2910P);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS5912FP);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS7928P);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200D_10T);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_28T);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS7928FP);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_52T);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS7952FP);
    _t.insert(uimage_t::MAGIC_TYPES_YOUKU_YK_L1);
    _t.insert(uimage_t::MAGIC_TYPES_REALTEK_SDK);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_GS750E);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_GS728TP_V2);
    _t.insert(uimage_t::MAGIC_TYPES_BOLT_BL100);
    _t.insert(uimage_t::MAGIC_TYPES_UIMAGE);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNCE4004);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNR612_V2_EARLY);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNR1000_V2_VC);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNR1000_V2);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNR1000_V2_VM);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNR1000_V4);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WPN824N);
    _t.insert(uimage_t::MAGIC_TYPES_ZYXEL_UAG50);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNR2000);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNR2000_V3);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNR2000_V4);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNR612_V2);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNR2200);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNDR3700);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNDR3700_V2);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNDR3700_V4);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_R6100);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_WNR612);
    _t.insert(uimage_t::MAGIC_TYPES_MITRASTAR_COMB);
    _t.insert(uimage_t::MAGIC_TYPES_MITRASTAR_COMC);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_GS308T);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_NGE);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_NGF);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_NGG);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_NGH);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_NGI);
    _t.insert(uimage_t::MAGIC_TYPES_NETGEAR_NGP);
    _t.insert(uimage_t::MAGIC_TYPES_OPENWRT_OKLI);
    _t.insert(uimage_t::MAGIC_TYPES_OPENWRT_DLINK_COVR);
    _t.insert(uimage_t::MAGIC_TYPES_OPENWRT_SENAO_OKLI);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_ECS1112FP);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_28TFP_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS7926EFP_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS7952P_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_REALTEK_RTL838X);
    _t.insert(uimage_t::MAGIC_TYPES_IODATA_BSH_G08M);
    _t.insert(uimage_t::MAGIC_TYPES_IODATA_BSH_GP08);
    _t.insert(uimage_t::MAGIC_TYPES_IODATA_BSH_G16M);
    _t.insert(uimage_t::MAGIC_TYPES_IODATA_BSH_G24M);
    _t.insert(uimage_t::MAGIC_TYPES_IODATA_BSH_G08MB);
    _t.insert(uimage_t::MAGIC_TYPES_IODATA_BSH_GP08MB);
    _t.insert(uimage_t::MAGIC_TYPES_IODATA_BSH_G16MB);
    _t.insert(uimage_t::MAGIC_TYPES_IODATA_BSH_G24MB);
    _t.insert(uimage_t::MAGIC_TYPES_TRENDNET_TPE_3012LS);
    _t.insert(uimage_t::MAGIC_TYPES_TRENDNET_TPE_3018LS);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EGS2108P_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EGS2110P_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS2910P_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EGS5110P_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EGS5212FP_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS5912FP_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS7928P_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200D_10T_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_28T_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EGS7228FP_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS7928FP_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_REALTEK_RTL839X);
    _t.insert(uimage_t::MAGIC_TYPES_REALTEK_RTL8396);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS1200_52T_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EGS7252FP_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_ENGENIUS_EWS7952FP_OLD_FW);
    _t.insert(uimage_t::MAGIC_TYPES_REALTEK_RTL930X);
    _t.insert(uimage_t::MAGIC_TYPES_ZYXEL_XGS1010_12);
    _t.insert(uimage_t::MAGIC_TYPES_ZYXEL_XGS1210_12);
    _t.insert(uimage_t::MAGIC_TYPES_ZYXEL_XGS1250_12);
    _t.insert(uimage_t::MAGIC_TYPES_NICGIGA_S100_0800S_M);
    _t.insert(uimage_t::MAGIC_TYPES_PLASMACLOUD_PSX28);
    return _t;
}
const std::set<uimage_t::magic_types_t> uimage_t::_values_magic_types_t = uimage_t::_build_values_magic_types_t();
bool uimage_t::_is_defined_magic_types_t(uimage_t::magic_types_t v) {
    return uimage_t::_values_magic_types_t.find(v) != uimage_t::_values_magic_types_t.end();
}
std::set<uimage_t::uimage_arch_t> uimage_t::_build_values_uimage_arch_t() {
    std::set<uimage_t::uimage_arch_t> _t;
    _t.insert(uimage_t::UIMAGE_ARCH_INVALID);
    _t.insert(uimage_t::UIMAGE_ARCH_ALPHA);
    _t.insert(uimage_t::UIMAGE_ARCH_ARM);
    _t.insert(uimage_t::UIMAGE_ARCH_I386);
    _t.insert(uimage_t::UIMAGE_ARCH_IA64);
    _t.insert(uimage_t::UIMAGE_ARCH_MIPS);
    _t.insert(uimage_t::UIMAGE_ARCH_MIPS64);
    _t.insert(uimage_t::UIMAGE_ARCH_PPC);
    _t.insert(uimage_t::UIMAGE_ARCH_S390);
    _t.insert(uimage_t::UIMAGE_ARCH_SH);
    _t.insert(uimage_t::UIMAGE_ARCH_SPARC);
    _t.insert(uimage_t::UIMAGE_ARCH_SPARC64);
    _t.insert(uimage_t::UIMAGE_ARCH_M68K);
    _t.insert(uimage_t::UIMAGE_ARCH_NIOS);
    _t.insert(uimage_t::UIMAGE_ARCH_MICROBLAZE);
    _t.insert(uimage_t::UIMAGE_ARCH_NIOS2);
    _t.insert(uimage_t::UIMAGE_ARCH_BLACKFIN);
    _t.insert(uimage_t::UIMAGE_ARCH_AVR32);
    _t.insert(uimage_t::UIMAGE_ARCH_ST200);
    _t.insert(uimage_t::UIMAGE_ARCH_SANDBOX);
    _t.insert(uimage_t::UIMAGE_ARCH_NDS32);
    _t.insert(uimage_t::UIMAGE_ARCH_OPENRISC);
    _t.insert(uimage_t::UIMAGE_ARCH_ARM64);
    _t.insert(uimage_t::UIMAGE_ARCH_ARC);
    _t.insert(uimage_t::UIMAGE_ARCH_X86_64);
    _t.insert(uimage_t::UIMAGE_ARCH_XTENSA);
    _t.insert(uimage_t::UIMAGE_ARCH_RISCV);
    return _t;
}
const std::set<uimage_t::uimage_arch_t> uimage_t::_values_uimage_arch_t = uimage_t::_build_values_uimage_arch_t();
bool uimage_t::_is_defined_uimage_arch_t(uimage_t::uimage_arch_t v) {
    return uimage_t::_values_uimage_arch_t.find(v) != uimage_t::_values_uimage_arch_t.end();
}
std::set<uimage_t::uimage_comp_t> uimage_t::_build_values_uimage_comp_t() {
    std::set<uimage_t::uimage_comp_t> _t;
    _t.insert(uimage_t::UIMAGE_COMP_NONE);
    _t.insert(uimage_t::UIMAGE_COMP_GZIP);
    _t.insert(uimage_t::UIMAGE_COMP_BZIP2);
    _t.insert(uimage_t::UIMAGE_COMP_LZMA);
    _t.insert(uimage_t::UIMAGE_COMP_LZO);
    _t.insert(uimage_t::UIMAGE_COMP_LZ4);
    _t.insert(uimage_t::UIMAGE_COMP_ZSTD);
    _t.insert(uimage_t::UIMAGE_COMP_MZ);
    _t.insert(uimage_t::UIMAGE_COMP_XIP);
    return _t;
}
const std::set<uimage_t::uimage_comp_t> uimage_t::_values_uimage_comp_t = uimage_t::_build_values_uimage_comp_t();
bool uimage_t::_is_defined_uimage_comp_t(uimage_t::uimage_comp_t v) {
    return uimage_t::_values_uimage_comp_t.find(v) != uimage_t::_values_uimage_comp_t.end();
}
std::set<uimage_t::uimage_os_t> uimage_t::_build_values_uimage_os_t() {
    std::set<uimage_t::uimage_os_t> _t;
    _t.insert(uimage_t::UIMAGE_OS_INVALID);
    _t.insert(uimage_t::UIMAGE_OS_OPENBSD);
    _t.insert(uimage_t::UIMAGE_OS_NETBSD);
    _t.insert(uimage_t::UIMAGE_OS_FREEBSD);
    _t.insert(uimage_t::UIMAGE_OS_BSD4_4);
    _t.insert(uimage_t::UIMAGE_OS_LINUX);
    _t.insert(uimage_t::UIMAGE_OS_SVR4);
    _t.insert(uimage_t::UIMAGE_OS_ESIX);
    _t.insert(uimage_t::UIMAGE_OS_SOLARIS);
    _t.insert(uimage_t::UIMAGE_OS_IRIX);
    _t.insert(uimage_t::UIMAGE_OS_SCO);
    _t.insert(uimage_t::UIMAGE_OS_DELL);
    _t.insert(uimage_t::UIMAGE_OS_NCR);
    _t.insert(uimage_t::UIMAGE_OS_LYNXOS);
    _t.insert(uimage_t::UIMAGE_OS_VXWORKS);
    _t.insert(uimage_t::UIMAGE_OS_PSOS);
    _t.insert(uimage_t::UIMAGE_OS_QNX);
    _t.insert(uimage_t::UIMAGE_OS_U_BOOT);
    _t.insert(uimage_t::UIMAGE_OS_RTEMS);
    _t.insert(uimage_t::UIMAGE_OS_ARTOS);
    _t.insert(uimage_t::UIMAGE_OS_UNITY);
    _t.insert(uimage_t::UIMAGE_OS_INTEGRITY);
    _t.insert(uimage_t::UIMAGE_OS_OSE);
    _t.insert(uimage_t::UIMAGE_OS_PLAN9);
    _t.insert(uimage_t::UIMAGE_OS_OPENRTOS);
    _t.insert(uimage_t::UIMAGE_OS_ARM_TRUSTED_FIRMWARE);
    _t.insert(uimage_t::UIMAGE_OS_TEE);
    _t.insert(uimage_t::UIMAGE_OS_OPENSBI);
    _t.insert(uimage_t::UIMAGE_OS_EFI);
    _t.insert(uimage_t::UIMAGE_OS_ELF);
    return _t;
}
const std::set<uimage_t::uimage_os_t> uimage_t::_values_uimage_os_t = uimage_t::_build_values_uimage_os_t();
bool uimage_t::_is_defined_uimage_os_t(uimage_t::uimage_os_t v) {
    return uimage_t::_values_uimage_os_t.find(v) != uimage_t::_values_uimage_os_t.end();
}
std::set<uimage_t::uimage_type_t> uimage_t::_build_values_uimage_type_t() {
    std::set<uimage_t::uimage_type_t> _t;
    _t.insert(uimage_t::UIMAGE_TYPE_INVALID);
    _t.insert(uimage_t::UIMAGE_TYPE_STANDALONE);
    _t.insert(uimage_t::UIMAGE_TYPE_KERNEL);
    _t.insert(uimage_t::UIMAGE_TYPE_RAMDISK);
    _t.insert(uimage_t::UIMAGE_TYPE_MULTI);
    _t.insert(uimage_t::UIMAGE_TYPE_FIRMWARE);
    _t.insert(uimage_t::UIMAGE_TYPE_SCRIPT);
    _t.insert(uimage_t::UIMAGE_TYPE_FILESYSTEM);
    _t.insert(uimage_t::UIMAGE_TYPE_FLATDT);
    _t.insert(uimage_t::UIMAGE_TYPE_KWBIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_IMXIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_UBLIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_OMAPIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_AISIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_KERNEL_NOLOAD);
    _t.insert(uimage_t::UIMAGE_TYPE_PBLIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_MXSIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_GPIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_ATMELIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_SOCFPGAIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_X86_SETUP);
    _t.insert(uimage_t::UIMAGE_TYPE_LPC32XXIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_LOADABLE);
    _t.insert(uimage_t::UIMAGE_TYPE_RKIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_RKSD);
    _t.insert(uimage_t::UIMAGE_TYPE_RKSPI);
    _t.insert(uimage_t::UIMAGE_TYPE_ZYNQIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_ZYNQMPIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_ZYNQMPBIF);
    _t.insert(uimage_t::UIMAGE_TYPE_FPGA);
    _t.insert(uimage_t::UIMAGE_TYPE_VYBRIDIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_TEE);
    _t.insert(uimage_t::UIMAGE_TYPE_FIRMWARE_IVT);
    _t.insert(uimage_t::UIMAGE_TYPE_PMMC);
    _t.insert(uimage_t::UIMAGE_TYPE_STM32IMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_SOCFPGAIMAGE_V1);
    _t.insert(uimage_t::UIMAGE_TYPE_MTKIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_IMX8MIMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_IMX8IMAGE);
    _t.insert(uimage_t::UIMAGE_TYPE_COPRO);
    _t.insert(uimage_t::UIMAGE_TYPE_SUNXI_EGON);
    _t.insert(uimage_t::UIMAGE_TYPE_SUNXI_TOC0);
    _t.insert(uimage_t::UIMAGE_TYPE_FDT_LEGACY);
    _t.insert(uimage_t::UIMAGE_TYPE_RENESAS_SPKG);
    _t.insert(uimage_t::UIMAGE_TYPE_STARFIVE_SPL);
    _t.insert(uimage_t::UIMAGE_TYPE_TFA_BL31);
    _t.insert(uimage_t::UIMAGE_TYPE_STM32IMAGE_V2);
    _t.insert(uimage_t::UIMAGE_TYPE_AMLIMAGE);
    return _t;
}
const std::set<uimage_t::uimage_type_t> uimage_t::_values_uimage_type_t = uimage_t::_build_values_uimage_type_t();
bool uimage_t::_is_defined_uimage_type_t(uimage_t::uimage_type_t v) {
    return uimage_t::_values_uimage_type_t.find(v) != uimage_t::_values_uimage_type_t.end();
}

uimage_t::uimage_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, uimage_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void uimage_t::_read() {
    m_header = new uheader_t(m__io, this, m__root);
    m_data = m__io->read_bytes(header()->len_image());
}

uimage_t::~uimage_t() {
    _clean_up();
}

void uimage_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
}

uimage_t::asus_firmware_information_t::asus_firmware_information_t(kaitai::kstream* p__io, uimage_t::name_or_asus_info_t* p__parent, uimage_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_kernel_version = 0;
    m_fs_version = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void uimage_t::asus_firmware_information_t::_read() {
    m_kernel_version = new version_t(m__io, this, m__root);
    m_fs_version = new version_t(m__io, this, m__root);
    m_product_id = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(12), 0, false), "UTF-8");
    m_extra_info = m__io->read_bytes(16);
}

uimage_t::asus_firmware_information_t::~asus_firmware_information_t() {
    _clean_up();
}

void uimage_t::asus_firmware_information_t::_clean_up() {
    if (m_kernel_version) {
        delete m_kernel_version; m_kernel_version = 0;
    }
    if (m_fs_version) {
        delete m_fs_version; m_fs_version = 0;
    }
}

uimage_t::name_or_asus_info_t::name_or_asus_info_t(kaitai::kstream* p__io, uimage_t::uheader_t* p__parent, uimage_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_asus_info = 0;
    f_byte0 = false;
    f_byte4 = false;
    f_has_asus_info = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        m_asus_info = new asus_firmware_information_t(m__io, this, m__root);
    }
}

uimage_t::name_or_asus_info_t::~name_or_asus_info_t() {
    _clean_up();
}

void uimage_t::name_or_asus_info_t::_clean_up() {
    if (!n_name) {
    }
    if (!n_asus_info) {
        if (m_asus_info) {
            delete m_asus_info; m_asus_info = 0;
        }
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
    m_name_or_asus_info = 0;
    m__io__raw_name_or_asus_info = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m__io__raw_name_or_asus_info = new kaitai::kstream(m__raw_name_or_asus_info);
    m_name_or_asus_info = new name_or_asus_info_t(m__io__raw_name_or_asus_info, this, m__root);
}

uimage_t::uheader_t::~uheader_t() {
    _clean_up();
}

void uimage_t::uheader_t::_clean_up() {
    if (m__io__raw_name_or_asus_info) {
        delete m__io__raw_name_or_asus_info; m__io__raw_name_or_asus_info = 0;
    }
    if (m_name_or_asus_info) {
        delete m_name_or_asus_info; m_name_or_asus_info = 0;
    }
}

uimage_t::version_t::version_t(kaitai::kstream* p__io, uimage_t::asus_firmware_information_t* p__parent, uimage_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
