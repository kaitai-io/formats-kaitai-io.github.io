// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dtb.h"
#include "kaitai/exceptions.h"

dtb_t::dtb_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dtb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_memory_reservation_block = nullptr;
    m__io__raw_memory_reservation_block = nullptr;
    m_structure_block = nullptr;
    m__io__raw_structure_block = nullptr;
    m_strings_block = nullptr;
    m__io__raw_strings_block = nullptr;
    f_memory_reservation_block = false;
    f_structure_block = false;
    f_strings_block = false;
    _read();
}

void dtb_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\xD0\x0D\xFE\xED", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xD0\x0D\xFE\xED", 4), magic(), _io(), std::string("/seq/0"));
    }
    m_total_size = m__io->read_u4be();
    m_ofs_structure_block = m__io->read_u4be();
    m_ofs_strings_block = m__io->read_u4be();
    m_ofs_memory_reservation_block = m__io->read_u4be();
    m_version = m__io->read_u4be();
    m_min_compatible_version = m__io->read_u4be();
    if (!(min_compatible_version() <= version())) {
        throw kaitai::validation_greater_than_error<uint32_t>(version(), min_compatible_version(), _io(), std::string("/seq/6"));
    }
    m_boot_cpuid_phys = m__io->read_u4be();
    m_len_strings_block = m__io->read_u4be();
    m_len_structure_block = m__io->read_u4be();
}

dtb_t::~dtb_t() {
    _clean_up();
}

void dtb_t::_clean_up() {
    if (f_memory_reservation_block) {
    }
    if (f_structure_block) {
    }
    if (f_strings_block) {
    }
}

dtb_t::memory_block_t::memory_block_t(kaitai::kstream* p__io, dtb_t* p__parent, dtb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void dtb_t::memory_block_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<memory_block_entry_t>>>(new std::vector<std::unique_ptr<memory_block_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<memory_block_entry_t>(new memory_block_entry_t(m__io, this, m__root))));
            i++;
        }
    }
}

dtb_t::memory_block_t::~memory_block_t() {
    _clean_up();
}

void dtb_t::memory_block_t::_clean_up() {
}

dtb_t::fdt_block_t::fdt_block_t(kaitai::kstream* p__io, dtb_t* p__parent, dtb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_nodes = nullptr;
    _read();
}

void dtb_t::fdt_block_t::_read() {
    m_nodes = std::unique_ptr<std::vector<std::unique_ptr<fdt_node_t>>>(new std::vector<std::unique_ptr<fdt_node_t>>());
    {
        int i = 0;
        fdt_node_t* _;
        do {
            _ = new fdt_node_t(m__io, this, m__root);
            m_nodes->push_back(std::move(std::unique_ptr<fdt_node_t>(_)));
            i++;
        } while (!(_->type() == dtb_t::FDT_END));
    }
}

dtb_t::fdt_block_t::~fdt_block_t() {
    _clean_up();
}

void dtb_t::fdt_block_t::_clean_up() {
}

dtb_t::memory_block_entry_t::memory_block_entry_t(kaitai::kstream* p__io, dtb_t::memory_block_t* p__parent, dtb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dtb_t::memory_block_entry_t::_read() {
    m_address = m__io->read_u8be();
    m_size = m__io->read_u8be();
}

dtb_t::memory_block_entry_t::~memory_block_entry_t() {
    _clean_up();
}

void dtb_t::memory_block_entry_t::_clean_up() {
}

dtb_t::strings_t::strings_t(kaitai::kstream* p__io, dtb_t* p__parent, dtb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_strings = nullptr;
    _read();
}

void dtb_t::strings_t::_read() {
    m_strings = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_strings->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"))));
            i++;
        }
    }
}

dtb_t::strings_t::~strings_t() {
    _clean_up();
}

void dtb_t::strings_t::_clean_up() {
}

dtb_t::fdt_prop_t::fdt_prop_t(kaitai::kstream* p__io, dtb_t::fdt_node_t* p__parent, dtb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_name = false;
    _read();
}

void dtb_t::fdt_prop_t::_read() {
    m_len_property = m__io->read_u4be();
    m_ofs_name = m__io->read_u4be();
    m_property = m__io->read_bytes(len_property());
    m_padding = m__io->read_bytes(kaitai::kstream::mod(-(_io()->pos()), 4));
}

dtb_t::fdt_prop_t::~fdt_prop_t() {
    _clean_up();
}

void dtb_t::fdt_prop_t::_clean_up() {
    if (f_name) {
    }
}

std::string dtb_t::fdt_prop_t::name() {
    if (f_name)
        return m_name;
    kaitai::kstream *io = _root()->strings_block()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_name());
    m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    io->seek(_pos);
    f_name = true;
    return m_name;
}

dtb_t::fdt_node_t::fdt_node_t(kaitai::kstream* p__io, dtb_t::fdt_block_t* p__parent, dtb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dtb_t::fdt_node_t::_read() {
    m_type = static_cast<dtb_t::fdt_t>(m__io->read_u4be());
    n_body = true;
    switch (type()) {
    case dtb_t::FDT_BEGIN_NODE: {
        n_body = false;
        m_body = std::unique_ptr<fdt_begin_node_t>(new fdt_begin_node_t(m__io, this, m__root));
        break;
    }
    case dtb_t::FDT_PROP: {
        n_body = false;
        m_body = std::unique_ptr<fdt_prop_t>(new fdt_prop_t(m__io, this, m__root));
        break;
    }
    }
}

dtb_t::fdt_node_t::~fdt_node_t() {
    _clean_up();
}

void dtb_t::fdt_node_t::_clean_up() {
    if (!n_body) {
    }
}

dtb_t::fdt_begin_node_t::fdt_begin_node_t(kaitai::kstream* p__io, dtb_t::fdt_node_t* p__parent, dtb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dtb_t::fdt_begin_node_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    m_padding = m__io->read_bytes(kaitai::kstream::mod(-(_io()->pos()), 4));
}

dtb_t::fdt_begin_node_t::~fdt_begin_node_t() {
    _clean_up();
}

void dtb_t::fdt_begin_node_t::_clean_up() {
}

dtb_t::memory_block_t* dtb_t::memory_reservation_block() {
    if (f_memory_reservation_block)
        return m_memory_reservation_block.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_memory_reservation_block());
    m__raw_memory_reservation_block = m__io->read_bytes((ofs_structure_block() - ofs_memory_reservation_block()));
    m__io__raw_memory_reservation_block = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_memory_reservation_block));
    m_memory_reservation_block = std::unique_ptr<memory_block_t>(new memory_block_t(m__io__raw_memory_reservation_block.get(), this, m__root));
    m__io->seek(_pos);
    f_memory_reservation_block = true;
    return m_memory_reservation_block.get();
}

dtb_t::fdt_block_t* dtb_t::structure_block() {
    if (f_structure_block)
        return m_structure_block.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_structure_block());
    m__raw_structure_block = m__io->read_bytes(len_structure_block());
    m__io__raw_structure_block = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_structure_block));
    m_structure_block = std::unique_ptr<fdt_block_t>(new fdt_block_t(m__io__raw_structure_block.get(), this, m__root));
    m__io->seek(_pos);
    f_structure_block = true;
    return m_structure_block.get();
}

dtb_t::strings_t* dtb_t::strings_block() {
    if (f_strings_block)
        return m_strings_block.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_strings_block());
    m__raw_strings_block = m__io->read_bytes(len_strings_block());
    m__io__raw_strings_block = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_strings_block));
    m_strings_block = std::unique_ptr<strings_t>(new strings_t(m__io__raw_strings_block.get(), this, m__root));
    m__io->seek(_pos);
    f_strings_block = true;
    return m_strings_block.get();
}
