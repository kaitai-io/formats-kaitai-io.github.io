// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pif.h"
#include "kaitai/exceptions.h"
const std::set<pif_t::compression_type_t> pif_t::_values_compression_type_t{
    pif_t::COMPRESSION_TYPE_NONE,
    pif_t::COMPRESSION_TYPE_RLE,
};
bool pif_t::_is_defined_compression_type_t(pif_t::compression_type_t v) {
    return pif_t::_values_compression_type_t.find(v) != pif_t::_values_compression_type_t.end();
}
const std::set<pif_t::image_type_t> pif_t::_values_image_type_t{
    pif_t::IMAGE_TYPE_RGB332,
    pif_t::IMAGE_TYPE_RGB888,
    pif_t::IMAGE_TYPE_INDEXED_RGB332,
    pif_t::IMAGE_TYPE_INDEXED_RGB565,
    pif_t::IMAGE_TYPE_INDEXED_RGB888,
    pif_t::IMAGE_TYPE_BLACK_WHITE,
    pif_t::IMAGE_TYPE_RGB16C,
    pif_t::IMAGE_TYPE_RGB565,
};
bool pif_t::_is_defined_image_type_t(pif_t::image_type_t v) {
    return pif_t::_values_image_type_t.find(v) != pif_t::_values_image_type_t.end();
}

pif_t::pif_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, pif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_file_header = nullptr;
    m_info_header = nullptr;
    m_color_table = nullptr;
    m__io__raw_color_table = nullptr;
    f_image_data = false;
    _read();
}

void pif_t::_read() {
    m_file_header = std::unique_ptr<pif_header_t>(new pif_header_t(m__io, this, m__root));
    m_info_header = std::unique_ptr<information_header_t>(new information_header_t(m__io, this, m__root));
    n_color_table = true;
    if (info_header()->uses_indexed_mode()) {
        n_color_table = false;
        m__raw_color_table = m__io->read_bytes(info_header()->len_color_table());
        m__io__raw_color_table = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_color_table));
        m_color_table = std::unique_ptr<color_table_data_t>(new color_table_data_t(m__io__raw_color_table.get(), this, m__root));
    }
}

pif_t::~pif_t() {
    _clean_up();
}

void pif_t::_clean_up() {
    if (!n_color_table) {
    }
    if (f_image_data) {
    }
}

pif_t::color_table_data_t::color_table_data_t(kaitai::kstream* p__io, pif_t* p__parent, pif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void pif_t::color_table_data_t::_read() {
    m_entries = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            switch (_root()->info_header()->image_type()) {
            case pif_t::IMAGE_TYPE_INDEXED_RGB332: {
                m_entries->push_back(std::move(m__io->read_bits_int_le(8)));
                break;
            }
            case pif_t::IMAGE_TYPE_INDEXED_RGB565: {
                m_entries->push_back(std::move(m__io->read_bits_int_le(16)));
                break;
            }
            case pif_t::IMAGE_TYPE_INDEXED_RGB888: {
                m_entries->push_back(std::move(m__io->read_bits_int_le(24)));
                break;
            }
            }
            i++;
        }
    }
}

pif_t::color_table_data_t::~color_table_data_t() {
    _clean_up();
}

void pif_t::color_table_data_t::_clean_up() {
}

pif_t::information_header_t::information_header_t(kaitai::kstream* p__io, pif_t* p__parent, pif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len_color_table_entry = false;
    f_len_color_table_full = false;
    f_len_color_table_max = false;
    f_uses_indexed_mode = false;
    _read();
}

void pif_t::information_header_t::_read() {
    m_image_type = static_cast<pif_t::image_type_t>(m__io->read_u2le());
    if (!( ((m_image_type == pif_t::IMAGE_TYPE_RGB888) || (m_image_type == pif_t::IMAGE_TYPE_RGB565) || (m_image_type == pif_t::IMAGE_TYPE_RGB332) || (m_image_type == pif_t::IMAGE_TYPE_RGB16C) || (m_image_type == pif_t::IMAGE_TYPE_BLACK_WHITE) || (m_image_type == pif_t::IMAGE_TYPE_INDEXED_RGB888) || (m_image_type == pif_t::IMAGE_TYPE_INDEXED_RGB565) || (m_image_type == pif_t::IMAGE_TYPE_INDEXED_RGB332)) )) {
        throw kaitai::validation_not_any_of_error<pif_t::image_type_t>(m_image_type, m__io, std::string("/types/information_header/seq/0"));
    }
    m_bits_per_pixel = m__io->read_u2le();
    {
        uint16_t _ = m_bits_per_pixel;
        if (!(((image_type() == pif_t::IMAGE_TYPE_RGB888) ? (_ == 24) : (((image_type() == pif_t::IMAGE_TYPE_RGB565) ? (_ == 16) : (((image_type() == pif_t::IMAGE_TYPE_RGB332) ? (_ == 8) : (((image_type() == pif_t::IMAGE_TYPE_RGB16C) ? (_ == 4) : (((image_type() == pif_t::IMAGE_TYPE_BLACK_WHITE) ? (_ == 1) : (((uses_indexed_mode()) ? (_ <= 8) : (true)))))))))))))) {
            throw kaitai::validation_expr_error<uint16_t>(m_bits_per_pixel, m__io, std::string("/types/information_header/seq/1"));
        }
    }
    m_width = m__io->read_u2le();
    m_height = m__io->read_u2le();
    m_len_image_data = m__io->read_u4le();
    if (!(m_len_image_data <= _root()->file_header()->len_file() - _root()->file_header()->ofs_image_data())) {
        throw kaitai::validation_greater_than_error<uint32_t>(_root()->file_header()->len_file() - _root()->file_header()->ofs_image_data(), m_len_image_data, m__io, std::string("/types/information_header/seq/4"));
    }
    m_len_color_table = m__io->read_u2le();
    if (!(m_len_color_table >= ((uses_indexed_mode()) ? (len_color_table_entry() * 1) : (0)))) {
        throw kaitai::validation_less_than_error<uint16_t>(((uses_indexed_mode()) ? (len_color_table_entry() * 1) : (0)), m_len_color_table, m__io, std::string("/types/information_header/seq/5"));
    }
    if (!(m_len_color_table <= ((uses_indexed_mode()) ? (((len_color_table_max() < len_color_table_full()) ? (len_color_table_max()) : (len_color_table_full()))) : (0)))) {
        throw kaitai::validation_greater_than_error<uint16_t>(((uses_indexed_mode()) ? (((len_color_table_max() < len_color_table_full()) ? (len_color_table_max()) : (len_color_table_full()))) : (0)), m_len_color_table, m__io, std::string("/types/information_header/seq/5"));
    }
    m_compression = static_cast<pif_t::compression_type_t>(m__io->read_u2le());
    if (!( ((m_compression == pif_t::COMPRESSION_TYPE_NONE) || (m_compression == pif_t::COMPRESSION_TYPE_RLE)) )) {
        throw kaitai::validation_not_any_of_error<pif_t::compression_type_t>(m_compression, m__io, std::string("/types/information_header/seq/6"));
    }
}

pif_t::information_header_t::~information_header_t() {
    _clean_up();
}

void pif_t::information_header_t::_clean_up() {
}

int8_t pif_t::information_header_t::len_color_table_entry() {
    if (f_len_color_table_entry)
        return m_len_color_table_entry;
    f_len_color_table_entry = true;
    m_len_color_table_entry = ((image_type() == pif_t::IMAGE_TYPE_INDEXED_RGB888) ? (3) : (((image_type() == pif_t::IMAGE_TYPE_INDEXED_RGB565) ? (2) : (((image_type() == pif_t::IMAGE_TYPE_INDEXED_RGB332) ? (1) : (0))))));
    return m_len_color_table_entry;
}

int32_t pif_t::information_header_t::len_color_table_full() {
    if (f_len_color_table_full)
        return m_len_color_table_full;
    f_len_color_table_full = true;
    m_len_color_table_full = len_color_table_entry() * (1 << bits_per_pixel());
    return m_len_color_table_full;
}

int32_t pif_t::information_header_t::len_color_table_max() {
    if (f_len_color_table_max)
        return m_len_color_table_max;
    f_len_color_table_max = true;
    m_len_color_table_max = _root()->file_header()->ofs_image_data() - _root()->file_header()->ofs_image_data_min();
    return m_len_color_table_max;
}

bool pif_t::information_header_t::uses_indexed_mode() {
    if (f_uses_indexed_mode)
        return m_uses_indexed_mode;
    f_uses_indexed_mode = true;
    m_uses_indexed_mode = len_color_table_entry() != 0;
    return m_uses_indexed_mode;
}

pif_t::pif_header_t::pif_header_t(kaitai::kstream* p__io, pif_t* p__parent, pif_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_ofs_image_data_min = false;
    _read();
}

void pif_t::pif_header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x50\x49\x46\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x50\x49\x46\x00", 4), m_magic, m__io, std::string("/types/pif_header/seq/0"));
    }
    m_len_file = m__io->read_u4le();
    if (!(m_len_file >= ofs_image_data_min())) {
        throw kaitai::validation_less_than_error<uint32_t>(ofs_image_data_min(), m_len_file, m__io, std::string("/types/pif_header/seq/1"));
    }
    m_ofs_image_data = m__io->read_u4le();
    if (!(m_ofs_image_data >= ofs_image_data_min())) {
        throw kaitai::validation_less_than_error<uint32_t>(ofs_image_data_min(), m_ofs_image_data, m__io, std::string("/types/pif_header/seq/2"));
    }
    if (!(m_ofs_image_data <= len_file())) {
        throw kaitai::validation_greater_than_error<uint32_t>(len_file(), m_ofs_image_data, m__io, std::string("/types/pif_header/seq/2"));
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
    f_ofs_image_data_min = true;
    m_ofs_image_data_min = 12 + 16;
    return m_ofs_image_data_min;
}

std::string pif_t::image_data() {
    if (f_image_data)
        return m_image_data;
    f_image_data = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(file_header()->ofs_image_data());
    m_image_data = m__io->read_bytes(info_header()->len_image_data());
    m__io->seek(_pos);
    return m_image_data;
}
