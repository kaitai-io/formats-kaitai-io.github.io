// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pif.h"
#include "kaitai/exceptions.h"

pif_t::pif_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, pif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_file_header = 0;
    m_info_header = 0;
    m_color_table = 0;
    m__io__raw_color_table = 0;
    f_image_data = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void pif_t::_read() {
    m_file_header = new pif_header_t(m__io, this, m__root);
    m_info_header = new information_header_t(m__io, this, m__root);
    n_color_table = true;
    if (info_header()->uses_indexed_mode()) {
        n_color_table = false;
        m__raw_color_table = m__io->read_bytes(info_header()->len_color_table());
        m__io__raw_color_table = new kaitai::kstream(m__raw_color_table);
        m_color_table = new color_table_data_t(m__io__raw_color_table, this, m__root);
    }
}

pif_t::~pif_t() {
    _clean_up();
}

void pif_t::_clean_up() {
    if (m_file_header) {
        delete m_file_header; m_file_header = 0;
    }
    if (m_info_header) {
        delete m_info_header; m_info_header = 0;
    }
    if (!n_color_table) {
        if (m__io__raw_color_table) {
            delete m__io__raw_color_table; m__io__raw_color_table = 0;
        }
        if (m_color_table) {
            delete m_color_table; m_color_table = 0;
        }
    }
    if (f_image_data) {
    }
}

pif_t::pif_header_t::pif_header_t(kaitai::kstream* p__io, pif_t* p__parent, pif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_ofs_image_data_min = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void pif_t::pif_header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x50\x49\x46\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x50\x49\x46\x00", 4), magic(), _io(), std::string("/types/pif_header/seq/0"));
    }
    m_len_file = m__io->read_u4le();
    if (!(len_file() >= ofs_image_data_min())) {
        throw kaitai::validation_less_than_error<uint32_t>(ofs_image_data_min(), len_file(), _io(), std::string("/types/pif_header/seq/1"));
    }
    m_ofs_image_data = m__io->read_u4le();
    if (!(ofs_image_data() >= ofs_image_data_min())) {
        throw kaitai::validation_less_than_error<uint32_t>(ofs_image_data_min(), ofs_image_data(), _io(), std::string("/types/pif_header/seq/2"));
    }
    if (!(ofs_image_data() <= len_file())) {
        throw kaitai::validation_greater_than_error<uint32_t>(len_file(), ofs_image_data(), _io(), std::string("/types/pif_header/seq/2"));
    }
}

pif_t::pif_header_t::~pif_header_t() {
    _clean_up();
}

void pif_t::pif_header_t::_clean_up() {
}

int32_t pif_t::pif_header_t::ofs_image_data_min() {
    if (f_ofs_image_data_min)
        return m_ofs_image_data_min;
    m_ofs_image_data_min = (12 + 16);
    f_ofs_image_data_min = true;
    return m_ofs_image_data_min;
}

pif_t::information_header_t::information_header_t(kaitai::kstream* p__io, pif_t* p__parent, pif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len_color_table_full = false;
    f_len_color_table_max = false;
    f_num_color_table_entries = false;
    f_len_color_table_entry = false;
    f_uses_indexed_mode = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void pif_t::information_header_t::_read() {
    m_image_type = static_cast<pif_t::image_type_t>(m__io->read_u2le());
    if (!( ((image_type() == pif_t::IMAGE_TYPE_RGB888) || (image_type() == pif_t::IMAGE_TYPE_RGB565) || (image_type() == pif_t::IMAGE_TYPE_RGB332) || (image_type() == pif_t::IMAGE_TYPE_RGB16C) || (image_type() == pif_t::IMAGE_TYPE_BLACK_WHITE) || (image_type() == pif_t::IMAGE_TYPE_INDEXED_RGB888) || (image_type() == pif_t::IMAGE_TYPE_INDEXED_RGB565) || (image_type() == pif_t::IMAGE_TYPE_INDEXED_RGB332)) )) {
        throw kaitai::validation_not_any_of_error<pif_t::image_type_t>(image_type(), _io(), std::string("/types/information_header/seq/0"));
    }
    m_bits_per_pixel = m__io->read_u2le();
    {
        uint16_t _ = bits_per_pixel();
        if (!(((image_type() == pif_t::IMAGE_TYPE_RGB888) ? (_ == 24) : (((image_type() == pif_t::IMAGE_TYPE_RGB565) ? (_ == 16) : (((image_type() == pif_t::IMAGE_TYPE_RGB332) ? (_ == 8) : (((image_type() == pif_t::IMAGE_TYPE_RGB16C) ? (_ == 4) : (((image_type() == pif_t::IMAGE_TYPE_BLACK_WHITE) ? (_ == 1) : (((uses_indexed_mode()) ? (_ <= 8) : (true)))))))))))))) {
            throw kaitai::validation_expr_error<uint16_t>(bits_per_pixel(), _io(), std::string("/types/information_header/seq/1"));
        }
    }
    m_width = m__io->read_u2le();
    m_height = m__io->read_u2le();
    m_len_image_data = m__io->read_u4le();
    if (!(len_image_data() <= (_root()->file_header()->len_file() - _root()->file_header()->ofs_image_data()))) {
        throw kaitai::validation_greater_than_error<uint32_t>((_root()->file_header()->len_file() - _root()->file_header()->ofs_image_data()), len_image_data(), _io(), std::string("/types/information_header/seq/4"));
    }
    m_len_color_table = m__io->read_u2le();
    if (!(len_color_table() >= ((uses_indexed_mode()) ? ((len_color_table_entry() * 1)) : (0)))) {
        throw kaitai::validation_less_than_error<uint16_t>(((uses_indexed_mode()) ? ((len_color_table_entry() * 1)) : (0)), len_color_table(), _io(), std::string("/types/information_header/seq/5"));
    }
    if (!(len_color_table() <= ((uses_indexed_mode()) ? (((len_color_table_max() < len_color_table_full()) ? (len_color_table_max()) : (len_color_table_full()))) : (0)))) {
        throw kaitai::validation_greater_than_error<uint16_t>(((uses_indexed_mode()) ? (((len_color_table_max() < len_color_table_full()) ? (len_color_table_max()) : (len_color_table_full()))) : (0)), len_color_table(), _io(), std::string("/types/information_header/seq/5"));
    }
    m_compression = static_cast<pif_t::compression_type_t>(m__io->read_u2le());
    if (!( ((compression() == pif_t::COMPRESSION_TYPE_NONE) || (compression() == pif_t::COMPRESSION_TYPE_RLE)) )) {
        throw kaitai::validation_not_any_of_error<pif_t::compression_type_t>(compression(), _io(), std::string("/types/information_header/seq/6"));
    }
}

pif_t::information_header_t::~information_header_t() {
    _clean_up();
}

void pif_t::information_header_t::_clean_up() {
}

int32_t pif_t::information_header_t::len_color_table_full() {
    if (f_len_color_table_full)
        return m_len_color_table_full;
    m_len_color_table_full = (len_color_table_entry() * (1 << bits_per_pixel()));
    f_len_color_table_full = true;
    return m_len_color_table_full;
}

int32_t pif_t::information_header_t::len_color_table_max() {
    if (f_len_color_table_max)
        return m_len_color_table_max;
    m_len_color_table_max = (_root()->file_header()->ofs_image_data() - _root()->file_header()->ofs_image_data_min());
    f_len_color_table_max = true;
    return m_len_color_table_max;
}

int32_t pif_t::information_header_t::num_color_table_entries() {
    if (f_num_color_table_entries)
        return m_num_color_table_entries;
    n_num_color_table_entries = true;
    if (uses_indexed_mode()) {
        n_num_color_table_entries = false;
        m_num_color_table_entries = (len_color_table() / len_color_table_entry());
    }
    f_num_color_table_entries = true;
    return m_num_color_table_entries;
}

int8_t pif_t::information_header_t::len_color_table_entry() {
    if (f_len_color_table_entry)
        return m_len_color_table_entry;
    m_len_color_table_entry = ((image_type() == pif_t::IMAGE_TYPE_INDEXED_RGB888) ? (3) : (((image_type() == pif_t::IMAGE_TYPE_INDEXED_RGB565) ? (2) : (((image_type() == pif_t::IMAGE_TYPE_INDEXED_RGB332) ? (1) : (0))))));
    f_len_color_table_entry = true;
    return m_len_color_table_entry;
}

bool pif_t::information_header_t::uses_indexed_mode() {
    if (f_uses_indexed_mode)
        return m_uses_indexed_mode;
    m_uses_indexed_mode = len_color_table_entry() != 0;
    f_uses_indexed_mode = true;
    return m_uses_indexed_mode;
}

pif_t::color_table_data_t::color_table_data_t(kaitai::kstream* p__io, pif_t* p__parent, pif_t* p__root) : kaitai::kstruct(p__io) {
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

void pif_t::color_table_data_t::_read() {
    m_entries = new std::vector<int32_t>();
    const int l_entries = _root()->info_header()->num_color_table_entries();
    for (int i = 0; i < l_entries; i++) {
        switch (_root()->info_header()->image_type()) {
        case pif_t::IMAGE_TYPE_INDEXED_RGB888: {
            m_entries->push_back(m__io->read_bits_int_le(24));
            break;
        }
        case pif_t::IMAGE_TYPE_INDEXED_RGB565: {
            m_entries->push_back(m__io->read_bits_int_le(16));
            break;
        }
        case pif_t::IMAGE_TYPE_INDEXED_RGB332: {
            m_entries->push_back(m__io->read_bits_int_le(8));
            break;
        }
        }
    }
}

pif_t::color_table_data_t::~color_table_data_t() {
    _clean_up();
}

void pif_t::color_table_data_t::_clean_up() {
    if (m_entries) {
        delete m_entries; m_entries = 0;
    }
}

std::string pif_t::image_data() {
    if (f_image_data)
        return m_image_data;
    std::streampos _pos = m__io->pos();
    m__io->seek(file_header()->ofs_image_data());
    m_image_data = m__io->read_bytes(info_header()->len_image_data());
    m__io->seek(_pos);
    f_image_data = true;
    return m_image_data;
}
