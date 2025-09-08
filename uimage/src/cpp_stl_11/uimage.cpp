// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "uimage.h"
#include "kaitai/exceptions.h"
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

uimage_t::uheader_t::uheader_t(kaitai::kstream* p__io, uimage_t* p__parent, uimage_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void uimage_t::uheader_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x27\x05\x19\x56", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x27\x05\x19\x56", 4), m_magic, m__io, std::string("/types/uheader/seq/0"));
    }
    m_header_crc = m__io->read_u4be();
    m_timestamp = m__io->read_u4be();
    m_len_image = m__io->read_u4be();
    m_load_address = m__io->read_u4be();
    m_entry_address = m__io->read_u4be();
    m_data_crc = m__io->read_u4be();
    m_os_type = static_cast<uimage_t::uimage_os_t>(m__io->read_u1());
    m_architecture = static_cast<uimage_t::uimage_arch_t>(m__io->read_u1());
    m_image_type = static_cast<uimage_t::uimage_type_t>(m__io->read_u1());
    m_compression_type = static_cast<uimage_t::uimage_comp_t>(m__io->read_u1());
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(32), 0, false), "UTF-8");
}

uimage_t::uheader_t::~uheader_t() {
    _clean_up();
}

void uimage_t::uheader_t::_clean_up() {
}
