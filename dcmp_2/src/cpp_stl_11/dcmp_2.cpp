// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dcmp_2.h"
#include "bytes_with_io.h"

dcmp_2_t::dcmp_2_t(uint32_t p_len_decompressed, bytes_with_io_t* p_header_parameters_with_io, kaitai::kstream* p__io, kaitai::kstruct* p__parent, dcmp_2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_len_decompressed = p_len_decompressed;
    m_header_parameters_with_io = p_header_parameters_with_io;
    m_custom_lookup_table = nullptr;
    m__io__raw_data = nullptr;
    m_header_parameters = nullptr;
    f_header_parameters = false;
    f_is_len_decompressed_odd = false;
    f_default_lookup_table = false;
    f_lookup_table = false;
    _read();
}

void dcmp_2_t::_read() {
    n_custom_lookup_table = true;
    if (header_parameters()->flags()->has_custom_lookup_table()) {
        n_custom_lookup_table = false;
        m_custom_lookup_table = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
        const int l_custom_lookup_table = header_parameters()->num_custom_lookup_table_entries();
        for (int i = 0; i < l_custom_lookup_table; i++) {
            m_custom_lookup_table->push_back(std::move(m__io->read_bytes(2)));
        }
    }
    {
        bool on = header_parameters()->flags()->tagged();
        if (on == true) {
            m__raw_data = m__io->read_bytes(((_io()->size() - _io()->pos()) - ((is_len_decompressed_odd()) ? (1) : (0))));
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<tagged_data_t>(new tagged_data_t(m__io__raw_data.get(), this, m__root));
        }
        else {
            m__raw_data = m__io->read_bytes(((_io()->size() - _io()->pos()) - ((is_len_decompressed_odd()) ? (1) : (0))));
            m__io__raw_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data));
            m_data = std::unique_ptr<untagged_data_t>(new untagged_data_t(m__io__raw_data.get(), this, m__root));
        }
    }
    n_last_byte = true;
    if (is_len_decompressed_odd()) {
        n_last_byte = false;
        m_last_byte = m__io->read_bytes(1);
    }
}

dcmp_2_t::~dcmp_2_t() {
    _clean_up();
}

void dcmp_2_t::_clean_up() {
    if (!n_custom_lookup_table) {
    }
    if (!n_last_byte) {
    }
    if (f_header_parameters) {
    }
}

dcmp_2_t::header_parameters_t::header_parameters_t(kaitai::kstream* p__io, dcmp_2_t* p__parent, dcmp_2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = nullptr;
    f_num_custom_lookup_table_entries = false;
    _read();
}

void dcmp_2_t::header_parameters_t::_read() {
    m_unknown = m__io->read_u2be();
    m_num_custom_lookup_table_entries_m1 = m__io->read_u1();
    m_flags = std::unique_ptr<flags_t>(new flags_t(m__io, this, m__root));
}

dcmp_2_t::header_parameters_t::~header_parameters_t() {
    _clean_up();
}

void dcmp_2_t::header_parameters_t::_clean_up() {
}

dcmp_2_t::header_parameters_t::flags_t::flags_t(kaitai::kstream* p__io, dcmp_2_t::header_parameters_t* p__parent, dcmp_2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_as_int = false;
    _read();
}

void dcmp_2_t::header_parameters_t::flags_t::_read() {
    m_reserved = m__io->read_bits_int_be(6);
    m_tagged = m__io->read_bits_int_be(1);
    m_has_custom_lookup_table = m__io->read_bits_int_be(1);
}

dcmp_2_t::header_parameters_t::flags_t::~flags_t() {
    _clean_up();
}

void dcmp_2_t::header_parameters_t::flags_t::_clean_up() {
    if (f_as_int) {
    }
}

uint8_t dcmp_2_t::header_parameters_t::flags_t::as_int() {
    if (f_as_int)
        return m_as_int;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_as_int = m__io->read_u1();
    m__io->seek(_pos);
    f_as_int = true;
    return m_as_int;
}

int32_t dcmp_2_t::header_parameters_t::num_custom_lookup_table_entries() {
    if (f_num_custom_lookup_table_entries)
        return m_num_custom_lookup_table_entries;
    n_num_custom_lookup_table_entries = true;
    if (flags()->has_custom_lookup_table()) {
        n_num_custom_lookup_table_entries = false;
        m_num_custom_lookup_table_entries = (num_custom_lookup_table_entries_m1() + 1);
    }
    f_num_custom_lookup_table_entries = true;
    return m_num_custom_lookup_table_entries;
}

dcmp_2_t::untagged_data_t::untagged_data_t(kaitai::kstream* p__io, dcmp_2_t* p__parent, dcmp_2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_table_references = nullptr;
    _read();
}

void dcmp_2_t::untagged_data_t::_read() {
    m_table_references = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_table_references->push_back(std::move(m__io->read_u1()));
            i++;
        }
    }
}

dcmp_2_t::untagged_data_t::~untagged_data_t() {
    _clean_up();
}

void dcmp_2_t::untagged_data_t::_clean_up() {
}

dcmp_2_t::tagged_data_t::tagged_data_t(kaitai::kstream* p__io, dcmp_2_t* p__parent, dcmp_2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chunks = nullptr;
    _read();
}

void dcmp_2_t::tagged_data_t::_read() {
    m_chunks = std::unique_ptr<std::vector<std::unique_ptr<chunk_t>>>(new std::vector<std::unique_ptr<chunk_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_chunks->push_back(std::move(std::unique_ptr<chunk_t>(new chunk_t(m__io, this, m__root))));
            i++;
        }
    }
}

dcmp_2_t::tagged_data_t::~tagged_data_t() {
    _clean_up();
}

void dcmp_2_t::tagged_data_t::_clean_up() {
}

dcmp_2_t::tagged_data_t::chunk_t::chunk_t(kaitai::kstream* p__io, dcmp_2_t::tagged_data_t* p__parent, dcmp_2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tag = nullptr;
    m_units = nullptr;
    _read();
}

void dcmp_2_t::tagged_data_t::chunk_t::_read() {
    m_tag = std::unique_ptr<std::vector<bool>>(new std::vector<bool>());
    const int l_tag = 8;
    for (int i = 0; i < l_tag; i++) {
        m_tag->push_back(std::move(m__io->read_bits_int_be(1)));
    }
    m__io->align_to_byte();
    m__raw_units = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_units = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_units = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    {
        int i = 0;
        uint8_t _;
        do {
            {
                bool on = tag()->at(i);
                if (on == true) {
                    _ = m__io->read_u1();
                    m_units->push_back(_);
                }
                else {
                    _ = m__io->read_bytes(((tag()->at(i)) ? (1) : (2)));
                    m__raw_units->push_back(_);
                }
            }
            i++;
        } while (!( ((i >= 7) || (_io()->is_eof())) ));
    }
}

dcmp_2_t::tagged_data_t::chunk_t::~chunk_t() {
    _clean_up();
}

void dcmp_2_t::tagged_data_t::chunk_t::_clean_up() {
}

dcmp_2_t::header_parameters_t* dcmp_2_t::header_parameters() {
    if (f_header_parameters)
        return m_header_parameters.get();
    kaitai::kstream *io = header_parameters_with_io()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_header_parameters = std::unique_ptr<header_parameters_t>(new header_parameters_t(io, this, m__root));
    io->seek(_pos);
    f_header_parameters = true;
    return m_header_parameters.get();
}

bool dcmp_2_t::is_len_decompressed_odd() {
    if (f_is_len_decompressed_odd)
        return m_is_len_decompressed_odd;
    m_is_len_decompressed_odd = kaitai::kstream::mod(len_decompressed(), 2) != 0;
    f_is_len_decompressed_odd = true;
    return m_is_len_decompressed_odd;
}

std::vector<std::string>* dcmp_2_t::default_lookup_table() {
    if (f_default_lookup_table)
        return m_default_lookup_table.get();
    m_default_lookup_table = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>{std::string("\x00\x00", 2), std::string("\x00\x08", 2), std::string("\x4E\xBA", 2), std::string("\x20\x6E", 2), std::string("\x4E\x75", 2), std::string("\x00\x0C", 2), std::string("\x00\x04", 2), std::string("\x70\x00", 2), std::string("\x00\x10", 2), std::string("\x00\x02", 2), std::string("\x48\x6E", 2), std::string("\xFF\xFC", 2), std::string("\x60\x00", 2), std::string("\x00\x01", 2), std::string("\x48\xE7", 2), std::string("\x2F\x2E", 2), std::string("\x4E\x56", 2), std::string("\x00\x06", 2), std::string("\x4E\x5E", 2), std::string("\x2F\x00", 2), std::string("\x61\x00", 2), std::string("\xFF\xF8", 2), std::string("\x2F\x0B", 2), std::string("\xFF\xFF", 2), std::string("\x00\x14", 2), std::string("\x00\x0A", 2), std::string("\x00\x18", 2), std::string("\x20\x5F", 2), std::string("\x00\x0E", 2), std::string("\x20\x50", 2), std::string("\x3F\x3C", 2), std::string("\xFF\xF4", 2), std::string("\x4C\xEE", 2), std::string("\x30\x2E", 2), std::string("\x67\x00", 2), std::string("\x4C\xDF", 2), std::string("\x26\x6E", 2), std::string("\x00\x12", 2), std::string("\x00\x1C", 2), std::string("\x42\x67", 2), std::string("\xFF\xF0", 2), std::string("\x30\x3C", 2), std::string("\x2F\x0C", 2), std::string("\x00\x03", 2), std::string("\x4E\xD0", 2), std::string("\x00\x20", 2), std::string("\x70\x01", 2), std::string("\x00\x16", 2), std::string("\x2D\x40", 2), std::string("\x48\xC0", 2), std::string("\x20\x78", 2), std::string("\x72\x00", 2), std::string("\x58\x8F", 2), std::string("\x66\x00", 2), std::string("\x4F\xEF", 2), std::string("\x42\xA7", 2), std::string("\x67\x06", 2), std::string("\xFF\xFA", 2), std::string("\x55\x8F", 2), std::string("\x28\x6E", 2), std::string("\x3F\x00", 2), std::string("\xFF\xFE", 2), std::string("\x2F\x3C", 2), std::string("\x67\x04", 2), std::string("\x59\x8F", 2), std::string("\x20\x6B", 2), std::string("\x00\x24", 2), std::string("\x20\x1F", 2), std::string("\x41\xFA", 2), std::string("\x81\xE1", 2), std::string("\x66\x04", 2), std::string("\x67\x08", 2), std::string("\x00\x1A", 2), std::string("\x4E\xB9", 2), std::string("\x50\x8F", 2), std::string("\x20\x2E", 2), std::string("\x00\x07", 2), std::string("\x4E\xB0", 2), std::string("\xFF\xF2", 2), std::string("\x3D\x40", 2), std::string("\x00\x1E", 2), std::string("\x20\x68", 2), std::string("\x66\x06", 2), std::string("\xFF\xF6", 2), std::string("\x4E\xF9", 2), std::string("\x08\x00", 2), std::string("\x0C\x40", 2), std::string("\x3D\x7C", 2), std::string("\xFF\xEC", 2), std::string("\x00\x05", 2), std::string("\x20\x3C", 2), std::string("\xFF\xE8", 2), std::string("\xDE\xFC", 2), std::string("\x4A\x2E", 2), std::string("\x00\x30", 2), std::string("\x00\x28", 2), std::string("\x2F\x08", 2), std::string("\x20\x0B", 2), std::string("\x60\x02", 2), std::string("\x42\x6E", 2), std::string("\x2D\x48", 2), std::string("\x20\x53", 2), std::string("\x20\x40", 2), std::string("\x18\x00", 2), std::string("\x60\x04", 2), std::string("\x41\xEE", 2), std::string("\x2F\x28", 2), std::string("\x2F\x01", 2), std::string("\x67\x0A", 2), std::string("\x48\x40", 2), std::string("\x20\x07", 2), std::string("\x66\x08", 2), std::string("\x01\x18", 2), std::string("\x2F\x07", 2), std::string("\x30\x28", 2), std::string("\x3F\x2E", 2), std::string("\x30\x2B", 2), std::string("\x22\x6E", 2), std::string("\x2F\x2B", 2), std::string("\x00\x2C", 2), std::string("\x67\x0C", 2), std::string("\x22\x5F", 2), std::string("\x60\x06", 2), std::string("\x00\xFF", 2), std::string("\x30\x07", 2), std::string("\xFF\xEE", 2), std::string("\x53\x40", 2), std::string("\x00\x40", 2), std::string("\xFF\xE4", 2), std::string("\x4A\x40", 2), std::string("\x66\x0A", 2), std::string("\x00\x0F", 2), std::string("\x4E\xAD", 2), std::string("\x70\xFF", 2), std::string("\x22\xD8", 2), std::string("\x48\x6B", 2), std::string("\x00\x22", 2), std::string("\x20\x4B", 2), std::string("\x67\x0E", 2), std::string("\x4A\xAE", 2), std::string("\x4E\x90", 2), std::string("\xFF\xE0", 2), std::string("\xFF\xC0", 2), std::string("\x00\x2A", 2), std::string("\x27\x40", 2), std::string("\x67\x02", 2), std::string("\x51\xC8", 2), std::string("\x02\xB6", 2), std::string("\x48\x7A", 2), std::string("\x22\x78", 2), std::string("\xB0\x6E", 2), std::string("\xFF\xE6", 2), std::string("\x00\x09", 2), std::string("\x32\x2E", 2), std::string("\x3E\x00", 2), std::string("\x48\x41", 2), std::string("\xFF\xEA", 2), std::string("\x43\xEE", 2), std::string("\x4E\x71", 2), std::string("\x74\x00", 2), std::string("\x2F\x2C", 2), std::string("\x20\x6C", 2), std::string("\x00\x3C", 2), std::string("\x00\x26", 2), std::string("\x00\x50", 2), std::string("\x18\x80", 2), std::string("\x30\x1F", 2), std::string("\x22\x00", 2), std::string("\x66\x0C", 2), std::string("\xFF\xDA", 2), std::string("\x00\x38", 2), std::string("\x66\x02", 2), std::string("\x30\x2C", 2), std::string("\x20\x0C", 2), std::string("\x2D\x6E", 2), std::string("\x42\x40", 2), std::string("\xFF\xE2", 2), std::string("\xA9\xF0", 2), std::string("\xFF\x00", 2), std::string("\x37\x7C", 2), std::string("\xE5\x80", 2), std::string("\xFF\xDC", 2), std::string("\x48\x68", 2), std::string("\x59\x4F", 2), std::string("\x00\x34", 2), std::string("\x3E\x1F", 2), std::string("\x60\x08", 2), std::string("\x2F\x06", 2), std::string("\xFF\xDE", 2), std::string("\x60\x0A", 2), std::string("\x70\x02", 2), std::string("\x00\x32", 2), std::string("\xFF\xCC", 2), std::string("\x00\x80", 2), std::string("\x22\x51", 2), std::string("\x10\x1F", 2), std::string("\x31\x7C", 2), std::string("\xA0\x29", 2), std::string("\xFF\xD8", 2), std::string("\x52\x40", 2), std::string("\x01\x00", 2), std::string("\x67\x10", 2), std::string("\xA0\x23", 2), std::string("\xFF\xCE", 2), std::string("\xFF\xD4", 2), std::string("\x20\x06", 2), std::string("\x48\x78", 2), std::string("\x00\x2E", 2), std::string("\x50\x4F", 2), std::string("\x43\xFA", 2), std::string("\x67\x12", 2), std::string("\x76\x00", 2), std::string("\x41\xE8", 2), std::string("\x4A\x6E", 2), std::string("\x20\xD9", 2), std::string("\x00\x5A", 2), std::string("\x7F\xFF", 2), std::string("\x51\xCA", 2), std::string("\x00\x5C", 2), std::string("\x2E\x00", 2), std::string("\x02\x40", 2), std::string("\x48\xC7", 2), std::string("\x67\x14", 2), std::string("\x0C\x80", 2), std::string("\x2E\x9F", 2), std::string("\xFF\xD6", 2), std::string("\x80\x00", 2), std::string("\x10\x00", 2), std::string("\x48\x42", 2), std::string("\x4A\x6B", 2), std::string("\xFF\xD2", 2), std::string("\x00\x48", 2), std::string("\x4A\x47", 2), std::string("\x4E\xD1", 2), std::string("\x20\x6F", 2), std::string("\x00\x41", 2), std::string("\x60\x0C", 2), std::string("\x2A\x78", 2), std::string("\x42\x2E", 2), std::string("\x32\x00", 2), std::string("\x65\x74", 2), std::string("\x67\x16", 2), std::string("\x00\x44", 2), std::string("\x48\x6D", 2), std::string("\x20\x08", 2), std::string("\x48\x6C", 2), std::string("\x0B\x7C", 2), std::string("\x26\x40", 2), std::string("\x04\x00", 2), std::string("\x00\x68", 2), std::string("\x20\x6D", 2), std::string("\x00\x0D", 2), std::string("\x2A\x40", 2), std::string("\x00\x0B", 2), std::string("\x00\x3E", 2), std::string("\x02\x20", 2)});
    f_default_lookup_table = true;
    return m_default_lookup_table.get();
}

std::vector<std::string>* dcmp_2_t::lookup_table() {
    if (f_lookup_table)
        return m_lookup_table;
    m_lookup_table = ((header_parameters()->flags()->has_custom_lookup_table()) ? (custom_lookup_table()) : (default_lookup_table()));
    f_lookup_table = true;
    return m_lookup_table;
}
