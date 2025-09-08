// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "uimage.h"
#include "kaitai/exceptions.h"
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

uimage_t::uheader_t::uheader_t(kaitai::kstream* p__io, uimage_t* p__parent, uimage_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
