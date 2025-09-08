// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "resource_fork.h"

resource_fork_t::resource_fork_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = nullptr;
    m_data_blocks_with_io = nullptr;
    m__io__raw_data_blocks_with_io = nullptr;
    m_resource_map = nullptr;
    m__io__raw_resource_map = nullptr;
    f_data_blocks = false;
    f_data_blocks_with_io = false;
    f_resource_map = false;
    _read();
}

void resource_fork_t::_read() {
    m_header = std::unique_ptr<file_header_t>(new file_header_t(m__io, this, m__root));
    m_system_data = m__io->read_bytes(112);
    m_application_data = m__io->read_bytes(128);
}

resource_fork_t::~resource_fork_t() {
    _clean_up();
}

void resource_fork_t::_clean_up() {
    if (f_data_blocks_with_io) {
    }
    if (f_resource_map) {
    }
}

resource_fork_t::data_block_t::data_block_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void resource_fork_t::data_block_t::_read() {
    m_len_data = m__io->read_u4be();
    m_data = m__io->read_bytes(len_data());
}

resource_fork_t::data_block_t::~data_block_t() {
    _clean_up();
}

void resource_fork_t::data_block_t::_clean_up() {
}

resource_fork_t::file_header_t::file_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void resource_fork_t::file_header_t::_read() {
    m_ofs_data_blocks = m__io->read_u4be();
    m_ofs_resource_map = m__io->read_u4be();
    m_len_data_blocks = m__io->read_u4be();
    m_len_resource_map = m__io->read_u4be();
}

resource_fork_t::file_header_t::~file_header_t() {
    _clean_up();
}

void resource_fork_t::file_header_t::_clean_up() {
}

resource_fork_t::resource_map_t::resource_map_t(kaitai::kstream* p__io, resource_fork_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_reserved_file_header_copy = nullptr;
    m_file_attributes = nullptr;
    m__io__raw_file_attributes = nullptr;
    m_names_with_io = nullptr;
    m__io__raw_names_with_io = nullptr;
    m_type_list_and_reference_lists = nullptr;
    m__io__raw_type_list_and_reference_lists = nullptr;
    f_names = false;
    f_names_with_io = false;
    f_type_list_and_reference_lists = false;
    _read();
}

void resource_fork_t::resource_map_t::_read() {
    m_reserved_file_header_copy = std::unique_ptr<file_header_t>(new file_header_t(m__io, this, m__root));
    m_reserved_next_resource_map_handle = m__io->read_u4be();
    m_reserved_file_reference_number = m__io->read_u2be();
    m__raw_file_attributes = m__io->read_bytes(2);
    m__io__raw_file_attributes = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_file_attributes));
    m_file_attributes = std::unique_ptr<file_attributes_t>(new file_attributes_t(m__io__raw_file_attributes.get(), this, m__root));
    m_ofs_type_list = m__io->read_u2be();
    m_ofs_names = m__io->read_u2be();
}

resource_fork_t::resource_map_t::~resource_map_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::_clean_up() {
    if (f_names_with_io) {
    }
    if (f_type_list_and_reference_lists) {
    }
}

resource_fork_t::resource_map_t::file_attributes_t::file_attributes_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_as_int = false;
    _read();
}

void resource_fork_t::resource_map_t::file_attributes_t::_read() {
    m_resources_locked = m__io->read_bits_int_be(1);
    m_reserved0 = m__io->read_bits_int_be(6);
    m_printer_driver_multifinder_compatible = m__io->read_bits_int_be(1);
    m_no_write_changes = m__io->read_bits_int_be(1);
    m_needs_compact = m__io->read_bits_int_be(1);
    m_map_needs_write = m__io->read_bits_int_be(1);
    m_reserved1 = m__io->read_bits_int_be(5);
}

resource_fork_t::resource_map_t::file_attributes_t::~file_attributes_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::file_attributes_t::_clean_up() {
    if (f_as_int) {
    }
}

uint16_t resource_fork_t::resource_map_t::file_attributes_t::as_int() {
    if (f_as_int)
        return m_as_int;
    f_as_int = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_as_int = m__io->read_u2be();
    m__io->seek(_pos);
    return m_as_int;
}

resource_fork_t::resource_map_t::name_t::name_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void resource_fork_t::resource_map_t::name_t::_read() {
    m_len_value = m__io->read_u1();
    m_value = m__io->read_bytes(len_value());
}

resource_fork_t::resource_map_t::name_t::~name_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::name_t::_clean_up() {
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_and_reference_lists_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_type_list = nullptr;
    _read();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::_read() {
    m_type_list = std::unique_ptr<type_list_t>(new type_list_t(m__io, this, m__root));
    m_reference_lists = m__io->read_bytes_full();
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::~type_list_and_reference_lists_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::_clean_up() {
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_list_t(uint16_t p_num_references, kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_references = p_num_references;
    m_references = nullptr;
    _read();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::_read() {
    m_references = std::unique_ptr<std::vector<std::unique_ptr<reference_t>>>(new std::vector<std::unique_ptr<reference_t>>());
    const int l_references = num_references();
    for (int i = 0; i < l_references; i++) {
        m_references->push_back(std::move(std::unique_ptr<reference_t>(new reference_t(m__io, this, m__root))));
    }
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::~reference_list_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::_clean_up() {
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::reference_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_attributes = nullptr;
    m__io__raw_attributes = nullptr;
    m_data_block = nullptr;
    m_name = nullptr;
    f_data_block = false;
    f_name = false;
    _read();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::_read() {
    m_id = m__io->read_s2be();
    m_ofs_name = m__io->read_u2be();
    m__raw_attributes = m__io->read_bytes(1);
    m__io__raw_attributes = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_attributes));
    m_attributes = std::unique_ptr<attributes_t>(new attributes_t(m__io__raw_attributes.get(), this, m__root));
    m_ofs_data_block = m__io->read_bits_int_be(24);
    m__io->align_to_byte();
    m_reserved_handle = m__io->read_u4be();
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::~reference_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::_clean_up() {
    if (f_data_block) {
    }
    if (f_name && !n_name) {
    }
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::attributes_t::attributes_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_as_int = false;
    _read();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::attributes_t::_read() {
    m_system_reference = m__io->read_bits_int_be(1);
    m_load_into_system_heap = m__io->read_bits_int_be(1);
    m_purgeable = m__io->read_bits_int_be(1);
    m_locked = m__io->read_bits_int_be(1);
    m_protected = m__io->read_bits_int_be(1);
    m_preload = m__io->read_bits_int_be(1);
    m_needs_write = m__io->read_bits_int_be(1);
    m_compressed = m__io->read_bits_int_be(1);
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::attributes_t::~attributes_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::attributes_t::_clean_up() {
    if (f_as_int) {
    }
}

uint8_t resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::attributes_t::as_int() {
    if (f_as_int)
        return m_as_int;
    f_as_int = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_as_int = m__io->read_u1();
    m__io->seek(_pos);
    return m_as_int;
}

resource_fork_t::data_block_t* resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::data_block() {
    if (f_data_block)
        return m_data_block.get();
    f_data_block = true;
    kaitai::kstream *io = _root()->data_blocks_with_io()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_data_block());
    m_data_block = std::unique_ptr<data_block_t>(new data_block_t(io, this, m__root));
    io->seek(_pos);
    return m_data_block.get();
}

resource_fork_t::resource_map_t::name_t* resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t::reference_t::name() {
    if (f_name)
        return m_name.get();
    f_name = true;
    n_name = true;
    if (ofs_name() != 65535) {
        n_name = false;
        kaitai::kstream *io = _root()->resource_map()->names_with_io()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_name());
        m_name = std::unique_ptr<name_t>(new name_t(io, this, m__root));
        io->seek(_pos);
    }
    return m_name.get();
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    f_num_types = false;
    _read();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::_read() {
    m_num_types_m1 = m__io->read_u2be();
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<type_list_entry_t>>>(new std::vector<std::unique_ptr<type_list_entry_t>>());
    const int l_entries = num_types();
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(std::move(std::unique_ptr<type_list_entry_t>(new type_list_entry_t(m__io, this, m__root))));
    }
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::~type_list_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::_clean_up() {
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::type_list_entry_t(kaitai::kstream* p__io, resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t* p__parent, resource_fork_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_reference_list = nullptr;
    f_num_references = false;
    f_reference_list = false;
    _read();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::_read() {
    m_type = m__io->read_bytes(4);
    m_num_references_m1 = m__io->read_u2be();
    m_ofs_reference_list = m__io->read_u2be();
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::~type_list_entry_t() {
    _clean_up();
}

void resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::_clean_up() {
    if (f_reference_list) {
    }
}

int32_t resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::num_references() {
    if (f_num_references)
        return m_num_references;
    f_num_references = true;
    m_num_references = kaitai::kstream::mod(num_references_m1() + 1, 65536);
    return m_num_references;
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t::reference_list_t* resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::type_list_entry_t::reference_list() {
    if (f_reference_list)
        return m_reference_list.get();
    f_reference_list = true;
    kaitai::kstream *io = _parent()->_parent()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_reference_list());
    m_reference_list = std::unique_ptr<reference_list_t>(new reference_list_t(num_references(), io, this, m__root));
    io->seek(_pos);
    return m_reference_list.get();
}

int32_t resource_fork_t::resource_map_t::type_list_and_reference_lists_t::type_list_t::num_types() {
    if (f_num_types)
        return m_num_types;
    f_num_types = true;
    m_num_types = kaitai::kstream::mod(num_types_m1() + 1, 65536);
    return m_num_types;
}

std::string resource_fork_t::resource_map_t::names() {
    if (f_names)
        return m_names;
    f_names = true;
    m_names = names_with_io()->data();
    return m_names;
}

bytes_with_io_t* resource_fork_t::resource_map_t::names_with_io() {
    if (f_names_with_io)
        return m_names_with_io.get();
    f_names_with_io = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_names());
    m__raw_names_with_io = m__io->read_bytes_full();
    m__io__raw_names_with_io = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_names_with_io));
    m_names_with_io = std::unique_ptr<bytes_with_io_t>(new bytes_with_io_t(m__io__raw_names_with_io.get()));
    m__io->seek(_pos);
    return m_names_with_io.get();
}

resource_fork_t::resource_map_t::type_list_and_reference_lists_t* resource_fork_t::resource_map_t::type_list_and_reference_lists() {
    if (f_type_list_and_reference_lists)
        return m_type_list_and_reference_lists.get();
    f_type_list_and_reference_lists = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_type_list());
    m__raw_type_list_and_reference_lists = m__io->read_bytes(ofs_names() - ofs_type_list());
    m__io__raw_type_list_and_reference_lists = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_type_list_and_reference_lists));
    m_type_list_and_reference_lists = std::unique_ptr<type_list_and_reference_lists_t>(new type_list_and_reference_lists_t(m__io__raw_type_list_and_reference_lists.get(), this, m__root));
    m__io->seek(_pos);
    return m_type_list_and_reference_lists.get();
}

std::string resource_fork_t::data_blocks() {
    if (f_data_blocks)
        return m_data_blocks;
    f_data_blocks = true;
    m_data_blocks = data_blocks_with_io()->data();
    return m_data_blocks;
}

bytes_with_io_t* resource_fork_t::data_blocks_with_io() {
    if (f_data_blocks_with_io)
        return m_data_blocks_with_io.get();
    f_data_blocks_with_io = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(header()->ofs_data_blocks());
    m__raw_data_blocks_with_io = m__io->read_bytes(header()->len_data_blocks());
    m__io__raw_data_blocks_with_io = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_data_blocks_with_io));
    m_data_blocks_with_io = std::unique_ptr<bytes_with_io_t>(new bytes_with_io_t(m__io__raw_data_blocks_with_io.get()));
    m__io->seek(_pos);
    return m_data_blocks_with_io.get();
}

resource_fork_t::resource_map_t* resource_fork_t::resource_map() {
    if (f_resource_map)
        return m_resource_map.get();
    f_resource_map = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(header()->ofs_resource_map());
    m__raw_resource_map = m__io->read_bytes(header()->len_resource_map());
    m__io__raw_resource_map = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_resource_map));
    m_resource_map = std::unique_ptr<resource_map_t>(new resource_map_t(m__io__raw_resource_map.get(), this, m__root));
    m__io->seek(_pos);
    return m_resource_map.get();
}
