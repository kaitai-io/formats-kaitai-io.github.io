// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "saints_row_2_vpp_pc.h"
#include "kaitai/exceptions.h"

saints_row_2_vpp_pc_t::saints_row_2_vpp_pc_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, saints_row_2_vpp_pc_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_filenames = 0;
    m__io__raw_filenames = 0;
    m_files = 0;
    m__io__raw_files = 0;
    m_extensions = 0;
    m__io__raw_extensions = 0;
    f_filenames = false;
    f_ofs_extensions = false;
    f_files = false;
    f_data_start = false;
    f_extensions = false;
    f_ofs_filenames = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void saints_row_2_vpp_pc_t::_read() {
    m_magic = m__io->read_bytes(5);
    if (!(magic() == std::string("\xCE\x0A\x89\x51\x04", 5))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xCE\x0A\x89\x51\x04", 5), magic(), _io(), std::string("/seq/0"));
    }
    m_pad1 = m__io->read_bytes(335);
    m_num_files = m__io->read_s4le();
    m_container_size = m__io->read_s4le();
    m_len_offsets = m__io->read_s4le();
    m_len_filenames = m__io->read_s4le();
    m_len_extensions = m__io->read_s4le();
    m_smth5 = m__io->read_s4le();
    m_smth6 = m__io->read_s4le();
    m_smth7 = m__io->read_s4le();
    m_smth8 = m__io->read_s4le();
    m_smth9 = m__io->read_s4le();
}

saints_row_2_vpp_pc_t::~saints_row_2_vpp_pc_t() {
    _clean_up();
}

void saints_row_2_vpp_pc_t::_clean_up() {
    if (f_filenames) {
        if (m__io__raw_filenames) {
            delete m__io__raw_filenames; m__io__raw_filenames = 0;
        }
        if (m_filenames) {
            delete m_filenames; m_filenames = 0;
        }
    }
    if (f_files) {
        if (m__io__raw_files) {
            delete m__io__raw_files; m__io__raw_files = 0;
        }
        if (m_files) {
            delete m_files; m_files = 0;
        }
    }
    if (f_extensions) {
        if (m__io__raw_extensions) {
            delete m__io__raw_extensions; m__io__raw_extensions = 0;
        }
        if (m_extensions) {
            delete m_extensions; m_extensions = 0;
        }
    }
}

saints_row_2_vpp_pc_t::offsets_t::offsets_t(kaitai::kstream* p__io, saints_row_2_vpp_pc_t* p__parent, saints_row_2_vpp_pc_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void saints_row_2_vpp_pc_t::offsets_t::_read() {
    m_entries = new std::vector<offset_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new offset_t(m__io, this, m__root));
            i++;
        }
    }
}

saints_row_2_vpp_pc_t::offsets_t::~offsets_t() {
    _clean_up();
}

void saints_row_2_vpp_pc_t::offsets_t::_clean_up() {
    if (m_entries) {
        for (std::vector<offset_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

saints_row_2_vpp_pc_t::offsets_t::offset_t::offset_t(kaitai::kstream* p__io, saints_row_2_vpp_pc_t::offsets_t* p__parent, saints_row_2_vpp_pc_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_filename = false;
    f_ext = false;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void saints_row_2_vpp_pc_t::offsets_t::offset_t::_read() {
    m_name_ofs = m__io->read_u4le();
    m_ext_ofs = m__io->read_u4le();
    m_smth2 = m__io->read_s4le();
    m_ofs_body = m__io->read_s4le();
    m_len_body = m__io->read_s4le();
    m_always_minus_1 = m__io->read_s4le();
    m_always_zero = m__io->read_s4le();
}

saints_row_2_vpp_pc_t::offsets_t::offset_t::~offset_t() {
    _clean_up();
}

void saints_row_2_vpp_pc_t::offsets_t::offset_t::_clean_up() {
    if (f_filename) {
    }
    if (f_ext) {
    }
    if (f_body) {
    }
}

std::string saints_row_2_vpp_pc_t::offsets_t::offset_t::filename() {
    if (f_filename)
        return m_filename;
    kaitai::kstream *io = _root()->filenames()->_io();
    std::streampos _pos = io->pos();
    io->seek(name_ofs());
    m_filename = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
    io->seek(_pos);
    f_filename = true;
    return m_filename;
}

std::string saints_row_2_vpp_pc_t::offsets_t::offset_t::ext() {
    if (f_ext)
        return m_ext;
    kaitai::kstream *io = _root()->extensions()->_io();
    std::streampos _pos = io->pos();
    io->seek(ext_ofs());
    m_ext = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
    io->seek(_pos);
    f_ext = true;
    return m_ext;
}

std::string saints_row_2_vpp_pc_t::offsets_t::offset_t::body() {
    if (f_body)
        return m_body;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek((_root()->data_start() + ofs_body()));
    m_body = io->read_bytes(len_body());
    io->seek(_pos);
    f_body = true;
    return m_body;
}

saints_row_2_vpp_pc_t::strings_t::strings_t(kaitai::kstream* p__io, saints_row_2_vpp_pc_t* p__parent, saints_row_2_vpp_pc_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void saints_row_2_vpp_pc_t::strings_t::_read() {
    m_entries = new std::vector<std::string>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8")));
            i++;
        }
    }
}

saints_row_2_vpp_pc_t::strings_t::~strings_t() {
    _clean_up();
}

void saints_row_2_vpp_pc_t::strings_t::_clean_up() {
    if (m_entries) {
        delete m_entries; m_entries = 0;
    }
}

saints_row_2_vpp_pc_t::strings_t* saints_row_2_vpp_pc_t::filenames() {
    if (f_filenames)
        return m_filenames;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_filenames());
    m__raw_filenames = m__io->read_bytes(len_filenames());
    m__io__raw_filenames = new kaitai::kstream(m__raw_filenames);
    m_filenames = new strings_t(m__io__raw_filenames, this, m__root);
    m__io->seek(_pos);
    f_filenames = true;
    return m_filenames;
}

int32_t saints_row_2_vpp_pc_t::ofs_extensions() {
    if (f_ofs_extensions)
        return m_ofs_extensions;
    m_ofs_extensions = (((ofs_filenames() + len_filenames()) & 4294965248UL) + 2048);
    f_ofs_extensions = true;
    return m_ofs_extensions;
}

saints_row_2_vpp_pc_t::offsets_t* saints_row_2_vpp_pc_t::files() {
    if (f_files)
        return m_files;
    std::streampos _pos = m__io->pos();
    m__io->seek(2048);
    m__raw_files = m__io->read_bytes(len_offsets());
    m__io__raw_files = new kaitai::kstream(m__raw_files);
    m_files = new offsets_t(m__io__raw_files, this, m__root);
    m__io->seek(_pos);
    f_files = true;
    return m_files;
}

int32_t saints_row_2_vpp_pc_t::data_start() {
    if (f_data_start)
        return m_data_start;
    m_data_start = (((ofs_extensions() + len_extensions()) & 4294965248UL) + 2048);
    f_data_start = true;
    return m_data_start;
}

saints_row_2_vpp_pc_t::strings_t* saints_row_2_vpp_pc_t::extensions() {
    if (f_extensions)
        return m_extensions;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_extensions());
    m__raw_extensions = m__io->read_bytes(len_extensions());
    m__io__raw_extensions = new kaitai::kstream(m__raw_extensions);
    m_extensions = new strings_t(m__io__raw_extensions, this, m__root);
    m__io->seek(_pos);
    f_extensions = true;
    return m_extensions;
}

int32_t saints_row_2_vpp_pc_t::ofs_filenames() {
    if (f_ofs_filenames)
        return m_ofs_filenames;
    m_ofs_filenames = (((2048 + len_offsets()) & 4294965248UL) + 2048);
    f_ofs_filenames = true;
    return m_ofs_filenames;
}
