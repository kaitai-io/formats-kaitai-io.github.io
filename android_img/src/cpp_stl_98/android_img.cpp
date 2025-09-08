// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "android_img.h"
#include "kaitai/exceptions.h"

android_img_t::android_img_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_img_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_kernel = 0;
    m_ramdisk = 0;
    m_second = 0;
    m_os_version = 0;
    m_recovery_dtbo = 0;
    m_dtb = 0;
    f_base = false;
    f_dtb_img = false;
    f_dtb_offset = false;
    f_kernel_img = false;
    f_kernel_offset = false;
    f_ramdisk_img = false;
    f_ramdisk_offset = false;
    f_recovery_dtbo_img = false;
    f_second_img = false;
    f_second_offset = false;
    f_tags_offset = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_img_t::_read() {
    m_magic = m__io->read_bytes(8);
    if (!(m_magic == std::string("\x41\x4E\x44\x52\x4F\x49\x44\x21", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x41\x4E\x44\x52\x4F\x49\x44\x21", 8), m_magic, m__io, std::string("/seq/0"));
    }
    m_kernel = new load_t(m__io, this, m__root);
    m_ramdisk = new load_t(m__io, this, m__root);
    m_second = new load_t(m__io, this, m__root);
    m_tags_load = m__io->read_u4le();
    m_page_size = m__io->read_u4le();
    m_header_version = m__io->read_u4le();
    m_os_version = new os_version_t(m__io, this, m__root);
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(16), 0, false), "ASCII");
    m_cmdline = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(512), 0, false), "ASCII");
    m_sha = m__io->read_bytes(32);
    m_extra_cmdline = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(1024), 0, false), "ASCII");
    n_recovery_dtbo = true;
    if (header_version() > 0) {
        n_recovery_dtbo = false;
        m_recovery_dtbo = new size_offset_t(m__io, this, m__root);
    }
    n_boot_header_size = true;
    if (header_version() > 0) {
        n_boot_header_size = false;
        m_boot_header_size = m__io->read_u4le();
    }
    n_dtb = true;
    if (header_version() > 1) {
        n_dtb = false;
        m_dtb = new load_long_t(m__io, this, m__root);
    }
}

android_img_t::~android_img_t() {
    _clean_up();
}

void android_img_t::_clean_up() {
    if (m_kernel) {
        delete m_kernel; m_kernel = 0;
    }
    if (m_ramdisk) {
        delete m_ramdisk; m_ramdisk = 0;
    }
    if (m_second) {
        delete m_second; m_second = 0;
    }
    if (m_os_version) {
        delete m_os_version; m_os_version = 0;
    }
    if (!n_recovery_dtbo) {
        if (m_recovery_dtbo) {
            delete m_recovery_dtbo; m_recovery_dtbo = 0;
        }
    }
    if (!n_boot_header_size) {
    }
    if (!n_dtb) {
        if (m_dtb) {
            delete m_dtb; m_dtb = 0;
        }
    }
    if (f_dtb_img && !n_dtb_img) {
    }
    if (f_kernel_img) {
    }
    if (f_ramdisk_img && !n_ramdisk_img) {
    }
    if (f_recovery_dtbo_img && !n_recovery_dtbo_img) {
    }
    if (f_second_img && !n_second_img) {
    }
}

android_img_t::load_t::load_t(kaitai::kstream* p__io, android_img_t* p__parent, android_img_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_img_t::load_t::_read() {
    m_size = m__io->read_u4le();
    m_addr = m__io->read_u4le();
}

android_img_t::load_t::~load_t() {
    _clean_up();
}

void android_img_t::load_t::_clean_up() {
}

android_img_t::load_long_t::load_long_t(kaitai::kstream* p__io, android_img_t* p__parent, android_img_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_img_t::load_long_t::_read() {
    m_size = m__io->read_u4le();
    m_addr = m__io->read_u8le();
}

android_img_t::load_long_t::~load_long_t() {
    _clean_up();
}

void android_img_t::load_long_t::_clean_up() {
}

android_img_t::os_version_t::os_version_t(kaitai::kstream* p__io, android_img_t* p__parent, android_img_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_major = false;
    f_minor = false;
    f_month = false;
    f_patch = false;
    f_year = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_img_t::os_version_t::_read() {
    m_version = m__io->read_u4le();
}

android_img_t::os_version_t::~os_version_t() {
    _clean_up();
}

void android_img_t::os_version_t::_clean_up() {
}

int32_t android_img_t::os_version_t::major() {
    if (f_major)
        return m_major;
    f_major = true;
    m_major = version() >> 25 & 127;
    return m_major;
}

int32_t android_img_t::os_version_t::minor() {
    if (f_minor)
        return m_minor;
    f_minor = true;
    m_minor = version() >> 18 & 127;
    return m_minor;
}

int32_t android_img_t::os_version_t::month() {
    if (f_month)
        return m_month;
    f_month = true;
    m_month = version() & 15;
    return m_month;
}

int32_t android_img_t::os_version_t::patch() {
    if (f_patch)
        return m_patch;
    f_patch = true;
    m_patch = version() >> 11 & 127;
    return m_patch;
}

int32_t android_img_t::os_version_t::year() {
    if (f_year)
        return m_year;
    f_year = true;
    m_year = (version() >> 4 & 127) + 2000;
    return m_year;
}

android_img_t::size_offset_t::size_offset_t(kaitai::kstream* p__io, android_img_t* p__parent, android_img_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_img_t::size_offset_t::_read() {
    m_size = m__io->read_u4le();
    m_offset = m__io->read_u8le();
}

android_img_t::size_offset_t::~size_offset_t() {
    _clean_up();
}

void android_img_t::size_offset_t::_clean_up() {
}

int32_t android_img_t::base() {
    if (f_base)
        return m_base;
    f_base = true;
    m_base = kernel()->addr() - 32768;
    return m_base;
}

std::string android_img_t::dtb_img() {
    if (f_dtb_img)
        return m_dtb_img;
    f_dtb_img = true;
    n_dtb_img = true;
    if ( ((header_version() > 1) && (dtb()->size() > 0)) ) {
        n_dtb_img = false;
        std::streampos _pos = m__io->pos();
        m__io->seek((((((((page_size() + kernel()->size()) + ramdisk()->size()) + second()->size()) + recovery_dtbo()->size()) + page_size()) - 1) / page_size()) * page_size());
        m_dtb_img = m__io->read_bytes(dtb()->size());
        m__io->seek(_pos);
    }
    return m_dtb_img;
}

int32_t android_img_t::dtb_offset() {
    if (f_dtb_offset)
        return m_dtb_offset;
    f_dtb_offset = true;
    n_dtb_offset = true;
    if (header_version() > 1) {
        n_dtb_offset = false;
        m_dtb_offset = ((dtb()->addr() > 0) ? (dtb()->addr() - base()) : (0));
    }
    return m_dtb_offset;
}

std::string android_img_t::kernel_img() {
    if (f_kernel_img)
        return m_kernel_img;
    f_kernel_img = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(page_size());
    m_kernel_img = m__io->read_bytes(kernel()->size());
    m__io->seek(_pos);
    return m_kernel_img;
}

int32_t android_img_t::kernel_offset() {
    if (f_kernel_offset)
        return m_kernel_offset;
    f_kernel_offset = true;
    m_kernel_offset = kernel()->addr() - base();
    return m_kernel_offset;
}

std::string android_img_t::ramdisk_img() {
    if (f_ramdisk_img)
        return m_ramdisk_img;
    f_ramdisk_img = true;
    n_ramdisk_img = true;
    if (ramdisk()->size() > 0) {
        n_ramdisk_img = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(((((page_size() + kernel()->size()) + page_size()) - 1) / page_size()) * page_size());
        m_ramdisk_img = m__io->read_bytes(ramdisk()->size());
        m__io->seek(_pos);
    }
    return m_ramdisk_img;
}

int32_t android_img_t::ramdisk_offset() {
    if (f_ramdisk_offset)
        return m_ramdisk_offset;
    f_ramdisk_offset = true;
    m_ramdisk_offset = ((ramdisk()->addr() > 0) ? (ramdisk()->addr() - base()) : (0));
    return m_ramdisk_offset;
}

std::string android_img_t::recovery_dtbo_img() {
    if (f_recovery_dtbo_img)
        return m_recovery_dtbo_img;
    f_recovery_dtbo_img = true;
    n_recovery_dtbo_img = true;
    if ( ((header_version() > 0) && (recovery_dtbo()->size() > 0)) ) {
        n_recovery_dtbo_img = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(recovery_dtbo()->offset());
        m_recovery_dtbo_img = m__io->read_bytes(recovery_dtbo()->size());
        m__io->seek(_pos);
    }
    return m_recovery_dtbo_img;
}

std::string android_img_t::second_img() {
    if (f_second_img)
        return m_second_img;
    f_second_img = true;
    n_second_img = true;
    if (second()->size() > 0) {
        n_second_img = false;
        std::streampos _pos = m__io->pos();
        m__io->seek((((((page_size() + kernel()->size()) + ramdisk()->size()) + page_size()) - 1) / page_size()) * page_size());
        m_second_img = m__io->read_bytes(second()->size());
        m__io->seek(_pos);
    }
    return m_second_img;
}

int32_t android_img_t::second_offset() {
    if (f_second_offset)
        return m_second_offset;
    f_second_offset = true;
    m_second_offset = ((second()->addr() > 0) ? (second()->addr() - base()) : (0));
    return m_second_offset;
}

int32_t android_img_t::tags_offset() {
    if (f_tags_offset)
        return m_tags_offset;
    f_tags_offset = true;
    m_tags_offset = tags_load() - base();
    return m_tags_offset;
}
